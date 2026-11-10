/*
 * CME Group Streamlined Market Data
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
 *   - a field read in bits
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 180

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

/* ---- Admin Login: 1 bytes ---------------------------------------------------- */

/* AdminLogin */
typedef AdminLogin {
  byte heart_bt_int
};

/* every byte of Admin Login set to one value */
inline fill_admin_login(admin_login_record, admin_login_value) {
  admin_login_record.heart_bt_int = admin_login_value;
  skip
}

/* each byte of Admin Login set to where it lies, so a field read out of place says so */
inline ramp_admin_login(admin_login_record, admin_login_base) {
  admin_login_record.heart_bt_int = (admin_login_base + 0 + 1) % 256;
  skip
}

/* Admin Login to the wire, 1 bytes from where the cursor stands */
inline encode_admin_login(admin_login_record) {
  wire[at] = admin_login_record.heart_bt_int; at = at + 1;
  skip
}

/* Admin Login off the wire, 1 bytes from where the cursor stands */
inline decode_admin_login(admin_login_record) {
  admin_login_record.heart_bt_int = wire[at]; at = at + 1;
  skip
}

/* what was read of Admin Login is what was written, byte for byte */
inline equal_admin_login(admin_login_read, admin_login_written) {
  assert(admin_login_read.heart_bt_int == admin_login_written.heart_bt_int);
  skip
}

/* ---- Admin Logout: 180 bytes ------------------------------------------------- */

/* AdminLogout */
typedef AdminLogout {
  byte text[180]
};

int admin_logout_at;

/* every byte of Admin Logout set to one value */
inline fill_admin_logout(admin_logout_record, admin_logout_value) {
  admin_logout_at = 0;
  do
  :: admin_logout_at < 180 -> admin_logout_record.text[admin_logout_at] = admin_logout_value; admin_logout_at = admin_logout_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Admin Logout set to where it lies, so a field read out of place says so */
inline ramp_admin_logout(admin_logout_record, admin_logout_base) {
  admin_logout_at = 0;
  do
  :: admin_logout_at < 180 -> admin_logout_record.text[admin_logout_at] = (admin_logout_base + 0 + admin_logout_at + 1) % 256; admin_logout_at = admin_logout_at + 1
  :: else -> break
  od;
  skip
}

/* Admin Logout to the wire, 180 bytes from where the cursor stands */
inline encode_admin_logout(admin_logout_record) {
  admin_logout_at = 0;
  do
  :: admin_logout_at < 180 -> wire[at] = admin_logout_record.text[admin_logout_at]; at = at + 1; admin_logout_at = admin_logout_at + 1
  :: else -> break
  od;
  skip
}

/* Admin Logout off the wire, 180 bytes from where the cursor stands */
inline decode_admin_logout(admin_logout_record) {
  admin_logout_at = 0;
  do
  :: admin_logout_at < 180 -> admin_logout_record.text[admin_logout_at] = wire[at]; at = at + 1; admin_logout_at = admin_logout_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Admin Logout is what was written, byte for byte */
inline equal_admin_logout(admin_logout_read, admin_logout_written) {
  admin_logout_at = 0;
  do
  :: admin_logout_at < 180 -> assert(admin_logout_read.text[admin_logout_at] == admin_logout_written.text[admin_logout_at]); admin_logout_at = admin_logout_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Group Size: 3 bytes ----------------------------------------------------- */

/* Repeating group dimensions */
typedef GroupSize {
  byte block_length[2];
  byte num_in_group_8
};

int group_size_at;

/* every byte of Group Size set to one value */
inline fill_group_size(group_size_record, group_size_value) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = group_size_value; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group_8 = group_size_value;
  skip
}

/* each byte of Group Size set to where it lies, so a field read out of place says so */
inline ramp_group_size(group_size_record, group_size_base) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = (group_size_base + 0 + group_size_at + 1) % 256; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group_8 = (group_size_base + 2 + 1) % 256;
  skip
}

/* Group Size to the wire, 3 bytes from where the cursor stands */
inline encode_group_size(group_size_record) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> wire[at] = group_size_record.block_length[group_size_at]; at = at + 1; group_size_at = group_size_at + 1
  :: else -> break
  od;
  wire[at] = group_size_record.num_in_group_8; at = at + 1;
  skip
}

/* Group Size off the wire, 3 bytes from where the cursor stands */
inline decode_group_size(group_size_record) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> group_size_record.block_length[group_size_at] = wire[at]; at = at + 1; group_size_at = group_size_at + 1
  :: else -> break
  od;
  group_size_record.num_in_group_8 = wire[at]; at = at + 1;
  skip
}

/* what was read of Group Size is what was written, byte for byte */
inline equal_group_size(group_size_read, group_size_written) {
  group_size_at = 0;
  do
  :: group_size_at < 2 -> assert(group_size_read.block_length[group_size_at] == group_size_written.block_length[group_size_at]); group_size_at = group_size_at + 1
  :: else -> break
  od;
  assert(group_size_read.num_in_group_8 == group_size_written.num_in_group_8);
  skip
}

/* ---- Md Entry Px Decimal Optional: 9 bytes ----------------------------------- */

/* Number of entries in Market Data message. */
typedef MdEntryPxDecimalOptional {
  byte mantissa[8];
  byte exponent_optional
};

int md_entry_px_decimal_optional_at;

/* every byte of Md Entry Px Decimal Optional set to one value */
inline fill_md_entry_px_decimal_optional(md_entry_px_decimal_optional_record, md_entry_px_decimal_optional_value) {
  md_entry_px_decimal_optional_at = 0;
  do
  :: md_entry_px_decimal_optional_at < 8 -> md_entry_px_decimal_optional_record.mantissa[md_entry_px_decimal_optional_at] = md_entry_px_decimal_optional_value; md_entry_px_decimal_optional_at = md_entry_px_decimal_optional_at + 1
  :: else -> break
  od;
  md_entry_px_decimal_optional_record.exponent_optional = md_entry_px_decimal_optional_value;
  skip
}

/* each byte of Md Entry Px Decimal Optional set to where it lies, so a field read out of place says so */
inline ramp_md_entry_px_decimal_optional(md_entry_px_decimal_optional_record, md_entry_px_decimal_optional_base) {
  md_entry_px_decimal_optional_at = 0;
  do
  :: md_entry_px_decimal_optional_at < 8 -> md_entry_px_decimal_optional_record.mantissa[md_entry_px_decimal_optional_at] = (md_entry_px_decimal_optional_base + 0 + md_entry_px_decimal_optional_at + 1) % 256; md_entry_px_decimal_optional_at = md_entry_px_decimal_optional_at + 1
  :: else -> break
  od;
  md_entry_px_decimal_optional_record.exponent_optional = (md_entry_px_decimal_optional_base + 8 + 1) % 256;
  skip
}

/* Md Entry Px Decimal Optional to the wire, 9 bytes from where the cursor stands */
inline encode_md_entry_px_decimal_optional(md_entry_px_decimal_optional_record) {
  md_entry_px_decimal_optional_at = 0;
  do
  :: md_entry_px_decimal_optional_at < 8 -> wire[at] = md_entry_px_decimal_optional_record.mantissa[md_entry_px_decimal_optional_at]; at = at + 1; md_entry_px_decimal_optional_at = md_entry_px_decimal_optional_at + 1
  :: else -> break
  od;
  wire[at] = md_entry_px_decimal_optional_record.exponent_optional; at = at + 1;
  skip
}

/* Md Entry Px Decimal Optional off the wire, 9 bytes from where the cursor stands */
inline decode_md_entry_px_decimal_optional(md_entry_px_decimal_optional_record) {
  md_entry_px_decimal_optional_at = 0;
  do
  :: md_entry_px_decimal_optional_at < 8 -> md_entry_px_decimal_optional_record.mantissa[md_entry_px_decimal_optional_at] = wire[at]; at = at + 1; md_entry_px_decimal_optional_at = md_entry_px_decimal_optional_at + 1
  :: else -> break
  od;
  md_entry_px_decimal_optional_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Md Entry Px Decimal Optional is what was written, byte for byte */
inline equal_md_entry_px_decimal_optional(md_entry_px_decimal_optional_read, md_entry_px_decimal_optional_written) {
  md_entry_px_decimal_optional_at = 0;
  do
  :: md_entry_px_decimal_optional_at < 8 -> assert(md_entry_px_decimal_optional_read.mantissa[md_entry_px_decimal_optional_at] == md_entry_px_decimal_optional_written.mantissa[md_entry_px_decimal_optional_at]); md_entry_px_decimal_optional_at = md_entry_px_decimal_optional_at + 1
  :: else -> break
  od;
  assert(md_entry_px_decimal_optional_read.exponent_optional == md_entry_px_decimal_optional_written.exponent_optional);
  skip
}

/* ---- Cal Fut Px Optional: 9 bytes -------------------------------------------- */

/* Number of entries in Market Data message. */
typedef CalFutPxOptional {
  byte mantissa[8];
  byte exponent_optional
};

int cal_fut_px_optional_at;

/* every byte of Cal Fut Px Optional set to one value */
inline fill_cal_fut_px_optional(cal_fut_px_optional_record, cal_fut_px_optional_value) {
  cal_fut_px_optional_at = 0;
  do
  :: cal_fut_px_optional_at < 8 -> cal_fut_px_optional_record.mantissa[cal_fut_px_optional_at] = cal_fut_px_optional_value; cal_fut_px_optional_at = cal_fut_px_optional_at + 1
  :: else -> break
  od;
  cal_fut_px_optional_record.exponent_optional = cal_fut_px_optional_value;
  skip
}

/* each byte of Cal Fut Px Optional set to where it lies, so a field read out of place says so */
inline ramp_cal_fut_px_optional(cal_fut_px_optional_record, cal_fut_px_optional_base) {
  cal_fut_px_optional_at = 0;
  do
  :: cal_fut_px_optional_at < 8 -> cal_fut_px_optional_record.mantissa[cal_fut_px_optional_at] = (cal_fut_px_optional_base + 0 + cal_fut_px_optional_at + 1) % 256; cal_fut_px_optional_at = cal_fut_px_optional_at + 1
  :: else -> break
  od;
  cal_fut_px_optional_record.exponent_optional = (cal_fut_px_optional_base + 8 + 1) % 256;
  skip
}

/* Cal Fut Px Optional to the wire, 9 bytes from where the cursor stands */
inline encode_cal_fut_px_optional(cal_fut_px_optional_record) {
  cal_fut_px_optional_at = 0;
  do
  :: cal_fut_px_optional_at < 8 -> wire[at] = cal_fut_px_optional_record.mantissa[cal_fut_px_optional_at]; at = at + 1; cal_fut_px_optional_at = cal_fut_px_optional_at + 1
  :: else -> break
  od;
  wire[at] = cal_fut_px_optional_record.exponent_optional; at = at + 1;
  skip
}

/* Cal Fut Px Optional off the wire, 9 bytes from where the cursor stands */
inline decode_cal_fut_px_optional(cal_fut_px_optional_record) {
  cal_fut_px_optional_at = 0;
  do
  :: cal_fut_px_optional_at < 8 -> cal_fut_px_optional_record.mantissa[cal_fut_px_optional_at] = wire[at]; at = at + 1; cal_fut_px_optional_at = cal_fut_px_optional_at + 1
  :: else -> break
  od;
  cal_fut_px_optional_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Cal Fut Px Optional is what was written, byte for byte */
inline equal_cal_fut_px_optional(cal_fut_px_optional_read, cal_fut_px_optional_written) {
  cal_fut_px_optional_at = 0;
  do
  :: cal_fut_px_optional_at < 8 -> assert(cal_fut_px_optional_read.mantissa[cal_fut_px_optional_at] == cal_fut_px_optional_written.mantissa[cal_fut_px_optional_at]); cal_fut_px_optional_at = cal_fut_px_optional_at + 1
  :: else -> break
  od;
  assert(cal_fut_px_optional_read.exponent_optional == cal_fut_px_optional_written.exponent_optional);
  skip
}

/* ---- Coupon Rate Optional: 5 bytes ------------------------------------------- */

/* Number of entries in Market Data message. */
typedef CouponRateOptional {
  byte mantissa_32[4];
  byte exponent_optional
};

int coupon_rate_optional_at;

/* every byte of Coupon Rate Optional set to one value */
inline fill_coupon_rate_optional(coupon_rate_optional_record, coupon_rate_optional_value) {
  coupon_rate_optional_at = 0;
  do
  :: coupon_rate_optional_at < 4 -> coupon_rate_optional_record.mantissa_32[coupon_rate_optional_at] = coupon_rate_optional_value; coupon_rate_optional_at = coupon_rate_optional_at + 1
  :: else -> break
  od;
  coupon_rate_optional_record.exponent_optional = coupon_rate_optional_value;
  skip
}

/* each byte of Coupon Rate Optional set to where it lies, so a field read out of place says so */
inline ramp_coupon_rate_optional(coupon_rate_optional_record, coupon_rate_optional_base) {
  coupon_rate_optional_at = 0;
  do
  :: coupon_rate_optional_at < 4 -> coupon_rate_optional_record.mantissa_32[coupon_rate_optional_at] = (coupon_rate_optional_base + 0 + coupon_rate_optional_at + 1) % 256; coupon_rate_optional_at = coupon_rate_optional_at + 1
  :: else -> break
  od;
  coupon_rate_optional_record.exponent_optional = (coupon_rate_optional_base + 4 + 1) % 256;
  skip
}

/* Coupon Rate Optional to the wire, 5 bytes from where the cursor stands */
inline encode_coupon_rate_optional(coupon_rate_optional_record) {
  coupon_rate_optional_at = 0;
  do
  :: coupon_rate_optional_at < 4 -> wire[at] = coupon_rate_optional_record.mantissa_32[coupon_rate_optional_at]; at = at + 1; coupon_rate_optional_at = coupon_rate_optional_at + 1
  :: else -> break
  od;
  wire[at] = coupon_rate_optional_record.exponent_optional; at = at + 1;
  skip
}

/* Coupon Rate Optional off the wire, 5 bytes from where the cursor stands */
inline decode_coupon_rate_optional(coupon_rate_optional_record) {
  coupon_rate_optional_at = 0;
  do
  :: coupon_rate_optional_at < 4 -> coupon_rate_optional_record.mantissa_32[coupon_rate_optional_at] = wire[at]; at = at + 1; coupon_rate_optional_at = coupon_rate_optional_at + 1
  :: else -> break
  od;
  coupon_rate_optional_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Coupon Rate Optional is what was written, byte for byte */
inline equal_coupon_rate_optional(coupon_rate_optional_read, coupon_rate_optional_written) {
  coupon_rate_optional_at = 0;
  do
  :: coupon_rate_optional_at < 4 -> assert(coupon_rate_optional_read.mantissa_32[coupon_rate_optional_at] == coupon_rate_optional_written.mantissa_32[coupon_rate_optional_at]); coupon_rate_optional_at = coupon_rate_optional_at + 1
  :: else -> break
  od;
  assert(coupon_rate_optional_read.exponent_optional == coupon_rate_optional_written.exponent_optional);
  skip
}

/* ---- Fair Coupon Pct: 9 bytes ------------------------------------------------ */

/* Number of entries in Market Data message. */
typedef FairCouponPct {
  byte mantissa[8];
  byte exponent_optional
};

int fair_coupon_pct_at;

/* every byte of Fair Coupon Pct set to one value */
inline fill_fair_coupon_pct(fair_coupon_pct_record, fair_coupon_pct_value) {
  fair_coupon_pct_at = 0;
  do
  :: fair_coupon_pct_at < 8 -> fair_coupon_pct_record.mantissa[fair_coupon_pct_at] = fair_coupon_pct_value; fair_coupon_pct_at = fair_coupon_pct_at + 1
  :: else -> break
  od;
  fair_coupon_pct_record.exponent_optional = fair_coupon_pct_value;
  skip
}

/* each byte of Fair Coupon Pct set to where it lies, so a field read out of place says so */
inline ramp_fair_coupon_pct(fair_coupon_pct_record, fair_coupon_pct_base) {
  fair_coupon_pct_at = 0;
  do
  :: fair_coupon_pct_at < 8 -> fair_coupon_pct_record.mantissa[fair_coupon_pct_at] = (fair_coupon_pct_base + 0 + fair_coupon_pct_at + 1) % 256; fair_coupon_pct_at = fair_coupon_pct_at + 1
  :: else -> break
  od;
  fair_coupon_pct_record.exponent_optional = (fair_coupon_pct_base + 8 + 1) % 256;
  skip
}

/* Fair Coupon Pct to the wire, 9 bytes from where the cursor stands */
inline encode_fair_coupon_pct(fair_coupon_pct_record) {
  fair_coupon_pct_at = 0;
  do
  :: fair_coupon_pct_at < 8 -> wire[at] = fair_coupon_pct_record.mantissa[fair_coupon_pct_at]; at = at + 1; fair_coupon_pct_at = fair_coupon_pct_at + 1
  :: else -> break
  od;
  wire[at] = fair_coupon_pct_record.exponent_optional; at = at + 1;
  skip
}

/* Fair Coupon Pct off the wire, 9 bytes from where the cursor stands */
inline decode_fair_coupon_pct(fair_coupon_pct_record) {
  fair_coupon_pct_at = 0;
  do
  :: fair_coupon_pct_at < 8 -> fair_coupon_pct_record.mantissa[fair_coupon_pct_at] = wire[at]; at = at + 1; fair_coupon_pct_at = fair_coupon_pct_at + 1
  :: else -> break
  od;
  fair_coupon_pct_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Fair Coupon Pct is what was written, byte for byte */
inline equal_fair_coupon_pct(fair_coupon_pct_read, fair_coupon_pct_written) {
  fair_coupon_pct_at = 0;
  do
  :: fair_coupon_pct_at < 8 -> assert(fair_coupon_pct_read.mantissa[fair_coupon_pct_at] == fair_coupon_pct_written.mantissa[fair_coupon_pct_at]); fair_coupon_pct_at = fair_coupon_pct_at + 1
  :: else -> break
  od;
  assert(fair_coupon_pct_read.exponent_optional == fair_coupon_pct_written.exponent_optional);
  skip
}

/* ---- Leg Purchase Rate: 9 bytes ---------------------------------------------- */

/* Number of entries in Market Data message. */
typedef LegPurchaseRate {
  byte mantissa[8];
  byte exponent_optional
};

int leg_purchase_rate_at;

/* every byte of Leg Purchase Rate set to one value */
inline fill_leg_purchase_rate(leg_purchase_rate_record, leg_purchase_rate_value) {
  leg_purchase_rate_at = 0;
  do
  :: leg_purchase_rate_at < 8 -> leg_purchase_rate_record.mantissa[leg_purchase_rate_at] = leg_purchase_rate_value; leg_purchase_rate_at = leg_purchase_rate_at + 1
  :: else -> break
  od;
  leg_purchase_rate_record.exponent_optional = leg_purchase_rate_value;
  skip
}

/* each byte of Leg Purchase Rate set to where it lies, so a field read out of place says so */
inline ramp_leg_purchase_rate(leg_purchase_rate_record, leg_purchase_rate_base) {
  leg_purchase_rate_at = 0;
  do
  :: leg_purchase_rate_at < 8 -> leg_purchase_rate_record.mantissa[leg_purchase_rate_at] = (leg_purchase_rate_base + 0 + leg_purchase_rate_at + 1) % 256; leg_purchase_rate_at = leg_purchase_rate_at + 1
  :: else -> break
  od;
  leg_purchase_rate_record.exponent_optional = (leg_purchase_rate_base + 8 + 1) % 256;
  skip
}

/* Leg Purchase Rate to the wire, 9 bytes from where the cursor stands */
inline encode_leg_purchase_rate(leg_purchase_rate_record) {
  leg_purchase_rate_at = 0;
  do
  :: leg_purchase_rate_at < 8 -> wire[at] = leg_purchase_rate_record.mantissa[leg_purchase_rate_at]; at = at + 1; leg_purchase_rate_at = leg_purchase_rate_at + 1
  :: else -> break
  od;
  wire[at] = leg_purchase_rate_record.exponent_optional; at = at + 1;
  skip
}

/* Leg Purchase Rate off the wire, 9 bytes from where the cursor stands */
inline decode_leg_purchase_rate(leg_purchase_rate_record) {
  leg_purchase_rate_at = 0;
  do
  :: leg_purchase_rate_at < 8 -> leg_purchase_rate_record.mantissa[leg_purchase_rate_at] = wire[at]; at = at + 1; leg_purchase_rate_at = leg_purchase_rate_at + 1
  :: else -> break
  od;
  leg_purchase_rate_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Leg Purchase Rate is what was written, byte for byte */
inline equal_leg_purchase_rate(leg_purchase_rate_read, leg_purchase_rate_written) {
  leg_purchase_rate_at = 0;
  do
  :: leg_purchase_rate_at < 8 -> assert(leg_purchase_rate_read.mantissa[leg_purchase_rate_at] == leg_purchase_rate_written.mantissa[leg_purchase_rate_at]); leg_purchase_rate_at = leg_purchase_rate_at + 1
  :: else -> break
  od;
  assert(leg_purchase_rate_read.exponent_optional == leg_purchase_rate_written.exponent_optional);
  skip
}

/* ---- Fixed Npv: 9 bytes ------------------------------------------------------ */

/* Number of entries in Market Data message. */
typedef FixedNpv {
  byte mantissa[8];
  byte exponent_optional
};

int fixed_npv_at;

/* every byte of Fixed Npv set to one value */
inline fill_fixed_npv(fixed_npv_record, fixed_npv_value) {
  fixed_npv_at = 0;
  do
  :: fixed_npv_at < 8 -> fixed_npv_record.mantissa[fixed_npv_at] = fixed_npv_value; fixed_npv_at = fixed_npv_at + 1
  :: else -> break
  od;
  fixed_npv_record.exponent_optional = fixed_npv_value;
  skip
}

/* each byte of Fixed Npv set to where it lies, so a field read out of place says so */
inline ramp_fixed_npv(fixed_npv_record, fixed_npv_base) {
  fixed_npv_at = 0;
  do
  :: fixed_npv_at < 8 -> fixed_npv_record.mantissa[fixed_npv_at] = (fixed_npv_base + 0 + fixed_npv_at + 1) % 256; fixed_npv_at = fixed_npv_at + 1
  :: else -> break
  od;
  fixed_npv_record.exponent_optional = (fixed_npv_base + 8 + 1) % 256;
  skip
}

/* Fixed Npv to the wire, 9 bytes from where the cursor stands */
inline encode_fixed_npv(fixed_npv_record) {
  fixed_npv_at = 0;
  do
  :: fixed_npv_at < 8 -> wire[at] = fixed_npv_record.mantissa[fixed_npv_at]; at = at + 1; fixed_npv_at = fixed_npv_at + 1
  :: else -> break
  od;
  wire[at] = fixed_npv_record.exponent_optional; at = at + 1;
  skip
}

/* Fixed Npv off the wire, 9 bytes from where the cursor stands */
inline decode_fixed_npv(fixed_npv_record) {
  fixed_npv_at = 0;
  do
  :: fixed_npv_at < 8 -> fixed_npv_record.mantissa[fixed_npv_at] = wire[at]; at = at + 1; fixed_npv_at = fixed_npv_at + 1
  :: else -> break
  od;
  fixed_npv_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Fixed Npv is what was written, byte for byte */
inline equal_fixed_npv(fixed_npv_read, fixed_npv_written) {
  fixed_npv_at = 0;
  do
  :: fixed_npv_at < 8 -> assert(fixed_npv_read.mantissa[fixed_npv_at] == fixed_npv_written.mantissa[fixed_npv_at]); fixed_npv_at = fixed_npv_at + 1
  :: else -> break
  od;
  assert(fixed_npv_read.exponent_optional == fixed_npv_written.exponent_optional);
  skip
}

/* ---- Float Npv: 9 bytes ------------------------------------------------------ */

/* Number of entries in Market Data message. */
typedef FloatNpv {
  byte mantissa[8];
  byte exponent_optional
};

int float_npv_at;

/* every byte of Float Npv set to one value */
inline fill_float_npv(float_npv_record, float_npv_value) {
  float_npv_at = 0;
  do
  :: float_npv_at < 8 -> float_npv_record.mantissa[float_npv_at] = float_npv_value; float_npv_at = float_npv_at + 1
  :: else -> break
  od;
  float_npv_record.exponent_optional = float_npv_value;
  skip
}

/* each byte of Float Npv set to where it lies, so a field read out of place says so */
inline ramp_float_npv(float_npv_record, float_npv_base) {
  float_npv_at = 0;
  do
  :: float_npv_at < 8 -> float_npv_record.mantissa[float_npv_at] = (float_npv_base + 0 + float_npv_at + 1) % 256; float_npv_at = float_npv_at + 1
  :: else -> break
  od;
  float_npv_record.exponent_optional = (float_npv_base + 8 + 1) % 256;
  skip
}

/* Float Npv to the wire, 9 bytes from where the cursor stands */
inline encode_float_npv(float_npv_record) {
  float_npv_at = 0;
  do
  :: float_npv_at < 8 -> wire[at] = float_npv_record.mantissa[float_npv_at]; at = at + 1; float_npv_at = float_npv_at + 1
  :: else -> break
  od;
  wire[at] = float_npv_record.exponent_optional; at = at + 1;
  skip
}

/* Float Npv off the wire, 9 bytes from where the cursor stands */
inline decode_float_npv(float_npv_record) {
  float_npv_at = 0;
  do
  :: float_npv_at < 8 -> float_npv_record.mantissa[float_npv_at] = wire[at]; at = at + 1; float_npv_at = float_npv_at + 1
  :: else -> break
  od;
  float_npv_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Float Npv is what was written, byte for byte */
inline equal_float_npv(float_npv_read, float_npv_written) {
  float_npv_at = 0;
  do
  :: float_npv_at < 8 -> assert(float_npv_read.mantissa[float_npv_at] == float_npv_written.mantissa[float_npv_at]); float_npv_at = float_npv_at + 1
  :: else -> break
  od;
  assert(float_npv_read.exponent_optional == float_npv_written.exponent_optional);
  skip
}

/* ---- Npv: 9 bytes ------------------------------------------------------------ */

/* Number of entries in Market Data message. */
typedef Npv {
  byte mantissa[8];
  byte exponent_optional
};

int npv_at;

/* every byte of Npv set to one value */
inline fill_npv(npv_record, npv_value) {
  npv_at = 0;
  do
  :: npv_at < 8 -> npv_record.mantissa[npv_at] = npv_value; npv_at = npv_at + 1
  :: else -> break
  od;
  npv_record.exponent_optional = npv_value;
  skip
}

/* each byte of Npv set to where it lies, so a field read out of place says so */
inline ramp_npv(npv_record, npv_base) {
  npv_at = 0;
  do
  :: npv_at < 8 -> npv_record.mantissa[npv_at] = (npv_base + 0 + npv_at + 1) % 256; npv_at = npv_at + 1
  :: else -> break
  od;
  npv_record.exponent_optional = (npv_base + 8 + 1) % 256;
  skip
}

/* Npv to the wire, 9 bytes from where the cursor stands */
inline encode_npv(npv_record) {
  npv_at = 0;
  do
  :: npv_at < 8 -> wire[at] = npv_record.mantissa[npv_at]; at = at + 1; npv_at = npv_at + 1
  :: else -> break
  od;
  wire[at] = npv_record.exponent_optional; at = at + 1;
  skip
}

/* Npv off the wire, 9 bytes from where the cursor stands */
inline decode_npv(npv_record) {
  npv_at = 0;
  do
  :: npv_at < 8 -> npv_record.mantissa[npv_at] = wire[at]; at = at + 1; npv_at = npv_at + 1
  :: else -> break
  od;
  npv_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Npv is what was written, byte for byte */
inline equal_npv(npv_read, npv_written) {
  npv_at = 0;
  do
  :: npv_at < 8 -> assert(npv_read.mantissa[npv_at] == npv_written.mantissa[npv_at]); npv_at = npv_at + 1
  :: else -> break
  od;
  assert(npv_read.exponent_optional == npv_written.exponent_optional);
  skip
}

/* ---- Accrued Coupons: 9 bytes ------------------------------------------------ */

/* Number of entries in Market Data message. */
typedef AccruedCoupons {
  byte mantissa[8];
  byte exponent_optional
};

int accrued_coupons_at;

/* every byte of Accrued Coupons set to one value */
inline fill_accrued_coupons(accrued_coupons_record, accrued_coupons_value) {
  accrued_coupons_at = 0;
  do
  :: accrued_coupons_at < 8 -> accrued_coupons_record.mantissa[accrued_coupons_at] = accrued_coupons_value; accrued_coupons_at = accrued_coupons_at + 1
  :: else -> break
  od;
  accrued_coupons_record.exponent_optional = accrued_coupons_value;
  skip
}

/* each byte of Accrued Coupons set to where it lies, so a field read out of place says so */
inline ramp_accrued_coupons(accrued_coupons_record, accrued_coupons_base) {
  accrued_coupons_at = 0;
  do
  :: accrued_coupons_at < 8 -> accrued_coupons_record.mantissa[accrued_coupons_at] = (accrued_coupons_base + 0 + accrued_coupons_at + 1) % 256; accrued_coupons_at = accrued_coupons_at + 1
  :: else -> break
  od;
  accrued_coupons_record.exponent_optional = (accrued_coupons_base + 8 + 1) % 256;
  skip
}

/* Accrued Coupons to the wire, 9 bytes from where the cursor stands */
inline encode_accrued_coupons(accrued_coupons_record) {
  accrued_coupons_at = 0;
  do
  :: accrued_coupons_at < 8 -> wire[at] = accrued_coupons_record.mantissa[accrued_coupons_at]; at = at + 1; accrued_coupons_at = accrued_coupons_at + 1
  :: else -> break
  od;
  wire[at] = accrued_coupons_record.exponent_optional; at = at + 1;
  skip
}

/* Accrued Coupons off the wire, 9 bytes from where the cursor stands */
inline decode_accrued_coupons(accrued_coupons_record) {
  accrued_coupons_at = 0;
  do
  :: accrued_coupons_at < 8 -> accrued_coupons_record.mantissa[accrued_coupons_at] = wire[at]; at = at + 1; accrued_coupons_at = accrued_coupons_at + 1
  :: else -> break
  od;
  accrued_coupons_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Accrued Coupons is what was written, byte for byte */
inline equal_accrued_coupons(accrued_coupons_read, accrued_coupons_written) {
  accrued_coupons_at = 0;
  do
  :: accrued_coupons_at < 8 -> assert(accrued_coupons_read.mantissa[accrued_coupons_at] == accrued_coupons_written.mantissa[accrued_coupons_at]); accrued_coupons_at = accrued_coupons_at + 1
  :: else -> break
  od;
  assert(accrued_coupons_read.exponent_optional == accrued_coupons_written.exponent_optional);
  skip
}

/* ---- Daily Incremental Eris Pai: 9 bytes ------------------------------------- */

/* Number of entries in Market Data message. */
typedef DailyIncrementalErisPai {
  byte mantissa[8];
  byte exponent_optional
};

int daily_incremental_eris_pai_at;

/* every byte of Daily Incremental Eris Pai set to one value */
inline fill_daily_incremental_eris_pai(daily_incremental_eris_pai_record, daily_incremental_eris_pai_value) {
  daily_incremental_eris_pai_at = 0;
  do
  :: daily_incremental_eris_pai_at < 8 -> daily_incremental_eris_pai_record.mantissa[daily_incremental_eris_pai_at] = daily_incremental_eris_pai_value; daily_incremental_eris_pai_at = daily_incremental_eris_pai_at + 1
  :: else -> break
  od;
  daily_incremental_eris_pai_record.exponent_optional = daily_incremental_eris_pai_value;
  skip
}

/* each byte of Daily Incremental Eris Pai set to where it lies, so a field read out of place says so */
inline ramp_daily_incremental_eris_pai(daily_incremental_eris_pai_record, daily_incremental_eris_pai_base) {
  daily_incremental_eris_pai_at = 0;
  do
  :: daily_incremental_eris_pai_at < 8 -> daily_incremental_eris_pai_record.mantissa[daily_incremental_eris_pai_at] = (daily_incremental_eris_pai_base + 0 + daily_incremental_eris_pai_at + 1) % 256; daily_incremental_eris_pai_at = daily_incremental_eris_pai_at + 1
  :: else -> break
  od;
  daily_incremental_eris_pai_record.exponent_optional = (daily_incremental_eris_pai_base + 8 + 1) % 256;
  skip
}

/* Daily Incremental Eris Pai to the wire, 9 bytes from where the cursor stands */
inline encode_daily_incremental_eris_pai(daily_incremental_eris_pai_record) {
  daily_incremental_eris_pai_at = 0;
  do
  :: daily_incremental_eris_pai_at < 8 -> wire[at] = daily_incremental_eris_pai_record.mantissa[daily_incremental_eris_pai_at]; at = at + 1; daily_incremental_eris_pai_at = daily_incremental_eris_pai_at + 1
  :: else -> break
  od;
  wire[at] = daily_incremental_eris_pai_record.exponent_optional; at = at + 1;
  skip
}

/* Daily Incremental Eris Pai off the wire, 9 bytes from where the cursor stands */
inline decode_daily_incremental_eris_pai(daily_incremental_eris_pai_record) {
  daily_incremental_eris_pai_at = 0;
  do
  :: daily_incremental_eris_pai_at < 8 -> daily_incremental_eris_pai_record.mantissa[daily_incremental_eris_pai_at] = wire[at]; at = at + 1; daily_incremental_eris_pai_at = daily_incremental_eris_pai_at + 1
  :: else -> break
  od;
  daily_incremental_eris_pai_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Daily Incremental Eris Pai is what was written, byte for byte */
inline equal_daily_incremental_eris_pai(daily_incremental_eris_pai_read, daily_incremental_eris_pai_written) {
  daily_incremental_eris_pai_at = 0;
  do
  :: daily_incremental_eris_pai_at < 8 -> assert(daily_incremental_eris_pai_read.mantissa[daily_incremental_eris_pai_at] == daily_incremental_eris_pai_written.mantissa[daily_incremental_eris_pai_at]); daily_incremental_eris_pai_at = daily_incremental_eris_pai_at + 1
  :: else -> break
  od;
  assert(daily_incremental_eris_pai_read.exponent_optional == daily_incremental_eris_pai_written.exponent_optional);
  skip
}

/* ---- Eris Pai: 9 bytes ------------------------------------------------------- */

/* Number of entries in Market Data message. */
typedef ErisPai {
  byte mantissa[8];
  byte exponent_optional
};

int eris_pai_at;

/* every byte of Eris Pai set to one value */
inline fill_eris_pai(eris_pai_record, eris_pai_value) {
  eris_pai_at = 0;
  do
  :: eris_pai_at < 8 -> eris_pai_record.mantissa[eris_pai_at] = eris_pai_value; eris_pai_at = eris_pai_at + 1
  :: else -> break
  od;
  eris_pai_record.exponent_optional = eris_pai_value;
  skip
}

/* each byte of Eris Pai set to where it lies, so a field read out of place says so */
inline ramp_eris_pai(eris_pai_record, eris_pai_base) {
  eris_pai_at = 0;
  do
  :: eris_pai_at < 8 -> eris_pai_record.mantissa[eris_pai_at] = (eris_pai_base + 0 + eris_pai_at + 1) % 256; eris_pai_at = eris_pai_at + 1
  :: else -> break
  od;
  eris_pai_record.exponent_optional = (eris_pai_base + 8 + 1) % 256;
  skip
}

/* Eris Pai to the wire, 9 bytes from where the cursor stands */
inline encode_eris_pai(eris_pai_record) {
  eris_pai_at = 0;
  do
  :: eris_pai_at < 8 -> wire[at] = eris_pai_record.mantissa[eris_pai_at]; at = at + 1; eris_pai_at = eris_pai_at + 1
  :: else -> break
  od;
  wire[at] = eris_pai_record.exponent_optional; at = at + 1;
  skip
}

/* Eris Pai off the wire, 9 bytes from where the cursor stands */
inline decode_eris_pai(eris_pai_record) {
  eris_pai_at = 0;
  do
  :: eris_pai_at < 8 -> eris_pai_record.mantissa[eris_pai_at] = wire[at]; at = at + 1; eris_pai_at = eris_pai_at + 1
  :: else -> break
  od;
  eris_pai_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Eris Pai is what was written, byte for byte */
inline equal_eris_pai(eris_pai_read, eris_pai_written) {
  eris_pai_at = 0;
  do
  :: eris_pai_at < 8 -> assert(eris_pai_read.mantissa[eris_pai_at] == eris_pai_written.mantissa[eris_pai_at]); eris_pai_at = eris_pai_at + 1
  :: else -> break
  od;
  assert(eris_pai_read.exponent_optional == eris_pai_written.exponent_optional);
  skip
}

/* ---- Fed Funds Rate: 9 bytes ------------------------------------------------- */

/* Number of entries in Market Data message. */
typedef FedFundsRate {
  byte mantissa[8];
  byte exponent_optional
};

int fed_funds_rate_at;

/* every byte of Fed Funds Rate set to one value */
inline fill_fed_funds_rate(fed_funds_rate_record, fed_funds_rate_value) {
  fed_funds_rate_at = 0;
  do
  :: fed_funds_rate_at < 8 -> fed_funds_rate_record.mantissa[fed_funds_rate_at] = fed_funds_rate_value; fed_funds_rate_at = fed_funds_rate_at + 1
  :: else -> break
  od;
  fed_funds_rate_record.exponent_optional = fed_funds_rate_value;
  skip
}

/* each byte of Fed Funds Rate set to where it lies, so a field read out of place says so */
inline ramp_fed_funds_rate(fed_funds_rate_record, fed_funds_rate_base) {
  fed_funds_rate_at = 0;
  do
  :: fed_funds_rate_at < 8 -> fed_funds_rate_record.mantissa[fed_funds_rate_at] = (fed_funds_rate_base + 0 + fed_funds_rate_at + 1) % 256; fed_funds_rate_at = fed_funds_rate_at + 1
  :: else -> break
  od;
  fed_funds_rate_record.exponent_optional = (fed_funds_rate_base + 8 + 1) % 256;
  skip
}

/* Fed Funds Rate to the wire, 9 bytes from where the cursor stands */
inline encode_fed_funds_rate(fed_funds_rate_record) {
  fed_funds_rate_at = 0;
  do
  :: fed_funds_rate_at < 8 -> wire[at] = fed_funds_rate_record.mantissa[fed_funds_rate_at]; at = at + 1; fed_funds_rate_at = fed_funds_rate_at + 1
  :: else -> break
  od;
  wire[at] = fed_funds_rate_record.exponent_optional; at = at + 1;
  skip
}

/* Fed Funds Rate off the wire, 9 bytes from where the cursor stands */
inline decode_fed_funds_rate(fed_funds_rate_record) {
  fed_funds_rate_at = 0;
  do
  :: fed_funds_rate_at < 8 -> fed_funds_rate_record.mantissa[fed_funds_rate_at] = wire[at]; at = at + 1; fed_funds_rate_at = fed_funds_rate_at + 1
  :: else -> break
  od;
  fed_funds_rate_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Fed Funds Rate is what was written, byte for byte */
inline equal_fed_funds_rate(fed_funds_rate_read, fed_funds_rate_written) {
  fed_funds_rate_at = 0;
  do
  :: fed_funds_rate_at < 8 -> assert(fed_funds_rate_read.mantissa[fed_funds_rate_at] == fed_funds_rate_written.mantissa[fed_funds_rate_at]); fed_funds_rate_at = fed_funds_rate_at + 1
  :: else -> break
  od;
  assert(fed_funds_rate_read.exponent_optional == fed_funds_rate_written.exponent_optional);
  skip
}

/* ---- Min Price Increment Optional: 9 bytes ----------------------------------- */

/* Number of entries in Market Data message. */
typedef MinPriceIncrementOptional {
  byte mantissa[8];
  byte exponent_optional
};

int min_price_increment_optional_at;

/* every byte of Min Price Increment Optional set to one value */
inline fill_min_price_increment_optional(min_price_increment_optional_record, min_price_increment_optional_value) {
  min_price_increment_optional_at = 0;
  do
  :: min_price_increment_optional_at < 8 -> min_price_increment_optional_record.mantissa[min_price_increment_optional_at] = min_price_increment_optional_value; min_price_increment_optional_at = min_price_increment_optional_at + 1
  :: else -> break
  od;
  min_price_increment_optional_record.exponent_optional = min_price_increment_optional_value;
  skip
}

/* each byte of Min Price Increment Optional set to where it lies, so a field read out of place says so */
inline ramp_min_price_increment_optional(min_price_increment_optional_record, min_price_increment_optional_base) {
  min_price_increment_optional_at = 0;
  do
  :: min_price_increment_optional_at < 8 -> min_price_increment_optional_record.mantissa[min_price_increment_optional_at] = (min_price_increment_optional_base + 0 + min_price_increment_optional_at + 1) % 256; min_price_increment_optional_at = min_price_increment_optional_at + 1
  :: else -> break
  od;
  min_price_increment_optional_record.exponent_optional = (min_price_increment_optional_base + 8 + 1) % 256;
  skip
}

/* Min Price Increment Optional to the wire, 9 bytes from where the cursor stands */
inline encode_min_price_increment_optional(min_price_increment_optional_record) {
  min_price_increment_optional_at = 0;
  do
  :: min_price_increment_optional_at < 8 -> wire[at] = min_price_increment_optional_record.mantissa[min_price_increment_optional_at]; at = at + 1; min_price_increment_optional_at = min_price_increment_optional_at + 1
  :: else -> break
  od;
  wire[at] = min_price_increment_optional_record.exponent_optional; at = at + 1;
  skip
}

/* Min Price Increment Optional off the wire, 9 bytes from where the cursor stands */
inline decode_min_price_increment_optional(min_price_increment_optional_record) {
  min_price_increment_optional_at = 0;
  do
  :: min_price_increment_optional_at < 8 -> min_price_increment_optional_record.mantissa[min_price_increment_optional_at] = wire[at]; at = at + 1; min_price_increment_optional_at = min_price_increment_optional_at + 1
  :: else -> break
  od;
  min_price_increment_optional_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Min Price Increment Optional is what was written, byte for byte */
inline equal_min_price_increment_optional(min_price_increment_optional_read, min_price_increment_optional_written) {
  min_price_increment_optional_at = 0;
  do
  :: min_price_increment_optional_at < 8 -> assert(min_price_increment_optional_read.mantissa[min_price_increment_optional_at] == min_price_increment_optional_written.mantissa[min_price_increment_optional_at]); min_price_increment_optional_at = min_price_increment_optional_at + 1
  :: else -> break
  od;
  assert(min_price_increment_optional_read.exponent_optional == min_price_increment_optional_written.exponent_optional);
  skip
}

/* ---- Fixed Payment: 9 bytes -------------------------------------------------- */

/* Number of entries in Market Data message. */
typedef FixedPayment {
  byte mantissa[8];
  byte exponent_optional
};

int fixed_payment_at;

/* every byte of Fixed Payment set to one value */
inline fill_fixed_payment(fixed_payment_record, fixed_payment_value) {
  fixed_payment_at = 0;
  do
  :: fixed_payment_at < 8 -> fixed_payment_record.mantissa[fixed_payment_at] = fixed_payment_value; fixed_payment_at = fixed_payment_at + 1
  :: else -> break
  od;
  fixed_payment_record.exponent_optional = fixed_payment_value;
  skip
}

/* each byte of Fixed Payment set to where it lies, so a field read out of place says so */
inline ramp_fixed_payment(fixed_payment_record, fixed_payment_base) {
  fixed_payment_at = 0;
  do
  :: fixed_payment_at < 8 -> fixed_payment_record.mantissa[fixed_payment_at] = (fixed_payment_base + 0 + fixed_payment_at + 1) % 256; fixed_payment_at = fixed_payment_at + 1
  :: else -> break
  od;
  fixed_payment_record.exponent_optional = (fixed_payment_base + 8 + 1) % 256;
  skip
}

/* Fixed Payment to the wire, 9 bytes from where the cursor stands */
inline encode_fixed_payment(fixed_payment_record) {
  fixed_payment_at = 0;
  do
  :: fixed_payment_at < 8 -> wire[at] = fixed_payment_record.mantissa[fixed_payment_at]; at = at + 1; fixed_payment_at = fixed_payment_at + 1
  :: else -> break
  od;
  wire[at] = fixed_payment_record.exponent_optional; at = at + 1;
  skip
}

/* Fixed Payment off the wire, 9 bytes from where the cursor stands */
inline decode_fixed_payment(fixed_payment_record) {
  fixed_payment_at = 0;
  do
  :: fixed_payment_at < 8 -> fixed_payment_record.mantissa[fixed_payment_at] = wire[at]; at = at + 1; fixed_payment_at = fixed_payment_at + 1
  :: else -> break
  od;
  fixed_payment_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Fixed Payment is what was written, byte for byte */
inline equal_fixed_payment(fixed_payment_read, fixed_payment_written) {
  fixed_payment_at = 0;
  do
  :: fixed_payment_at < 8 -> assert(fixed_payment_read.mantissa[fixed_payment_at] == fixed_payment_written.mantissa[fixed_payment_at]); fixed_payment_at = fixed_payment_at + 1
  :: else -> break
  od;
  assert(fixed_payment_read.exponent_optional == fixed_payment_written.exponent_optional);
  skip
}

/* ---- Floating Payment: 9 bytes ----------------------------------------------- */

/* Number of entries in Market Data message. */
typedef FloatingPayment {
  byte mantissa[8];
  byte exponent_optional
};

int floating_payment_at;

/* every byte of Floating Payment set to one value */
inline fill_floating_payment(floating_payment_record, floating_payment_value) {
  floating_payment_at = 0;
  do
  :: floating_payment_at < 8 -> floating_payment_record.mantissa[floating_payment_at] = floating_payment_value; floating_payment_at = floating_payment_at + 1
  :: else -> break
  od;
  floating_payment_record.exponent_optional = floating_payment_value;
  skip
}

/* each byte of Floating Payment set to where it lies, so a field read out of place says so */
inline ramp_floating_payment(floating_payment_record, floating_payment_base) {
  floating_payment_at = 0;
  do
  :: floating_payment_at < 8 -> floating_payment_record.mantissa[floating_payment_at] = (floating_payment_base + 0 + floating_payment_at + 1) % 256; floating_payment_at = floating_payment_at + 1
  :: else -> break
  od;
  floating_payment_record.exponent_optional = (floating_payment_base + 8 + 1) % 256;
  skip
}

/* Floating Payment to the wire, 9 bytes from where the cursor stands */
inline encode_floating_payment(floating_payment_record) {
  floating_payment_at = 0;
  do
  :: floating_payment_at < 8 -> wire[at] = floating_payment_record.mantissa[floating_payment_at]; at = at + 1; floating_payment_at = floating_payment_at + 1
  :: else -> break
  od;
  wire[at] = floating_payment_record.exponent_optional; at = at + 1;
  skip
}

/* Floating Payment off the wire, 9 bytes from where the cursor stands */
inline decode_floating_payment(floating_payment_record) {
  floating_payment_at = 0;
  do
  :: floating_payment_at < 8 -> floating_payment_record.mantissa[floating_payment_at] = wire[at]; at = at + 1; floating_payment_at = floating_payment_at + 1
  :: else -> break
  od;
  floating_payment_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Floating Payment is what was written, byte for byte */
inline equal_floating_payment(floating_payment_read, floating_payment_written) {
  floating_payment_at = 0;
  do
  :: floating_payment_at < 8 -> assert(floating_payment_read.mantissa[floating_payment_at] == floating_payment_written.mantissa[floating_payment_at]); floating_payment_at = floating_payment_at + 1
  :: else -> break
  od;
  assert(floating_payment_read.exponent_optional == floating_payment_written.exponent_optional);
  skip
}

/* ---- Next Fixed Payment Amount: 9 bytes -------------------------------------- */

/* Number of entries in Market Data message. */
typedef NextFixedPaymentAmount {
  byte mantissa[8];
  byte exponent_optional
};

int next_fixed_payment_amount_at;

/* every byte of Next Fixed Payment Amount set to one value */
inline fill_next_fixed_payment_amount(next_fixed_payment_amount_record, next_fixed_payment_amount_value) {
  next_fixed_payment_amount_at = 0;
  do
  :: next_fixed_payment_amount_at < 8 -> next_fixed_payment_amount_record.mantissa[next_fixed_payment_amount_at] = next_fixed_payment_amount_value; next_fixed_payment_amount_at = next_fixed_payment_amount_at + 1
  :: else -> break
  od;
  next_fixed_payment_amount_record.exponent_optional = next_fixed_payment_amount_value;
  skip
}

/* each byte of Next Fixed Payment Amount set to where it lies, so a field read out of place says so */
inline ramp_next_fixed_payment_amount(next_fixed_payment_amount_record, next_fixed_payment_amount_base) {
  next_fixed_payment_amount_at = 0;
  do
  :: next_fixed_payment_amount_at < 8 -> next_fixed_payment_amount_record.mantissa[next_fixed_payment_amount_at] = (next_fixed_payment_amount_base + 0 + next_fixed_payment_amount_at + 1) % 256; next_fixed_payment_amount_at = next_fixed_payment_amount_at + 1
  :: else -> break
  od;
  next_fixed_payment_amount_record.exponent_optional = (next_fixed_payment_amount_base + 8 + 1) % 256;
  skip
}

/* Next Fixed Payment Amount to the wire, 9 bytes from where the cursor stands */
inline encode_next_fixed_payment_amount(next_fixed_payment_amount_record) {
  next_fixed_payment_amount_at = 0;
  do
  :: next_fixed_payment_amount_at < 8 -> wire[at] = next_fixed_payment_amount_record.mantissa[next_fixed_payment_amount_at]; at = at + 1; next_fixed_payment_amount_at = next_fixed_payment_amount_at + 1
  :: else -> break
  od;
  wire[at] = next_fixed_payment_amount_record.exponent_optional; at = at + 1;
  skip
}

/* Next Fixed Payment Amount off the wire, 9 bytes from where the cursor stands */
inline decode_next_fixed_payment_amount(next_fixed_payment_amount_record) {
  next_fixed_payment_amount_at = 0;
  do
  :: next_fixed_payment_amount_at < 8 -> next_fixed_payment_amount_record.mantissa[next_fixed_payment_amount_at] = wire[at]; at = at + 1; next_fixed_payment_amount_at = next_fixed_payment_amount_at + 1
  :: else -> break
  od;
  next_fixed_payment_amount_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Next Fixed Payment Amount is what was written, byte for byte */
inline equal_next_fixed_payment_amount(next_fixed_payment_amount_read, next_fixed_payment_amount_written) {
  next_fixed_payment_amount_at = 0;
  do
  :: next_fixed_payment_amount_at < 8 -> assert(next_fixed_payment_amount_read.mantissa[next_fixed_payment_amount_at] == next_fixed_payment_amount_written.mantissa[next_fixed_payment_amount_at]); next_fixed_payment_amount_at = next_fixed_payment_amount_at + 1
  :: else -> break
  od;
  assert(next_fixed_payment_amount_read.exponent_optional == next_fixed_payment_amount_written.exponent_optional);
  skip
}

/* ---- Next Floating Payment Amount: 9 bytes ----------------------------------- */

/* Number of entries in Market Data message. */
typedef NextFloatingPaymentAmount {
  byte mantissa[8];
  byte exponent_optional
};

int next_floating_payment_amount_at;

/* every byte of Next Floating Payment Amount set to one value */
inline fill_next_floating_payment_amount(next_floating_payment_amount_record, next_floating_payment_amount_value) {
  next_floating_payment_amount_at = 0;
  do
  :: next_floating_payment_amount_at < 8 -> next_floating_payment_amount_record.mantissa[next_floating_payment_amount_at] = next_floating_payment_amount_value; next_floating_payment_amount_at = next_floating_payment_amount_at + 1
  :: else -> break
  od;
  next_floating_payment_amount_record.exponent_optional = next_floating_payment_amount_value;
  skip
}

/* each byte of Next Floating Payment Amount set to where it lies, so a field read out of place says so */
inline ramp_next_floating_payment_amount(next_floating_payment_amount_record, next_floating_payment_amount_base) {
  next_floating_payment_amount_at = 0;
  do
  :: next_floating_payment_amount_at < 8 -> next_floating_payment_amount_record.mantissa[next_floating_payment_amount_at] = (next_floating_payment_amount_base + 0 + next_floating_payment_amount_at + 1) % 256; next_floating_payment_amount_at = next_floating_payment_amount_at + 1
  :: else -> break
  od;
  next_floating_payment_amount_record.exponent_optional = (next_floating_payment_amount_base + 8 + 1) % 256;
  skip
}

/* Next Floating Payment Amount to the wire, 9 bytes from where the cursor stands */
inline encode_next_floating_payment_amount(next_floating_payment_amount_record) {
  next_floating_payment_amount_at = 0;
  do
  :: next_floating_payment_amount_at < 8 -> wire[at] = next_floating_payment_amount_record.mantissa[next_floating_payment_amount_at]; at = at + 1; next_floating_payment_amount_at = next_floating_payment_amount_at + 1
  :: else -> break
  od;
  wire[at] = next_floating_payment_amount_record.exponent_optional; at = at + 1;
  skip
}

/* Next Floating Payment Amount off the wire, 9 bytes from where the cursor stands */
inline decode_next_floating_payment_amount(next_floating_payment_amount_record) {
  next_floating_payment_amount_at = 0;
  do
  :: next_floating_payment_amount_at < 8 -> next_floating_payment_amount_record.mantissa[next_floating_payment_amount_at] = wire[at]; at = at + 1; next_floating_payment_amount_at = next_floating_payment_amount_at + 1
  :: else -> break
  od;
  next_floating_payment_amount_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Next Floating Payment Amount is what was written, byte for byte */
inline equal_next_floating_payment_amount(next_floating_payment_amount_read, next_floating_payment_amount_written) {
  next_floating_payment_amount_at = 0;
  do
  :: next_floating_payment_amount_at < 8 -> assert(next_floating_payment_amount_read.mantissa[next_floating_payment_amount_at] == next_floating_payment_amount_written.mantissa[next_floating_payment_amount_at]); next_floating_payment_amount_at = next_floating_payment_amount_at + 1
  :: else -> break
  od;
  assert(next_floating_payment_amount_read.exponent_optional == next_floating_payment_amount_written.exponent_optional);
  skip
}

/* ---- Previous Eris Pai: 9 bytes ---------------------------------------------- */

/* Number of entries in Market Data message. */
typedef PreviousErisPai {
  byte mantissa[8];
  byte exponent_optional
};

int previous_eris_pai_at;

/* every byte of Previous Eris Pai set to one value */
inline fill_previous_eris_pai(previous_eris_pai_record, previous_eris_pai_value) {
  previous_eris_pai_at = 0;
  do
  :: previous_eris_pai_at < 8 -> previous_eris_pai_record.mantissa[previous_eris_pai_at] = previous_eris_pai_value; previous_eris_pai_at = previous_eris_pai_at + 1
  :: else -> break
  od;
  previous_eris_pai_record.exponent_optional = previous_eris_pai_value;
  skip
}

/* each byte of Previous Eris Pai set to where it lies, so a field read out of place says so */
inline ramp_previous_eris_pai(previous_eris_pai_record, previous_eris_pai_base) {
  previous_eris_pai_at = 0;
  do
  :: previous_eris_pai_at < 8 -> previous_eris_pai_record.mantissa[previous_eris_pai_at] = (previous_eris_pai_base + 0 + previous_eris_pai_at + 1) % 256; previous_eris_pai_at = previous_eris_pai_at + 1
  :: else -> break
  od;
  previous_eris_pai_record.exponent_optional = (previous_eris_pai_base + 8 + 1) % 256;
  skip
}

/* Previous Eris Pai to the wire, 9 bytes from where the cursor stands */
inline encode_previous_eris_pai(previous_eris_pai_record) {
  previous_eris_pai_at = 0;
  do
  :: previous_eris_pai_at < 8 -> wire[at] = previous_eris_pai_record.mantissa[previous_eris_pai_at]; at = at + 1; previous_eris_pai_at = previous_eris_pai_at + 1
  :: else -> break
  od;
  wire[at] = previous_eris_pai_record.exponent_optional; at = at + 1;
  skip
}

/* Previous Eris Pai off the wire, 9 bytes from where the cursor stands */
inline decode_previous_eris_pai(previous_eris_pai_record) {
  previous_eris_pai_at = 0;
  do
  :: previous_eris_pai_at < 8 -> previous_eris_pai_record.mantissa[previous_eris_pai_at] = wire[at]; at = at + 1; previous_eris_pai_at = previous_eris_pai_at + 1
  :: else -> break
  od;
  previous_eris_pai_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Previous Eris Pai is what was written, byte for byte */
inline equal_previous_eris_pai(previous_eris_pai_read, previous_eris_pai_written) {
  previous_eris_pai_at = 0;
  do
  :: previous_eris_pai_at < 8 -> assert(previous_eris_pai_read.mantissa[previous_eris_pai_at] == previous_eris_pai_written.mantissa[previous_eris_pai_at]); previous_eris_pai_at = previous_eris_pai_at + 1
  :: else -> break
  od;
  assert(previous_eris_pai_read.exponent_optional == previous_eris_pai_written.exponent_optional);
  skip
}

/* ---- Leg Contract Multiplier: 9 bytes ---------------------------------------- */

/* Number of entries in Market Data message. */
typedef LegContractMultiplier {
  byte mantissa[8];
  byte exponent_optional
};

int leg_contract_multiplier_at;

/* every byte of Leg Contract Multiplier set to one value */
inline fill_leg_contract_multiplier(leg_contract_multiplier_record, leg_contract_multiplier_value) {
  leg_contract_multiplier_at = 0;
  do
  :: leg_contract_multiplier_at < 8 -> leg_contract_multiplier_record.mantissa[leg_contract_multiplier_at] = leg_contract_multiplier_value; leg_contract_multiplier_at = leg_contract_multiplier_at + 1
  :: else -> break
  od;
  leg_contract_multiplier_record.exponent_optional = leg_contract_multiplier_value;
  skip
}

/* each byte of Leg Contract Multiplier set to where it lies, so a field read out of place says so */
inline ramp_leg_contract_multiplier(leg_contract_multiplier_record, leg_contract_multiplier_base) {
  leg_contract_multiplier_at = 0;
  do
  :: leg_contract_multiplier_at < 8 -> leg_contract_multiplier_record.mantissa[leg_contract_multiplier_at] = (leg_contract_multiplier_base + 0 + leg_contract_multiplier_at + 1) % 256; leg_contract_multiplier_at = leg_contract_multiplier_at + 1
  :: else -> break
  od;
  leg_contract_multiplier_record.exponent_optional = (leg_contract_multiplier_base + 8 + 1) % 256;
  skip
}

/* Leg Contract Multiplier to the wire, 9 bytes from where the cursor stands */
inline encode_leg_contract_multiplier(leg_contract_multiplier_record) {
  leg_contract_multiplier_at = 0;
  do
  :: leg_contract_multiplier_at < 8 -> wire[at] = leg_contract_multiplier_record.mantissa[leg_contract_multiplier_at]; at = at + 1; leg_contract_multiplier_at = leg_contract_multiplier_at + 1
  :: else -> break
  od;
  wire[at] = leg_contract_multiplier_record.exponent_optional; at = at + 1;
  skip
}

/* Leg Contract Multiplier off the wire, 9 bytes from where the cursor stands */
inline decode_leg_contract_multiplier(leg_contract_multiplier_record) {
  leg_contract_multiplier_at = 0;
  do
  :: leg_contract_multiplier_at < 8 -> leg_contract_multiplier_record.mantissa[leg_contract_multiplier_at] = wire[at]; at = at + 1; leg_contract_multiplier_at = leg_contract_multiplier_at + 1
  :: else -> break
  od;
  leg_contract_multiplier_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Leg Contract Multiplier is what was written, byte for byte */
inline equal_leg_contract_multiplier(leg_contract_multiplier_read, leg_contract_multiplier_written) {
  leg_contract_multiplier_at = 0;
  do
  :: leg_contract_multiplier_at < 8 -> assert(leg_contract_multiplier_read.mantissa[leg_contract_multiplier_at] == leg_contract_multiplier_written.mantissa[leg_contract_multiplier_at]); leg_contract_multiplier_at = leg_contract_multiplier_at + 1
  :: else -> break
  od;
  assert(leg_contract_multiplier_read.exponent_optional == leg_contract_multiplier_written.exponent_optional);
  skip
}

/* ---- P V 01: 9 bytes --------------------------------------------------------- */

/* Number of entries in Market Data message. */
typedef PV01 {
  byte mantissa[8];
  byte exponent_optional
};

int p_v01_at;

/* every byte of P V 01 set to one value */
inline fill_p_v01(p_v01_record, p_v01_value) {
  p_v01_at = 0;
  do
  :: p_v01_at < 8 -> p_v01_record.mantissa[p_v01_at] = p_v01_value; p_v01_at = p_v01_at + 1
  :: else -> break
  od;
  p_v01_record.exponent_optional = p_v01_value;
  skip
}

/* each byte of P V 01 set to where it lies, so a field read out of place says so */
inline ramp_p_v01(p_v01_record, p_v01_base) {
  p_v01_at = 0;
  do
  :: p_v01_at < 8 -> p_v01_record.mantissa[p_v01_at] = (p_v01_base + 0 + p_v01_at + 1) % 256; p_v01_at = p_v01_at + 1
  :: else -> break
  od;
  p_v01_record.exponent_optional = (p_v01_base + 8 + 1) % 256;
  skip
}

/* P V 01 to the wire, 9 bytes from where the cursor stands */
inline encode_p_v01(p_v01_record) {
  p_v01_at = 0;
  do
  :: p_v01_at < 8 -> wire[at] = p_v01_record.mantissa[p_v01_at]; at = at + 1; p_v01_at = p_v01_at + 1
  :: else -> break
  od;
  wire[at] = p_v01_record.exponent_optional; at = at + 1;
  skip
}

/* P V 01 off the wire, 9 bytes from where the cursor stands */
inline decode_p_v01(p_v01_record) {
  p_v01_at = 0;
  do
  :: p_v01_at < 8 -> p_v01_record.mantissa[p_v01_at] = wire[at]; at = at + 1; p_v01_at = p_v01_at + 1
  :: else -> break
  od;
  p_v01_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of P V 01 is what was written, byte for byte */
inline equal_p_v01(p_v01_read, p_v01_written) {
  p_v01_at = 0;
  do
  :: p_v01_at < 8 -> assert(p_v01_read.mantissa[p_v01_at] == p_v01_written.mantissa[p_v01_at]); p_v01_at = p_v01_at + 1
  :: else -> break
  od;
  assert(p_v01_read.exponent_optional == p_v01_written.exponent_optional);
  skip
}

/* ---- D V 01: 9 bytes --------------------------------------------------------- */

/* Number of entries in Market Data message. */
typedef DV01 {
  byte mantissa[8];
  byte exponent_optional
};

int d_v01_at;

/* every byte of D V 01 set to one value */
inline fill_d_v01(d_v01_record, d_v01_value) {
  d_v01_at = 0;
  do
  :: d_v01_at < 8 -> d_v01_record.mantissa[d_v01_at] = d_v01_value; d_v01_at = d_v01_at + 1
  :: else -> break
  od;
  d_v01_record.exponent_optional = d_v01_value;
  skip
}

/* each byte of D V 01 set to where it lies, so a field read out of place says so */
inline ramp_d_v01(d_v01_record, d_v01_base) {
  d_v01_at = 0;
  do
  :: d_v01_at < 8 -> d_v01_record.mantissa[d_v01_at] = (d_v01_base + 0 + d_v01_at + 1) % 256; d_v01_at = d_v01_at + 1
  :: else -> break
  od;
  d_v01_record.exponent_optional = (d_v01_base + 8 + 1) % 256;
  skip
}

/* D V 01 to the wire, 9 bytes from where the cursor stands */
inline encode_d_v01(d_v01_record) {
  d_v01_at = 0;
  do
  :: d_v01_at < 8 -> wire[at] = d_v01_record.mantissa[d_v01_at]; at = at + 1; d_v01_at = d_v01_at + 1
  :: else -> break
  od;
  wire[at] = d_v01_record.exponent_optional; at = at + 1;
  skip
}

/* D V 01 off the wire, 9 bytes from where the cursor stands */
inline decode_d_v01(d_v01_record) {
  d_v01_at = 0;
  do
  :: d_v01_at < 8 -> d_v01_record.mantissa[d_v01_at] = wire[at]; at = at + 1; d_v01_at = d_v01_at + 1
  :: else -> break
  od;
  d_v01_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of D V 01 is what was written, byte for byte */
inline equal_d_v01(d_v01_read, d_v01_written) {
  d_v01_at = 0;
  do
  :: d_v01_at < 8 -> assert(d_v01_read.mantissa[d_v01_at] == d_v01_written.mantissa[d_v01_at]); d_v01_at = d_v01_at + 1
  :: else -> break
  od;
  assert(d_v01_read.exponent_optional == d_v01_written.exponent_optional);
  skip
}

/* ---- Settlement Npv: 9 bytes ------------------------------------------------- */

/* Number of entries in Market Data message. */
typedef SettlementNpv {
  byte mantissa[8];
  byte exponent_optional
};

int settlement_npv_at;

/* every byte of Settlement Npv set to one value */
inline fill_settlement_npv(settlement_npv_record, settlement_npv_value) {
  settlement_npv_at = 0;
  do
  :: settlement_npv_at < 8 -> settlement_npv_record.mantissa[settlement_npv_at] = settlement_npv_value; settlement_npv_at = settlement_npv_at + 1
  :: else -> break
  od;
  settlement_npv_record.exponent_optional = settlement_npv_value;
  skip
}

/* each byte of Settlement Npv set to where it lies, so a field read out of place says so */
inline ramp_settlement_npv(settlement_npv_record, settlement_npv_base) {
  settlement_npv_at = 0;
  do
  :: settlement_npv_at < 8 -> settlement_npv_record.mantissa[settlement_npv_at] = (settlement_npv_base + 0 + settlement_npv_at + 1) % 256; settlement_npv_at = settlement_npv_at + 1
  :: else -> break
  od;
  settlement_npv_record.exponent_optional = (settlement_npv_base + 8 + 1) % 256;
  skip
}

/* Settlement Npv to the wire, 9 bytes from where the cursor stands */
inline encode_settlement_npv(settlement_npv_record) {
  settlement_npv_at = 0;
  do
  :: settlement_npv_at < 8 -> wire[at] = settlement_npv_record.mantissa[settlement_npv_at]; at = at + 1; settlement_npv_at = settlement_npv_at + 1
  :: else -> break
  od;
  wire[at] = settlement_npv_record.exponent_optional; at = at + 1;
  skip
}

/* Settlement Npv off the wire, 9 bytes from where the cursor stands */
inline decode_settlement_npv(settlement_npv_record) {
  settlement_npv_at = 0;
  do
  :: settlement_npv_at < 8 -> settlement_npv_record.mantissa[settlement_npv_at] = wire[at]; at = at + 1; settlement_npv_at = settlement_npv_at + 1
  :: else -> break
  od;
  settlement_npv_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Settlement Npv is what was written, byte for byte */
inline equal_settlement_npv(settlement_npv_read, settlement_npv_written) {
  settlement_npv_at = 0;
  do
  :: settlement_npv_at < 8 -> assert(settlement_npv_read.mantissa[settlement_npv_at] == settlement_npv_written.mantissa[settlement_npv_at]); settlement_npv_at = settlement_npv_at + 1
  :: else -> break
  od;
  assert(settlement_npv_read.exponent_optional == settlement_npv_written.exponent_optional);
  skip
}

/* ---- Final Settlement Futures Price: 9 bytes --------------------------------- */

/* Number of entries in Market Data message. */
typedef FinalSettlementFuturesPrice {
  byte mantissa[8];
  byte exponent_optional
};

int final_settlement_futures_price_at;

/* every byte of Final Settlement Futures Price set to one value */
inline fill_final_settlement_futures_price(final_settlement_futures_price_record, final_settlement_futures_price_value) {
  final_settlement_futures_price_at = 0;
  do
  :: final_settlement_futures_price_at < 8 -> final_settlement_futures_price_record.mantissa[final_settlement_futures_price_at] = final_settlement_futures_price_value; final_settlement_futures_price_at = final_settlement_futures_price_at + 1
  :: else -> break
  od;
  final_settlement_futures_price_record.exponent_optional = final_settlement_futures_price_value;
  skip
}

/* each byte of Final Settlement Futures Price set to where it lies, so a field read out of place says so */
inline ramp_final_settlement_futures_price(final_settlement_futures_price_record, final_settlement_futures_price_base) {
  final_settlement_futures_price_at = 0;
  do
  :: final_settlement_futures_price_at < 8 -> final_settlement_futures_price_record.mantissa[final_settlement_futures_price_at] = (final_settlement_futures_price_base + 0 + final_settlement_futures_price_at + 1) % 256; final_settlement_futures_price_at = final_settlement_futures_price_at + 1
  :: else -> break
  od;
  final_settlement_futures_price_record.exponent_optional = (final_settlement_futures_price_base + 8 + 1) % 256;
  skip
}

/* Final Settlement Futures Price to the wire, 9 bytes from where the cursor stands */
inline encode_final_settlement_futures_price(final_settlement_futures_price_record) {
  final_settlement_futures_price_at = 0;
  do
  :: final_settlement_futures_price_at < 8 -> wire[at] = final_settlement_futures_price_record.mantissa[final_settlement_futures_price_at]; at = at + 1; final_settlement_futures_price_at = final_settlement_futures_price_at + 1
  :: else -> break
  od;
  wire[at] = final_settlement_futures_price_record.exponent_optional; at = at + 1;
  skip
}

/* Final Settlement Futures Price off the wire, 9 bytes from where the cursor stands */
inline decode_final_settlement_futures_price(final_settlement_futures_price_record) {
  final_settlement_futures_price_at = 0;
  do
  :: final_settlement_futures_price_at < 8 -> final_settlement_futures_price_record.mantissa[final_settlement_futures_price_at] = wire[at]; at = at + 1; final_settlement_futures_price_at = final_settlement_futures_price_at + 1
  :: else -> break
  od;
  final_settlement_futures_price_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Final Settlement Futures Price is what was written, byte for byte */
inline equal_final_settlement_futures_price(final_settlement_futures_price_read, final_settlement_futures_price_written) {
  final_settlement_futures_price_at = 0;
  do
  :: final_settlement_futures_price_at < 8 -> assert(final_settlement_futures_price_read.mantissa[final_settlement_futures_price_at] == final_settlement_futures_price_written.mantissa[final_settlement_futures_price_at]); final_settlement_futures_price_at = final_settlement_futures_price_at + 1
  :: else -> break
  od;
  assert(final_settlement_futures_price_read.exponent_optional == final_settlement_futures_price_written.exponent_optional);
  skip
}

/* ---- Maturity Month Year: 5 bytes -------------------------------------------- */

/* Number of entries in Market Data message. */
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

/* ---- Underlying Maturity Month Year: 5 bytes --------------------------------- */

/* Number of underlying legs that make up the security */
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

/* ---- Leg Maturity Month Year: 5 bytes ---------------------------------------- */

/* Number of legs (repeating groups) */
typedef LegMaturityMonthYear {
  byte year[2];
  byte month;
  byte day;
  byte week
};

int leg_maturity_month_year_at;

/* every byte of Leg Maturity Month Year set to one value */
inline fill_leg_maturity_month_year(leg_maturity_month_year_record, leg_maturity_month_year_value) {
  leg_maturity_month_year_at = 0;
  do
  :: leg_maturity_month_year_at < 2 -> leg_maturity_month_year_record.year[leg_maturity_month_year_at] = leg_maturity_month_year_value; leg_maturity_month_year_at = leg_maturity_month_year_at + 1
  :: else -> break
  od;
  leg_maturity_month_year_record.month = leg_maturity_month_year_value;
  leg_maturity_month_year_record.day = leg_maturity_month_year_value;
  leg_maturity_month_year_record.week = leg_maturity_month_year_value;
  skip
}

/* each byte of Leg Maturity Month Year set to where it lies, so a field read out of place says so */
inline ramp_leg_maturity_month_year(leg_maturity_month_year_record, leg_maturity_month_year_base) {
  leg_maturity_month_year_at = 0;
  do
  :: leg_maturity_month_year_at < 2 -> leg_maturity_month_year_record.year[leg_maturity_month_year_at] = (leg_maturity_month_year_base + 0 + leg_maturity_month_year_at + 1) % 256; leg_maturity_month_year_at = leg_maturity_month_year_at + 1
  :: else -> break
  od;
  leg_maturity_month_year_record.month = (leg_maturity_month_year_base + 2 + 1) % 256;
  leg_maturity_month_year_record.day = (leg_maturity_month_year_base + 3 + 1) % 256;
  leg_maturity_month_year_record.week = (leg_maturity_month_year_base + 4 + 1) % 256;
  skip
}

/* Leg Maturity Month Year to the wire, 5 bytes from where the cursor stands */
inline encode_leg_maturity_month_year(leg_maturity_month_year_record) {
  leg_maturity_month_year_at = 0;
  do
  :: leg_maturity_month_year_at < 2 -> wire[at] = leg_maturity_month_year_record.year[leg_maturity_month_year_at]; at = at + 1; leg_maturity_month_year_at = leg_maturity_month_year_at + 1
  :: else -> break
  od;
  wire[at] = leg_maturity_month_year_record.month; at = at + 1;
  wire[at] = leg_maturity_month_year_record.day; at = at + 1;
  wire[at] = leg_maturity_month_year_record.week; at = at + 1;
  skip
}

/* Leg Maturity Month Year off the wire, 5 bytes from where the cursor stands */
inline decode_leg_maturity_month_year(leg_maturity_month_year_record) {
  leg_maturity_month_year_at = 0;
  do
  :: leg_maturity_month_year_at < 2 -> leg_maturity_month_year_record.year[leg_maturity_month_year_at] = wire[at]; at = at + 1; leg_maturity_month_year_at = leg_maturity_month_year_at + 1
  :: else -> break
  od;
  leg_maturity_month_year_record.month = wire[at]; at = at + 1;
  leg_maturity_month_year_record.day = wire[at]; at = at + 1;
  leg_maturity_month_year_record.week = wire[at]; at = at + 1;
  skip
}

/* what was read of Leg Maturity Month Year is what was written, byte for byte */
inline equal_leg_maturity_month_year(leg_maturity_month_year_read, leg_maturity_month_year_written) {
  leg_maturity_month_year_at = 0;
  do
  :: leg_maturity_month_year_at < 2 -> assert(leg_maturity_month_year_read.year[leg_maturity_month_year_at] == leg_maturity_month_year_written.year[leg_maturity_month_year_at]); leg_maturity_month_year_at = leg_maturity_month_year_at + 1
  :: else -> break
  od;
  assert(leg_maturity_month_year_read.month == leg_maturity_month_year_written.month);
  assert(leg_maturity_month_year_read.day == leg_maturity_month_year_written.day);
  assert(leg_maturity_month_year_read.week == leg_maturity_month_year_written.week);
  skip
}

/* ---- Group Size Encoding: 4 bytes -------------------------------------------- */

/* Repeating group dimensions */
typedef GroupSizeEncoding {
  byte block_length[2];
  byte num_in_group[2]
};

int group_size_encoding_at;

/* every byte of Group Size Encoding set to one value */
inline fill_group_size_encoding(group_size_encoding_record, group_size_encoding_value) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = group_size_encoding_value; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.num_in_group[group_size_encoding_at] = group_size_encoding_value; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Group Size Encoding set to where it lies, so a field read out of place says so */
inline ramp_group_size_encoding(group_size_encoding_record, group_size_encoding_base) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = (group_size_encoding_base + 0 + group_size_encoding_at + 1) % 256; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.num_in_group[group_size_encoding_at] = (group_size_encoding_base + 2 + group_size_encoding_at + 1) % 256; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* Group Size Encoding to the wire, 4 bytes from where the cursor stands */
inline encode_group_size_encoding(group_size_encoding_record) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> wire[at] = group_size_encoding_record.block_length[group_size_encoding_at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> wire[at] = group_size_encoding_record.num_in_group[group_size_encoding_at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* Group Size Encoding off the wire, 4 bytes from where the cursor stands */
inline decode_group_size_encoding(group_size_encoding_record) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = wire[at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.num_in_group[group_size_encoding_at] = wire[at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Group Size Encoding is what was written, byte for byte */
inline equal_group_size_encoding(group_size_encoding_read, group_size_encoding_written) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> assert(group_size_encoding_read.block_length[group_size_encoding_at] == group_size_encoding_written.block_length[group_size_encoding_at]); group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> assert(group_size_encoding_read.num_in_group[group_size_encoding_at] == group_size_encoding_written.num_in_group[group_size_encoding_at]); group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Md Entry Px Decimal: 9 bytes -------------------------------------------- */

/* Number of entries in Market Data message */
typedef MdEntryPxDecimal {
  byte mantissa[8];
  byte exponent
};

int md_entry_px_decimal_at;

/* every byte of Md Entry Px Decimal set to one value */
inline fill_md_entry_px_decimal(md_entry_px_decimal_record, md_entry_px_decimal_value) {
  md_entry_px_decimal_at = 0;
  do
  :: md_entry_px_decimal_at < 8 -> md_entry_px_decimal_record.mantissa[md_entry_px_decimal_at] = md_entry_px_decimal_value; md_entry_px_decimal_at = md_entry_px_decimal_at + 1
  :: else -> break
  od;
  md_entry_px_decimal_record.exponent = md_entry_px_decimal_value;
  skip
}

/* each byte of Md Entry Px Decimal set to where it lies, so a field read out of place says so */
inline ramp_md_entry_px_decimal(md_entry_px_decimal_record, md_entry_px_decimal_base) {
  md_entry_px_decimal_at = 0;
  do
  :: md_entry_px_decimal_at < 8 -> md_entry_px_decimal_record.mantissa[md_entry_px_decimal_at] = (md_entry_px_decimal_base + 0 + md_entry_px_decimal_at + 1) % 256; md_entry_px_decimal_at = md_entry_px_decimal_at + 1
  :: else -> break
  od;
  md_entry_px_decimal_record.exponent = (md_entry_px_decimal_base + 8 + 1) % 256;
  skip
}

/* Md Entry Px Decimal to the wire, 9 bytes from where the cursor stands */
inline encode_md_entry_px_decimal(md_entry_px_decimal_record) {
  md_entry_px_decimal_at = 0;
  do
  :: md_entry_px_decimal_at < 8 -> wire[at] = md_entry_px_decimal_record.mantissa[md_entry_px_decimal_at]; at = at + 1; md_entry_px_decimal_at = md_entry_px_decimal_at + 1
  :: else -> break
  od;
  wire[at] = md_entry_px_decimal_record.exponent; at = at + 1;
  skip
}

/* Md Entry Px Decimal off the wire, 9 bytes from where the cursor stands */
inline decode_md_entry_px_decimal(md_entry_px_decimal_record) {
  md_entry_px_decimal_at = 0;
  do
  :: md_entry_px_decimal_at < 8 -> md_entry_px_decimal_record.mantissa[md_entry_px_decimal_at] = wire[at]; at = at + 1; md_entry_px_decimal_at = md_entry_px_decimal_at + 1
  :: else -> break
  od;
  md_entry_px_decimal_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Md Entry Px Decimal is what was written, byte for byte */
inline equal_md_entry_px_decimal(md_entry_px_decimal_read, md_entry_px_decimal_written) {
  md_entry_px_decimal_at = 0;
  do
  :: md_entry_px_decimal_at < 8 -> assert(md_entry_px_decimal_read.mantissa[md_entry_px_decimal_at] == md_entry_px_decimal_written.mantissa[md_entry_px_decimal_at]); md_entry_px_decimal_at = md_entry_px_decimal_at + 1
  :: else -> break
  od;
  assert(md_entry_px_decimal_read.exponent == md_entry_px_decimal_written.exponent);
  skip
}

/* ---- Yield: 9 bytes ---------------------------------------------------------- */

/* Number of entries in Market Data message */
typedef Yield {
  byte mantissa[8];
  byte exponent
};

int yield_at;

/* every byte of Yield set to one value */
inline fill_yield(yield_record, yield_value) {
  yield_at = 0;
  do
  :: yield_at < 8 -> yield_record.mantissa[yield_at] = yield_value; yield_at = yield_at + 1
  :: else -> break
  od;
  yield_record.exponent = yield_value;
  skip
}

/* each byte of Yield set to where it lies, so a field read out of place says so */
inline ramp_yield(yield_record, yield_base) {
  yield_at = 0;
  do
  :: yield_at < 8 -> yield_record.mantissa[yield_at] = (yield_base + 0 + yield_at + 1) % 256; yield_at = yield_at + 1
  :: else -> break
  od;
  yield_record.exponent = (yield_base + 8 + 1) % 256;
  skip
}

/* Yield to the wire, 9 bytes from where the cursor stands */
inline encode_yield(yield_record) {
  yield_at = 0;
  do
  :: yield_at < 8 -> wire[at] = yield_record.mantissa[yield_at]; at = at + 1; yield_at = yield_at + 1
  :: else -> break
  od;
  wire[at] = yield_record.exponent; at = at + 1;
  skip
}

/* Yield off the wire, 9 bytes from where the cursor stands */
inline decode_yield(yield_record) {
  yield_at = 0;
  do
  :: yield_at < 8 -> yield_record.mantissa[yield_at] = wire[at]; at = at + 1; yield_at = yield_at + 1
  :: else -> break
  od;
  yield_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Yield is what was written, byte for byte */
inline equal_yield(yield_read, yield_written) {
  yield_at = 0;
  do
  :: yield_at < 8 -> assert(yield_read.mantissa[yield_at] == yield_written.mantissa[yield_at]); yield_at = yield_at + 1
  :: else -> break
  od;
  assert(yield_read.exponent == yield_written.exponent);
  skip
}

/* ---- Net Chg Prev Day: 9 bytes ----------------------------------------------- */

/* Number of entries in Market Data message */
typedef NetChgPrevDay {
  byte mantissa[8];
  byte exponent
};

int net_chg_prev_day_at;

/* every byte of Net Chg Prev Day set to one value */
inline fill_net_chg_prev_day(net_chg_prev_day_record, net_chg_prev_day_value) {
  net_chg_prev_day_at = 0;
  do
  :: net_chg_prev_day_at < 8 -> net_chg_prev_day_record.mantissa[net_chg_prev_day_at] = net_chg_prev_day_value; net_chg_prev_day_at = net_chg_prev_day_at + 1
  :: else -> break
  od;
  net_chg_prev_day_record.exponent = net_chg_prev_day_value;
  skip
}

/* each byte of Net Chg Prev Day set to where it lies, so a field read out of place says so */
inline ramp_net_chg_prev_day(net_chg_prev_day_record, net_chg_prev_day_base) {
  net_chg_prev_day_at = 0;
  do
  :: net_chg_prev_day_at < 8 -> net_chg_prev_day_record.mantissa[net_chg_prev_day_at] = (net_chg_prev_day_base + 0 + net_chg_prev_day_at + 1) % 256; net_chg_prev_day_at = net_chg_prev_day_at + 1
  :: else -> break
  od;
  net_chg_prev_day_record.exponent = (net_chg_prev_day_base + 8 + 1) % 256;
  skip
}

/* Net Chg Prev Day to the wire, 9 bytes from where the cursor stands */
inline encode_net_chg_prev_day(net_chg_prev_day_record) {
  net_chg_prev_day_at = 0;
  do
  :: net_chg_prev_day_at < 8 -> wire[at] = net_chg_prev_day_record.mantissa[net_chg_prev_day_at]; at = at + 1; net_chg_prev_day_at = net_chg_prev_day_at + 1
  :: else -> break
  od;
  wire[at] = net_chg_prev_day_record.exponent; at = at + 1;
  skip
}

/* Net Chg Prev Day off the wire, 9 bytes from where the cursor stands */
inline decode_net_chg_prev_day(net_chg_prev_day_record) {
  net_chg_prev_day_at = 0;
  do
  :: net_chg_prev_day_at < 8 -> net_chg_prev_day_record.mantissa[net_chg_prev_day_at] = wire[at]; at = at + 1; net_chg_prev_day_at = net_chg_prev_day_at + 1
  :: else -> break
  od;
  net_chg_prev_day_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Net Chg Prev Day is what was written, byte for byte */
inline equal_net_chg_prev_day(net_chg_prev_day_read, net_chg_prev_day_written) {
  net_chg_prev_day_at = 0;
  do
  :: net_chg_prev_day_at < 8 -> assert(net_chg_prev_day_read.mantissa[net_chg_prev_day_at] == net_chg_prev_day_written.mantissa[net_chg_prev_day_at]); net_chg_prev_day_at = net_chg_prev_day_at + 1
  :: else -> break
  od;
  assert(net_chg_prev_day_read.exponent == net_chg_prev_day_written.exponent);
  skip
}

/* ---- Net Pct Chg: 9 bytes ---------------------------------------------------- */

/* Number of entries in Market Data message */
typedef NetPctChg {
  byte mantissa[8];
  byte exponent
};

int net_pct_chg_at;

/* every byte of Net Pct Chg set to one value */
inline fill_net_pct_chg(net_pct_chg_record, net_pct_chg_value) {
  net_pct_chg_at = 0;
  do
  :: net_pct_chg_at < 8 -> net_pct_chg_record.mantissa[net_pct_chg_at] = net_pct_chg_value; net_pct_chg_at = net_pct_chg_at + 1
  :: else -> break
  od;
  net_pct_chg_record.exponent = net_pct_chg_value;
  skip
}

/* each byte of Net Pct Chg set to where it lies, so a field read out of place says so */
inline ramp_net_pct_chg(net_pct_chg_record, net_pct_chg_base) {
  net_pct_chg_at = 0;
  do
  :: net_pct_chg_at < 8 -> net_pct_chg_record.mantissa[net_pct_chg_at] = (net_pct_chg_base + 0 + net_pct_chg_at + 1) % 256; net_pct_chg_at = net_pct_chg_at + 1
  :: else -> break
  od;
  net_pct_chg_record.exponent = (net_pct_chg_base + 8 + 1) % 256;
  skip
}

/* Net Pct Chg to the wire, 9 bytes from where the cursor stands */
inline encode_net_pct_chg(net_pct_chg_record) {
  net_pct_chg_at = 0;
  do
  :: net_pct_chg_at < 8 -> wire[at] = net_pct_chg_record.mantissa[net_pct_chg_at]; at = at + 1; net_pct_chg_at = net_pct_chg_at + 1
  :: else -> break
  od;
  wire[at] = net_pct_chg_record.exponent; at = at + 1;
  skip
}

/* Net Pct Chg off the wire, 9 bytes from where the cursor stands */
inline decode_net_pct_chg(net_pct_chg_record) {
  net_pct_chg_at = 0;
  do
  :: net_pct_chg_at < 8 -> net_pct_chg_record.mantissa[net_pct_chg_at] = wire[at]; at = at + 1; net_pct_chg_at = net_pct_chg_at + 1
  :: else -> break
  od;
  net_pct_chg_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Net Pct Chg is what was written, byte for byte */
inline equal_net_pct_chg(net_pct_chg_read, net_pct_chg_written) {
  net_pct_chg_at = 0;
  do
  :: net_pct_chg_at < 8 -> assert(net_pct_chg_read.mantissa[net_pct_chg_at] == net_pct_chg_written.mantissa[net_pct_chg_at]); net_pct_chg_at = net_pct_chg_at + 1
  :: else -> break
  od;
  assert(net_pct_chg_read.exponent == net_pct_chg_written.exponent);
  skip
}

/* ---- Percent Trading: 9 bytes ------------------------------------------------ */

/* Number of entries in Market Data message */
typedef PercentTrading {
  byte mantissa[8];
  byte exponent
};

int percent_trading_at;

/* every byte of Percent Trading set to one value */
inline fill_percent_trading(percent_trading_record, percent_trading_value) {
  percent_trading_at = 0;
  do
  :: percent_trading_at < 8 -> percent_trading_record.mantissa[percent_trading_at] = percent_trading_value; percent_trading_at = percent_trading_at + 1
  :: else -> break
  od;
  percent_trading_record.exponent = percent_trading_value;
  skip
}

/* each byte of Percent Trading set to where it lies, so a field read out of place says so */
inline ramp_percent_trading(percent_trading_record, percent_trading_base) {
  percent_trading_at = 0;
  do
  :: percent_trading_at < 8 -> percent_trading_record.mantissa[percent_trading_at] = (percent_trading_base + 0 + percent_trading_at + 1) % 256; percent_trading_at = percent_trading_at + 1
  :: else -> break
  od;
  percent_trading_record.exponent = (percent_trading_base + 8 + 1) % 256;
  skip
}

/* Percent Trading to the wire, 9 bytes from where the cursor stands */
inline encode_percent_trading(percent_trading_record) {
  percent_trading_at = 0;
  do
  :: percent_trading_at < 8 -> wire[at] = percent_trading_record.mantissa[percent_trading_at]; at = at + 1; percent_trading_at = percent_trading_at + 1
  :: else -> break
  od;
  wire[at] = percent_trading_record.exponent; at = at + 1;
  skip
}

/* Percent Trading off the wire, 9 bytes from where the cursor stands */
inline decode_percent_trading(percent_trading_record) {
  percent_trading_at = 0;
  do
  :: percent_trading_at < 8 -> percent_trading_record.mantissa[percent_trading_at] = wire[at]; at = at + 1; percent_trading_at = percent_trading_at + 1
  :: else -> break
  od;
  percent_trading_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Percent Trading is what was written, byte for byte */
inline equal_percent_trading(percent_trading_read, percent_trading_written) {
  percent_trading_at = 0;
  do
  :: percent_trading_at < 8 -> assert(percent_trading_read.mantissa[percent_trading_at] == percent_trading_written.mantissa[percent_trading_at]); percent_trading_at = percent_trading_at + 1
  :: else -> break
  od;
  assert(percent_trading_read.exponent == percent_trading_written.exponent);
  skip
}

/* ---- Md Entry Size: 9 bytes -------------------------------------------------- */

/* Number of entries in Market Data message. */
typedef MdEntrySize {
  byte mantissa[8];
  byte exponent
};

int md_entry_size_at;

/* every byte of Md Entry Size set to one value */
inline fill_md_entry_size(md_entry_size_record, md_entry_size_value) {
  md_entry_size_at = 0;
  do
  :: md_entry_size_at < 8 -> md_entry_size_record.mantissa[md_entry_size_at] = md_entry_size_value; md_entry_size_at = md_entry_size_at + 1
  :: else -> break
  od;
  md_entry_size_record.exponent = md_entry_size_value;
  skip
}

/* each byte of Md Entry Size set to where it lies, so a field read out of place says so */
inline ramp_md_entry_size(md_entry_size_record, md_entry_size_base) {
  md_entry_size_at = 0;
  do
  :: md_entry_size_at < 8 -> md_entry_size_record.mantissa[md_entry_size_at] = (md_entry_size_base + 0 + md_entry_size_at + 1) % 256; md_entry_size_at = md_entry_size_at + 1
  :: else -> break
  od;
  md_entry_size_record.exponent = (md_entry_size_base + 8 + 1) % 256;
  skip
}

/* Md Entry Size to the wire, 9 bytes from where the cursor stands */
inline encode_md_entry_size(md_entry_size_record) {
  md_entry_size_at = 0;
  do
  :: md_entry_size_at < 8 -> wire[at] = md_entry_size_record.mantissa[md_entry_size_at]; at = at + 1; md_entry_size_at = md_entry_size_at + 1
  :: else -> break
  od;
  wire[at] = md_entry_size_record.exponent; at = at + 1;
  skip
}

/* Md Entry Size off the wire, 9 bytes from where the cursor stands */
inline decode_md_entry_size(md_entry_size_record) {
  md_entry_size_at = 0;
  do
  :: md_entry_size_at < 8 -> md_entry_size_record.mantissa[md_entry_size_at] = wire[at]; at = at + 1; md_entry_size_at = md_entry_size_at + 1
  :: else -> break
  od;
  md_entry_size_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Md Entry Size is what was written, byte for byte */
inline equal_md_entry_size(md_entry_size_read, md_entry_size_written) {
  md_entry_size_at = 0;
  do
  :: md_entry_size_at < 8 -> assert(md_entry_size_read.mantissa[md_entry_size_at] == md_entry_size_written.mantissa[md_entry_size_at]); md_entry_size_at = md_entry_size_at + 1
  :: else -> break
  od;
  assert(md_entry_size_read.exponent == md_entry_size_written.exponent);
  skip
}

/* ---- Cal Fut Px: 9 bytes ----------------------------------------------------- */

/* Number of entries in Market Data message. */
typedef CalFutPx {
  byte mantissa[8];
  byte exponent
};

int cal_fut_px_at;

/* every byte of Cal Fut Px set to one value */
inline fill_cal_fut_px(cal_fut_px_record, cal_fut_px_value) {
  cal_fut_px_at = 0;
  do
  :: cal_fut_px_at < 8 -> cal_fut_px_record.mantissa[cal_fut_px_at] = cal_fut_px_value; cal_fut_px_at = cal_fut_px_at + 1
  :: else -> break
  od;
  cal_fut_px_record.exponent = cal_fut_px_value;
  skip
}

/* each byte of Cal Fut Px set to where it lies, so a field read out of place says so */
inline ramp_cal_fut_px(cal_fut_px_record, cal_fut_px_base) {
  cal_fut_px_at = 0;
  do
  :: cal_fut_px_at < 8 -> cal_fut_px_record.mantissa[cal_fut_px_at] = (cal_fut_px_base + 0 + cal_fut_px_at + 1) % 256; cal_fut_px_at = cal_fut_px_at + 1
  :: else -> break
  od;
  cal_fut_px_record.exponent = (cal_fut_px_base + 8 + 1) % 256;
  skip
}

/* Cal Fut Px to the wire, 9 bytes from where the cursor stands */
inline encode_cal_fut_px(cal_fut_px_record) {
  cal_fut_px_at = 0;
  do
  :: cal_fut_px_at < 8 -> wire[at] = cal_fut_px_record.mantissa[cal_fut_px_at]; at = at + 1; cal_fut_px_at = cal_fut_px_at + 1
  :: else -> break
  od;
  wire[at] = cal_fut_px_record.exponent; at = at + 1;
  skip
}

/* Cal Fut Px off the wire, 9 bytes from where the cursor stands */
inline decode_cal_fut_px(cal_fut_px_record) {
  cal_fut_px_at = 0;
  do
  :: cal_fut_px_at < 8 -> cal_fut_px_record.mantissa[cal_fut_px_at] = wire[at]; at = at + 1; cal_fut_px_at = cal_fut_px_at + 1
  :: else -> break
  od;
  cal_fut_px_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Cal Fut Px is what was written, byte for byte */
inline equal_cal_fut_px(cal_fut_px_read, cal_fut_px_written) {
  cal_fut_px_at = 0;
  do
  :: cal_fut_px_at < 8 -> assert(cal_fut_px_read.mantissa[cal_fut_px_at] == cal_fut_px_written.mantissa[cal_fut_px_at]); cal_fut_px_at = cal_fut_px_at + 1
  :: else -> break
  od;
  assert(cal_fut_px_read.exponent == cal_fut_px_written.exponent);
  skip
}

/* ---- Strike Price Decimal: 9 bytes ------------------------------------------- */

/* Number of entries in Market Data message. */
typedef StrikePriceDecimal {
  byte mantissa[8];
  byte exponent
};

int strike_price_decimal_at;

/* every byte of Strike Price Decimal set to one value */
inline fill_strike_price_decimal(strike_price_decimal_record, strike_price_decimal_value) {
  strike_price_decimal_at = 0;
  do
  :: strike_price_decimal_at < 8 -> strike_price_decimal_record.mantissa[strike_price_decimal_at] = strike_price_decimal_value; strike_price_decimal_at = strike_price_decimal_at + 1
  :: else -> break
  od;
  strike_price_decimal_record.exponent = strike_price_decimal_value;
  skip
}

/* each byte of Strike Price Decimal set to where it lies, so a field read out of place says so */
inline ramp_strike_price_decimal(strike_price_decimal_record, strike_price_decimal_base) {
  strike_price_decimal_at = 0;
  do
  :: strike_price_decimal_at < 8 -> strike_price_decimal_record.mantissa[strike_price_decimal_at] = (strike_price_decimal_base + 0 + strike_price_decimal_at + 1) % 256; strike_price_decimal_at = strike_price_decimal_at + 1
  :: else -> break
  od;
  strike_price_decimal_record.exponent = (strike_price_decimal_base + 8 + 1) % 256;
  skip
}

/* Strike Price Decimal to the wire, 9 bytes from where the cursor stands */
inline encode_strike_price_decimal(strike_price_decimal_record) {
  strike_price_decimal_at = 0;
  do
  :: strike_price_decimal_at < 8 -> wire[at] = strike_price_decimal_record.mantissa[strike_price_decimal_at]; at = at + 1; strike_price_decimal_at = strike_price_decimal_at + 1
  :: else -> break
  od;
  wire[at] = strike_price_decimal_record.exponent; at = at + 1;
  skip
}

/* Strike Price Decimal off the wire, 9 bytes from where the cursor stands */
inline decode_strike_price_decimal(strike_price_decimal_record) {
  strike_price_decimal_at = 0;
  do
  :: strike_price_decimal_at < 8 -> strike_price_decimal_record.mantissa[strike_price_decimal_at] = wire[at]; at = at + 1; strike_price_decimal_at = strike_price_decimal_at + 1
  :: else -> break
  od;
  strike_price_decimal_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Strike Price Decimal is what was written, byte for byte */
inline equal_strike_price_decimal(strike_price_decimal_read, strike_price_decimal_written) {
  strike_price_decimal_at = 0;
  do
  :: strike_price_decimal_at < 8 -> assert(strike_price_decimal_read.mantissa[strike_price_decimal_at] == strike_price_decimal_written.mantissa[strike_price_decimal_at]); strike_price_decimal_at = strike_price_decimal_at + 1
  :: else -> break
  od;
  assert(strike_price_decimal_read.exponent == strike_price_decimal_written.exponent);
  skip
}

/* ---- Unit Of Measure Qty Decimal: 9 bytes ------------------------------------ */

/* Number of entries in Market Data message. */
typedef UnitOfMeasureQtyDecimal {
  byte mantissa[8];
  byte exponent
};

int unit_of_measure_qty_decimal_at;

/* every byte of Unit Of Measure Qty Decimal set to one value */
inline fill_unit_of_measure_qty_decimal(unit_of_measure_qty_decimal_record, unit_of_measure_qty_decimal_value) {
  unit_of_measure_qty_decimal_at = 0;
  do
  :: unit_of_measure_qty_decimal_at < 8 -> unit_of_measure_qty_decimal_record.mantissa[unit_of_measure_qty_decimal_at] = unit_of_measure_qty_decimal_value; unit_of_measure_qty_decimal_at = unit_of_measure_qty_decimal_at + 1
  :: else -> break
  od;
  unit_of_measure_qty_decimal_record.exponent = unit_of_measure_qty_decimal_value;
  skip
}

/* each byte of Unit Of Measure Qty Decimal set to where it lies, so a field read out of place says so */
inline ramp_unit_of_measure_qty_decimal(unit_of_measure_qty_decimal_record, unit_of_measure_qty_decimal_base) {
  unit_of_measure_qty_decimal_at = 0;
  do
  :: unit_of_measure_qty_decimal_at < 8 -> unit_of_measure_qty_decimal_record.mantissa[unit_of_measure_qty_decimal_at] = (unit_of_measure_qty_decimal_base + 0 + unit_of_measure_qty_decimal_at + 1) % 256; unit_of_measure_qty_decimal_at = unit_of_measure_qty_decimal_at + 1
  :: else -> break
  od;
  unit_of_measure_qty_decimal_record.exponent = (unit_of_measure_qty_decimal_base + 8 + 1) % 256;
  skip
}

/* Unit Of Measure Qty Decimal to the wire, 9 bytes from where the cursor stands */
inline encode_unit_of_measure_qty_decimal(unit_of_measure_qty_decimal_record) {
  unit_of_measure_qty_decimal_at = 0;
  do
  :: unit_of_measure_qty_decimal_at < 8 -> wire[at] = unit_of_measure_qty_decimal_record.mantissa[unit_of_measure_qty_decimal_at]; at = at + 1; unit_of_measure_qty_decimal_at = unit_of_measure_qty_decimal_at + 1
  :: else -> break
  od;
  wire[at] = unit_of_measure_qty_decimal_record.exponent; at = at + 1;
  skip
}

/* Unit Of Measure Qty Decimal off the wire, 9 bytes from where the cursor stands */
inline decode_unit_of_measure_qty_decimal(unit_of_measure_qty_decimal_record) {
  unit_of_measure_qty_decimal_at = 0;
  do
  :: unit_of_measure_qty_decimal_at < 8 -> unit_of_measure_qty_decimal_record.mantissa[unit_of_measure_qty_decimal_at] = wire[at]; at = at + 1; unit_of_measure_qty_decimal_at = unit_of_measure_qty_decimal_at + 1
  :: else -> break
  od;
  unit_of_measure_qty_decimal_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Unit Of Measure Qty Decimal is what was written, byte for byte */
inline equal_unit_of_measure_qty_decimal(unit_of_measure_qty_decimal_read, unit_of_measure_qty_decimal_written) {
  unit_of_measure_qty_decimal_at = 0;
  do
  :: unit_of_measure_qty_decimal_at < 8 -> assert(unit_of_measure_qty_decimal_read.mantissa[unit_of_measure_qty_decimal_at] == unit_of_measure_qty_decimal_written.mantissa[unit_of_measure_qty_decimal_at]); unit_of_measure_qty_decimal_at = unit_of_measure_qty_decimal_at + 1
  :: else -> break
  od;
  assert(unit_of_measure_qty_decimal_read.exponent == unit_of_measure_qty_decimal_written.exponent);
  skip
}

/* ---- Min Price Increment: 9 bytes -------------------------------------------- */

/* MDInstrumentDefinitionEris */
typedef MinPriceIncrement {
  byte mantissa[8];
  byte exponent
};

int min_price_increment_at;

/* every byte of Min Price Increment set to one value */
inline fill_min_price_increment(min_price_increment_record, min_price_increment_value) {
  min_price_increment_at = 0;
  do
  :: min_price_increment_at < 8 -> min_price_increment_record.mantissa[min_price_increment_at] = min_price_increment_value; min_price_increment_at = min_price_increment_at + 1
  :: else -> break
  od;
  min_price_increment_record.exponent = min_price_increment_value;
  skip
}

/* each byte of Min Price Increment set to where it lies, so a field read out of place says so */
inline ramp_min_price_increment(min_price_increment_record, min_price_increment_base) {
  min_price_increment_at = 0;
  do
  :: min_price_increment_at < 8 -> min_price_increment_record.mantissa[min_price_increment_at] = (min_price_increment_base + 0 + min_price_increment_at + 1) % 256; min_price_increment_at = min_price_increment_at + 1
  :: else -> break
  od;
  min_price_increment_record.exponent = (min_price_increment_base + 8 + 1) % 256;
  skip
}

/* Min Price Increment to the wire, 9 bytes from where the cursor stands */
inline encode_min_price_increment(min_price_increment_record) {
  min_price_increment_at = 0;
  do
  :: min_price_increment_at < 8 -> wire[at] = min_price_increment_record.mantissa[min_price_increment_at]; at = at + 1; min_price_increment_at = min_price_increment_at + 1
  :: else -> break
  od;
  wire[at] = min_price_increment_record.exponent; at = at + 1;
  skip
}

/* Min Price Increment off the wire, 9 bytes from where the cursor stands */
inline decode_min_price_increment(min_price_increment_record) {
  min_price_increment_at = 0;
  do
  :: min_price_increment_at < 8 -> min_price_increment_record.mantissa[min_price_increment_at] = wire[at]; at = at + 1; min_price_increment_at = min_price_increment_at + 1
  :: else -> break
  od;
  min_price_increment_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Min Price Increment is what was written, byte for byte */
inline equal_min_price_increment(min_price_increment_read, min_price_increment_written) {
  min_price_increment_at = 0;
  do
  :: min_price_increment_at < 8 -> assert(min_price_increment_read.mantissa[min_price_increment_at] == min_price_increment_written.mantissa[min_price_increment_at]); min_price_increment_at = min_price_increment_at + 1
  :: else -> break
  od;
  assert(min_price_increment_read.exponent == min_price_increment_written.exponent);
  skip
}

/* ---- Previous Fixing Rate: 9 bytes ------------------------------------------- */

/* Number of legs (repeating groups) */
typedef PreviousFixingRate {
  byte mantissa[8];
  byte exponent
};

int previous_fixing_rate_at;

/* every byte of Previous Fixing Rate set to one value */
inline fill_previous_fixing_rate(previous_fixing_rate_record, previous_fixing_rate_value) {
  previous_fixing_rate_at = 0;
  do
  :: previous_fixing_rate_at < 8 -> previous_fixing_rate_record.mantissa[previous_fixing_rate_at] = previous_fixing_rate_value; previous_fixing_rate_at = previous_fixing_rate_at + 1
  :: else -> break
  od;
  previous_fixing_rate_record.exponent = previous_fixing_rate_value;
  skip
}

/* each byte of Previous Fixing Rate set to where it lies, so a field read out of place says so */
inline ramp_previous_fixing_rate(previous_fixing_rate_record, previous_fixing_rate_base) {
  previous_fixing_rate_at = 0;
  do
  :: previous_fixing_rate_at < 8 -> previous_fixing_rate_record.mantissa[previous_fixing_rate_at] = (previous_fixing_rate_base + 0 + previous_fixing_rate_at + 1) % 256; previous_fixing_rate_at = previous_fixing_rate_at + 1
  :: else -> break
  od;
  previous_fixing_rate_record.exponent = (previous_fixing_rate_base + 8 + 1) % 256;
  skip
}

/* Previous Fixing Rate to the wire, 9 bytes from where the cursor stands */
inline encode_previous_fixing_rate(previous_fixing_rate_record) {
  previous_fixing_rate_at = 0;
  do
  :: previous_fixing_rate_at < 8 -> wire[at] = previous_fixing_rate_record.mantissa[previous_fixing_rate_at]; at = at + 1; previous_fixing_rate_at = previous_fixing_rate_at + 1
  :: else -> break
  od;
  wire[at] = previous_fixing_rate_record.exponent; at = at + 1;
  skip
}

/* Previous Fixing Rate off the wire, 9 bytes from where the cursor stands */
inline decode_previous_fixing_rate(previous_fixing_rate_record) {
  previous_fixing_rate_at = 0;
  do
  :: previous_fixing_rate_at < 8 -> previous_fixing_rate_record.mantissa[previous_fixing_rate_at] = wire[at]; at = at + 1; previous_fixing_rate_at = previous_fixing_rate_at + 1
  :: else -> break
  od;
  previous_fixing_rate_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Previous Fixing Rate is what was written, byte for byte */
inline equal_previous_fixing_rate(previous_fixing_rate_read, previous_fixing_rate_written) {
  previous_fixing_rate_at = 0;
  do
  :: previous_fixing_rate_at < 8 -> assert(previous_fixing_rate_read.mantissa[previous_fixing_rate_at] == previous_fixing_rate_written.mantissa[previous_fixing_rate_at]); previous_fixing_rate_at = previous_fixing_rate_at + 1
  :: else -> break
  od;
  assert(previous_fixing_rate_read.exponent == previous_fixing_rate_written.exponent);
  skip
}

/* ---- Interpolation Factor: 9 bytes ------------------------------------------- */

/* Number of legs (repeating groups) */
typedef InterpolationFactor {
  byte mantissa[8];
  byte exponent
};

int interpolation_factor_at;

/* every byte of Interpolation Factor set to one value */
inline fill_interpolation_factor(interpolation_factor_record, interpolation_factor_value) {
  interpolation_factor_at = 0;
  do
  :: interpolation_factor_at < 8 -> interpolation_factor_record.mantissa[interpolation_factor_at] = interpolation_factor_value; interpolation_factor_at = interpolation_factor_at + 1
  :: else -> break
  od;
  interpolation_factor_record.exponent = interpolation_factor_value;
  skip
}

/* each byte of Interpolation Factor set to where it lies, so a field read out of place says so */
inline ramp_interpolation_factor(interpolation_factor_record, interpolation_factor_base) {
  interpolation_factor_at = 0;
  do
  :: interpolation_factor_at < 8 -> interpolation_factor_record.mantissa[interpolation_factor_at] = (interpolation_factor_base + 0 + interpolation_factor_at + 1) % 256; interpolation_factor_at = interpolation_factor_at + 1
  :: else -> break
  od;
  interpolation_factor_record.exponent = (interpolation_factor_base + 8 + 1) % 256;
  skip
}

/* Interpolation Factor to the wire, 9 bytes from where the cursor stands */
inline encode_interpolation_factor(interpolation_factor_record) {
  interpolation_factor_at = 0;
  do
  :: interpolation_factor_at < 8 -> wire[at] = interpolation_factor_record.mantissa[interpolation_factor_at]; at = at + 1; interpolation_factor_at = interpolation_factor_at + 1
  :: else -> break
  od;
  wire[at] = interpolation_factor_record.exponent; at = at + 1;
  skip
}

/* Interpolation Factor off the wire, 9 bytes from where the cursor stands */
inline decode_interpolation_factor(interpolation_factor_record) {
  interpolation_factor_at = 0;
  do
  :: interpolation_factor_at < 8 -> interpolation_factor_record.mantissa[interpolation_factor_at] = wire[at]; at = at + 1; interpolation_factor_at = interpolation_factor_at + 1
  :: else -> break
  od;
  interpolation_factor_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Interpolation Factor is what was written, byte for byte */
inline equal_interpolation_factor(interpolation_factor_read, interpolation_factor_written) {
  interpolation_factor_at = 0;
  do
  :: interpolation_factor_at < 8 -> assert(interpolation_factor_read.mantissa[interpolation_factor_at] == interpolation_factor_written.mantissa[interpolation_factor_at]); interpolation_factor_at = interpolation_factor_at + 1
  :: else -> break
  od;
  assert(interpolation_factor_read.exponent == interpolation_factor_written.exponent);
  skip
}

/* ---- Unit Of Measure Qty Decimal Optional: 9 bytes --------------------------- */

/* Number of entries in Market Data message. */
typedef UnitOfMeasureQtyDecimalOptional {
  byte mantissa[8];
  byte exponent_optional
};

int unit_of_measure_qty_decimal_optional_at;

/* every byte of Unit Of Measure Qty Decimal Optional set to one value */
inline fill_unit_of_measure_qty_decimal_optional(unit_of_measure_qty_decimal_optional_record, unit_of_measure_qty_decimal_optional_value) {
  unit_of_measure_qty_decimal_optional_at = 0;
  do
  :: unit_of_measure_qty_decimal_optional_at < 8 -> unit_of_measure_qty_decimal_optional_record.mantissa[unit_of_measure_qty_decimal_optional_at] = unit_of_measure_qty_decimal_optional_value; unit_of_measure_qty_decimal_optional_at = unit_of_measure_qty_decimal_optional_at + 1
  :: else -> break
  od;
  unit_of_measure_qty_decimal_optional_record.exponent_optional = unit_of_measure_qty_decimal_optional_value;
  skip
}

/* each byte of Unit Of Measure Qty Decimal Optional set to where it lies, so a field read out of place says so */
inline ramp_unit_of_measure_qty_decimal_optional(unit_of_measure_qty_decimal_optional_record, unit_of_measure_qty_decimal_optional_base) {
  unit_of_measure_qty_decimal_optional_at = 0;
  do
  :: unit_of_measure_qty_decimal_optional_at < 8 -> unit_of_measure_qty_decimal_optional_record.mantissa[unit_of_measure_qty_decimal_optional_at] = (unit_of_measure_qty_decimal_optional_base + 0 + unit_of_measure_qty_decimal_optional_at + 1) % 256; unit_of_measure_qty_decimal_optional_at = unit_of_measure_qty_decimal_optional_at + 1
  :: else -> break
  od;
  unit_of_measure_qty_decimal_optional_record.exponent_optional = (unit_of_measure_qty_decimal_optional_base + 8 + 1) % 256;
  skip
}

/* Unit Of Measure Qty Decimal Optional to the wire, 9 bytes from where the cursor stands */
inline encode_unit_of_measure_qty_decimal_optional(unit_of_measure_qty_decimal_optional_record) {
  unit_of_measure_qty_decimal_optional_at = 0;
  do
  :: unit_of_measure_qty_decimal_optional_at < 8 -> wire[at] = unit_of_measure_qty_decimal_optional_record.mantissa[unit_of_measure_qty_decimal_optional_at]; at = at + 1; unit_of_measure_qty_decimal_optional_at = unit_of_measure_qty_decimal_optional_at + 1
  :: else -> break
  od;
  wire[at] = unit_of_measure_qty_decimal_optional_record.exponent_optional; at = at + 1;
  skip
}

/* Unit Of Measure Qty Decimal Optional off the wire, 9 bytes from where the cursor stands */
inline decode_unit_of_measure_qty_decimal_optional(unit_of_measure_qty_decimal_optional_record) {
  unit_of_measure_qty_decimal_optional_at = 0;
  do
  :: unit_of_measure_qty_decimal_optional_at < 8 -> unit_of_measure_qty_decimal_optional_record.mantissa[unit_of_measure_qty_decimal_optional_at] = wire[at]; at = at + 1; unit_of_measure_qty_decimal_optional_at = unit_of_measure_qty_decimal_optional_at + 1
  :: else -> break
  od;
  unit_of_measure_qty_decimal_optional_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Unit Of Measure Qty Decimal Optional is what was written, byte for byte */
inline equal_unit_of_measure_qty_decimal_optional(unit_of_measure_qty_decimal_optional_read, unit_of_measure_qty_decimal_optional_written) {
  unit_of_measure_qty_decimal_optional_at = 0;
  do
  :: unit_of_measure_qty_decimal_optional_at < 8 -> assert(unit_of_measure_qty_decimal_optional_read.mantissa[unit_of_measure_qty_decimal_optional_at] == unit_of_measure_qty_decimal_optional_written.mantissa[unit_of_measure_qty_decimal_optional_at]); unit_of_measure_qty_decimal_optional_at = unit_of_measure_qty_decimal_optional_at + 1
  :: else -> break
  od;
  assert(unit_of_measure_qty_decimal_optional_read.exponent_optional == unit_of_measure_qty_decimal_optional_written.exponent_optional);
  skip
}

/* ---- Strike Price Decimal Optional: 9 bytes ---------------------------------- */

/* Number of entries in Market Data message. */
typedef StrikePriceDecimalOptional {
  byte mantissa[8];
  byte exponent_optional
};

int strike_price_decimal_optional_at;

/* every byte of Strike Price Decimal Optional set to one value */
inline fill_strike_price_decimal_optional(strike_price_decimal_optional_record, strike_price_decimal_optional_value) {
  strike_price_decimal_optional_at = 0;
  do
  :: strike_price_decimal_optional_at < 8 -> strike_price_decimal_optional_record.mantissa[strike_price_decimal_optional_at] = strike_price_decimal_optional_value; strike_price_decimal_optional_at = strike_price_decimal_optional_at + 1
  :: else -> break
  od;
  strike_price_decimal_optional_record.exponent_optional = strike_price_decimal_optional_value;
  skip
}

/* each byte of Strike Price Decimal Optional set to where it lies, so a field read out of place says so */
inline ramp_strike_price_decimal_optional(strike_price_decimal_optional_record, strike_price_decimal_optional_base) {
  strike_price_decimal_optional_at = 0;
  do
  :: strike_price_decimal_optional_at < 8 -> strike_price_decimal_optional_record.mantissa[strike_price_decimal_optional_at] = (strike_price_decimal_optional_base + 0 + strike_price_decimal_optional_at + 1) % 256; strike_price_decimal_optional_at = strike_price_decimal_optional_at + 1
  :: else -> break
  od;
  strike_price_decimal_optional_record.exponent_optional = (strike_price_decimal_optional_base + 8 + 1) % 256;
  skip
}

/* Strike Price Decimal Optional to the wire, 9 bytes from where the cursor stands */
inline encode_strike_price_decimal_optional(strike_price_decimal_optional_record) {
  strike_price_decimal_optional_at = 0;
  do
  :: strike_price_decimal_optional_at < 8 -> wire[at] = strike_price_decimal_optional_record.mantissa[strike_price_decimal_optional_at]; at = at + 1; strike_price_decimal_optional_at = strike_price_decimal_optional_at + 1
  :: else -> break
  od;
  wire[at] = strike_price_decimal_optional_record.exponent_optional; at = at + 1;
  skip
}

/* Strike Price Decimal Optional off the wire, 9 bytes from where the cursor stands */
inline decode_strike_price_decimal_optional(strike_price_decimal_optional_record) {
  strike_price_decimal_optional_at = 0;
  do
  :: strike_price_decimal_optional_at < 8 -> strike_price_decimal_optional_record.mantissa[strike_price_decimal_optional_at] = wire[at]; at = at + 1; strike_price_decimal_optional_at = strike_price_decimal_optional_at + 1
  :: else -> break
  od;
  strike_price_decimal_optional_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Strike Price Decimal Optional is what was written, byte for byte */
inline equal_strike_price_decimal_optional(strike_price_decimal_optional_read, strike_price_decimal_optional_written) {
  strike_price_decimal_optional_at = 0;
  do
  :: strike_price_decimal_optional_at < 8 -> assert(strike_price_decimal_optional_read.mantissa[strike_price_decimal_optional_at] == strike_price_decimal_optional_written.mantissa[strike_price_decimal_optional_at]); strike_price_decimal_optional_at = strike_price_decimal_optional_at + 1
  :: else -> break
  od;
  assert(strike_price_decimal_optional_read.exponent_optional == strike_price_decimal_optional_written.exponent_optional);
  skip
}

/* ---- Leg Strike Price Decimal 64 Null: 9 bytes ------------------------------- */

/* Number of legs (repeating groups) */
typedef LegStrikePriceDecimal64Null {
  byte mantissa[8];
  byte exponent_optional
};

int leg_strike_price_decimal64_null_at;

/* every byte of Leg Strike Price Decimal 64 Null set to one value */
inline fill_leg_strike_price_decimal64_null(leg_strike_price_decimal64_null_record, leg_strike_price_decimal64_null_value) {
  leg_strike_price_decimal64_null_at = 0;
  do
  :: leg_strike_price_decimal64_null_at < 8 -> leg_strike_price_decimal64_null_record.mantissa[leg_strike_price_decimal64_null_at] = leg_strike_price_decimal64_null_value; leg_strike_price_decimal64_null_at = leg_strike_price_decimal64_null_at + 1
  :: else -> break
  od;
  leg_strike_price_decimal64_null_record.exponent_optional = leg_strike_price_decimal64_null_value;
  skip
}

/* each byte of Leg Strike Price Decimal 64 Null set to where it lies, so a field read out of place says so */
inline ramp_leg_strike_price_decimal64_null(leg_strike_price_decimal64_null_record, leg_strike_price_decimal64_null_base) {
  leg_strike_price_decimal64_null_at = 0;
  do
  :: leg_strike_price_decimal64_null_at < 8 -> leg_strike_price_decimal64_null_record.mantissa[leg_strike_price_decimal64_null_at] = (leg_strike_price_decimal64_null_base + 0 + leg_strike_price_decimal64_null_at + 1) % 256; leg_strike_price_decimal64_null_at = leg_strike_price_decimal64_null_at + 1
  :: else -> break
  od;
  leg_strike_price_decimal64_null_record.exponent_optional = (leg_strike_price_decimal64_null_base + 8 + 1) % 256;
  skip
}

/* Leg Strike Price Decimal 64 Null to the wire, 9 bytes from where the cursor stands */
inline encode_leg_strike_price_decimal64_null(leg_strike_price_decimal64_null_record) {
  leg_strike_price_decimal64_null_at = 0;
  do
  :: leg_strike_price_decimal64_null_at < 8 -> wire[at] = leg_strike_price_decimal64_null_record.mantissa[leg_strike_price_decimal64_null_at]; at = at + 1; leg_strike_price_decimal64_null_at = leg_strike_price_decimal64_null_at + 1
  :: else -> break
  od;
  wire[at] = leg_strike_price_decimal64_null_record.exponent_optional; at = at + 1;
  skip
}

/* Leg Strike Price Decimal 64 Null off the wire, 9 bytes from where the cursor stands */
inline decode_leg_strike_price_decimal64_null(leg_strike_price_decimal64_null_record) {
  leg_strike_price_decimal64_null_at = 0;
  do
  :: leg_strike_price_decimal64_null_at < 8 -> leg_strike_price_decimal64_null_record.mantissa[leg_strike_price_decimal64_null_at] = wire[at]; at = at + 1; leg_strike_price_decimal64_null_at = leg_strike_price_decimal64_null_at + 1
  :: else -> break
  od;
  leg_strike_price_decimal64_null_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Leg Strike Price Decimal 64 Null is what was written, byte for byte */
inline equal_leg_strike_price_decimal64_null(leg_strike_price_decimal64_null_read, leg_strike_price_decimal64_null_written) {
  leg_strike_price_decimal64_null_at = 0;
  do
  :: leg_strike_price_decimal64_null_at < 8 -> assert(leg_strike_price_decimal64_null_read.mantissa[leg_strike_price_decimal64_null_at] == leg_strike_price_decimal64_null_written.mantissa[leg_strike_price_decimal64_null_at]); leg_strike_price_decimal64_null_at = leg_strike_price_decimal64_null_at + 1
  :: else -> break
  od;
  assert(leg_strike_price_decimal64_null_read.exponent_optional == leg_strike_price_decimal64_null_written.exponent_optional);
  skip
}

/* ---- Leg Unit Of Measure Qty Decimal 64 Null: 9 bytes ------------------------ */

/* Number of legs (repeating groups) */
typedef LegUnitOfMeasureQtyDecimal64Null {
  byte mantissa[8];
  byte exponent_optional
};

int leg_unit_of_measure_qty_decimal64_null_at;

/* every byte of Leg Unit Of Measure Qty Decimal 64 Null set to one value */
inline fill_leg_unit_of_measure_qty_decimal64_null(leg_unit_of_measure_qty_decimal64_null_record, leg_unit_of_measure_qty_decimal64_null_value) {
  leg_unit_of_measure_qty_decimal64_null_at = 0;
  do
  :: leg_unit_of_measure_qty_decimal64_null_at < 8 -> leg_unit_of_measure_qty_decimal64_null_record.mantissa[leg_unit_of_measure_qty_decimal64_null_at] = leg_unit_of_measure_qty_decimal64_null_value; leg_unit_of_measure_qty_decimal64_null_at = leg_unit_of_measure_qty_decimal64_null_at + 1
  :: else -> break
  od;
  leg_unit_of_measure_qty_decimal64_null_record.exponent_optional = leg_unit_of_measure_qty_decimal64_null_value;
  skip
}

/* each byte of Leg Unit Of Measure Qty Decimal 64 Null set to where it lies, so a field read out of place says so */
inline ramp_leg_unit_of_measure_qty_decimal64_null(leg_unit_of_measure_qty_decimal64_null_record, leg_unit_of_measure_qty_decimal64_null_base) {
  leg_unit_of_measure_qty_decimal64_null_at = 0;
  do
  :: leg_unit_of_measure_qty_decimal64_null_at < 8 -> leg_unit_of_measure_qty_decimal64_null_record.mantissa[leg_unit_of_measure_qty_decimal64_null_at] = (leg_unit_of_measure_qty_decimal64_null_base + 0 + leg_unit_of_measure_qty_decimal64_null_at + 1) % 256; leg_unit_of_measure_qty_decimal64_null_at = leg_unit_of_measure_qty_decimal64_null_at + 1
  :: else -> break
  od;
  leg_unit_of_measure_qty_decimal64_null_record.exponent_optional = (leg_unit_of_measure_qty_decimal64_null_base + 8 + 1) % 256;
  skip
}

/* Leg Unit Of Measure Qty Decimal 64 Null to the wire, 9 bytes from where the cursor stands */
inline encode_leg_unit_of_measure_qty_decimal64_null(leg_unit_of_measure_qty_decimal64_null_record) {
  leg_unit_of_measure_qty_decimal64_null_at = 0;
  do
  :: leg_unit_of_measure_qty_decimal64_null_at < 8 -> wire[at] = leg_unit_of_measure_qty_decimal64_null_record.mantissa[leg_unit_of_measure_qty_decimal64_null_at]; at = at + 1; leg_unit_of_measure_qty_decimal64_null_at = leg_unit_of_measure_qty_decimal64_null_at + 1
  :: else -> break
  od;
  wire[at] = leg_unit_of_measure_qty_decimal64_null_record.exponent_optional; at = at + 1;
  skip
}

/* Leg Unit Of Measure Qty Decimal 64 Null off the wire, 9 bytes from where the cursor stands */
inline decode_leg_unit_of_measure_qty_decimal64_null(leg_unit_of_measure_qty_decimal64_null_record) {
  leg_unit_of_measure_qty_decimal64_null_at = 0;
  do
  :: leg_unit_of_measure_qty_decimal64_null_at < 8 -> leg_unit_of_measure_qty_decimal64_null_record.mantissa[leg_unit_of_measure_qty_decimal64_null_at] = wire[at]; at = at + 1; leg_unit_of_measure_qty_decimal64_null_at = leg_unit_of_measure_qty_decimal64_null_at + 1
  :: else -> break
  od;
  leg_unit_of_measure_qty_decimal64_null_record.exponent_optional = wire[at]; at = at + 1;
  skip
}

/* what was read of Leg Unit Of Measure Qty Decimal 64 Null is what was written, byte for byte */
inline equal_leg_unit_of_measure_qty_decimal64_null(leg_unit_of_measure_qty_decimal64_null_read, leg_unit_of_measure_qty_decimal64_null_written) {
  leg_unit_of_measure_qty_decimal64_null_at = 0;
  do
  :: leg_unit_of_measure_qty_decimal64_null_at < 8 -> assert(leg_unit_of_measure_qty_decimal64_null_read.mantissa[leg_unit_of_measure_qty_decimal64_null_at] == leg_unit_of_measure_qty_decimal64_null_written.mantissa[leg_unit_of_measure_qty_decimal64_null_at]); leg_unit_of_measure_qty_decimal64_null_at = leg_unit_of_measure_qty_decimal64_null_at + 1
  :: else -> break
  od;
  assert(leg_unit_of_measure_qty_decimal64_null_read.exponent_optional == leg_unit_of_measure_qty_decimal64_null_written.exponent_optional);
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

/* Admin Login: encoded, read back, and compared */
proctype check_admin_login() {
  AdminLogin admin_login_sent;
  AdminLogin admin_login_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_admin_login(admin_login_sent, 0)
  :: pattern == 1 -> fill_admin_login(admin_login_sent, 32)
  :: pattern == 2 -> fill_admin_login(admin_login_sent, 255)
  :: else -> ramp_admin_login(admin_login_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_admin_login(admin_login_sent);
    assert(at == 1);
    at = 0;
    decode_admin_login(admin_login_got);
    assert(at == 1);
    equal_admin_login(admin_login_got, admin_login_sent)
  }
}

/* Admin Logout: encoded, read back, and compared */
proctype check_admin_logout() {
  AdminLogout admin_logout_sent;
  AdminLogout admin_logout_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_admin_logout(admin_logout_sent, 0)
  :: pattern == 1 -> fill_admin_logout(admin_logout_sent, 32)
  :: pattern == 2 -> fill_admin_logout(admin_logout_sent, 255)
  :: else -> ramp_admin_logout(admin_logout_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_admin_logout(admin_logout_sent);
    assert(at == 180);
    at = 0;
    decode_admin_logout(admin_logout_got);
    assert(at == 180);
    equal_admin_logout(admin_logout_got, admin_logout_sent)
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

/* Md Entry Px Decimal Optional: encoded, read back, and compared */
proctype check_md_entry_px_decimal_optional() {
  MdEntryPxDecimalOptional md_entry_px_decimal_optional_sent;
  MdEntryPxDecimalOptional md_entry_px_decimal_optional_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_md_entry_px_decimal_optional(md_entry_px_decimal_optional_sent, 0)
  :: pattern == 1 -> fill_md_entry_px_decimal_optional(md_entry_px_decimal_optional_sent, 32)
  :: pattern == 2 -> fill_md_entry_px_decimal_optional(md_entry_px_decimal_optional_sent, 255)
  :: else -> ramp_md_entry_px_decimal_optional(md_entry_px_decimal_optional_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_md_entry_px_decimal_optional(md_entry_px_decimal_optional_sent);
    assert(at == 9);
    at = 0;
    decode_md_entry_px_decimal_optional(md_entry_px_decimal_optional_got);
    assert(at == 9);
    equal_md_entry_px_decimal_optional(md_entry_px_decimal_optional_got, md_entry_px_decimal_optional_sent)
  }
}

/* Cal Fut Px Optional: encoded, read back, and compared */
proctype check_cal_fut_px_optional() {
  CalFutPxOptional cal_fut_px_optional_sent;
  CalFutPxOptional cal_fut_px_optional_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cal_fut_px_optional(cal_fut_px_optional_sent, 0)
  :: pattern == 1 -> fill_cal_fut_px_optional(cal_fut_px_optional_sent, 32)
  :: pattern == 2 -> fill_cal_fut_px_optional(cal_fut_px_optional_sent, 255)
  :: else -> ramp_cal_fut_px_optional(cal_fut_px_optional_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cal_fut_px_optional(cal_fut_px_optional_sent);
    assert(at == 9);
    at = 0;
    decode_cal_fut_px_optional(cal_fut_px_optional_got);
    assert(at == 9);
    equal_cal_fut_px_optional(cal_fut_px_optional_got, cal_fut_px_optional_sent)
  }
}

/* Coupon Rate Optional: encoded, read back, and compared */
proctype check_coupon_rate_optional() {
  CouponRateOptional coupon_rate_optional_sent;
  CouponRateOptional coupon_rate_optional_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_coupon_rate_optional(coupon_rate_optional_sent, 0)
  :: pattern == 1 -> fill_coupon_rate_optional(coupon_rate_optional_sent, 32)
  :: pattern == 2 -> fill_coupon_rate_optional(coupon_rate_optional_sent, 255)
  :: else -> ramp_coupon_rate_optional(coupon_rate_optional_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_coupon_rate_optional(coupon_rate_optional_sent);
    assert(at == 5);
    at = 0;
    decode_coupon_rate_optional(coupon_rate_optional_got);
    assert(at == 5);
    equal_coupon_rate_optional(coupon_rate_optional_got, coupon_rate_optional_sent)
  }
}

/* Fair Coupon Pct: encoded, read back, and compared */
proctype check_fair_coupon_pct() {
  FairCouponPct fair_coupon_pct_sent;
  FairCouponPct fair_coupon_pct_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fair_coupon_pct(fair_coupon_pct_sent, 0)
  :: pattern == 1 -> fill_fair_coupon_pct(fair_coupon_pct_sent, 32)
  :: pattern == 2 -> fill_fair_coupon_pct(fair_coupon_pct_sent, 255)
  :: else -> ramp_fair_coupon_pct(fair_coupon_pct_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fair_coupon_pct(fair_coupon_pct_sent);
    assert(at == 9);
    at = 0;
    decode_fair_coupon_pct(fair_coupon_pct_got);
    assert(at == 9);
    equal_fair_coupon_pct(fair_coupon_pct_got, fair_coupon_pct_sent)
  }
}

/* Leg Purchase Rate: encoded, read back, and compared */
proctype check_leg_purchase_rate() {
  LegPurchaseRate leg_purchase_rate_sent;
  LegPurchaseRate leg_purchase_rate_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_leg_purchase_rate(leg_purchase_rate_sent, 0)
  :: pattern == 1 -> fill_leg_purchase_rate(leg_purchase_rate_sent, 32)
  :: pattern == 2 -> fill_leg_purchase_rate(leg_purchase_rate_sent, 255)
  :: else -> ramp_leg_purchase_rate(leg_purchase_rate_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_leg_purchase_rate(leg_purchase_rate_sent);
    assert(at == 9);
    at = 0;
    decode_leg_purchase_rate(leg_purchase_rate_got);
    assert(at == 9);
    equal_leg_purchase_rate(leg_purchase_rate_got, leg_purchase_rate_sent)
  }
}

/* Fixed Npv: encoded, read back, and compared */
proctype check_fixed_npv() {
  FixedNpv fixed_npv_sent;
  FixedNpv fixed_npv_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fixed_npv(fixed_npv_sent, 0)
  :: pattern == 1 -> fill_fixed_npv(fixed_npv_sent, 32)
  :: pattern == 2 -> fill_fixed_npv(fixed_npv_sent, 255)
  :: else -> ramp_fixed_npv(fixed_npv_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fixed_npv(fixed_npv_sent);
    assert(at == 9);
    at = 0;
    decode_fixed_npv(fixed_npv_got);
    assert(at == 9);
    equal_fixed_npv(fixed_npv_got, fixed_npv_sent)
  }
}

/* Float Npv: encoded, read back, and compared */
proctype check_float_npv() {
  FloatNpv float_npv_sent;
  FloatNpv float_npv_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_float_npv(float_npv_sent, 0)
  :: pattern == 1 -> fill_float_npv(float_npv_sent, 32)
  :: pattern == 2 -> fill_float_npv(float_npv_sent, 255)
  :: else -> ramp_float_npv(float_npv_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_float_npv(float_npv_sent);
    assert(at == 9);
    at = 0;
    decode_float_npv(float_npv_got);
    assert(at == 9);
    equal_float_npv(float_npv_got, float_npv_sent)
  }
}

/* Npv: encoded, read back, and compared */
proctype check_npv() {
  Npv npv_sent;
  Npv npv_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_npv(npv_sent, 0)
  :: pattern == 1 -> fill_npv(npv_sent, 32)
  :: pattern == 2 -> fill_npv(npv_sent, 255)
  :: else -> ramp_npv(npv_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_npv(npv_sent);
    assert(at == 9);
    at = 0;
    decode_npv(npv_got);
    assert(at == 9);
    equal_npv(npv_got, npv_sent)
  }
}

/* Accrued Coupons: encoded, read back, and compared */
proctype check_accrued_coupons() {
  AccruedCoupons accrued_coupons_sent;
  AccruedCoupons accrued_coupons_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_accrued_coupons(accrued_coupons_sent, 0)
  :: pattern == 1 -> fill_accrued_coupons(accrued_coupons_sent, 32)
  :: pattern == 2 -> fill_accrued_coupons(accrued_coupons_sent, 255)
  :: else -> ramp_accrued_coupons(accrued_coupons_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_accrued_coupons(accrued_coupons_sent);
    assert(at == 9);
    at = 0;
    decode_accrued_coupons(accrued_coupons_got);
    assert(at == 9);
    equal_accrued_coupons(accrued_coupons_got, accrued_coupons_sent)
  }
}

/* Daily Incremental Eris Pai: encoded, read back, and compared */
proctype check_daily_incremental_eris_pai() {
  DailyIncrementalErisPai daily_incremental_eris_pai_sent;
  DailyIncrementalErisPai daily_incremental_eris_pai_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_daily_incremental_eris_pai(daily_incremental_eris_pai_sent, 0)
  :: pattern == 1 -> fill_daily_incremental_eris_pai(daily_incremental_eris_pai_sent, 32)
  :: pattern == 2 -> fill_daily_incremental_eris_pai(daily_incremental_eris_pai_sent, 255)
  :: else -> ramp_daily_incremental_eris_pai(daily_incremental_eris_pai_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_daily_incremental_eris_pai(daily_incremental_eris_pai_sent);
    assert(at == 9);
    at = 0;
    decode_daily_incremental_eris_pai(daily_incremental_eris_pai_got);
    assert(at == 9);
    equal_daily_incremental_eris_pai(daily_incremental_eris_pai_got, daily_incremental_eris_pai_sent)
  }
}

/* Eris Pai: encoded, read back, and compared */
proctype check_eris_pai() {
  ErisPai eris_pai_sent;
  ErisPai eris_pai_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_eris_pai(eris_pai_sent, 0)
  :: pattern == 1 -> fill_eris_pai(eris_pai_sent, 32)
  :: pattern == 2 -> fill_eris_pai(eris_pai_sent, 255)
  :: else -> ramp_eris_pai(eris_pai_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_eris_pai(eris_pai_sent);
    assert(at == 9);
    at = 0;
    decode_eris_pai(eris_pai_got);
    assert(at == 9);
    equal_eris_pai(eris_pai_got, eris_pai_sent)
  }
}

/* Fed Funds Rate: encoded, read back, and compared */
proctype check_fed_funds_rate() {
  FedFundsRate fed_funds_rate_sent;
  FedFundsRate fed_funds_rate_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fed_funds_rate(fed_funds_rate_sent, 0)
  :: pattern == 1 -> fill_fed_funds_rate(fed_funds_rate_sent, 32)
  :: pattern == 2 -> fill_fed_funds_rate(fed_funds_rate_sent, 255)
  :: else -> ramp_fed_funds_rate(fed_funds_rate_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fed_funds_rate(fed_funds_rate_sent);
    assert(at == 9);
    at = 0;
    decode_fed_funds_rate(fed_funds_rate_got);
    assert(at == 9);
    equal_fed_funds_rate(fed_funds_rate_got, fed_funds_rate_sent)
  }
}

/* Min Price Increment Optional: encoded, read back, and compared */
proctype check_min_price_increment_optional() {
  MinPriceIncrementOptional min_price_increment_optional_sent;
  MinPriceIncrementOptional min_price_increment_optional_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_min_price_increment_optional(min_price_increment_optional_sent, 0)
  :: pattern == 1 -> fill_min_price_increment_optional(min_price_increment_optional_sent, 32)
  :: pattern == 2 -> fill_min_price_increment_optional(min_price_increment_optional_sent, 255)
  :: else -> ramp_min_price_increment_optional(min_price_increment_optional_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_min_price_increment_optional(min_price_increment_optional_sent);
    assert(at == 9);
    at = 0;
    decode_min_price_increment_optional(min_price_increment_optional_got);
    assert(at == 9);
    equal_min_price_increment_optional(min_price_increment_optional_got, min_price_increment_optional_sent)
  }
}

/* Fixed Payment: encoded, read back, and compared */
proctype check_fixed_payment() {
  FixedPayment fixed_payment_sent;
  FixedPayment fixed_payment_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fixed_payment(fixed_payment_sent, 0)
  :: pattern == 1 -> fill_fixed_payment(fixed_payment_sent, 32)
  :: pattern == 2 -> fill_fixed_payment(fixed_payment_sent, 255)
  :: else -> ramp_fixed_payment(fixed_payment_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fixed_payment(fixed_payment_sent);
    assert(at == 9);
    at = 0;
    decode_fixed_payment(fixed_payment_got);
    assert(at == 9);
    equal_fixed_payment(fixed_payment_got, fixed_payment_sent)
  }
}

/* Floating Payment: encoded, read back, and compared */
proctype check_floating_payment() {
  FloatingPayment floating_payment_sent;
  FloatingPayment floating_payment_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_floating_payment(floating_payment_sent, 0)
  :: pattern == 1 -> fill_floating_payment(floating_payment_sent, 32)
  :: pattern == 2 -> fill_floating_payment(floating_payment_sent, 255)
  :: else -> ramp_floating_payment(floating_payment_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_floating_payment(floating_payment_sent);
    assert(at == 9);
    at = 0;
    decode_floating_payment(floating_payment_got);
    assert(at == 9);
    equal_floating_payment(floating_payment_got, floating_payment_sent)
  }
}

/* Next Fixed Payment Amount: encoded, read back, and compared */
proctype check_next_fixed_payment_amount() {
  NextFixedPaymentAmount next_fixed_payment_amount_sent;
  NextFixedPaymentAmount next_fixed_payment_amount_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_next_fixed_payment_amount(next_fixed_payment_amount_sent, 0)
  :: pattern == 1 -> fill_next_fixed_payment_amount(next_fixed_payment_amount_sent, 32)
  :: pattern == 2 -> fill_next_fixed_payment_amount(next_fixed_payment_amount_sent, 255)
  :: else -> ramp_next_fixed_payment_amount(next_fixed_payment_amount_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_next_fixed_payment_amount(next_fixed_payment_amount_sent);
    assert(at == 9);
    at = 0;
    decode_next_fixed_payment_amount(next_fixed_payment_amount_got);
    assert(at == 9);
    equal_next_fixed_payment_amount(next_fixed_payment_amount_got, next_fixed_payment_amount_sent)
  }
}

/* Next Floating Payment Amount: encoded, read back, and compared */
proctype check_next_floating_payment_amount() {
  NextFloatingPaymentAmount next_floating_payment_amount_sent;
  NextFloatingPaymentAmount next_floating_payment_amount_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_next_floating_payment_amount(next_floating_payment_amount_sent, 0)
  :: pattern == 1 -> fill_next_floating_payment_amount(next_floating_payment_amount_sent, 32)
  :: pattern == 2 -> fill_next_floating_payment_amount(next_floating_payment_amount_sent, 255)
  :: else -> ramp_next_floating_payment_amount(next_floating_payment_amount_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_next_floating_payment_amount(next_floating_payment_amount_sent);
    assert(at == 9);
    at = 0;
    decode_next_floating_payment_amount(next_floating_payment_amount_got);
    assert(at == 9);
    equal_next_floating_payment_amount(next_floating_payment_amount_got, next_floating_payment_amount_sent)
  }
}

/* Previous Eris Pai: encoded, read back, and compared */
proctype check_previous_eris_pai() {
  PreviousErisPai previous_eris_pai_sent;
  PreviousErisPai previous_eris_pai_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_previous_eris_pai(previous_eris_pai_sent, 0)
  :: pattern == 1 -> fill_previous_eris_pai(previous_eris_pai_sent, 32)
  :: pattern == 2 -> fill_previous_eris_pai(previous_eris_pai_sent, 255)
  :: else -> ramp_previous_eris_pai(previous_eris_pai_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_previous_eris_pai(previous_eris_pai_sent);
    assert(at == 9);
    at = 0;
    decode_previous_eris_pai(previous_eris_pai_got);
    assert(at == 9);
    equal_previous_eris_pai(previous_eris_pai_got, previous_eris_pai_sent)
  }
}

/* Leg Contract Multiplier: encoded, read back, and compared */
proctype check_leg_contract_multiplier() {
  LegContractMultiplier leg_contract_multiplier_sent;
  LegContractMultiplier leg_contract_multiplier_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_leg_contract_multiplier(leg_contract_multiplier_sent, 0)
  :: pattern == 1 -> fill_leg_contract_multiplier(leg_contract_multiplier_sent, 32)
  :: pattern == 2 -> fill_leg_contract_multiplier(leg_contract_multiplier_sent, 255)
  :: else -> ramp_leg_contract_multiplier(leg_contract_multiplier_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_leg_contract_multiplier(leg_contract_multiplier_sent);
    assert(at == 9);
    at = 0;
    decode_leg_contract_multiplier(leg_contract_multiplier_got);
    assert(at == 9);
    equal_leg_contract_multiplier(leg_contract_multiplier_got, leg_contract_multiplier_sent)
  }
}

/* P V 01: encoded, read back, and compared */
proctype check_p_v01() {
  PV01 p_v01_sent;
  PV01 p_v01_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_p_v01(p_v01_sent, 0)
  :: pattern == 1 -> fill_p_v01(p_v01_sent, 32)
  :: pattern == 2 -> fill_p_v01(p_v01_sent, 255)
  :: else -> ramp_p_v01(p_v01_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_p_v01(p_v01_sent);
    assert(at == 9);
    at = 0;
    decode_p_v01(p_v01_got);
    assert(at == 9);
    equal_p_v01(p_v01_got, p_v01_sent)
  }
}

/* D V 01: encoded, read back, and compared */
proctype check_d_v01() {
  DV01 d_v01_sent;
  DV01 d_v01_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_d_v01(d_v01_sent, 0)
  :: pattern == 1 -> fill_d_v01(d_v01_sent, 32)
  :: pattern == 2 -> fill_d_v01(d_v01_sent, 255)
  :: else -> ramp_d_v01(d_v01_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_d_v01(d_v01_sent);
    assert(at == 9);
    at = 0;
    decode_d_v01(d_v01_got);
    assert(at == 9);
    equal_d_v01(d_v01_got, d_v01_sent)
  }
}

/* Settlement Npv: encoded, read back, and compared */
proctype check_settlement_npv() {
  SettlementNpv settlement_npv_sent;
  SettlementNpv settlement_npv_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_settlement_npv(settlement_npv_sent, 0)
  :: pattern == 1 -> fill_settlement_npv(settlement_npv_sent, 32)
  :: pattern == 2 -> fill_settlement_npv(settlement_npv_sent, 255)
  :: else -> ramp_settlement_npv(settlement_npv_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_settlement_npv(settlement_npv_sent);
    assert(at == 9);
    at = 0;
    decode_settlement_npv(settlement_npv_got);
    assert(at == 9);
    equal_settlement_npv(settlement_npv_got, settlement_npv_sent)
  }
}

/* Final Settlement Futures Price: encoded, read back, and compared */
proctype check_final_settlement_futures_price() {
  FinalSettlementFuturesPrice final_settlement_futures_price_sent;
  FinalSettlementFuturesPrice final_settlement_futures_price_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_final_settlement_futures_price(final_settlement_futures_price_sent, 0)
  :: pattern == 1 -> fill_final_settlement_futures_price(final_settlement_futures_price_sent, 32)
  :: pattern == 2 -> fill_final_settlement_futures_price(final_settlement_futures_price_sent, 255)
  :: else -> ramp_final_settlement_futures_price(final_settlement_futures_price_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_final_settlement_futures_price(final_settlement_futures_price_sent);
    assert(at == 9);
    at = 0;
    decode_final_settlement_futures_price(final_settlement_futures_price_got);
    assert(at == 9);
    equal_final_settlement_futures_price(final_settlement_futures_price_got, final_settlement_futures_price_sent)
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

/* Leg Maturity Month Year: encoded, read back, and compared */
proctype check_leg_maturity_month_year() {
  LegMaturityMonthYear leg_maturity_month_year_sent;
  LegMaturityMonthYear leg_maturity_month_year_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_leg_maturity_month_year(leg_maturity_month_year_sent, 0)
  :: pattern == 1 -> fill_leg_maturity_month_year(leg_maturity_month_year_sent, 32)
  :: pattern == 2 -> fill_leg_maturity_month_year(leg_maturity_month_year_sent, 255)
  :: else -> ramp_leg_maturity_month_year(leg_maturity_month_year_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_leg_maturity_month_year(leg_maturity_month_year_sent);
    assert(at == 5);
    at = 0;
    decode_leg_maturity_month_year(leg_maturity_month_year_got);
    assert(at == 5);
    equal_leg_maturity_month_year(leg_maturity_month_year_got, leg_maturity_month_year_sent)
  }
}

/* Group Size Encoding: encoded, read back, and compared */
proctype check_group_size_encoding() {
  GroupSizeEncoding group_size_encoding_sent;
  GroupSizeEncoding group_size_encoding_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_size_encoding(group_size_encoding_sent, 0)
  :: pattern == 1 -> fill_group_size_encoding(group_size_encoding_sent, 32)
  :: pattern == 2 -> fill_group_size_encoding(group_size_encoding_sent, 255)
  :: else -> ramp_group_size_encoding(group_size_encoding_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_size_encoding(group_size_encoding_sent);
    assert(at == 4);
    at = 0;
    decode_group_size_encoding(group_size_encoding_got);
    assert(at == 4);
    equal_group_size_encoding(group_size_encoding_got, group_size_encoding_sent)
  }
}

/* Md Entry Px Decimal: encoded, read back, and compared */
proctype check_md_entry_px_decimal() {
  MdEntryPxDecimal md_entry_px_decimal_sent;
  MdEntryPxDecimal md_entry_px_decimal_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_md_entry_px_decimal(md_entry_px_decimal_sent, 0)
  :: pattern == 1 -> fill_md_entry_px_decimal(md_entry_px_decimal_sent, 32)
  :: pattern == 2 -> fill_md_entry_px_decimal(md_entry_px_decimal_sent, 255)
  :: else -> ramp_md_entry_px_decimal(md_entry_px_decimal_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_md_entry_px_decimal(md_entry_px_decimal_sent);
    assert(at == 9);
    at = 0;
    decode_md_entry_px_decimal(md_entry_px_decimal_got);
    assert(at == 9);
    equal_md_entry_px_decimal(md_entry_px_decimal_got, md_entry_px_decimal_sent)
  }
}

/* Yield: encoded, read back, and compared */
proctype check_yield() {
  Yield yield_sent;
  Yield yield_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_yield(yield_sent, 0)
  :: pattern == 1 -> fill_yield(yield_sent, 32)
  :: pattern == 2 -> fill_yield(yield_sent, 255)
  :: else -> ramp_yield(yield_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_yield(yield_sent);
    assert(at == 9);
    at = 0;
    decode_yield(yield_got);
    assert(at == 9);
    equal_yield(yield_got, yield_sent)
  }
}

/* Net Chg Prev Day: encoded, read back, and compared */
proctype check_net_chg_prev_day() {
  NetChgPrevDay net_chg_prev_day_sent;
  NetChgPrevDay net_chg_prev_day_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_net_chg_prev_day(net_chg_prev_day_sent, 0)
  :: pattern == 1 -> fill_net_chg_prev_day(net_chg_prev_day_sent, 32)
  :: pattern == 2 -> fill_net_chg_prev_day(net_chg_prev_day_sent, 255)
  :: else -> ramp_net_chg_prev_day(net_chg_prev_day_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_net_chg_prev_day(net_chg_prev_day_sent);
    assert(at == 9);
    at = 0;
    decode_net_chg_prev_day(net_chg_prev_day_got);
    assert(at == 9);
    equal_net_chg_prev_day(net_chg_prev_day_got, net_chg_prev_day_sent)
  }
}

/* Net Pct Chg: encoded, read back, and compared */
proctype check_net_pct_chg() {
  NetPctChg net_pct_chg_sent;
  NetPctChg net_pct_chg_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_net_pct_chg(net_pct_chg_sent, 0)
  :: pattern == 1 -> fill_net_pct_chg(net_pct_chg_sent, 32)
  :: pattern == 2 -> fill_net_pct_chg(net_pct_chg_sent, 255)
  :: else -> ramp_net_pct_chg(net_pct_chg_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_net_pct_chg(net_pct_chg_sent);
    assert(at == 9);
    at = 0;
    decode_net_pct_chg(net_pct_chg_got);
    assert(at == 9);
    equal_net_pct_chg(net_pct_chg_got, net_pct_chg_sent)
  }
}

/* Percent Trading: encoded, read back, and compared */
proctype check_percent_trading() {
  PercentTrading percent_trading_sent;
  PercentTrading percent_trading_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_percent_trading(percent_trading_sent, 0)
  :: pattern == 1 -> fill_percent_trading(percent_trading_sent, 32)
  :: pattern == 2 -> fill_percent_trading(percent_trading_sent, 255)
  :: else -> ramp_percent_trading(percent_trading_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_percent_trading(percent_trading_sent);
    assert(at == 9);
    at = 0;
    decode_percent_trading(percent_trading_got);
    assert(at == 9);
    equal_percent_trading(percent_trading_got, percent_trading_sent)
  }
}

/* Md Entry Size: encoded, read back, and compared */
proctype check_md_entry_size() {
  MdEntrySize md_entry_size_sent;
  MdEntrySize md_entry_size_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_md_entry_size(md_entry_size_sent, 0)
  :: pattern == 1 -> fill_md_entry_size(md_entry_size_sent, 32)
  :: pattern == 2 -> fill_md_entry_size(md_entry_size_sent, 255)
  :: else -> ramp_md_entry_size(md_entry_size_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_md_entry_size(md_entry_size_sent);
    assert(at == 9);
    at = 0;
    decode_md_entry_size(md_entry_size_got);
    assert(at == 9);
    equal_md_entry_size(md_entry_size_got, md_entry_size_sent)
  }
}

/* Cal Fut Px: encoded, read back, and compared */
proctype check_cal_fut_px() {
  CalFutPx cal_fut_px_sent;
  CalFutPx cal_fut_px_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cal_fut_px(cal_fut_px_sent, 0)
  :: pattern == 1 -> fill_cal_fut_px(cal_fut_px_sent, 32)
  :: pattern == 2 -> fill_cal_fut_px(cal_fut_px_sent, 255)
  :: else -> ramp_cal_fut_px(cal_fut_px_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cal_fut_px(cal_fut_px_sent);
    assert(at == 9);
    at = 0;
    decode_cal_fut_px(cal_fut_px_got);
    assert(at == 9);
    equal_cal_fut_px(cal_fut_px_got, cal_fut_px_sent)
  }
}

/* Strike Price Decimal: encoded, read back, and compared */
proctype check_strike_price_decimal() {
  StrikePriceDecimal strike_price_decimal_sent;
  StrikePriceDecimal strike_price_decimal_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_strike_price_decimal(strike_price_decimal_sent, 0)
  :: pattern == 1 -> fill_strike_price_decimal(strike_price_decimal_sent, 32)
  :: pattern == 2 -> fill_strike_price_decimal(strike_price_decimal_sent, 255)
  :: else -> ramp_strike_price_decimal(strike_price_decimal_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_strike_price_decimal(strike_price_decimal_sent);
    assert(at == 9);
    at = 0;
    decode_strike_price_decimal(strike_price_decimal_got);
    assert(at == 9);
    equal_strike_price_decimal(strike_price_decimal_got, strike_price_decimal_sent)
  }
}

/* Unit Of Measure Qty Decimal: encoded, read back, and compared */
proctype check_unit_of_measure_qty_decimal() {
  UnitOfMeasureQtyDecimal unit_of_measure_qty_decimal_sent;
  UnitOfMeasureQtyDecimal unit_of_measure_qty_decimal_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unit_of_measure_qty_decimal(unit_of_measure_qty_decimal_sent, 0)
  :: pattern == 1 -> fill_unit_of_measure_qty_decimal(unit_of_measure_qty_decimal_sent, 32)
  :: pattern == 2 -> fill_unit_of_measure_qty_decimal(unit_of_measure_qty_decimal_sent, 255)
  :: else -> ramp_unit_of_measure_qty_decimal(unit_of_measure_qty_decimal_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unit_of_measure_qty_decimal(unit_of_measure_qty_decimal_sent);
    assert(at == 9);
    at = 0;
    decode_unit_of_measure_qty_decimal(unit_of_measure_qty_decimal_got);
    assert(at == 9);
    equal_unit_of_measure_qty_decimal(unit_of_measure_qty_decimal_got, unit_of_measure_qty_decimal_sent)
  }
}

/* Min Price Increment: encoded, read back, and compared */
proctype check_min_price_increment() {
  MinPriceIncrement min_price_increment_sent;
  MinPriceIncrement min_price_increment_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_min_price_increment(min_price_increment_sent, 0)
  :: pattern == 1 -> fill_min_price_increment(min_price_increment_sent, 32)
  :: pattern == 2 -> fill_min_price_increment(min_price_increment_sent, 255)
  :: else -> ramp_min_price_increment(min_price_increment_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_min_price_increment(min_price_increment_sent);
    assert(at == 9);
    at = 0;
    decode_min_price_increment(min_price_increment_got);
    assert(at == 9);
    equal_min_price_increment(min_price_increment_got, min_price_increment_sent)
  }
}

/* Previous Fixing Rate: encoded, read back, and compared */
proctype check_previous_fixing_rate() {
  PreviousFixingRate previous_fixing_rate_sent;
  PreviousFixingRate previous_fixing_rate_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_previous_fixing_rate(previous_fixing_rate_sent, 0)
  :: pattern == 1 -> fill_previous_fixing_rate(previous_fixing_rate_sent, 32)
  :: pattern == 2 -> fill_previous_fixing_rate(previous_fixing_rate_sent, 255)
  :: else -> ramp_previous_fixing_rate(previous_fixing_rate_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_previous_fixing_rate(previous_fixing_rate_sent);
    assert(at == 9);
    at = 0;
    decode_previous_fixing_rate(previous_fixing_rate_got);
    assert(at == 9);
    equal_previous_fixing_rate(previous_fixing_rate_got, previous_fixing_rate_sent)
  }
}

/* Interpolation Factor: encoded, read back, and compared */
proctype check_interpolation_factor() {
  InterpolationFactor interpolation_factor_sent;
  InterpolationFactor interpolation_factor_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_interpolation_factor(interpolation_factor_sent, 0)
  :: pattern == 1 -> fill_interpolation_factor(interpolation_factor_sent, 32)
  :: pattern == 2 -> fill_interpolation_factor(interpolation_factor_sent, 255)
  :: else -> ramp_interpolation_factor(interpolation_factor_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_interpolation_factor(interpolation_factor_sent);
    assert(at == 9);
    at = 0;
    decode_interpolation_factor(interpolation_factor_got);
    assert(at == 9);
    equal_interpolation_factor(interpolation_factor_got, interpolation_factor_sent)
  }
}

/* Unit Of Measure Qty Decimal Optional: encoded, read back, and compared */
proctype check_unit_of_measure_qty_decimal_optional() {
  UnitOfMeasureQtyDecimalOptional unit_of_measure_qty_decimal_optional_sent;
  UnitOfMeasureQtyDecimalOptional unit_of_measure_qty_decimal_optional_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unit_of_measure_qty_decimal_optional(unit_of_measure_qty_decimal_optional_sent, 0)
  :: pattern == 1 -> fill_unit_of_measure_qty_decimal_optional(unit_of_measure_qty_decimal_optional_sent, 32)
  :: pattern == 2 -> fill_unit_of_measure_qty_decimal_optional(unit_of_measure_qty_decimal_optional_sent, 255)
  :: else -> ramp_unit_of_measure_qty_decimal_optional(unit_of_measure_qty_decimal_optional_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unit_of_measure_qty_decimal_optional(unit_of_measure_qty_decimal_optional_sent);
    assert(at == 9);
    at = 0;
    decode_unit_of_measure_qty_decimal_optional(unit_of_measure_qty_decimal_optional_got);
    assert(at == 9);
    equal_unit_of_measure_qty_decimal_optional(unit_of_measure_qty_decimal_optional_got, unit_of_measure_qty_decimal_optional_sent)
  }
}

/* Strike Price Decimal Optional: encoded, read back, and compared */
proctype check_strike_price_decimal_optional() {
  StrikePriceDecimalOptional strike_price_decimal_optional_sent;
  StrikePriceDecimalOptional strike_price_decimal_optional_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_strike_price_decimal_optional(strike_price_decimal_optional_sent, 0)
  :: pattern == 1 -> fill_strike_price_decimal_optional(strike_price_decimal_optional_sent, 32)
  :: pattern == 2 -> fill_strike_price_decimal_optional(strike_price_decimal_optional_sent, 255)
  :: else -> ramp_strike_price_decimal_optional(strike_price_decimal_optional_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_strike_price_decimal_optional(strike_price_decimal_optional_sent);
    assert(at == 9);
    at = 0;
    decode_strike_price_decimal_optional(strike_price_decimal_optional_got);
    assert(at == 9);
    equal_strike_price_decimal_optional(strike_price_decimal_optional_got, strike_price_decimal_optional_sent)
  }
}

/* Leg Strike Price Decimal 64 Null: encoded, read back, and compared */
proctype check_leg_strike_price_decimal64_null() {
  LegStrikePriceDecimal64Null leg_strike_price_decimal64_null_sent;
  LegStrikePriceDecimal64Null leg_strike_price_decimal64_null_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_leg_strike_price_decimal64_null(leg_strike_price_decimal64_null_sent, 0)
  :: pattern == 1 -> fill_leg_strike_price_decimal64_null(leg_strike_price_decimal64_null_sent, 32)
  :: pattern == 2 -> fill_leg_strike_price_decimal64_null(leg_strike_price_decimal64_null_sent, 255)
  :: else -> ramp_leg_strike_price_decimal64_null(leg_strike_price_decimal64_null_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_leg_strike_price_decimal64_null(leg_strike_price_decimal64_null_sent);
    assert(at == 9);
    at = 0;
    decode_leg_strike_price_decimal64_null(leg_strike_price_decimal64_null_got);
    assert(at == 9);
    equal_leg_strike_price_decimal64_null(leg_strike_price_decimal64_null_got, leg_strike_price_decimal64_null_sent)
  }
}

/* Leg Unit Of Measure Qty Decimal 64 Null: encoded, read back, and compared */
proctype check_leg_unit_of_measure_qty_decimal64_null() {
  LegUnitOfMeasureQtyDecimal64Null leg_unit_of_measure_qty_decimal64_null_sent;
  LegUnitOfMeasureQtyDecimal64Null leg_unit_of_measure_qty_decimal64_null_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_leg_unit_of_measure_qty_decimal64_null(leg_unit_of_measure_qty_decimal64_null_sent, 0)
  :: pattern == 1 -> fill_leg_unit_of_measure_qty_decimal64_null(leg_unit_of_measure_qty_decimal64_null_sent, 32)
  :: pattern == 2 -> fill_leg_unit_of_measure_qty_decimal64_null(leg_unit_of_measure_qty_decimal64_null_sent, 255)
  :: else -> ramp_leg_unit_of_measure_qty_decimal64_null(leg_unit_of_measure_qty_decimal64_null_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_leg_unit_of_measure_qty_decimal64_null(leg_unit_of_measure_qty_decimal64_null_sent);
    assert(at == 9);
    at = 0;
    decode_leg_unit_of_measure_qty_decimal64_null(leg_unit_of_measure_qty_decimal64_null_got);
    assert(at == 9);
    equal_leg_unit_of_measure_qty_decimal64_null(leg_unit_of_measure_qty_decimal64_null_got, leg_unit_of_measure_qty_decimal64_null_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_technical_header()
  :: run check_simple_binary_header()
  :: run check_message_header()
  :: run check_admin_login()
  :: run check_admin_logout()
  :: run check_group_size()
  :: run check_md_entry_px_decimal_optional()
  :: run check_cal_fut_px_optional()
  :: run check_coupon_rate_optional()
  :: run check_fair_coupon_pct()
  :: run check_leg_purchase_rate()
  :: run check_fixed_npv()
  :: run check_float_npv()
  :: run check_npv()
  :: run check_accrued_coupons()
  :: run check_daily_incremental_eris_pai()
  :: run check_eris_pai()
  :: run check_fed_funds_rate()
  :: run check_min_price_increment_optional()
  :: run check_fixed_payment()
  :: run check_floating_payment()
  :: run check_next_fixed_payment_amount()
  :: run check_next_floating_payment_amount()
  :: run check_previous_eris_pai()
  :: run check_leg_contract_multiplier()
  :: run check_p_v01()
  :: run check_d_v01()
  :: run check_settlement_npv()
  :: run check_final_settlement_futures_price()
  :: run check_maturity_month_year()
  :: run check_underlying_maturity_month_year()
  :: run check_leg_maturity_month_year()
  :: run check_group_size_encoding()
  :: run check_md_entry_px_decimal()
  :: run check_yield()
  :: run check_net_chg_prev_day()
  :: run check_net_pct_chg()
  :: run check_percent_trading()
  :: run check_md_entry_size()
  :: run check_cal_fut_px()
  :: run check_strike_price_decimal()
  :: run check_unit_of_measure_qty_decimal()
  :: run check_min_price_increment()
  :: run check_previous_fixing_rate()
  :: run check_interpolation_factor()
  :: run check_unit_of_measure_qty_decimal_optional()
  :: run check_strike_price_decimal_optional()
  :: run check_leg_strike_price_decimal64_null()
  :: run check_leg_unit_of_measure_qty_decimal64_null()
  fi
}
