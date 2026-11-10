/*
 * Chicago Board Options Exchange Opening Auction Feed
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
 *   - a run counted by a field
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 19

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

typedef PacketHeader {
  byte version;
  byte packet_length[2];
  byte sending_time[8];
  byte message_count;
  byte first_msg_seq_num[4]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_record.version = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sending_time[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.first_msg_seq_num[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_record.version = (packet_header_base + 0 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = (packet_header_base + 1 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sending_time[packet_header_at] = (packet_header_base + 3 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = (packet_header_base + 11 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.first_msg_seq_num[packet_header_at] = (packet_header_base + 12 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  wire[at] = packet_header_record.version; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.packet_length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.sending_time[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.message_count; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.first_msg_seq_num[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_record.version = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sending_time[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.first_msg_seq_num[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  assert(packet_header_read.version == packet_header_written.version);
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.packet_length[packet_header_at] == packet_header_written.packet_length[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.sending_time[packet_header_at] == packet_header_written.sending_time[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.message_count == packet_header_written.message_count);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.first_msg_seq_num[packet_header_at] == packet_header_written.first_msg_seq_num[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 8 bytes ------------------------------------------------- */

typedef MessageHeader {
  byte message_length[2];
  byte template_id;
  byte message_type;
  byte msg_seq_num[4]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.template_id = message_header_value;
  message_header_record.message_type = message_header_value;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_num[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.template_id = (message_header_base + 2 + 1) % 256;
  message_header_record.message_type = (message_header_base + 3 + 1) % 256;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_num[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 8 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.template_id; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.msg_seq_num[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 8 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.template_id = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_num[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.template_id == message_header_written.template_id);
  assert(message_header_read.message_type == message_header_written.message_type);
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.msg_seq_num[message_header_at] == message_header_written.msg_seq_num[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Strike Price: 5 bytes --------------------------------------------------- */

typedef StrikePrice {
  byte strike_price_exponent;
  byte strike_price_mantissa[4]
};

int strike_price_at;

/* every byte of Strike Price set to one value */
inline fill_strike_price(strike_price_record, strike_price_value) {
  strike_price_record.strike_price_exponent = strike_price_value;
  strike_price_at = 0;
  do
  :: strike_price_at < 4 -> strike_price_record.strike_price_mantissa[strike_price_at] = strike_price_value; strike_price_at = strike_price_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Strike Price set to where it lies, so a field read out of place says so */
inline ramp_strike_price(strike_price_record, strike_price_base) {
  strike_price_record.strike_price_exponent = (strike_price_base + 0 + 1) % 256;
  strike_price_at = 0;
  do
  :: strike_price_at < 4 -> strike_price_record.strike_price_mantissa[strike_price_at] = (strike_price_base + 1 + strike_price_at + 1) % 256; strike_price_at = strike_price_at + 1
  :: else -> break
  od;
  skip
}

/* Strike Price to the wire, 5 bytes from where the cursor stands */
inline encode_strike_price(strike_price_record) {
  wire[at] = strike_price_record.strike_price_exponent; at = at + 1;
  strike_price_at = 0;
  do
  :: strike_price_at < 4 -> wire[at] = strike_price_record.strike_price_mantissa[strike_price_at]; at = at + 1; strike_price_at = strike_price_at + 1
  :: else -> break
  od;
  skip
}

/* Strike Price off the wire, 5 bytes from where the cursor stands */
inline decode_strike_price(strike_price_record) {
  strike_price_record.strike_price_exponent = wire[at]; at = at + 1;
  strike_price_at = 0;
  do
  :: strike_price_at < 4 -> strike_price_record.strike_price_mantissa[strike_price_at] = wire[at]; at = at + 1; strike_price_at = strike_price_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Strike Price is what was written, byte for byte */
inline equal_strike_price(strike_price_read, strike_price_written) {
  assert(strike_price_read.strike_price_exponent == strike_price_written.strike_price_exponent);
  strike_price_at = 0;
  do
  :: strike_price_at < 4 -> assert(strike_price_read.strike_price_mantissa[strike_price_at] == strike_price_written.strike_price_mantissa[strike_price_at]); strike_price_at = strike_price_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Minimum Strike Price Fraction: 5 bytes ---------------------------------- */

typedef MinimumStrikePriceFraction {
  byte minimum_strike_price_fraction_exponent;
  byte minimum_strike_price_fraction_mantissa[4]
};

int minimum_strike_price_fraction_at;

/* every byte of Minimum Strike Price Fraction set to one value */
inline fill_minimum_strike_price_fraction(minimum_strike_price_fraction_record, minimum_strike_price_fraction_value) {
  minimum_strike_price_fraction_record.minimum_strike_price_fraction_exponent = minimum_strike_price_fraction_value;
  minimum_strike_price_fraction_at = 0;
  do
  :: minimum_strike_price_fraction_at < 4 -> minimum_strike_price_fraction_record.minimum_strike_price_fraction_mantissa[minimum_strike_price_fraction_at] = minimum_strike_price_fraction_value; minimum_strike_price_fraction_at = minimum_strike_price_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Minimum Strike Price Fraction set to where it lies, so a field read out of place says so */
inline ramp_minimum_strike_price_fraction(minimum_strike_price_fraction_record, minimum_strike_price_fraction_base) {
  minimum_strike_price_fraction_record.minimum_strike_price_fraction_exponent = (minimum_strike_price_fraction_base + 0 + 1) % 256;
  minimum_strike_price_fraction_at = 0;
  do
  :: minimum_strike_price_fraction_at < 4 -> minimum_strike_price_fraction_record.minimum_strike_price_fraction_mantissa[minimum_strike_price_fraction_at] = (minimum_strike_price_fraction_base + 1 + minimum_strike_price_fraction_at + 1) % 256; minimum_strike_price_fraction_at = minimum_strike_price_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* Minimum Strike Price Fraction to the wire, 5 bytes from where the cursor stands */
inline encode_minimum_strike_price_fraction(minimum_strike_price_fraction_record) {
  wire[at] = minimum_strike_price_fraction_record.minimum_strike_price_fraction_exponent; at = at + 1;
  minimum_strike_price_fraction_at = 0;
  do
  :: minimum_strike_price_fraction_at < 4 -> wire[at] = minimum_strike_price_fraction_record.minimum_strike_price_fraction_mantissa[minimum_strike_price_fraction_at]; at = at + 1; minimum_strike_price_fraction_at = minimum_strike_price_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* Minimum Strike Price Fraction off the wire, 5 bytes from where the cursor stands */
inline decode_minimum_strike_price_fraction(minimum_strike_price_fraction_record) {
  minimum_strike_price_fraction_record.minimum_strike_price_fraction_exponent = wire[at]; at = at + 1;
  minimum_strike_price_fraction_at = 0;
  do
  :: minimum_strike_price_fraction_at < 4 -> minimum_strike_price_fraction_record.minimum_strike_price_fraction_mantissa[minimum_strike_price_fraction_at] = wire[at]; at = at + 1; minimum_strike_price_fraction_at = minimum_strike_price_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Minimum Strike Price Fraction is what was written, byte for byte */
inline equal_minimum_strike_price_fraction(minimum_strike_price_fraction_read, minimum_strike_price_fraction_written) {
  assert(minimum_strike_price_fraction_read.minimum_strike_price_fraction_exponent == minimum_strike_price_fraction_written.minimum_strike_price_fraction_exponent);
  minimum_strike_price_fraction_at = 0;
  do
  :: minimum_strike_price_fraction_at < 4 -> assert(minimum_strike_price_fraction_read.minimum_strike_price_fraction_mantissa[minimum_strike_price_fraction_at] == minimum_strike_price_fraction_written.minimum_strike_price_fraction_mantissa[minimum_strike_price_fraction_at]); minimum_strike_price_fraction_at = minimum_strike_price_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Max Strike Price: 5 bytes ----------------------------------------------- */

typedef MaxStrikePrice {
  byte max_strike_price_exponent;
  byte max_strike_price_mantissa[4]
};

int max_strike_price_at;

/* every byte of Max Strike Price set to one value */
inline fill_max_strike_price(max_strike_price_record, max_strike_price_value) {
  max_strike_price_record.max_strike_price_exponent = max_strike_price_value;
  max_strike_price_at = 0;
  do
  :: max_strike_price_at < 4 -> max_strike_price_record.max_strike_price_mantissa[max_strike_price_at] = max_strike_price_value; max_strike_price_at = max_strike_price_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Max Strike Price set to where it lies, so a field read out of place says so */
inline ramp_max_strike_price(max_strike_price_record, max_strike_price_base) {
  max_strike_price_record.max_strike_price_exponent = (max_strike_price_base + 0 + 1) % 256;
  max_strike_price_at = 0;
  do
  :: max_strike_price_at < 4 -> max_strike_price_record.max_strike_price_mantissa[max_strike_price_at] = (max_strike_price_base + 1 + max_strike_price_at + 1) % 256; max_strike_price_at = max_strike_price_at + 1
  :: else -> break
  od;
  skip
}

/* Max Strike Price to the wire, 5 bytes from where the cursor stands */
inline encode_max_strike_price(max_strike_price_record) {
  wire[at] = max_strike_price_record.max_strike_price_exponent; at = at + 1;
  max_strike_price_at = 0;
  do
  :: max_strike_price_at < 4 -> wire[at] = max_strike_price_record.max_strike_price_mantissa[max_strike_price_at]; at = at + 1; max_strike_price_at = max_strike_price_at + 1
  :: else -> break
  od;
  skip
}

/* Max Strike Price off the wire, 5 bytes from where the cursor stands */
inline decode_max_strike_price(max_strike_price_record) {
  max_strike_price_record.max_strike_price_exponent = wire[at]; at = at + 1;
  max_strike_price_at = 0;
  do
  :: max_strike_price_at < 4 -> max_strike_price_record.max_strike_price_mantissa[max_strike_price_at] = wire[at]; at = at + 1; max_strike_price_at = max_strike_price_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Max Strike Price is what was written, byte for byte */
inline equal_max_strike_price(max_strike_price_read, max_strike_price_written) {
  assert(max_strike_price_read.max_strike_price_exponent == max_strike_price_written.max_strike_price_exponent);
  max_strike_price_at = 0;
  do
  :: max_strike_price_at < 4 -> assert(max_strike_price_read.max_strike_price_mantissa[max_strike_price_at] == max_strike_price_written.max_strike_price_mantissa[max_strike_price_at]); max_strike_price_at = max_strike_price_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Premium Break Point: 5 bytes -------------------------------------------- */

typedef PremiumBreakPoint {
  byte premium_break_point_exponent;
  byte premium_break_point_mantissa[4]
};

int premium_break_point_at;

/* every byte of Premium Break Point set to one value */
inline fill_premium_break_point(premium_break_point_record, premium_break_point_value) {
  premium_break_point_record.premium_break_point_exponent = premium_break_point_value;
  premium_break_point_at = 0;
  do
  :: premium_break_point_at < 4 -> premium_break_point_record.premium_break_point_mantissa[premium_break_point_at] = premium_break_point_value; premium_break_point_at = premium_break_point_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Premium Break Point set to where it lies, so a field read out of place says so */
inline ramp_premium_break_point(premium_break_point_record, premium_break_point_base) {
  premium_break_point_record.premium_break_point_exponent = (premium_break_point_base + 0 + 1) % 256;
  premium_break_point_at = 0;
  do
  :: premium_break_point_at < 4 -> premium_break_point_record.premium_break_point_mantissa[premium_break_point_at] = (premium_break_point_base + 1 + premium_break_point_at + 1) % 256; premium_break_point_at = premium_break_point_at + 1
  :: else -> break
  od;
  skip
}

/* Premium Break Point to the wire, 5 bytes from where the cursor stands */
inline encode_premium_break_point(premium_break_point_record) {
  wire[at] = premium_break_point_record.premium_break_point_exponent; at = at + 1;
  premium_break_point_at = 0;
  do
  :: premium_break_point_at < 4 -> wire[at] = premium_break_point_record.premium_break_point_mantissa[premium_break_point_at]; at = at + 1; premium_break_point_at = premium_break_point_at + 1
  :: else -> break
  od;
  skip
}

/* Premium Break Point off the wire, 5 bytes from where the cursor stands */
inline decode_premium_break_point(premium_break_point_record) {
  premium_break_point_record.premium_break_point_exponent = wire[at]; at = at + 1;
  premium_break_point_at = 0;
  do
  :: premium_break_point_at < 4 -> premium_break_point_record.premium_break_point_mantissa[premium_break_point_at] = wire[at]; at = at + 1; premium_break_point_at = premium_break_point_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Premium Break Point is what was written, byte for byte */
inline equal_premium_break_point(premium_break_point_read, premium_break_point_written) {
  assert(premium_break_point_read.premium_break_point_exponent == premium_break_point_written.premium_break_point_exponent);
  premium_break_point_at = 0;
  do
  :: premium_break_point_at < 4 -> assert(premium_break_point_read.premium_break_point_mantissa[premium_break_point_at] == premium_break_point_written.premium_break_point_mantissa[premium_break_point_at]); premium_break_point_at = premium_break_point_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Minimum Above Premium Fraction: 5 bytes --------------------------------- */

typedef MinimumAbovePremiumFraction {
  byte minimum_above_premium_fraction_exponent;
  byte minimum_above_premium_fraction_mantissa[4]
};

int minimum_above_premium_fraction_at;

/* every byte of Minimum Above Premium Fraction set to one value */
inline fill_minimum_above_premium_fraction(minimum_above_premium_fraction_record, minimum_above_premium_fraction_value) {
  minimum_above_premium_fraction_record.minimum_above_premium_fraction_exponent = minimum_above_premium_fraction_value;
  minimum_above_premium_fraction_at = 0;
  do
  :: minimum_above_premium_fraction_at < 4 -> minimum_above_premium_fraction_record.minimum_above_premium_fraction_mantissa[minimum_above_premium_fraction_at] = minimum_above_premium_fraction_value; minimum_above_premium_fraction_at = minimum_above_premium_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Minimum Above Premium Fraction set to where it lies, so a field read out of place says so */
inline ramp_minimum_above_premium_fraction(minimum_above_premium_fraction_record, minimum_above_premium_fraction_base) {
  minimum_above_premium_fraction_record.minimum_above_premium_fraction_exponent = (minimum_above_premium_fraction_base + 0 + 1) % 256;
  minimum_above_premium_fraction_at = 0;
  do
  :: minimum_above_premium_fraction_at < 4 -> minimum_above_premium_fraction_record.minimum_above_premium_fraction_mantissa[minimum_above_premium_fraction_at] = (minimum_above_premium_fraction_base + 1 + minimum_above_premium_fraction_at + 1) % 256; minimum_above_premium_fraction_at = minimum_above_premium_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* Minimum Above Premium Fraction to the wire, 5 bytes from where the cursor stands */
inline encode_minimum_above_premium_fraction(minimum_above_premium_fraction_record) {
  wire[at] = minimum_above_premium_fraction_record.minimum_above_premium_fraction_exponent; at = at + 1;
  minimum_above_premium_fraction_at = 0;
  do
  :: minimum_above_premium_fraction_at < 4 -> wire[at] = minimum_above_premium_fraction_record.minimum_above_premium_fraction_mantissa[minimum_above_premium_fraction_at]; at = at + 1; minimum_above_premium_fraction_at = minimum_above_premium_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* Minimum Above Premium Fraction off the wire, 5 bytes from where the cursor stands */
inline decode_minimum_above_premium_fraction(minimum_above_premium_fraction_record) {
  minimum_above_premium_fraction_record.minimum_above_premium_fraction_exponent = wire[at]; at = at + 1;
  minimum_above_premium_fraction_at = 0;
  do
  :: minimum_above_premium_fraction_at < 4 -> minimum_above_premium_fraction_record.minimum_above_premium_fraction_mantissa[minimum_above_premium_fraction_at] = wire[at]; at = at + 1; minimum_above_premium_fraction_at = minimum_above_premium_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Minimum Above Premium Fraction is what was written, byte for byte */
inline equal_minimum_above_premium_fraction(minimum_above_premium_fraction_read, minimum_above_premium_fraction_written) {
  assert(minimum_above_premium_fraction_read.minimum_above_premium_fraction_exponent == minimum_above_premium_fraction_written.minimum_above_premium_fraction_exponent);
  minimum_above_premium_fraction_at = 0;
  do
  :: minimum_above_premium_fraction_at < 4 -> assert(minimum_above_premium_fraction_read.minimum_above_premium_fraction_mantissa[minimum_above_premium_fraction_at] == minimum_above_premium_fraction_written.minimum_above_premium_fraction_mantissa[minimum_above_premium_fraction_at]); minimum_above_premium_fraction_at = minimum_above_premium_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Minimum Below Premium Fraction: 5 bytes --------------------------------- */

typedef MinimumBelowPremiumFraction {
  byte minimum_below_premium_fraction_exponent;
  byte minimum_below_premium_fraction_mantissa[4]
};

int minimum_below_premium_fraction_at;

/* every byte of Minimum Below Premium Fraction set to one value */
inline fill_minimum_below_premium_fraction(minimum_below_premium_fraction_record, minimum_below_premium_fraction_value) {
  minimum_below_premium_fraction_record.minimum_below_premium_fraction_exponent = minimum_below_premium_fraction_value;
  minimum_below_premium_fraction_at = 0;
  do
  :: minimum_below_premium_fraction_at < 4 -> minimum_below_premium_fraction_record.minimum_below_premium_fraction_mantissa[minimum_below_premium_fraction_at] = minimum_below_premium_fraction_value; minimum_below_premium_fraction_at = minimum_below_premium_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Minimum Below Premium Fraction set to where it lies, so a field read out of place says so */
inline ramp_minimum_below_premium_fraction(minimum_below_premium_fraction_record, minimum_below_premium_fraction_base) {
  minimum_below_premium_fraction_record.minimum_below_premium_fraction_exponent = (minimum_below_premium_fraction_base + 0 + 1) % 256;
  minimum_below_premium_fraction_at = 0;
  do
  :: minimum_below_premium_fraction_at < 4 -> minimum_below_premium_fraction_record.minimum_below_premium_fraction_mantissa[minimum_below_premium_fraction_at] = (minimum_below_premium_fraction_base + 1 + minimum_below_premium_fraction_at + 1) % 256; minimum_below_premium_fraction_at = minimum_below_premium_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* Minimum Below Premium Fraction to the wire, 5 bytes from where the cursor stands */
inline encode_minimum_below_premium_fraction(minimum_below_premium_fraction_record) {
  wire[at] = minimum_below_premium_fraction_record.minimum_below_premium_fraction_exponent; at = at + 1;
  minimum_below_premium_fraction_at = 0;
  do
  :: minimum_below_premium_fraction_at < 4 -> wire[at] = minimum_below_premium_fraction_record.minimum_below_premium_fraction_mantissa[minimum_below_premium_fraction_at]; at = at + 1; minimum_below_premium_fraction_at = minimum_below_premium_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* Minimum Below Premium Fraction off the wire, 5 bytes from where the cursor stands */
inline decode_minimum_below_premium_fraction(minimum_below_premium_fraction_record) {
  minimum_below_premium_fraction_record.minimum_below_premium_fraction_exponent = wire[at]; at = at + 1;
  minimum_below_premium_fraction_at = 0;
  do
  :: minimum_below_premium_fraction_at < 4 -> minimum_below_premium_fraction_record.minimum_below_premium_fraction_mantissa[minimum_below_premium_fraction_at] = wire[at]; at = at + 1; minimum_below_premium_fraction_at = minimum_below_premium_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Minimum Below Premium Fraction is what was written, byte for byte */
inline equal_minimum_below_premium_fraction(minimum_below_premium_fraction_read, minimum_below_premium_fraction_written) {
  assert(minimum_below_premium_fraction_read.minimum_below_premium_fraction_exponent == minimum_below_premium_fraction_written.minimum_below_premium_fraction_exponent);
  minimum_below_premium_fraction_at = 0;
  do
  :: minimum_below_premium_fraction_at < 4 -> assert(minimum_below_premium_fraction_read.minimum_below_premium_fraction_mantissa[minimum_below_premium_fraction_at] == minimum_below_premium_fraction_written.minimum_below_premium_fraction_mantissa[minimum_below_premium_fraction_at]); minimum_below_premium_fraction_at = minimum_below_premium_fraction_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Prev Close Px: 5 bytes -------------------------------------------------- */

typedef PrevClosePx {
  byte prev_close_px_exponent;
  byte prev_close_px_mantissa[4]
};

int prev_close_px_at;

/* every byte of Prev Close Px set to one value */
inline fill_prev_close_px(prev_close_px_record, prev_close_px_value) {
  prev_close_px_record.prev_close_px_exponent = prev_close_px_value;
  prev_close_px_at = 0;
  do
  :: prev_close_px_at < 4 -> prev_close_px_record.prev_close_px_mantissa[prev_close_px_at] = prev_close_px_value; prev_close_px_at = prev_close_px_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Prev Close Px set to where it lies, so a field read out of place says so */
inline ramp_prev_close_px(prev_close_px_record, prev_close_px_base) {
  prev_close_px_record.prev_close_px_exponent = (prev_close_px_base + 0 + 1) % 256;
  prev_close_px_at = 0;
  do
  :: prev_close_px_at < 4 -> prev_close_px_record.prev_close_px_mantissa[prev_close_px_at] = (prev_close_px_base + 1 + prev_close_px_at + 1) % 256; prev_close_px_at = prev_close_px_at + 1
  :: else -> break
  od;
  skip
}

/* Prev Close Px to the wire, 5 bytes from where the cursor stands */
inline encode_prev_close_px(prev_close_px_record) {
  wire[at] = prev_close_px_record.prev_close_px_exponent; at = at + 1;
  prev_close_px_at = 0;
  do
  :: prev_close_px_at < 4 -> wire[at] = prev_close_px_record.prev_close_px_mantissa[prev_close_px_at]; at = at + 1; prev_close_px_at = prev_close_px_at + 1
  :: else -> break
  od;
  skip
}

/* Prev Close Px off the wire, 5 bytes from where the cursor stands */
inline decode_prev_close_px(prev_close_px_record) {
  prev_close_px_record.prev_close_px_exponent = wire[at]; at = at + 1;
  prev_close_px_at = 0;
  do
  :: prev_close_px_at < 4 -> prev_close_px_record.prev_close_px_mantissa[prev_close_px_at] = wire[at]; at = at + 1; prev_close_px_at = prev_close_px_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Prev Close Px is what was written, byte for byte */
inline equal_prev_close_px(prev_close_px_read, prev_close_px_written) {
  assert(prev_close_px_read.prev_close_px_exponent == prev_close_px_written.prev_close_px_exponent);
  prev_close_px_at = 0;
  do
  :: prev_close_px_at < 4 -> assert(prev_close_px_read.prev_close_px_mantissa[prev_close_px_at] == prev_close_px_written.prev_close_px_mantissa[prev_close_px_at]); prev_close_px_at = prev_close_px_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Md Entry Px: 5 bytes ---------------------------------------------------- */

typedef MdEntryPx {
  byte md_entry_px_exponent;
  byte md_entry_px_mantissa[4]
};

int md_entry_px_at;

/* every byte of Md Entry Px set to one value */
inline fill_md_entry_px(md_entry_px_record, md_entry_px_value) {
  md_entry_px_record.md_entry_px_exponent = md_entry_px_value;
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 4 -> md_entry_px_record.md_entry_px_mantissa[md_entry_px_at] = md_entry_px_value; md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Md Entry Px set to where it lies, so a field read out of place says so */
inline ramp_md_entry_px(md_entry_px_record, md_entry_px_base) {
  md_entry_px_record.md_entry_px_exponent = (md_entry_px_base + 0 + 1) % 256;
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 4 -> md_entry_px_record.md_entry_px_mantissa[md_entry_px_at] = (md_entry_px_base + 1 + md_entry_px_at + 1) % 256; md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  skip
}

/* Md Entry Px to the wire, 5 bytes from where the cursor stands */
inline encode_md_entry_px(md_entry_px_record) {
  wire[at] = md_entry_px_record.md_entry_px_exponent; at = at + 1;
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 4 -> wire[at] = md_entry_px_record.md_entry_px_mantissa[md_entry_px_at]; at = at + 1; md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  skip
}

/* Md Entry Px off the wire, 5 bytes from where the cursor stands */
inline decode_md_entry_px(md_entry_px_record) {
  md_entry_px_record.md_entry_px_exponent = wire[at]; at = at + 1;
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 4 -> md_entry_px_record.md_entry_px_mantissa[md_entry_px_at] = wire[at]; at = at + 1; md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Md Entry Px is what was written, byte for byte */
inline equal_md_entry_px(md_entry_px_read, md_entry_px_written) {
  assert(md_entry_px_read.md_entry_px_exponent == md_entry_px_written.md_entry_px_exponent);
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 4 -> assert(md_entry_px_read.md_entry_px_mantissa[md_entry_px_at] == md_entry_px_written.md_entry_px_mantissa[md_entry_px_at]); md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Eop: 5 bytes ------------------------------------------------------------ */

typedef Eop {
  byte eop_exponent;
  byte eop_mantissa[4]
};

int eop_at;

/* every byte of Eop set to one value */
inline fill_eop(eop_record, eop_value) {
  eop_record.eop_exponent = eop_value;
  eop_at = 0;
  do
  :: eop_at < 4 -> eop_record.eop_mantissa[eop_at] = eop_value; eop_at = eop_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Eop set to where it lies, so a field read out of place says so */
inline ramp_eop(eop_record, eop_base) {
  eop_record.eop_exponent = (eop_base + 0 + 1) % 256;
  eop_at = 0;
  do
  :: eop_at < 4 -> eop_record.eop_mantissa[eop_at] = (eop_base + 1 + eop_at + 1) % 256; eop_at = eop_at + 1
  :: else -> break
  od;
  skip
}

/* Eop to the wire, 5 bytes from where the cursor stands */
inline encode_eop(eop_record) {
  wire[at] = eop_record.eop_exponent; at = at + 1;
  eop_at = 0;
  do
  :: eop_at < 4 -> wire[at] = eop_record.eop_mantissa[eop_at]; at = at + 1; eop_at = eop_at + 1
  :: else -> break
  od;
  skip
}

/* Eop off the wire, 5 bytes from where the cursor stands */
inline decode_eop(eop_record) {
  eop_record.eop_exponent = wire[at]; at = at + 1;
  eop_at = 0;
  do
  :: eop_at < 4 -> eop_record.eop_mantissa[eop_at] = wire[at]; at = at + 1; eop_at = eop_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Eop is what was written, byte for byte */
inline equal_eop(eop_read, eop_written) {
  assert(eop_read.eop_exponent == eop_written.eop_exponent);
  eop_at = 0;
  do
  :: eop_at < 4 -> assert(eop_read.eop_mantissa[eop_at] == eop_written.eop_mantissa[eop_at]); eop_at = eop_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Expected Opening Price And Size Message: 19 bytes ----------------------- */

/* The EOP message contains expected opening price and size information for a security. */
typedef ExpectedOpeningPriceAndSizeMessage {
  byte class_key[4];
  byte security_id[4];
  Eop eop;
  byte eos[4];
  byte eop_type;
  byte legal_market
};

int expected_opening_price_and_size_message_at;

/* every byte of Expected Opening Price And Size Message set to one value */
inline fill_expected_opening_price_and_size_message(expected_opening_price_and_size_message_record, expected_opening_price_and_size_message_value) {
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> expected_opening_price_and_size_message_record.class_key[expected_opening_price_and_size_message_at] = expected_opening_price_and_size_message_value; expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> expected_opening_price_and_size_message_record.security_id[expected_opening_price_and_size_message_at] = expected_opening_price_and_size_message_value; expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  fill_eop(expected_opening_price_and_size_message_record.eop, expected_opening_price_and_size_message_value);
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> expected_opening_price_and_size_message_record.eos[expected_opening_price_and_size_message_at] = expected_opening_price_and_size_message_value; expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  expected_opening_price_and_size_message_record.eop_type = expected_opening_price_and_size_message_value;
  expected_opening_price_and_size_message_record.legal_market = expected_opening_price_and_size_message_value;
  skip
}

/* each byte of Expected Opening Price And Size Message set to where it lies, so a field read out of place says so */
inline ramp_expected_opening_price_and_size_message(expected_opening_price_and_size_message_record, expected_opening_price_and_size_message_base) {
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> expected_opening_price_and_size_message_record.class_key[expected_opening_price_and_size_message_at] = (expected_opening_price_and_size_message_base + 0 + expected_opening_price_and_size_message_at + 1) % 256; expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> expected_opening_price_and_size_message_record.security_id[expected_opening_price_and_size_message_at] = (expected_opening_price_and_size_message_base + 4 + expected_opening_price_and_size_message_at + 1) % 256; expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  ramp_eop(expected_opening_price_and_size_message_record.eop, expected_opening_price_and_size_message_base + 8);
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> expected_opening_price_and_size_message_record.eos[expected_opening_price_and_size_message_at] = (expected_opening_price_and_size_message_base + 13 + expected_opening_price_and_size_message_at + 1) % 256; expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  expected_opening_price_and_size_message_record.eop_type = (expected_opening_price_and_size_message_base + 17 + 1) % 256;
  expected_opening_price_and_size_message_record.legal_market = (expected_opening_price_and_size_message_base + 18 + 1) % 256;
  skip
}

/* Expected Opening Price And Size Message to the wire, 19 bytes from where the cursor stands */
inline encode_expected_opening_price_and_size_message(expected_opening_price_and_size_message_record) {
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> wire[at] = expected_opening_price_and_size_message_record.class_key[expected_opening_price_and_size_message_at]; at = at + 1; expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> wire[at] = expected_opening_price_and_size_message_record.security_id[expected_opening_price_and_size_message_at]; at = at + 1; expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  encode_eop(expected_opening_price_and_size_message_record.eop);
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> wire[at] = expected_opening_price_and_size_message_record.eos[expected_opening_price_and_size_message_at]; at = at + 1; expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  wire[at] = expected_opening_price_and_size_message_record.eop_type; at = at + 1;
  wire[at] = expected_opening_price_and_size_message_record.legal_market; at = at + 1;
  skip
}

/* Expected Opening Price And Size Message off the wire, 19 bytes from where the cursor stands */
inline decode_expected_opening_price_and_size_message(expected_opening_price_and_size_message_record) {
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> expected_opening_price_and_size_message_record.class_key[expected_opening_price_and_size_message_at] = wire[at]; at = at + 1; expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> expected_opening_price_and_size_message_record.security_id[expected_opening_price_and_size_message_at] = wire[at]; at = at + 1; expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  decode_eop(expected_opening_price_and_size_message_record.eop);
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> expected_opening_price_and_size_message_record.eos[expected_opening_price_and_size_message_at] = wire[at]; at = at + 1; expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  expected_opening_price_and_size_message_record.eop_type = wire[at]; at = at + 1;
  expected_opening_price_and_size_message_record.legal_market = wire[at]; at = at + 1;
  skip
}

/* what was read of Expected Opening Price And Size Message is what was written, byte for byte */
inline equal_expected_opening_price_and_size_message(expected_opening_price_and_size_message_read, expected_opening_price_and_size_message_written) {
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> assert(expected_opening_price_and_size_message_read.class_key[expected_opening_price_and_size_message_at] == expected_opening_price_and_size_message_written.class_key[expected_opening_price_and_size_message_at]); expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> assert(expected_opening_price_and_size_message_read.security_id[expected_opening_price_and_size_message_at] == expected_opening_price_and_size_message_written.security_id[expected_opening_price_and_size_message_at]); expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  equal_eop(expected_opening_price_and_size_message_read.eop, expected_opening_price_and_size_message_written.eop);
  expected_opening_price_and_size_message_at = 0;
  do
  :: expected_opening_price_and_size_message_at < 4 -> assert(expected_opening_price_and_size_message_read.eos[expected_opening_price_and_size_message_at] == expected_opening_price_and_size_message_written.eos[expected_opening_price_and_size_message_at]); expected_opening_price_and_size_message_at = expected_opening_price_and_size_message_at + 1
  :: else -> break
  od;
  assert(expected_opening_price_and_size_message_read.eop_type == expected_opening_price_and_size_message_written.eop_type);
  assert(expected_opening_price_and_size_message_read.legal_market == expected_opening_price_and_size_message_written.legal_market);
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
    assert(at == 8);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 8);
    equal_message_header(message_header_got, message_header_sent)
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
    assert(at == 5);
    at = 0;
    decode_strike_price(strike_price_got);
    assert(at == 5);
    equal_strike_price(strike_price_got, strike_price_sent)
  }
}

/* Minimum Strike Price Fraction: encoded, read back, and compared */
proctype check_minimum_strike_price_fraction() {
  MinimumStrikePriceFraction minimum_strike_price_fraction_sent;
  MinimumStrikePriceFraction minimum_strike_price_fraction_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_minimum_strike_price_fraction(minimum_strike_price_fraction_sent, 0)
  :: pattern == 1 -> fill_minimum_strike_price_fraction(minimum_strike_price_fraction_sent, 32)
  :: pattern == 2 -> fill_minimum_strike_price_fraction(minimum_strike_price_fraction_sent, 255)
  :: else -> ramp_minimum_strike_price_fraction(minimum_strike_price_fraction_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_minimum_strike_price_fraction(minimum_strike_price_fraction_sent);
    assert(at == 5);
    at = 0;
    decode_minimum_strike_price_fraction(minimum_strike_price_fraction_got);
    assert(at == 5);
    equal_minimum_strike_price_fraction(minimum_strike_price_fraction_got, minimum_strike_price_fraction_sent)
  }
}

/* Max Strike Price: encoded, read back, and compared */
proctype check_max_strike_price() {
  MaxStrikePrice max_strike_price_sent;
  MaxStrikePrice max_strike_price_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_max_strike_price(max_strike_price_sent, 0)
  :: pattern == 1 -> fill_max_strike_price(max_strike_price_sent, 32)
  :: pattern == 2 -> fill_max_strike_price(max_strike_price_sent, 255)
  :: else -> ramp_max_strike_price(max_strike_price_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_max_strike_price(max_strike_price_sent);
    assert(at == 5);
    at = 0;
    decode_max_strike_price(max_strike_price_got);
    assert(at == 5);
    equal_max_strike_price(max_strike_price_got, max_strike_price_sent)
  }
}

/* Premium Break Point: encoded, read back, and compared */
proctype check_premium_break_point() {
  PremiumBreakPoint premium_break_point_sent;
  PremiumBreakPoint premium_break_point_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_premium_break_point(premium_break_point_sent, 0)
  :: pattern == 1 -> fill_premium_break_point(premium_break_point_sent, 32)
  :: pattern == 2 -> fill_premium_break_point(premium_break_point_sent, 255)
  :: else -> ramp_premium_break_point(premium_break_point_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_premium_break_point(premium_break_point_sent);
    assert(at == 5);
    at = 0;
    decode_premium_break_point(premium_break_point_got);
    assert(at == 5);
    equal_premium_break_point(premium_break_point_got, premium_break_point_sent)
  }
}

/* Minimum Above Premium Fraction: encoded, read back, and compared */
proctype check_minimum_above_premium_fraction() {
  MinimumAbovePremiumFraction minimum_above_premium_fraction_sent;
  MinimumAbovePremiumFraction minimum_above_premium_fraction_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_minimum_above_premium_fraction(minimum_above_premium_fraction_sent, 0)
  :: pattern == 1 -> fill_minimum_above_premium_fraction(minimum_above_premium_fraction_sent, 32)
  :: pattern == 2 -> fill_minimum_above_premium_fraction(minimum_above_premium_fraction_sent, 255)
  :: else -> ramp_minimum_above_premium_fraction(minimum_above_premium_fraction_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_minimum_above_premium_fraction(minimum_above_premium_fraction_sent);
    assert(at == 5);
    at = 0;
    decode_minimum_above_premium_fraction(minimum_above_premium_fraction_got);
    assert(at == 5);
    equal_minimum_above_premium_fraction(minimum_above_premium_fraction_got, minimum_above_premium_fraction_sent)
  }
}

/* Minimum Below Premium Fraction: encoded, read back, and compared */
proctype check_minimum_below_premium_fraction() {
  MinimumBelowPremiumFraction minimum_below_premium_fraction_sent;
  MinimumBelowPremiumFraction minimum_below_premium_fraction_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_minimum_below_premium_fraction(minimum_below_premium_fraction_sent, 0)
  :: pattern == 1 -> fill_minimum_below_premium_fraction(minimum_below_premium_fraction_sent, 32)
  :: pattern == 2 -> fill_minimum_below_premium_fraction(minimum_below_premium_fraction_sent, 255)
  :: else -> ramp_minimum_below_premium_fraction(minimum_below_premium_fraction_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_minimum_below_premium_fraction(minimum_below_premium_fraction_sent);
    assert(at == 5);
    at = 0;
    decode_minimum_below_premium_fraction(minimum_below_premium_fraction_got);
    assert(at == 5);
    equal_minimum_below_premium_fraction(minimum_below_premium_fraction_got, minimum_below_premium_fraction_sent)
  }
}

/* Prev Close Px: encoded, read back, and compared */
proctype check_prev_close_px() {
  PrevClosePx prev_close_px_sent;
  PrevClosePx prev_close_px_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_prev_close_px(prev_close_px_sent, 0)
  :: pattern == 1 -> fill_prev_close_px(prev_close_px_sent, 32)
  :: pattern == 2 -> fill_prev_close_px(prev_close_px_sent, 255)
  :: else -> ramp_prev_close_px(prev_close_px_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_prev_close_px(prev_close_px_sent);
    assert(at == 5);
    at = 0;
    decode_prev_close_px(prev_close_px_got);
    assert(at == 5);
    equal_prev_close_px(prev_close_px_got, prev_close_px_sent)
  }
}

/* Md Entry Px: encoded, read back, and compared */
proctype check_md_entry_px() {
  MdEntryPx md_entry_px_sent;
  MdEntryPx md_entry_px_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_md_entry_px(md_entry_px_sent, 0)
  :: pattern == 1 -> fill_md_entry_px(md_entry_px_sent, 32)
  :: pattern == 2 -> fill_md_entry_px(md_entry_px_sent, 255)
  :: else -> ramp_md_entry_px(md_entry_px_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_md_entry_px(md_entry_px_sent);
    assert(at == 5);
    at = 0;
    decode_md_entry_px(md_entry_px_got);
    assert(at == 5);
    equal_md_entry_px(md_entry_px_got, md_entry_px_sent)
  }
}

/* Eop: encoded, read back, and compared */
proctype check_eop() {
  Eop eop_sent;
  Eop eop_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eop(eop_sent, 0)
  :: pattern == 1 -> fill_eop(eop_sent, 32)
  :: pattern == 2 -> fill_eop(eop_sent, 255)
  :: else -> ramp_eop(eop_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eop(eop_sent);
    assert(at == 5);
    at = 0;
    decode_eop(eop_got);
    assert(at == 5);
    equal_eop(eop_got, eop_sent)
  }
}

/* Expected Opening Price And Size Message: encoded, read back, and compared */
proctype check_expected_opening_price_and_size_message() {
  ExpectedOpeningPriceAndSizeMessage expected_opening_price_and_size_message_sent;
  ExpectedOpeningPriceAndSizeMessage expected_opening_price_and_size_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expected_opening_price_and_size_message(expected_opening_price_and_size_message_sent, 0)
  :: pattern == 1 -> fill_expected_opening_price_and_size_message(expected_opening_price_and_size_message_sent, 32)
  :: pattern == 2 -> fill_expected_opening_price_and_size_message(expected_opening_price_and_size_message_sent, 255)
  :: else -> ramp_expected_opening_price_and_size_message(expected_opening_price_and_size_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expected_opening_price_and_size_message(expected_opening_price_and_size_message_sent);
    assert(at == 19);
    at = 0;
    decode_expected_opening_price_and_size_message(expected_opening_price_and_size_message_got);
    assert(at == 19);
    equal_expected_opening_price_and_size_message(expected_opening_price_and_size_message_got, expected_opening_price_and_size_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_strike_price()
  :: run check_minimum_strike_price_fraction()
  :: run check_max_strike_price()
  :: run check_premium_break_point()
  :: run check_minimum_above_premium_fraction()
  :: run check_minimum_below_premium_fraction()
  :: run check_prev_close_px()
  :: run check_md_entry_px()
  :: run check_eop()
  :: run check_expected_opening_price_and_size_message()
  fi
}
