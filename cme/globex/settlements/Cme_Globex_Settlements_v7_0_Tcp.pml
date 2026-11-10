/*
 * CME Group Settlements
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
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 14

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Technical Header: 14 bytes ---------------------------------------------- */

/* Cme Technical Header */
typedef TechnicalHeader {
  byte encoding_type[2];
  byte message_sequence_number[4];
  byte tcp_sending_time[8]
};

int technical_header_at;

/* every byte of Technical Header set to one value */
inline fill_technical_header(technical_header_record, technical_header_value) {
  technical_header_at = 0;
  do
  :: technical_header_at < 2 -> technical_header_record.encoding_type[technical_header_at] = technical_header_value; technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  technical_header_at = 0;
  do
  :: technical_header_at < 4 -> technical_header_record.message_sequence_number[technical_header_at] = technical_header_value; technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  technical_header_at = 0;
  do
  :: technical_header_at < 8 -> technical_header_record.tcp_sending_time[technical_header_at] = technical_header_value; technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Technical Header set to where it lies, so a field read out of place says so */
inline ramp_technical_header(technical_header_record, technical_header_base) {
  technical_header_at = 0;
  do
  :: technical_header_at < 2 -> technical_header_record.encoding_type[technical_header_at] = (technical_header_base + 0 + technical_header_at + 1) % 256; technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  technical_header_at = 0;
  do
  :: technical_header_at < 4 -> technical_header_record.message_sequence_number[technical_header_at] = (technical_header_base + 2 + technical_header_at + 1) % 256; technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  technical_header_at = 0;
  do
  :: technical_header_at < 8 -> technical_header_record.tcp_sending_time[technical_header_at] = (technical_header_base + 6 + technical_header_at + 1) % 256; technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* Technical Header to the wire, 14 bytes from where the cursor stands */
inline encode_technical_header(technical_header_record) {
  technical_header_at = 0;
  do
  :: technical_header_at < 2 -> wire[at] = technical_header_record.encoding_type[technical_header_at]; at = at + 1; technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  technical_header_at = 0;
  do
  :: technical_header_at < 4 -> wire[at] = technical_header_record.message_sequence_number[technical_header_at]; at = at + 1; technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  technical_header_at = 0;
  do
  :: technical_header_at < 8 -> wire[at] = technical_header_record.tcp_sending_time[technical_header_at]; at = at + 1; technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* Technical Header off the wire, 14 bytes from where the cursor stands */
inline decode_technical_header(technical_header_record) {
  technical_header_at = 0;
  do
  :: technical_header_at < 2 -> technical_header_record.encoding_type[technical_header_at] = wire[at]; at = at + 1; technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  technical_header_at = 0;
  do
  :: technical_header_at < 4 -> technical_header_record.message_sequence_number[technical_header_at] = wire[at]; at = at + 1; technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  technical_header_at = 0;
  do
  :: technical_header_at < 8 -> technical_header_record.tcp_sending_time[technical_header_at] = wire[at]; at = at + 1; technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Technical Header is what was written, byte for byte */
inline equal_technical_header(technical_header_read, technical_header_written) {
  technical_header_at = 0;
  do
  :: technical_header_at < 2 -> assert(technical_header_read.encoding_type[technical_header_at] == technical_header_written.encoding_type[technical_header_at]); technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  technical_header_at = 0;
  do
  :: technical_header_at < 4 -> assert(technical_header_read.message_sequence_number[technical_header_at] == technical_header_written.message_sequence_number[technical_header_at]); technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  technical_header_at = 0;
  do
  :: technical_header_at < 8 -> assert(technical_header_read.tcp_sending_time[technical_header_at] == technical_header_written.tcp_sending_time[technical_header_at]); technical_header_at = technical_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Binary Header: 8 bytes ------------------------------------------- */

/* Template ID and length of message root */
typedef SimpleBinaryHeader {
  byte block_length[2];
  byte template_id[2];
  byte schema_id[2];
  byte version[2]
};

int simple_binary_header_at;

/* every byte of Simple Binary Header set to one value */
inline fill_simple_binary_header(simple_binary_header_record, simple_binary_header_value) {
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.block_length[simple_binary_header_at] = simple_binary_header_value; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.template_id[simple_binary_header_at] = simple_binary_header_value; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.schema_id[simple_binary_header_at] = simple_binary_header_value; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.version[simple_binary_header_at] = simple_binary_header_value; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Binary Header set to where it lies, so a field read out of place says so */
inline ramp_simple_binary_header(simple_binary_header_record, simple_binary_header_base) {
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.block_length[simple_binary_header_at] = (simple_binary_header_base + 0 + simple_binary_header_at + 1) % 256; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.template_id[simple_binary_header_at] = (simple_binary_header_base + 2 + simple_binary_header_at + 1) % 256; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.schema_id[simple_binary_header_at] = (simple_binary_header_base + 4 + simple_binary_header_at + 1) % 256; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.version[simple_binary_header_at] = (simple_binary_header_base + 6 + simple_binary_header_at + 1) % 256; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Binary Header to the wire, 8 bytes from where the cursor stands */
inline encode_simple_binary_header(simple_binary_header_record) {
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> wire[at] = simple_binary_header_record.block_length[simple_binary_header_at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> wire[at] = simple_binary_header_record.template_id[simple_binary_header_at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> wire[at] = simple_binary_header_record.schema_id[simple_binary_header_at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> wire[at] = simple_binary_header_record.version[simple_binary_header_at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Binary Header off the wire, 8 bytes from where the cursor stands */
inline decode_simple_binary_header(simple_binary_header_record) {
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.block_length[simple_binary_header_at] = wire[at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.template_id[simple_binary_header_at] = wire[at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.schema_id[simple_binary_header_at] = wire[at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> simple_binary_header_record.version[simple_binary_header_at] = wire[at]; at = at + 1; simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Binary Header is what was written, byte for byte */
inline equal_simple_binary_header(simple_binary_header_read, simple_binary_header_written) {
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> assert(simple_binary_header_read.block_length[simple_binary_header_at] == simple_binary_header_written.block_length[simple_binary_header_at]); simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> assert(simple_binary_header_read.template_id[simple_binary_header_at] == simple_binary_header_written.template_id[simple_binary_header_at]); simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> assert(simple_binary_header_read.schema_id[simple_binary_header_at] == simple_binary_header_written.schema_id[simple_binary_header_at]); simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  simple_binary_header_at = 0;
  do
  :: simple_binary_header_at < 2 -> assert(simple_binary_header_read.version[simple_binary_header_at] == simple_binary_header_written.version[simple_binary_header_at]); simple_binary_header_at = simple_binary_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 10 bytes ------------------------------------------------ */

/* Message Size followed by the Simple Binary Header */
typedef MessageHeader {
  byte message_size[2];
  SimpleBinaryHeader simple_binary_header
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  fill_simple_binary_header(message_header_record.simple_binary_header, message_header_value);
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  ramp_simple_binary_header(message_header_record.simple_binary_header, message_header_base + 2);
  skip
}

/* Message Header to the wire, 10 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_size[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  encode_simple_binary_header(message_header_record.simple_binary_header);
  skip
}

/* Message Header off the wire, 10 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  decode_simple_binary_header(message_header_record.simple_binary_header);
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_size[message_header_at] == message_header_written.message_size[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  equal_simple_binary_header(message_header_read.simple_binary_header, message_header_written.simple_binary_header);
  skip
}

/* ---- Group Size: 3 bytes ----------------------------------------------------- */

/* Repeating group dimensions */
typedef GroupSize {
  byte block_length[2];
  byte num_in_group
};

int group_size_at;

/* every byte of Group Size set to one value */
inline fill_group_size(group_size_record, group_size_value) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = group_size_value; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group = group_size_value;
  skip
}

/* each byte of Group Size set to where it lies, so a field read out of place says so */
inline ramp_group_size(group_size_record, group_size_base) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = (group_size_base + 0 + group_size_at + 1) % 256; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group = (group_size_base + 2 + 1) % 256;
  skip
}

/* Group Size to the wire, 3 bytes from where the cursor stands */
inline encode_group_size(group_size_record) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> wire[at] = group_size_record.block_length[group_size_at]; at = at + 1; group_size_at = group_size_at + 1
  :: else -> break
  od;
  wire[at] = group_size_record.num_in_group; at = at + 1;
  skip
}

/* Group Size off the wire, 3 bytes from where the cursor stands */
inline decode_group_size(group_size_record) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = wire[at]; at = at + 1; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Group Size is what was written, byte for byte */
inline equal_group_size(group_size_read, group_size_written) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> assert(group_size_read.block_length[group_size_at] == group_size_written.block_length[group_size_at]); group_size_at = group_size_at + 1
  :: else -> break
  od;
  assert(group_size_read.num_in_group == group_size_written.num_in_group);
  skip
}

/* ---- Maturity Month Year: 5 bytes -------------------------------------------- */

/* Number of data blocks */
typedef MaturityMonthYear {
  byte year[2];
  byte month;
  byte day;
  byte week
};

int maturity_month_year_at;

/* every byte of Maturity Month Year set to one value */
inline fill_maturity_month_year(maturity_month_year_record, maturity_month_year_value) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> maturity_month_year_record.year[maturity_month_year_at] = maturity_month_year_value; maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  maturity_month_year_record.month = maturity_month_year_value;
  maturity_month_year_record.day = maturity_month_year_value;
  maturity_month_year_record.week = maturity_month_year_value;
  skip
}

/* each byte of Maturity Month Year set to where it lies, so a field read out of place says so */
inline ramp_maturity_month_year(maturity_month_year_record, maturity_month_year_base) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> maturity_month_year_record.year[maturity_month_year_at] = (maturity_month_year_base + 0 + maturity_month_year_at + 1) % 256; maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  maturity_month_year_record.month = (maturity_month_year_base + 2 + 1) % 256;
  maturity_month_year_record.day = (maturity_month_year_base + 3 + 1) % 256;
  maturity_month_year_record.week = (maturity_month_year_base + 4 + 1) % 256;
  skip
}

/* Maturity Month Year to the wire, 5 bytes from where the cursor stands */
inline encode_maturity_month_year(maturity_month_year_record) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> wire[at] = maturity_month_year_record.year[maturity_month_year_at]; at = at + 1; maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  wire[at] = maturity_month_year_record.month; at = at + 1;
  wire[at] = maturity_month_year_record.day; at = at + 1;
  wire[at] = maturity_month_year_record.week; at = at + 1;
  skip
}

/* Maturity Month Year off the wire, 5 bytes from where the cursor stands */
inline decode_maturity_month_year(maturity_month_year_record) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> maturity_month_year_record.year[maturity_month_year_at] = wire[at]; at = at + 1; maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  maturity_month_year_record.month = wire[at]; at = at + 1;
  maturity_month_year_record.day = wire[at]; at = at + 1;
  maturity_month_year_record.week = wire[at]; at = at + 1;
  skip
}

/* what was read of Maturity Month Year is what was written, byte for byte */
inline equal_maturity_month_year(maturity_month_year_read, maturity_month_year_written) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> assert(maturity_month_year_read.year[maturity_month_year_at] == maturity_month_year_written.year[maturity_month_year_at]); maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  assert(maturity_month_year_read.month == maturity_month_year_written.month);
  assert(maturity_month_year_read.day == maturity_month_year_written.day);
  assert(maturity_month_year_read.week == maturity_month_year_written.week);
  skip
}

/* ---- Strike Price: 9 bytes --------------------------------------------------- */

/* Number of data blocks */
typedef StrikePrice {
  byte mantissa[8];
  byte exponent
};

int strike_price_at;

/* every byte of Strike Price set to one value */
inline fill_strike_price(strike_price_record, strike_price_value) {
  strike_price_at = 0;
  do
  :: strike_price_at < 8 -> strike_price_record.mantissa[strike_price_at] = strike_price_value; strike_price_at = strike_price_at + 1
  :: else -> break
  od;
  strike_price_record.exponent = strike_price_value;
  skip
}

/* each byte of Strike Price set to where it lies, so a field read out of place says so */
inline ramp_strike_price(strike_price_record, strike_price_base) {
  strike_price_at = 0;
  do
  :: strike_price_at < 8 -> strike_price_record.mantissa[strike_price_at] = (strike_price_base + 0 + strike_price_at + 1) % 256; strike_price_at = strike_price_at + 1
  :: else -> break
  od;
  strike_price_record.exponent = (strike_price_base + 8 + 1) % 256;
  skip
}

/* Strike Price to the wire, 9 bytes from where the cursor stands */
inline encode_strike_price(strike_price_record) {
  strike_price_at = 0;
  do
  :: strike_price_at < 8 -> wire[at] = strike_price_record.mantissa[strike_price_at]; at = at + 1; strike_price_at = strike_price_at + 1
  :: else -> break
  od;
  wire[at] = strike_price_record.exponent; at = at + 1;
  skip
}

/* Strike Price off the wire, 9 bytes from where the cursor stands */
inline decode_strike_price(strike_price_record) {
  strike_price_at = 0;
  do
  :: strike_price_at < 8 -> strike_price_record.mantissa[strike_price_at] = wire[at]; at = at + 1; strike_price_at = strike_price_at + 1
  :: else -> break
  od;
  strike_price_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Strike Price is what was written, byte for byte */
inline equal_strike_price(strike_price_read, strike_price_written) {
  strike_price_at = 0;
  do
  :: strike_price_at < 8 -> assert(strike_price_read.mantissa[strike_price_at] == strike_price_written.mantissa[strike_price_at]); strike_price_at = strike_price_at + 1
  :: else -> break
  od;
  assert(strike_price_read.exponent == strike_price_written.exponent);
  skip
}

/* ---- Underlying Maturity Month Year: 5 bytes --------------------------------- */

/* Number of data blocks */
typedef UnderlyingMaturityMonthYear {
  byte year[2];
  byte month;
  byte day;
  byte week
};

int underlying_maturity_month_year_at;

/* every byte of Underlying Maturity Month Year set to one value */
inline fill_underlying_maturity_month_year(underlying_maturity_month_year_record, underlying_maturity_month_year_value) {
  underlying_maturity_month_year_at = 0;
  do
  :: underlying_maturity_month_year_at < 2 -> underlying_maturity_month_year_record.year[underlying_maturity_month_year_at] = underlying_maturity_month_year_value; underlying_maturity_month_year_at = underlying_maturity_month_year_at + 1
  :: else -> break
  od;
  underlying_maturity_month_year_record.month = underlying_maturity_month_year_value;
  underlying_maturity_month_year_record.day = underlying_maturity_month_year_value;
  underlying_maturity_month_year_record.week = underlying_maturity_month_year_value;
  skip
}

/* each byte of Underlying Maturity Month Year set to where it lies, so a field read out of place says so */
inline ramp_underlying_maturity_month_year(underlying_maturity_month_year_record, underlying_maturity_month_year_base) {
  underlying_maturity_month_year_at = 0;
  do
  :: underlying_maturity_month_year_at < 2 -> underlying_maturity_month_year_record.year[underlying_maturity_month_year_at] = (underlying_maturity_month_year_base + 0 + underlying_maturity_month_year_at + 1) % 256; underlying_maturity_month_year_at = underlying_maturity_month_year_at + 1
  :: else -> break
  od;
  underlying_maturity_month_year_record.month = (underlying_maturity_month_year_base + 2 + 1) % 256;
  underlying_maturity_month_year_record.day = (underlying_maturity_month_year_base + 3 + 1) % 256;
  underlying_maturity_month_year_record.week = (underlying_maturity_month_year_base + 4 + 1) % 256;
  skip
}

/* Underlying Maturity Month Year to the wire, 5 bytes from where the cursor stands */
inline encode_underlying_maturity_month_year(underlying_maturity_month_year_record) {
  underlying_maturity_month_year_at = 0;
  do
  :: underlying_maturity_month_year_at < 2 -> wire[at] = underlying_maturity_month_year_record.year[underlying_maturity_month_year_at]; at = at + 1; underlying_maturity_month_year_at = underlying_maturity_month_year_at + 1
  :: else -> break
  od;
  wire[at] = underlying_maturity_month_year_record.month; at = at + 1;
  wire[at] = underlying_maturity_month_year_record.day; at = at + 1;
  wire[at] = underlying_maturity_month_year_record.week; at = at + 1;
  skip
}

/* Underlying Maturity Month Year off the wire, 5 bytes from where the cursor stands */
inline decode_underlying_maturity_month_year(underlying_maturity_month_year_record) {
  underlying_maturity_month_year_at = 0;
  do
  :: underlying_maturity_month_year_at < 2 -> underlying_maturity_month_year_record.year[underlying_maturity_month_year_at] = wire[at]; at = at + 1; underlying_maturity_month_year_at = underlying_maturity_month_year_at + 1
  :: else -> break
  od;
  underlying_maturity_month_year_record.month = wire[at]; at = at + 1;
  underlying_maturity_month_year_record.day = wire[at]; at = at + 1;
  underlying_maturity_month_year_record.week = wire[at]; at = at + 1;
  skip
}

/* what was read of Underlying Maturity Month Year is what was written, byte for byte */
inline equal_underlying_maturity_month_year(underlying_maturity_month_year_read, underlying_maturity_month_year_written) {
  underlying_maturity_month_year_at = 0;
  do
  :: underlying_maturity_month_year_at < 2 -> assert(underlying_maturity_month_year_read.year[underlying_maturity_month_year_at] == underlying_maturity_month_year_written.year[underlying_maturity_month_year_at]); underlying_maturity_month_year_at = underlying_maturity_month_year_at + 1
  :: else -> break
  od;
  assert(underlying_maturity_month_year_read.month == underlying_maturity_month_year_written.month);
  assert(underlying_maturity_month_year_read.day == underlying_maturity_month_year_written.day);
  assert(underlying_maturity_month_year_read.week == underlying_maturity_month_year_written.week);
  skip
}

/* ---- Formatted Last Px: 9 bytes ---------------------------------------------- */

/* Number of data blocks */
typedef FormattedLastPx {
  byte mantissa[8];
  byte exponent
};

int formatted_last_px_at;

/* every byte of Formatted Last Px set to one value */
inline fill_formatted_last_px(formatted_last_px_record, formatted_last_px_value) {
  formatted_last_px_at = 0;
  do
  :: formatted_last_px_at < 8 -> formatted_last_px_record.mantissa[formatted_last_px_at] = formatted_last_px_value; formatted_last_px_at = formatted_last_px_at + 1
  :: else -> break
  od;
  formatted_last_px_record.exponent = formatted_last_px_value;
  skip
}

/* each byte of Formatted Last Px set to where it lies, so a field read out of place says so */
inline ramp_formatted_last_px(formatted_last_px_record, formatted_last_px_base) {
  formatted_last_px_at = 0;
  do
  :: formatted_last_px_at < 8 -> formatted_last_px_record.mantissa[formatted_last_px_at] = (formatted_last_px_base + 0 + formatted_last_px_at + 1) % 256; formatted_last_px_at = formatted_last_px_at + 1
  :: else -> break
  od;
  formatted_last_px_record.exponent = (formatted_last_px_base + 8 + 1) % 256;
  skip
}

/* Formatted Last Px to the wire, 9 bytes from where the cursor stands */
inline encode_formatted_last_px(formatted_last_px_record) {
  formatted_last_px_at = 0;
  do
  :: formatted_last_px_at < 8 -> wire[at] = formatted_last_px_record.mantissa[formatted_last_px_at]; at = at + 1; formatted_last_px_at = formatted_last_px_at + 1
  :: else -> break
  od;
  wire[at] = formatted_last_px_record.exponent; at = at + 1;
  skip
}

/* Formatted Last Px off the wire, 9 bytes from where the cursor stands */
inline decode_formatted_last_px(formatted_last_px_record) {
  formatted_last_px_at = 0;
  do
  :: formatted_last_px_at < 8 -> formatted_last_px_record.mantissa[formatted_last_px_at] = wire[at]; at = at + 1; formatted_last_px_at = formatted_last_px_at + 1
  :: else -> break
  od;
  formatted_last_px_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Formatted Last Px is what was written, byte for byte */
inline equal_formatted_last_px(formatted_last_px_read, formatted_last_px_written) {
  formatted_last_px_at = 0;
  do
  :: formatted_last_px_at < 8 -> assert(formatted_last_px_read.mantissa[formatted_last_px_at] == formatted_last_px_written.mantissa[formatted_last_px_at]); formatted_last_px_at = formatted_last_px_at + 1
  :: else -> break
  od;
  assert(formatted_last_px_read.exponent == formatted_last_px_written.exponent);
  skip
}

/* ---- Low Px: 9 bytes --------------------------------------------------------- */

/* Number of data blocks */
typedef LowPx {
  byte mantissa[8];
  byte exponent
};

int low_px_at;

/* every byte of Low Px set to one value */
inline fill_low_px(low_px_record, low_px_value) {
  low_px_at = 0;
  do
  :: low_px_at < 8 -> low_px_record.mantissa[low_px_at] = low_px_value; low_px_at = low_px_at + 1
  :: else -> break
  od;
  low_px_record.exponent = low_px_value;
  skip
}

/* each byte of Low Px set to where it lies, so a field read out of place says so */
inline ramp_low_px(low_px_record, low_px_base) {
  low_px_at = 0;
  do
  :: low_px_at < 8 -> low_px_record.mantissa[low_px_at] = (low_px_base + 0 + low_px_at + 1) % 256; low_px_at = low_px_at + 1
  :: else -> break
  od;
  low_px_record.exponent = (low_px_base + 8 + 1) % 256;
  skip
}

/* Low Px to the wire, 9 bytes from where the cursor stands */
inline encode_low_px(low_px_record) {
  low_px_at = 0;
  do
  :: low_px_at < 8 -> wire[at] = low_px_record.mantissa[low_px_at]; at = at + 1; low_px_at = low_px_at + 1
  :: else -> break
  od;
  wire[at] = low_px_record.exponent; at = at + 1;
  skip
}

/* Low Px off the wire, 9 bytes from where the cursor stands */
inline decode_low_px(low_px_record) {
  low_px_at = 0;
  do
  :: low_px_at < 8 -> low_px_record.mantissa[low_px_at] = wire[at]; at = at + 1; low_px_at = low_px_at + 1
  :: else -> break
  od;
  low_px_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Low Px is what was written, byte for byte */
inline equal_low_px(low_px_read, low_px_written) {
  low_px_at = 0;
  do
  :: low_px_at < 8 -> assert(low_px_read.mantissa[low_px_at] == low_px_written.mantissa[low_px_at]); low_px_at = low_px_at + 1
  :: else -> break
  od;
  assert(low_px_read.exponent == low_px_written.exponent);
  skip
}

/* ---- High Px: 9 bytes -------------------------------------------------------- */

/* Number of data blocks */
typedef HighPx {
  byte mantissa[8];
  byte exponent
};

int high_px_at;

/* every byte of High Px set to one value */
inline fill_high_px(high_px_record, high_px_value) {
  high_px_at = 0;
  do
  :: high_px_at < 8 -> high_px_record.mantissa[high_px_at] = high_px_value; high_px_at = high_px_at + 1
  :: else -> break
  od;
  high_px_record.exponent = high_px_value;
  skip
}

/* each byte of High Px set to where it lies, so a field read out of place says so */
inline ramp_high_px(high_px_record, high_px_base) {
  high_px_at = 0;
  do
  :: high_px_at < 8 -> high_px_record.mantissa[high_px_at] = (high_px_base + 0 + high_px_at + 1) % 256; high_px_at = high_px_at + 1
  :: else -> break
  od;
  high_px_record.exponent = (high_px_base + 8 + 1) % 256;
  skip
}

/* High Px to the wire, 9 bytes from where the cursor stands */
inline encode_high_px(high_px_record) {
  high_px_at = 0;
  do
  :: high_px_at < 8 -> wire[at] = high_px_record.mantissa[high_px_at]; at = at + 1; high_px_at = high_px_at + 1
  :: else -> break
  od;
  wire[at] = high_px_record.exponent; at = at + 1;
  skip
}

/* High Px off the wire, 9 bytes from where the cursor stands */
inline decode_high_px(high_px_record) {
  high_px_at = 0;
  do
  :: high_px_at < 8 -> high_px_record.mantissa[high_px_at] = wire[at]; at = at + 1; high_px_at = high_px_at + 1
  :: else -> break
  od;
  high_px_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of High Px is what was written, byte for byte */
inline equal_high_px(high_px_read, high_px_written) {
  high_px_at = 0;
  do
  :: high_px_at < 8 -> assert(high_px_read.mantissa[high_px_at] == high_px_written.mantissa[high_px_at]); high_px_at = high_px_at + 1
  :: else -> break
  od;
  assert(high_px_read.exponent == high_px_written.exponent);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Technical Header: encoded, read back, and compared */
proctype check_technical_header() {
  TechnicalHeader technical_header_sent;
  TechnicalHeader technical_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_technical_header(technical_header_sent, 0)
  :: pattern == 1 -> fill_technical_header(technical_header_sent, 32)
  :: pattern == 2 -> fill_technical_header(technical_header_sent, 255)
  :: else -> ramp_technical_header(technical_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_technical_header(technical_header_sent);
    assert(at == 14);
    at = 0;
    decode_technical_header(technical_header_got);
    assert(at == 14);
    equal_technical_header(technical_header_got, technical_header_sent)
  }
}

/* Simple Binary Header: encoded, read back, and compared */
proctype check_simple_binary_header() {
  SimpleBinaryHeader simple_binary_header_sent;
  SimpleBinaryHeader simple_binary_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_binary_header(simple_binary_header_sent, 0)
  :: pattern == 1 -> fill_simple_binary_header(simple_binary_header_sent, 32)
  :: pattern == 2 -> fill_simple_binary_header(simple_binary_header_sent, 255)
  :: else -> ramp_simple_binary_header(simple_binary_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_binary_header(simple_binary_header_sent);
    assert(at == 8);
    at = 0;
    decode_simple_binary_header(simple_binary_header_got);
    assert(at == 8);
    equal_simple_binary_header(simple_binary_header_got, simple_binary_header_sent)
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
    assert(at == 10);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 10);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Group Size: encoded, read back, and compared */
proctype check_group_size() {
  GroupSize group_size_sent;
  GroupSize group_size_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_size(group_size_sent, 0)
  :: pattern == 1 -> fill_group_size(group_size_sent, 32)
  :: pattern == 2 -> fill_group_size(group_size_sent, 255)
  :: else -> ramp_group_size(group_size_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_size(group_size_sent);
    assert(at == 3);
    at = 0;
    decode_group_size(group_size_got);
    assert(at == 3);
    equal_group_size(group_size_got, group_size_sent)
  }
}

/* Maturity Month Year: encoded, read back, and compared */
proctype check_maturity_month_year() {
  MaturityMonthYear maturity_month_year_sent;
  MaturityMonthYear maturity_month_year_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_maturity_month_year(maturity_month_year_sent, 0)
  :: pattern == 1 -> fill_maturity_month_year(maturity_month_year_sent, 32)
  :: pattern == 2 -> fill_maturity_month_year(maturity_month_year_sent, 255)
  :: else -> ramp_maturity_month_year(maturity_month_year_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_maturity_month_year(maturity_month_year_sent);
    assert(at == 5);
    at = 0;
    decode_maturity_month_year(maturity_month_year_got);
    assert(at == 5);
    equal_maturity_month_year(maturity_month_year_got, maturity_month_year_sent)
  }
}

/* Strike Price: encoded, read back, and compared */
proctype check_strike_price() {
  StrikePrice strike_price_sent;
  StrikePrice strike_price_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_strike_price(strike_price_sent, 0)
  :: pattern == 1 -> fill_strike_price(strike_price_sent, 32)
  :: pattern == 2 -> fill_strike_price(strike_price_sent, 255)
  :: else -> ramp_strike_price(strike_price_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_strike_price(strike_price_sent);
    assert(at == 9);
    at = 0;
    decode_strike_price(strike_price_got);
    assert(at == 9);
    equal_strike_price(strike_price_got, strike_price_sent)
  }
}

/* Underlying Maturity Month Year: encoded, read back, and compared */
proctype check_underlying_maturity_month_year() {
  UnderlyingMaturityMonthYear underlying_maturity_month_year_sent;
  UnderlyingMaturityMonthYear underlying_maturity_month_year_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_maturity_month_year(underlying_maturity_month_year_sent, 0)
  :: pattern == 1 -> fill_underlying_maturity_month_year(underlying_maturity_month_year_sent, 32)
  :: pattern == 2 -> fill_underlying_maturity_month_year(underlying_maturity_month_year_sent, 255)
  :: else -> ramp_underlying_maturity_month_year(underlying_maturity_month_year_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_maturity_month_year(underlying_maturity_month_year_sent);
    assert(at == 5);
    at = 0;
    decode_underlying_maturity_month_year(underlying_maturity_month_year_got);
    assert(at == 5);
    equal_underlying_maturity_month_year(underlying_maturity_month_year_got, underlying_maturity_month_year_sent)
  }
}

/* Formatted Last Px: encoded, read back, and compared */
proctype check_formatted_last_px() {
  FormattedLastPx formatted_last_px_sent;
  FormattedLastPx formatted_last_px_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_formatted_last_px(formatted_last_px_sent, 0)
  :: pattern == 1 -> fill_formatted_last_px(formatted_last_px_sent, 32)
  :: pattern == 2 -> fill_formatted_last_px(formatted_last_px_sent, 255)
  :: else -> ramp_formatted_last_px(formatted_last_px_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_formatted_last_px(formatted_last_px_sent);
    assert(at == 9);
    at = 0;
    decode_formatted_last_px(formatted_last_px_got);
    assert(at == 9);
    equal_formatted_last_px(formatted_last_px_got, formatted_last_px_sent)
  }
}

/* Low Px: encoded, read back, and compared */
proctype check_low_px() {
  LowPx low_px_sent;
  LowPx low_px_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_low_px(low_px_sent, 0)
  :: pattern == 1 -> fill_low_px(low_px_sent, 32)
  :: pattern == 2 -> fill_low_px(low_px_sent, 255)
  :: else -> ramp_low_px(low_px_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_low_px(low_px_sent);
    assert(at == 9);
    at = 0;
    decode_low_px(low_px_got);
    assert(at == 9);
    equal_low_px(low_px_got, low_px_sent)
  }
}

/* High Px: encoded, read back, and compared */
proctype check_high_px() {
  HighPx high_px_sent;
  HighPx high_px_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_high_px(high_px_sent, 0)
  :: pattern == 1 -> fill_high_px(high_px_sent, 32)
  :: pattern == 2 -> fill_high_px(high_px_sent, 255)
  :: else -> ramp_high_px(high_px_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_high_px(high_px_sent);
    assert(at == 9);
    at = 0;
    decode_high_px(high_px_got);
    assert(at == 9);
    equal_high_px(high_px_got, high_px_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_technical_header()
  :: run check_simple_binary_header()
  :: run check_message_header()
  :: run check_group_size()
  :: run check_maturity_month_year()
  :: run check_strike_price()
  :: run check_underlying_maturity_month_year()
  :: run check_formatted_last_px()
  :: run check_low_px()
  :: run check_high_px()
  fi
}
