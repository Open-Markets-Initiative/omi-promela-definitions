/*
 * CME Group Us Treasuries
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
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 12

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Binary Packet Header: 12 bytes ------------------------------------------ */

/* Cme Mdp Packet Header */
typedef BinaryPacketHeader {
  byte packet_sequence_number[4];
  byte sending_time[8]
};

int binary_packet_header_at;

/* every byte of Binary Packet Header set to one value */
inline fill_binary_packet_header(binary_packet_header_record, binary_packet_header_value) {
  binary_packet_header_at = 0;
  do
  :: binary_packet_header_at < 4 -> binary_packet_header_record.packet_sequence_number[binary_packet_header_at] = binary_packet_header_value; binary_packet_header_at = binary_packet_header_at + 1
  :: else -> break
  od;
  binary_packet_header_at = 0;
  do
  :: binary_packet_header_at < 8 -> binary_packet_header_record.sending_time[binary_packet_header_at] = binary_packet_header_value; binary_packet_header_at = binary_packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Binary Packet Header set to where it lies, so a field read out of place says so */
inline ramp_binary_packet_header(binary_packet_header_record, binary_packet_header_base) {
  binary_packet_header_at = 0;
  do
  :: binary_packet_header_at < 4 -> binary_packet_header_record.packet_sequence_number[binary_packet_header_at] = (binary_packet_header_base + 0 + binary_packet_header_at + 1) % 256; binary_packet_header_at = binary_packet_header_at + 1
  :: else -> break
  od;
  binary_packet_header_at = 0;
  do
  :: binary_packet_header_at < 8 -> binary_packet_header_record.sending_time[binary_packet_header_at] = (binary_packet_header_base + 4 + binary_packet_header_at + 1) % 256; binary_packet_header_at = binary_packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Binary Packet Header to the wire, 12 bytes from where the cursor stands */
inline encode_binary_packet_header(binary_packet_header_record) {
  binary_packet_header_at = 0;
  do
  :: binary_packet_header_at < 4 -> wire[at] = binary_packet_header_record.packet_sequence_number[binary_packet_header_at]; at = at + 1; binary_packet_header_at = binary_packet_header_at + 1
  :: else -> break
  od;
  binary_packet_header_at = 0;
  do
  :: binary_packet_header_at < 8 -> wire[at] = binary_packet_header_record.sending_time[binary_packet_header_at]; at = at + 1; binary_packet_header_at = binary_packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Binary Packet Header off the wire, 12 bytes from where the cursor stands */
inline decode_binary_packet_header(binary_packet_header_record) {
  binary_packet_header_at = 0;
  do
  :: binary_packet_header_at < 4 -> binary_packet_header_record.packet_sequence_number[binary_packet_header_at] = wire[at]; at = at + 1; binary_packet_header_at = binary_packet_header_at + 1
  :: else -> break
  od;
  binary_packet_header_at = 0;
  do
  :: binary_packet_header_at < 8 -> binary_packet_header_record.sending_time[binary_packet_header_at] = wire[at]; at = at + 1; binary_packet_header_at = binary_packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Binary Packet Header is what was written, byte for byte */
inline equal_binary_packet_header(binary_packet_header_read, binary_packet_header_written) {
  binary_packet_header_at = 0;
  do
  :: binary_packet_header_at < 4 -> assert(binary_packet_header_read.packet_sequence_number[binary_packet_header_at] == binary_packet_header_written.packet_sequence_number[binary_packet_header_at]); binary_packet_header_at = binary_packet_header_at + 1
  :: else -> break
  od;
  binary_packet_header_at = 0;
  do
  :: binary_packet_header_at < 8 -> assert(binary_packet_header_read.sending_time[binary_packet_header_at] == binary_packet_header_written.sending_time[binary_packet_header_at]); binary_packet_header_at = binary_packet_header_at + 1
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

/* ---- Md Entry Px: 9 bytes ---------------------------------------------------- */

/* Number of data blocks */
typedef MdEntryPx {
  byte mantissa[8];
  byte exponent
};

int md_entry_px_at;

/* every byte of Md Entry Px set to one value */
inline fill_md_entry_px(md_entry_px_record, md_entry_px_value) {
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 8 -> md_entry_px_record.mantissa[md_entry_px_at] = md_entry_px_value; md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  md_entry_px_record.exponent = md_entry_px_value;
  skip
}

/* each byte of Md Entry Px set to where it lies, so a field read out of place says so */
inline ramp_md_entry_px(md_entry_px_record, md_entry_px_base) {
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 8 -> md_entry_px_record.mantissa[md_entry_px_at] = (md_entry_px_base + 0 + md_entry_px_at + 1) % 256; md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  md_entry_px_record.exponent = (md_entry_px_base + 8 + 1) % 256;
  skip
}

/* Md Entry Px to the wire, 9 bytes from where the cursor stands */
inline encode_md_entry_px(md_entry_px_record) {
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 8 -> wire[at] = md_entry_px_record.mantissa[md_entry_px_at]; at = at + 1; md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  wire[at] = md_entry_px_record.exponent; at = at + 1;
  skip
}

/* Md Entry Px off the wire, 9 bytes from where the cursor stands */
inline decode_md_entry_px(md_entry_px_record) {
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 8 -> md_entry_px_record.mantissa[md_entry_px_at] = wire[at]; at = at + 1; md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  md_entry_px_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Md Entry Px is what was written, byte for byte */
inline equal_md_entry_px(md_entry_px_read, md_entry_px_written) {
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 8 -> assert(md_entry_px_read.mantissa[md_entry_px_at] == md_entry_px_written.mantissa[md_entry_px_at]); md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  assert(md_entry_px_read.exponent == md_entry_px_written.exponent);
  skip
}

/* ---- Coupon Rate: 5 bytes ---------------------------------------------------- */

/* Number of data blocks */
typedef CouponRate {
  byte mantissa_32[4];
  byte exponent
};

int coupon_rate_at;

/* every byte of Coupon Rate set to one value */
inline fill_coupon_rate(coupon_rate_record, coupon_rate_value) {
  coupon_rate_at = 0;
  do
  :: coupon_rate_at < 4 -> coupon_rate_record.mantissa_32[coupon_rate_at] = coupon_rate_value; coupon_rate_at = coupon_rate_at + 1
  :: else -> break
  od;
  coupon_rate_record.exponent = coupon_rate_value;
  skip
}

/* each byte of Coupon Rate set to where it lies, so a field read out of place says so */
inline ramp_coupon_rate(coupon_rate_record, coupon_rate_base) {
  coupon_rate_at = 0;
  do
  :: coupon_rate_at < 4 -> coupon_rate_record.mantissa_32[coupon_rate_at] = (coupon_rate_base + 0 + coupon_rate_at + 1) % 256; coupon_rate_at = coupon_rate_at + 1
  :: else -> break
  od;
  coupon_rate_record.exponent = (coupon_rate_base + 4 + 1) % 256;
  skip
}

/* Coupon Rate to the wire, 5 bytes from where the cursor stands */
inline encode_coupon_rate(coupon_rate_record) {
  coupon_rate_at = 0;
  do
  :: coupon_rate_at < 4 -> wire[at] = coupon_rate_record.mantissa_32[coupon_rate_at]; at = at + 1; coupon_rate_at = coupon_rate_at + 1
  :: else -> break
  od;
  wire[at] = coupon_rate_record.exponent; at = at + 1;
  skip
}

/* Coupon Rate off the wire, 5 bytes from where the cursor stands */
inline decode_coupon_rate(coupon_rate_record) {
  coupon_rate_at = 0;
  do
  :: coupon_rate_at < 4 -> coupon_rate_record.mantissa_32[coupon_rate_at] = wire[at]; at = at + 1; coupon_rate_at = coupon_rate_at + 1
  :: else -> break
  od;
  coupon_rate_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Coupon Rate is what was written, byte for byte */
inline equal_coupon_rate(coupon_rate_read, coupon_rate_written) {
  coupon_rate_at = 0;
  do
  :: coupon_rate_at < 4 -> assert(coupon_rate_read.mantissa_32[coupon_rate_at] == coupon_rate_written.mantissa_32[coupon_rate_at]); coupon_rate_at = coupon_rate_at + 1
  :: else -> break
  od;
  assert(coupon_rate_read.exponent == coupon_rate_written.exponent);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Binary Packet Header: encoded, read back, and compared */
proctype check_binary_packet_header() {
  BinaryPacketHeader binary_packet_header_sent;
  BinaryPacketHeader binary_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_binary_packet_header(binary_packet_header_sent, 0)
  :: pattern == 1 -> fill_binary_packet_header(binary_packet_header_sent, 32)
  :: pattern == 2 -> fill_binary_packet_header(binary_packet_header_sent, 255)
  :: else -> ramp_binary_packet_header(binary_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_binary_packet_header(binary_packet_header_sent);
    assert(at == 12);
    at = 0;
    decode_binary_packet_header(binary_packet_header_got);
    assert(at == 12);
    equal_binary_packet_header(binary_packet_header_got, binary_packet_header_sent)
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
    assert(at == 9);
    at = 0;
    decode_md_entry_px(md_entry_px_got);
    assert(at == 9);
    equal_md_entry_px(md_entry_px_got, md_entry_px_sent)
  }
}

/* Coupon Rate: encoded, read back, and compared */
proctype check_coupon_rate() {
  CouponRate coupon_rate_sent;
  CouponRate coupon_rate_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_coupon_rate(coupon_rate_sent, 0)
  :: pattern == 1 -> fill_coupon_rate(coupon_rate_sent, 32)
  :: pattern == 2 -> fill_coupon_rate(coupon_rate_sent, 255)
  :: else -> ramp_coupon_rate(coupon_rate_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_coupon_rate(coupon_rate_sent);
    assert(at == 5);
    at = 0;
    decode_coupon_rate(coupon_rate_got);
    assert(at == 5);
    equal_coupon_rate(coupon_rate_got, coupon_rate_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_binary_packet_header()
  :: run check_simple_binary_header()
  :: run check_message_header()
  :: run check_group_size()
  :: run check_md_entry_px()
  :: run check_coupon_rate()
  fi
}
