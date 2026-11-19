/*
 * National Stock Exchange of India Ltd Multicast Tick By Tick Data Feed
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
 *   - a Composite rule
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

/* ---- Stream Header: 8 bytes -------------------------------------------------- */

/* STREAM_HEADER */
typedef StreamHeader {
  byte message_length[2];
  byte stream_id[2];
  byte sequence_number[4]
};

int stream_header_at;

/* every byte of Stream Header set to one value */
inline fill_stream_header(stream_header_record, stream_header_value) {
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> stream_header_record.message_length[stream_header_at] = stream_header_value; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> stream_header_record.stream_id[stream_header_at] = stream_header_value; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 4 -> stream_header_record.sequence_number[stream_header_at] = stream_header_value; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stream Header set to where it lies, so a field read out of place says so */
inline ramp_stream_header(stream_header_record, stream_header_base) {
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> stream_header_record.message_length[stream_header_at] = (stream_header_base + 0 + stream_header_at + 1) % 256; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> stream_header_record.stream_id[stream_header_at] = (stream_header_base + 2 + stream_header_at + 1) % 256; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 4 -> stream_header_record.sequence_number[stream_header_at] = (stream_header_base + 4 + stream_header_at + 1) % 256; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Header to the wire, 8 bytes from where the cursor stands */
inline encode_stream_header(stream_header_record) {
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> wire[at] = stream_header_record.message_length[stream_header_at]; at = at + 1; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> wire[at] = stream_header_record.stream_id[stream_header_at]; at = at + 1; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 4 -> wire[at] = stream_header_record.sequence_number[stream_header_at]; at = at + 1; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Header off the wire, 8 bytes from where the cursor stands */
inline decode_stream_header(stream_header_record) {
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> stream_header_record.message_length[stream_header_at] = wire[at]; at = at + 1; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> stream_header_record.stream_id[stream_header_at] = wire[at]; at = at + 1; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 4 -> stream_header_record.sequence_number[stream_header_at] = wire[at]; at = at + 1; stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stream Header is what was written, byte for byte */
inline equal_stream_header(stream_header_read, stream_header_written) {
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> assert(stream_header_read.message_length[stream_header_at] == stream_header_written.message_length[stream_header_at]); stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 2 -> assert(stream_header_read.stream_id[stream_header_at] == stream_header_written.stream_id[stream_header_at]); stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  stream_header_at = 0;
  do
  :: stream_header_at < 4 -> assert(stream_header_read.sequence_number[stream_header_at] == stream_header_written.sequence_number[stream_header_at]); stream_header_at = stream_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Contract Information Message: 49 bytes ---------------------------------- */

/* Beginning of day contract master information, sent before the market opens on Stream Id no. 99, for contracts valid in the NSE IX market. */
typedef ContractInformationMessage {
  byte timestamp[8];
  byte contract_stream_id[2];
  byte token_number[4];
  byte instrument[6];
  byte symbol[10];
  byte expiry_date[4];
  byte strike_price[4];
  byte option_type[2];
  byte low_price_range[4];
  byte high_price_range[4];
  byte daily_contract_indicator
};

int contract_information_message_at;

/* every byte of Contract Information Message set to one value */
inline fill_contract_information_message(contract_information_message_record, contract_information_message_value) {
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 8 -> contract_information_message_record.timestamp[contract_information_message_at] = contract_information_message_value; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 2 -> contract_information_message_record.contract_stream_id[contract_information_message_at] = contract_information_message_value; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.token_number[contract_information_message_at] = contract_information_message_value; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 6 -> contract_information_message_record.instrument[contract_information_message_at] = contract_information_message_value; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 10 -> contract_information_message_record.symbol[contract_information_message_at] = contract_information_message_value; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.expiry_date[contract_information_message_at] = contract_information_message_value; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.strike_price[contract_information_message_at] = contract_information_message_value; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 2 -> contract_information_message_record.option_type[contract_information_message_at] = contract_information_message_value; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.low_price_range[contract_information_message_at] = contract_information_message_value; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.high_price_range[contract_information_message_at] = contract_information_message_value; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_record.daily_contract_indicator = contract_information_message_value;
  skip
}

/* each byte of Contract Information Message set to where it lies, so a field read out of place says so */
inline ramp_contract_information_message(contract_information_message_record, contract_information_message_base) {
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 8 -> contract_information_message_record.timestamp[contract_information_message_at] = (contract_information_message_base + 0 + contract_information_message_at + 1) % 256; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 2 -> contract_information_message_record.contract_stream_id[contract_information_message_at] = (contract_information_message_base + 8 + contract_information_message_at + 1) % 256; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.token_number[contract_information_message_at] = (contract_information_message_base + 10 + contract_information_message_at + 1) % 256; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 6 -> contract_information_message_record.instrument[contract_information_message_at] = (contract_information_message_base + 14 + contract_information_message_at + 1) % 256; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 10 -> contract_information_message_record.symbol[contract_information_message_at] = (contract_information_message_base + 20 + contract_information_message_at + 1) % 256; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.expiry_date[contract_information_message_at] = (contract_information_message_base + 30 + contract_information_message_at + 1) % 256; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.strike_price[contract_information_message_at] = (contract_information_message_base + 34 + contract_information_message_at + 1) % 256; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 2 -> contract_information_message_record.option_type[contract_information_message_at] = (contract_information_message_base + 38 + contract_information_message_at + 1) % 256; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.low_price_range[contract_information_message_at] = (contract_information_message_base + 40 + contract_information_message_at + 1) % 256; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.high_price_range[contract_information_message_at] = (contract_information_message_base + 44 + contract_information_message_at + 1) % 256; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_record.daily_contract_indicator = (contract_information_message_base + 48 + 1) % 256;
  skip
}

/* Contract Information Message to the wire, 49 bytes from where the cursor stands */
inline encode_contract_information_message(contract_information_message_record) {
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 8 -> wire[at] = contract_information_message_record.timestamp[contract_information_message_at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 2 -> wire[at] = contract_information_message_record.contract_stream_id[contract_information_message_at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> wire[at] = contract_information_message_record.token_number[contract_information_message_at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 6 -> wire[at] = contract_information_message_record.instrument[contract_information_message_at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 10 -> wire[at] = contract_information_message_record.symbol[contract_information_message_at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> wire[at] = contract_information_message_record.expiry_date[contract_information_message_at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> wire[at] = contract_information_message_record.strike_price[contract_information_message_at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 2 -> wire[at] = contract_information_message_record.option_type[contract_information_message_at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> wire[at] = contract_information_message_record.low_price_range[contract_information_message_at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> wire[at] = contract_information_message_record.high_price_range[contract_information_message_at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  wire[at] = contract_information_message_record.daily_contract_indicator; at = at + 1;
  skip
}

/* Contract Information Message off the wire, 49 bytes from where the cursor stands */
inline decode_contract_information_message(contract_information_message_record) {
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 8 -> contract_information_message_record.timestamp[contract_information_message_at] = wire[at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 2 -> contract_information_message_record.contract_stream_id[contract_information_message_at] = wire[at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.token_number[contract_information_message_at] = wire[at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 6 -> contract_information_message_record.instrument[contract_information_message_at] = wire[at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 10 -> contract_information_message_record.symbol[contract_information_message_at] = wire[at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.expiry_date[contract_information_message_at] = wire[at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.strike_price[contract_information_message_at] = wire[at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 2 -> contract_information_message_record.option_type[contract_information_message_at] = wire[at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.low_price_range[contract_information_message_at] = wire[at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> contract_information_message_record.high_price_range[contract_information_message_at] = wire[at]; at = at + 1; contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_record.daily_contract_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Contract Information Message is what was written, byte for byte */
inline equal_contract_information_message(contract_information_message_read, contract_information_message_written) {
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 8 -> assert(contract_information_message_read.timestamp[contract_information_message_at] == contract_information_message_written.timestamp[contract_information_message_at]); contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 2 -> assert(contract_information_message_read.contract_stream_id[contract_information_message_at] == contract_information_message_written.contract_stream_id[contract_information_message_at]); contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> assert(contract_information_message_read.token_number[contract_information_message_at] == contract_information_message_written.token_number[contract_information_message_at]); contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 6 -> assert(contract_information_message_read.instrument[contract_information_message_at] == contract_information_message_written.instrument[contract_information_message_at]); contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 10 -> assert(contract_information_message_read.symbol[contract_information_message_at] == contract_information_message_written.symbol[contract_information_message_at]); contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> assert(contract_information_message_read.expiry_date[contract_information_message_at] == contract_information_message_written.expiry_date[contract_information_message_at]); contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> assert(contract_information_message_read.strike_price[contract_information_message_at] == contract_information_message_written.strike_price[contract_information_message_at]); contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 2 -> assert(contract_information_message_read.option_type[contract_information_message_at] == contract_information_message_written.option_type[contract_information_message_at]); contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> assert(contract_information_message_read.low_price_range[contract_information_message_at] == contract_information_message_written.low_price_range[contract_information_message_at]); contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  contract_information_message_at = 0;
  do
  :: contract_information_message_at < 4 -> assert(contract_information_message_read.high_price_range[contract_information_message_at] == contract_information_message_written.high_price_range[contract_information_message_at]); contract_information_message_at = contract_information_message_at + 1
  :: else -> break
  od;
  assert(contract_information_message_read.daily_contract_indicator == contract_information_message_written.daily_contract_indicator);
  skip
}

/* ---- Spread Contract Information Message: 34 bytes --------------------------- */

/* Information about the spread contracts valid in the NSE IX market, sent on Stream Id no. 99. */
typedef SpreadContractInformationMessage {
  byte timestamp[8];
  byte contract_stream_id[2];
  byte token_1[4];
  byte token_2[4];
  byte day_low_price_diff_range[4];
  byte day_high_price_diff_range[4];
  byte operating_range_low_price_diff_range[4];
  byte operating_range_high_price_diff_range[4]
};

int spread_contract_information_message_at;

/* every byte of Spread Contract Information Message set to one value */
inline fill_spread_contract_information_message(spread_contract_information_message_record, spread_contract_information_message_value) {
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 8 -> spread_contract_information_message_record.timestamp[spread_contract_information_message_at] = spread_contract_information_message_value; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 2 -> spread_contract_information_message_record.contract_stream_id[spread_contract_information_message_at] = spread_contract_information_message_value; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.token_1[spread_contract_information_message_at] = spread_contract_information_message_value; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.token_2[spread_contract_information_message_at] = spread_contract_information_message_value; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.day_low_price_diff_range[spread_contract_information_message_at] = spread_contract_information_message_value; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.day_high_price_diff_range[spread_contract_information_message_at] = spread_contract_information_message_value; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.operating_range_low_price_diff_range[spread_contract_information_message_at] = spread_contract_information_message_value; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.operating_range_high_price_diff_range[spread_contract_information_message_at] = spread_contract_information_message_value; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Spread Contract Information Message set to where it lies, so a field read out of place says so */
inline ramp_spread_contract_information_message(spread_contract_information_message_record, spread_contract_information_message_base) {
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 8 -> spread_contract_information_message_record.timestamp[spread_contract_information_message_at] = (spread_contract_information_message_base + 0 + spread_contract_information_message_at + 1) % 256; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 2 -> spread_contract_information_message_record.contract_stream_id[spread_contract_information_message_at] = (spread_contract_information_message_base + 8 + spread_contract_information_message_at + 1) % 256; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.token_1[spread_contract_information_message_at] = (spread_contract_information_message_base + 10 + spread_contract_information_message_at + 1) % 256; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.token_2[spread_contract_information_message_at] = (spread_contract_information_message_base + 14 + spread_contract_information_message_at + 1) % 256; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.day_low_price_diff_range[spread_contract_information_message_at] = (spread_contract_information_message_base + 18 + spread_contract_information_message_at + 1) % 256; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.day_high_price_diff_range[spread_contract_information_message_at] = (spread_contract_information_message_base + 22 + spread_contract_information_message_at + 1) % 256; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.operating_range_low_price_diff_range[spread_contract_information_message_at] = (spread_contract_information_message_base + 26 + spread_contract_information_message_at + 1) % 256; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.operating_range_high_price_diff_range[spread_contract_information_message_at] = (spread_contract_information_message_base + 30 + spread_contract_information_message_at + 1) % 256; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spread Contract Information Message to the wire, 34 bytes from where the cursor stands */
inline encode_spread_contract_information_message(spread_contract_information_message_record) {
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 8 -> wire[at] = spread_contract_information_message_record.timestamp[spread_contract_information_message_at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 2 -> wire[at] = spread_contract_information_message_record.contract_stream_id[spread_contract_information_message_at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> wire[at] = spread_contract_information_message_record.token_1[spread_contract_information_message_at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> wire[at] = spread_contract_information_message_record.token_2[spread_contract_information_message_at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> wire[at] = spread_contract_information_message_record.day_low_price_diff_range[spread_contract_information_message_at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> wire[at] = spread_contract_information_message_record.day_high_price_diff_range[spread_contract_information_message_at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> wire[at] = spread_contract_information_message_record.operating_range_low_price_diff_range[spread_contract_information_message_at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> wire[at] = spread_contract_information_message_record.operating_range_high_price_diff_range[spread_contract_information_message_at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spread Contract Information Message off the wire, 34 bytes from where the cursor stands */
inline decode_spread_contract_information_message(spread_contract_information_message_record) {
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 8 -> spread_contract_information_message_record.timestamp[spread_contract_information_message_at] = wire[at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 2 -> spread_contract_information_message_record.contract_stream_id[spread_contract_information_message_at] = wire[at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.token_1[spread_contract_information_message_at] = wire[at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.token_2[spread_contract_information_message_at] = wire[at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.day_low_price_diff_range[spread_contract_information_message_at] = wire[at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.day_high_price_diff_range[spread_contract_information_message_at] = wire[at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.operating_range_low_price_diff_range[spread_contract_information_message_at] = wire[at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> spread_contract_information_message_record.operating_range_high_price_diff_range[spread_contract_information_message_at] = wire[at]; at = at + 1; spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Spread Contract Information Message is what was written, byte for byte */
inline equal_spread_contract_information_message(spread_contract_information_message_read, spread_contract_information_message_written) {
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 8 -> assert(spread_contract_information_message_read.timestamp[spread_contract_information_message_at] == spread_contract_information_message_written.timestamp[spread_contract_information_message_at]); spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 2 -> assert(spread_contract_information_message_read.contract_stream_id[spread_contract_information_message_at] == spread_contract_information_message_written.contract_stream_id[spread_contract_information_message_at]); spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> assert(spread_contract_information_message_read.token_1[spread_contract_information_message_at] == spread_contract_information_message_written.token_1[spread_contract_information_message_at]); spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> assert(spread_contract_information_message_read.token_2[spread_contract_information_message_at] == spread_contract_information_message_written.token_2[spread_contract_information_message_at]); spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> assert(spread_contract_information_message_read.day_low_price_diff_range[spread_contract_information_message_at] == spread_contract_information_message_written.day_low_price_diff_range[spread_contract_information_message_at]); spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> assert(spread_contract_information_message_read.day_high_price_diff_range[spread_contract_information_message_at] == spread_contract_information_message_written.day_high_price_diff_range[spread_contract_information_message_at]); spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> assert(spread_contract_information_message_read.operating_range_low_price_diff_range[spread_contract_information_message_at] == spread_contract_information_message_written.operating_range_low_price_diff_range[spread_contract_information_message_at]); spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  spread_contract_information_message_at = 0;
  do
  :: spread_contract_information_message_at < 4 -> assert(spread_contract_information_message_read.operating_range_high_price_diff_range[spread_contract_information_message_at] == spread_contract_information_message_written.operating_range_high_price_diff_range[spread_contract_information_message_at]); spread_contract_information_message_at = spread_contract_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Status Message: 18 bytes ----------------------------------------- */

/* Sent whenever the status of the market is changed to pre-open, pre-open end, open, closed, pre-close or pre-close end, for both T and T+1 sessions. */
typedef MarketStatusMessage {
  byte timestamp[8];
  byte instrument[6];
  byte status[2];
  byte session_indicator[2]
};

int market_status_message_at;

/* every byte of Market Status Message set to one value */
inline fill_market_status_message(market_status_message_record, market_status_message_value) {
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> market_status_message_record.timestamp[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> market_status_message_record.instrument[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.status[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.session_indicator[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Status Message set to where it lies, so a field read out of place says so */
inline ramp_market_status_message(market_status_message_record, market_status_message_base) {
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> market_status_message_record.timestamp[market_status_message_at] = (market_status_message_base + 0 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> market_status_message_record.instrument[market_status_message_at] = (market_status_message_base + 8 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.status[market_status_message_at] = (market_status_message_base + 14 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.session_indicator[market_status_message_at] = (market_status_message_base + 16 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Status Message to the wire, 18 bytes from where the cursor stands */
inline encode_market_status_message(market_status_message_record) {
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> wire[at] = market_status_message_record.timestamp[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> wire[at] = market_status_message_record.instrument[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> wire[at] = market_status_message_record.status[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> wire[at] = market_status_message_record.session_indicator[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Status Message off the wire, 18 bytes from where the cursor stands */
inline decode_market_status_message(market_status_message_record) {
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> market_status_message_record.timestamp[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> market_status_message_record.instrument[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.status[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.session_indicator[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Status Message is what was written, byte for byte */
inline equal_market_status_message(market_status_message_read, market_status_message_written) {
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> assert(market_status_message_read.timestamp[market_status_message_at] == market_status_message_written.timestamp[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> assert(market_status_message_read.instrument[market_status_message_at] == market_status_message_written.instrument[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> assert(market_status_message_read.status[market_status_message_at] == market_status_message_written.status[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> assert(market_status_message_read.session_indicator[market_status_message_at] == market_status_message_written.session_indicator[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indicative Price And Quantity Message: 21 bytes ------------------------- */

/* Indicative equilibrium price and quantity, sent for contracts with pre-open and pre-close sessions, only between the pre-open or pre-close and the pre-open end or pre-close end statuses, when the indicative price and quantity are determined or updated during order collection. */
typedef IndicativePriceAndQuantityMessage {
  byte timestamp[8];
  byte token[4];
  byte identifier;
  byte indicative_price[4];
  byte indicative_quantity[4]
};

int indicative_price_and_quantity_message_at;

/* every byte of Indicative Price And Quantity Message set to one value */
inline fill_indicative_price_and_quantity_message(indicative_price_and_quantity_message_record, indicative_price_and_quantity_message_value) {
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 8 -> indicative_price_and_quantity_message_record.timestamp[indicative_price_and_quantity_message_at] = indicative_price_and_quantity_message_value; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> indicative_price_and_quantity_message_record.token[indicative_price_and_quantity_message_at] = indicative_price_and_quantity_message_value; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_and_quantity_message_record.identifier = indicative_price_and_quantity_message_value;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> indicative_price_and_quantity_message_record.indicative_price[indicative_price_and_quantity_message_at] = indicative_price_and_quantity_message_value; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> indicative_price_and_quantity_message_record.indicative_quantity[indicative_price_and_quantity_message_at] = indicative_price_and_quantity_message_value; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indicative Price And Quantity Message set to where it lies, so a field read out of place says so */
inline ramp_indicative_price_and_quantity_message(indicative_price_and_quantity_message_record, indicative_price_and_quantity_message_base) {
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 8 -> indicative_price_and_quantity_message_record.timestamp[indicative_price_and_quantity_message_at] = (indicative_price_and_quantity_message_base + 0 + indicative_price_and_quantity_message_at + 1) % 256; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> indicative_price_and_quantity_message_record.token[indicative_price_and_quantity_message_at] = (indicative_price_and_quantity_message_base + 8 + indicative_price_and_quantity_message_at + 1) % 256; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_and_quantity_message_record.identifier = (indicative_price_and_quantity_message_base + 12 + 1) % 256;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> indicative_price_and_quantity_message_record.indicative_price[indicative_price_and_quantity_message_at] = (indicative_price_and_quantity_message_base + 13 + indicative_price_and_quantity_message_at + 1) % 256; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> indicative_price_and_quantity_message_record.indicative_quantity[indicative_price_and_quantity_message_at] = (indicative_price_and_quantity_message_base + 17 + indicative_price_and_quantity_message_at + 1) % 256; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Price And Quantity Message to the wire, 21 bytes from where the cursor stands */
inline encode_indicative_price_and_quantity_message(indicative_price_and_quantity_message_record) {
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 8 -> wire[at] = indicative_price_and_quantity_message_record.timestamp[indicative_price_and_quantity_message_at]; at = at + 1; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> wire[at] = indicative_price_and_quantity_message_record.token[indicative_price_and_quantity_message_at]; at = at + 1; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  wire[at] = indicative_price_and_quantity_message_record.identifier; at = at + 1;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> wire[at] = indicative_price_and_quantity_message_record.indicative_price[indicative_price_and_quantity_message_at]; at = at + 1; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> wire[at] = indicative_price_and_quantity_message_record.indicative_quantity[indicative_price_and_quantity_message_at]; at = at + 1; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Price And Quantity Message off the wire, 21 bytes from where the cursor stands */
inline decode_indicative_price_and_quantity_message(indicative_price_and_quantity_message_record) {
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 8 -> indicative_price_and_quantity_message_record.timestamp[indicative_price_and_quantity_message_at] = wire[at]; at = at + 1; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> indicative_price_and_quantity_message_record.token[indicative_price_and_quantity_message_at] = wire[at]; at = at + 1; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_and_quantity_message_record.identifier = wire[at]; at = at + 1;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> indicative_price_and_quantity_message_record.indicative_price[indicative_price_and_quantity_message_at] = wire[at]; at = at + 1; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> indicative_price_and_quantity_message_record.indicative_quantity[indicative_price_and_quantity_message_at] = wire[at]; at = at + 1; indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indicative Price And Quantity Message is what was written, byte for byte */
inline equal_indicative_price_and_quantity_message(indicative_price_and_quantity_message_read, indicative_price_and_quantity_message_written) {
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 8 -> assert(indicative_price_and_quantity_message_read.timestamp[indicative_price_and_quantity_message_at] == indicative_price_and_quantity_message_written.timestamp[indicative_price_and_quantity_message_at]); indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> assert(indicative_price_and_quantity_message_read.token[indicative_price_and_quantity_message_at] == indicative_price_and_quantity_message_written.token[indicative_price_and_quantity_message_at]); indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  assert(indicative_price_and_quantity_message_read.identifier == indicative_price_and_quantity_message_written.identifier);
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> assert(indicative_price_and_quantity_message_read.indicative_price[indicative_price_and_quantity_message_at] == indicative_price_and_quantity_message_written.indicative_price[indicative_price_and_quantity_message_at]); indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_and_quantity_message_at = 0;
  do
  :: indicative_price_and_quantity_message_at < 4 -> assert(indicative_price_and_quantity_message_read.indicative_quantity[indicative_price_and_quantity_message_at] == indicative_price_and_quantity_message_written.indicative_quantity[indicative_price_and_quantity_message_at]); indicative_price_and_quantity_message_at = indicative_price_and_quantity_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Open Interest Message: 16 bytes ----------------------------------------- */

/* Open interest of the contracts traded, sent during trading hours on Stream Id no. 99. */
typedef OpenInterestMessage {
  byte timestamp[8];
  byte token[4];
  byte open_interest[4]
};

int open_interest_message_at;

/* every byte of Open Interest Message set to one value */
inline fill_open_interest_message(open_interest_message_record, open_interest_message_value) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.timestamp[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.token[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_open_interest_message(open_interest_message_record, open_interest_message_base) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.timestamp[open_interest_message_at] = (open_interest_message_base + 0 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.token[open_interest_message_at] = (open_interest_message_base + 8 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = (open_interest_message_base + 12 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message to the wire, 16 bytes from where the cursor stands */
inline encode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> wire[at] = open_interest_message_record.timestamp[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.token[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.open_interest[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message off the wire, 16 bytes from where the cursor stands */
inline decode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.timestamp[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.token[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open Interest Message is what was written, byte for byte */
inline equal_open_interest_message(open_interest_message_read, open_interest_message_written) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> assert(open_interest_message_read.timestamp[open_interest_message_at] == open_interest_message_written.timestamp[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.token[open_interest_message_at] == open_interest_message_written.token[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.open_interest[open_interest_message_at] == open_interest_message_written.open_interest[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Heartbeat Message: 4 bytes ---------------------------------------------- */

/* Sent when there is no data available for a few seconds. The sequence number field in the Stream Header will have the value 0 (zero) for this message. */
typedef HeartbeatMessage {
  byte last_sequence_no[4]
};

int heartbeat_message_at;

/* every byte of Heartbeat Message set to one value */
inline fill_heartbeat_message(heartbeat_message_record, heartbeat_message_value) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.last_sequence_no[heartbeat_message_at] = heartbeat_message_value; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Message set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_message(heartbeat_message_record, heartbeat_message_base) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.last_sequence_no[heartbeat_message_at] = (heartbeat_message_base + 0 + heartbeat_message_at + 1) % 256; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message to the wire, 4 bytes from where the cursor stands */
inline encode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> wire[at] = heartbeat_message_record.last_sequence_no[heartbeat_message_at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message off the wire, 4 bytes from where the cursor stands */
inline decode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.last_sequence_no[heartbeat_message_at] = wire[at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Message is what was written, byte for byte */
inline equal_heartbeat_message(heartbeat_message_read, heartbeat_message_written) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> assert(heartbeat_message_read.last_sequence_no[heartbeat_message_at] == heartbeat_message_written.last_sequence_no[heartbeat_message_at]); heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Stream Header: encoded, read back, and compared */
proctype check_stream_header() {
  StreamHeader stream_header_sent;
  StreamHeader stream_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stream_header(stream_header_sent, 0)
  :: pattern == 1 -> fill_stream_header(stream_header_sent, 32)
  :: pattern == 2 -> fill_stream_header(stream_header_sent, 255)
  :: else -> ramp_stream_header(stream_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stream_header(stream_header_sent);
    assert(at == 8);
    at = 0;
    decode_stream_header(stream_header_got);
    assert(at == 8);
    equal_stream_header(stream_header_got, stream_header_sent)
  }
}

/* Contract Information Message: encoded, read back, and compared */
proctype check_contract_information_message() {
  ContractInformationMessage contract_information_message_sent;
  ContractInformationMessage contract_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contract_information_message(contract_information_message_sent, 0)
  :: pattern == 1 -> fill_contract_information_message(contract_information_message_sent, 32)
  :: pattern == 2 -> fill_contract_information_message(contract_information_message_sent, 255)
  :: else -> ramp_contract_information_message(contract_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contract_information_message(contract_information_message_sent);
    assert(at == 49);
    at = 0;
    decode_contract_information_message(contract_information_message_got);
    assert(at == 49);
    equal_contract_information_message(contract_information_message_got, contract_information_message_sent)
  }
}

/* Spread Contract Information Message: encoded, read back, and compared */
proctype check_spread_contract_information_message() {
  SpreadContractInformationMessage spread_contract_information_message_sent;
  SpreadContractInformationMessage spread_contract_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spread_contract_information_message(spread_contract_information_message_sent, 0)
  :: pattern == 1 -> fill_spread_contract_information_message(spread_contract_information_message_sent, 32)
  :: pattern == 2 -> fill_spread_contract_information_message(spread_contract_information_message_sent, 255)
  :: else -> ramp_spread_contract_information_message(spread_contract_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spread_contract_information_message(spread_contract_information_message_sent);
    assert(at == 34);
    at = 0;
    decode_spread_contract_information_message(spread_contract_information_message_got);
    assert(at == 34);
    equal_spread_contract_information_message(spread_contract_information_message_got, spread_contract_information_message_sent)
  }
}

/* Market Status Message: encoded, read back, and compared */
proctype check_market_status_message() {
  MarketStatusMessage market_status_message_sent;
  MarketStatusMessage market_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_status_message(market_status_message_sent, 0)
  :: pattern == 1 -> fill_market_status_message(market_status_message_sent, 32)
  :: pattern == 2 -> fill_market_status_message(market_status_message_sent, 255)
  :: else -> ramp_market_status_message(market_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_status_message(market_status_message_sent);
    assert(at == 18);
    at = 0;
    decode_market_status_message(market_status_message_got);
    assert(at == 18);
    equal_market_status_message(market_status_message_got, market_status_message_sent)
  }
}

/* Indicative Price And Quantity Message: encoded, read back, and compared */
proctype check_indicative_price_and_quantity_message() {
  IndicativePriceAndQuantityMessage indicative_price_and_quantity_message_sent;
  IndicativePriceAndQuantityMessage indicative_price_and_quantity_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indicative_price_and_quantity_message(indicative_price_and_quantity_message_sent, 0)
  :: pattern == 1 -> fill_indicative_price_and_quantity_message(indicative_price_and_quantity_message_sent, 32)
  :: pattern == 2 -> fill_indicative_price_and_quantity_message(indicative_price_and_quantity_message_sent, 255)
  :: else -> ramp_indicative_price_and_quantity_message(indicative_price_and_quantity_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indicative_price_and_quantity_message(indicative_price_and_quantity_message_sent);
    assert(at == 21);
    at = 0;
    decode_indicative_price_and_quantity_message(indicative_price_and_quantity_message_got);
    assert(at == 21);
    equal_indicative_price_and_quantity_message(indicative_price_and_quantity_message_got, indicative_price_and_quantity_message_sent)
  }
}

/* Open Interest Message: encoded, read back, and compared */
proctype check_open_interest_message() {
  OpenInterestMessage open_interest_message_sent;
  OpenInterestMessage open_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_interest_message(open_interest_message_sent, 0)
  :: pattern == 1 -> fill_open_interest_message(open_interest_message_sent, 32)
  :: pattern == 2 -> fill_open_interest_message(open_interest_message_sent, 255)
  :: else -> ramp_open_interest_message(open_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_interest_message(open_interest_message_sent);
    assert(at == 16);
    at = 0;
    decode_open_interest_message(open_interest_message_got);
    assert(at == 16);
    equal_open_interest_message(open_interest_message_got, open_interest_message_sent)
  }
}

/* Heartbeat Message: encoded, read back, and compared */
proctype check_heartbeat_message() {
  HeartbeatMessage heartbeat_message_sent;
  HeartbeatMessage heartbeat_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_heartbeat_message(heartbeat_message_sent, 0)
  :: pattern == 1 -> fill_heartbeat_message(heartbeat_message_sent, 32)
  :: pattern == 2 -> fill_heartbeat_message(heartbeat_message_sent, 255)
  :: else -> ramp_heartbeat_message(heartbeat_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_heartbeat_message(heartbeat_message_sent);
    assert(at == 4);
    at = 0;
    decode_heartbeat_message(heartbeat_message_got);
    assert(at == 4);
    equal_heartbeat_message(heartbeat_message_got, heartbeat_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_stream_header()
  :: run check_contract_information_message()
  :: run check_spread_contract_information_message()
  :: run check_market_status_message()
  :: run check_indicative_price_and_quantity_message()
  :: run check_open_interest_message()
  :: run check_heartbeat_message()
  fi
}
