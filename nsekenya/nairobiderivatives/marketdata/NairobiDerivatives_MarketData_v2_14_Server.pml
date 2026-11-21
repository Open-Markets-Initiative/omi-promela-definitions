/*
 * Nairobi Securities Exchange Nairobi Derivatives Market Data
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
 *   - a run counted by a field
 *   - a Reassemble rule
 *   - a field filling what is left of what holds it
 *   - a run filling a byte budget a field states
 *   - the dispatch that chooses a message by its type
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 486

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Transport Header: 4 bytes ----------------------------------------------- */

/* Table 1: Transport Header */
typedef TransportHeader {
  byte start_byte;
  byte message_length[2];
  byte length_check
};

int transport_header_at;

/* every byte of Transport Header set to one value */
inline fill_transport_header(transport_header_record, transport_header_value) {
  transport_header_record.start_byte = transport_header_value;
  transport_header_at = 0;
  do
  :: transport_header_at < 2 -> transport_header_record.message_length[transport_header_at] = transport_header_value; transport_header_at = transport_header_at + 1
  :: else -> break
  od;
  transport_header_record.length_check = transport_header_value;
  skip
}

/* each byte of Transport Header set to where it lies, so a field read out of place says so */
inline ramp_transport_header(transport_header_record, transport_header_base) {
  transport_header_record.start_byte = (transport_header_base + 0 + 1) % 256;
  transport_header_at = 0;
  do
  :: transport_header_at < 2 -> transport_header_record.message_length[transport_header_at] = (transport_header_base + 1 + transport_header_at + 1) % 256; transport_header_at = transport_header_at + 1
  :: else -> break
  od;
  transport_header_record.length_check = (transport_header_base + 3 + 1) % 256;
  skip
}

/* Transport Header to the wire, 4 bytes from where the cursor stands */
inline encode_transport_header(transport_header_record) {
  wire[at] = transport_header_record.start_byte; at = at + 1;
  transport_header_at = 0;
  do
  :: transport_header_at < 2 -> wire[at] = transport_header_record.message_length[transport_header_at]; at = at + 1; transport_header_at = transport_header_at + 1
  :: else -> break
  od;
  wire[at] = transport_header_record.length_check; at = at + 1;
  skip
}

/* Transport Header off the wire, 4 bytes from where the cursor stands */
inline decode_transport_header(transport_header_record) {
  transport_header_record.start_byte = wire[at]; at = at + 1;
  transport_header_at = 0;
  do
  :: transport_header_at < 2 -> transport_header_record.message_length[transport_header_at] = wire[at]; at = at + 1; transport_header_at = transport_header_at + 1
  :: else -> break
  od;
  transport_header_record.length_check = wire[at]; at = at + 1;
  skip
}

/* what was read of Transport Header is what was written, byte for byte */
inline equal_transport_header(transport_header_read, transport_header_written) {
  assert(transport_header_read.start_byte == transport_header_written.start_byte);
  transport_header_at = 0;
  do
  :: transport_header_at < 2 -> assert(transport_header_read.message_length[transport_header_at] == transport_header_written.message_length[transport_header_at]); transport_header_at = transport_header_at + 1
  :: else -> break
  od;
  assert(transport_header_read.length_check == transport_header_written.length_check);
  skip
}

/* ---- User Name: 16 bytes ----------------------------------------------------- */

/* User name as assigned by the exchange */
typedef UserName {
  byte user_name_length_byte;
  byte user_name_characters[15]
};

int user_name_at;

/* every byte of User Name set to one value */
inline fill_user_name(user_name_record, user_name_value) {
  user_name_record.user_name_length_byte = user_name_value;
  user_name_at = 0;
  do
  :: user_name_at < 15 -> user_name_record.user_name_characters[user_name_at] = user_name_value; user_name_at = user_name_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Name set to where it lies, so a field read out of place says so */
inline ramp_user_name(user_name_record, user_name_base) {
  user_name_record.user_name_length_byte = (user_name_base + 0 + 1) % 256;
  user_name_at = 0;
  do
  :: user_name_at < 15 -> user_name_record.user_name_characters[user_name_at] = (user_name_base + 1 + user_name_at + 1) % 256; user_name_at = user_name_at + 1
  :: else -> break
  od;
  skip
}

/* User Name to the wire, 16 bytes from where the cursor stands */
inline encode_user_name(user_name_record) {
  wire[at] = user_name_record.user_name_length_byte; at = at + 1;
  user_name_at = 0;
  do
  :: user_name_at < 15 -> wire[at] = user_name_record.user_name_characters[user_name_at]; at = at + 1; user_name_at = user_name_at + 1
  :: else -> break
  od;
  skip
}

/* User Name off the wire, 16 bytes from where the cursor stands */
inline decode_user_name(user_name_record) {
  user_name_record.user_name_length_byte = wire[at]; at = at + 1;
  user_name_at = 0;
  do
  :: user_name_at < 15 -> user_name_record.user_name_characters[user_name_at] = wire[at]; at = at + 1; user_name_at = user_name_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Name is what was written, byte for byte */
inline equal_user_name(user_name_read, user_name_written) {
  assert(user_name_read.user_name_length_byte == user_name_written.user_name_length_byte);
  user_name_at = 0;
  do
  :: user_name_at < 15 -> assert(user_name_read.user_name_characters[user_name_at] == user_name_written.user_name_characters[user_name_at]); user_name_at = user_name_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Time: 4 bytes ----------------------------------------------------------- */

/* Time */
typedef Time {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Time set to one value */
inline fill_time(time_record, time_value) {
  time_record.hours = time_value;
  time_record.minutes = time_value;
  time_record.seconds = time_value;
  time_record.unused_1 = time_value;
  skip
}

/* each byte of Time set to where it lies, so a field read out of place says so */
inline ramp_time(time_record, time_base) {
  time_record.hours = (time_base + 0 + 1) % 256;
  time_record.minutes = (time_base + 1 + 1) % 256;
  time_record.seconds = (time_base + 2 + 1) % 256;
  time_record.unused_1 = (time_base + 3 + 1) % 256;
  skip
}

/* Time to the wire, 4 bytes from where the cursor stands */
inline encode_time(time_record) {
  wire[at] = time_record.hours; at = at + 1;
  wire[at] = time_record.minutes; at = at + 1;
  wire[at] = time_record.seconds; at = at + 1;
  wire[at] = time_record.unused_1; at = at + 1;
  skip
}

/* Time off the wire, 4 bytes from where the cursor stands */
inline decode_time(time_record) {
  time_record.hours = wire[at]; at = at + 1;
  time_record.minutes = wire[at]; at = at + 1;
  time_record.seconds = wire[at]; at = at + 1;
  time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Time is what was written, byte for byte */
inline equal_time(time_read, time_written) {
  assert(time_read.hours == time_written.hours);
  assert(time_read.minutes == time_written.minutes);
  assert(time_read.seconds == time_written.seconds);
  assert(time_read.unused_1 == time_written.unused_1);
  skip
}

/* ---- Server Message Header: 29 bytes ----------------------------------------- */

/* Table 2: Message Header */
typedef ServerMessageHeader {
  byte sequence_number[4];
  UserName user_name;
  byte user_number[4];
  Time time;
  byte server_message_type
};

int server_message_header_at;

/* every byte of Server Message Header set to one value */
inline fill_server_message_header(server_message_header_record, server_message_header_value) {
  server_message_header_at = 0;
  do
  :: server_message_header_at < 4 -> server_message_header_record.sequence_number[server_message_header_at] = server_message_header_value; server_message_header_at = server_message_header_at + 1
  :: else -> break
  od;
  fill_user_name(server_message_header_record.user_name, server_message_header_value);
  server_message_header_at = 0;
  do
  :: server_message_header_at < 4 -> server_message_header_record.user_number[server_message_header_at] = server_message_header_value; server_message_header_at = server_message_header_at + 1
  :: else -> break
  od;
  fill_time(server_message_header_record.time, server_message_header_value);
  server_message_header_record.server_message_type = server_message_header_value;
  skip
}

/* each byte of Server Message Header set to where it lies, so a field read out of place says so */
inline ramp_server_message_header(server_message_header_record, server_message_header_base) {
  server_message_header_at = 0;
  do
  :: server_message_header_at < 4 -> server_message_header_record.sequence_number[server_message_header_at] = (server_message_header_base + 0 + server_message_header_at + 1) % 256; server_message_header_at = server_message_header_at + 1
  :: else -> break
  od;
  ramp_user_name(server_message_header_record.user_name, server_message_header_base + 4);
  server_message_header_at = 0;
  do
  :: server_message_header_at < 4 -> server_message_header_record.user_number[server_message_header_at] = (server_message_header_base + 20 + server_message_header_at + 1) % 256; server_message_header_at = server_message_header_at + 1
  :: else -> break
  od;
  ramp_time(server_message_header_record.time, server_message_header_base + 24);
  server_message_header_record.server_message_type = (server_message_header_base + 28 + 1) % 256;
  skip
}

/* Server Message Header to the wire, 29 bytes from where the cursor stands */
inline encode_server_message_header(server_message_header_record) {
  server_message_header_at = 0;
  do
  :: server_message_header_at < 4 -> wire[at] = server_message_header_record.sequence_number[server_message_header_at]; at = at + 1; server_message_header_at = server_message_header_at + 1
  :: else -> break
  od;
  encode_user_name(server_message_header_record.user_name);
  server_message_header_at = 0;
  do
  :: server_message_header_at < 4 -> wire[at] = server_message_header_record.user_number[server_message_header_at]; at = at + 1; server_message_header_at = server_message_header_at + 1
  :: else -> break
  od;
  encode_time(server_message_header_record.time);
  wire[at] = server_message_header_record.server_message_type; at = at + 1;
  skip
}

/* Server Message Header off the wire, 29 bytes from where the cursor stands */
inline decode_server_message_header(server_message_header_record) {
  server_message_header_at = 0;
  do
  :: server_message_header_at < 4 -> server_message_header_record.sequence_number[server_message_header_at] = wire[at]; at = at + 1; server_message_header_at = server_message_header_at + 1
  :: else -> break
  od;
  decode_user_name(server_message_header_record.user_name);
  server_message_header_at = 0;
  do
  :: server_message_header_at < 4 -> server_message_header_record.user_number[server_message_header_at] = wire[at]; at = at + 1; server_message_header_at = server_message_header_at + 1
  :: else -> break
  od;
  decode_time(server_message_header_record.time);
  server_message_header_record.server_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Server Message Header is what was written, byte for byte */
inline equal_server_message_header(server_message_header_read, server_message_header_written) {
  server_message_header_at = 0;
  do
  :: server_message_header_at < 4 -> assert(server_message_header_read.sequence_number[server_message_header_at] == server_message_header_written.sequence_number[server_message_header_at]); server_message_header_at = server_message_header_at + 1
  :: else -> break
  od;
  equal_user_name(server_message_header_read.user_name, server_message_header_written.user_name);
  server_message_header_at = 0;
  do
  :: server_message_header_at < 4 -> assert(server_message_header_read.user_number[server_message_header_at] == server_message_header_written.user_number[server_message_header_at]); server_message_header_at = server_message_header_at + 1
  :: else -> break
  od;
  equal_time(server_message_header_read.time, server_message_header_written.time);
  assert(server_message_header_read.server_message_type == server_message_header_written.server_message_type);
  skip
}

/* ---- Today Date: 12 bytes ---------------------------------------------------- */

/* Today date */
typedef TodayDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int today_date_at;

/* every byte of Today Date set to one value */
inline fill_today_date(today_date_record, today_date_value) {
  today_date_at = 0;
  do
  :: today_date_at < 4 -> today_date_record.year[today_date_at] = today_date_value; today_date_at = today_date_at + 1
  :: else -> break
  od;
  today_date_at = 0;
  do
  :: today_date_at < 4 -> today_date_record.month[today_date_at] = today_date_value; today_date_at = today_date_at + 1
  :: else -> break
  od;
  today_date_at = 0;
  do
  :: today_date_at < 4 -> today_date_record.day[today_date_at] = today_date_value; today_date_at = today_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Today Date set to where it lies, so a field read out of place says so */
inline ramp_today_date(today_date_record, today_date_base) {
  today_date_at = 0;
  do
  :: today_date_at < 4 -> today_date_record.year[today_date_at] = (today_date_base + 0 + today_date_at + 1) % 256; today_date_at = today_date_at + 1
  :: else -> break
  od;
  today_date_at = 0;
  do
  :: today_date_at < 4 -> today_date_record.month[today_date_at] = (today_date_base + 4 + today_date_at + 1) % 256; today_date_at = today_date_at + 1
  :: else -> break
  od;
  today_date_at = 0;
  do
  :: today_date_at < 4 -> today_date_record.day[today_date_at] = (today_date_base + 8 + today_date_at + 1) % 256; today_date_at = today_date_at + 1
  :: else -> break
  od;
  skip
}

/* Today Date to the wire, 12 bytes from where the cursor stands */
inline encode_today_date(today_date_record) {
  today_date_at = 0;
  do
  :: today_date_at < 4 -> wire[at] = today_date_record.year[today_date_at]; at = at + 1; today_date_at = today_date_at + 1
  :: else -> break
  od;
  today_date_at = 0;
  do
  :: today_date_at < 4 -> wire[at] = today_date_record.month[today_date_at]; at = at + 1; today_date_at = today_date_at + 1
  :: else -> break
  od;
  today_date_at = 0;
  do
  :: today_date_at < 4 -> wire[at] = today_date_record.day[today_date_at]; at = at + 1; today_date_at = today_date_at + 1
  :: else -> break
  od;
  skip
}

/* Today Date off the wire, 12 bytes from where the cursor stands */
inline decode_today_date(today_date_record) {
  today_date_at = 0;
  do
  :: today_date_at < 4 -> today_date_record.year[today_date_at] = wire[at]; at = at + 1; today_date_at = today_date_at + 1
  :: else -> break
  od;
  today_date_at = 0;
  do
  :: today_date_at < 4 -> today_date_record.month[today_date_at] = wire[at]; at = at + 1; today_date_at = today_date_at + 1
  :: else -> break
  od;
  today_date_at = 0;
  do
  :: today_date_at < 4 -> today_date_record.day[today_date_at] = wire[at]; at = at + 1; today_date_at = today_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Today Date is what was written, byte for byte */
inline equal_today_date(today_date_read, today_date_written) {
  today_date_at = 0;
  do
  :: today_date_at < 4 -> assert(today_date_read.year[today_date_at] == today_date_written.year[today_date_at]); today_date_at = today_date_at + 1
  :: else -> break
  od;
  today_date_at = 0;
  do
  :: today_date_at < 4 -> assert(today_date_read.month[today_date_at] == today_date_written.month[today_date_at]); today_date_at = today_date_at + 1
  :: else -> break
  od;
  today_date_at = 0;
  do
  :: today_date_at < 4 -> assert(today_date_read.day[today_date_at] == today_date_written.day[today_date_at]); today_date_at = today_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Country Code: 4 bytes --------------------------------------------------- */

/* Indicates the exchanges country code. */
typedef CountryCode {
  byte country_code_length_byte;
  byte country_code_characters[3]
};

int country_code_at;

/* every byte of Country Code set to one value */
inline fill_country_code(country_code_record, country_code_value) {
  country_code_record.country_code_length_byte = country_code_value;
  country_code_at = 0;
  do
  :: country_code_at < 3 -> country_code_record.country_code_characters[country_code_at] = country_code_value; country_code_at = country_code_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Country Code set to where it lies, so a field read out of place says so */
inline ramp_country_code(country_code_record, country_code_base) {
  country_code_record.country_code_length_byte = (country_code_base + 0 + 1) % 256;
  country_code_at = 0;
  do
  :: country_code_at < 3 -> country_code_record.country_code_characters[country_code_at] = (country_code_base + 1 + country_code_at + 1) % 256; country_code_at = country_code_at + 1
  :: else -> break
  od;
  skip
}

/* Country Code to the wire, 4 bytes from where the cursor stands */
inline encode_country_code(country_code_record) {
  wire[at] = country_code_record.country_code_length_byte; at = at + 1;
  country_code_at = 0;
  do
  :: country_code_at < 3 -> wire[at] = country_code_record.country_code_characters[country_code_at]; at = at + 1; country_code_at = country_code_at + 1
  :: else -> break
  od;
  skip
}

/* Country Code off the wire, 4 bytes from where the cursor stands */
inline decode_country_code(country_code_record) {
  country_code_record.country_code_length_byte = wire[at]; at = at + 1;
  country_code_at = 0;
  do
  :: country_code_at < 3 -> country_code_record.country_code_characters[country_code_at] = wire[at]; at = at + 1; country_code_at = country_code_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Country Code is what was written, byte for byte */
inline equal_country_code(country_code_read, country_code_written) {
  assert(country_code_read.country_code_length_byte == country_code_written.country_code_length_byte);
  country_code_at = 0;
  do
  :: country_code_at < 3 -> assert(country_code_read.country_code_characters[country_code_at] == country_code_written.country_code_characters[country_code_at]); country_code_at = country_code_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Previous Business Day: 12 bytes ----------------------------------------- */

/* Previous Business Day */
typedef PreviousBusinessDay {
  byte year[4];
  byte month[4];
  byte day[4]
};

int previous_business_day_at;

/* every byte of Previous Business Day set to one value */
inline fill_previous_business_day(previous_business_day_record, previous_business_day_value) {
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> previous_business_day_record.year[previous_business_day_at] = previous_business_day_value; previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> previous_business_day_record.month[previous_business_day_at] = previous_business_day_value; previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> previous_business_day_record.day[previous_business_day_at] = previous_business_day_value; previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Previous Business Day set to where it lies, so a field read out of place says so */
inline ramp_previous_business_day(previous_business_day_record, previous_business_day_base) {
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> previous_business_day_record.year[previous_business_day_at] = (previous_business_day_base + 0 + previous_business_day_at + 1) % 256; previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> previous_business_day_record.month[previous_business_day_at] = (previous_business_day_base + 4 + previous_business_day_at + 1) % 256; previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> previous_business_day_record.day[previous_business_day_at] = (previous_business_day_base + 8 + previous_business_day_at + 1) % 256; previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  skip
}

/* Previous Business Day to the wire, 12 bytes from where the cursor stands */
inline encode_previous_business_day(previous_business_day_record) {
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> wire[at] = previous_business_day_record.year[previous_business_day_at]; at = at + 1; previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> wire[at] = previous_business_day_record.month[previous_business_day_at]; at = at + 1; previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> wire[at] = previous_business_day_record.day[previous_business_day_at]; at = at + 1; previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  skip
}

/* Previous Business Day off the wire, 12 bytes from where the cursor stands */
inline decode_previous_business_day(previous_business_day_record) {
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> previous_business_day_record.year[previous_business_day_at] = wire[at]; at = at + 1; previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> previous_business_day_record.month[previous_business_day_at] = wire[at]; at = at + 1; previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> previous_business_day_record.day[previous_business_day_at] = wire[at]; at = at + 1; previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Previous Business Day is what was written, byte for byte */
inline equal_previous_business_day(previous_business_day_read, previous_business_day_written) {
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> assert(previous_business_day_read.year[previous_business_day_at] == previous_business_day_written.year[previous_business_day_at]); previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> assert(previous_business_day_read.month[previous_business_day_at] == previous_business_day_written.month[previous_business_day_at]); previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  previous_business_day_at = 0;
  do
  :: previous_business_day_at < 4 -> assert(previous_business_day_read.day[previous_business_day_at] == previous_business_day_written.day[previous_business_day_at]); previous_business_day_at = previous_business_day_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Text P 50: 50 bytes ----------------------------------------------------- */

/* Indicates further detail on logon failures and success. */
typedef TextP50 {
  byte text_p_50_length_byte;
  byte text_p_50_characters[49]
};

int text_p50_at;

/* every byte of Text P 50 set to one value */
inline fill_text_p50(text_p50_record, text_p50_value) {
  text_p50_record.text_p_50_length_byte = text_p50_value;
  text_p50_at = 0;
  do
  :: text_p50_at < 49 -> text_p50_record.text_p_50_characters[text_p50_at] = text_p50_value; text_p50_at = text_p50_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Text P 50 set to where it lies, so a field read out of place says so */
inline ramp_text_p50(text_p50_record, text_p50_base) {
  text_p50_record.text_p_50_length_byte = (text_p50_base + 0 + 1) % 256;
  text_p50_at = 0;
  do
  :: text_p50_at < 49 -> text_p50_record.text_p_50_characters[text_p50_at] = (text_p50_base + 1 + text_p50_at + 1) % 256; text_p50_at = text_p50_at + 1
  :: else -> break
  od;
  skip
}

/* Text P 50 to the wire, 50 bytes from where the cursor stands */
inline encode_text_p50(text_p50_record) {
  wire[at] = text_p50_record.text_p_50_length_byte; at = at + 1;
  text_p50_at = 0;
  do
  :: text_p50_at < 49 -> wire[at] = text_p50_record.text_p_50_characters[text_p50_at]; at = at + 1; text_p50_at = text_p50_at + 1
  :: else -> break
  od;
  skip
}

/* Text P 50 off the wire, 50 bytes from where the cursor stands */
inline decode_text_p50(text_p50_record) {
  text_p50_record.text_p_50_length_byte = wire[at]; at = at + 1;
  text_p50_at = 0;
  do
  :: text_p50_at < 49 -> text_p50_record.text_p_50_characters[text_p50_at] = wire[at]; at = at + 1; text_p50_at = text_p50_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Text P 50 is what was written, byte for byte */
inline equal_text_p50(text_p50_read, text_p50_written) {
  assert(text_p50_read.text_p_50_length_byte == text_p50_written.text_p_50_length_byte);
  text_p50_at = 0;
  do
  :: text_p50_at < 49 -> assert(text_p50_read.text_p_50_characters[text_p50_at] == text_p50_written.text_p_50_characters[text_p50_at]); text_p50_at = text_p50_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Member Code P 6: 6 bytes ------------------------------------------------ */

/* Member code of affiliated member. */
typedef MemberCodeP6 {
  byte member_code_p_6_length_byte;
  byte member_code_p_6_characters[5]
};

int member_code_p6_at;

/* every byte of Member Code P 6 set to one value */
inline fill_member_code_p6(member_code_p6_record, member_code_p6_value) {
  member_code_p6_record.member_code_p_6_length_byte = member_code_p6_value;
  member_code_p6_at = 0;
  do
  :: member_code_p6_at < 5 -> member_code_p6_record.member_code_p_6_characters[member_code_p6_at] = member_code_p6_value; member_code_p6_at = member_code_p6_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Member Code P 6 set to where it lies, so a field read out of place says so */
inline ramp_member_code_p6(member_code_p6_record, member_code_p6_base) {
  member_code_p6_record.member_code_p_6_length_byte = (member_code_p6_base + 0 + 1) % 256;
  member_code_p6_at = 0;
  do
  :: member_code_p6_at < 5 -> member_code_p6_record.member_code_p_6_characters[member_code_p6_at] = (member_code_p6_base + 1 + member_code_p6_at + 1) % 256; member_code_p6_at = member_code_p6_at + 1
  :: else -> break
  od;
  skip
}

/* Member Code P 6 to the wire, 6 bytes from where the cursor stands */
inline encode_member_code_p6(member_code_p6_record) {
  wire[at] = member_code_p6_record.member_code_p_6_length_byte; at = at + 1;
  member_code_p6_at = 0;
  do
  :: member_code_p6_at < 5 -> wire[at] = member_code_p6_record.member_code_p_6_characters[member_code_p6_at]; at = at + 1; member_code_p6_at = member_code_p6_at + 1
  :: else -> break
  od;
  skip
}

/* Member Code P 6 off the wire, 6 bytes from where the cursor stands */
inline decode_member_code_p6(member_code_p6_record) {
  member_code_p6_record.member_code_p_6_length_byte = wire[at]; at = at + 1;
  member_code_p6_at = 0;
  do
  :: member_code_p6_at < 5 -> member_code_p6_record.member_code_p_6_characters[member_code_p6_at] = wire[at]; at = at + 1; member_code_p6_at = member_code_p6_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Member Code P 6 is what was written, byte for byte */
inline equal_member_code_p6(member_code_p6_read, member_code_p6_written) {
  assert(member_code_p6_read.member_code_p_6_length_byte == member_code_p6_written.member_code_p_6_length_byte);
  member_code_p6_at = 0;
  do
  :: member_code_p6_at < 5 -> assert(member_code_p6_read.member_code_p_6_characters[member_code_p6_at] == member_code_p6_written.member_code_p_6_characters[member_code_p6_at]); member_code_p6_at = member_code_p6_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Session Key Challenge Message: 243 bytes -------------------------------- */

/* Returned to a user when a successful TCP socket connection is established to the system. */
typedef SessionKeyChallengeMessage {
  byte challenge[243]
};

int session_key_challenge_message_at;

/* every byte of Session Key Challenge Message set to one value */
inline fill_session_key_challenge_message(session_key_challenge_message_record, session_key_challenge_message_value) {
  session_key_challenge_message_at = 0;
  do
  :: session_key_challenge_message_at < 243 -> session_key_challenge_message_record.challenge[session_key_challenge_message_at] = session_key_challenge_message_value; session_key_challenge_message_at = session_key_challenge_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Session Key Challenge Message set to where it lies, so a field read out of place says so */
inline ramp_session_key_challenge_message(session_key_challenge_message_record, session_key_challenge_message_base) {
  session_key_challenge_message_at = 0;
  do
  :: session_key_challenge_message_at < 243 -> session_key_challenge_message_record.challenge[session_key_challenge_message_at] = (session_key_challenge_message_base + 0 + session_key_challenge_message_at + 1) % 256; session_key_challenge_message_at = session_key_challenge_message_at + 1
  :: else -> break
  od;
  skip
}

/* Session Key Challenge Message to the wire, 243 bytes from where the cursor stands */
inline encode_session_key_challenge_message(session_key_challenge_message_record) {
  session_key_challenge_message_at = 0;
  do
  :: session_key_challenge_message_at < 243 -> wire[at] = session_key_challenge_message_record.challenge[session_key_challenge_message_at]; at = at + 1; session_key_challenge_message_at = session_key_challenge_message_at + 1
  :: else -> break
  od;
  skip
}

/* Session Key Challenge Message off the wire, 243 bytes from where the cursor stands */
inline decode_session_key_challenge_message(session_key_challenge_message_record) {
  session_key_challenge_message_at = 0;
  do
  :: session_key_challenge_message_at < 243 -> session_key_challenge_message_record.challenge[session_key_challenge_message_at] = wire[at]; at = at + 1; session_key_challenge_message_at = session_key_challenge_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Session Key Challenge Message is what was written, byte for byte */
inline equal_session_key_challenge_message(session_key_challenge_message_read, session_key_challenge_message_written) {
  session_key_challenge_message_at = 0;
  do
  :: session_key_challenge_message_at < 243 -> assert(session_key_challenge_message_read.challenge[session_key_challenge_message_at] == session_key_challenge_message_written.challenge[session_key_challenge_message_at]); session_key_challenge_message_at = session_key_challenge_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Download Date: 12 bytes ------------------------------------------------- */

/* Download Date */
typedef DownloadDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int download_date_at;

/* every byte of Download Date set to one value */
inline fill_download_date(download_date_record, download_date_value) {
  download_date_at = 0;
  do
  :: download_date_at < 4 -> download_date_record.year[download_date_at] = download_date_value; download_date_at = download_date_at + 1
  :: else -> break
  od;
  download_date_at = 0;
  do
  :: download_date_at < 4 -> download_date_record.month[download_date_at] = download_date_value; download_date_at = download_date_at + 1
  :: else -> break
  od;
  download_date_at = 0;
  do
  :: download_date_at < 4 -> download_date_record.day[download_date_at] = download_date_value; download_date_at = download_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Download Date set to where it lies, so a field read out of place says so */
inline ramp_download_date(download_date_record, download_date_base) {
  download_date_at = 0;
  do
  :: download_date_at < 4 -> download_date_record.year[download_date_at] = (download_date_base + 0 + download_date_at + 1) % 256; download_date_at = download_date_at + 1
  :: else -> break
  od;
  download_date_at = 0;
  do
  :: download_date_at < 4 -> download_date_record.month[download_date_at] = (download_date_base + 4 + download_date_at + 1) % 256; download_date_at = download_date_at + 1
  :: else -> break
  od;
  download_date_at = 0;
  do
  :: download_date_at < 4 -> download_date_record.day[download_date_at] = (download_date_base + 8 + download_date_at + 1) % 256; download_date_at = download_date_at + 1
  :: else -> break
  od;
  skip
}

/* Download Date to the wire, 12 bytes from where the cursor stands */
inline encode_download_date(download_date_record) {
  download_date_at = 0;
  do
  :: download_date_at < 4 -> wire[at] = download_date_record.year[download_date_at]; at = at + 1; download_date_at = download_date_at + 1
  :: else -> break
  od;
  download_date_at = 0;
  do
  :: download_date_at < 4 -> wire[at] = download_date_record.month[download_date_at]; at = at + 1; download_date_at = download_date_at + 1
  :: else -> break
  od;
  download_date_at = 0;
  do
  :: download_date_at < 4 -> wire[at] = download_date_record.day[download_date_at]; at = at + 1; download_date_at = download_date_at + 1
  :: else -> break
  od;
  skip
}

/* Download Date off the wire, 12 bytes from where the cursor stands */
inline decode_download_date(download_date_record) {
  download_date_at = 0;
  do
  :: download_date_at < 4 -> download_date_record.year[download_date_at] = wire[at]; at = at + 1; download_date_at = download_date_at + 1
  :: else -> break
  od;
  download_date_at = 0;
  do
  :: download_date_at < 4 -> download_date_record.month[download_date_at] = wire[at]; at = at + 1; download_date_at = download_date_at + 1
  :: else -> break
  od;
  download_date_at = 0;
  do
  :: download_date_at < 4 -> download_date_record.day[download_date_at] = wire[at]; at = at + 1; download_date_at = download_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Download Date is what was written, byte for byte */
inline equal_download_date(download_date_read, download_date_written) {
  download_date_at = 0;
  do
  :: download_date_at < 4 -> assert(download_date_read.year[download_date_at] == download_date_written.year[download_date_at]); download_date_at = download_date_at + 1
  :: else -> break
  od;
  download_date_at = 0;
  do
  :: download_date_at < 4 -> assert(download_date_read.month[download_date_at] == download_date_written.month[download_date_at]); download_date_at = download_date_at + 1
  :: else -> break
  od;
  download_date_at = 0;
  do
  :: download_date_at < 4 -> assert(download_date_read.day[download_date_at] == download_date_written.day[download_date_at]); download_date_at = download_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Date: 12 bytes ---------------------------------------------------------- */

/* Date */
typedef Date {
  byte year[4];
  byte month[4];
  byte day[4]
};

int date_at;

/* every byte of Date set to one value */
inline fill_date(date_record, date_value) {
  date_at = 0;
  do
  :: date_at < 4 -> date_record.year[date_at] = date_value; date_at = date_at + 1
  :: else -> break
  od;
  date_at = 0;
  do
  :: date_at < 4 -> date_record.month[date_at] = date_value; date_at = date_at + 1
  :: else -> break
  od;
  date_at = 0;
  do
  :: date_at < 4 -> date_record.day[date_at] = date_value; date_at = date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Date set to where it lies, so a field read out of place says so */
inline ramp_date(date_record, date_base) {
  date_at = 0;
  do
  :: date_at < 4 -> date_record.year[date_at] = (date_base + 0 + date_at + 1) % 256; date_at = date_at + 1
  :: else -> break
  od;
  date_at = 0;
  do
  :: date_at < 4 -> date_record.month[date_at] = (date_base + 4 + date_at + 1) % 256; date_at = date_at + 1
  :: else -> break
  od;
  date_at = 0;
  do
  :: date_at < 4 -> date_record.day[date_at] = (date_base + 8 + date_at + 1) % 256; date_at = date_at + 1
  :: else -> break
  od;
  skip
}

/* Date to the wire, 12 bytes from where the cursor stands */
inline encode_date(date_record) {
  date_at = 0;
  do
  :: date_at < 4 -> wire[at] = date_record.year[date_at]; at = at + 1; date_at = date_at + 1
  :: else -> break
  od;
  date_at = 0;
  do
  :: date_at < 4 -> wire[at] = date_record.month[date_at]; at = at + 1; date_at = date_at + 1
  :: else -> break
  od;
  date_at = 0;
  do
  :: date_at < 4 -> wire[at] = date_record.day[date_at]; at = at + 1; date_at = date_at + 1
  :: else -> break
  od;
  skip
}

/* Date off the wire, 12 bytes from where the cursor stands */
inline decode_date(date_record) {
  date_at = 0;
  do
  :: date_at < 4 -> date_record.year[date_at] = wire[at]; at = at + 1; date_at = date_at + 1
  :: else -> break
  od;
  date_at = 0;
  do
  :: date_at < 4 -> date_record.month[date_at] = wire[at]; at = at + 1; date_at = date_at + 1
  :: else -> break
  od;
  date_at = 0;
  do
  :: date_at < 4 -> date_record.day[date_at] = wire[at]; at = at + 1; date_at = date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Date is what was written, byte for byte */
inline equal_date(date_read, date_written) {
  date_at = 0;
  do
  :: date_at < 4 -> assert(date_read.year[date_at] == date_written.year[date_at]); date_at = date_at + 1
  :: else -> break
  od;
  date_at = 0;
  do
  :: date_at < 4 -> assert(date_read.month[date_at] == date_written.month[date_at]); date_at = date_at + 1
  :: else -> break
  od;
  date_at = 0;
  do
  :: date_at < 4 -> assert(date_read.day[date_at] == date_written.day[date_at]); date_at = date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Name P 5: 5 bytes -------------------------------------------- */

/* Defines the instrument which represents this contract. */
typedef InstrumentNameP5 {
  byte instrument_name_p_5_length_byte;
  byte instrument_name_p_5_characters[4]
};

int instrument_name_p5_at;

/* every byte of Instrument Name P 5 set to one value */
inline fill_instrument_name_p5(instrument_name_p5_record, instrument_name_p5_value) {
  instrument_name_p5_record.instrument_name_p_5_length_byte = instrument_name_p5_value;
  instrument_name_p5_at = 0;
  do
  :: instrument_name_p5_at < 4 -> instrument_name_p5_record.instrument_name_p_5_characters[instrument_name_p5_at] = instrument_name_p5_value; instrument_name_p5_at = instrument_name_p5_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Name P 5 set to where it lies, so a field read out of place says so */
inline ramp_instrument_name_p5(instrument_name_p5_record, instrument_name_p5_base) {
  instrument_name_p5_record.instrument_name_p_5_length_byte = (instrument_name_p5_base + 0 + 1) % 256;
  instrument_name_p5_at = 0;
  do
  :: instrument_name_p5_at < 4 -> instrument_name_p5_record.instrument_name_p_5_characters[instrument_name_p5_at] = (instrument_name_p5_base + 1 + instrument_name_p5_at + 1) % 256; instrument_name_p5_at = instrument_name_p5_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Name P 5 to the wire, 5 bytes from where the cursor stands */
inline encode_instrument_name_p5(instrument_name_p5_record) {
  wire[at] = instrument_name_p5_record.instrument_name_p_5_length_byte; at = at + 1;
  instrument_name_p5_at = 0;
  do
  :: instrument_name_p5_at < 4 -> wire[at] = instrument_name_p5_record.instrument_name_p_5_characters[instrument_name_p5_at]; at = at + 1; instrument_name_p5_at = instrument_name_p5_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Name P 5 off the wire, 5 bytes from where the cursor stands */
inline decode_instrument_name_p5(instrument_name_p5_record) {
  instrument_name_p5_record.instrument_name_p_5_length_byte = wire[at]; at = at + 1;
  instrument_name_p5_at = 0;
  do
  :: instrument_name_p5_at < 4 -> instrument_name_p5_record.instrument_name_p_5_characters[instrument_name_p5_at] = wire[at]; at = at + 1; instrument_name_p5_at = instrument_name_p5_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Name P 5 is what was written, byte for byte */
inline equal_instrument_name_p5(instrument_name_p5_read, instrument_name_p5_written) {
  assert(instrument_name_p5_read.instrument_name_p_5_length_byte == instrument_name_p5_written.instrument_name_p_5_length_byte);
  instrument_name_p5_at = 0;
  do
  :: instrument_name_p5_at < 4 -> assert(instrument_name_p5_read.instrument_name_p_5_characters[instrument_name_p5_at] == instrument_name_p5_written.instrument_name_p_5_characters[instrument_name_p5_at]); instrument_name_p5_at = instrument_name_p5_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Secondary Date: 12 bytes ------------------------------------------------ */

/* Secondary Date */
typedef SecondaryDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int secondary_date_at;

/* every byte of Secondary Date set to one value */
inline fill_secondary_date(secondary_date_record, secondary_date_value) {
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> secondary_date_record.year[secondary_date_at] = secondary_date_value; secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> secondary_date_record.month[secondary_date_at] = secondary_date_value; secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> secondary_date_record.day[secondary_date_at] = secondary_date_value; secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Secondary Date set to where it lies, so a field read out of place says so */
inline ramp_secondary_date(secondary_date_record, secondary_date_base) {
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> secondary_date_record.year[secondary_date_at] = (secondary_date_base + 0 + secondary_date_at + 1) % 256; secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> secondary_date_record.month[secondary_date_at] = (secondary_date_base + 4 + secondary_date_at + 1) % 256; secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> secondary_date_record.day[secondary_date_at] = (secondary_date_base + 8 + secondary_date_at + 1) % 256; secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  skip
}

/* Secondary Date to the wire, 12 bytes from where the cursor stands */
inline encode_secondary_date(secondary_date_record) {
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> wire[at] = secondary_date_record.year[secondary_date_at]; at = at + 1; secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> wire[at] = secondary_date_record.month[secondary_date_at]; at = at + 1; secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> wire[at] = secondary_date_record.day[secondary_date_at]; at = at + 1; secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  skip
}

/* Secondary Date off the wire, 12 bytes from where the cursor stands */
inline decode_secondary_date(secondary_date_record) {
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> secondary_date_record.year[secondary_date_at] = wire[at]; at = at + 1; secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> secondary_date_record.month[secondary_date_at] = wire[at]; at = at + 1; secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> secondary_date_record.day[secondary_date_at] = wire[at]; at = at + 1; secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Secondary Date is what was written, byte for byte */
inline equal_secondary_date(secondary_date_read, secondary_date_written) {
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> assert(secondary_date_read.year[secondary_date_at] == secondary_date_written.year[secondary_date_at]); secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> assert(secondary_date_read.month[secondary_date_at] == secondary_date_written.month[secondary_date_at]); secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  secondary_date_at = 0;
  do
  :: secondary_date_at < 4 -> assert(secondary_date_read.day[secondary_date_at] == secondary_date_written.day[secondary_date_at]); secondary_date_at = secondary_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Secondary Instrument Name P 5: 5 bytes ---------------------------------- */

/* For strategy type products such as Product spreads, represents the instrument name of the second leg of the contract. */
typedef SecondaryInstrumentNameP5 {
  byte secondary_instrument_name_p_5_length_byte;
  byte secondary_instrument_name_p_5_characters[4]
};

int secondary_instrument_name_p5_at;

/* every byte of Secondary Instrument Name P 5 set to one value */
inline fill_secondary_instrument_name_p5(secondary_instrument_name_p5_record, secondary_instrument_name_p5_value) {
  secondary_instrument_name_p5_record.secondary_instrument_name_p_5_length_byte = secondary_instrument_name_p5_value;
  secondary_instrument_name_p5_at = 0;
  do
  :: secondary_instrument_name_p5_at < 4 -> secondary_instrument_name_p5_record.secondary_instrument_name_p_5_characters[secondary_instrument_name_p5_at] = secondary_instrument_name_p5_value; secondary_instrument_name_p5_at = secondary_instrument_name_p5_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Secondary Instrument Name P 5 set to where it lies, so a field read out of place says so */
inline ramp_secondary_instrument_name_p5(secondary_instrument_name_p5_record, secondary_instrument_name_p5_base) {
  secondary_instrument_name_p5_record.secondary_instrument_name_p_5_length_byte = (secondary_instrument_name_p5_base + 0 + 1) % 256;
  secondary_instrument_name_p5_at = 0;
  do
  :: secondary_instrument_name_p5_at < 4 -> secondary_instrument_name_p5_record.secondary_instrument_name_p_5_characters[secondary_instrument_name_p5_at] = (secondary_instrument_name_p5_base + 1 + secondary_instrument_name_p5_at + 1) % 256; secondary_instrument_name_p5_at = secondary_instrument_name_p5_at + 1
  :: else -> break
  od;
  skip
}

/* Secondary Instrument Name P 5 to the wire, 5 bytes from where the cursor stands */
inline encode_secondary_instrument_name_p5(secondary_instrument_name_p5_record) {
  wire[at] = secondary_instrument_name_p5_record.secondary_instrument_name_p_5_length_byte; at = at + 1;
  secondary_instrument_name_p5_at = 0;
  do
  :: secondary_instrument_name_p5_at < 4 -> wire[at] = secondary_instrument_name_p5_record.secondary_instrument_name_p_5_characters[secondary_instrument_name_p5_at]; at = at + 1; secondary_instrument_name_p5_at = secondary_instrument_name_p5_at + 1
  :: else -> break
  od;
  skip
}

/* Secondary Instrument Name P 5 off the wire, 5 bytes from where the cursor stands */
inline decode_secondary_instrument_name_p5(secondary_instrument_name_p5_record) {
  secondary_instrument_name_p5_record.secondary_instrument_name_p_5_length_byte = wire[at]; at = at + 1;
  secondary_instrument_name_p5_at = 0;
  do
  :: secondary_instrument_name_p5_at < 4 -> secondary_instrument_name_p5_record.secondary_instrument_name_p_5_characters[secondary_instrument_name_p5_at] = wire[at]; at = at + 1; secondary_instrument_name_p5_at = secondary_instrument_name_p5_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Secondary Instrument Name P 5 is what was written, byte for byte */
inline equal_secondary_instrument_name_p5(secondary_instrument_name_p5_read, secondary_instrument_name_p5_written) {
  assert(secondary_instrument_name_p5_read.secondary_instrument_name_p_5_length_byte == secondary_instrument_name_p5_written.secondary_instrument_name_p_5_length_byte);
  secondary_instrument_name_p5_at = 0;
  do
  :: secondary_instrument_name_p5_at < 4 -> assert(secondary_instrument_name_p5_read.secondary_instrument_name_p_5_characters[secondary_instrument_name_p5_at] == secondary_instrument_name_p5_written.secondary_instrument_name_p_5_characters[secondary_instrument_name_p5_at]); secondary_instrument_name_p5_at = secondary_instrument_name_p5_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Contract: 48 bytes ------------------------------------------------------ */

/* Contract */
typedef Contract {
  byte identifier_prefix_i_4[4];
  Date date;
  InstrumentNameP5 instrument_name_p_5;
  byte strike[8];
  byte call_put_c_1;
  SecondaryDate secondary_date;
  SecondaryInstrumentNameP5 secondary_instrum_fyw9js;
  byte is_delta_option
};

int contract_at;

/* every byte of Contract set to one value */
inline fill_contract(contract_record, contract_value) {
  contract_at = 0;
  do
  :: contract_at < 4 -> contract_record.identifier_prefix_i_4[contract_at] = contract_value; contract_at = contract_at + 1
  :: else -> break
  od;
  fill_date(contract_record.date, contract_value);
  fill_instrument_name_p5(contract_record.instrument_name_p_5, contract_value);
  contract_at = 0;
  do
  :: contract_at < 8 -> contract_record.strike[contract_at] = contract_value; contract_at = contract_at + 1
  :: else -> break
  od;
  contract_record.call_put_c_1 = contract_value;
  fill_secondary_date(contract_record.secondary_date, contract_value);
  fill_secondary_instrument_name_p5(contract_record.secondary_instrum_fyw9js, contract_value);
  contract_record.is_delta_option = contract_value;
  skip
}

/* each byte of Contract set to where it lies, so a field read out of place says so */
inline ramp_contract(contract_record, contract_base) {
  contract_at = 0;
  do
  :: contract_at < 4 -> contract_record.identifier_prefix_i_4[contract_at] = (contract_base + 0 + contract_at + 1) % 256; contract_at = contract_at + 1
  :: else -> break
  od;
  ramp_date(contract_record.date, contract_base + 4);
  ramp_instrument_name_p5(contract_record.instrument_name_p_5, contract_base + 16);
  contract_at = 0;
  do
  :: contract_at < 8 -> contract_record.strike[contract_at] = (contract_base + 21 + contract_at + 1) % 256; contract_at = contract_at + 1
  :: else -> break
  od;
  contract_record.call_put_c_1 = (contract_base + 29 + 1) % 256;
  ramp_secondary_date(contract_record.secondary_date, contract_base + 30);
  ramp_secondary_instrument_name_p5(contract_record.secondary_instrum_fyw9js, contract_base + 42);
  contract_record.is_delta_option = (contract_base + 47 + 1) % 256;
  skip
}

/* Contract to the wire, 48 bytes from where the cursor stands */
inline encode_contract(contract_record) {
  contract_at = 0;
  do
  :: contract_at < 4 -> wire[at] = contract_record.identifier_prefix_i_4[contract_at]; at = at + 1; contract_at = contract_at + 1
  :: else -> break
  od;
  encode_date(contract_record.date);
  encode_instrument_name_p5(contract_record.instrument_name_p_5);
  contract_at = 0;
  do
  :: contract_at < 8 -> wire[at] = contract_record.strike[contract_at]; at = at + 1; contract_at = contract_at + 1
  :: else -> break
  od;
  wire[at] = contract_record.call_put_c_1; at = at + 1;
  encode_secondary_date(contract_record.secondary_date);
  encode_secondary_instrument_name_p5(contract_record.secondary_instrum_fyw9js);
  wire[at] = contract_record.is_delta_option; at = at + 1;
  skip
}

/* Contract off the wire, 48 bytes from where the cursor stands */
inline decode_contract(contract_record) {
  contract_at = 0;
  do
  :: contract_at < 4 -> contract_record.identifier_prefix_i_4[contract_at] = wire[at]; at = at + 1; contract_at = contract_at + 1
  :: else -> break
  od;
  decode_date(contract_record.date);
  decode_instrument_name_p5(contract_record.instrument_name_p_5);
  contract_at = 0;
  do
  :: contract_at < 8 -> contract_record.strike[contract_at] = wire[at]; at = at + 1; contract_at = contract_at + 1
  :: else -> break
  od;
  contract_record.call_put_c_1 = wire[at]; at = at + 1;
  decode_secondary_date(contract_record.secondary_date);
  decode_secondary_instrument_name_p5(contract_record.secondary_instrum_fyw9js);
  contract_record.is_delta_option = wire[at]; at = at + 1;
  skip
}

/* what was read of Contract is what was written, byte for byte */
inline equal_contract(contract_read, contract_written) {
  contract_at = 0;
  do
  :: contract_at < 4 -> assert(contract_read.identifier_prefix_i_4[contract_at] == contract_written.identifier_prefix_i_4[contract_at]); contract_at = contract_at + 1
  :: else -> break
  od;
  equal_date(contract_read.date, contract_written.date);
  equal_instrument_name_p5(contract_read.instrument_name_p_5, contract_written.instrument_name_p_5);
  contract_at = 0;
  do
  :: contract_at < 8 -> assert(contract_read.strike[contract_at] == contract_written.strike[contract_at]); contract_at = contract_at + 1
  :: else -> break
  od;
  assert(contract_read.call_put_c_1 == contract_written.call_put_c_1);
  equal_secondary_date(contract_read.secondary_date, contract_written.secondary_date);
  equal_secondary_instrument_name_p5(contract_read.secondary_instrum_fyw9js, contract_written.secondary_instrum_fyw9js);
  assert(contract_read.is_delta_option == contract_written.is_delta_option);
  skip
}

/* ---- Market Display Data: 80 bytes ------------------------------------------- */

/* Market Display Data */
typedef MarketDisplayData {
  byte display_sequence[4];
  Contract contract;
  byte open_price[8];
  byte instrument_sequence[4];
  byte date_sequence[4];
  byte strike_sequence[4];
  byte second_instrument_sequence[4];
  byte second_date_sequence[4]
};

int market_display_data_at;

/* every byte of Market Display Data set to one value */
inline fill_market_display_data(market_display_data_record, market_display_data_value) {
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.display_sequence[market_display_data_at] = market_display_data_value; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  fill_contract(market_display_data_record.contract, market_display_data_value);
  market_display_data_at = 0;
  do
  :: market_display_data_at < 8 -> market_display_data_record.open_price[market_display_data_at] = market_display_data_value; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.instrument_sequence[market_display_data_at] = market_display_data_value; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.date_sequence[market_display_data_at] = market_display_data_value; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.strike_sequence[market_display_data_at] = market_display_data_value; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.second_instrument_sequence[market_display_data_at] = market_display_data_value; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.second_date_sequence[market_display_data_at] = market_display_data_value; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Display Data set to where it lies, so a field read out of place says so */
inline ramp_market_display_data(market_display_data_record, market_display_data_base) {
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.display_sequence[market_display_data_at] = (market_display_data_base + 0 + market_display_data_at + 1) % 256; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  ramp_contract(market_display_data_record.contract, market_display_data_base + 4);
  market_display_data_at = 0;
  do
  :: market_display_data_at < 8 -> market_display_data_record.open_price[market_display_data_at] = (market_display_data_base + 52 + market_display_data_at + 1) % 256; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.instrument_sequence[market_display_data_at] = (market_display_data_base + 60 + market_display_data_at + 1) % 256; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.date_sequence[market_display_data_at] = (market_display_data_base + 64 + market_display_data_at + 1) % 256; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.strike_sequence[market_display_data_at] = (market_display_data_base + 68 + market_display_data_at + 1) % 256; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.second_instrument_sequence[market_display_data_at] = (market_display_data_base + 72 + market_display_data_at + 1) % 256; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.second_date_sequence[market_display_data_at] = (market_display_data_base + 76 + market_display_data_at + 1) % 256; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  skip
}

/* Market Display Data to the wire, 80 bytes from where the cursor stands */
inline encode_market_display_data(market_display_data_record) {
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> wire[at] = market_display_data_record.display_sequence[market_display_data_at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  encode_contract(market_display_data_record.contract);
  market_display_data_at = 0;
  do
  :: market_display_data_at < 8 -> wire[at] = market_display_data_record.open_price[market_display_data_at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> wire[at] = market_display_data_record.instrument_sequence[market_display_data_at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> wire[at] = market_display_data_record.date_sequence[market_display_data_at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> wire[at] = market_display_data_record.strike_sequence[market_display_data_at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> wire[at] = market_display_data_record.second_instrument_sequence[market_display_data_at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> wire[at] = market_display_data_record.second_date_sequence[market_display_data_at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  skip
}

/* Market Display Data off the wire, 80 bytes from where the cursor stands */
inline decode_market_display_data(market_display_data_record) {
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.display_sequence[market_display_data_at] = wire[at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  decode_contract(market_display_data_record.contract);
  market_display_data_at = 0;
  do
  :: market_display_data_at < 8 -> market_display_data_record.open_price[market_display_data_at] = wire[at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.instrument_sequence[market_display_data_at] = wire[at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.date_sequence[market_display_data_at] = wire[at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.strike_sequence[market_display_data_at] = wire[at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.second_instrument_sequence[market_display_data_at] = wire[at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> market_display_data_record.second_date_sequence[market_display_data_at] = wire[at]; at = at + 1; market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Display Data is what was written, byte for byte */
inline equal_market_display_data(market_display_data_read, market_display_data_written) {
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> assert(market_display_data_read.display_sequence[market_display_data_at] == market_display_data_written.display_sequence[market_display_data_at]); market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  equal_contract(market_display_data_read.contract, market_display_data_written.contract);
  market_display_data_at = 0;
  do
  :: market_display_data_at < 8 -> assert(market_display_data_read.open_price[market_display_data_at] == market_display_data_written.open_price[market_display_data_at]); market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> assert(market_display_data_read.instrument_sequence[market_display_data_at] == market_display_data_written.instrument_sequence[market_display_data_at]); market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> assert(market_display_data_read.date_sequence[market_display_data_at] == market_display_data_written.date_sequence[market_display_data_at]); market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> assert(market_display_data_read.strike_sequence[market_display_data_at] == market_display_data_written.strike_sequence[market_display_data_at]); market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> assert(market_display_data_read.second_instrument_sequence[market_display_data_at] == market_display_data_written.second_instrument_sequence[market_display_data_at]); market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  market_display_data_at = 0;
  do
  :: market_display_data_at < 4 -> assert(market_display_data_read.second_date_sequence[market_display_data_at] == market_display_data_written.second_date_sequence[market_display_data_at]); market_display_data_at = market_display_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Isin Code: 13 bytes ----------------------------------------------------- */

/* ISIN number of the instrument. */
typedef IsinCode {
  byte isin_code_length_byte;
  byte isin_code_characters[12]
};

int isin_code_at;

/* every byte of Isin Code set to one value */
inline fill_isin_code(isin_code_record, isin_code_value) {
  isin_code_record.isin_code_length_byte = isin_code_value;
  isin_code_at = 0;
  do
  :: isin_code_at < 12 -> isin_code_record.isin_code_characters[isin_code_at] = isin_code_value; isin_code_at = isin_code_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Isin Code set to where it lies, so a field read out of place says so */
inline ramp_isin_code(isin_code_record, isin_code_base) {
  isin_code_record.isin_code_length_byte = (isin_code_base + 0 + 1) % 256;
  isin_code_at = 0;
  do
  :: isin_code_at < 12 -> isin_code_record.isin_code_characters[isin_code_at] = (isin_code_base + 1 + isin_code_at + 1) % 256; isin_code_at = isin_code_at + 1
  :: else -> break
  od;
  skip
}

/* Isin Code to the wire, 13 bytes from where the cursor stands */
inline encode_isin_code(isin_code_record) {
  wire[at] = isin_code_record.isin_code_length_byte; at = at + 1;
  isin_code_at = 0;
  do
  :: isin_code_at < 12 -> wire[at] = isin_code_record.isin_code_characters[isin_code_at]; at = at + 1; isin_code_at = isin_code_at + 1
  :: else -> break
  od;
  skip
}

/* Isin Code off the wire, 13 bytes from where the cursor stands */
inline decode_isin_code(isin_code_record) {
  isin_code_record.isin_code_length_byte = wire[at]; at = at + 1;
  isin_code_at = 0;
  do
  :: isin_code_at < 12 -> isin_code_record.isin_code_characters[isin_code_at] = wire[at]; at = at + 1; isin_code_at = isin_code_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Isin Code is what was written, byte for byte */
inline equal_isin_code(isin_code_read, isin_code_written) {
  assert(isin_code_read.isin_code_length_byte == isin_code_written.isin_code_length_byte);
  isin_code_at = 0;
  do
  :: isin_code_at < 12 -> assert(isin_code_read.isin_code_characters[isin_code_at] == isin_code_written.isin_code_characters[isin_code_at]); isin_code_at = isin_code_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Description P 62: 62 bytes ---------------------------------------------- */

/* A Description of the instrument. */
typedef DescriptionP62 {
  byte description_p_62_length_byte;
  byte description_p_62_characters[61]
};

int description_p62_at;

/* every byte of Description P 62 set to one value */
inline fill_description_p62(description_p62_record, description_p62_value) {
  description_p62_record.description_p_62_length_byte = description_p62_value;
  description_p62_at = 0;
  do
  :: description_p62_at < 61 -> description_p62_record.description_p_62_characters[description_p62_at] = description_p62_value; description_p62_at = description_p62_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Description P 62 set to where it lies, so a field read out of place says so */
inline ramp_description_p62(description_p62_record, description_p62_base) {
  description_p62_record.description_p_62_length_byte = (description_p62_base + 0 + 1) % 256;
  description_p62_at = 0;
  do
  :: description_p62_at < 61 -> description_p62_record.description_p_62_characters[description_p62_at] = (description_p62_base + 1 + description_p62_at + 1) % 256; description_p62_at = description_p62_at + 1
  :: else -> break
  od;
  skip
}

/* Description P 62 to the wire, 62 bytes from where the cursor stands */
inline encode_description_p62(description_p62_record) {
  wire[at] = description_p62_record.description_p_62_length_byte; at = at + 1;
  description_p62_at = 0;
  do
  :: description_p62_at < 61 -> wire[at] = description_p62_record.description_p_62_characters[description_p62_at]; at = at + 1; description_p62_at = description_p62_at + 1
  :: else -> break
  od;
  skip
}

/* Description P 62 off the wire, 62 bytes from where the cursor stands */
inline decode_description_p62(description_p62_record) {
  description_p62_record.description_p_62_length_byte = wire[at]; at = at + 1;
  description_p62_at = 0;
  do
  :: description_p62_at < 61 -> description_p62_record.description_p_62_characters[description_p62_at] = wire[at]; at = at + 1; description_p62_at = description_p62_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Description P 62 is what was written, byte for byte */
inline equal_description_p62(description_p62_read, description_p62_written) {
  assert(description_p62_read.description_p_62_length_byte == description_p62_written.description_p_62_length_byte);
  description_p62_at = 0;
  do
  :: description_p62_at < 61 -> assert(description_p62_read.description_p_62_characters[description_p62_at] == description_p62_written.description_p_62_characters[description_p62_at]); description_p62_at = description_p62_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Maturity Date: 12 bytes ------------------------------------------------- */

/* Maturity Date */
typedef MaturityDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int maturity_date_at;

/* every byte of Maturity Date set to one value */
inline fill_maturity_date(maturity_date_record, maturity_date_value) {
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> maturity_date_record.year[maturity_date_at] = maturity_date_value; maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> maturity_date_record.month[maturity_date_at] = maturity_date_value; maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> maturity_date_record.day[maturity_date_at] = maturity_date_value; maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Maturity Date set to where it lies, so a field read out of place says so */
inline ramp_maturity_date(maturity_date_record, maturity_date_base) {
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> maturity_date_record.year[maturity_date_at] = (maturity_date_base + 0 + maturity_date_at + 1) % 256; maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> maturity_date_record.month[maturity_date_at] = (maturity_date_base + 4 + maturity_date_at + 1) % 256; maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> maturity_date_record.day[maturity_date_at] = (maturity_date_base + 8 + maturity_date_at + 1) % 256; maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  skip
}

/* Maturity Date to the wire, 12 bytes from where the cursor stands */
inline encode_maturity_date(maturity_date_record) {
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> wire[at] = maturity_date_record.year[maturity_date_at]; at = at + 1; maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> wire[at] = maturity_date_record.month[maturity_date_at]; at = at + 1; maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> wire[at] = maturity_date_record.day[maturity_date_at]; at = at + 1; maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  skip
}

/* Maturity Date off the wire, 12 bytes from where the cursor stands */
inline decode_maturity_date(maturity_date_record) {
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> maturity_date_record.year[maturity_date_at] = wire[at]; at = at + 1; maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> maturity_date_record.month[maturity_date_at] = wire[at]; at = at + 1; maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> maturity_date_record.day[maturity_date_at] = wire[at]; at = at + 1; maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Maturity Date is what was written, byte for byte */
inline equal_maturity_date(maturity_date_read, maturity_date_written) {
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> assert(maturity_date_read.year[maturity_date_at] == maturity_date_written.year[maturity_date_at]); maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> assert(maturity_date_read.month[maturity_date_at] == maturity_date_written.month[maturity_date_at]); maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  maturity_date_at = 0;
  do
  :: maturity_date_at < 4 -> assert(maturity_date_read.day[maturity_date_at] == maturity_date_written.day[maturity_date_at]); maturity_date_at = maturity_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Issue Date: 12 bytes ---------------------------------------------------- */

/* Issue Date */
typedef IssueDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int issue_date_at;

/* every byte of Issue Date set to one value */
inline fill_issue_date(issue_date_record, issue_date_value) {
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> issue_date_record.year[issue_date_at] = issue_date_value; issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> issue_date_record.month[issue_date_at] = issue_date_value; issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> issue_date_record.day[issue_date_at] = issue_date_value; issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Issue Date set to where it lies, so a field read out of place says so */
inline ramp_issue_date(issue_date_record, issue_date_base) {
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> issue_date_record.year[issue_date_at] = (issue_date_base + 0 + issue_date_at + 1) % 256; issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> issue_date_record.month[issue_date_at] = (issue_date_base + 4 + issue_date_at + 1) % 256; issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> issue_date_record.day[issue_date_at] = (issue_date_base + 8 + issue_date_at + 1) % 256; issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  skip
}

/* Issue Date to the wire, 12 bytes from where the cursor stands */
inline encode_issue_date(issue_date_record) {
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> wire[at] = issue_date_record.year[issue_date_at]; at = at + 1; issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> wire[at] = issue_date_record.month[issue_date_at]; at = at + 1; issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> wire[at] = issue_date_record.day[issue_date_at]; at = at + 1; issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  skip
}

/* Issue Date off the wire, 12 bytes from where the cursor stands */
inline decode_issue_date(issue_date_record) {
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> issue_date_record.year[issue_date_at] = wire[at]; at = at + 1; issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> issue_date_record.month[issue_date_at] = wire[at]; at = at + 1; issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> issue_date_record.day[issue_date_at] = wire[at]; at = at + 1; issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Issue Date is what was written, byte for byte */
inline equal_issue_date(issue_date_read, issue_date_written) {
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> assert(issue_date_read.year[issue_date_at] == issue_date_written.year[issue_date_at]); issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> assert(issue_date_read.month[issue_date_at] == issue_date_written.month[issue_date_at]); issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  issue_date_at = 0;
  do
  :: issue_date_at < 4 -> assert(issue_date_read.day[issue_date_at] == issue_date_written.day[issue_date_at]); issue_date_at = issue_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Group Description: 60 bytes --------------------------------------------- */

/* Indicates the group make up for this instrument. */
typedef GroupDescription {
  byte group_description_length_byte;
  byte group_description_characters[59]
};

int group_description_at;

/* every byte of Group Description set to one value */
inline fill_group_description(group_description_record, group_description_value) {
  group_description_record.group_description_length_byte = group_description_value;
  group_description_at = 0;
  do
  :: group_description_at < 59 -> group_description_record.group_description_characters[group_description_at] = group_description_value; group_description_at = group_description_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Group Description set to where it lies, so a field read out of place says so */
inline ramp_group_description(group_description_record, group_description_base) {
  group_description_record.group_description_length_byte = (group_description_base + 0 + 1) % 256;
  group_description_at = 0;
  do
  :: group_description_at < 59 -> group_description_record.group_description_characters[group_description_at] = (group_description_base + 1 + group_description_at + 1) % 256; group_description_at = group_description_at + 1
  :: else -> break
  od;
  skip
}

/* Group Description to the wire, 60 bytes from where the cursor stands */
inline encode_group_description(group_description_record) {
  wire[at] = group_description_record.group_description_length_byte; at = at + 1;
  group_description_at = 0;
  do
  :: group_description_at < 59 -> wire[at] = group_description_record.group_description_characters[group_description_at]; at = at + 1; group_description_at = group_description_at + 1
  :: else -> break
  od;
  skip
}

/* Group Description off the wire, 60 bytes from where the cursor stands */
inline decode_group_description(group_description_record) {
  group_description_record.group_description_length_byte = wire[at]; at = at + 1;
  group_description_at = 0;
  do
  :: group_description_at < 59 -> group_description_record.group_description_characters[group_description_at] = wire[at]; at = at + 1; group_description_at = group_description_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Group Description is what was written, byte for byte */
inline equal_group_description(group_description_read, group_description_written) {
  assert(group_description_read.group_description_length_byte == group_description_written.group_description_length_byte);
  group_description_at = 0;
  do
  :: group_description_at < 59 -> assert(group_description_read.group_description_characters[group_description_at] == group_description_written.group_description_characters[group_description_at]); group_description_at = group_description_at + 1
  :: else -> break
  od;
  skip
}

/* ---- First Trade Reference: 10 bytes ----------------------------------------- */

/* Indicates the reference number of the first trade on this instrument. */
typedef FirstTradeReference {
  byte first_trade_reference_length_byte;
  byte first_trade_reference_characters[9]
};

int first_trade_reference_at;

/* every byte of First Trade Reference set to one value */
inline fill_first_trade_reference(first_trade_reference_record, first_trade_reference_value) {
  first_trade_reference_record.first_trade_reference_length_byte = first_trade_reference_value;
  first_trade_reference_at = 0;
  do
  :: first_trade_reference_at < 9 -> first_trade_reference_record.first_trade_reference_characters[first_trade_reference_at] = first_trade_reference_value; first_trade_reference_at = first_trade_reference_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of First Trade Reference set to where it lies, so a field read out of place says so */
inline ramp_first_trade_reference(first_trade_reference_record, first_trade_reference_base) {
  first_trade_reference_record.first_trade_reference_length_byte = (first_trade_reference_base + 0 + 1) % 256;
  first_trade_reference_at = 0;
  do
  :: first_trade_reference_at < 9 -> first_trade_reference_record.first_trade_reference_characters[first_trade_reference_at] = (first_trade_reference_base + 1 + first_trade_reference_at + 1) % 256; first_trade_reference_at = first_trade_reference_at + 1
  :: else -> break
  od;
  skip
}

/* First Trade Reference to the wire, 10 bytes from where the cursor stands */
inline encode_first_trade_reference(first_trade_reference_record) {
  wire[at] = first_trade_reference_record.first_trade_reference_length_byte; at = at + 1;
  first_trade_reference_at = 0;
  do
  :: first_trade_reference_at < 9 -> wire[at] = first_trade_reference_record.first_trade_reference_characters[first_trade_reference_at]; at = at + 1; first_trade_reference_at = first_trade_reference_at + 1
  :: else -> break
  od;
  skip
}

/* First Trade Reference off the wire, 10 bytes from where the cursor stands */
inline decode_first_trade_reference(first_trade_reference_record) {
  first_trade_reference_record.first_trade_reference_length_byte = wire[at]; at = at + 1;
  first_trade_reference_at = 0;
  do
  :: first_trade_reference_at < 9 -> first_trade_reference_record.first_trade_reference_characters[first_trade_reference_at] = wire[at]; at = at + 1; first_trade_reference_at = first_trade_reference_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of First Trade Reference is what was written, byte for byte */
inline equal_first_trade_reference(first_trade_reference_read, first_trade_reference_written) {
  assert(first_trade_reference_read.first_trade_reference_length_byte == first_trade_reference_written.first_trade_reference_length_byte);
  first_trade_reference_at = 0;
  do
  :: first_trade_reference_at < 9 -> assert(first_trade_reference_read.first_trade_reference_characters[first_trade_reference_at] == first_trade_reference_written.first_trade_reference_characters[first_trade_reference_at]); first_trade_reference_at = first_trade_reference_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Display Name: 30 bytes -------------------------------------------------- */

/* This field allows the exchange to indicate how an instrument should be presented. */
typedef DisplayName {
  byte display_name_length_byte;
  byte display_name_characters[29]
};

int display_name_at;

/* every byte of Display Name set to one value */
inline fill_display_name(display_name_record, display_name_value) {
  display_name_record.display_name_length_byte = display_name_value;
  display_name_at = 0;
  do
  :: display_name_at < 29 -> display_name_record.display_name_characters[display_name_at] = display_name_value; display_name_at = display_name_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Display Name set to where it lies, so a field read out of place says so */
inline ramp_display_name(display_name_record, display_name_base) {
  display_name_record.display_name_length_byte = (display_name_base + 0 + 1) % 256;
  display_name_at = 0;
  do
  :: display_name_at < 29 -> display_name_record.display_name_characters[display_name_at] = (display_name_base + 1 + display_name_at + 1) % 256; display_name_at = display_name_at + 1
  :: else -> break
  od;
  skip
}

/* Display Name to the wire, 30 bytes from where the cursor stands */
inline encode_display_name(display_name_record) {
  wire[at] = display_name_record.display_name_length_byte; at = at + 1;
  display_name_at = 0;
  do
  :: display_name_at < 29 -> wire[at] = display_name_record.display_name_characters[display_name_at]; at = at + 1; display_name_at = display_name_at + 1
  :: else -> break
  od;
  skip
}

/* Display Name off the wire, 30 bytes from where the cursor stands */
inline decode_display_name(display_name_record) {
  display_name_record.display_name_length_byte = wire[at]; at = at + 1;
  display_name_at = 0;
  do
  :: display_name_at < 29 -> display_name_record.display_name_characters[display_name_at] = wire[at]; at = at + 1; display_name_at = display_name_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Display Name is what was written, byte for byte */
inline equal_display_name(display_name_read, display_name_written) {
  assert(display_name_read.display_name_length_byte == display_name_written.display_name_length_byte);
  display_name_at = 0;
  do
  :: display_name_at < 29 -> assert(display_name_read.display_name_characters[display_name_at] == display_name_written.display_name_characters[display_name_at]); display_name_at = display_name_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Classification: 30 bytes ------------------------------------------------ */

/* This field defines the instrument classification to which the bonds belongs to. */
typedef Classification {
  byte classification_length_byte;
  byte classification_characters[29]
};

int classification_at;

/* every byte of Classification set to one value */
inline fill_classification(classification_record, classification_value) {
  classification_record.classification_length_byte = classification_value;
  classification_at = 0;
  do
  :: classification_at < 29 -> classification_record.classification_characters[classification_at] = classification_value; classification_at = classification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Classification set to where it lies, so a field read out of place says so */
inline ramp_classification(classification_record, classification_base) {
  classification_record.classification_length_byte = (classification_base + 0 + 1) % 256;
  classification_at = 0;
  do
  :: classification_at < 29 -> classification_record.classification_characters[classification_at] = (classification_base + 1 + classification_at + 1) % 256; classification_at = classification_at + 1
  :: else -> break
  od;
  skip
}

/* Classification to the wire, 30 bytes from where the cursor stands */
inline encode_classification(classification_record) {
  wire[at] = classification_record.classification_length_byte; at = at + 1;
  classification_at = 0;
  do
  :: classification_at < 29 -> wire[at] = classification_record.classification_characters[classification_at]; at = at + 1; classification_at = classification_at + 1
  :: else -> break
  od;
  skip
}

/* Classification off the wire, 30 bytes from where the cursor stands */
inline decode_classification(classification_record) {
  classification_record.classification_length_byte = wire[at]; at = at + 1;
  classification_at = 0;
  do
  :: classification_at < 29 -> classification_record.classification_characters[classification_at] = wire[at]; at = at + 1; classification_at = classification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Classification is what was written, byte for byte */
inline equal_classification(classification_read, classification_written) {
  assert(classification_read.classification_length_byte == classification_written.classification_length_byte);
  classification_at = 0;
  do
  :: classification_at < 29 -> assert(classification_read.classification_characters[classification_at] == classification_written.classification_characters[classification_at]); classification_at = classification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Vetting Agent Name: 30 bytes -------------------------------------------- */

/* The name of any vetting agent for this instrument. */
typedef VettingAgentName {
  byte vetting_agent_name_length_byte;
  byte vetting_agent_name_characters[29]
};

int vetting_agent_name_at;

/* every byte of Vetting Agent Name set to one value */
inline fill_vetting_agent_name(vetting_agent_name_record, vetting_agent_name_value) {
  vetting_agent_name_record.vetting_agent_name_length_byte = vetting_agent_name_value;
  vetting_agent_name_at = 0;
  do
  :: vetting_agent_name_at < 29 -> vetting_agent_name_record.vetting_agent_name_characters[vetting_agent_name_at] = vetting_agent_name_value; vetting_agent_name_at = vetting_agent_name_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Vetting Agent Name set to where it lies, so a field read out of place says so */
inline ramp_vetting_agent_name(vetting_agent_name_record, vetting_agent_name_base) {
  vetting_agent_name_record.vetting_agent_name_length_byte = (vetting_agent_name_base + 0 + 1) % 256;
  vetting_agent_name_at = 0;
  do
  :: vetting_agent_name_at < 29 -> vetting_agent_name_record.vetting_agent_name_characters[vetting_agent_name_at] = (vetting_agent_name_base + 1 + vetting_agent_name_at + 1) % 256; vetting_agent_name_at = vetting_agent_name_at + 1
  :: else -> break
  od;
  skip
}

/* Vetting Agent Name to the wire, 30 bytes from where the cursor stands */
inline encode_vetting_agent_name(vetting_agent_name_record) {
  wire[at] = vetting_agent_name_record.vetting_agent_name_length_byte; at = at + 1;
  vetting_agent_name_at = 0;
  do
  :: vetting_agent_name_at < 29 -> wire[at] = vetting_agent_name_record.vetting_agent_name_characters[vetting_agent_name_at]; at = at + 1; vetting_agent_name_at = vetting_agent_name_at + 1
  :: else -> break
  od;
  skip
}

/* Vetting Agent Name off the wire, 30 bytes from where the cursor stands */
inline decode_vetting_agent_name(vetting_agent_name_record) {
  vetting_agent_name_record.vetting_agent_name_length_byte = wire[at]; at = at + 1;
  vetting_agent_name_at = 0;
  do
  :: vetting_agent_name_at < 29 -> vetting_agent_name_record.vetting_agent_name_characters[vetting_agent_name_at] = wire[at]; at = at + 1; vetting_agent_name_at = vetting_agent_name_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Vetting Agent Name is what was written, byte for byte */
inline equal_vetting_agent_name(vetting_agent_name_read, vetting_agent_name_written) {
  assert(vetting_agent_name_read.vetting_agent_name_length_byte == vetting_agent_name_written.vetting_agent_name_length_byte);
  vetting_agent_name_at = 0;
  do
  :: vetting_agent_name_at < 29 -> assert(vetting_agent_name_read.vetting_agent_name_characters[vetting_agent_name_at] == vetting_agent_name_written.vetting_agent_name_characters[vetting_agent_name_at]); vetting_agent_name_at = vetting_agent_name_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Vetting Agent Contact: 30 bytes ----------------------------------------- */

/* Contact information for the vetting agent. */
typedef VettingAgentContact {
  byte vetting_agent_contact_length_byte;
  byte vetting_agent_contact_characters[29]
};

int vetting_agent_contact_at;

/* every byte of Vetting Agent Contact set to one value */
inline fill_vetting_agent_contact(vetting_agent_contact_record, vetting_agent_contact_value) {
  vetting_agent_contact_record.vetting_agent_contact_length_byte = vetting_agent_contact_value;
  vetting_agent_contact_at = 0;
  do
  :: vetting_agent_contact_at < 29 -> vetting_agent_contact_record.vetting_agent_contact_characters[vetting_agent_contact_at] = vetting_agent_contact_value; vetting_agent_contact_at = vetting_agent_contact_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Vetting Agent Contact set to where it lies, so a field read out of place says so */
inline ramp_vetting_agent_contact(vetting_agent_contact_record, vetting_agent_contact_base) {
  vetting_agent_contact_record.vetting_agent_contact_length_byte = (vetting_agent_contact_base + 0 + 1) % 256;
  vetting_agent_contact_at = 0;
  do
  :: vetting_agent_contact_at < 29 -> vetting_agent_contact_record.vetting_agent_contact_characters[vetting_agent_contact_at] = (vetting_agent_contact_base + 1 + vetting_agent_contact_at + 1) % 256; vetting_agent_contact_at = vetting_agent_contact_at + 1
  :: else -> break
  od;
  skip
}

/* Vetting Agent Contact to the wire, 30 bytes from where the cursor stands */
inline encode_vetting_agent_contact(vetting_agent_contact_record) {
  wire[at] = vetting_agent_contact_record.vetting_agent_contact_length_byte; at = at + 1;
  vetting_agent_contact_at = 0;
  do
  :: vetting_agent_contact_at < 29 -> wire[at] = vetting_agent_contact_record.vetting_agent_contact_characters[vetting_agent_contact_at]; at = at + 1; vetting_agent_contact_at = vetting_agent_contact_at + 1
  :: else -> break
  od;
  skip
}

/* Vetting Agent Contact off the wire, 30 bytes from where the cursor stands */
inline decode_vetting_agent_contact(vetting_agent_contact_record) {
  vetting_agent_contact_record.vetting_agent_contact_length_byte = wire[at]; at = at + 1;
  vetting_agent_contact_at = 0;
  do
  :: vetting_agent_contact_at < 29 -> vetting_agent_contact_record.vetting_agent_contact_characters[vetting_agent_contact_at] = wire[at]; at = at + 1; vetting_agent_contact_at = vetting_agent_contact_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Vetting Agent Contact is what was written, byte for byte */
inline equal_vetting_agent_contact(vetting_agent_contact_read, vetting_agent_contact_written) {
  assert(vetting_agent_contact_read.vetting_agent_contact_length_byte == vetting_agent_contact_written.vetting_agent_contact_length_byte);
  vetting_agent_contact_at = 0;
  do
  :: vetting_agent_contact_at < 29 -> assert(vetting_agent_contact_read.vetting_agent_contact_characters[vetting_agent_contact_at] == vetting_agent_contact_written.vetting_agent_contact_characters[vetting_agent_contact_at]); vetting_agent_contact_at = vetting_agent_contact_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sector: 30 bytes -------------------------------------------------------- */

/* Describes a market sector for a security. */
typedef Sector {
  byte sector_length_byte;
  byte sector_characters[29]
};

int sector_at;

/* every byte of Sector set to one value */
inline fill_sector(sector_record, sector_value) {
  sector_record.sector_length_byte = sector_value;
  sector_at = 0;
  do
  :: sector_at < 29 -> sector_record.sector_characters[sector_at] = sector_value; sector_at = sector_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sector set to where it lies, so a field read out of place says so */
inline ramp_sector(sector_record, sector_base) {
  sector_record.sector_length_byte = (sector_base + 0 + 1) % 256;
  sector_at = 0;
  do
  :: sector_at < 29 -> sector_record.sector_characters[sector_at] = (sector_base + 1 + sector_at + 1) % 256; sector_at = sector_at + 1
  :: else -> break
  od;
  skip
}

/* Sector to the wire, 30 bytes from where the cursor stands */
inline encode_sector(sector_record) {
  wire[at] = sector_record.sector_length_byte; at = at + 1;
  sector_at = 0;
  do
  :: sector_at < 29 -> wire[at] = sector_record.sector_characters[sector_at]; at = at + 1; sector_at = sector_at + 1
  :: else -> break
  od;
  skip
}

/* Sector off the wire, 30 bytes from where the cursor stands */
inline decode_sector(sector_record) {
  sector_record.sector_length_byte = wire[at]; at = at + 1;
  sector_at = 0;
  do
  :: sector_at < 29 -> sector_record.sector_characters[sector_at] = wire[at]; at = at + 1; sector_at = sector_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sector is what was written, byte for byte */
inline equal_sector(sector_read, sector_written) {
  assert(sector_read.sector_length_byte == sector_written.sector_length_byte);
  sector_at = 0;
  do
  :: sector_at < 29 -> assert(sector_read.sector_characters[sector_at] == sector_written.sector_characters[sector_at]); sector_at = sector_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Type: 30 bytes ------------------------------------------------- */

/* Categorizes securities into their various types. */
typedef SecurityType {
  byte security_type_length_byte;
  byte security_type_characters[29]
};

int security_type_at;

/* every byte of Security Type set to one value */
inline fill_security_type(security_type_record, security_type_value) {
  security_type_record.security_type_length_byte = security_type_value;
  security_type_at = 0;
  do
  :: security_type_at < 29 -> security_type_record.security_type_characters[security_type_at] = security_type_value; security_type_at = security_type_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Type set to where it lies, so a field read out of place says so */
inline ramp_security_type(security_type_record, security_type_base) {
  security_type_record.security_type_length_byte = (security_type_base + 0 + 1) % 256;
  security_type_at = 0;
  do
  :: security_type_at < 29 -> security_type_record.security_type_characters[security_type_at] = (security_type_base + 1 + security_type_at + 1) % 256; security_type_at = security_type_at + 1
  :: else -> break
  od;
  skip
}

/* Security Type to the wire, 30 bytes from where the cursor stands */
inline encode_security_type(security_type_record) {
  wire[at] = security_type_record.security_type_length_byte; at = at + 1;
  security_type_at = 0;
  do
  :: security_type_at < 29 -> wire[at] = security_type_record.security_type_characters[security_type_at]; at = at + 1; security_type_at = security_type_at + 1
  :: else -> break
  od;
  skip
}

/* Security Type off the wire, 30 bytes from where the cursor stands */
inline decode_security_type(security_type_record) {
  security_type_record.security_type_length_byte = wire[at]; at = at + 1;
  security_type_at = 0;
  do
  :: security_type_at < 29 -> security_type_record.security_type_characters[security_type_at] = wire[at]; at = at + 1; security_type_at = security_type_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Type is what was written, byte for byte */
inline equal_security_type(security_type_read, security_type_written) {
  assert(security_type_read.security_type_length_byte == security_type_written.security_type_length_byte);
  security_type_at = 0;
  do
  :: security_type_at < 29 -> assert(security_type_read.security_type_characters[security_type_at] == security_type_written.security_type_characters[security_type_at]); security_type_at = security_type_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instruments Data: 486 bytes --------------------------------------------- */

/* Instruments Data */
typedef InstrumentsData {
  byte instrument_sequence[4];
  byte trading_session_sequence[4];
  byte unused_4[4];
  byte instrument_group_sequence[4];
  byte future_fee_sequence[4];
  byte option_fee_sequence[4];
  byte delivery_fee_sequence[4];
  byte market_number_c_1;
  byte market_shard_number_c_1;
  InstrumentNameP5 instrument_name_p_5;
  byte instrument_type_number_c_1;
  IsinCode isin_code;
  DescriptionP62 description_p_62;
  byte on_screen;
  MaturityDate maturity_date;
  byte second_unused_4[4];
  byte nominal_divisor[4];
  IssueDate issue_date;
  byte linked_to_floating_rate;
  byte unused_1;
  byte underlying[4];
  byte options_exercise_is_percentage;
  byte options_exercise_cost[8];
  byte group_margin[8];
  byte vat;
  byte settlement_margin[8];
  byte physical_settlement;
  GroupDescription group_description;
  byte third_unused_4[4];
  byte reference_inflation_rate[8];
  byte minimum_initiation_fee[8];
  FirstTradeReference first_trade_reference;
  byte unused_5[5];
  CountryCode country_code;
  DisplayName display_name;
  byte number_of_days_in_a_year[4];
  byte bond_formula_decimal_places[4];
  byte coupon_rate[8];
  Classification classification;
  byte settlement_days[4];
  byte validated_at_csd;
  byte proprietary_trading_allowed;
  VettingAgentName vetting_agent_name;
  VettingAgentContact vetting_agent_contact;
  byte share_holding_percentage_limit[8];
  Sector sector;
  SecurityType security_type
};

int instruments_data_at;

/* every byte of Instruments Data set to one value */
inline fill_instruments_data(instruments_data_record, instruments_data_value) {
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.instrument_sequence[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.trading_session_sequence[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.unused_4[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.instrument_group_sequence[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.future_fee_sequence[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.option_fee_sequence[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.delivery_fee_sequence[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.market_number_c_1 = instruments_data_value;
  instruments_data_record.market_shard_number_c_1 = instruments_data_value;
  fill_instrument_name_p5(instruments_data_record.instrument_name_p_5, instruments_data_value);
  instruments_data_record.instrument_type_number_c_1 = instruments_data_value;
  fill_isin_code(instruments_data_record.isin_code, instruments_data_value);
  fill_description_p62(instruments_data_record.description_p_62, instruments_data_value);
  instruments_data_record.on_screen = instruments_data_value;
  fill_maturity_date(instruments_data_record.maturity_date, instruments_data_value);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.second_unused_4[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.nominal_divisor[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  fill_issue_date(instruments_data_record.issue_date, instruments_data_value);
  instruments_data_record.linked_to_floating_rate = instruments_data_value;
  instruments_data_record.unused_1 = instruments_data_value;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.underlying[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.options_exercise_is_percentage = instruments_data_value;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.options_exercise_cost[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.group_margin[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.vat = instruments_data_value;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.settlement_margin[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.physical_settlement = instruments_data_value;
  fill_group_description(instruments_data_record.group_description, instruments_data_value);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.third_unused_4[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.reference_inflation_rate[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.minimum_initiation_fee[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  fill_first_trade_reference(instruments_data_record.first_trade_reference, instruments_data_value);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 5 -> instruments_data_record.unused_5[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  fill_country_code(instruments_data_record.country_code, instruments_data_value);
  fill_display_name(instruments_data_record.display_name, instruments_data_value);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.number_of_days_in_a_year[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.bond_formula_decimal_places[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.coupon_rate[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  fill_classification(instruments_data_record.classification, instruments_data_value);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.settlement_days[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.validated_at_csd = instruments_data_value;
  instruments_data_record.proprietary_trading_allowed = instruments_data_value;
  fill_vetting_agent_name(instruments_data_record.vetting_agent_name, instruments_data_value);
  fill_vetting_agent_contact(instruments_data_record.vetting_agent_contact, instruments_data_value);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.share_holding_percentage_limit[instruments_data_at] = instruments_data_value; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  fill_sector(instruments_data_record.sector, instruments_data_value);
  fill_security_type(instruments_data_record.security_type, instruments_data_value);
  skip
}

/* each byte of Instruments Data set to where it lies, so a field read out of place says so */
inline ramp_instruments_data(instruments_data_record, instruments_data_base) {
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.instrument_sequence[instruments_data_at] = (instruments_data_base + 0 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.trading_session_sequence[instruments_data_at] = (instruments_data_base + 4 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.unused_4[instruments_data_at] = (instruments_data_base + 8 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.instrument_group_sequence[instruments_data_at] = (instruments_data_base + 12 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.future_fee_sequence[instruments_data_at] = (instruments_data_base + 16 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.option_fee_sequence[instruments_data_at] = (instruments_data_base + 20 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.delivery_fee_sequence[instruments_data_at] = (instruments_data_base + 24 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.market_number_c_1 = (instruments_data_base + 28 + 1) % 256;
  instruments_data_record.market_shard_number_c_1 = (instruments_data_base + 29 + 1) % 256;
  ramp_instrument_name_p5(instruments_data_record.instrument_name_p_5, instruments_data_base + 30);
  instruments_data_record.instrument_type_number_c_1 = (instruments_data_base + 35 + 1) % 256;
  ramp_isin_code(instruments_data_record.isin_code, instruments_data_base + 36);
  ramp_description_p62(instruments_data_record.description_p_62, instruments_data_base + 49);
  instruments_data_record.on_screen = (instruments_data_base + 111 + 1) % 256;
  ramp_maturity_date(instruments_data_record.maturity_date, instruments_data_base + 112);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.second_unused_4[instruments_data_at] = (instruments_data_base + 124 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.nominal_divisor[instruments_data_at] = (instruments_data_base + 128 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  ramp_issue_date(instruments_data_record.issue_date, instruments_data_base + 132);
  instruments_data_record.linked_to_floating_rate = (instruments_data_base + 144 + 1) % 256;
  instruments_data_record.unused_1 = (instruments_data_base + 145 + 1) % 256;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.underlying[instruments_data_at] = (instruments_data_base + 146 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.options_exercise_is_percentage = (instruments_data_base + 150 + 1) % 256;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.options_exercise_cost[instruments_data_at] = (instruments_data_base + 151 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.group_margin[instruments_data_at] = (instruments_data_base + 159 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.vat = (instruments_data_base + 167 + 1) % 256;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.settlement_margin[instruments_data_at] = (instruments_data_base + 168 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.physical_settlement = (instruments_data_base + 176 + 1) % 256;
  ramp_group_description(instruments_data_record.group_description, instruments_data_base + 177);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.third_unused_4[instruments_data_at] = (instruments_data_base + 237 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.reference_inflation_rate[instruments_data_at] = (instruments_data_base + 241 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.minimum_initiation_fee[instruments_data_at] = (instruments_data_base + 249 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  ramp_first_trade_reference(instruments_data_record.first_trade_reference, instruments_data_base + 257);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 5 -> instruments_data_record.unused_5[instruments_data_at] = (instruments_data_base + 267 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  ramp_country_code(instruments_data_record.country_code, instruments_data_base + 272);
  ramp_display_name(instruments_data_record.display_name, instruments_data_base + 276);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.number_of_days_in_a_year[instruments_data_at] = (instruments_data_base + 306 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.bond_formula_decimal_places[instruments_data_at] = (instruments_data_base + 310 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.coupon_rate[instruments_data_at] = (instruments_data_base + 314 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  ramp_classification(instruments_data_record.classification, instruments_data_base + 322);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.settlement_days[instruments_data_at] = (instruments_data_base + 352 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.validated_at_csd = (instruments_data_base + 356 + 1) % 256;
  instruments_data_record.proprietary_trading_allowed = (instruments_data_base + 357 + 1) % 256;
  ramp_vetting_agent_name(instruments_data_record.vetting_agent_name, instruments_data_base + 358);
  ramp_vetting_agent_contact(instruments_data_record.vetting_agent_contact, instruments_data_base + 388);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.share_holding_percentage_limit[instruments_data_at] = (instruments_data_base + 418 + instruments_data_at + 1) % 256; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  ramp_sector(instruments_data_record.sector, instruments_data_base + 426);
  ramp_security_type(instruments_data_record.security_type, instruments_data_base + 456);
  skip
}

/* Instruments Data to the wire, 486 bytes from where the cursor stands */
inline encode_instruments_data(instruments_data_record) {
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.instrument_sequence[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.trading_session_sequence[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.unused_4[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.instrument_group_sequence[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.future_fee_sequence[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.option_fee_sequence[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.delivery_fee_sequence[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  wire[at] = instruments_data_record.market_number_c_1; at = at + 1;
  wire[at] = instruments_data_record.market_shard_number_c_1; at = at + 1;
  encode_instrument_name_p5(instruments_data_record.instrument_name_p_5);
  wire[at] = instruments_data_record.instrument_type_number_c_1; at = at + 1;
  encode_isin_code(instruments_data_record.isin_code);
  encode_description_p62(instruments_data_record.description_p_62);
  wire[at] = instruments_data_record.on_screen; at = at + 1;
  encode_maturity_date(instruments_data_record.maturity_date);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.second_unused_4[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.nominal_divisor[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  encode_issue_date(instruments_data_record.issue_date);
  wire[at] = instruments_data_record.linked_to_floating_rate; at = at + 1;
  wire[at] = instruments_data_record.unused_1; at = at + 1;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.underlying[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  wire[at] = instruments_data_record.options_exercise_is_percentage; at = at + 1;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> wire[at] = instruments_data_record.options_exercise_cost[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> wire[at] = instruments_data_record.group_margin[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  wire[at] = instruments_data_record.vat; at = at + 1;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> wire[at] = instruments_data_record.settlement_margin[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  wire[at] = instruments_data_record.physical_settlement; at = at + 1;
  encode_group_description(instruments_data_record.group_description);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.third_unused_4[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> wire[at] = instruments_data_record.reference_inflation_rate[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> wire[at] = instruments_data_record.minimum_initiation_fee[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  encode_first_trade_reference(instruments_data_record.first_trade_reference);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 5 -> wire[at] = instruments_data_record.unused_5[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  encode_country_code(instruments_data_record.country_code);
  encode_display_name(instruments_data_record.display_name);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.number_of_days_in_a_year[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.bond_formula_decimal_places[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> wire[at] = instruments_data_record.coupon_rate[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  encode_classification(instruments_data_record.classification);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> wire[at] = instruments_data_record.settlement_days[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  wire[at] = instruments_data_record.validated_at_csd; at = at + 1;
  wire[at] = instruments_data_record.proprietary_trading_allowed; at = at + 1;
  encode_vetting_agent_name(instruments_data_record.vetting_agent_name);
  encode_vetting_agent_contact(instruments_data_record.vetting_agent_contact);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> wire[at] = instruments_data_record.share_holding_percentage_limit[instruments_data_at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  encode_sector(instruments_data_record.sector);
  encode_security_type(instruments_data_record.security_type);
  skip
}

/* Instruments Data off the wire, 486 bytes from where the cursor stands */
inline decode_instruments_data(instruments_data_record) {
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.instrument_sequence[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.trading_session_sequence[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.unused_4[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.instrument_group_sequence[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.future_fee_sequence[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.option_fee_sequence[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.delivery_fee_sequence[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.market_number_c_1 = wire[at]; at = at + 1;
  instruments_data_record.market_shard_number_c_1 = wire[at]; at = at + 1;
  decode_instrument_name_p5(instruments_data_record.instrument_name_p_5);
  instruments_data_record.instrument_type_number_c_1 = wire[at]; at = at + 1;
  decode_isin_code(instruments_data_record.isin_code);
  decode_description_p62(instruments_data_record.description_p_62);
  instruments_data_record.on_screen = wire[at]; at = at + 1;
  decode_maturity_date(instruments_data_record.maturity_date);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.second_unused_4[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.nominal_divisor[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  decode_issue_date(instruments_data_record.issue_date);
  instruments_data_record.linked_to_floating_rate = wire[at]; at = at + 1;
  instruments_data_record.unused_1 = wire[at]; at = at + 1;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.underlying[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.options_exercise_is_percentage = wire[at]; at = at + 1;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.options_exercise_cost[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.group_margin[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.vat = wire[at]; at = at + 1;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.settlement_margin[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.physical_settlement = wire[at]; at = at + 1;
  decode_group_description(instruments_data_record.group_description);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.third_unused_4[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.reference_inflation_rate[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.minimum_initiation_fee[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  decode_first_trade_reference(instruments_data_record.first_trade_reference);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 5 -> instruments_data_record.unused_5[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  decode_country_code(instruments_data_record.country_code);
  decode_display_name(instruments_data_record.display_name);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.number_of_days_in_a_year[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.bond_formula_decimal_places[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.coupon_rate[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  decode_classification(instruments_data_record.classification);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> instruments_data_record.settlement_days[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_record.validated_at_csd = wire[at]; at = at + 1;
  instruments_data_record.proprietary_trading_allowed = wire[at]; at = at + 1;
  decode_vetting_agent_name(instruments_data_record.vetting_agent_name);
  decode_vetting_agent_contact(instruments_data_record.vetting_agent_contact);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> instruments_data_record.share_holding_percentage_limit[instruments_data_at] = wire[at]; at = at + 1; instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  decode_sector(instruments_data_record.sector);
  decode_security_type(instruments_data_record.security_type);
  skip
}

/* what was read of Instruments Data is what was written, byte for byte */
inline equal_instruments_data(instruments_data_read, instruments_data_written) {
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.instrument_sequence[instruments_data_at] == instruments_data_written.instrument_sequence[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.trading_session_sequence[instruments_data_at] == instruments_data_written.trading_session_sequence[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.unused_4[instruments_data_at] == instruments_data_written.unused_4[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.instrument_group_sequence[instruments_data_at] == instruments_data_written.instrument_group_sequence[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.future_fee_sequence[instruments_data_at] == instruments_data_written.future_fee_sequence[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.option_fee_sequence[instruments_data_at] == instruments_data_written.option_fee_sequence[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.delivery_fee_sequence[instruments_data_at] == instruments_data_written.delivery_fee_sequence[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  assert(instruments_data_read.market_number_c_1 == instruments_data_written.market_number_c_1);
  assert(instruments_data_read.market_shard_number_c_1 == instruments_data_written.market_shard_number_c_1);
  equal_instrument_name_p5(instruments_data_read.instrument_name_p_5, instruments_data_written.instrument_name_p_5);
  assert(instruments_data_read.instrument_type_number_c_1 == instruments_data_written.instrument_type_number_c_1);
  equal_isin_code(instruments_data_read.isin_code, instruments_data_written.isin_code);
  equal_description_p62(instruments_data_read.description_p_62, instruments_data_written.description_p_62);
  assert(instruments_data_read.on_screen == instruments_data_written.on_screen);
  equal_maturity_date(instruments_data_read.maturity_date, instruments_data_written.maturity_date);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.second_unused_4[instruments_data_at] == instruments_data_written.second_unused_4[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.nominal_divisor[instruments_data_at] == instruments_data_written.nominal_divisor[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  equal_issue_date(instruments_data_read.issue_date, instruments_data_written.issue_date);
  assert(instruments_data_read.linked_to_floating_rate == instruments_data_written.linked_to_floating_rate);
  assert(instruments_data_read.unused_1 == instruments_data_written.unused_1);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.underlying[instruments_data_at] == instruments_data_written.underlying[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  assert(instruments_data_read.options_exercise_is_percentage == instruments_data_written.options_exercise_is_percentage);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> assert(instruments_data_read.options_exercise_cost[instruments_data_at] == instruments_data_written.options_exercise_cost[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> assert(instruments_data_read.group_margin[instruments_data_at] == instruments_data_written.group_margin[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  assert(instruments_data_read.vat == instruments_data_written.vat);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> assert(instruments_data_read.settlement_margin[instruments_data_at] == instruments_data_written.settlement_margin[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  assert(instruments_data_read.physical_settlement == instruments_data_written.physical_settlement);
  equal_group_description(instruments_data_read.group_description, instruments_data_written.group_description);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.third_unused_4[instruments_data_at] == instruments_data_written.third_unused_4[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> assert(instruments_data_read.reference_inflation_rate[instruments_data_at] == instruments_data_written.reference_inflation_rate[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> assert(instruments_data_read.minimum_initiation_fee[instruments_data_at] == instruments_data_written.minimum_initiation_fee[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  equal_first_trade_reference(instruments_data_read.first_trade_reference, instruments_data_written.first_trade_reference);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 5 -> assert(instruments_data_read.unused_5[instruments_data_at] == instruments_data_written.unused_5[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  equal_country_code(instruments_data_read.country_code, instruments_data_written.country_code);
  equal_display_name(instruments_data_read.display_name, instruments_data_written.display_name);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.number_of_days_in_a_year[instruments_data_at] == instruments_data_written.number_of_days_in_a_year[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.bond_formula_decimal_places[instruments_data_at] == instruments_data_written.bond_formula_decimal_places[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> assert(instruments_data_read.coupon_rate[instruments_data_at] == instruments_data_written.coupon_rate[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  equal_classification(instruments_data_read.classification, instruments_data_written.classification);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 4 -> assert(instruments_data_read.settlement_days[instruments_data_at] == instruments_data_written.settlement_days[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  assert(instruments_data_read.validated_at_csd == instruments_data_written.validated_at_csd);
  assert(instruments_data_read.proprietary_trading_allowed == instruments_data_written.proprietary_trading_allowed);
  equal_vetting_agent_name(instruments_data_read.vetting_agent_name, instruments_data_written.vetting_agent_name);
  equal_vetting_agent_contact(instruments_data_read.vetting_agent_contact, instruments_data_written.vetting_agent_contact);
  instruments_data_at = 0;
  do
  :: instruments_data_at < 8 -> assert(instruments_data_read.share_holding_percentage_limit[instruments_data_at] == instruments_data_written.share_holding_percentage_limit[instruments_data_at]); instruments_data_at = instruments_data_at + 1
  :: else -> break
  od;
  equal_sector(instruments_data_read.sector, instruments_data_written.sector);
  equal_security_type(instruments_data_read.security_type, instruments_data_written.security_type);
  skip
}

/* ---- Expiry Date: 12 bytes --------------------------------------------------- */

/* Expiry Date */
typedef ExpiryDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int expiry_date_at;

/* every byte of Expiry Date set to one value */
inline fill_expiry_date(expiry_date_record, expiry_date_value) {
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> expiry_date_record.year[expiry_date_at] = expiry_date_value; expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> expiry_date_record.month[expiry_date_at] = expiry_date_value; expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> expiry_date_record.day[expiry_date_at] = expiry_date_value; expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Expiry Date set to where it lies, so a field read out of place says so */
inline ramp_expiry_date(expiry_date_record, expiry_date_base) {
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> expiry_date_record.year[expiry_date_at] = (expiry_date_base + 0 + expiry_date_at + 1) % 256; expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> expiry_date_record.month[expiry_date_at] = (expiry_date_base + 4 + expiry_date_at + 1) % 256; expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> expiry_date_record.day[expiry_date_at] = (expiry_date_base + 8 + expiry_date_at + 1) % 256; expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* Expiry Date to the wire, 12 bytes from where the cursor stands */
inline encode_expiry_date(expiry_date_record) {
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> wire[at] = expiry_date_record.year[expiry_date_at]; at = at + 1; expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> wire[at] = expiry_date_record.month[expiry_date_at]; at = at + 1; expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> wire[at] = expiry_date_record.day[expiry_date_at]; at = at + 1; expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* Expiry Date off the wire, 12 bytes from where the cursor stands */
inline decode_expiry_date(expiry_date_record) {
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> expiry_date_record.year[expiry_date_at] = wire[at]; at = at + 1; expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> expiry_date_record.month[expiry_date_at] = wire[at]; at = at + 1; expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> expiry_date_record.day[expiry_date_at] = wire[at]; at = at + 1; expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Expiry Date is what was written, byte for byte */
inline equal_expiry_date(expiry_date_read, expiry_date_written) {
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> assert(expiry_date_read.year[expiry_date_at] == expiry_date_written.year[expiry_date_at]); expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> assert(expiry_date_read.month[expiry_date_at] == expiry_date_written.month[expiry_date_at]); expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  expiry_date_at = 0;
  do
  :: expiry_date_at < 4 -> assert(expiry_date_read.day[expiry_date_at] == expiry_date_written.day[expiry_date_at]); expiry_date_at = expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Valuation Date: 12 bytes ------------------------------------------------ */

/* Valuation Date */
typedef ValuationDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int valuation_date_at;

/* every byte of Valuation Date set to one value */
inline fill_valuation_date(valuation_date_record, valuation_date_value) {
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> valuation_date_record.year[valuation_date_at] = valuation_date_value; valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> valuation_date_record.month[valuation_date_at] = valuation_date_value; valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> valuation_date_record.day[valuation_date_at] = valuation_date_value; valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Valuation Date set to where it lies, so a field read out of place says so */
inline ramp_valuation_date(valuation_date_record, valuation_date_base) {
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> valuation_date_record.year[valuation_date_at] = (valuation_date_base + 0 + valuation_date_at + 1) % 256; valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> valuation_date_record.month[valuation_date_at] = (valuation_date_base + 4 + valuation_date_at + 1) % 256; valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> valuation_date_record.day[valuation_date_at] = (valuation_date_base + 8 + valuation_date_at + 1) % 256; valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  skip
}

/* Valuation Date to the wire, 12 bytes from where the cursor stands */
inline encode_valuation_date(valuation_date_record) {
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> wire[at] = valuation_date_record.year[valuation_date_at]; at = at + 1; valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> wire[at] = valuation_date_record.month[valuation_date_at]; at = at + 1; valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> wire[at] = valuation_date_record.day[valuation_date_at]; at = at + 1; valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  skip
}

/* Valuation Date off the wire, 12 bytes from where the cursor stands */
inline decode_valuation_date(valuation_date_record) {
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> valuation_date_record.year[valuation_date_at] = wire[at]; at = at + 1; valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> valuation_date_record.month[valuation_date_at] = wire[at]; at = at + 1; valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> valuation_date_record.day[valuation_date_at] = wire[at]; at = at + 1; valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Valuation Date is what was written, byte for byte */
inline equal_valuation_date(valuation_date_read, valuation_date_written) {
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> assert(valuation_date_read.year[valuation_date_at] == valuation_date_written.year[valuation_date_at]); valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> assert(valuation_date_read.month[valuation_date_at] == valuation_date_written.month[valuation_date_at]); valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  valuation_date_at = 0;
  do
  :: valuation_date_at < 4 -> assert(valuation_date_read.day[valuation_date_at] == valuation_date_written.day[valuation_date_at]); valuation_date_at = valuation_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Clearance Date: 12 bytes ------------------------------------------------ */

/* Clearance Date */
typedef ClearanceDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int clearance_date_at;

/* every byte of Clearance Date set to one value */
inline fill_clearance_date(clearance_date_record, clearance_date_value) {
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> clearance_date_record.year[clearance_date_at] = clearance_date_value; clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> clearance_date_record.month[clearance_date_at] = clearance_date_value; clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> clearance_date_record.day[clearance_date_at] = clearance_date_value; clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Clearance Date set to where it lies, so a field read out of place says so */
inline ramp_clearance_date(clearance_date_record, clearance_date_base) {
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> clearance_date_record.year[clearance_date_at] = (clearance_date_base + 0 + clearance_date_at + 1) % 256; clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> clearance_date_record.month[clearance_date_at] = (clearance_date_base + 4 + clearance_date_at + 1) % 256; clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> clearance_date_record.day[clearance_date_at] = (clearance_date_base + 8 + clearance_date_at + 1) % 256; clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  skip
}

/* Clearance Date to the wire, 12 bytes from where the cursor stands */
inline encode_clearance_date(clearance_date_record) {
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> wire[at] = clearance_date_record.year[clearance_date_at]; at = at + 1; clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> wire[at] = clearance_date_record.month[clearance_date_at]; at = at + 1; clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> wire[at] = clearance_date_record.day[clearance_date_at]; at = at + 1; clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  skip
}

/* Clearance Date off the wire, 12 bytes from where the cursor stands */
inline decode_clearance_date(clearance_date_record) {
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> clearance_date_record.year[clearance_date_at] = wire[at]; at = at + 1; clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> clearance_date_record.month[clearance_date_at] = wire[at]; at = at + 1; clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> clearance_date_record.day[clearance_date_at] = wire[at]; at = at + 1; clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Clearance Date is what was written, byte for byte */
inline equal_clearance_date(clearance_date_read, clearance_date_written) {
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> assert(clearance_date_read.year[clearance_date_at] == clearance_date_written.year[clearance_date_at]); clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> assert(clearance_date_read.month[clearance_date_at] == clearance_date_written.month[clearance_date_at]); clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  clearance_date_at = 0;
  do
  :: clearance_date_at < 4 -> assert(clearance_date_read.day[clearance_date_at] == clearance_date_written.day[clearance_date_at]); clearance_date_at = clearance_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Contract Dates: 243 bytes ----------------------------------------------- */

/* Contract Dates */
typedef ContractDates {
  byte instrument_sequence[4];
  byte contract_date_sequence[4];
  byte trading_session_sequence[4];
  ExpiryDate expiry_date;
  ValuationDate valuation_date;
  byte nominal[8];
  byte strike_interval[8];
  byte strike_interval_off_screen[8];
  byte spread_margin[8];
  byte lot_size[4];
  byte option_lot_size[4];
  byte big_depth;
  byte price_rate;
  byte max_change[8];
  byte max_days_move[8];
  byte max_gap[8];
  byte unused_1;
  byte options_allowed;
  byte deltas_allowed;
  byte spreads_allowed;
  byte initial_margin[8];
  byte quote_format_decimal_places[4];
  byte price_format_decimal_places[4];
  byte option_premium_format_decimal_places[4];
  byte price_multiplier[2];
  ClearanceDate clearance_date;
  byte vsr[8];
  byte rpve[8];
  byte volatility_rounding_places[4];
  byte can_trade_options_onscreen;
  byte can_trade_options_report_only;
  byte can_trade_onscreen;
  byte can_trade_report_only;
  byte price_interval[8];
  byte minimum_valid_bid_volume_on_screen[4];
  byte minimum_valid_bid_volume_off_screen[4];
  byte minimum_valid_bid_volume_on_screen_options[4];
  byte minimum_valid_bid_volume_off_screen_options[4];
  byte all_or_nothing_allowed;
  byte at_best_orders_allowed;
  byte stop_orders_allowed;
  byte ice_berg_orders_allowed;
  byte hold_over_orders_allowed;
  byte at_close_orders_allowed;
  byte future_anonymous;
  byte option_anonymous;
  byte unused_17[17];
  byte rfq_allowed;
  byte quantity_tick_size[4];
  byte unused_8[8];
  byte minimum_all_or_nothing_quantity[8];
  byte minimum_iceberg_quantity[8];
  byte good_till_cancelled_allowed
};

int contract_dates_at;

/* every byte of Contract Dates set to one value */
inline fill_contract_dates(contract_dates_record, contract_dates_value) {
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.instrument_sequence[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.contract_date_sequence[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.trading_session_sequence[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  fill_expiry_date(contract_dates_record.expiry_date, contract_dates_value);
  fill_valuation_date(contract_dates_record.valuation_date, contract_dates_value);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.nominal[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.strike_interval[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.strike_interval_off_screen[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.spread_margin[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.lot_size[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.option_lot_size[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.big_depth = contract_dates_value;
  contract_dates_record.price_rate = contract_dates_value;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.max_change[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.max_days_move[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.max_gap[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.unused_1 = contract_dates_value;
  contract_dates_record.options_allowed = contract_dates_value;
  contract_dates_record.deltas_allowed = contract_dates_value;
  contract_dates_record.spreads_allowed = contract_dates_value;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.initial_margin[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.quote_format_decimal_places[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.price_format_decimal_places[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.option_premium_format_decimal_places[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 2 -> contract_dates_record.price_multiplier[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  fill_clearance_date(contract_dates_record.clearance_date, contract_dates_value);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.vsr[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.rpve[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.volatility_rounding_places[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.can_trade_options_onscreen = contract_dates_value;
  contract_dates_record.can_trade_options_report_only = contract_dates_value;
  contract_dates_record.can_trade_onscreen = contract_dates_value;
  contract_dates_record.can_trade_report_only = contract_dates_value;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.price_interval[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.minimum_valid_bid_volume_on_screen[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.minimum_valid_bid_volume_off_screen[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.minimum_valid_bid_volume_on_screen_options[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.minimum_valid_bid_volume_off_screen_options[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.all_or_nothing_allowed = contract_dates_value;
  contract_dates_record.at_best_orders_allowed = contract_dates_value;
  contract_dates_record.stop_orders_allowed = contract_dates_value;
  contract_dates_record.ice_berg_orders_allowed = contract_dates_value;
  contract_dates_record.hold_over_orders_allowed = contract_dates_value;
  contract_dates_record.at_close_orders_allowed = contract_dates_value;
  contract_dates_record.future_anonymous = contract_dates_value;
  contract_dates_record.option_anonymous = contract_dates_value;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 17 -> contract_dates_record.unused_17[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.rfq_allowed = contract_dates_value;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.quantity_tick_size[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.unused_8[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.minimum_all_or_nothing_quantity[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.minimum_iceberg_quantity[contract_dates_at] = contract_dates_value; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.good_till_cancelled_allowed = contract_dates_value;
  skip
}

/* each byte of Contract Dates set to where it lies, so a field read out of place says so */
inline ramp_contract_dates(contract_dates_record, contract_dates_base) {
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.instrument_sequence[contract_dates_at] = (contract_dates_base + 0 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.contract_date_sequence[contract_dates_at] = (contract_dates_base + 4 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.trading_session_sequence[contract_dates_at] = (contract_dates_base + 8 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  ramp_expiry_date(contract_dates_record.expiry_date, contract_dates_base + 12);
  ramp_valuation_date(contract_dates_record.valuation_date, contract_dates_base + 24);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.nominal[contract_dates_at] = (contract_dates_base + 36 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.strike_interval[contract_dates_at] = (contract_dates_base + 44 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.strike_interval_off_screen[contract_dates_at] = (contract_dates_base + 52 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.spread_margin[contract_dates_at] = (contract_dates_base + 60 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.lot_size[contract_dates_at] = (contract_dates_base + 68 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.option_lot_size[contract_dates_at] = (contract_dates_base + 72 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.big_depth = (contract_dates_base + 76 + 1) % 256;
  contract_dates_record.price_rate = (contract_dates_base + 77 + 1) % 256;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.max_change[contract_dates_at] = (contract_dates_base + 78 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.max_days_move[contract_dates_at] = (contract_dates_base + 86 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.max_gap[contract_dates_at] = (contract_dates_base + 94 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.unused_1 = (contract_dates_base + 102 + 1) % 256;
  contract_dates_record.options_allowed = (contract_dates_base + 103 + 1) % 256;
  contract_dates_record.deltas_allowed = (contract_dates_base + 104 + 1) % 256;
  contract_dates_record.spreads_allowed = (contract_dates_base + 105 + 1) % 256;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.initial_margin[contract_dates_at] = (contract_dates_base + 106 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.quote_format_decimal_places[contract_dates_at] = (contract_dates_base + 114 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.price_format_decimal_places[contract_dates_at] = (contract_dates_base + 118 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.option_premium_format_decimal_places[contract_dates_at] = (contract_dates_base + 122 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 2 -> contract_dates_record.price_multiplier[contract_dates_at] = (contract_dates_base + 126 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  ramp_clearance_date(contract_dates_record.clearance_date, contract_dates_base + 128);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.vsr[contract_dates_at] = (contract_dates_base + 140 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.rpve[contract_dates_at] = (contract_dates_base + 148 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.volatility_rounding_places[contract_dates_at] = (contract_dates_base + 156 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.can_trade_options_onscreen = (contract_dates_base + 160 + 1) % 256;
  contract_dates_record.can_trade_options_report_only = (contract_dates_base + 161 + 1) % 256;
  contract_dates_record.can_trade_onscreen = (contract_dates_base + 162 + 1) % 256;
  contract_dates_record.can_trade_report_only = (contract_dates_base + 163 + 1) % 256;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.price_interval[contract_dates_at] = (contract_dates_base + 164 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.minimum_valid_bid_volume_on_screen[contract_dates_at] = (contract_dates_base + 172 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.minimum_valid_bid_volume_off_screen[contract_dates_at] = (contract_dates_base + 176 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.minimum_valid_bid_volume_on_screen_options[contract_dates_at] = (contract_dates_base + 180 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.minimum_valid_bid_volume_off_screen_options[contract_dates_at] = (contract_dates_base + 184 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.all_or_nothing_allowed = (contract_dates_base + 188 + 1) % 256;
  contract_dates_record.at_best_orders_allowed = (contract_dates_base + 189 + 1) % 256;
  contract_dates_record.stop_orders_allowed = (contract_dates_base + 190 + 1) % 256;
  contract_dates_record.ice_berg_orders_allowed = (contract_dates_base + 191 + 1) % 256;
  contract_dates_record.hold_over_orders_allowed = (contract_dates_base + 192 + 1) % 256;
  contract_dates_record.at_close_orders_allowed = (contract_dates_base + 193 + 1) % 256;
  contract_dates_record.future_anonymous = (contract_dates_base + 194 + 1) % 256;
  contract_dates_record.option_anonymous = (contract_dates_base + 195 + 1) % 256;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 17 -> contract_dates_record.unused_17[contract_dates_at] = (contract_dates_base + 196 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.rfq_allowed = (contract_dates_base + 213 + 1) % 256;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.quantity_tick_size[contract_dates_at] = (contract_dates_base + 214 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.unused_8[contract_dates_at] = (contract_dates_base + 218 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.minimum_all_or_nothing_quantity[contract_dates_at] = (contract_dates_base + 226 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.minimum_iceberg_quantity[contract_dates_at] = (contract_dates_base + 234 + contract_dates_at + 1) % 256; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.good_till_cancelled_allowed = (contract_dates_base + 242 + 1) % 256;
  skip
}

/* Contract Dates to the wire, 243 bytes from where the cursor stands */
inline encode_contract_dates(contract_dates_record) {
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.instrument_sequence[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.contract_date_sequence[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.trading_session_sequence[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  encode_expiry_date(contract_dates_record.expiry_date);
  encode_valuation_date(contract_dates_record.valuation_date);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.nominal[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.strike_interval[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.strike_interval_off_screen[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.spread_margin[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.lot_size[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.option_lot_size[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  wire[at] = contract_dates_record.big_depth; at = at + 1;
  wire[at] = contract_dates_record.price_rate; at = at + 1;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.max_change[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.max_days_move[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.max_gap[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  wire[at] = contract_dates_record.unused_1; at = at + 1;
  wire[at] = contract_dates_record.options_allowed; at = at + 1;
  wire[at] = contract_dates_record.deltas_allowed; at = at + 1;
  wire[at] = contract_dates_record.spreads_allowed; at = at + 1;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.initial_margin[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.quote_format_decimal_places[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.price_format_decimal_places[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.option_premium_format_decimal_places[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 2 -> wire[at] = contract_dates_record.price_multiplier[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  encode_clearance_date(contract_dates_record.clearance_date);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.vsr[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.rpve[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.volatility_rounding_places[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  wire[at] = contract_dates_record.can_trade_options_onscreen; at = at + 1;
  wire[at] = contract_dates_record.can_trade_options_report_only; at = at + 1;
  wire[at] = contract_dates_record.can_trade_onscreen; at = at + 1;
  wire[at] = contract_dates_record.can_trade_report_only; at = at + 1;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.price_interval[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.minimum_valid_bid_volume_on_screen[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.minimum_valid_bid_volume_off_screen[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.minimum_valid_bid_volume_on_screen_options[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.minimum_valid_bid_volume_off_screen_options[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  wire[at] = contract_dates_record.all_or_nothing_allowed; at = at + 1;
  wire[at] = contract_dates_record.at_best_orders_allowed; at = at + 1;
  wire[at] = contract_dates_record.stop_orders_allowed; at = at + 1;
  wire[at] = contract_dates_record.ice_berg_orders_allowed; at = at + 1;
  wire[at] = contract_dates_record.hold_over_orders_allowed; at = at + 1;
  wire[at] = contract_dates_record.at_close_orders_allowed; at = at + 1;
  wire[at] = contract_dates_record.future_anonymous; at = at + 1;
  wire[at] = contract_dates_record.option_anonymous; at = at + 1;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 17 -> wire[at] = contract_dates_record.unused_17[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  wire[at] = contract_dates_record.rfq_allowed; at = at + 1;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> wire[at] = contract_dates_record.quantity_tick_size[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.unused_8[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.minimum_all_or_nothing_quantity[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> wire[at] = contract_dates_record.minimum_iceberg_quantity[contract_dates_at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  wire[at] = contract_dates_record.good_till_cancelled_allowed; at = at + 1;
  skip
}

/* Contract Dates off the wire, 243 bytes from where the cursor stands */
inline decode_contract_dates(contract_dates_record) {
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.instrument_sequence[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.contract_date_sequence[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.trading_session_sequence[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  decode_expiry_date(contract_dates_record.expiry_date);
  decode_valuation_date(contract_dates_record.valuation_date);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.nominal[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.strike_interval[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.strike_interval_off_screen[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.spread_margin[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.lot_size[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.option_lot_size[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.big_depth = wire[at]; at = at + 1;
  contract_dates_record.price_rate = wire[at]; at = at + 1;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.max_change[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.max_days_move[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.max_gap[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.unused_1 = wire[at]; at = at + 1;
  contract_dates_record.options_allowed = wire[at]; at = at + 1;
  contract_dates_record.deltas_allowed = wire[at]; at = at + 1;
  contract_dates_record.spreads_allowed = wire[at]; at = at + 1;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.initial_margin[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.quote_format_decimal_places[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.price_format_decimal_places[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.option_premium_format_decimal_places[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 2 -> contract_dates_record.price_multiplier[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  decode_clearance_date(contract_dates_record.clearance_date);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.vsr[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.rpve[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.volatility_rounding_places[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.can_trade_options_onscreen = wire[at]; at = at + 1;
  contract_dates_record.can_trade_options_report_only = wire[at]; at = at + 1;
  contract_dates_record.can_trade_onscreen = wire[at]; at = at + 1;
  contract_dates_record.can_trade_report_only = wire[at]; at = at + 1;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.price_interval[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.minimum_valid_bid_volume_on_screen[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.minimum_valid_bid_volume_off_screen[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.minimum_valid_bid_volume_on_screen_options[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.minimum_valid_bid_volume_off_screen_options[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.all_or_nothing_allowed = wire[at]; at = at + 1;
  contract_dates_record.at_best_orders_allowed = wire[at]; at = at + 1;
  contract_dates_record.stop_orders_allowed = wire[at]; at = at + 1;
  contract_dates_record.ice_berg_orders_allowed = wire[at]; at = at + 1;
  contract_dates_record.hold_over_orders_allowed = wire[at]; at = at + 1;
  contract_dates_record.at_close_orders_allowed = wire[at]; at = at + 1;
  contract_dates_record.future_anonymous = wire[at]; at = at + 1;
  contract_dates_record.option_anonymous = wire[at]; at = at + 1;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 17 -> contract_dates_record.unused_17[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.rfq_allowed = wire[at]; at = at + 1;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> contract_dates_record.quantity_tick_size[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.unused_8[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.minimum_all_or_nothing_quantity[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> contract_dates_record.minimum_iceberg_quantity[contract_dates_at] = wire[at]; at = at + 1; contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_record.good_till_cancelled_allowed = wire[at]; at = at + 1;
  skip
}

/* what was read of Contract Dates is what was written, byte for byte */
inline equal_contract_dates(contract_dates_read, contract_dates_written) {
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.instrument_sequence[contract_dates_at] == contract_dates_written.instrument_sequence[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.contract_date_sequence[contract_dates_at] == contract_dates_written.contract_date_sequence[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.trading_session_sequence[contract_dates_at] == contract_dates_written.trading_session_sequence[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  equal_expiry_date(contract_dates_read.expiry_date, contract_dates_written.expiry_date);
  equal_valuation_date(contract_dates_read.valuation_date, contract_dates_written.valuation_date);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.nominal[contract_dates_at] == contract_dates_written.nominal[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.strike_interval[contract_dates_at] == contract_dates_written.strike_interval[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.strike_interval_off_screen[contract_dates_at] == contract_dates_written.strike_interval_off_screen[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.spread_margin[contract_dates_at] == contract_dates_written.spread_margin[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.lot_size[contract_dates_at] == contract_dates_written.lot_size[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.option_lot_size[contract_dates_at] == contract_dates_written.option_lot_size[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  assert(contract_dates_read.big_depth == contract_dates_written.big_depth);
  assert(contract_dates_read.price_rate == contract_dates_written.price_rate);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.max_change[contract_dates_at] == contract_dates_written.max_change[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.max_days_move[contract_dates_at] == contract_dates_written.max_days_move[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.max_gap[contract_dates_at] == contract_dates_written.max_gap[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  assert(contract_dates_read.unused_1 == contract_dates_written.unused_1);
  assert(contract_dates_read.options_allowed == contract_dates_written.options_allowed);
  assert(contract_dates_read.deltas_allowed == contract_dates_written.deltas_allowed);
  assert(contract_dates_read.spreads_allowed == contract_dates_written.spreads_allowed);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.initial_margin[contract_dates_at] == contract_dates_written.initial_margin[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.quote_format_decimal_places[contract_dates_at] == contract_dates_written.quote_format_decimal_places[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.price_format_decimal_places[contract_dates_at] == contract_dates_written.price_format_decimal_places[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.option_premium_format_decimal_places[contract_dates_at] == contract_dates_written.option_premium_format_decimal_places[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 2 -> assert(contract_dates_read.price_multiplier[contract_dates_at] == contract_dates_written.price_multiplier[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  equal_clearance_date(contract_dates_read.clearance_date, contract_dates_written.clearance_date);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.vsr[contract_dates_at] == contract_dates_written.vsr[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.rpve[contract_dates_at] == contract_dates_written.rpve[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.volatility_rounding_places[contract_dates_at] == contract_dates_written.volatility_rounding_places[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  assert(contract_dates_read.can_trade_options_onscreen == contract_dates_written.can_trade_options_onscreen);
  assert(contract_dates_read.can_trade_options_report_only == contract_dates_written.can_trade_options_report_only);
  assert(contract_dates_read.can_trade_onscreen == contract_dates_written.can_trade_onscreen);
  assert(contract_dates_read.can_trade_report_only == contract_dates_written.can_trade_report_only);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.price_interval[contract_dates_at] == contract_dates_written.price_interval[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.minimum_valid_bid_volume_on_screen[contract_dates_at] == contract_dates_written.minimum_valid_bid_volume_on_screen[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.minimum_valid_bid_volume_off_screen[contract_dates_at] == contract_dates_written.minimum_valid_bid_volume_off_screen[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.minimum_valid_bid_volume_on_screen_options[contract_dates_at] == contract_dates_written.minimum_valid_bid_volume_on_screen_options[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.minimum_valid_bid_volume_off_screen_options[contract_dates_at] == contract_dates_written.minimum_valid_bid_volume_off_screen_options[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  assert(contract_dates_read.all_or_nothing_allowed == contract_dates_written.all_or_nothing_allowed);
  assert(contract_dates_read.at_best_orders_allowed == contract_dates_written.at_best_orders_allowed);
  assert(contract_dates_read.stop_orders_allowed == contract_dates_written.stop_orders_allowed);
  assert(contract_dates_read.ice_berg_orders_allowed == contract_dates_written.ice_berg_orders_allowed);
  assert(contract_dates_read.hold_over_orders_allowed == contract_dates_written.hold_over_orders_allowed);
  assert(contract_dates_read.at_close_orders_allowed == contract_dates_written.at_close_orders_allowed);
  assert(contract_dates_read.future_anonymous == contract_dates_written.future_anonymous);
  assert(contract_dates_read.option_anonymous == contract_dates_written.option_anonymous);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 17 -> assert(contract_dates_read.unused_17[contract_dates_at] == contract_dates_written.unused_17[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  assert(contract_dates_read.rfq_allowed == contract_dates_written.rfq_allowed);
  contract_dates_at = 0;
  do
  :: contract_dates_at < 4 -> assert(contract_dates_read.quantity_tick_size[contract_dates_at] == contract_dates_written.quantity_tick_size[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.unused_8[contract_dates_at] == contract_dates_written.unused_8[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.minimum_all_or_nothing_quantity[contract_dates_at] == contract_dates_written.minimum_all_or_nothing_quantity[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  contract_dates_at = 0;
  do
  :: contract_dates_at < 8 -> assert(contract_dates_read.minimum_iceberg_quantity[contract_dates_at] == contract_dates_written.minimum_iceberg_quantity[contract_dates_at]); contract_dates_at = contract_dates_at + 1
  :: else -> break
  od;
  assert(contract_dates_read.good_till_cancelled_allowed == contract_dates_written.good_till_cancelled_allowed);
  skip
}

/* ---- Strike Expiry Date: 12 bytes -------------------------------------------- */

/* Strike Expiry Date */
typedef StrikeExpiryDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int strike_expiry_date_at;

/* every byte of Strike Expiry Date set to one value */
inline fill_strike_expiry_date(strike_expiry_date_record, strike_expiry_date_value) {
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> strike_expiry_date_record.year[strike_expiry_date_at] = strike_expiry_date_value; strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> strike_expiry_date_record.month[strike_expiry_date_at] = strike_expiry_date_value; strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> strike_expiry_date_record.day[strike_expiry_date_at] = strike_expiry_date_value; strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Strike Expiry Date set to where it lies, so a field read out of place says so */
inline ramp_strike_expiry_date(strike_expiry_date_record, strike_expiry_date_base) {
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> strike_expiry_date_record.year[strike_expiry_date_at] = (strike_expiry_date_base + 0 + strike_expiry_date_at + 1) % 256; strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> strike_expiry_date_record.month[strike_expiry_date_at] = (strike_expiry_date_base + 4 + strike_expiry_date_at + 1) % 256; strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> strike_expiry_date_record.day[strike_expiry_date_at] = (strike_expiry_date_base + 8 + strike_expiry_date_at + 1) % 256; strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* Strike Expiry Date to the wire, 12 bytes from where the cursor stands */
inline encode_strike_expiry_date(strike_expiry_date_record) {
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> wire[at] = strike_expiry_date_record.year[strike_expiry_date_at]; at = at + 1; strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> wire[at] = strike_expiry_date_record.month[strike_expiry_date_at]; at = at + 1; strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> wire[at] = strike_expiry_date_record.day[strike_expiry_date_at]; at = at + 1; strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* Strike Expiry Date off the wire, 12 bytes from where the cursor stands */
inline decode_strike_expiry_date(strike_expiry_date_record) {
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> strike_expiry_date_record.year[strike_expiry_date_at] = wire[at]; at = at + 1; strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> strike_expiry_date_record.month[strike_expiry_date_at] = wire[at]; at = at + 1; strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> strike_expiry_date_record.day[strike_expiry_date_at] = wire[at]; at = at + 1; strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Strike Expiry Date is what was written, byte for byte */
inline equal_strike_expiry_date(strike_expiry_date_read, strike_expiry_date_written) {
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> assert(strike_expiry_date_read.year[strike_expiry_date_at] == strike_expiry_date_written.year[strike_expiry_date_at]); strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> assert(strike_expiry_date_read.month[strike_expiry_date_at] == strike_expiry_date_written.month[strike_expiry_date_at]); strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  strike_expiry_date_at = 0;
  do
  :: strike_expiry_date_at < 4 -> assert(strike_expiry_date_read.day[strike_expiry_date_at] == strike_expiry_date_written.day[strike_expiry_date_at]); strike_expiry_date_at = strike_expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Strike Data: 30 bytes --------------------------------------------------- */

/* Strike Data */
typedef StrikeData {
  byte strike_sequence_number[4];
  byte contract_date_sequence[4];
  byte strike[8];
  StrikeExpiryDate strike_expiry_date;
  byte deltas;
  byte call_or_put
};

int strike_data_at;

/* every byte of Strike Data set to one value */
inline fill_strike_data(strike_data_record, strike_data_value) {
  strike_data_at = 0;
  do
  :: strike_data_at < 4 -> strike_data_record.strike_sequence_number[strike_data_at] = strike_data_value; strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  strike_data_at = 0;
  do
  :: strike_data_at < 4 -> strike_data_record.contract_date_sequence[strike_data_at] = strike_data_value; strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  strike_data_at = 0;
  do
  :: strike_data_at < 8 -> strike_data_record.strike[strike_data_at] = strike_data_value; strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  fill_strike_expiry_date(strike_data_record.strike_expiry_date, strike_data_value);
  strike_data_record.deltas = strike_data_value;
  strike_data_record.call_or_put = strike_data_value;
  skip
}

/* each byte of Strike Data set to where it lies, so a field read out of place says so */
inline ramp_strike_data(strike_data_record, strike_data_base) {
  strike_data_at = 0;
  do
  :: strike_data_at < 4 -> strike_data_record.strike_sequence_number[strike_data_at] = (strike_data_base + 0 + strike_data_at + 1) % 256; strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  strike_data_at = 0;
  do
  :: strike_data_at < 4 -> strike_data_record.contract_date_sequence[strike_data_at] = (strike_data_base + 4 + strike_data_at + 1) % 256; strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  strike_data_at = 0;
  do
  :: strike_data_at < 8 -> strike_data_record.strike[strike_data_at] = (strike_data_base + 8 + strike_data_at + 1) % 256; strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  ramp_strike_expiry_date(strike_data_record.strike_expiry_date, strike_data_base + 16);
  strike_data_record.deltas = (strike_data_base + 28 + 1) % 256;
  strike_data_record.call_or_put = (strike_data_base + 29 + 1) % 256;
  skip
}

/* Strike Data to the wire, 30 bytes from where the cursor stands */
inline encode_strike_data(strike_data_record) {
  strike_data_at = 0;
  do
  :: strike_data_at < 4 -> wire[at] = strike_data_record.strike_sequence_number[strike_data_at]; at = at + 1; strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  strike_data_at = 0;
  do
  :: strike_data_at < 4 -> wire[at] = strike_data_record.contract_date_sequence[strike_data_at]; at = at + 1; strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  strike_data_at = 0;
  do
  :: strike_data_at < 8 -> wire[at] = strike_data_record.strike[strike_data_at]; at = at + 1; strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  encode_strike_expiry_date(strike_data_record.strike_expiry_date);
  wire[at] = strike_data_record.deltas; at = at + 1;
  wire[at] = strike_data_record.call_or_put; at = at + 1;
  skip
}

/* Strike Data off the wire, 30 bytes from where the cursor stands */
inline decode_strike_data(strike_data_record) {
  strike_data_at = 0;
  do
  :: strike_data_at < 4 -> strike_data_record.strike_sequence_number[strike_data_at] = wire[at]; at = at + 1; strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  strike_data_at = 0;
  do
  :: strike_data_at < 4 -> strike_data_record.contract_date_sequence[strike_data_at] = wire[at]; at = at + 1; strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  strike_data_at = 0;
  do
  :: strike_data_at < 8 -> strike_data_record.strike[strike_data_at] = wire[at]; at = at + 1; strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  decode_strike_expiry_date(strike_data_record.strike_expiry_date);
  strike_data_record.deltas = wire[at]; at = at + 1;
  strike_data_record.call_or_put = wire[at]; at = at + 1;
  skip
}

/* what was read of Strike Data is what was written, byte for byte */
inline equal_strike_data(strike_data_read, strike_data_written) {
  strike_data_at = 0;
  do
  :: strike_data_at < 4 -> assert(strike_data_read.strike_sequence_number[strike_data_at] == strike_data_written.strike_sequence_number[strike_data_at]); strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  strike_data_at = 0;
  do
  :: strike_data_at < 4 -> assert(strike_data_read.contract_date_sequence[strike_data_at] == strike_data_written.contract_date_sequence[strike_data_at]); strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  strike_data_at = 0;
  do
  :: strike_data_at < 8 -> assert(strike_data_read.strike[strike_data_at] == strike_data_written.strike[strike_data_at]); strike_data_at = strike_data_at + 1
  :: else -> break
  od;
  equal_strike_expiry_date(strike_data_read.strike_expiry_date, strike_data_written.strike_expiry_date);
  assert(strike_data_read.deltas == strike_data_written.deltas);
  assert(strike_data_read.call_or_put == strike_data_written.call_or_put);
  skip
}

/* ---- Member Code P 5: 5 bytes ------------------------------------------------ */

/* Member code for this member. */
typedef MemberCodeP5 {
  byte member_code_p_5_length_byte;
  byte member_code_p_5_characters[4]
};

int member_code_p5_at;

/* every byte of Member Code P 5 set to one value */
inline fill_member_code_p5(member_code_p5_record, member_code_p5_value) {
  member_code_p5_record.member_code_p_5_length_byte = member_code_p5_value;
  member_code_p5_at = 0;
  do
  :: member_code_p5_at < 4 -> member_code_p5_record.member_code_p_5_characters[member_code_p5_at] = member_code_p5_value; member_code_p5_at = member_code_p5_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Member Code P 5 set to where it lies, so a field read out of place says so */
inline ramp_member_code_p5(member_code_p5_record, member_code_p5_base) {
  member_code_p5_record.member_code_p_5_length_byte = (member_code_p5_base + 0 + 1) % 256;
  member_code_p5_at = 0;
  do
  :: member_code_p5_at < 4 -> member_code_p5_record.member_code_p_5_characters[member_code_p5_at] = (member_code_p5_base + 1 + member_code_p5_at + 1) % 256; member_code_p5_at = member_code_p5_at + 1
  :: else -> break
  od;
  skip
}

/* Member Code P 5 to the wire, 5 bytes from where the cursor stands */
inline encode_member_code_p5(member_code_p5_record) {
  wire[at] = member_code_p5_record.member_code_p_5_length_byte; at = at + 1;
  member_code_p5_at = 0;
  do
  :: member_code_p5_at < 4 -> wire[at] = member_code_p5_record.member_code_p_5_characters[member_code_p5_at]; at = at + 1; member_code_p5_at = member_code_p5_at + 1
  :: else -> break
  od;
  skip
}

/* Member Code P 5 off the wire, 5 bytes from where the cursor stands */
inline decode_member_code_p5(member_code_p5_record) {
  member_code_p5_record.member_code_p_5_length_byte = wire[at]; at = at + 1;
  member_code_p5_at = 0;
  do
  :: member_code_p5_at < 4 -> member_code_p5_record.member_code_p_5_characters[member_code_p5_at] = wire[at]; at = at + 1; member_code_p5_at = member_code_p5_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Member Code P 5 is what was written, byte for byte */
inline equal_member_code_p5(member_code_p5_read, member_code_p5_written) {
  assert(member_code_p5_read.member_code_p_5_length_byte == member_code_p5_written.member_code_p_5_length_byte);
  member_code_p5_at = 0;
  do
  :: member_code_p5_at < 4 -> assert(member_code_p5_read.member_code_p_5_characters[member_code_p5_at] == member_code_p5_written.member_code_p_5_characters[member_code_p5_at]); member_code_p5_at = member_code_p5_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Description P 50: 50 bytes ---------------------------------------------- */

/* Name or Description of this member. */
typedef DescriptionP50 {
  byte description_p_50_length_byte;
  byte description_p_50_characters[49]
};

int description_p50_at;

/* every byte of Description P 50 set to one value */
inline fill_description_p50(description_p50_record, description_p50_value) {
  description_p50_record.description_p_50_length_byte = description_p50_value;
  description_p50_at = 0;
  do
  :: description_p50_at < 49 -> description_p50_record.description_p_50_characters[description_p50_at] = description_p50_value; description_p50_at = description_p50_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Description P 50 set to where it lies, so a field read out of place says so */
inline ramp_description_p50(description_p50_record, description_p50_base) {
  description_p50_record.description_p_50_length_byte = (description_p50_base + 0 + 1) % 256;
  description_p50_at = 0;
  do
  :: description_p50_at < 49 -> description_p50_record.description_p_50_characters[description_p50_at] = (description_p50_base + 1 + description_p50_at + 1) % 256; description_p50_at = description_p50_at + 1
  :: else -> break
  od;
  skip
}

/* Description P 50 to the wire, 50 bytes from where the cursor stands */
inline encode_description_p50(description_p50_record) {
  wire[at] = description_p50_record.description_p_50_length_byte; at = at + 1;
  description_p50_at = 0;
  do
  :: description_p50_at < 49 -> wire[at] = description_p50_record.description_p_50_characters[description_p50_at]; at = at + 1; description_p50_at = description_p50_at + 1
  :: else -> break
  od;
  skip
}

/* Description P 50 off the wire, 50 bytes from where the cursor stands */
inline decode_description_p50(description_p50_record) {
  description_p50_record.description_p_50_length_byte = wire[at]; at = at + 1;
  description_p50_at = 0;
  do
  :: description_p50_at < 49 -> description_p50_record.description_p_50_characters[description_p50_at] = wire[at]; at = at + 1; description_p50_at = description_p50_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Description P 50 is what was written, byte for byte */
inline equal_description_p50(description_p50_read, description_p50_written) {
  assert(description_p50_read.description_p_50_length_byte == description_p50_written.description_p_50_length_byte);
  description_p50_at = 0;
  do
  :: description_p50_at < 49 -> assert(description_p50_read.description_p_50_characters[description_p50_at] == description_p50_written.description_p_50_characters[description_p50_at]); description_p50_at = description_p50_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sor Account: 17 bytes --------------------------------------------------- */

/* SOR Account Number for the Member. */
typedef SorAccount {
  byte sor_account_length_byte;
  byte sor_account_characters[16]
};

int sor_account_at;

/* every byte of Sor Account set to one value */
inline fill_sor_account(sor_account_record, sor_account_value) {
  sor_account_record.sor_account_length_byte = sor_account_value;
  sor_account_at = 0;
  do
  :: sor_account_at < 16 -> sor_account_record.sor_account_characters[sor_account_at] = sor_account_value; sor_account_at = sor_account_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sor Account set to where it lies, so a field read out of place says so */
inline ramp_sor_account(sor_account_record, sor_account_base) {
  sor_account_record.sor_account_length_byte = (sor_account_base + 0 + 1) % 256;
  sor_account_at = 0;
  do
  :: sor_account_at < 16 -> sor_account_record.sor_account_characters[sor_account_at] = (sor_account_base + 1 + sor_account_at + 1) % 256; sor_account_at = sor_account_at + 1
  :: else -> break
  od;
  skip
}

/* Sor Account to the wire, 17 bytes from where the cursor stands */
inline encode_sor_account(sor_account_record) {
  wire[at] = sor_account_record.sor_account_length_byte; at = at + 1;
  sor_account_at = 0;
  do
  :: sor_account_at < 16 -> wire[at] = sor_account_record.sor_account_characters[sor_account_at]; at = at + 1; sor_account_at = sor_account_at + 1
  :: else -> break
  od;
  skip
}

/* Sor Account off the wire, 17 bytes from where the cursor stands */
inline decode_sor_account(sor_account_record) {
  sor_account_record.sor_account_length_byte = wire[at]; at = at + 1;
  sor_account_at = 0;
  do
  :: sor_account_at < 16 -> sor_account_record.sor_account_characters[sor_account_at] = wire[at]; at = at + 1; sor_account_at = sor_account_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sor Account is what was written, byte for byte */
inline equal_sor_account(sor_account_read, sor_account_written) {
  assert(sor_account_read.sor_account_length_byte == sor_account_written.sor_account_length_byte);
  sor_account_at = 0;
  do
  :: sor_account_at < 16 -> assert(sor_account_read.sor_account_characters[sor_account_at] == sor_account_written.sor_account_characters[sor_account_at]); sor_account_at = sor_account_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Member Data: 96 bytes --------------------------------------------------- */

/* Member Data */
typedef MemberData {
  byte member_sequence[4];
  byte master_member_sequence[4];
  byte clearing_member_sequence[4];
  MemberCodeP5 member_code_p_5;
  DescriptionP50 description_p_50;
  byte unused_4[4];
  SorAccount sor_account;
  byte unused_8[8]
};

int member_data_at;

/* every byte of Member Data set to one value */
inline fill_member_data(member_data_record, member_data_value) {
  member_data_at = 0;
  do
  :: member_data_at < 4 -> member_data_record.member_sequence[member_data_at] = member_data_value; member_data_at = member_data_at + 1
  :: else -> break
  od;
  member_data_at = 0;
  do
  :: member_data_at < 4 -> member_data_record.master_member_sequence[member_data_at] = member_data_value; member_data_at = member_data_at + 1
  :: else -> break
  od;
  member_data_at = 0;
  do
  :: member_data_at < 4 -> member_data_record.clearing_member_sequence[member_data_at] = member_data_value; member_data_at = member_data_at + 1
  :: else -> break
  od;
  fill_member_code_p5(member_data_record.member_code_p_5, member_data_value);
  fill_description_p50(member_data_record.description_p_50, member_data_value);
  member_data_at = 0;
  do
  :: member_data_at < 4 -> member_data_record.unused_4[member_data_at] = member_data_value; member_data_at = member_data_at + 1
  :: else -> break
  od;
  fill_sor_account(member_data_record.sor_account, member_data_value);
  member_data_at = 0;
  do
  :: member_data_at < 8 -> member_data_record.unused_8[member_data_at] = member_data_value; member_data_at = member_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Member Data set to where it lies, so a field read out of place says so */
inline ramp_member_data(member_data_record, member_data_base) {
  member_data_at = 0;
  do
  :: member_data_at < 4 -> member_data_record.member_sequence[member_data_at] = (member_data_base + 0 + member_data_at + 1) % 256; member_data_at = member_data_at + 1
  :: else -> break
  od;
  member_data_at = 0;
  do
  :: member_data_at < 4 -> member_data_record.master_member_sequence[member_data_at] = (member_data_base + 4 + member_data_at + 1) % 256; member_data_at = member_data_at + 1
  :: else -> break
  od;
  member_data_at = 0;
  do
  :: member_data_at < 4 -> member_data_record.clearing_member_sequence[member_data_at] = (member_data_base + 8 + member_data_at + 1) % 256; member_data_at = member_data_at + 1
  :: else -> break
  od;
  ramp_member_code_p5(member_data_record.member_code_p_5, member_data_base + 12);
  ramp_description_p50(member_data_record.description_p_50, member_data_base + 17);
  member_data_at = 0;
  do
  :: member_data_at < 4 -> member_data_record.unused_4[member_data_at] = (member_data_base + 67 + member_data_at + 1) % 256; member_data_at = member_data_at + 1
  :: else -> break
  od;
  ramp_sor_account(member_data_record.sor_account, member_data_base + 71);
  member_data_at = 0;
  do
  :: member_data_at < 8 -> member_data_record.unused_8[member_data_at] = (member_data_base + 88 + member_data_at + 1) % 256; member_data_at = member_data_at + 1
  :: else -> break
  od;
  skip
}

/* Member Data to the wire, 96 bytes from where the cursor stands */
inline encode_member_data(member_data_record) {
  member_data_at = 0;
  do
  :: member_data_at < 4 -> wire[at] = member_data_record.member_sequence[member_data_at]; at = at + 1; member_data_at = member_data_at + 1
  :: else -> break
  od;
  member_data_at = 0;
  do
  :: member_data_at < 4 -> wire[at] = member_data_record.master_member_sequence[member_data_at]; at = at + 1; member_data_at = member_data_at + 1
  :: else -> break
  od;
  member_data_at = 0;
  do
  :: member_data_at < 4 -> wire[at] = member_data_record.clearing_member_sequence[member_data_at]; at = at + 1; member_data_at = member_data_at + 1
  :: else -> break
  od;
  encode_member_code_p5(member_data_record.member_code_p_5);
  encode_description_p50(member_data_record.description_p_50);
  member_data_at = 0;
  do
  :: member_data_at < 4 -> wire[at] = member_data_record.unused_4[member_data_at]; at = at + 1; member_data_at = member_data_at + 1
  :: else -> break
  od;
  encode_sor_account(member_data_record.sor_account);
  member_data_at = 0;
  do
  :: member_data_at < 8 -> wire[at] = member_data_record.unused_8[member_data_at]; at = at + 1; member_data_at = member_data_at + 1
  :: else -> break
  od;
  skip
}

/* Member Data off the wire, 96 bytes from where the cursor stands */
inline decode_member_data(member_data_record) {
  member_data_at = 0;
  do
  :: member_data_at < 4 -> member_data_record.member_sequence[member_data_at] = wire[at]; at = at + 1; member_data_at = member_data_at + 1
  :: else -> break
  od;
  member_data_at = 0;
  do
  :: member_data_at < 4 -> member_data_record.master_member_sequence[member_data_at] = wire[at]; at = at + 1; member_data_at = member_data_at + 1
  :: else -> break
  od;
  member_data_at = 0;
  do
  :: member_data_at < 4 -> member_data_record.clearing_member_sequence[member_data_at] = wire[at]; at = at + 1; member_data_at = member_data_at + 1
  :: else -> break
  od;
  decode_member_code_p5(member_data_record.member_code_p_5);
  decode_description_p50(member_data_record.description_p_50);
  member_data_at = 0;
  do
  :: member_data_at < 4 -> member_data_record.unused_4[member_data_at] = wire[at]; at = at + 1; member_data_at = member_data_at + 1
  :: else -> break
  od;
  decode_sor_account(member_data_record.sor_account);
  member_data_at = 0;
  do
  :: member_data_at < 8 -> member_data_record.unused_8[member_data_at] = wire[at]; at = at + 1; member_data_at = member_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Member Data is what was written, byte for byte */
inline equal_member_data(member_data_read, member_data_written) {
  member_data_at = 0;
  do
  :: member_data_at < 4 -> assert(member_data_read.member_sequence[member_data_at] == member_data_written.member_sequence[member_data_at]); member_data_at = member_data_at + 1
  :: else -> break
  od;
  member_data_at = 0;
  do
  :: member_data_at < 4 -> assert(member_data_read.master_member_sequence[member_data_at] == member_data_written.master_member_sequence[member_data_at]); member_data_at = member_data_at + 1
  :: else -> break
  od;
  member_data_at = 0;
  do
  :: member_data_at < 4 -> assert(member_data_read.clearing_member_sequence[member_data_at] == member_data_written.clearing_member_sequence[member_data_at]); member_data_at = member_data_at + 1
  :: else -> break
  od;
  equal_member_code_p5(member_data_read.member_code_p_5, member_data_written.member_code_p_5);
  equal_description_p50(member_data_read.description_p_50, member_data_written.description_p_50);
  member_data_at = 0;
  do
  :: member_data_at < 4 -> assert(member_data_read.unused_4[member_data_at] == member_data_written.unused_4[member_data_at]); member_data_at = member_data_at + 1
  :: else -> break
  od;
  equal_sor_account(member_data_read.sor_account, member_data_written.sor_account);
  member_data_at = 0;
  do
  :: member_data_at < 8 -> assert(member_data_read.unused_8[member_data_at] == member_data_written.unused_8[member_data_at]); member_data_at = member_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mtm Data: 160 bytes ----------------------------------------------------- */

/* MTM Data */
typedef MtmData {
  byte instrument_sequence[4];
  byte date_sequence[4];
  byte strike_sequence[4];
  Contract contract;
  byte days_closing_price[8];
  byte days_closing_rate[8];
  byte open_interest[8];
  Date date;
  byte spot_price[8];
  byte volatility[8];
  byte high_price[8];
  byte low_price[8];
  byte days_volume_d_8[8];
  byte shares_in_issue[8];
  byte open_price[8];
  byte previous_close_price[8]
};

int mtm_data_at;

/* every byte of Mtm Data set to one value */
inline fill_mtm_data(mtm_data_record, mtm_data_value) {
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> mtm_data_record.instrument_sequence[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> mtm_data_record.date_sequence[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> mtm_data_record.strike_sequence[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  fill_contract(mtm_data_record.contract, mtm_data_value);
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.days_closing_price[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.days_closing_rate[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.open_interest[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  fill_date(mtm_data_record.date, mtm_data_value);
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.spot_price[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.volatility[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.high_price[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.low_price[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.days_volume_d_8[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.shares_in_issue[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.open_price[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.previous_close_price[mtm_data_at] = mtm_data_value; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mtm Data set to where it lies, so a field read out of place says so */
inline ramp_mtm_data(mtm_data_record, mtm_data_base) {
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> mtm_data_record.instrument_sequence[mtm_data_at] = (mtm_data_base + 0 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> mtm_data_record.date_sequence[mtm_data_at] = (mtm_data_base + 4 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> mtm_data_record.strike_sequence[mtm_data_at] = (mtm_data_base + 8 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  ramp_contract(mtm_data_record.contract, mtm_data_base + 12);
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.days_closing_price[mtm_data_at] = (mtm_data_base + 60 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.days_closing_rate[mtm_data_at] = (mtm_data_base + 68 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.open_interest[mtm_data_at] = (mtm_data_base + 76 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  ramp_date(mtm_data_record.date, mtm_data_base + 84);
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.spot_price[mtm_data_at] = (mtm_data_base + 96 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.volatility[mtm_data_at] = (mtm_data_base + 104 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.high_price[mtm_data_at] = (mtm_data_base + 112 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.low_price[mtm_data_at] = (mtm_data_base + 120 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.days_volume_d_8[mtm_data_at] = (mtm_data_base + 128 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.shares_in_issue[mtm_data_at] = (mtm_data_base + 136 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.open_price[mtm_data_at] = (mtm_data_base + 144 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.previous_close_price[mtm_data_at] = (mtm_data_base + 152 + mtm_data_at + 1) % 256; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  skip
}

/* Mtm Data to the wire, 160 bytes from where the cursor stands */
inline encode_mtm_data(mtm_data_record) {
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> wire[at] = mtm_data_record.instrument_sequence[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> wire[at] = mtm_data_record.date_sequence[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> wire[at] = mtm_data_record.strike_sequence[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  encode_contract(mtm_data_record.contract);
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> wire[at] = mtm_data_record.days_closing_price[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> wire[at] = mtm_data_record.days_closing_rate[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> wire[at] = mtm_data_record.open_interest[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  encode_date(mtm_data_record.date);
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> wire[at] = mtm_data_record.spot_price[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> wire[at] = mtm_data_record.volatility[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> wire[at] = mtm_data_record.high_price[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> wire[at] = mtm_data_record.low_price[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> wire[at] = mtm_data_record.days_volume_d_8[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> wire[at] = mtm_data_record.shares_in_issue[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> wire[at] = mtm_data_record.open_price[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> wire[at] = mtm_data_record.previous_close_price[mtm_data_at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  skip
}

/* Mtm Data off the wire, 160 bytes from where the cursor stands */
inline decode_mtm_data(mtm_data_record) {
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> mtm_data_record.instrument_sequence[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> mtm_data_record.date_sequence[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> mtm_data_record.strike_sequence[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  decode_contract(mtm_data_record.contract);
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.days_closing_price[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.days_closing_rate[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.open_interest[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  decode_date(mtm_data_record.date);
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.spot_price[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.volatility[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.high_price[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.low_price[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.days_volume_d_8[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.shares_in_issue[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.open_price[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> mtm_data_record.previous_close_price[mtm_data_at] = wire[at]; at = at + 1; mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mtm Data is what was written, byte for byte */
inline equal_mtm_data(mtm_data_read, mtm_data_written) {
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> assert(mtm_data_read.instrument_sequence[mtm_data_at] == mtm_data_written.instrument_sequence[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> assert(mtm_data_read.date_sequence[mtm_data_at] == mtm_data_written.date_sequence[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 4 -> assert(mtm_data_read.strike_sequence[mtm_data_at] == mtm_data_written.strike_sequence[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  equal_contract(mtm_data_read.contract, mtm_data_written.contract);
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> assert(mtm_data_read.days_closing_price[mtm_data_at] == mtm_data_written.days_closing_price[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> assert(mtm_data_read.days_closing_rate[mtm_data_at] == mtm_data_written.days_closing_rate[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> assert(mtm_data_read.open_interest[mtm_data_at] == mtm_data_written.open_interest[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  equal_date(mtm_data_read.date, mtm_data_written.date);
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> assert(mtm_data_read.spot_price[mtm_data_at] == mtm_data_written.spot_price[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> assert(mtm_data_read.volatility[mtm_data_at] == mtm_data_written.volatility[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> assert(mtm_data_read.high_price[mtm_data_at] == mtm_data_written.high_price[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> assert(mtm_data_read.low_price[mtm_data_at] == mtm_data_written.low_price[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> assert(mtm_data_read.days_volume_d_8[mtm_data_at] == mtm_data_written.days_volume_d_8[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> assert(mtm_data_read.shares_in_issue[mtm_data_at] == mtm_data_written.shares_in_issue[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> assert(mtm_data_read.open_price[mtm_data_at] == mtm_data_written.open_price[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  mtm_data_at = 0;
  do
  :: mtm_data_at < 8 -> assert(mtm_data_read.previous_close_price[mtm_data_at] == mtm_data_written.previous_close_price[mtm_data_at]); mtm_data_at = mtm_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Holiday Date: 12 bytes -------------------------------------------------- */

/* Holiday Date */
typedef HolidayDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int holiday_date_at;

/* every byte of Holiday Date set to one value */
inline fill_holiday_date(holiday_date_record, holiday_date_value) {
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> holiday_date_record.year[holiday_date_at] = holiday_date_value; holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> holiday_date_record.month[holiday_date_at] = holiday_date_value; holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> holiday_date_record.day[holiday_date_at] = holiday_date_value; holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Holiday Date set to where it lies, so a field read out of place says so */
inline ramp_holiday_date(holiday_date_record, holiday_date_base) {
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> holiday_date_record.year[holiday_date_at] = (holiday_date_base + 0 + holiday_date_at + 1) % 256; holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> holiday_date_record.month[holiday_date_at] = (holiday_date_base + 4 + holiday_date_at + 1) % 256; holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> holiday_date_record.day[holiday_date_at] = (holiday_date_base + 8 + holiday_date_at + 1) % 256; holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  skip
}

/* Holiday Date to the wire, 12 bytes from where the cursor stands */
inline encode_holiday_date(holiday_date_record) {
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> wire[at] = holiday_date_record.year[holiday_date_at]; at = at + 1; holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> wire[at] = holiday_date_record.month[holiday_date_at]; at = at + 1; holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> wire[at] = holiday_date_record.day[holiday_date_at]; at = at + 1; holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  skip
}

/* Holiday Date off the wire, 12 bytes from where the cursor stands */
inline decode_holiday_date(holiday_date_record) {
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> holiday_date_record.year[holiday_date_at] = wire[at]; at = at + 1; holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> holiday_date_record.month[holiday_date_at] = wire[at]; at = at + 1; holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> holiday_date_record.day[holiday_date_at] = wire[at]; at = at + 1; holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Holiday Date is what was written, byte for byte */
inline equal_holiday_date(holiday_date_read, holiday_date_written) {
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> assert(holiday_date_read.year[holiday_date_at] == holiday_date_written.year[holiday_date_at]); holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> assert(holiday_date_read.month[holiday_date_at] == holiday_date_written.month[holiday_date_at]); holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  holiday_date_at = 0;
  do
  :: holiday_date_at < 4 -> assert(holiday_date_read.day[holiday_date_at] == holiday_date_written.day[holiday_date_at]); holiday_date_at = holiday_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Holiday Data: 23 bytes -------------------------------------------------- */

/* Holiday Data */
typedef HolidayData {
  byte holiday_sequence[4];
  CountryCode country_code;
  HolidayDate holiday_date;
  byte reminder_only;
  byte is_early_close;
  byte is_futures_close_out
};

int holiday_data_at;

/* every byte of Holiday Data set to one value */
inline fill_holiday_data(holiday_data_record, holiday_data_value) {
  holiday_data_at = 0;
  do
  :: holiday_data_at < 4 -> holiday_data_record.holiday_sequence[holiday_data_at] = holiday_data_value; holiday_data_at = holiday_data_at + 1
  :: else -> break
  od;
  fill_country_code(holiday_data_record.country_code, holiday_data_value);
  fill_holiday_date(holiday_data_record.holiday_date, holiday_data_value);
  holiday_data_record.reminder_only = holiday_data_value;
  holiday_data_record.is_early_close = holiday_data_value;
  holiday_data_record.is_futures_close_out = holiday_data_value;
  skip
}

/* each byte of Holiday Data set to where it lies, so a field read out of place says so */
inline ramp_holiday_data(holiday_data_record, holiday_data_base) {
  holiday_data_at = 0;
  do
  :: holiday_data_at < 4 -> holiday_data_record.holiday_sequence[holiday_data_at] = (holiday_data_base + 0 + holiday_data_at + 1) % 256; holiday_data_at = holiday_data_at + 1
  :: else -> break
  od;
  ramp_country_code(holiday_data_record.country_code, holiday_data_base + 4);
  ramp_holiday_date(holiday_data_record.holiday_date, holiday_data_base + 8);
  holiday_data_record.reminder_only = (holiday_data_base + 20 + 1) % 256;
  holiday_data_record.is_early_close = (holiday_data_base + 21 + 1) % 256;
  holiday_data_record.is_futures_close_out = (holiday_data_base + 22 + 1) % 256;
  skip
}

/* Holiday Data to the wire, 23 bytes from where the cursor stands */
inline encode_holiday_data(holiday_data_record) {
  holiday_data_at = 0;
  do
  :: holiday_data_at < 4 -> wire[at] = holiday_data_record.holiday_sequence[holiday_data_at]; at = at + 1; holiday_data_at = holiday_data_at + 1
  :: else -> break
  od;
  encode_country_code(holiday_data_record.country_code);
  encode_holiday_date(holiday_data_record.holiday_date);
  wire[at] = holiday_data_record.reminder_only; at = at + 1;
  wire[at] = holiday_data_record.is_early_close; at = at + 1;
  wire[at] = holiday_data_record.is_futures_close_out; at = at + 1;
  skip
}

/* Holiday Data off the wire, 23 bytes from where the cursor stands */
inline decode_holiday_data(holiday_data_record) {
  holiday_data_at = 0;
  do
  :: holiday_data_at < 4 -> holiday_data_record.holiday_sequence[holiday_data_at] = wire[at]; at = at + 1; holiday_data_at = holiday_data_at + 1
  :: else -> break
  od;
  decode_country_code(holiday_data_record.country_code);
  decode_holiday_date(holiday_data_record.holiday_date);
  holiday_data_record.reminder_only = wire[at]; at = at + 1;
  holiday_data_record.is_early_close = wire[at]; at = at + 1;
  holiday_data_record.is_futures_close_out = wire[at]; at = at + 1;
  skip
}

/* what was read of Holiday Data is what was written, byte for byte */
inline equal_holiday_data(holiday_data_read, holiday_data_written) {
  holiday_data_at = 0;
  do
  :: holiday_data_at < 4 -> assert(holiday_data_read.holiday_sequence[holiday_data_at] == holiday_data_written.holiday_sequence[holiday_data_at]); holiday_data_at = holiday_data_at + 1
  :: else -> break
  od;
  equal_country_code(holiday_data_read.country_code, holiday_data_written.country_code);
  equal_holiday_date(holiday_data_read.holiday_date, holiday_data_written.holiday_date);
  assert(holiday_data_read.reminder_only == holiday_data_written.reminder_only);
  assert(holiday_data_read.is_early_close == holiday_data_written.is_early_close);
  assert(holiday_data_read.is_futures_close_out == holiday_data_written.is_futures_close_out);
  skip
}

/* ---- Instrument Type Code: 10 bytes ------------------------------------------ */

/* Indicates the instrument type code. */
typedef InstrumentTypeCode {
  byte instrument_type_code_length_byte;
  byte instrument_type_code_characters[9]
};

int instrument_type_code_at;

/* every byte of Instrument Type Code set to one value */
inline fill_instrument_type_code(instrument_type_code_record, instrument_type_code_value) {
  instrument_type_code_record.instrument_type_code_length_byte = instrument_type_code_value;
  instrument_type_code_at = 0;
  do
  :: instrument_type_code_at < 9 -> instrument_type_code_record.instrument_type_code_characters[instrument_type_code_at] = instrument_type_code_value; instrument_type_code_at = instrument_type_code_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Type Code set to where it lies, so a field read out of place says so */
inline ramp_instrument_type_code(instrument_type_code_record, instrument_type_code_base) {
  instrument_type_code_record.instrument_type_code_length_byte = (instrument_type_code_base + 0 + 1) % 256;
  instrument_type_code_at = 0;
  do
  :: instrument_type_code_at < 9 -> instrument_type_code_record.instrument_type_code_characters[instrument_type_code_at] = (instrument_type_code_base + 1 + instrument_type_code_at + 1) % 256; instrument_type_code_at = instrument_type_code_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Type Code to the wire, 10 bytes from where the cursor stands */
inline encode_instrument_type_code(instrument_type_code_record) {
  wire[at] = instrument_type_code_record.instrument_type_code_length_byte; at = at + 1;
  instrument_type_code_at = 0;
  do
  :: instrument_type_code_at < 9 -> wire[at] = instrument_type_code_record.instrument_type_code_characters[instrument_type_code_at]; at = at + 1; instrument_type_code_at = instrument_type_code_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Type Code off the wire, 10 bytes from where the cursor stands */
inline decode_instrument_type_code(instrument_type_code_record) {
  instrument_type_code_record.instrument_type_code_length_byte = wire[at]; at = at + 1;
  instrument_type_code_at = 0;
  do
  :: instrument_type_code_at < 9 -> instrument_type_code_record.instrument_type_code_characters[instrument_type_code_at] = wire[at]; at = at + 1; instrument_type_code_at = instrument_type_code_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Type Code is what was written, byte for byte */
inline equal_instrument_type_code(instrument_type_code_read, instrument_type_code_written) {
  assert(instrument_type_code_read.instrument_type_code_length_byte == instrument_type_code_written.instrument_type_code_length_byte);
  instrument_type_code_at = 0;
  do
  :: instrument_type_code_at < 9 -> assert(instrument_type_code_read.instrument_type_code_characters[instrument_type_code_at] == instrument_type_code_written.instrument_type_code_characters[instrument_type_code_at]); instrument_type_code_at = instrument_type_code_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Type Name: 25 bytes ------------------------------------------ */

/* A description of the instrument type. */
typedef InstrumentTypeName {
  byte instrument_type_name_length_byte;
  byte instrument_type_name_characters[24]
};

int instrument_type_name_at;

/* every byte of Instrument Type Name set to one value */
inline fill_instrument_type_name(instrument_type_name_record, instrument_type_name_value) {
  instrument_type_name_record.instrument_type_name_length_byte = instrument_type_name_value;
  instrument_type_name_at = 0;
  do
  :: instrument_type_name_at < 24 -> instrument_type_name_record.instrument_type_name_characters[instrument_type_name_at] = instrument_type_name_value; instrument_type_name_at = instrument_type_name_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Type Name set to where it lies, so a field read out of place says so */
inline ramp_instrument_type_name(instrument_type_name_record, instrument_type_name_base) {
  instrument_type_name_record.instrument_type_name_length_byte = (instrument_type_name_base + 0 + 1) % 256;
  instrument_type_name_at = 0;
  do
  :: instrument_type_name_at < 24 -> instrument_type_name_record.instrument_type_name_characters[instrument_type_name_at] = (instrument_type_name_base + 1 + instrument_type_name_at + 1) % 256; instrument_type_name_at = instrument_type_name_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Type Name to the wire, 25 bytes from where the cursor stands */
inline encode_instrument_type_name(instrument_type_name_record) {
  wire[at] = instrument_type_name_record.instrument_type_name_length_byte; at = at + 1;
  instrument_type_name_at = 0;
  do
  :: instrument_type_name_at < 24 -> wire[at] = instrument_type_name_record.instrument_type_name_characters[instrument_type_name_at]; at = at + 1; instrument_type_name_at = instrument_type_name_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Type Name off the wire, 25 bytes from where the cursor stands */
inline decode_instrument_type_name(instrument_type_name_record) {
  instrument_type_name_record.instrument_type_name_length_byte = wire[at]; at = at + 1;
  instrument_type_name_at = 0;
  do
  :: instrument_type_name_at < 24 -> instrument_type_name_record.instrument_type_name_characters[instrument_type_name_at] = wire[at]; at = at + 1; instrument_type_name_at = instrument_type_name_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Type Name is what was written, byte for byte */
inline equal_instrument_type_name(instrument_type_name_read, instrument_type_name_written) {
  assert(instrument_type_name_read.instrument_type_name_length_byte == instrument_type_name_written.instrument_type_name_length_byte);
  instrument_type_name_at = 0;
  do
  :: instrument_type_name_at < 24 -> assert(instrument_type_name_read.instrument_type_name_characters[instrument_type_name_at] == instrument_type_name_written.instrument_type_name_characters[instrument_type_name_at]); instrument_type_name_at = instrument_type_name_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Types: 48 bytes ---------------------------------------------- */

/* Instrument Types */
typedef InstrumentTypes {
  byte instrument_type_sequence[4];
  byte unused_4[4];
  byte instrument_type_number_i_4[4];
  byte identifier_prefix_c_1;
  InstrumentTypeCode instrument_type_code;
  InstrumentTypeName instrument_type_name
};

int instrument_types_at;

/* every byte of Instrument Types set to one value */
inline fill_instrument_types(instrument_types_record, instrument_types_value) {
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> instrument_types_record.instrument_type_sequence[instrument_types_at] = instrument_types_value; instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> instrument_types_record.unused_4[instrument_types_at] = instrument_types_value; instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> instrument_types_record.instrument_type_number_i_4[instrument_types_at] = instrument_types_value; instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  instrument_types_record.identifier_prefix_c_1 = instrument_types_value;
  fill_instrument_type_code(instrument_types_record.instrument_type_code, instrument_types_value);
  fill_instrument_type_name(instrument_types_record.instrument_type_name, instrument_types_value);
  skip
}

/* each byte of Instrument Types set to where it lies, so a field read out of place says so */
inline ramp_instrument_types(instrument_types_record, instrument_types_base) {
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> instrument_types_record.instrument_type_sequence[instrument_types_at] = (instrument_types_base + 0 + instrument_types_at + 1) % 256; instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> instrument_types_record.unused_4[instrument_types_at] = (instrument_types_base + 4 + instrument_types_at + 1) % 256; instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> instrument_types_record.instrument_type_number_i_4[instrument_types_at] = (instrument_types_base + 8 + instrument_types_at + 1) % 256; instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  instrument_types_record.identifier_prefix_c_1 = (instrument_types_base + 12 + 1) % 256;
  ramp_instrument_type_code(instrument_types_record.instrument_type_code, instrument_types_base + 13);
  ramp_instrument_type_name(instrument_types_record.instrument_type_name, instrument_types_base + 23);
  skip
}

/* Instrument Types to the wire, 48 bytes from where the cursor stands */
inline encode_instrument_types(instrument_types_record) {
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> wire[at] = instrument_types_record.instrument_type_sequence[instrument_types_at]; at = at + 1; instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> wire[at] = instrument_types_record.unused_4[instrument_types_at]; at = at + 1; instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> wire[at] = instrument_types_record.instrument_type_number_i_4[instrument_types_at]; at = at + 1; instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  wire[at] = instrument_types_record.identifier_prefix_c_1; at = at + 1;
  encode_instrument_type_code(instrument_types_record.instrument_type_code);
  encode_instrument_type_name(instrument_types_record.instrument_type_name);
  skip
}

/* Instrument Types off the wire, 48 bytes from where the cursor stands */
inline decode_instrument_types(instrument_types_record) {
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> instrument_types_record.instrument_type_sequence[instrument_types_at] = wire[at]; at = at + 1; instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> instrument_types_record.unused_4[instrument_types_at] = wire[at]; at = at + 1; instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> instrument_types_record.instrument_type_number_i_4[instrument_types_at] = wire[at]; at = at + 1; instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  instrument_types_record.identifier_prefix_c_1 = wire[at]; at = at + 1;
  decode_instrument_type_code(instrument_types_record.instrument_type_code);
  decode_instrument_type_name(instrument_types_record.instrument_type_name);
  skip
}

/* what was read of Instrument Types is what was written, byte for byte */
inline equal_instrument_types(instrument_types_read, instrument_types_written) {
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> assert(instrument_types_read.instrument_type_sequence[instrument_types_at] == instrument_types_written.instrument_type_sequence[instrument_types_at]); instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> assert(instrument_types_read.unused_4[instrument_types_at] == instrument_types_written.unused_4[instrument_types_at]); instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  instrument_types_at = 0;
  do
  :: instrument_types_at < 4 -> assert(instrument_types_read.instrument_type_number_i_4[instrument_types_at] == instrument_types_written.instrument_type_number_i_4[instrument_types_at]); instrument_types_at = instrument_types_at + 1
  :: else -> break
  od;
  assert(instrument_types_read.identifier_prefix_c_1 == instrument_types_written.identifier_prefix_c_1);
  equal_instrument_type_code(instrument_types_read.instrument_type_code, instrument_types_written.instrument_type_code);
  equal_instrument_type_name(instrument_types_read.instrument_type_name, instrument_types_written.instrument_type_name);
  skip
}

/* ---- Clearing Member Code: 6 bytes ------------------------------------------- */

/* This is the code used for the clearing member. */
typedef ClearingMemberCode {
  byte clearing_member_code_length_byte;
  byte clearing_member_code_characters[5]
};

int clearing_member_code_at;

/* every byte of Clearing Member Code set to one value */
inline fill_clearing_member_code(clearing_member_code_record, clearing_member_code_value) {
  clearing_member_code_record.clearing_member_code_length_byte = clearing_member_code_value;
  clearing_member_code_at = 0;
  do
  :: clearing_member_code_at < 5 -> clearing_member_code_record.clearing_member_code_characters[clearing_member_code_at] = clearing_member_code_value; clearing_member_code_at = clearing_member_code_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Clearing Member Code set to where it lies, so a field read out of place says so */
inline ramp_clearing_member_code(clearing_member_code_record, clearing_member_code_base) {
  clearing_member_code_record.clearing_member_code_length_byte = (clearing_member_code_base + 0 + 1) % 256;
  clearing_member_code_at = 0;
  do
  :: clearing_member_code_at < 5 -> clearing_member_code_record.clearing_member_code_characters[clearing_member_code_at] = (clearing_member_code_base + 1 + clearing_member_code_at + 1) % 256; clearing_member_code_at = clearing_member_code_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Member Code to the wire, 6 bytes from where the cursor stands */
inline encode_clearing_member_code(clearing_member_code_record) {
  wire[at] = clearing_member_code_record.clearing_member_code_length_byte; at = at + 1;
  clearing_member_code_at = 0;
  do
  :: clearing_member_code_at < 5 -> wire[at] = clearing_member_code_record.clearing_member_code_characters[clearing_member_code_at]; at = at + 1; clearing_member_code_at = clearing_member_code_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Member Code off the wire, 6 bytes from where the cursor stands */
inline decode_clearing_member_code(clearing_member_code_record) {
  clearing_member_code_record.clearing_member_code_length_byte = wire[at]; at = at + 1;
  clearing_member_code_at = 0;
  do
  :: clearing_member_code_at < 5 -> clearing_member_code_record.clearing_member_code_characters[clearing_member_code_at] = wire[at]; at = at + 1; clearing_member_code_at = clearing_member_code_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Clearing Member Code is what was written, byte for byte */
inline equal_clearing_member_code(clearing_member_code_read, clearing_member_code_written) {
  assert(clearing_member_code_read.clearing_member_code_length_byte == clearing_member_code_written.clearing_member_code_length_byte);
  clearing_member_code_at = 0;
  do
  :: clearing_member_code_at < 5 -> assert(clearing_member_code_read.clearing_member_code_characters[clearing_member_code_at] == clearing_member_code_written.clearing_member_code_characters[clearing_member_code_at]); clearing_member_code_at = clearing_member_code_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Clearing Member Description: 50 bytes ----------------------------------- */

/* This is the Description of the clearing member. */
typedef ClearingMemberDescription {
  byte clearing_member_description_length_byte;
  byte clearing_member_description_characters[49]
};

int clearing_member_description_at;

/* every byte of Clearing Member Description set to one value */
inline fill_clearing_member_description(clearing_member_description_record, clearing_member_description_value) {
  clearing_member_description_record.clearing_member_description_length_byte = clearing_member_description_value;
  clearing_member_description_at = 0;
  do
  :: clearing_member_description_at < 49 -> clearing_member_description_record.clearing_member_description_characters[clearing_member_description_at] = clearing_member_description_value; clearing_member_description_at = clearing_member_description_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Clearing Member Description set to where it lies, so a field read out of place says so */
inline ramp_clearing_member_description(clearing_member_description_record, clearing_member_description_base) {
  clearing_member_description_record.clearing_member_description_length_byte = (clearing_member_description_base + 0 + 1) % 256;
  clearing_member_description_at = 0;
  do
  :: clearing_member_description_at < 49 -> clearing_member_description_record.clearing_member_description_characters[clearing_member_description_at] = (clearing_member_description_base + 1 + clearing_member_description_at + 1) % 256; clearing_member_description_at = clearing_member_description_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Member Description to the wire, 50 bytes from where the cursor stands */
inline encode_clearing_member_description(clearing_member_description_record) {
  wire[at] = clearing_member_description_record.clearing_member_description_length_byte; at = at + 1;
  clearing_member_description_at = 0;
  do
  :: clearing_member_description_at < 49 -> wire[at] = clearing_member_description_record.clearing_member_description_characters[clearing_member_description_at]; at = at + 1; clearing_member_description_at = clearing_member_description_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Member Description off the wire, 50 bytes from where the cursor stands */
inline decode_clearing_member_description(clearing_member_description_record) {
  clearing_member_description_record.clearing_member_description_length_byte = wire[at]; at = at + 1;
  clearing_member_description_at = 0;
  do
  :: clearing_member_description_at < 49 -> clearing_member_description_record.clearing_member_description_characters[clearing_member_description_at] = wire[at]; at = at + 1; clearing_member_description_at = clearing_member_description_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Clearing Member Description is what was written, byte for byte */
inline equal_clearing_member_description(clearing_member_description_read, clearing_member_description_written) {
  assert(clearing_member_description_read.clearing_member_description_length_byte == clearing_member_description_written.clearing_member_description_length_byte);
  clearing_member_description_at = 0;
  do
  :: clearing_member_description_at < 49 -> assert(clearing_member_description_read.clearing_member_description_characters[clearing_member_description_at] == clearing_member_description_written.clearing_member_description_characters[clearing_member_description_at]); clearing_member_description_at = clearing_member_description_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Clearing Member Data: 60 bytes ------------------------------------------ */

/* Clearing Member Data */
typedef ClearingMemberData {
  byte clearing_member_sequence[4];
  ClearingMemberCode clearing_member_code;
  ClearingMemberDescription clearing_member_d_0qdlos
};

int clearing_member_data_at;

/* every byte of Clearing Member Data set to one value */
inline fill_clearing_member_data(clearing_member_data_record, clearing_member_data_value) {
  clearing_member_data_at = 0;
  do
  :: clearing_member_data_at < 4 -> clearing_member_data_record.clearing_member_sequence[clearing_member_data_at] = clearing_member_data_value; clearing_member_data_at = clearing_member_data_at + 1
  :: else -> break
  od;
  fill_clearing_member_code(clearing_member_data_record.clearing_member_code, clearing_member_data_value);
  fill_clearing_member_description(clearing_member_data_record.clearing_member_d_0qdlos, clearing_member_data_value);
  skip
}

/* each byte of Clearing Member Data set to where it lies, so a field read out of place says so */
inline ramp_clearing_member_data(clearing_member_data_record, clearing_member_data_base) {
  clearing_member_data_at = 0;
  do
  :: clearing_member_data_at < 4 -> clearing_member_data_record.clearing_member_sequence[clearing_member_data_at] = (clearing_member_data_base + 0 + clearing_member_data_at + 1) % 256; clearing_member_data_at = clearing_member_data_at + 1
  :: else -> break
  od;
  ramp_clearing_member_code(clearing_member_data_record.clearing_member_code, clearing_member_data_base + 4);
  ramp_clearing_member_description(clearing_member_data_record.clearing_member_d_0qdlos, clearing_member_data_base + 10);
  skip
}

/* Clearing Member Data to the wire, 60 bytes from where the cursor stands */
inline encode_clearing_member_data(clearing_member_data_record) {
  clearing_member_data_at = 0;
  do
  :: clearing_member_data_at < 4 -> wire[at] = clearing_member_data_record.clearing_member_sequence[clearing_member_data_at]; at = at + 1; clearing_member_data_at = clearing_member_data_at + 1
  :: else -> break
  od;
  encode_clearing_member_code(clearing_member_data_record.clearing_member_code);
  encode_clearing_member_description(clearing_member_data_record.clearing_member_d_0qdlos);
  skip
}

/* Clearing Member Data off the wire, 60 bytes from where the cursor stands */
inline decode_clearing_member_data(clearing_member_data_record) {
  clearing_member_data_at = 0;
  do
  :: clearing_member_data_at < 4 -> clearing_member_data_record.clearing_member_sequence[clearing_member_data_at] = wire[at]; at = at + 1; clearing_member_data_at = clearing_member_data_at + 1
  :: else -> break
  od;
  decode_clearing_member_code(clearing_member_data_record.clearing_member_code);
  decode_clearing_member_description(clearing_member_data_record.clearing_member_d_0qdlos);
  skip
}

/* what was read of Clearing Member Data is what was written, byte for byte */
inline equal_clearing_member_data(clearing_member_data_read, clearing_member_data_written) {
  clearing_member_data_at = 0;
  do
  :: clearing_member_data_at < 4 -> assert(clearing_member_data_read.clearing_member_sequence[clearing_member_data_at] == clearing_member_data_written.clearing_member_sequence[clearing_member_data_at]); clearing_member_data_at = clearing_member_data_at + 1
  :: else -> break
  od;
  equal_clearing_member_code(clearing_member_data_read.clearing_member_code, clearing_member_data_written.clearing_member_code);
  equal_clearing_member_description(clearing_member_data_read.clearing_member_d_0qdlos, clearing_member_data_written.clearing_member_d_0qdlos);
  skip
}

/* ---- Announcement Date: 12 bytes --------------------------------------------- */

/* Announcement Date */
typedef AnnouncementDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int announcement_date_at;

/* every byte of Announcement Date set to one value */
inline fill_announcement_date(announcement_date_record, announcement_date_value) {
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> announcement_date_record.year[announcement_date_at] = announcement_date_value; announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> announcement_date_record.month[announcement_date_at] = announcement_date_value; announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> announcement_date_record.day[announcement_date_at] = announcement_date_value; announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Announcement Date set to where it lies, so a field read out of place says so */
inline ramp_announcement_date(announcement_date_record, announcement_date_base) {
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> announcement_date_record.year[announcement_date_at] = (announcement_date_base + 0 + announcement_date_at + 1) % 256; announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> announcement_date_record.month[announcement_date_at] = (announcement_date_base + 4 + announcement_date_at + 1) % 256; announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> announcement_date_record.day[announcement_date_at] = (announcement_date_base + 8 + announcement_date_at + 1) % 256; announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  skip
}

/* Announcement Date to the wire, 12 bytes from where the cursor stands */
inline encode_announcement_date(announcement_date_record) {
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> wire[at] = announcement_date_record.year[announcement_date_at]; at = at + 1; announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> wire[at] = announcement_date_record.month[announcement_date_at]; at = at + 1; announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> wire[at] = announcement_date_record.day[announcement_date_at]; at = at + 1; announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  skip
}

/* Announcement Date off the wire, 12 bytes from where the cursor stands */
inline decode_announcement_date(announcement_date_record) {
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> announcement_date_record.year[announcement_date_at] = wire[at]; at = at + 1; announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> announcement_date_record.month[announcement_date_at] = wire[at]; at = at + 1; announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> announcement_date_record.day[announcement_date_at] = wire[at]; at = at + 1; announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Announcement Date is what was written, byte for byte */
inline equal_announcement_date(announcement_date_read, announcement_date_written) {
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> assert(announcement_date_read.year[announcement_date_at] == announcement_date_written.year[announcement_date_at]); announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> assert(announcement_date_read.month[announcement_date_at] == announcement_date_written.month[announcement_date_at]); announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  announcement_date_at = 0;
  do
  :: announcement_date_at < 4 -> assert(announcement_date_read.day[announcement_date_at] == announcement_date_written.day[announcement_date_at]); announcement_date_at = announcement_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Announcement Time: 4 bytes ---------------------------------------------- */

/* Announcement Time */
typedef AnnouncementTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Announcement Time set to one value */
inline fill_announcement_time(announcement_time_record, announcement_time_value) {
  announcement_time_record.hours = announcement_time_value;
  announcement_time_record.minutes = announcement_time_value;
  announcement_time_record.seconds = announcement_time_value;
  announcement_time_record.unused_1 = announcement_time_value;
  skip
}

/* each byte of Announcement Time set to where it lies, so a field read out of place says so */
inline ramp_announcement_time(announcement_time_record, announcement_time_base) {
  announcement_time_record.hours = (announcement_time_base + 0 + 1) % 256;
  announcement_time_record.minutes = (announcement_time_base + 1 + 1) % 256;
  announcement_time_record.seconds = (announcement_time_base + 2 + 1) % 256;
  announcement_time_record.unused_1 = (announcement_time_base + 3 + 1) % 256;
  skip
}

/* Announcement Time to the wire, 4 bytes from where the cursor stands */
inline encode_announcement_time(announcement_time_record) {
  wire[at] = announcement_time_record.hours; at = at + 1;
  wire[at] = announcement_time_record.minutes; at = at + 1;
  wire[at] = announcement_time_record.seconds; at = at + 1;
  wire[at] = announcement_time_record.unused_1; at = at + 1;
  skip
}

/* Announcement Time off the wire, 4 bytes from where the cursor stands */
inline decode_announcement_time(announcement_time_record) {
  announcement_time_record.hours = wire[at]; at = at + 1;
  announcement_time_record.minutes = wire[at]; at = at + 1;
  announcement_time_record.seconds = wire[at]; at = at + 1;
  announcement_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Announcement Time is what was written, byte for byte */
inline equal_announcement_time(announcement_time_read, announcement_time_written) {
  assert(announcement_time_read.hours == announcement_time_written.hours);
  assert(announcement_time_read.minutes == announcement_time_written.minutes);
  assert(announcement_time_read.seconds == announcement_time_written.seconds);
  assert(announcement_time_read.unused_1 == announcement_time_written.unused_1);
  skip
}

/* ---- Announcement: 255 bytes ------------------------------------------------- */

/* Announcement as sent by the exchange. */
typedef Announcement {
  byte announcement_length_byte;
  byte announcement_characters[254]
};

int announcement_at;

/* every byte of Announcement set to one value */
inline fill_announcement(announcement_record, announcement_value) {
  announcement_record.announcement_length_byte = announcement_value;
  announcement_at = 0;
  do
  :: announcement_at < 254 -> announcement_record.announcement_characters[announcement_at] = announcement_value; announcement_at = announcement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Announcement set to where it lies, so a field read out of place says so */
inline ramp_announcement(announcement_record, announcement_base) {
  announcement_record.announcement_length_byte = (announcement_base + 0 + 1) % 256;
  announcement_at = 0;
  do
  :: announcement_at < 254 -> announcement_record.announcement_characters[announcement_at] = (announcement_base + 1 + announcement_at + 1) % 256; announcement_at = announcement_at + 1
  :: else -> break
  od;
  skip
}

/* Announcement to the wire, 255 bytes from where the cursor stands */
inline encode_announcement(announcement_record) {
  wire[at] = announcement_record.announcement_length_byte; at = at + 1;
  announcement_at = 0;
  do
  :: announcement_at < 254 -> wire[at] = announcement_record.announcement_characters[announcement_at]; at = at + 1; announcement_at = announcement_at + 1
  :: else -> break
  od;
  skip
}

/* Announcement off the wire, 255 bytes from where the cursor stands */
inline decode_announcement(announcement_record) {
  announcement_record.announcement_length_byte = wire[at]; at = at + 1;
  announcement_at = 0;
  do
  :: announcement_at < 254 -> announcement_record.announcement_characters[announcement_at] = wire[at]; at = at + 1; announcement_at = announcement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Announcement is what was written, byte for byte */
inline equal_announcement(announcement_read, announcement_written) {
  assert(announcement_read.announcement_length_byte == announcement_written.announcement_length_byte);
  announcement_at = 0;
  do
  :: announcement_at < 254 -> assert(announcement_read.announcement_characters[announcement_at] == announcement_written.announcement_characters[announcement_at]); announcement_at = announcement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Exchange Announcements: 279 bytes --------------------------------------- */

/* Exchange Announcements */
typedef ExchangeAnnouncements {
  byte id_market[4];
  byte announcement_sequence[4];
  AnnouncementDate announcement_date;
  AnnouncementTime announcement_time;
  Announcement announcement
};

int exchange_announcements_at;

/* every byte of Exchange Announcements set to one value */
inline fill_exchange_announcements(exchange_announcements_record, exchange_announcements_value) {
  exchange_announcements_at = 0;
  do
  :: exchange_announcements_at < 4 -> exchange_announcements_record.id_market[exchange_announcements_at] = exchange_announcements_value; exchange_announcements_at = exchange_announcements_at + 1
  :: else -> break
  od;
  exchange_announcements_at = 0;
  do
  :: exchange_announcements_at < 4 -> exchange_announcements_record.announcement_sequence[exchange_announcements_at] = exchange_announcements_value; exchange_announcements_at = exchange_announcements_at + 1
  :: else -> break
  od;
  fill_announcement_date(exchange_announcements_record.announcement_date, exchange_announcements_value);
  fill_announcement_time(exchange_announcements_record.announcement_time, exchange_announcements_value);
  fill_announcement(exchange_announcements_record.announcement, exchange_announcements_value);
  skip
}

/* each byte of Exchange Announcements set to where it lies, so a field read out of place says so */
inline ramp_exchange_announcements(exchange_announcements_record, exchange_announcements_base) {
  exchange_announcements_at = 0;
  do
  :: exchange_announcements_at < 4 -> exchange_announcements_record.id_market[exchange_announcements_at] = (exchange_announcements_base + 0 + exchange_announcements_at + 1) % 256; exchange_announcements_at = exchange_announcements_at + 1
  :: else -> break
  od;
  exchange_announcements_at = 0;
  do
  :: exchange_announcements_at < 4 -> exchange_announcements_record.announcement_sequence[exchange_announcements_at] = (exchange_announcements_base + 4 + exchange_announcements_at + 1) % 256; exchange_announcements_at = exchange_announcements_at + 1
  :: else -> break
  od;
  ramp_announcement_date(exchange_announcements_record.announcement_date, exchange_announcements_base + 8);
  ramp_announcement_time(exchange_announcements_record.announcement_time, exchange_announcements_base + 20);
  ramp_announcement(exchange_announcements_record.announcement, exchange_announcements_base + 24);
  skip
}

/* Exchange Announcements to the wire, 279 bytes from where the cursor stands */
inline encode_exchange_announcements(exchange_announcements_record) {
  exchange_announcements_at = 0;
  do
  :: exchange_announcements_at < 4 -> wire[at] = exchange_announcements_record.id_market[exchange_announcements_at]; at = at + 1; exchange_announcements_at = exchange_announcements_at + 1
  :: else -> break
  od;
  exchange_announcements_at = 0;
  do
  :: exchange_announcements_at < 4 -> wire[at] = exchange_announcements_record.announcement_sequence[exchange_announcements_at]; at = at + 1; exchange_announcements_at = exchange_announcements_at + 1
  :: else -> break
  od;
  encode_announcement_date(exchange_announcements_record.announcement_date);
  encode_announcement_time(exchange_announcements_record.announcement_time);
  encode_announcement(exchange_announcements_record.announcement);
  skip
}

/* Exchange Announcements off the wire, 279 bytes from where the cursor stands */
inline decode_exchange_announcements(exchange_announcements_record) {
  exchange_announcements_at = 0;
  do
  :: exchange_announcements_at < 4 -> exchange_announcements_record.id_market[exchange_announcements_at] = wire[at]; at = at + 1; exchange_announcements_at = exchange_announcements_at + 1
  :: else -> break
  od;
  exchange_announcements_at = 0;
  do
  :: exchange_announcements_at < 4 -> exchange_announcements_record.announcement_sequence[exchange_announcements_at] = wire[at]; at = at + 1; exchange_announcements_at = exchange_announcements_at + 1
  :: else -> break
  od;
  decode_announcement_date(exchange_announcements_record.announcement_date);
  decode_announcement_time(exchange_announcements_record.announcement_time);
  decode_announcement(exchange_announcements_record.announcement);
  skip
}

/* what was read of Exchange Announcements is what was written, byte for byte */
inline equal_exchange_announcements(exchange_announcements_read, exchange_announcements_written) {
  exchange_announcements_at = 0;
  do
  :: exchange_announcements_at < 4 -> assert(exchange_announcements_read.id_market[exchange_announcements_at] == exchange_announcements_written.id_market[exchange_announcements_at]); exchange_announcements_at = exchange_announcements_at + 1
  :: else -> break
  od;
  exchange_announcements_at = 0;
  do
  :: exchange_announcements_at < 4 -> assert(exchange_announcements_read.announcement_sequence[exchange_announcements_at] == exchange_announcements_written.announcement_sequence[exchange_announcements_at]); exchange_announcements_at = exchange_announcements_at + 1
  :: else -> break
  od;
  equal_announcement_date(exchange_announcements_read.announcement_date, exchange_announcements_written.announcement_date);
  equal_announcement_time(exchange_announcements_read.announcement_time, exchange_announcements_written.announcement_time);
  equal_announcement(exchange_announcements_read.announcement, exchange_announcements_written.announcement);
  skip
}

/* ---- Message Category Value: 50 bytes ---------------------------------------- */

/* Indicates the value which is associated with the category type. */
typedef MessageCategoryValue {
  byte message_category_value_length_byte;
  byte message_category_value_characters[49]
};

int message_category_value_at;

/* every byte of Message Category Value set to one value */
inline fill_message_category_value(message_category_value_record, message_category_value_value) {
  message_category_value_record.message_category_value_length_byte = message_category_value_value;
  message_category_value_at = 0;
  do
  :: message_category_value_at < 49 -> message_category_value_record.message_category_value_characters[message_category_value_at] = message_category_value_value; message_category_value_at = message_category_value_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Category Value set to where it lies, so a field read out of place says so */
inline ramp_message_category_value(message_category_value_record, message_category_value_base) {
  message_category_value_record.message_category_value_length_byte = (message_category_value_base + 0 + 1) % 256;
  message_category_value_at = 0;
  do
  :: message_category_value_at < 49 -> message_category_value_record.message_category_value_characters[message_category_value_at] = (message_category_value_base + 1 + message_category_value_at + 1) % 256; message_category_value_at = message_category_value_at + 1
  :: else -> break
  od;
  skip
}

/* Message Category Value to the wire, 50 bytes from where the cursor stands */
inline encode_message_category_value(message_category_value_record) {
  wire[at] = message_category_value_record.message_category_value_length_byte; at = at + 1;
  message_category_value_at = 0;
  do
  :: message_category_value_at < 49 -> wire[at] = message_category_value_record.message_category_value_characters[message_category_value_at]; at = at + 1; message_category_value_at = message_category_value_at + 1
  :: else -> break
  od;
  skip
}

/* Message Category Value off the wire, 50 bytes from where the cursor stands */
inline decode_message_category_value(message_category_value_record) {
  message_category_value_record.message_category_value_length_byte = wire[at]; at = at + 1;
  message_category_value_at = 0;
  do
  :: message_category_value_at < 49 -> message_category_value_record.message_category_value_characters[message_category_value_at] = wire[at]; at = at + 1; message_category_value_at = message_category_value_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Category Value is what was written, byte for byte */
inline equal_message_category_value(message_category_value_read, message_category_value_written) {
  assert(message_category_value_read.message_category_value_length_byte == message_category_value_written.message_category_value_length_byte);
  message_category_value_at = 0;
  do
  :: message_category_value_at < 49 -> assert(message_category_value_read.message_category_value_characters[message_category_value_at] == message_category_value_written.message_category_value_characters[message_category_value_at]); message_category_value_at = message_category_value_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message P 255: 255 bytes ------------------------------------------------ */

/* Indicates the text for this segment of the news message. */
typedef MessageP255 {
  byte message_p_255_length_byte;
  byte message_p_255_characters[254]
};

int message_p255_at;

/* every byte of Message P 255 set to one value */
inline fill_message_p255(message_p255_record, message_p255_value) {
  message_p255_record.message_p_255_length_byte = message_p255_value;
  message_p255_at = 0;
  do
  :: message_p255_at < 254 -> message_p255_record.message_p_255_characters[message_p255_at] = message_p255_value; message_p255_at = message_p255_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message P 255 set to where it lies, so a field read out of place says so */
inline ramp_message_p255(message_p255_record, message_p255_base) {
  message_p255_record.message_p_255_length_byte = (message_p255_base + 0 + 1) % 256;
  message_p255_at = 0;
  do
  :: message_p255_at < 254 -> message_p255_record.message_p_255_characters[message_p255_at] = (message_p255_base + 1 + message_p255_at + 1) % 256; message_p255_at = message_p255_at + 1
  :: else -> break
  od;
  skip
}

/* Message P 255 to the wire, 255 bytes from where the cursor stands */
inline encode_message_p255(message_p255_record) {
  wire[at] = message_p255_record.message_p_255_length_byte; at = at + 1;
  message_p255_at = 0;
  do
  :: message_p255_at < 254 -> wire[at] = message_p255_record.message_p_255_characters[message_p255_at]; at = at + 1; message_p255_at = message_p255_at + 1
  :: else -> break
  od;
  skip
}

/* Message P 255 off the wire, 255 bytes from where the cursor stands */
inline decode_message_p255(message_p255_record) {
  message_p255_record.message_p_255_length_byte = wire[at]; at = at + 1;
  message_p255_at = 0;
  do
  :: message_p255_at < 254 -> message_p255_record.message_p_255_characters[message_p255_at] = wire[at]; at = at + 1; message_p255_at = message_p255_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message P 255 is what was written, byte for byte */
inline equal_message_p255(message_p255_read, message_p255_written) {
  assert(message_p255_read.message_p_255_length_byte == message_p255_written.message_p_255_length_byte);
  message_p255_at = 0;
  do
  :: message_p255_at < 254 -> assert(message_p255_read.message_p_255_characters[message_p255_at] == message_p255_written.message_p_255_characters[message_p255_at]); message_p255_at = message_p255_at + 1
  :: else -> break
  od;
  skip
}

/* ---- News Service: 329 bytes ------------------------------------------------- */

/* News Service */
typedef NewsService {
  Date date;
  Time time;
  byte message_category_type[2];
  MessageCategoryValue message_category_value;
  byte news_number[2];
  byte total_number_of_segments[2];
  byte segment_number[2];
  MessageP255 message_p_255
};

int news_service_at;

/* every byte of News Service set to one value */
inline fill_news_service(news_service_record, news_service_value) {
  fill_date(news_service_record.date, news_service_value);
  fill_time(news_service_record.time, news_service_value);
  news_service_at = 0;
  do
  :: news_service_at < 2 -> news_service_record.message_category_type[news_service_at] = news_service_value; news_service_at = news_service_at + 1
  :: else -> break
  od;
  fill_message_category_value(news_service_record.message_category_value, news_service_value);
  news_service_at = 0;
  do
  :: news_service_at < 2 -> news_service_record.news_number[news_service_at] = news_service_value; news_service_at = news_service_at + 1
  :: else -> break
  od;
  news_service_at = 0;
  do
  :: news_service_at < 2 -> news_service_record.total_number_of_segments[news_service_at] = news_service_value; news_service_at = news_service_at + 1
  :: else -> break
  od;
  news_service_at = 0;
  do
  :: news_service_at < 2 -> news_service_record.segment_number[news_service_at] = news_service_value; news_service_at = news_service_at + 1
  :: else -> break
  od;
  fill_message_p255(news_service_record.message_p_255, news_service_value);
  skip
}

/* each byte of News Service set to where it lies, so a field read out of place says so */
inline ramp_news_service(news_service_record, news_service_base) {
  ramp_date(news_service_record.date, news_service_base + 0);
  ramp_time(news_service_record.time, news_service_base + 12);
  news_service_at = 0;
  do
  :: news_service_at < 2 -> news_service_record.message_category_type[news_service_at] = (news_service_base + 16 + news_service_at + 1) % 256; news_service_at = news_service_at + 1
  :: else -> break
  od;
  ramp_message_category_value(news_service_record.message_category_value, news_service_base + 18);
  news_service_at = 0;
  do
  :: news_service_at < 2 -> news_service_record.news_number[news_service_at] = (news_service_base + 68 + news_service_at + 1) % 256; news_service_at = news_service_at + 1
  :: else -> break
  od;
  news_service_at = 0;
  do
  :: news_service_at < 2 -> news_service_record.total_number_of_segments[news_service_at] = (news_service_base + 70 + news_service_at + 1) % 256; news_service_at = news_service_at + 1
  :: else -> break
  od;
  news_service_at = 0;
  do
  :: news_service_at < 2 -> news_service_record.segment_number[news_service_at] = (news_service_base + 72 + news_service_at + 1) % 256; news_service_at = news_service_at + 1
  :: else -> break
  od;
  ramp_message_p255(news_service_record.message_p_255, news_service_base + 74);
  skip
}

/* News Service to the wire, 329 bytes from where the cursor stands */
inline encode_news_service(news_service_record) {
  encode_date(news_service_record.date);
  encode_time(news_service_record.time);
  news_service_at = 0;
  do
  :: news_service_at < 2 -> wire[at] = news_service_record.message_category_type[news_service_at]; at = at + 1; news_service_at = news_service_at + 1
  :: else -> break
  od;
  encode_message_category_value(news_service_record.message_category_value);
  news_service_at = 0;
  do
  :: news_service_at < 2 -> wire[at] = news_service_record.news_number[news_service_at]; at = at + 1; news_service_at = news_service_at + 1
  :: else -> break
  od;
  news_service_at = 0;
  do
  :: news_service_at < 2 -> wire[at] = news_service_record.total_number_of_segments[news_service_at]; at = at + 1; news_service_at = news_service_at + 1
  :: else -> break
  od;
  news_service_at = 0;
  do
  :: news_service_at < 2 -> wire[at] = news_service_record.segment_number[news_service_at]; at = at + 1; news_service_at = news_service_at + 1
  :: else -> break
  od;
  encode_message_p255(news_service_record.message_p_255);
  skip
}

/* News Service off the wire, 329 bytes from where the cursor stands */
inline decode_news_service(news_service_record) {
  decode_date(news_service_record.date);
  decode_time(news_service_record.time);
  news_service_at = 0;
  do
  :: news_service_at < 2 -> news_service_record.message_category_type[news_service_at] = wire[at]; at = at + 1; news_service_at = news_service_at + 1
  :: else -> break
  od;
  decode_message_category_value(news_service_record.message_category_value);
  news_service_at = 0;
  do
  :: news_service_at < 2 -> news_service_record.news_number[news_service_at] = wire[at]; at = at + 1; news_service_at = news_service_at + 1
  :: else -> break
  od;
  news_service_at = 0;
  do
  :: news_service_at < 2 -> news_service_record.total_number_of_segments[news_service_at] = wire[at]; at = at + 1; news_service_at = news_service_at + 1
  :: else -> break
  od;
  news_service_at = 0;
  do
  :: news_service_at < 2 -> news_service_record.segment_number[news_service_at] = wire[at]; at = at + 1; news_service_at = news_service_at + 1
  :: else -> break
  od;
  decode_message_p255(news_service_record.message_p_255);
  skip
}

/* what was read of News Service is what was written, byte for byte */
inline equal_news_service(news_service_read, news_service_written) {
  equal_date(news_service_read.date, news_service_written.date);
  equal_time(news_service_read.time, news_service_written.time);
  news_service_at = 0;
  do
  :: news_service_at < 2 -> assert(news_service_read.message_category_type[news_service_at] == news_service_written.message_category_type[news_service_at]); news_service_at = news_service_at + 1
  :: else -> break
  od;
  equal_message_category_value(news_service_read.message_category_value, news_service_written.message_category_value);
  news_service_at = 0;
  do
  :: news_service_at < 2 -> assert(news_service_read.news_number[news_service_at] == news_service_written.news_number[news_service_at]); news_service_at = news_service_at + 1
  :: else -> break
  od;
  news_service_at = 0;
  do
  :: news_service_at < 2 -> assert(news_service_read.total_number_of_segments[news_service_at] == news_service_written.total_number_of_segments[news_service_at]); news_service_at = news_service_at + 1
  :: else -> break
  od;
  news_service_at = 0;
  do
  :: news_service_at < 2 -> assert(news_service_read.segment_number[news_service_at] == news_service_written.segment_number[news_service_at]); news_service_at = news_service_at + 1
  :: else -> break
  od;
  equal_message_p255(news_service_read.message_p_255, news_service_written.message_p_255);
  skip
}

/* ---- Coupon Date: 12 bytes --------------------------------------------------- */

/* Coupon Date */
typedef CouponDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int coupon_date_at;

/* every byte of Coupon Date set to one value */
inline fill_coupon_date(coupon_date_record, coupon_date_value) {
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> coupon_date_record.year[coupon_date_at] = coupon_date_value; coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> coupon_date_record.month[coupon_date_at] = coupon_date_value; coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> coupon_date_record.day[coupon_date_at] = coupon_date_value; coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Coupon Date set to where it lies, so a field read out of place says so */
inline ramp_coupon_date(coupon_date_record, coupon_date_base) {
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> coupon_date_record.year[coupon_date_at] = (coupon_date_base + 0 + coupon_date_at + 1) % 256; coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> coupon_date_record.month[coupon_date_at] = (coupon_date_base + 4 + coupon_date_at + 1) % 256; coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> coupon_date_record.day[coupon_date_at] = (coupon_date_base + 8 + coupon_date_at + 1) % 256; coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  skip
}

/* Coupon Date to the wire, 12 bytes from where the cursor stands */
inline encode_coupon_date(coupon_date_record) {
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> wire[at] = coupon_date_record.year[coupon_date_at]; at = at + 1; coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> wire[at] = coupon_date_record.month[coupon_date_at]; at = at + 1; coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> wire[at] = coupon_date_record.day[coupon_date_at]; at = at + 1; coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  skip
}

/* Coupon Date off the wire, 12 bytes from where the cursor stands */
inline decode_coupon_date(coupon_date_record) {
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> coupon_date_record.year[coupon_date_at] = wire[at]; at = at + 1; coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> coupon_date_record.month[coupon_date_at] = wire[at]; at = at + 1; coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> coupon_date_record.day[coupon_date_at] = wire[at]; at = at + 1; coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Coupon Date is what was written, byte for byte */
inline equal_coupon_date(coupon_date_read, coupon_date_written) {
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> assert(coupon_date_read.year[coupon_date_at] == coupon_date_written.year[coupon_date_at]); coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> assert(coupon_date_read.month[coupon_date_at] == coupon_date_written.month[coupon_date_at]); coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  coupon_date_at = 0;
  do
  :: coupon_date_at < 4 -> assert(coupon_date_read.day[coupon_date_at] == coupon_date_written.day[coupon_date_at]); coupon_date_at = coupon_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Books Close Date: 12 bytes ---------------------------------------------- */

/* Books Close Date */
typedef BooksCloseDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int books_close_date_at;

/* every byte of Books Close Date set to one value */
inline fill_books_close_date(books_close_date_record, books_close_date_value) {
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> books_close_date_record.year[books_close_date_at] = books_close_date_value; books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> books_close_date_record.month[books_close_date_at] = books_close_date_value; books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> books_close_date_record.day[books_close_date_at] = books_close_date_value; books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Books Close Date set to where it lies, so a field read out of place says so */
inline ramp_books_close_date(books_close_date_record, books_close_date_base) {
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> books_close_date_record.year[books_close_date_at] = (books_close_date_base + 0 + books_close_date_at + 1) % 256; books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> books_close_date_record.month[books_close_date_at] = (books_close_date_base + 4 + books_close_date_at + 1) % 256; books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> books_close_date_record.day[books_close_date_at] = (books_close_date_base + 8 + books_close_date_at + 1) % 256; books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  skip
}

/* Books Close Date to the wire, 12 bytes from where the cursor stands */
inline encode_books_close_date(books_close_date_record) {
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> wire[at] = books_close_date_record.year[books_close_date_at]; at = at + 1; books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> wire[at] = books_close_date_record.month[books_close_date_at]; at = at + 1; books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> wire[at] = books_close_date_record.day[books_close_date_at]; at = at + 1; books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  skip
}

/* Books Close Date off the wire, 12 bytes from where the cursor stands */
inline decode_books_close_date(books_close_date_record) {
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> books_close_date_record.year[books_close_date_at] = wire[at]; at = at + 1; books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> books_close_date_record.month[books_close_date_at] = wire[at]; at = at + 1; books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> books_close_date_record.day[books_close_date_at] = wire[at]; at = at + 1; books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Books Close Date is what was written, byte for byte */
inline equal_books_close_date(books_close_date_read, books_close_date_written) {
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> assert(books_close_date_read.year[books_close_date_at] == books_close_date_written.year[books_close_date_at]); books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> assert(books_close_date_read.month[books_close_date_at] == books_close_date_written.month[books_close_date_at]); books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  books_close_date_at = 0;
  do
  :: books_close_date_at < 4 -> assert(books_close_date_read.day[books_close_date_at] == books_close_date_written.day[books_close_date_at]); books_close_date_at = books_close_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Coupon Information: 48 bytes -------------------------------------------- */

/* Coupon Information */
typedef CouponInformation {
  byte coupon_sequence[4];
  byte instrument_sequence[4];
  CouponDate coupon_date;
  BooksCloseDate books_close_date;
  byte coupon_rate[8];
  byte redemption_value[8]
};

int coupon_information_at;

/* every byte of Coupon Information set to one value */
inline fill_coupon_information(coupon_information_record, coupon_information_value) {
  coupon_information_at = 0;
  do
  :: coupon_information_at < 4 -> coupon_information_record.coupon_sequence[coupon_information_at] = coupon_information_value; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  coupon_information_at = 0;
  do
  :: coupon_information_at < 4 -> coupon_information_record.instrument_sequence[coupon_information_at] = coupon_information_value; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  fill_coupon_date(coupon_information_record.coupon_date, coupon_information_value);
  fill_books_close_date(coupon_information_record.books_close_date, coupon_information_value);
  coupon_information_at = 0;
  do
  :: coupon_information_at < 8 -> coupon_information_record.coupon_rate[coupon_information_at] = coupon_information_value; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  coupon_information_at = 0;
  do
  :: coupon_information_at < 8 -> coupon_information_record.redemption_value[coupon_information_at] = coupon_information_value; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Coupon Information set to where it lies, so a field read out of place says so */
inline ramp_coupon_information(coupon_information_record, coupon_information_base) {
  coupon_information_at = 0;
  do
  :: coupon_information_at < 4 -> coupon_information_record.coupon_sequence[coupon_information_at] = (coupon_information_base + 0 + coupon_information_at + 1) % 256; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  coupon_information_at = 0;
  do
  :: coupon_information_at < 4 -> coupon_information_record.instrument_sequence[coupon_information_at] = (coupon_information_base + 4 + coupon_information_at + 1) % 256; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  ramp_coupon_date(coupon_information_record.coupon_date, coupon_information_base + 8);
  ramp_books_close_date(coupon_information_record.books_close_date, coupon_information_base + 20);
  coupon_information_at = 0;
  do
  :: coupon_information_at < 8 -> coupon_information_record.coupon_rate[coupon_information_at] = (coupon_information_base + 32 + coupon_information_at + 1) % 256; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  coupon_information_at = 0;
  do
  :: coupon_information_at < 8 -> coupon_information_record.redemption_value[coupon_information_at] = (coupon_information_base + 40 + coupon_information_at + 1) % 256; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  skip
}

/* Coupon Information to the wire, 48 bytes from where the cursor stands */
inline encode_coupon_information(coupon_information_record) {
  coupon_information_at = 0;
  do
  :: coupon_information_at < 4 -> wire[at] = coupon_information_record.coupon_sequence[coupon_information_at]; at = at + 1; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  coupon_information_at = 0;
  do
  :: coupon_information_at < 4 -> wire[at] = coupon_information_record.instrument_sequence[coupon_information_at]; at = at + 1; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  encode_coupon_date(coupon_information_record.coupon_date);
  encode_books_close_date(coupon_information_record.books_close_date);
  coupon_information_at = 0;
  do
  :: coupon_information_at < 8 -> wire[at] = coupon_information_record.coupon_rate[coupon_information_at]; at = at + 1; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  coupon_information_at = 0;
  do
  :: coupon_information_at < 8 -> wire[at] = coupon_information_record.redemption_value[coupon_information_at]; at = at + 1; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  skip
}

/* Coupon Information off the wire, 48 bytes from where the cursor stands */
inline decode_coupon_information(coupon_information_record) {
  coupon_information_at = 0;
  do
  :: coupon_information_at < 4 -> coupon_information_record.coupon_sequence[coupon_information_at] = wire[at]; at = at + 1; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  coupon_information_at = 0;
  do
  :: coupon_information_at < 4 -> coupon_information_record.instrument_sequence[coupon_information_at] = wire[at]; at = at + 1; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  decode_coupon_date(coupon_information_record.coupon_date);
  decode_books_close_date(coupon_information_record.books_close_date);
  coupon_information_at = 0;
  do
  :: coupon_information_at < 8 -> coupon_information_record.coupon_rate[coupon_information_at] = wire[at]; at = at + 1; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  coupon_information_at = 0;
  do
  :: coupon_information_at < 8 -> coupon_information_record.redemption_value[coupon_information_at] = wire[at]; at = at + 1; coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Coupon Information is what was written, byte for byte */
inline equal_coupon_information(coupon_information_read, coupon_information_written) {
  coupon_information_at = 0;
  do
  :: coupon_information_at < 4 -> assert(coupon_information_read.coupon_sequence[coupon_information_at] == coupon_information_written.coupon_sequence[coupon_information_at]); coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  coupon_information_at = 0;
  do
  :: coupon_information_at < 4 -> assert(coupon_information_read.instrument_sequence[coupon_information_at] == coupon_information_written.instrument_sequence[coupon_information_at]); coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  equal_coupon_date(coupon_information_read.coupon_date, coupon_information_written.coupon_date);
  equal_books_close_date(coupon_information_read.books_close_date, coupon_information_written.books_close_date);
  coupon_information_at = 0;
  do
  :: coupon_information_at < 8 -> assert(coupon_information_read.coupon_rate[coupon_information_at] == coupon_information_written.coupon_rate[coupon_information_at]); coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  coupon_information_at = 0;
  do
  :: coupon_information_at < 8 -> assert(coupon_information_read.redemption_value[coupon_information_at] == coupon_information_written.redemption_value[coupon_information_at]); coupon_information_at = coupon_information_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Session Name: 56 bytes ------------------------------------------ */

/* Indicates the name of the trading session. */
typedef TradingSessionName {
  byte trading_session_name_length_byte;
  byte trading_session_name_characters[55]
};

int trading_session_name_at;

/* every byte of Trading Session Name set to one value */
inline fill_trading_session_name(trading_session_name_record, trading_session_name_value) {
  trading_session_name_record.trading_session_name_length_byte = trading_session_name_value;
  trading_session_name_at = 0;
  do
  :: trading_session_name_at < 55 -> trading_session_name_record.trading_session_name_characters[trading_session_name_at] = trading_session_name_value; trading_session_name_at = trading_session_name_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Session Name set to where it lies, so a field read out of place says so */
inline ramp_trading_session_name(trading_session_name_record, trading_session_name_base) {
  trading_session_name_record.trading_session_name_length_byte = (trading_session_name_base + 0 + 1) % 256;
  trading_session_name_at = 0;
  do
  :: trading_session_name_at < 55 -> trading_session_name_record.trading_session_name_characters[trading_session_name_at] = (trading_session_name_base + 1 + trading_session_name_at + 1) % 256; trading_session_name_at = trading_session_name_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Session Name to the wire, 56 bytes from where the cursor stands */
inline encode_trading_session_name(trading_session_name_record) {
  wire[at] = trading_session_name_record.trading_session_name_length_byte; at = at + 1;
  trading_session_name_at = 0;
  do
  :: trading_session_name_at < 55 -> wire[at] = trading_session_name_record.trading_session_name_characters[trading_session_name_at]; at = at + 1; trading_session_name_at = trading_session_name_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Session Name off the wire, 56 bytes from where the cursor stands */
inline decode_trading_session_name(trading_session_name_record) {
  trading_session_name_record.trading_session_name_length_byte = wire[at]; at = at + 1;
  trading_session_name_at = 0;
  do
  :: trading_session_name_at < 55 -> trading_session_name_record.trading_session_name_characters[trading_session_name_at] = wire[at]; at = at + 1; trading_session_name_at = trading_session_name_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Session Name is what was written, byte for byte */
inline equal_trading_session_name(trading_session_name_read, trading_session_name_written) {
  assert(trading_session_name_read.trading_session_name_length_byte == trading_session_name_written.trading_session_name_length_byte);
  trading_session_name_at = 0;
  do
  :: trading_session_name_at < 55 -> assert(trading_session_name_read.trading_session_name_characters[trading_session_name_at] == trading_session_name_written.trading_session_name_characters[trading_session_name_at]); trading_session_name_at = trading_session_name_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Opening Auction Start Time: 4 bytes ------------------------------------- */

/* Opening Auction Start Time */
typedef OpeningAuctionStartTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Opening Auction Start Time set to one value */
inline fill_opening_auction_start_time(opening_auction_start_time_record, opening_auction_start_time_value) {
  opening_auction_start_time_record.hours = opening_auction_start_time_value;
  opening_auction_start_time_record.minutes = opening_auction_start_time_value;
  opening_auction_start_time_record.seconds = opening_auction_start_time_value;
  opening_auction_start_time_record.unused_1 = opening_auction_start_time_value;
  skip
}

/* each byte of Opening Auction Start Time set to where it lies, so a field read out of place says so */
inline ramp_opening_auction_start_time(opening_auction_start_time_record, opening_auction_start_time_base) {
  opening_auction_start_time_record.hours = (opening_auction_start_time_base + 0 + 1) % 256;
  opening_auction_start_time_record.minutes = (opening_auction_start_time_base + 1 + 1) % 256;
  opening_auction_start_time_record.seconds = (opening_auction_start_time_base + 2 + 1) % 256;
  opening_auction_start_time_record.unused_1 = (opening_auction_start_time_base + 3 + 1) % 256;
  skip
}

/* Opening Auction Start Time to the wire, 4 bytes from where the cursor stands */
inline encode_opening_auction_start_time(opening_auction_start_time_record) {
  wire[at] = opening_auction_start_time_record.hours; at = at + 1;
  wire[at] = opening_auction_start_time_record.minutes; at = at + 1;
  wire[at] = opening_auction_start_time_record.seconds; at = at + 1;
  wire[at] = opening_auction_start_time_record.unused_1; at = at + 1;
  skip
}

/* Opening Auction Start Time off the wire, 4 bytes from where the cursor stands */
inline decode_opening_auction_start_time(opening_auction_start_time_record) {
  opening_auction_start_time_record.hours = wire[at]; at = at + 1;
  opening_auction_start_time_record.minutes = wire[at]; at = at + 1;
  opening_auction_start_time_record.seconds = wire[at]; at = at + 1;
  opening_auction_start_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Opening Auction Start Time is what was written, byte for byte */
inline equal_opening_auction_start_time(opening_auction_start_time_read, opening_auction_start_time_written) {
  assert(opening_auction_start_time_read.hours == opening_auction_start_time_written.hours);
  assert(opening_auction_start_time_read.minutes == opening_auction_start_time_written.minutes);
  assert(opening_auction_start_time_read.seconds == opening_auction_start_time_written.seconds);
  assert(opening_auction_start_time_read.unused_1 == opening_auction_start_time_written.unused_1);
  skip
}

/* ---- Opening Auction Close Time: 4 bytes ------------------------------------- */

/* Opening Auction Close Time */
typedef OpeningAuctionCloseTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Opening Auction Close Time set to one value */
inline fill_opening_auction_close_time(opening_auction_close_time_record, opening_auction_close_time_value) {
  opening_auction_close_time_record.hours = opening_auction_close_time_value;
  opening_auction_close_time_record.minutes = opening_auction_close_time_value;
  opening_auction_close_time_record.seconds = opening_auction_close_time_value;
  opening_auction_close_time_record.unused_1 = opening_auction_close_time_value;
  skip
}

/* each byte of Opening Auction Close Time set to where it lies, so a field read out of place says so */
inline ramp_opening_auction_close_time(opening_auction_close_time_record, opening_auction_close_time_base) {
  opening_auction_close_time_record.hours = (opening_auction_close_time_base + 0 + 1) % 256;
  opening_auction_close_time_record.minutes = (opening_auction_close_time_base + 1 + 1) % 256;
  opening_auction_close_time_record.seconds = (opening_auction_close_time_base + 2 + 1) % 256;
  opening_auction_close_time_record.unused_1 = (opening_auction_close_time_base + 3 + 1) % 256;
  skip
}

/* Opening Auction Close Time to the wire, 4 bytes from where the cursor stands */
inline encode_opening_auction_close_time(opening_auction_close_time_record) {
  wire[at] = opening_auction_close_time_record.hours; at = at + 1;
  wire[at] = opening_auction_close_time_record.minutes; at = at + 1;
  wire[at] = opening_auction_close_time_record.seconds; at = at + 1;
  wire[at] = opening_auction_close_time_record.unused_1; at = at + 1;
  skip
}

/* Opening Auction Close Time off the wire, 4 bytes from where the cursor stands */
inline decode_opening_auction_close_time(opening_auction_close_time_record) {
  opening_auction_close_time_record.hours = wire[at]; at = at + 1;
  opening_auction_close_time_record.minutes = wire[at]; at = at + 1;
  opening_auction_close_time_record.seconds = wire[at]; at = at + 1;
  opening_auction_close_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Opening Auction Close Time is what was written, byte for byte */
inline equal_opening_auction_close_time(opening_auction_close_time_read, opening_auction_close_time_written) {
  assert(opening_auction_close_time_read.hours == opening_auction_close_time_written.hours);
  assert(opening_auction_close_time_read.minutes == opening_auction_close_time_written.minutes);
  assert(opening_auction_close_time_read.seconds == opening_auction_close_time_written.seconds);
  assert(opening_auction_close_time_read.unused_1 == opening_auction_close_time_written.unused_1);
  skip
}

/* ---- Closing Auction Start Time: 4 bytes ------------------------------------- */

/* Closing Auction Start Time */
typedef ClosingAuctionStartTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Closing Auction Start Time set to one value */
inline fill_closing_auction_start_time(closing_auction_start_time_record, closing_auction_start_time_value) {
  closing_auction_start_time_record.hours = closing_auction_start_time_value;
  closing_auction_start_time_record.minutes = closing_auction_start_time_value;
  closing_auction_start_time_record.seconds = closing_auction_start_time_value;
  closing_auction_start_time_record.unused_1 = closing_auction_start_time_value;
  skip
}

/* each byte of Closing Auction Start Time set to where it lies, so a field read out of place says so */
inline ramp_closing_auction_start_time(closing_auction_start_time_record, closing_auction_start_time_base) {
  closing_auction_start_time_record.hours = (closing_auction_start_time_base + 0 + 1) % 256;
  closing_auction_start_time_record.minutes = (closing_auction_start_time_base + 1 + 1) % 256;
  closing_auction_start_time_record.seconds = (closing_auction_start_time_base + 2 + 1) % 256;
  closing_auction_start_time_record.unused_1 = (closing_auction_start_time_base + 3 + 1) % 256;
  skip
}

/* Closing Auction Start Time to the wire, 4 bytes from where the cursor stands */
inline encode_closing_auction_start_time(closing_auction_start_time_record) {
  wire[at] = closing_auction_start_time_record.hours; at = at + 1;
  wire[at] = closing_auction_start_time_record.minutes; at = at + 1;
  wire[at] = closing_auction_start_time_record.seconds; at = at + 1;
  wire[at] = closing_auction_start_time_record.unused_1; at = at + 1;
  skip
}

/* Closing Auction Start Time off the wire, 4 bytes from where the cursor stands */
inline decode_closing_auction_start_time(closing_auction_start_time_record) {
  closing_auction_start_time_record.hours = wire[at]; at = at + 1;
  closing_auction_start_time_record.minutes = wire[at]; at = at + 1;
  closing_auction_start_time_record.seconds = wire[at]; at = at + 1;
  closing_auction_start_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Closing Auction Start Time is what was written, byte for byte */
inline equal_closing_auction_start_time(closing_auction_start_time_read, closing_auction_start_time_written) {
  assert(closing_auction_start_time_read.hours == closing_auction_start_time_written.hours);
  assert(closing_auction_start_time_read.minutes == closing_auction_start_time_written.minutes);
  assert(closing_auction_start_time_read.seconds == closing_auction_start_time_written.seconds);
  assert(closing_auction_start_time_read.unused_1 == closing_auction_start_time_written.unused_1);
  skip
}

/* ---- Closing Auction Close Time: 4 bytes ------------------------------------- */

/* Closing Auction Close Time */
typedef ClosingAuctionCloseTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Closing Auction Close Time set to one value */
inline fill_closing_auction_close_time(closing_auction_close_time_record, closing_auction_close_time_value) {
  closing_auction_close_time_record.hours = closing_auction_close_time_value;
  closing_auction_close_time_record.minutes = closing_auction_close_time_value;
  closing_auction_close_time_record.seconds = closing_auction_close_time_value;
  closing_auction_close_time_record.unused_1 = closing_auction_close_time_value;
  skip
}

/* each byte of Closing Auction Close Time set to where it lies, so a field read out of place says so */
inline ramp_closing_auction_close_time(closing_auction_close_time_record, closing_auction_close_time_base) {
  closing_auction_close_time_record.hours = (closing_auction_close_time_base + 0 + 1) % 256;
  closing_auction_close_time_record.minutes = (closing_auction_close_time_base + 1 + 1) % 256;
  closing_auction_close_time_record.seconds = (closing_auction_close_time_base + 2 + 1) % 256;
  closing_auction_close_time_record.unused_1 = (closing_auction_close_time_base + 3 + 1) % 256;
  skip
}

/* Closing Auction Close Time to the wire, 4 bytes from where the cursor stands */
inline encode_closing_auction_close_time(closing_auction_close_time_record) {
  wire[at] = closing_auction_close_time_record.hours; at = at + 1;
  wire[at] = closing_auction_close_time_record.minutes; at = at + 1;
  wire[at] = closing_auction_close_time_record.seconds; at = at + 1;
  wire[at] = closing_auction_close_time_record.unused_1; at = at + 1;
  skip
}

/* Closing Auction Close Time off the wire, 4 bytes from where the cursor stands */
inline decode_closing_auction_close_time(closing_auction_close_time_record) {
  closing_auction_close_time_record.hours = wire[at]; at = at + 1;
  closing_auction_close_time_record.minutes = wire[at]; at = at + 1;
  closing_auction_close_time_record.seconds = wire[at]; at = at + 1;
  closing_auction_close_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Closing Auction Close Time is what was written, byte for byte */
inline equal_closing_auction_close_time(closing_auction_close_time_read, closing_auction_close_time_written) {
  assert(closing_auction_close_time_read.hours == closing_auction_close_time_written.hours);
  assert(closing_auction_close_time_read.minutes == closing_auction_close_time_written.minutes);
  assert(closing_auction_close_time_read.seconds == closing_auction_close_time_written.seconds);
  assert(closing_auction_close_time_read.unused_1 == closing_auction_close_time_written.unused_1);
  skip
}

/* ---- Contract Open Time: 4 bytes --------------------------------------------- */

/* Contract Open Time */
typedef ContractOpenTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Contract Open Time set to one value */
inline fill_contract_open_time(contract_open_time_record, contract_open_time_value) {
  contract_open_time_record.hours = contract_open_time_value;
  contract_open_time_record.minutes = contract_open_time_value;
  contract_open_time_record.seconds = contract_open_time_value;
  contract_open_time_record.unused_1 = contract_open_time_value;
  skip
}

/* each byte of Contract Open Time set to where it lies, so a field read out of place says so */
inline ramp_contract_open_time(contract_open_time_record, contract_open_time_base) {
  contract_open_time_record.hours = (contract_open_time_base + 0 + 1) % 256;
  contract_open_time_record.minutes = (contract_open_time_base + 1 + 1) % 256;
  contract_open_time_record.seconds = (contract_open_time_base + 2 + 1) % 256;
  contract_open_time_record.unused_1 = (contract_open_time_base + 3 + 1) % 256;
  skip
}

/* Contract Open Time to the wire, 4 bytes from where the cursor stands */
inline encode_contract_open_time(contract_open_time_record) {
  wire[at] = contract_open_time_record.hours; at = at + 1;
  wire[at] = contract_open_time_record.minutes; at = at + 1;
  wire[at] = contract_open_time_record.seconds; at = at + 1;
  wire[at] = contract_open_time_record.unused_1; at = at + 1;
  skip
}

/* Contract Open Time off the wire, 4 bytes from where the cursor stands */
inline decode_contract_open_time(contract_open_time_record) {
  contract_open_time_record.hours = wire[at]; at = at + 1;
  contract_open_time_record.minutes = wire[at]; at = at + 1;
  contract_open_time_record.seconds = wire[at]; at = at + 1;
  contract_open_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Contract Open Time is what was written, byte for byte */
inline equal_contract_open_time(contract_open_time_read, contract_open_time_written) {
  assert(contract_open_time_read.hours == contract_open_time_written.hours);
  assert(contract_open_time_read.minutes == contract_open_time_written.minutes);
  assert(contract_open_time_read.seconds == contract_open_time_written.seconds);
  assert(contract_open_time_read.unused_1 == contract_open_time_written.unused_1);
  skip
}

/* ---- Contract Close Time: 4 bytes -------------------------------------------- */

/* Contract Close Time */
typedef ContractCloseTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Contract Close Time set to one value */
inline fill_contract_close_time(contract_close_time_record, contract_close_time_value) {
  contract_close_time_record.hours = contract_close_time_value;
  contract_close_time_record.minutes = contract_close_time_value;
  contract_close_time_record.seconds = contract_close_time_value;
  contract_close_time_record.unused_1 = contract_close_time_value;
  skip
}

/* each byte of Contract Close Time set to where it lies, so a field read out of place says so */
inline ramp_contract_close_time(contract_close_time_record, contract_close_time_base) {
  contract_close_time_record.hours = (contract_close_time_base + 0 + 1) % 256;
  contract_close_time_record.minutes = (contract_close_time_base + 1 + 1) % 256;
  contract_close_time_record.seconds = (contract_close_time_base + 2 + 1) % 256;
  contract_close_time_record.unused_1 = (contract_close_time_base + 3 + 1) % 256;
  skip
}

/* Contract Close Time to the wire, 4 bytes from where the cursor stands */
inline encode_contract_close_time(contract_close_time_record) {
  wire[at] = contract_close_time_record.hours; at = at + 1;
  wire[at] = contract_close_time_record.minutes; at = at + 1;
  wire[at] = contract_close_time_record.seconds; at = at + 1;
  wire[at] = contract_close_time_record.unused_1; at = at + 1;
  skip
}

/* Contract Close Time off the wire, 4 bytes from where the cursor stands */
inline decode_contract_close_time(contract_close_time_record) {
  contract_close_time_record.hours = wire[at]; at = at + 1;
  contract_close_time_record.minutes = wire[at]; at = at + 1;
  contract_close_time_record.seconds = wire[at]; at = at + 1;
  contract_close_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Contract Close Time is what was written, byte for byte */
inline equal_contract_close_time(contract_close_time_read, contract_close_time_written) {
  assert(contract_close_time_read.hours == contract_close_time_written.hours);
  assert(contract_close_time_read.minutes == contract_close_time_written.minutes);
  assert(contract_close_time_read.seconds == contract_close_time_written.seconds);
  assert(contract_close_time_read.unused_1 == contract_close_time_written.unused_1);
  skip
}

/* ---- Intraday Auction One Start Time: 4 bytes -------------------------------- */

/* Intraday Auction One Start Time */
typedef IntradayAuctionOneStartTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Intraday Auction One Start Time set to one value */
inline fill_intraday_auction_one_start_time(intraday_auction_one_start_time_record, intraday_auction_one_start_time_value) {
  intraday_auction_one_start_time_record.hours = intraday_auction_one_start_time_value;
  intraday_auction_one_start_time_record.minutes = intraday_auction_one_start_time_value;
  intraday_auction_one_start_time_record.seconds = intraday_auction_one_start_time_value;
  intraday_auction_one_start_time_record.unused_1 = intraday_auction_one_start_time_value;
  skip
}

/* each byte of Intraday Auction One Start Time set to where it lies, so a field read out of place says so */
inline ramp_intraday_auction_one_start_time(intraday_auction_one_start_time_record, intraday_auction_one_start_time_base) {
  intraday_auction_one_start_time_record.hours = (intraday_auction_one_start_time_base + 0 + 1) % 256;
  intraday_auction_one_start_time_record.minutes = (intraday_auction_one_start_time_base + 1 + 1) % 256;
  intraday_auction_one_start_time_record.seconds = (intraday_auction_one_start_time_base + 2 + 1) % 256;
  intraday_auction_one_start_time_record.unused_1 = (intraday_auction_one_start_time_base + 3 + 1) % 256;
  skip
}

/* Intraday Auction One Start Time to the wire, 4 bytes from where the cursor stands */
inline encode_intraday_auction_one_start_time(intraday_auction_one_start_time_record) {
  wire[at] = intraday_auction_one_start_time_record.hours; at = at + 1;
  wire[at] = intraday_auction_one_start_time_record.minutes; at = at + 1;
  wire[at] = intraday_auction_one_start_time_record.seconds; at = at + 1;
  wire[at] = intraday_auction_one_start_time_record.unused_1; at = at + 1;
  skip
}

/* Intraday Auction One Start Time off the wire, 4 bytes from where the cursor stands */
inline decode_intraday_auction_one_start_time(intraday_auction_one_start_time_record) {
  intraday_auction_one_start_time_record.hours = wire[at]; at = at + 1;
  intraday_auction_one_start_time_record.minutes = wire[at]; at = at + 1;
  intraday_auction_one_start_time_record.seconds = wire[at]; at = at + 1;
  intraday_auction_one_start_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Intraday Auction One Start Time is what was written, byte for byte */
inline equal_intraday_auction_one_start_time(intraday_auction_one_start_time_read, intraday_auction_one_start_time_written) {
  assert(intraday_auction_one_start_time_read.hours == intraday_auction_one_start_time_written.hours);
  assert(intraday_auction_one_start_time_read.minutes == intraday_auction_one_start_time_written.minutes);
  assert(intraday_auction_one_start_time_read.seconds == intraday_auction_one_start_time_written.seconds);
  assert(intraday_auction_one_start_time_read.unused_1 == intraday_auction_one_start_time_written.unused_1);
  skip
}

/* ---- Intraday Auction One Auction Close Time: 4 bytes ------------------------ */

/* Intraday Auction One Auction Close Time */
typedef IntradayAuctionOneAuctionCloseTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Intraday Auction One Auction Close Time set to one value */
inline fill_intraday_auction_one_auction_close_time(intraday_auction_one_auction_close_time_record, intraday_auction_one_auction_close_time_value) {
  intraday_auction_one_auction_close_time_record.hours = intraday_auction_one_auction_close_time_value;
  intraday_auction_one_auction_close_time_record.minutes = intraday_auction_one_auction_close_time_value;
  intraday_auction_one_auction_close_time_record.seconds = intraday_auction_one_auction_close_time_value;
  intraday_auction_one_auction_close_time_record.unused_1 = intraday_auction_one_auction_close_time_value;
  skip
}

/* each byte of Intraday Auction One Auction Close Time set to where it lies, so a field read out of place says so */
inline ramp_intraday_auction_one_auction_close_time(intraday_auction_one_auction_close_time_record, intraday_auction_one_auction_close_time_base) {
  intraday_auction_one_auction_close_time_record.hours = (intraday_auction_one_auction_close_time_base + 0 + 1) % 256;
  intraday_auction_one_auction_close_time_record.minutes = (intraday_auction_one_auction_close_time_base + 1 + 1) % 256;
  intraday_auction_one_auction_close_time_record.seconds = (intraday_auction_one_auction_close_time_base + 2 + 1) % 256;
  intraday_auction_one_auction_close_time_record.unused_1 = (intraday_auction_one_auction_close_time_base + 3 + 1) % 256;
  skip
}

/* Intraday Auction One Auction Close Time to the wire, 4 bytes from where the cursor stands */
inline encode_intraday_auction_one_auction_close_time(intraday_auction_one_auction_close_time_record) {
  wire[at] = intraday_auction_one_auction_close_time_record.hours; at = at + 1;
  wire[at] = intraday_auction_one_auction_close_time_record.minutes; at = at + 1;
  wire[at] = intraday_auction_one_auction_close_time_record.seconds; at = at + 1;
  wire[at] = intraday_auction_one_auction_close_time_record.unused_1; at = at + 1;
  skip
}

/* Intraday Auction One Auction Close Time off the wire, 4 bytes from where the cursor stands */
inline decode_intraday_auction_one_auction_close_time(intraday_auction_one_auction_close_time_record) {
  intraday_auction_one_auction_close_time_record.hours = wire[at]; at = at + 1;
  intraday_auction_one_auction_close_time_record.minutes = wire[at]; at = at + 1;
  intraday_auction_one_auction_close_time_record.seconds = wire[at]; at = at + 1;
  intraday_auction_one_auction_close_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Intraday Auction One Auction Close Time is what was written, byte for byte */
inline equal_intraday_auction_one_auction_close_time(intraday_auction_one_auction_close_time_read, intraday_auction_one_auction_close_time_written) {
  assert(intraday_auction_one_auction_close_time_read.hours == intraday_auction_one_auction_close_time_written.hours);
  assert(intraday_auction_one_auction_close_time_read.minutes == intraday_auction_one_auction_close_time_written.minutes);
  assert(intraday_auction_one_auction_close_time_read.seconds == intraday_auction_one_auction_close_time_written.seconds);
  assert(intraday_auction_one_auction_close_time_read.unused_1 == intraday_auction_one_auction_close_time_written.unused_1);
  skip
}

/* ---- Intraday Auction Two Start Time: 4 bytes -------------------------------- */

/* Intraday Auction Two Start Time */
typedef IntradayAuctionTwoStartTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Intraday Auction Two Start Time set to one value */
inline fill_intraday_auction_two_start_time(intraday_auction_two_start_time_record, intraday_auction_two_start_time_value) {
  intraday_auction_two_start_time_record.hours = intraday_auction_two_start_time_value;
  intraday_auction_two_start_time_record.minutes = intraday_auction_two_start_time_value;
  intraday_auction_two_start_time_record.seconds = intraday_auction_two_start_time_value;
  intraday_auction_two_start_time_record.unused_1 = intraday_auction_two_start_time_value;
  skip
}

/* each byte of Intraday Auction Two Start Time set to where it lies, so a field read out of place says so */
inline ramp_intraday_auction_two_start_time(intraday_auction_two_start_time_record, intraday_auction_two_start_time_base) {
  intraday_auction_two_start_time_record.hours = (intraday_auction_two_start_time_base + 0 + 1) % 256;
  intraday_auction_two_start_time_record.minutes = (intraday_auction_two_start_time_base + 1 + 1) % 256;
  intraday_auction_two_start_time_record.seconds = (intraday_auction_two_start_time_base + 2 + 1) % 256;
  intraday_auction_two_start_time_record.unused_1 = (intraday_auction_two_start_time_base + 3 + 1) % 256;
  skip
}

/* Intraday Auction Two Start Time to the wire, 4 bytes from where the cursor stands */
inline encode_intraday_auction_two_start_time(intraday_auction_two_start_time_record) {
  wire[at] = intraday_auction_two_start_time_record.hours; at = at + 1;
  wire[at] = intraday_auction_two_start_time_record.minutes; at = at + 1;
  wire[at] = intraday_auction_two_start_time_record.seconds; at = at + 1;
  wire[at] = intraday_auction_two_start_time_record.unused_1; at = at + 1;
  skip
}

/* Intraday Auction Two Start Time off the wire, 4 bytes from where the cursor stands */
inline decode_intraday_auction_two_start_time(intraday_auction_two_start_time_record) {
  intraday_auction_two_start_time_record.hours = wire[at]; at = at + 1;
  intraday_auction_two_start_time_record.minutes = wire[at]; at = at + 1;
  intraday_auction_two_start_time_record.seconds = wire[at]; at = at + 1;
  intraday_auction_two_start_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Intraday Auction Two Start Time is what was written, byte for byte */
inline equal_intraday_auction_two_start_time(intraday_auction_two_start_time_read, intraday_auction_two_start_time_written) {
  assert(intraday_auction_two_start_time_read.hours == intraday_auction_two_start_time_written.hours);
  assert(intraday_auction_two_start_time_read.minutes == intraday_auction_two_start_time_written.minutes);
  assert(intraday_auction_two_start_time_read.seconds == intraday_auction_two_start_time_written.seconds);
  assert(intraday_auction_two_start_time_read.unused_1 == intraday_auction_two_start_time_written.unused_1);
  skip
}

/* ---- Intraday Auction Two Auction Close Time: 4 bytes ------------------------ */

/* Intraday Auction Two Auction Close Time */
typedef IntradayAuctionTwoAuctionCloseTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Intraday Auction Two Auction Close Time set to one value */
inline fill_intraday_auction_two_auction_close_time(intraday_auction_two_auction_close_time_record, intraday_auction_two_auction_close_time_value) {
  intraday_auction_two_auction_close_time_record.hours = intraday_auction_two_auction_close_time_value;
  intraday_auction_two_auction_close_time_record.minutes = intraday_auction_two_auction_close_time_value;
  intraday_auction_two_auction_close_time_record.seconds = intraday_auction_two_auction_close_time_value;
  intraday_auction_two_auction_close_time_record.unused_1 = intraday_auction_two_auction_close_time_value;
  skip
}

/* each byte of Intraday Auction Two Auction Close Time set to where it lies, so a field read out of place says so */
inline ramp_intraday_auction_two_auction_close_time(intraday_auction_two_auction_close_time_record, intraday_auction_two_auction_close_time_base) {
  intraday_auction_two_auction_close_time_record.hours = (intraday_auction_two_auction_close_time_base + 0 + 1) % 256;
  intraday_auction_two_auction_close_time_record.minutes = (intraday_auction_two_auction_close_time_base + 1 + 1) % 256;
  intraday_auction_two_auction_close_time_record.seconds = (intraday_auction_two_auction_close_time_base + 2 + 1) % 256;
  intraday_auction_two_auction_close_time_record.unused_1 = (intraday_auction_two_auction_close_time_base + 3 + 1) % 256;
  skip
}

/* Intraday Auction Two Auction Close Time to the wire, 4 bytes from where the cursor stands */
inline encode_intraday_auction_two_auction_close_time(intraday_auction_two_auction_close_time_record) {
  wire[at] = intraday_auction_two_auction_close_time_record.hours; at = at + 1;
  wire[at] = intraday_auction_two_auction_close_time_record.minutes; at = at + 1;
  wire[at] = intraday_auction_two_auction_close_time_record.seconds; at = at + 1;
  wire[at] = intraday_auction_two_auction_close_time_record.unused_1; at = at + 1;
  skip
}

/* Intraday Auction Two Auction Close Time off the wire, 4 bytes from where the cursor stands */
inline decode_intraday_auction_two_auction_close_time(intraday_auction_two_auction_close_time_record) {
  intraday_auction_two_auction_close_time_record.hours = wire[at]; at = at + 1;
  intraday_auction_two_auction_close_time_record.minutes = wire[at]; at = at + 1;
  intraday_auction_two_auction_close_time_record.seconds = wire[at]; at = at + 1;
  intraday_auction_two_auction_close_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Intraday Auction Two Auction Close Time is what was written, byte for byte */
inline equal_intraday_auction_two_auction_close_time(intraday_auction_two_auction_close_time_read, intraday_auction_two_auction_close_time_written) {
  assert(intraday_auction_two_auction_close_time_read.hours == intraday_auction_two_auction_close_time_written.hours);
  assert(intraday_auction_two_auction_close_time_read.minutes == intraday_auction_two_auction_close_time_written.minutes);
  assert(intraday_auction_two_auction_close_time_read.seconds == intraday_auction_two_auction_close_time_written.seconds);
  assert(intraday_auction_two_auction_close_time_read.unused_1 == intraday_auction_two_auction_close_time_written.unused_1);
  skip
}

/* ---- Intraday Auction Three Start Time: 4 bytes ------------------------------ */

/* Intraday Auction Three Start Time */
typedef IntradayAuctionThreeStartTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Intraday Auction Three Start Time set to one value */
inline fill_intraday_auction_three_start_time(intraday_auction_three_start_time_record, intraday_auction_three_start_time_value) {
  intraday_auction_three_start_time_record.hours = intraday_auction_three_start_time_value;
  intraday_auction_three_start_time_record.minutes = intraday_auction_three_start_time_value;
  intraday_auction_three_start_time_record.seconds = intraday_auction_three_start_time_value;
  intraday_auction_three_start_time_record.unused_1 = intraday_auction_three_start_time_value;
  skip
}

/* each byte of Intraday Auction Three Start Time set to where it lies, so a field read out of place says so */
inline ramp_intraday_auction_three_start_time(intraday_auction_three_start_time_record, intraday_auction_three_start_time_base) {
  intraday_auction_three_start_time_record.hours = (intraday_auction_three_start_time_base + 0 + 1) % 256;
  intraday_auction_three_start_time_record.minutes = (intraday_auction_three_start_time_base + 1 + 1) % 256;
  intraday_auction_three_start_time_record.seconds = (intraday_auction_three_start_time_base + 2 + 1) % 256;
  intraday_auction_three_start_time_record.unused_1 = (intraday_auction_three_start_time_base + 3 + 1) % 256;
  skip
}

/* Intraday Auction Three Start Time to the wire, 4 bytes from where the cursor stands */
inline encode_intraday_auction_three_start_time(intraday_auction_three_start_time_record) {
  wire[at] = intraday_auction_three_start_time_record.hours; at = at + 1;
  wire[at] = intraday_auction_three_start_time_record.minutes; at = at + 1;
  wire[at] = intraday_auction_three_start_time_record.seconds; at = at + 1;
  wire[at] = intraday_auction_three_start_time_record.unused_1; at = at + 1;
  skip
}

/* Intraday Auction Three Start Time off the wire, 4 bytes from where the cursor stands */
inline decode_intraday_auction_three_start_time(intraday_auction_three_start_time_record) {
  intraday_auction_three_start_time_record.hours = wire[at]; at = at + 1;
  intraday_auction_three_start_time_record.minutes = wire[at]; at = at + 1;
  intraday_auction_three_start_time_record.seconds = wire[at]; at = at + 1;
  intraday_auction_three_start_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Intraday Auction Three Start Time is what was written, byte for byte */
inline equal_intraday_auction_three_start_time(intraday_auction_three_start_time_read, intraday_auction_three_start_time_written) {
  assert(intraday_auction_three_start_time_read.hours == intraday_auction_three_start_time_written.hours);
  assert(intraday_auction_three_start_time_read.minutes == intraday_auction_three_start_time_written.minutes);
  assert(intraday_auction_three_start_time_read.seconds == intraday_auction_three_start_time_written.seconds);
  assert(intraday_auction_three_start_time_read.unused_1 == intraday_auction_three_start_time_written.unused_1);
  skip
}

/* ---- Intraday Auction Three Auction Close Time: 4 bytes ---------------------- */

/* Intraday Auction Three Auction Close Time */
typedef IntradayAuctionThreeAuctionCloseTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Intraday Auction Three Auction Close Time set to one value */
inline fill_intraday_auction_three_auction_close_time(intraday_auction_three_auction_close_time_record, intraday_auction_three_auction_close_time_value) {
  intraday_auction_three_auction_close_time_record.hours = intraday_auction_three_auction_close_time_value;
  intraday_auction_three_auction_close_time_record.minutes = intraday_auction_three_auction_close_time_value;
  intraday_auction_three_auction_close_time_record.seconds = intraday_auction_three_auction_close_time_value;
  intraday_auction_three_auction_close_time_record.unused_1 = intraday_auction_three_auction_close_time_value;
  skip
}

/* each byte of Intraday Auction Three Auction Close Time set to where it lies, so a field read out of place says so */
inline ramp_intraday_auction_three_auction_close_time(intraday_auction_three_auction_close_time_record, intraday_auction_three_auction_close_time_base) {
  intraday_auction_three_auction_close_time_record.hours = (intraday_auction_three_auction_close_time_base + 0 + 1) % 256;
  intraday_auction_three_auction_close_time_record.minutes = (intraday_auction_three_auction_close_time_base + 1 + 1) % 256;
  intraday_auction_three_auction_close_time_record.seconds = (intraday_auction_three_auction_close_time_base + 2 + 1) % 256;
  intraday_auction_three_auction_close_time_record.unused_1 = (intraday_auction_three_auction_close_time_base + 3 + 1) % 256;
  skip
}

/* Intraday Auction Three Auction Close Time to the wire, 4 bytes from where the cursor stands */
inline encode_intraday_auction_three_auction_close_time(intraday_auction_three_auction_close_time_record) {
  wire[at] = intraday_auction_three_auction_close_time_record.hours; at = at + 1;
  wire[at] = intraday_auction_three_auction_close_time_record.minutes; at = at + 1;
  wire[at] = intraday_auction_three_auction_close_time_record.seconds; at = at + 1;
  wire[at] = intraday_auction_three_auction_close_time_record.unused_1; at = at + 1;
  skip
}

/* Intraday Auction Three Auction Close Time off the wire, 4 bytes from where the cursor stands */
inline decode_intraday_auction_three_auction_close_time(intraday_auction_three_auction_close_time_record) {
  intraday_auction_three_auction_close_time_record.hours = wire[at]; at = at + 1;
  intraday_auction_three_auction_close_time_record.minutes = wire[at]; at = at + 1;
  intraday_auction_three_auction_close_time_record.seconds = wire[at]; at = at + 1;
  intraday_auction_three_auction_close_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Intraday Auction Three Auction Close Time is what was written, byte for byte */
inline equal_intraday_auction_three_auction_close_time(intraday_auction_three_auction_close_time_read, intraday_auction_three_auction_close_time_written) {
  assert(intraday_auction_three_auction_close_time_read.hours == intraday_auction_three_auction_close_time_written.hours);
  assert(intraday_auction_three_auction_close_time_read.minutes == intraday_auction_three_auction_close_time_written.minutes);
  assert(intraday_auction_three_auction_close_time_read.seconds == intraday_auction_three_auction_close_time_written.seconds);
  assert(intraday_auction_three_auction_close_time_read.unused_1 == intraday_auction_three_auction_close_time_written.unused_1);
  skip
}

/* ---- Overnight Admin Open Time: 4 bytes -------------------------------------- */

/* Overnight Admin Open Time */
typedef OvernightAdminOpenTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Overnight Admin Open Time set to one value */
inline fill_overnight_admin_open_time(overnight_admin_open_time_record, overnight_admin_open_time_value) {
  overnight_admin_open_time_record.hours = overnight_admin_open_time_value;
  overnight_admin_open_time_record.minutes = overnight_admin_open_time_value;
  overnight_admin_open_time_record.seconds = overnight_admin_open_time_value;
  overnight_admin_open_time_record.unused_1 = overnight_admin_open_time_value;
  skip
}

/* each byte of Overnight Admin Open Time set to where it lies, so a field read out of place says so */
inline ramp_overnight_admin_open_time(overnight_admin_open_time_record, overnight_admin_open_time_base) {
  overnight_admin_open_time_record.hours = (overnight_admin_open_time_base + 0 + 1) % 256;
  overnight_admin_open_time_record.minutes = (overnight_admin_open_time_base + 1 + 1) % 256;
  overnight_admin_open_time_record.seconds = (overnight_admin_open_time_base + 2 + 1) % 256;
  overnight_admin_open_time_record.unused_1 = (overnight_admin_open_time_base + 3 + 1) % 256;
  skip
}

/* Overnight Admin Open Time to the wire, 4 bytes from where the cursor stands */
inline encode_overnight_admin_open_time(overnight_admin_open_time_record) {
  wire[at] = overnight_admin_open_time_record.hours; at = at + 1;
  wire[at] = overnight_admin_open_time_record.minutes; at = at + 1;
  wire[at] = overnight_admin_open_time_record.seconds; at = at + 1;
  wire[at] = overnight_admin_open_time_record.unused_1; at = at + 1;
  skip
}

/* Overnight Admin Open Time off the wire, 4 bytes from where the cursor stands */
inline decode_overnight_admin_open_time(overnight_admin_open_time_record) {
  overnight_admin_open_time_record.hours = wire[at]; at = at + 1;
  overnight_admin_open_time_record.minutes = wire[at]; at = at + 1;
  overnight_admin_open_time_record.seconds = wire[at]; at = at + 1;
  overnight_admin_open_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Overnight Admin Open Time is what was written, byte for byte */
inline equal_overnight_admin_open_time(overnight_admin_open_time_read, overnight_admin_open_time_written) {
  assert(overnight_admin_open_time_read.hours == overnight_admin_open_time_written.hours);
  assert(overnight_admin_open_time_read.minutes == overnight_admin_open_time_written.minutes);
  assert(overnight_admin_open_time_read.seconds == overnight_admin_open_time_written.seconds);
  assert(overnight_admin_open_time_read.unused_1 == overnight_admin_open_time_written.unused_1);
  skip
}

/* ---- Overnight Admin Close Time: 4 bytes ------------------------------------- */

/* Overnight Admin Close Time */
typedef OvernightAdminCloseTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Overnight Admin Close Time set to one value */
inline fill_overnight_admin_close_time(overnight_admin_close_time_record, overnight_admin_close_time_value) {
  overnight_admin_close_time_record.hours = overnight_admin_close_time_value;
  overnight_admin_close_time_record.minutes = overnight_admin_close_time_value;
  overnight_admin_close_time_record.seconds = overnight_admin_close_time_value;
  overnight_admin_close_time_record.unused_1 = overnight_admin_close_time_value;
  skip
}

/* each byte of Overnight Admin Close Time set to where it lies, so a field read out of place says so */
inline ramp_overnight_admin_close_time(overnight_admin_close_time_record, overnight_admin_close_time_base) {
  overnight_admin_close_time_record.hours = (overnight_admin_close_time_base + 0 + 1) % 256;
  overnight_admin_close_time_record.minutes = (overnight_admin_close_time_base + 1 + 1) % 256;
  overnight_admin_close_time_record.seconds = (overnight_admin_close_time_base + 2 + 1) % 256;
  overnight_admin_close_time_record.unused_1 = (overnight_admin_close_time_base + 3 + 1) % 256;
  skip
}

/* Overnight Admin Close Time to the wire, 4 bytes from where the cursor stands */
inline encode_overnight_admin_close_time(overnight_admin_close_time_record) {
  wire[at] = overnight_admin_close_time_record.hours; at = at + 1;
  wire[at] = overnight_admin_close_time_record.minutes; at = at + 1;
  wire[at] = overnight_admin_close_time_record.seconds; at = at + 1;
  wire[at] = overnight_admin_close_time_record.unused_1; at = at + 1;
  skip
}

/* Overnight Admin Close Time off the wire, 4 bytes from where the cursor stands */
inline decode_overnight_admin_close_time(overnight_admin_close_time_record) {
  overnight_admin_close_time_record.hours = wire[at]; at = at + 1;
  overnight_admin_close_time_record.minutes = wire[at]; at = at + 1;
  overnight_admin_close_time_record.seconds = wire[at]; at = at + 1;
  overnight_admin_close_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Overnight Admin Close Time is what was written, byte for byte */
inline equal_overnight_admin_close_time(overnight_admin_close_time_read, overnight_admin_close_time_written) {
  assert(overnight_admin_close_time_read.hours == overnight_admin_close_time_written.hours);
  assert(overnight_admin_close_time_read.minutes == overnight_admin_close_time_written.minutes);
  assert(overnight_admin_close_time_read.seconds == overnight_admin_close_time_written.seconds);
  assert(overnight_admin_close_time_read.unused_1 == overnight_admin_close_time_written.unused_1);
  skip
}

/* ---- Admin Period Close Time: 4 bytes ---------------------------------------- */

/* Admin Period Close Time */
typedef AdminPeriodCloseTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Admin Period Close Time set to one value */
inline fill_admin_period_close_time(admin_period_close_time_record, admin_period_close_time_value) {
  admin_period_close_time_record.hours = admin_period_close_time_value;
  admin_period_close_time_record.minutes = admin_period_close_time_value;
  admin_period_close_time_record.seconds = admin_period_close_time_value;
  admin_period_close_time_record.unused_1 = admin_period_close_time_value;
  skip
}

/* each byte of Admin Period Close Time set to where it lies, so a field read out of place says so */
inline ramp_admin_period_close_time(admin_period_close_time_record, admin_period_close_time_base) {
  admin_period_close_time_record.hours = (admin_period_close_time_base + 0 + 1) % 256;
  admin_period_close_time_record.minutes = (admin_period_close_time_base + 1 + 1) % 256;
  admin_period_close_time_record.seconds = (admin_period_close_time_base + 2 + 1) % 256;
  admin_period_close_time_record.unused_1 = (admin_period_close_time_base + 3 + 1) % 256;
  skip
}

/* Admin Period Close Time to the wire, 4 bytes from where the cursor stands */
inline encode_admin_period_close_time(admin_period_close_time_record) {
  wire[at] = admin_period_close_time_record.hours; at = at + 1;
  wire[at] = admin_period_close_time_record.minutes; at = at + 1;
  wire[at] = admin_period_close_time_record.seconds; at = at + 1;
  wire[at] = admin_period_close_time_record.unused_1; at = at + 1;
  skip
}

/* Admin Period Close Time off the wire, 4 bytes from where the cursor stands */
inline decode_admin_period_close_time(admin_period_close_time_record) {
  admin_period_close_time_record.hours = wire[at]; at = at + 1;
  admin_period_close_time_record.minutes = wire[at]; at = at + 1;
  admin_period_close_time_record.seconds = wire[at]; at = at + 1;
  admin_period_close_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Admin Period Close Time is what was written, byte for byte */
inline equal_admin_period_close_time(admin_period_close_time_read, admin_period_close_time_written) {
  assert(admin_period_close_time_read.hours == admin_period_close_time_written.hours);
  assert(admin_period_close_time_read.minutes == admin_period_close_time_written.minutes);
  assert(admin_period_close_time_read.seconds == admin_period_close_time_written.seconds);
  assert(admin_period_close_time_read.unused_1 == admin_period_close_time_written.unused_1);
  skip
}

/* ---- Pre Open Order Entry Open Time: 4 bytes --------------------------------- */

/* Pre-open order entry Open Time */
typedef PreOpenOrderEntryOpenTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Pre Open Order Entry Open Time set to one value */
inline fill_pre_open_order_entry_open_time(pre_open_order_entry_open_time_record, pre_open_order_entry_open_time_value) {
  pre_open_order_entry_open_time_record.hours = pre_open_order_entry_open_time_value;
  pre_open_order_entry_open_time_record.minutes = pre_open_order_entry_open_time_value;
  pre_open_order_entry_open_time_record.seconds = pre_open_order_entry_open_time_value;
  pre_open_order_entry_open_time_record.unused_1 = pre_open_order_entry_open_time_value;
  skip
}

/* each byte of Pre Open Order Entry Open Time set to where it lies, so a field read out of place says so */
inline ramp_pre_open_order_entry_open_time(pre_open_order_entry_open_time_record, pre_open_order_entry_open_time_base) {
  pre_open_order_entry_open_time_record.hours = (pre_open_order_entry_open_time_base + 0 + 1) % 256;
  pre_open_order_entry_open_time_record.minutes = (pre_open_order_entry_open_time_base + 1 + 1) % 256;
  pre_open_order_entry_open_time_record.seconds = (pre_open_order_entry_open_time_base + 2 + 1) % 256;
  pre_open_order_entry_open_time_record.unused_1 = (pre_open_order_entry_open_time_base + 3 + 1) % 256;
  skip
}

/* Pre Open Order Entry Open Time to the wire, 4 bytes from where the cursor stands */
inline encode_pre_open_order_entry_open_time(pre_open_order_entry_open_time_record) {
  wire[at] = pre_open_order_entry_open_time_record.hours; at = at + 1;
  wire[at] = pre_open_order_entry_open_time_record.minutes; at = at + 1;
  wire[at] = pre_open_order_entry_open_time_record.seconds; at = at + 1;
  wire[at] = pre_open_order_entry_open_time_record.unused_1; at = at + 1;
  skip
}

/* Pre Open Order Entry Open Time off the wire, 4 bytes from where the cursor stands */
inline decode_pre_open_order_entry_open_time(pre_open_order_entry_open_time_record) {
  pre_open_order_entry_open_time_record.hours = wire[at]; at = at + 1;
  pre_open_order_entry_open_time_record.minutes = wire[at]; at = at + 1;
  pre_open_order_entry_open_time_record.seconds = wire[at]; at = at + 1;
  pre_open_order_entry_open_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Pre Open Order Entry Open Time is what was written, byte for byte */
inline equal_pre_open_order_entry_open_time(pre_open_order_entry_open_time_read, pre_open_order_entry_open_time_written) {
  assert(pre_open_order_entry_open_time_read.hours == pre_open_order_entry_open_time_written.hours);
  assert(pre_open_order_entry_open_time_read.minutes == pre_open_order_entry_open_time_written.minutes);
  assert(pre_open_order_entry_open_time_read.seconds == pre_open_order_entry_open_time_written.seconds);
  assert(pre_open_order_entry_open_time_read.unused_1 == pre_open_order_entry_open_time_written.unused_1);
  skip
}

/* ---- Pre Open Order Entry Close Time: 4 bytes -------------------------------- */

/* Pre-open order entry Close Time */
typedef PreOpenOrderEntryCloseTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Pre Open Order Entry Close Time set to one value */
inline fill_pre_open_order_entry_close_time(pre_open_order_entry_close_time_record, pre_open_order_entry_close_time_value) {
  pre_open_order_entry_close_time_record.hours = pre_open_order_entry_close_time_value;
  pre_open_order_entry_close_time_record.minutes = pre_open_order_entry_close_time_value;
  pre_open_order_entry_close_time_record.seconds = pre_open_order_entry_close_time_value;
  pre_open_order_entry_close_time_record.unused_1 = pre_open_order_entry_close_time_value;
  skip
}

/* each byte of Pre Open Order Entry Close Time set to where it lies, so a field read out of place says so */
inline ramp_pre_open_order_entry_close_time(pre_open_order_entry_close_time_record, pre_open_order_entry_close_time_base) {
  pre_open_order_entry_close_time_record.hours = (pre_open_order_entry_close_time_base + 0 + 1) % 256;
  pre_open_order_entry_close_time_record.minutes = (pre_open_order_entry_close_time_base + 1 + 1) % 256;
  pre_open_order_entry_close_time_record.seconds = (pre_open_order_entry_close_time_base + 2 + 1) % 256;
  pre_open_order_entry_close_time_record.unused_1 = (pre_open_order_entry_close_time_base + 3 + 1) % 256;
  skip
}

/* Pre Open Order Entry Close Time to the wire, 4 bytes from where the cursor stands */
inline encode_pre_open_order_entry_close_time(pre_open_order_entry_close_time_record) {
  wire[at] = pre_open_order_entry_close_time_record.hours; at = at + 1;
  wire[at] = pre_open_order_entry_close_time_record.minutes; at = at + 1;
  wire[at] = pre_open_order_entry_close_time_record.seconds; at = at + 1;
  wire[at] = pre_open_order_entry_close_time_record.unused_1; at = at + 1;
  skip
}

/* Pre Open Order Entry Close Time off the wire, 4 bytes from where the cursor stands */
inline decode_pre_open_order_entry_close_time(pre_open_order_entry_close_time_record) {
  pre_open_order_entry_close_time_record.hours = wire[at]; at = at + 1;
  pre_open_order_entry_close_time_record.minutes = wire[at]; at = at + 1;
  pre_open_order_entry_close_time_record.seconds = wire[at]; at = at + 1;
  pre_open_order_entry_close_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Pre Open Order Entry Close Time is what was written, byte for byte */
inline equal_pre_open_order_entry_close_time(pre_open_order_entry_close_time_read, pre_open_order_entry_close_time_written) {
  assert(pre_open_order_entry_close_time_read.hours == pre_open_order_entry_close_time_written.hours);
  assert(pre_open_order_entry_close_time_read.minutes == pre_open_order_entry_close_time_written.minutes);
  assert(pre_open_order_entry_close_time_read.seconds == pre_open_order_entry_close_time_written.seconds);
  assert(pre_open_order_entry_close_time_read.unused_1 == pre_open_order_entry_close_time_written.unused_1);
  skip
}

/* ---- Trading Sessions: 144 bytes --------------------------------------------- */

/* Trading Sessions */
typedef TradingSessions {
  byte trading_session_sequence[4];
  TradingSessionName trading_session_name;
  OpeningAuctionStartTime opening_auction_s_pmsbx6;
  OpeningAuctionCloseTime opening_auction_c_t8yye6;
  ClosingAuctionStartTime closing_auction_s_eotkzn;
  ClosingAuctionCloseTime closing_auction_c_h4ja4r;
  ContractOpenTime contract_open_time;
  ContractCloseTime contract_close_time;
  IntradayAuctionOneStartTime intraday_auction__8i8w73;
  IntradayAuctionOneAuctionCloseTime intraday_auction__skt4cx;
  IntradayAuctionTwoStartTime intraday_auction__m1vsq1;
  IntradayAuctionTwoAuctionCloseTime intraday_auction__j52gr3;
  IntradayAuctionThreeStartTime intraday_auction__uxipmv;
  IntradayAuctionThreeAuctionCloseTime intraday_auction__k9xqgp;
  OvernightAdminOpenTime overnight_admin_o_ha4sc4;
  OvernightAdminCloseTime overnight_admin_c_u1mx94;
  AdminPeriodCloseTime admin_period_close_time;
  byte unused_8[8];
  PreOpenOrderEntryOpenTime pre_open_order_en_vxms34;
  PreOpenOrderEntryCloseTime pre_open_order_en_z7zbt8;
  byte second_unused_8[8]
};

int trading_sessions_at;

/* every byte of Trading Sessions set to one value */
inline fill_trading_sessions(trading_sessions_record, trading_sessions_value) {
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 4 -> trading_sessions_record.trading_session_sequence[trading_sessions_at] = trading_sessions_value; trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  fill_trading_session_name(trading_sessions_record.trading_session_name, trading_sessions_value);
  fill_opening_auction_start_time(trading_sessions_record.opening_auction_s_pmsbx6, trading_sessions_value);
  fill_opening_auction_close_time(trading_sessions_record.opening_auction_c_t8yye6, trading_sessions_value);
  fill_closing_auction_start_time(trading_sessions_record.closing_auction_s_eotkzn, trading_sessions_value);
  fill_closing_auction_close_time(trading_sessions_record.closing_auction_c_h4ja4r, trading_sessions_value);
  fill_contract_open_time(trading_sessions_record.contract_open_time, trading_sessions_value);
  fill_contract_close_time(trading_sessions_record.contract_close_time, trading_sessions_value);
  fill_intraday_auction_one_start_time(trading_sessions_record.intraday_auction__8i8w73, trading_sessions_value);
  fill_intraday_auction_one_auction_close_time(trading_sessions_record.intraday_auction__skt4cx, trading_sessions_value);
  fill_intraday_auction_two_start_time(trading_sessions_record.intraday_auction__m1vsq1, trading_sessions_value);
  fill_intraday_auction_two_auction_close_time(trading_sessions_record.intraday_auction__j52gr3, trading_sessions_value);
  fill_intraday_auction_three_start_time(trading_sessions_record.intraday_auction__uxipmv, trading_sessions_value);
  fill_intraday_auction_three_auction_close_time(trading_sessions_record.intraday_auction__k9xqgp, trading_sessions_value);
  fill_overnight_admin_open_time(trading_sessions_record.overnight_admin_o_ha4sc4, trading_sessions_value);
  fill_overnight_admin_close_time(trading_sessions_record.overnight_admin_c_u1mx94, trading_sessions_value);
  fill_admin_period_close_time(trading_sessions_record.admin_period_close_time, trading_sessions_value);
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 8 -> trading_sessions_record.unused_8[trading_sessions_at] = trading_sessions_value; trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  fill_pre_open_order_entry_open_time(trading_sessions_record.pre_open_order_en_vxms34, trading_sessions_value);
  fill_pre_open_order_entry_close_time(trading_sessions_record.pre_open_order_en_z7zbt8, trading_sessions_value);
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 8 -> trading_sessions_record.second_unused_8[trading_sessions_at] = trading_sessions_value; trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Sessions set to where it lies, so a field read out of place says so */
inline ramp_trading_sessions(trading_sessions_record, trading_sessions_base) {
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 4 -> trading_sessions_record.trading_session_sequence[trading_sessions_at] = (trading_sessions_base + 0 + trading_sessions_at + 1) % 256; trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  ramp_trading_session_name(trading_sessions_record.trading_session_name, trading_sessions_base + 4);
  ramp_opening_auction_start_time(trading_sessions_record.opening_auction_s_pmsbx6, trading_sessions_base + 60);
  ramp_opening_auction_close_time(trading_sessions_record.opening_auction_c_t8yye6, trading_sessions_base + 64);
  ramp_closing_auction_start_time(trading_sessions_record.closing_auction_s_eotkzn, trading_sessions_base + 68);
  ramp_closing_auction_close_time(trading_sessions_record.closing_auction_c_h4ja4r, trading_sessions_base + 72);
  ramp_contract_open_time(trading_sessions_record.contract_open_time, trading_sessions_base + 76);
  ramp_contract_close_time(trading_sessions_record.contract_close_time, trading_sessions_base + 80);
  ramp_intraday_auction_one_start_time(trading_sessions_record.intraday_auction__8i8w73, trading_sessions_base + 84);
  ramp_intraday_auction_one_auction_close_time(trading_sessions_record.intraday_auction__skt4cx, trading_sessions_base + 88);
  ramp_intraday_auction_two_start_time(trading_sessions_record.intraday_auction__m1vsq1, trading_sessions_base + 92);
  ramp_intraday_auction_two_auction_close_time(trading_sessions_record.intraday_auction__j52gr3, trading_sessions_base + 96);
  ramp_intraday_auction_three_start_time(trading_sessions_record.intraday_auction__uxipmv, trading_sessions_base + 100);
  ramp_intraday_auction_three_auction_close_time(trading_sessions_record.intraday_auction__k9xqgp, trading_sessions_base + 104);
  ramp_overnight_admin_open_time(trading_sessions_record.overnight_admin_o_ha4sc4, trading_sessions_base + 108);
  ramp_overnight_admin_close_time(trading_sessions_record.overnight_admin_c_u1mx94, trading_sessions_base + 112);
  ramp_admin_period_close_time(trading_sessions_record.admin_period_close_time, trading_sessions_base + 116);
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 8 -> trading_sessions_record.unused_8[trading_sessions_at] = (trading_sessions_base + 120 + trading_sessions_at + 1) % 256; trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  ramp_pre_open_order_entry_open_time(trading_sessions_record.pre_open_order_en_vxms34, trading_sessions_base + 128);
  ramp_pre_open_order_entry_close_time(trading_sessions_record.pre_open_order_en_z7zbt8, trading_sessions_base + 132);
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 8 -> trading_sessions_record.second_unused_8[trading_sessions_at] = (trading_sessions_base + 136 + trading_sessions_at + 1) % 256; trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Sessions to the wire, 144 bytes from where the cursor stands */
inline encode_trading_sessions(trading_sessions_record) {
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 4 -> wire[at] = trading_sessions_record.trading_session_sequence[trading_sessions_at]; at = at + 1; trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  encode_trading_session_name(trading_sessions_record.trading_session_name);
  encode_opening_auction_start_time(trading_sessions_record.opening_auction_s_pmsbx6);
  encode_opening_auction_close_time(trading_sessions_record.opening_auction_c_t8yye6);
  encode_closing_auction_start_time(trading_sessions_record.closing_auction_s_eotkzn);
  encode_closing_auction_close_time(trading_sessions_record.closing_auction_c_h4ja4r);
  encode_contract_open_time(trading_sessions_record.contract_open_time);
  encode_contract_close_time(trading_sessions_record.contract_close_time);
  encode_intraday_auction_one_start_time(trading_sessions_record.intraday_auction__8i8w73);
  encode_intraday_auction_one_auction_close_time(trading_sessions_record.intraday_auction__skt4cx);
  encode_intraday_auction_two_start_time(trading_sessions_record.intraday_auction__m1vsq1);
  encode_intraday_auction_two_auction_close_time(trading_sessions_record.intraday_auction__j52gr3);
  encode_intraday_auction_three_start_time(trading_sessions_record.intraday_auction__uxipmv);
  encode_intraday_auction_three_auction_close_time(trading_sessions_record.intraday_auction__k9xqgp);
  encode_overnight_admin_open_time(trading_sessions_record.overnight_admin_o_ha4sc4);
  encode_overnight_admin_close_time(trading_sessions_record.overnight_admin_c_u1mx94);
  encode_admin_period_close_time(trading_sessions_record.admin_period_close_time);
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 8 -> wire[at] = trading_sessions_record.unused_8[trading_sessions_at]; at = at + 1; trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  encode_pre_open_order_entry_open_time(trading_sessions_record.pre_open_order_en_vxms34);
  encode_pre_open_order_entry_close_time(trading_sessions_record.pre_open_order_en_z7zbt8);
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 8 -> wire[at] = trading_sessions_record.second_unused_8[trading_sessions_at]; at = at + 1; trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Sessions off the wire, 144 bytes from where the cursor stands */
inline decode_trading_sessions(trading_sessions_record) {
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 4 -> trading_sessions_record.trading_session_sequence[trading_sessions_at] = wire[at]; at = at + 1; trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  decode_trading_session_name(trading_sessions_record.trading_session_name);
  decode_opening_auction_start_time(trading_sessions_record.opening_auction_s_pmsbx6);
  decode_opening_auction_close_time(trading_sessions_record.opening_auction_c_t8yye6);
  decode_closing_auction_start_time(trading_sessions_record.closing_auction_s_eotkzn);
  decode_closing_auction_close_time(trading_sessions_record.closing_auction_c_h4ja4r);
  decode_contract_open_time(trading_sessions_record.contract_open_time);
  decode_contract_close_time(trading_sessions_record.contract_close_time);
  decode_intraday_auction_one_start_time(trading_sessions_record.intraday_auction__8i8w73);
  decode_intraday_auction_one_auction_close_time(trading_sessions_record.intraday_auction__skt4cx);
  decode_intraday_auction_two_start_time(trading_sessions_record.intraday_auction__m1vsq1);
  decode_intraday_auction_two_auction_close_time(trading_sessions_record.intraday_auction__j52gr3);
  decode_intraday_auction_three_start_time(trading_sessions_record.intraday_auction__uxipmv);
  decode_intraday_auction_three_auction_close_time(trading_sessions_record.intraday_auction__k9xqgp);
  decode_overnight_admin_open_time(trading_sessions_record.overnight_admin_o_ha4sc4);
  decode_overnight_admin_close_time(trading_sessions_record.overnight_admin_c_u1mx94);
  decode_admin_period_close_time(trading_sessions_record.admin_period_close_time);
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 8 -> trading_sessions_record.unused_8[trading_sessions_at] = wire[at]; at = at + 1; trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  decode_pre_open_order_entry_open_time(trading_sessions_record.pre_open_order_en_vxms34);
  decode_pre_open_order_entry_close_time(trading_sessions_record.pre_open_order_en_z7zbt8);
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 8 -> trading_sessions_record.second_unused_8[trading_sessions_at] = wire[at]; at = at + 1; trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Sessions is what was written, byte for byte */
inline equal_trading_sessions(trading_sessions_read, trading_sessions_written) {
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 4 -> assert(trading_sessions_read.trading_session_sequence[trading_sessions_at] == trading_sessions_written.trading_session_sequence[trading_sessions_at]); trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  equal_trading_session_name(trading_sessions_read.trading_session_name, trading_sessions_written.trading_session_name);
  equal_opening_auction_start_time(trading_sessions_read.opening_auction_s_pmsbx6, trading_sessions_written.opening_auction_s_pmsbx6);
  equal_opening_auction_close_time(trading_sessions_read.opening_auction_c_t8yye6, trading_sessions_written.opening_auction_c_t8yye6);
  equal_closing_auction_start_time(trading_sessions_read.closing_auction_s_eotkzn, trading_sessions_written.closing_auction_s_eotkzn);
  equal_closing_auction_close_time(trading_sessions_read.closing_auction_c_h4ja4r, trading_sessions_written.closing_auction_c_h4ja4r);
  equal_contract_open_time(trading_sessions_read.contract_open_time, trading_sessions_written.contract_open_time);
  equal_contract_close_time(trading_sessions_read.contract_close_time, trading_sessions_written.contract_close_time);
  equal_intraday_auction_one_start_time(trading_sessions_read.intraday_auction__8i8w73, trading_sessions_written.intraday_auction__8i8w73);
  equal_intraday_auction_one_auction_close_time(trading_sessions_read.intraday_auction__skt4cx, trading_sessions_written.intraday_auction__skt4cx);
  equal_intraday_auction_two_start_time(trading_sessions_read.intraday_auction__m1vsq1, trading_sessions_written.intraday_auction__m1vsq1);
  equal_intraday_auction_two_auction_close_time(trading_sessions_read.intraday_auction__j52gr3, trading_sessions_written.intraday_auction__j52gr3);
  equal_intraday_auction_three_start_time(trading_sessions_read.intraday_auction__uxipmv, trading_sessions_written.intraday_auction__uxipmv);
  equal_intraday_auction_three_auction_close_time(trading_sessions_read.intraday_auction__k9xqgp, trading_sessions_written.intraday_auction__k9xqgp);
  equal_overnight_admin_open_time(trading_sessions_read.overnight_admin_o_ha4sc4, trading_sessions_written.overnight_admin_o_ha4sc4);
  equal_overnight_admin_close_time(trading_sessions_read.overnight_admin_c_u1mx94, trading_sessions_written.overnight_admin_c_u1mx94);
  equal_admin_period_close_time(trading_sessions_read.admin_period_close_time, trading_sessions_written.admin_period_close_time);
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 8 -> assert(trading_sessions_read.unused_8[trading_sessions_at] == trading_sessions_written.unused_8[trading_sessions_at]); trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  equal_pre_open_order_entry_open_time(trading_sessions_read.pre_open_order_en_vxms34, trading_sessions_written.pre_open_order_en_vxms34);
  equal_pre_open_order_entry_close_time(trading_sessions_read.pre_open_order_en_z7zbt8, trading_sessions_written.pre_open_order_en_z7zbt8);
  trading_sessions_at = 0;
  do
  :: trading_sessions_at < 8 -> assert(trading_sessions_read.second_unused_8[trading_sessions_at] == trading_sessions_written.second_unused_8[trading_sessions_at]); trading_sessions_at = trading_sessions_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Update Time: 4 bytes ---------------------------------------------------- */

/* Update Time */
typedef UpdateTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Update Time set to one value */
inline fill_update_time(update_time_record, update_time_value) {
  update_time_record.hours = update_time_value;
  update_time_record.minutes = update_time_value;
  update_time_record.seconds = update_time_value;
  update_time_record.unused_1 = update_time_value;
  skip
}

/* each byte of Update Time set to where it lies, so a field read out of place says so */
inline ramp_update_time(update_time_record, update_time_base) {
  update_time_record.hours = (update_time_base + 0 + 1) % 256;
  update_time_record.minutes = (update_time_base + 1 + 1) % 256;
  update_time_record.seconds = (update_time_base + 2 + 1) % 256;
  update_time_record.unused_1 = (update_time_base + 3 + 1) % 256;
  skip
}

/* Update Time to the wire, 4 bytes from where the cursor stands */
inline encode_update_time(update_time_record) {
  wire[at] = update_time_record.hours; at = at + 1;
  wire[at] = update_time_record.minutes; at = at + 1;
  wire[at] = update_time_record.seconds; at = at + 1;
  wire[at] = update_time_record.unused_1; at = at + 1;
  skip
}

/* Update Time off the wire, 4 bytes from where the cursor stands */
inline decode_update_time(update_time_record) {
  update_time_record.hours = wire[at]; at = at + 1;
  update_time_record.minutes = wire[at]; at = at + 1;
  update_time_record.seconds = wire[at]; at = at + 1;
  update_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Update Time is what was written, byte for byte */
inline equal_update_time(update_time_read, update_time_written) {
  assert(update_time_read.hours == update_time_written.hours);
  assert(update_time_read.minutes == update_time_written.minutes);
  assert(update_time_read.seconds == update_time_written.seconds);
  assert(update_time_read.unused_1 == update_time_written.unused_1);
  skip
}

/* ---- Update Date: 12 bytes --------------------------------------------------- */

/* Update Date */
typedef UpdateDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int update_date_at;

/* every byte of Update Date set to one value */
inline fill_update_date(update_date_record, update_date_value) {
  update_date_at = 0;
  do
  :: update_date_at < 4 -> update_date_record.year[update_date_at] = update_date_value; update_date_at = update_date_at + 1
  :: else -> break
  od;
  update_date_at = 0;
  do
  :: update_date_at < 4 -> update_date_record.month[update_date_at] = update_date_value; update_date_at = update_date_at + 1
  :: else -> break
  od;
  update_date_at = 0;
  do
  :: update_date_at < 4 -> update_date_record.day[update_date_at] = update_date_value; update_date_at = update_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Update Date set to where it lies, so a field read out of place says so */
inline ramp_update_date(update_date_record, update_date_base) {
  update_date_at = 0;
  do
  :: update_date_at < 4 -> update_date_record.year[update_date_at] = (update_date_base + 0 + update_date_at + 1) % 256; update_date_at = update_date_at + 1
  :: else -> break
  od;
  update_date_at = 0;
  do
  :: update_date_at < 4 -> update_date_record.month[update_date_at] = (update_date_base + 4 + update_date_at + 1) % 256; update_date_at = update_date_at + 1
  :: else -> break
  od;
  update_date_at = 0;
  do
  :: update_date_at < 4 -> update_date_record.day[update_date_at] = (update_date_base + 8 + update_date_at + 1) % 256; update_date_at = update_date_at + 1
  :: else -> break
  od;
  skip
}

/* Update Date to the wire, 12 bytes from where the cursor stands */
inline encode_update_date(update_date_record) {
  update_date_at = 0;
  do
  :: update_date_at < 4 -> wire[at] = update_date_record.year[update_date_at]; at = at + 1; update_date_at = update_date_at + 1
  :: else -> break
  od;
  update_date_at = 0;
  do
  :: update_date_at < 4 -> wire[at] = update_date_record.month[update_date_at]; at = at + 1; update_date_at = update_date_at + 1
  :: else -> break
  od;
  update_date_at = 0;
  do
  :: update_date_at < 4 -> wire[at] = update_date_record.day[update_date_at]; at = at + 1; update_date_at = update_date_at + 1
  :: else -> break
  od;
  skip
}

/* Update Date off the wire, 12 bytes from where the cursor stands */
inline decode_update_date(update_date_record) {
  update_date_at = 0;
  do
  :: update_date_at < 4 -> update_date_record.year[update_date_at] = wire[at]; at = at + 1; update_date_at = update_date_at + 1
  :: else -> break
  od;
  update_date_at = 0;
  do
  :: update_date_at < 4 -> update_date_record.month[update_date_at] = wire[at]; at = at + 1; update_date_at = update_date_at + 1
  :: else -> break
  od;
  update_date_at = 0;
  do
  :: update_date_at < 4 -> update_date_record.day[update_date_at] = wire[at]; at = at + 1; update_date_at = update_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Update Date is what was written, byte for byte */
inline equal_update_date(update_date_read, update_date_written) {
  update_date_at = 0;
  do
  :: update_date_at < 4 -> assert(update_date_read.year[update_date_at] == update_date_written.year[update_date_at]); update_date_at = update_date_at + 1
  :: else -> break
  od;
  update_date_at = 0;
  do
  :: update_date_at < 4 -> assert(update_date_read.month[update_date_at] == update_date_written.month[update_date_at]); update_date_at = update_date_at + 1
  :: else -> break
  od;
  update_date_at = 0;
  do
  :: update_date_at < 4 -> assert(update_date_read.day[update_date_at] == update_date_written.day[update_date_at]); update_date_at = update_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indices Price Data: 44 bytes -------------------------------------------- */

/* Indices Price Data */
typedef IndicesPriceData {
  byte indices_sequence[4];
  byte opening_price[8];
  byte index_price[8];
  UpdateTime update_time;
  UpdateDate update_date;
  byte market_capitalisation[8]
};

int indices_price_data_at;

/* every byte of Indices Price Data set to one value */
inline fill_indices_price_data(indices_price_data_record, indices_price_data_value) {
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 4 -> indices_price_data_record.indices_sequence[indices_price_data_at] = indices_price_data_value; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> indices_price_data_record.opening_price[indices_price_data_at] = indices_price_data_value; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> indices_price_data_record.index_price[indices_price_data_at] = indices_price_data_value; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  fill_update_time(indices_price_data_record.update_time, indices_price_data_value);
  fill_update_date(indices_price_data_record.update_date, indices_price_data_value);
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> indices_price_data_record.market_capitalisation[indices_price_data_at] = indices_price_data_value; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indices Price Data set to where it lies, so a field read out of place says so */
inline ramp_indices_price_data(indices_price_data_record, indices_price_data_base) {
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 4 -> indices_price_data_record.indices_sequence[indices_price_data_at] = (indices_price_data_base + 0 + indices_price_data_at + 1) % 256; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> indices_price_data_record.opening_price[indices_price_data_at] = (indices_price_data_base + 4 + indices_price_data_at + 1) % 256; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> indices_price_data_record.index_price[indices_price_data_at] = (indices_price_data_base + 12 + indices_price_data_at + 1) % 256; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  ramp_update_time(indices_price_data_record.update_time, indices_price_data_base + 20);
  ramp_update_date(indices_price_data_record.update_date, indices_price_data_base + 24);
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> indices_price_data_record.market_capitalisation[indices_price_data_at] = (indices_price_data_base + 36 + indices_price_data_at + 1) % 256; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  skip
}

/* Indices Price Data to the wire, 44 bytes from where the cursor stands */
inline encode_indices_price_data(indices_price_data_record) {
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 4 -> wire[at] = indices_price_data_record.indices_sequence[indices_price_data_at]; at = at + 1; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> wire[at] = indices_price_data_record.opening_price[indices_price_data_at]; at = at + 1; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> wire[at] = indices_price_data_record.index_price[indices_price_data_at]; at = at + 1; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  encode_update_time(indices_price_data_record.update_time);
  encode_update_date(indices_price_data_record.update_date);
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> wire[at] = indices_price_data_record.market_capitalisation[indices_price_data_at]; at = at + 1; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  skip
}

/* Indices Price Data off the wire, 44 bytes from where the cursor stands */
inline decode_indices_price_data(indices_price_data_record) {
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 4 -> indices_price_data_record.indices_sequence[indices_price_data_at] = wire[at]; at = at + 1; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> indices_price_data_record.opening_price[indices_price_data_at] = wire[at]; at = at + 1; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> indices_price_data_record.index_price[indices_price_data_at] = wire[at]; at = at + 1; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  decode_update_time(indices_price_data_record.update_time);
  decode_update_date(indices_price_data_record.update_date);
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> indices_price_data_record.market_capitalisation[indices_price_data_at] = wire[at]; at = at + 1; indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indices Price Data is what was written, byte for byte */
inline equal_indices_price_data(indices_price_data_read, indices_price_data_written) {
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 4 -> assert(indices_price_data_read.indices_sequence[indices_price_data_at] == indices_price_data_written.indices_sequence[indices_price_data_at]); indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> assert(indices_price_data_read.opening_price[indices_price_data_at] == indices_price_data_written.opening_price[indices_price_data_at]); indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> assert(indices_price_data_read.index_price[indices_price_data_at] == indices_price_data_written.index_price[indices_price_data_at]); indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  equal_update_time(indices_price_data_read.update_time, indices_price_data_written.update_time);
  equal_update_date(indices_price_data_read.update_date, indices_price_data_written.update_date);
  indices_price_data_at = 0;
  do
  :: indices_price_data_at < 8 -> assert(indices_price_data_read.market_capitalisation[indices_price_data_at] == indices_price_data_written.market_capitalisation[indices_price_data_at]); indices_price_data_at = indices_price_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indices Code: 20 bytes -------------------------------------------------- */

/* Indicates the short code for this index. */
typedef IndicesCode {
  byte indices_code_length_byte;
  byte indices_code_characters[19]
};

int indices_code_at;

/* every byte of Indices Code set to one value */
inline fill_indices_code(indices_code_record, indices_code_value) {
  indices_code_record.indices_code_length_byte = indices_code_value;
  indices_code_at = 0;
  do
  :: indices_code_at < 19 -> indices_code_record.indices_code_characters[indices_code_at] = indices_code_value; indices_code_at = indices_code_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indices Code set to where it lies, so a field read out of place says so */
inline ramp_indices_code(indices_code_record, indices_code_base) {
  indices_code_record.indices_code_length_byte = (indices_code_base + 0 + 1) % 256;
  indices_code_at = 0;
  do
  :: indices_code_at < 19 -> indices_code_record.indices_code_characters[indices_code_at] = (indices_code_base + 1 + indices_code_at + 1) % 256; indices_code_at = indices_code_at + 1
  :: else -> break
  od;
  skip
}

/* Indices Code to the wire, 20 bytes from where the cursor stands */
inline encode_indices_code(indices_code_record) {
  wire[at] = indices_code_record.indices_code_length_byte; at = at + 1;
  indices_code_at = 0;
  do
  :: indices_code_at < 19 -> wire[at] = indices_code_record.indices_code_characters[indices_code_at]; at = at + 1; indices_code_at = indices_code_at + 1
  :: else -> break
  od;
  skip
}

/* Indices Code off the wire, 20 bytes from where the cursor stands */
inline decode_indices_code(indices_code_record) {
  indices_code_record.indices_code_length_byte = wire[at]; at = at + 1;
  indices_code_at = 0;
  do
  :: indices_code_at < 19 -> indices_code_record.indices_code_characters[indices_code_at] = wire[at]; at = at + 1; indices_code_at = indices_code_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indices Code is what was written, byte for byte */
inline equal_indices_code(indices_code_read, indices_code_written) {
  assert(indices_code_read.indices_code_length_byte == indices_code_written.indices_code_length_byte);
  indices_code_at = 0;
  do
  :: indices_code_at < 19 -> assert(indices_code_read.indices_code_characters[indices_code_at] == indices_code_written.indices_code_characters[indices_code_at]); indices_code_at = indices_code_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indices Description: 50 bytes ------------------------------------------- */

/* Provides a description for the index. */
typedef IndicesDescription {
  byte indices_description_length_byte;
  byte indices_description_characters[49]
};

int indices_description_at;

/* every byte of Indices Description set to one value */
inline fill_indices_description(indices_description_record, indices_description_value) {
  indices_description_record.indices_description_length_byte = indices_description_value;
  indices_description_at = 0;
  do
  :: indices_description_at < 49 -> indices_description_record.indices_description_characters[indices_description_at] = indices_description_value; indices_description_at = indices_description_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indices Description set to where it lies, so a field read out of place says so */
inline ramp_indices_description(indices_description_record, indices_description_base) {
  indices_description_record.indices_description_length_byte = (indices_description_base + 0 + 1) % 256;
  indices_description_at = 0;
  do
  :: indices_description_at < 49 -> indices_description_record.indices_description_characters[indices_description_at] = (indices_description_base + 1 + indices_description_at + 1) % 256; indices_description_at = indices_description_at + 1
  :: else -> break
  od;
  skip
}

/* Indices Description to the wire, 50 bytes from where the cursor stands */
inline encode_indices_description(indices_description_record) {
  wire[at] = indices_description_record.indices_description_length_byte; at = at + 1;
  indices_description_at = 0;
  do
  :: indices_description_at < 49 -> wire[at] = indices_description_record.indices_description_characters[indices_description_at]; at = at + 1; indices_description_at = indices_description_at + 1
  :: else -> break
  od;
  skip
}

/* Indices Description off the wire, 50 bytes from where the cursor stands */
inline decode_indices_description(indices_description_record) {
  indices_description_record.indices_description_length_byte = wire[at]; at = at + 1;
  indices_description_at = 0;
  do
  :: indices_description_at < 49 -> indices_description_record.indices_description_characters[indices_description_at] = wire[at]; at = at + 1; indices_description_at = indices_description_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indices Description is what was written, byte for byte */
inline equal_indices_description(indices_description_read, indices_description_written) {
  assert(indices_description_read.indices_description_length_byte == indices_description_written.indices_description_length_byte);
  indices_description_at = 0;
  do
  :: indices_description_at < 49 -> assert(indices_description_read.indices_description_characters[indices_description_at] == indices_description_written.indices_description_characters[indices_description_at]); indices_description_at = indices_description_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indices Data: 104 bytes ------------------------------------------------- */

/* Indices Data */
typedef IndicesData {
  byte indices_sequence[4];
  IndicesCode indices_code;
  IndicesDescription indices_description;
  Classification classification
};

int indices_data_at;

/* every byte of Indices Data set to one value */
inline fill_indices_data(indices_data_record, indices_data_value) {
  indices_data_at = 0;
  do
  :: indices_data_at < 4 -> indices_data_record.indices_sequence[indices_data_at] = indices_data_value; indices_data_at = indices_data_at + 1
  :: else -> break
  od;
  fill_indices_code(indices_data_record.indices_code, indices_data_value);
  fill_indices_description(indices_data_record.indices_description, indices_data_value);
  fill_classification(indices_data_record.classification, indices_data_value);
  skip
}

/* each byte of Indices Data set to where it lies, so a field read out of place says so */
inline ramp_indices_data(indices_data_record, indices_data_base) {
  indices_data_at = 0;
  do
  :: indices_data_at < 4 -> indices_data_record.indices_sequence[indices_data_at] = (indices_data_base + 0 + indices_data_at + 1) % 256; indices_data_at = indices_data_at + 1
  :: else -> break
  od;
  ramp_indices_code(indices_data_record.indices_code, indices_data_base + 4);
  ramp_indices_description(indices_data_record.indices_description, indices_data_base + 24);
  ramp_classification(indices_data_record.classification, indices_data_base + 74);
  skip
}

/* Indices Data to the wire, 104 bytes from where the cursor stands */
inline encode_indices_data(indices_data_record) {
  indices_data_at = 0;
  do
  :: indices_data_at < 4 -> wire[at] = indices_data_record.indices_sequence[indices_data_at]; at = at + 1; indices_data_at = indices_data_at + 1
  :: else -> break
  od;
  encode_indices_code(indices_data_record.indices_code);
  encode_indices_description(indices_data_record.indices_description);
  encode_classification(indices_data_record.classification);
  skip
}

/* Indices Data off the wire, 104 bytes from where the cursor stands */
inline decode_indices_data(indices_data_record) {
  indices_data_at = 0;
  do
  :: indices_data_at < 4 -> indices_data_record.indices_sequence[indices_data_at] = wire[at]; at = at + 1; indices_data_at = indices_data_at + 1
  :: else -> break
  od;
  decode_indices_code(indices_data_record.indices_code);
  decode_indices_description(indices_data_record.indices_description);
  decode_classification(indices_data_record.classification);
  skip
}

/* what was read of Indices Data is what was written, byte for byte */
inline equal_indices_data(indices_data_read, indices_data_written) {
  indices_data_at = 0;
  do
  :: indices_data_at < 4 -> assert(indices_data_read.indices_sequence[indices_data_at] == indices_data_written.indices_sequence[indices_data_at]); indices_data_at = indices_data_at + 1
  :: else -> break
  od;
  equal_indices_code(indices_data_read.indices_code, indices_data_written.indices_code);
  equal_indices_description(indices_data_read.indices_description, indices_data_written.indices_description);
  equal_classification(indices_data_read.classification, indices_data_written.classification);
  skip
}

/* ---- Shares In Issue Data: 40 bytes ------------------------------------------ */

/* Shares in Issue Data */
typedef SharesInIssueData {
  byte shares_in_issue_sequence[4];
  byte instrument_sequence[4];
  byte balance[8];
  byte current_value[8];
  byte previous_balance[8];
  byte previous_value[8]
};

int shares_in_issue_data_at;

/* every byte of Shares In Issue Data set to one value */
inline fill_shares_in_issue_data(shares_in_issue_data_record, shares_in_issue_data_value) {
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 4 -> shares_in_issue_data_record.shares_in_issue_sequence[shares_in_issue_data_at] = shares_in_issue_data_value; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 4 -> shares_in_issue_data_record.instrument_sequence[shares_in_issue_data_at] = shares_in_issue_data_value; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> shares_in_issue_data_record.balance[shares_in_issue_data_at] = shares_in_issue_data_value; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> shares_in_issue_data_record.current_value[shares_in_issue_data_at] = shares_in_issue_data_value; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> shares_in_issue_data_record.previous_balance[shares_in_issue_data_at] = shares_in_issue_data_value; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> shares_in_issue_data_record.previous_value[shares_in_issue_data_at] = shares_in_issue_data_value; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Shares In Issue Data set to where it lies, so a field read out of place says so */
inline ramp_shares_in_issue_data(shares_in_issue_data_record, shares_in_issue_data_base) {
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 4 -> shares_in_issue_data_record.shares_in_issue_sequence[shares_in_issue_data_at] = (shares_in_issue_data_base + 0 + shares_in_issue_data_at + 1) % 256; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 4 -> shares_in_issue_data_record.instrument_sequence[shares_in_issue_data_at] = (shares_in_issue_data_base + 4 + shares_in_issue_data_at + 1) % 256; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> shares_in_issue_data_record.balance[shares_in_issue_data_at] = (shares_in_issue_data_base + 8 + shares_in_issue_data_at + 1) % 256; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> shares_in_issue_data_record.current_value[shares_in_issue_data_at] = (shares_in_issue_data_base + 16 + shares_in_issue_data_at + 1) % 256; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> shares_in_issue_data_record.previous_balance[shares_in_issue_data_at] = (shares_in_issue_data_base + 24 + shares_in_issue_data_at + 1) % 256; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> shares_in_issue_data_record.previous_value[shares_in_issue_data_at] = (shares_in_issue_data_base + 32 + shares_in_issue_data_at + 1) % 256; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  skip
}

/* Shares In Issue Data to the wire, 40 bytes from where the cursor stands */
inline encode_shares_in_issue_data(shares_in_issue_data_record) {
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 4 -> wire[at] = shares_in_issue_data_record.shares_in_issue_sequence[shares_in_issue_data_at]; at = at + 1; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 4 -> wire[at] = shares_in_issue_data_record.instrument_sequence[shares_in_issue_data_at]; at = at + 1; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> wire[at] = shares_in_issue_data_record.balance[shares_in_issue_data_at]; at = at + 1; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> wire[at] = shares_in_issue_data_record.current_value[shares_in_issue_data_at]; at = at + 1; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> wire[at] = shares_in_issue_data_record.previous_balance[shares_in_issue_data_at]; at = at + 1; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> wire[at] = shares_in_issue_data_record.previous_value[shares_in_issue_data_at]; at = at + 1; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  skip
}

/* Shares In Issue Data off the wire, 40 bytes from where the cursor stands */
inline decode_shares_in_issue_data(shares_in_issue_data_record) {
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 4 -> shares_in_issue_data_record.shares_in_issue_sequence[shares_in_issue_data_at] = wire[at]; at = at + 1; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 4 -> shares_in_issue_data_record.instrument_sequence[shares_in_issue_data_at] = wire[at]; at = at + 1; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> shares_in_issue_data_record.balance[shares_in_issue_data_at] = wire[at]; at = at + 1; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> shares_in_issue_data_record.current_value[shares_in_issue_data_at] = wire[at]; at = at + 1; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> shares_in_issue_data_record.previous_balance[shares_in_issue_data_at] = wire[at]; at = at + 1; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> shares_in_issue_data_record.previous_value[shares_in_issue_data_at] = wire[at]; at = at + 1; shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Shares In Issue Data is what was written, byte for byte */
inline equal_shares_in_issue_data(shares_in_issue_data_read, shares_in_issue_data_written) {
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 4 -> assert(shares_in_issue_data_read.shares_in_issue_sequence[shares_in_issue_data_at] == shares_in_issue_data_written.shares_in_issue_sequence[shares_in_issue_data_at]); shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 4 -> assert(shares_in_issue_data_read.instrument_sequence[shares_in_issue_data_at] == shares_in_issue_data_written.instrument_sequence[shares_in_issue_data_at]); shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> assert(shares_in_issue_data_read.balance[shares_in_issue_data_at] == shares_in_issue_data_written.balance[shares_in_issue_data_at]); shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> assert(shares_in_issue_data_read.current_value[shares_in_issue_data_at] == shares_in_issue_data_written.current_value[shares_in_issue_data_at]); shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> assert(shares_in_issue_data_read.previous_balance[shares_in_issue_data_at] == shares_in_issue_data_written.previous_balance[shares_in_issue_data_at]); shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  shares_in_issue_data_at = 0;
  do
  :: shares_in_issue_data_at < 8 -> assert(shares_in_issue_data_read.previous_value[shares_in_issue_data_at] == shares_in_issue_data_written.previous_value[shares_in_issue_data_at]); shares_in_issue_data_at = shares_in_issue_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Date: 12 bytes ---------------------------------------------------- */

/* Trade Date */
typedef TradeDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int trade_date_at;

/* every byte of Trade Date set to one value */
inline fill_trade_date(trade_date_record, trade_date_value) {
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> trade_date_record.year[trade_date_at] = trade_date_value; trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> trade_date_record.month[trade_date_at] = trade_date_value; trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> trade_date_record.day[trade_date_at] = trade_date_value; trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Date set to where it lies, so a field read out of place says so */
inline ramp_trade_date(trade_date_record, trade_date_base) {
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> trade_date_record.year[trade_date_at] = (trade_date_base + 0 + trade_date_at + 1) % 256; trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> trade_date_record.month[trade_date_at] = (trade_date_base + 4 + trade_date_at + 1) % 256; trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> trade_date_record.day[trade_date_at] = (trade_date_base + 8 + trade_date_at + 1) % 256; trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Date to the wire, 12 bytes from where the cursor stands */
inline encode_trade_date(trade_date_record) {
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> wire[at] = trade_date_record.year[trade_date_at]; at = at + 1; trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> wire[at] = trade_date_record.month[trade_date_at]; at = at + 1; trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> wire[at] = trade_date_record.day[trade_date_at]; at = at + 1; trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Date off the wire, 12 bytes from where the cursor stands */
inline decode_trade_date(trade_date_record) {
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> trade_date_record.year[trade_date_at] = wire[at]; at = at + 1; trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> trade_date_record.month[trade_date_at] = wire[at]; at = at + 1; trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> trade_date_record.day[trade_date_at] = wire[at]; at = at + 1; trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Date is what was written, byte for byte */
inline equal_trade_date(trade_date_read, trade_date_written) {
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> assert(trade_date_read.year[trade_date_at] == trade_date_written.year[trade_date_at]); trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> assert(trade_date_read.month[trade_date_at] == trade_date_written.month[trade_date_at]); trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  trade_date_at = 0;
  do
  :: trade_date_at < 4 -> assert(trade_date_read.day[trade_date_at] == trade_date_written.day[trade_date_at]); trade_date_at = trade_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Data: 36 bytes ---------------------------------------------------- */

/* Index Data */
typedef IndexData {
  byte index_data_sequence[4];
  byte indices_sequence[4];
  TradeDate trade_date;
  byte index_value[8];
  byte market_capitalization[8]
};

int index_data_at;

/* every byte of Index Data set to one value */
inline fill_index_data(index_data_record, index_data_value) {
  index_data_at = 0;
  do
  :: index_data_at < 4 -> index_data_record.index_data_sequence[index_data_at] = index_data_value; index_data_at = index_data_at + 1
  :: else -> break
  od;
  index_data_at = 0;
  do
  :: index_data_at < 4 -> index_data_record.indices_sequence[index_data_at] = index_data_value; index_data_at = index_data_at + 1
  :: else -> break
  od;
  fill_trade_date(index_data_record.trade_date, index_data_value);
  index_data_at = 0;
  do
  :: index_data_at < 8 -> index_data_record.index_value[index_data_at] = index_data_value; index_data_at = index_data_at + 1
  :: else -> break
  od;
  index_data_at = 0;
  do
  :: index_data_at < 8 -> index_data_record.market_capitalization[index_data_at] = index_data_value; index_data_at = index_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Data set to where it lies, so a field read out of place says so */
inline ramp_index_data(index_data_record, index_data_base) {
  index_data_at = 0;
  do
  :: index_data_at < 4 -> index_data_record.index_data_sequence[index_data_at] = (index_data_base + 0 + index_data_at + 1) % 256; index_data_at = index_data_at + 1
  :: else -> break
  od;
  index_data_at = 0;
  do
  :: index_data_at < 4 -> index_data_record.indices_sequence[index_data_at] = (index_data_base + 4 + index_data_at + 1) % 256; index_data_at = index_data_at + 1
  :: else -> break
  od;
  ramp_trade_date(index_data_record.trade_date, index_data_base + 8);
  index_data_at = 0;
  do
  :: index_data_at < 8 -> index_data_record.index_value[index_data_at] = (index_data_base + 20 + index_data_at + 1) % 256; index_data_at = index_data_at + 1
  :: else -> break
  od;
  index_data_at = 0;
  do
  :: index_data_at < 8 -> index_data_record.market_capitalization[index_data_at] = (index_data_base + 28 + index_data_at + 1) % 256; index_data_at = index_data_at + 1
  :: else -> break
  od;
  skip
}

/* Index Data to the wire, 36 bytes from where the cursor stands */
inline encode_index_data(index_data_record) {
  index_data_at = 0;
  do
  :: index_data_at < 4 -> wire[at] = index_data_record.index_data_sequence[index_data_at]; at = at + 1; index_data_at = index_data_at + 1
  :: else -> break
  od;
  index_data_at = 0;
  do
  :: index_data_at < 4 -> wire[at] = index_data_record.indices_sequence[index_data_at]; at = at + 1; index_data_at = index_data_at + 1
  :: else -> break
  od;
  encode_trade_date(index_data_record.trade_date);
  index_data_at = 0;
  do
  :: index_data_at < 8 -> wire[at] = index_data_record.index_value[index_data_at]; at = at + 1; index_data_at = index_data_at + 1
  :: else -> break
  od;
  index_data_at = 0;
  do
  :: index_data_at < 8 -> wire[at] = index_data_record.market_capitalization[index_data_at]; at = at + 1; index_data_at = index_data_at + 1
  :: else -> break
  od;
  skip
}

/* Index Data off the wire, 36 bytes from where the cursor stands */
inline decode_index_data(index_data_record) {
  index_data_at = 0;
  do
  :: index_data_at < 4 -> index_data_record.index_data_sequence[index_data_at] = wire[at]; at = at + 1; index_data_at = index_data_at + 1
  :: else -> break
  od;
  index_data_at = 0;
  do
  :: index_data_at < 4 -> index_data_record.indices_sequence[index_data_at] = wire[at]; at = at + 1; index_data_at = index_data_at + 1
  :: else -> break
  od;
  decode_trade_date(index_data_record.trade_date);
  index_data_at = 0;
  do
  :: index_data_at < 8 -> index_data_record.index_value[index_data_at] = wire[at]; at = at + 1; index_data_at = index_data_at + 1
  :: else -> break
  od;
  index_data_at = 0;
  do
  :: index_data_at < 8 -> index_data_record.market_capitalization[index_data_at] = wire[at]; at = at + 1; index_data_at = index_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Data is what was written, byte for byte */
inline equal_index_data(index_data_read, index_data_written) {
  index_data_at = 0;
  do
  :: index_data_at < 4 -> assert(index_data_read.index_data_sequence[index_data_at] == index_data_written.index_data_sequence[index_data_at]); index_data_at = index_data_at + 1
  :: else -> break
  od;
  index_data_at = 0;
  do
  :: index_data_at < 4 -> assert(index_data_read.indices_sequence[index_data_at] == index_data_written.indices_sequence[index_data_at]); index_data_at = index_data_at + 1
  :: else -> break
  od;
  equal_trade_date(index_data_read.trade_date, index_data_written.trade_date);
  index_data_at = 0;
  do
  :: index_data_at < 8 -> assert(index_data_read.index_value[index_data_at] == index_data_written.index_value[index_data_at]); index_data_at = index_data_at + 1
  :: else -> break
  od;
  index_data_at = 0;
  do
  :: index_data_at < 8 -> assert(index_data_read.market_capitalization[index_data_at] == index_data_written.market_capitalization[index_data_at]); index_data_at = index_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Constituents Data: 12 bytes --------------------------------------- */

/* Index Constituents Data */
typedef IndexConstituentsData {
  byte index_instrument_sequence[4];
  byte indices_sequence[4];
  byte instrument_sequence[4]
};

int index_constituents_data_at;

/* every byte of Index Constituents Data set to one value */
inline fill_index_constituents_data(index_constituents_data_record, index_constituents_data_value) {
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> index_constituents_data_record.index_instrument_sequence[index_constituents_data_at] = index_constituents_data_value; index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> index_constituents_data_record.indices_sequence[index_constituents_data_at] = index_constituents_data_value; index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> index_constituents_data_record.instrument_sequence[index_constituents_data_at] = index_constituents_data_value; index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Constituents Data set to where it lies, so a field read out of place says so */
inline ramp_index_constituents_data(index_constituents_data_record, index_constituents_data_base) {
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> index_constituents_data_record.index_instrument_sequence[index_constituents_data_at] = (index_constituents_data_base + 0 + index_constituents_data_at + 1) % 256; index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> index_constituents_data_record.indices_sequence[index_constituents_data_at] = (index_constituents_data_base + 4 + index_constituents_data_at + 1) % 256; index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> index_constituents_data_record.instrument_sequence[index_constituents_data_at] = (index_constituents_data_base + 8 + index_constituents_data_at + 1) % 256; index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  skip
}

/* Index Constituents Data to the wire, 12 bytes from where the cursor stands */
inline encode_index_constituents_data(index_constituents_data_record) {
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> wire[at] = index_constituents_data_record.index_instrument_sequence[index_constituents_data_at]; at = at + 1; index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> wire[at] = index_constituents_data_record.indices_sequence[index_constituents_data_at]; at = at + 1; index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> wire[at] = index_constituents_data_record.instrument_sequence[index_constituents_data_at]; at = at + 1; index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  skip
}

/* Index Constituents Data off the wire, 12 bytes from where the cursor stands */
inline decode_index_constituents_data(index_constituents_data_record) {
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> index_constituents_data_record.index_instrument_sequence[index_constituents_data_at] = wire[at]; at = at + 1; index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> index_constituents_data_record.indices_sequence[index_constituents_data_at] = wire[at]; at = at + 1; index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> index_constituents_data_record.instrument_sequence[index_constituents_data_at] = wire[at]; at = at + 1; index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Constituents Data is what was written, byte for byte */
inline equal_index_constituents_data(index_constituents_data_read, index_constituents_data_written) {
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> assert(index_constituents_data_read.index_instrument_sequence[index_constituents_data_at] == index_constituents_data_written.index_instrument_sequence[index_constituents_data_at]); index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> assert(index_constituents_data_read.indices_sequence[index_constituents_data_at] == index_constituents_data_written.indices_sequence[index_constituents_data_at]); index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  index_constituents_data_at = 0;
  do
  :: index_constituents_data_at < 4 -> assert(index_constituents_data_read.instrument_sequence[index_constituents_data_at] == index_constituents_data_written.instrument_sequence[index_constituents_data_at]); index_constituents_data_at = index_constituents_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Secondary Expiry Date: 12 bytes ----------------------------------------- */

/* Secondary Expiry Date */
typedef SecondaryExpiryDate {
  byte year[4];
  byte month[4];
  byte day[4]
};

int secondary_expiry_date_at;

/* every byte of Secondary Expiry Date set to one value */
inline fill_secondary_expiry_date(secondary_expiry_date_record, secondary_expiry_date_value) {
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> secondary_expiry_date_record.year[secondary_expiry_date_at] = secondary_expiry_date_value; secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> secondary_expiry_date_record.month[secondary_expiry_date_at] = secondary_expiry_date_value; secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> secondary_expiry_date_record.day[secondary_expiry_date_at] = secondary_expiry_date_value; secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Secondary Expiry Date set to where it lies, so a field read out of place says so */
inline ramp_secondary_expiry_date(secondary_expiry_date_record, secondary_expiry_date_base) {
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> secondary_expiry_date_record.year[secondary_expiry_date_at] = (secondary_expiry_date_base + 0 + secondary_expiry_date_at + 1) % 256; secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> secondary_expiry_date_record.month[secondary_expiry_date_at] = (secondary_expiry_date_base + 4 + secondary_expiry_date_at + 1) % 256; secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> secondary_expiry_date_record.day[secondary_expiry_date_at] = (secondary_expiry_date_base + 8 + secondary_expiry_date_at + 1) % 256; secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* Secondary Expiry Date to the wire, 12 bytes from where the cursor stands */
inline encode_secondary_expiry_date(secondary_expiry_date_record) {
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> wire[at] = secondary_expiry_date_record.year[secondary_expiry_date_at]; at = at + 1; secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> wire[at] = secondary_expiry_date_record.month[secondary_expiry_date_at]; at = at + 1; secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> wire[at] = secondary_expiry_date_record.day[secondary_expiry_date_at]; at = at + 1; secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* Secondary Expiry Date off the wire, 12 bytes from where the cursor stands */
inline decode_secondary_expiry_date(secondary_expiry_date_record) {
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> secondary_expiry_date_record.year[secondary_expiry_date_at] = wire[at]; at = at + 1; secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> secondary_expiry_date_record.month[secondary_expiry_date_at] = wire[at]; at = at + 1; secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> secondary_expiry_date_record.day[secondary_expiry_date_at] = wire[at]; at = at + 1; secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Secondary Expiry Date is what was written, byte for byte */
inline equal_secondary_expiry_date(secondary_expiry_date_read, secondary_expiry_date_written) {
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> assert(secondary_expiry_date_read.year[secondary_expiry_date_at] == secondary_expiry_date_written.year[secondary_expiry_date_at]); secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> assert(secondary_expiry_date_read.month[secondary_expiry_date_at] == secondary_expiry_date_written.month[secondary_expiry_date_at]); secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  secondary_expiry_date_at = 0;
  do
  :: secondary_expiry_date_at < 4 -> assert(secondary_expiry_date_read.day[secondary_expiry_date_at] == secondary_expiry_date_written.day[secondary_expiry_date_at]); secondary_expiry_date_at = secondary_expiry_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Contract: 48 bytes ------------------------------------------------ */

/* Order Contract */
typedef OrderContract {
  byte identifier_prefix_b_4[4];
  ExpiryDate expiry_date;
  byte instrument_name_b_5[5];
  byte strike[8];
  byte call_put_b_1;
  SecondaryExpiryDate secondary_expiry_date;
  byte secondary_instrument_name_b_5[5];
  byte is_delta_option
};

int order_contract_at;

/* every byte of Order Contract set to one value */
inline fill_order_contract(order_contract_record, order_contract_value) {
  order_contract_at = 0;
  do
  :: order_contract_at < 4 -> order_contract_record.identifier_prefix_b_4[order_contract_at] = order_contract_value; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  fill_expiry_date(order_contract_record.expiry_date, order_contract_value);
  order_contract_at = 0;
  do
  :: order_contract_at < 5 -> order_contract_record.instrument_name_b_5[order_contract_at] = order_contract_value; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  order_contract_at = 0;
  do
  :: order_contract_at < 8 -> order_contract_record.strike[order_contract_at] = order_contract_value; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  order_contract_record.call_put_b_1 = order_contract_value;
  fill_secondary_expiry_date(order_contract_record.secondary_expiry_date, order_contract_value);
  order_contract_at = 0;
  do
  :: order_contract_at < 5 -> order_contract_record.secondary_instrument_name_b_5[order_contract_at] = order_contract_value; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  order_contract_record.is_delta_option = order_contract_value;
  skip
}

/* each byte of Order Contract set to where it lies, so a field read out of place says so */
inline ramp_order_contract(order_contract_record, order_contract_base) {
  order_contract_at = 0;
  do
  :: order_contract_at < 4 -> order_contract_record.identifier_prefix_b_4[order_contract_at] = (order_contract_base + 0 + order_contract_at + 1) % 256; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  ramp_expiry_date(order_contract_record.expiry_date, order_contract_base + 4);
  order_contract_at = 0;
  do
  :: order_contract_at < 5 -> order_contract_record.instrument_name_b_5[order_contract_at] = (order_contract_base + 16 + order_contract_at + 1) % 256; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  order_contract_at = 0;
  do
  :: order_contract_at < 8 -> order_contract_record.strike[order_contract_at] = (order_contract_base + 21 + order_contract_at + 1) % 256; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  order_contract_record.call_put_b_1 = (order_contract_base + 29 + 1) % 256;
  ramp_secondary_expiry_date(order_contract_record.secondary_expiry_date, order_contract_base + 30);
  order_contract_at = 0;
  do
  :: order_contract_at < 5 -> order_contract_record.secondary_instrument_name_b_5[order_contract_at] = (order_contract_base + 42 + order_contract_at + 1) % 256; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  order_contract_record.is_delta_option = (order_contract_base + 47 + 1) % 256;
  skip
}

/* Order Contract to the wire, 48 bytes from where the cursor stands */
inline encode_order_contract(order_contract_record) {
  order_contract_at = 0;
  do
  :: order_contract_at < 4 -> wire[at] = order_contract_record.identifier_prefix_b_4[order_contract_at]; at = at + 1; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  encode_expiry_date(order_contract_record.expiry_date);
  order_contract_at = 0;
  do
  :: order_contract_at < 5 -> wire[at] = order_contract_record.instrument_name_b_5[order_contract_at]; at = at + 1; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  order_contract_at = 0;
  do
  :: order_contract_at < 8 -> wire[at] = order_contract_record.strike[order_contract_at]; at = at + 1; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  wire[at] = order_contract_record.call_put_b_1; at = at + 1;
  encode_secondary_expiry_date(order_contract_record.secondary_expiry_date);
  order_contract_at = 0;
  do
  :: order_contract_at < 5 -> wire[at] = order_contract_record.secondary_instrument_name_b_5[order_contract_at]; at = at + 1; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  wire[at] = order_contract_record.is_delta_option; at = at + 1;
  skip
}

/* Order Contract off the wire, 48 bytes from where the cursor stands */
inline decode_order_contract(order_contract_record) {
  order_contract_at = 0;
  do
  :: order_contract_at < 4 -> order_contract_record.identifier_prefix_b_4[order_contract_at] = wire[at]; at = at + 1; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  decode_expiry_date(order_contract_record.expiry_date);
  order_contract_at = 0;
  do
  :: order_contract_at < 5 -> order_contract_record.instrument_name_b_5[order_contract_at] = wire[at]; at = at + 1; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  order_contract_at = 0;
  do
  :: order_contract_at < 8 -> order_contract_record.strike[order_contract_at] = wire[at]; at = at + 1; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  order_contract_record.call_put_b_1 = wire[at]; at = at + 1;
  decode_secondary_expiry_date(order_contract_record.secondary_expiry_date);
  order_contract_at = 0;
  do
  :: order_contract_at < 5 -> order_contract_record.secondary_instrument_name_b_5[order_contract_at] = wire[at]; at = at + 1; order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  order_contract_record.is_delta_option = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Contract is what was written, byte for byte */
inline equal_order_contract(order_contract_read, order_contract_written) {
  order_contract_at = 0;
  do
  :: order_contract_at < 4 -> assert(order_contract_read.identifier_prefix_b_4[order_contract_at] == order_contract_written.identifier_prefix_b_4[order_contract_at]); order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  equal_expiry_date(order_contract_read.expiry_date, order_contract_written.expiry_date);
  order_contract_at = 0;
  do
  :: order_contract_at < 5 -> assert(order_contract_read.instrument_name_b_5[order_contract_at] == order_contract_written.instrument_name_b_5[order_contract_at]); order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  order_contract_at = 0;
  do
  :: order_contract_at < 8 -> assert(order_contract_read.strike[order_contract_at] == order_contract_written.strike[order_contract_at]); order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  assert(order_contract_read.call_put_b_1 == order_contract_written.call_put_b_1);
  equal_secondary_expiry_date(order_contract_read.secondary_expiry_date, order_contract_written.secondary_expiry_date);
  order_contract_at = 0;
  do
  :: order_contract_at < 5 -> assert(order_contract_read.secondary_instrument_name_b_5[order_contract_at] == order_contract_written.secondary_instrument_name_b_5[order_contract_at]); order_contract_at = order_contract_at + 1
  :: else -> break
  od;
  assert(order_contract_read.is_delta_option == order_contract_written.is_delta_option);
  skip
}

/* ---- Completed Trade Message: 156 bytes -------------------------------------- */

/* Sent when an order has been matched or trading has occurred between two parties. */
typedef CompletedTradeMessage {
  OrderContract order_contract;
  byte sequence_number[4];
  byte price[8];
  byte quantity_d_8[8];
  byte open_price[8];
  byte previous_closing_price[8];
  byte closing_price[8];
  byte change[8];
  byte open_interest[8];
  byte low[8];
  byte high[8];
  byte day_volume[8];
  byte vwap[8];
  byte trade_type[4];
  TradeDate trade_date
};

int completed_trade_message_at;

/* every byte of Completed Trade Message set to one value */
inline fill_completed_trade_message(completed_trade_message_record, completed_trade_message_value) {
  fill_order_contract(completed_trade_message_record.order_contract, completed_trade_message_value);
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 4 -> completed_trade_message_record.sequence_number[completed_trade_message_at] = completed_trade_message_value; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.price[completed_trade_message_at] = completed_trade_message_value; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.quantity_d_8[completed_trade_message_at] = completed_trade_message_value; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.open_price[completed_trade_message_at] = completed_trade_message_value; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.previous_closing_price[completed_trade_message_at] = completed_trade_message_value; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.closing_price[completed_trade_message_at] = completed_trade_message_value; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.change[completed_trade_message_at] = completed_trade_message_value; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.open_interest[completed_trade_message_at] = completed_trade_message_value; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.low[completed_trade_message_at] = completed_trade_message_value; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.high[completed_trade_message_at] = completed_trade_message_value; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.day_volume[completed_trade_message_at] = completed_trade_message_value; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.vwap[completed_trade_message_at] = completed_trade_message_value; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 4 -> completed_trade_message_record.trade_type[completed_trade_message_at] = completed_trade_message_value; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  fill_trade_date(completed_trade_message_record.trade_date, completed_trade_message_value);
  skip
}

/* each byte of Completed Trade Message set to where it lies, so a field read out of place says so */
inline ramp_completed_trade_message(completed_trade_message_record, completed_trade_message_base) {
  ramp_order_contract(completed_trade_message_record.order_contract, completed_trade_message_base + 0);
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 4 -> completed_trade_message_record.sequence_number[completed_trade_message_at] = (completed_trade_message_base + 48 + completed_trade_message_at + 1) % 256; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.price[completed_trade_message_at] = (completed_trade_message_base + 52 + completed_trade_message_at + 1) % 256; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.quantity_d_8[completed_trade_message_at] = (completed_trade_message_base + 60 + completed_trade_message_at + 1) % 256; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.open_price[completed_trade_message_at] = (completed_trade_message_base + 68 + completed_trade_message_at + 1) % 256; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.previous_closing_price[completed_trade_message_at] = (completed_trade_message_base + 76 + completed_trade_message_at + 1) % 256; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.closing_price[completed_trade_message_at] = (completed_trade_message_base + 84 + completed_trade_message_at + 1) % 256; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.change[completed_trade_message_at] = (completed_trade_message_base + 92 + completed_trade_message_at + 1) % 256; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.open_interest[completed_trade_message_at] = (completed_trade_message_base + 100 + completed_trade_message_at + 1) % 256; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.low[completed_trade_message_at] = (completed_trade_message_base + 108 + completed_trade_message_at + 1) % 256; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.high[completed_trade_message_at] = (completed_trade_message_base + 116 + completed_trade_message_at + 1) % 256; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.day_volume[completed_trade_message_at] = (completed_trade_message_base + 124 + completed_trade_message_at + 1) % 256; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.vwap[completed_trade_message_at] = (completed_trade_message_base + 132 + completed_trade_message_at + 1) % 256; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 4 -> completed_trade_message_record.trade_type[completed_trade_message_at] = (completed_trade_message_base + 140 + completed_trade_message_at + 1) % 256; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  ramp_trade_date(completed_trade_message_record.trade_date, completed_trade_message_base + 144);
  skip
}

/* Completed Trade Message to the wire, 156 bytes from where the cursor stands */
inline encode_completed_trade_message(completed_trade_message_record) {
  encode_order_contract(completed_trade_message_record.order_contract);
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 4 -> wire[at] = completed_trade_message_record.sequence_number[completed_trade_message_at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> wire[at] = completed_trade_message_record.price[completed_trade_message_at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> wire[at] = completed_trade_message_record.quantity_d_8[completed_trade_message_at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> wire[at] = completed_trade_message_record.open_price[completed_trade_message_at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> wire[at] = completed_trade_message_record.previous_closing_price[completed_trade_message_at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> wire[at] = completed_trade_message_record.closing_price[completed_trade_message_at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> wire[at] = completed_trade_message_record.change[completed_trade_message_at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> wire[at] = completed_trade_message_record.open_interest[completed_trade_message_at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> wire[at] = completed_trade_message_record.low[completed_trade_message_at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> wire[at] = completed_trade_message_record.high[completed_trade_message_at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> wire[at] = completed_trade_message_record.day_volume[completed_trade_message_at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> wire[at] = completed_trade_message_record.vwap[completed_trade_message_at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 4 -> wire[at] = completed_trade_message_record.trade_type[completed_trade_message_at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  encode_trade_date(completed_trade_message_record.trade_date);
  skip
}

/* Completed Trade Message off the wire, 156 bytes from where the cursor stands */
inline decode_completed_trade_message(completed_trade_message_record) {
  decode_order_contract(completed_trade_message_record.order_contract);
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 4 -> completed_trade_message_record.sequence_number[completed_trade_message_at] = wire[at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.price[completed_trade_message_at] = wire[at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.quantity_d_8[completed_trade_message_at] = wire[at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.open_price[completed_trade_message_at] = wire[at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.previous_closing_price[completed_trade_message_at] = wire[at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.closing_price[completed_trade_message_at] = wire[at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.change[completed_trade_message_at] = wire[at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.open_interest[completed_trade_message_at] = wire[at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.low[completed_trade_message_at] = wire[at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.high[completed_trade_message_at] = wire[at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.day_volume[completed_trade_message_at] = wire[at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> completed_trade_message_record.vwap[completed_trade_message_at] = wire[at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 4 -> completed_trade_message_record.trade_type[completed_trade_message_at] = wire[at]; at = at + 1; completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  decode_trade_date(completed_trade_message_record.trade_date);
  skip
}

/* what was read of Completed Trade Message is what was written, byte for byte */
inline equal_completed_trade_message(completed_trade_message_read, completed_trade_message_written) {
  equal_order_contract(completed_trade_message_read.order_contract, completed_trade_message_written.order_contract);
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 4 -> assert(completed_trade_message_read.sequence_number[completed_trade_message_at] == completed_trade_message_written.sequence_number[completed_trade_message_at]); completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> assert(completed_trade_message_read.price[completed_trade_message_at] == completed_trade_message_written.price[completed_trade_message_at]); completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> assert(completed_trade_message_read.quantity_d_8[completed_trade_message_at] == completed_trade_message_written.quantity_d_8[completed_trade_message_at]); completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> assert(completed_trade_message_read.open_price[completed_trade_message_at] == completed_trade_message_written.open_price[completed_trade_message_at]); completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> assert(completed_trade_message_read.previous_closing_price[completed_trade_message_at] == completed_trade_message_written.previous_closing_price[completed_trade_message_at]); completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> assert(completed_trade_message_read.closing_price[completed_trade_message_at] == completed_trade_message_written.closing_price[completed_trade_message_at]); completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> assert(completed_trade_message_read.change[completed_trade_message_at] == completed_trade_message_written.change[completed_trade_message_at]); completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> assert(completed_trade_message_read.open_interest[completed_trade_message_at] == completed_trade_message_written.open_interest[completed_trade_message_at]); completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> assert(completed_trade_message_read.low[completed_trade_message_at] == completed_trade_message_written.low[completed_trade_message_at]); completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> assert(completed_trade_message_read.high[completed_trade_message_at] == completed_trade_message_written.high[completed_trade_message_at]); completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> assert(completed_trade_message_read.day_volume[completed_trade_message_at] == completed_trade_message_written.day_volume[completed_trade_message_at]); completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 8 -> assert(completed_trade_message_read.vwap[completed_trade_message_at] == completed_trade_message_written.vwap[completed_trade_message_at]); completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  completed_trade_message_at = 0;
  do
  :: completed_trade_message_at < 4 -> assert(completed_trade_message_read.trade_type[completed_trade_message_at] == completed_trade_message_written.trade_type[completed_trade_message_at]); completed_trade_message_at = completed_trade_message_at + 1
  :: else -> break
  od;
  equal_trade_date(completed_trade_message_read.trade_date, completed_trade_message_written.trade_date);
  skip
}

/* ---- Last Dealt Time: 4 bytes ------------------------------------------------ */

/* Last Dealt Time */
typedef LastDealtTime {
  byte hours;
  byte minutes;
  byte seconds;
  byte unused_1
};

/* every byte of Last Dealt Time set to one value */
inline fill_last_dealt_time(last_dealt_time_record, last_dealt_time_value) {
  last_dealt_time_record.hours = last_dealt_time_value;
  last_dealt_time_record.minutes = last_dealt_time_value;
  last_dealt_time_record.seconds = last_dealt_time_value;
  last_dealt_time_record.unused_1 = last_dealt_time_value;
  skip
}

/* each byte of Last Dealt Time set to where it lies, so a field read out of place says so */
inline ramp_last_dealt_time(last_dealt_time_record, last_dealt_time_base) {
  last_dealt_time_record.hours = (last_dealt_time_base + 0 + 1) % 256;
  last_dealt_time_record.minutes = (last_dealt_time_base + 1 + 1) % 256;
  last_dealt_time_record.seconds = (last_dealt_time_base + 2 + 1) % 256;
  last_dealt_time_record.unused_1 = (last_dealt_time_base + 3 + 1) % 256;
  skip
}

/* Last Dealt Time to the wire, 4 bytes from where the cursor stands */
inline encode_last_dealt_time(last_dealt_time_record) {
  wire[at] = last_dealt_time_record.hours; at = at + 1;
  wire[at] = last_dealt_time_record.minutes; at = at + 1;
  wire[at] = last_dealt_time_record.seconds; at = at + 1;
  wire[at] = last_dealt_time_record.unused_1; at = at + 1;
  skip
}

/* Last Dealt Time off the wire, 4 bytes from where the cursor stands */
inline decode_last_dealt_time(last_dealt_time_record) {
  last_dealt_time_record.hours = wire[at]; at = at + 1;
  last_dealt_time_record.minutes = wire[at]; at = at + 1;
  last_dealt_time_record.seconds = wire[at]; at = at + 1;
  last_dealt_time_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Last Dealt Time is what was written, byte for byte */
inline equal_last_dealt_time(last_dealt_time_read, last_dealt_time_written) {
  assert(last_dealt_time_read.hours == last_dealt_time_written.hours);
  assert(last_dealt_time_read.minutes == last_dealt_time_written.minutes);
  assert(last_dealt_time_read.seconds == last_dealt_time_written.seconds);
  assert(last_dealt_time_read.unused_1 == last_dealt_time_written.unused_1);
  skip
}

/* ---- Display: 204 bytes ------------------------------------------------------ */

/* Display */
typedef Display {
  byte trading_anonymous;
  Contract contract;
  byte mid_price[8];
  byte last_dealt_price[8];
  LastDealtTime last_dealt_time;
  byte deal_volume[8];
  byte high_price[8];
  byte low_price[8];
  byte days_volume_i_8[8];
  byte last_order_qty[4];
  byte last_order_buy_sell;
  byte last_order_price[8];
  byte number_of_depth;
  byte open_interest[8];
  byte change[8];
  byte auction;
  byte contract_status;
  byte odd_lot;
  byte last_traded_quantity[8];
  byte date_sequence[4];
  byte secondary_contract_date_sequence[4];
  byte strike_sequence[4];
  byte market_shard_global_sequence_number[4];
  byte stack_sequence_number[4];
  byte unused_21[21];
  UpdateTime update_time;
  byte vwap[8];
  byte closing_price[8];
  byte reserved_1
};

int display_at;

/* every byte of Display set to one value */
inline fill_display(display_record, display_value) {
  display_record.trading_anonymous = display_value;
  fill_contract(display_record.contract, display_value);
  display_at = 0;
  do
  :: display_at < 8 -> display_record.mid_price[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.last_dealt_price[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  fill_last_dealt_time(display_record.last_dealt_time, display_value);
  display_at = 0;
  do
  :: display_at < 8 -> display_record.deal_volume[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.high_price[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.low_price[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.days_volume_i_8[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.last_order_qty[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_record.last_order_buy_sell = display_value;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.last_order_price[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_record.number_of_depth = display_value;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.open_interest[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.change[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_record.auction = display_value;
  display_record.contract_status = display_value;
  display_record.odd_lot = display_value;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.last_traded_quantity[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.date_sequence[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.secondary_contract_date_sequence[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.strike_sequence[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.market_shard_global_sequence_number[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.stack_sequence_number[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 21 -> display_record.unused_21[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  fill_update_time(display_record.update_time, display_value);
  display_at = 0;
  do
  :: display_at < 8 -> display_record.vwap[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.closing_price[display_at] = display_value; display_at = display_at + 1
  :: else -> break
  od;
  display_record.reserved_1 = display_value;
  skip
}

/* each byte of Display set to where it lies, so a field read out of place says so */
inline ramp_display(display_record, display_base) {
  display_record.trading_anonymous = (display_base + 0 + 1) % 256;
  ramp_contract(display_record.contract, display_base + 1);
  display_at = 0;
  do
  :: display_at < 8 -> display_record.mid_price[display_at] = (display_base + 49 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.last_dealt_price[display_at] = (display_base + 57 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  ramp_last_dealt_time(display_record.last_dealt_time, display_base + 65);
  display_at = 0;
  do
  :: display_at < 8 -> display_record.deal_volume[display_at] = (display_base + 69 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.high_price[display_at] = (display_base + 77 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.low_price[display_at] = (display_base + 85 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.days_volume_i_8[display_at] = (display_base + 93 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.last_order_qty[display_at] = (display_base + 101 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_record.last_order_buy_sell = (display_base + 105 + 1) % 256;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.last_order_price[display_at] = (display_base + 106 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_record.number_of_depth = (display_base + 114 + 1) % 256;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.open_interest[display_at] = (display_base + 115 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.change[display_at] = (display_base + 123 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_record.auction = (display_base + 131 + 1) % 256;
  display_record.contract_status = (display_base + 132 + 1) % 256;
  display_record.odd_lot = (display_base + 133 + 1) % 256;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.last_traded_quantity[display_at] = (display_base + 134 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.date_sequence[display_at] = (display_base + 142 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.secondary_contract_date_sequence[display_at] = (display_base + 146 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.strike_sequence[display_at] = (display_base + 150 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.market_shard_global_sequence_number[display_at] = (display_base + 154 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.stack_sequence_number[display_at] = (display_base + 158 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 21 -> display_record.unused_21[display_at] = (display_base + 162 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  ramp_update_time(display_record.update_time, display_base + 183);
  display_at = 0;
  do
  :: display_at < 8 -> display_record.vwap[display_at] = (display_base + 187 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.closing_price[display_at] = (display_base + 195 + display_at + 1) % 256; display_at = display_at + 1
  :: else -> break
  od;
  display_record.reserved_1 = (display_base + 203 + 1) % 256;
  skip
}

/* Display to the wire, 204 bytes from where the cursor stands */
inline encode_display(display_record) {
  wire[at] = display_record.trading_anonymous; at = at + 1;
  encode_contract(display_record.contract);
  display_at = 0;
  do
  :: display_at < 8 -> wire[at] = display_record.mid_price[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> wire[at] = display_record.last_dealt_price[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  encode_last_dealt_time(display_record.last_dealt_time);
  display_at = 0;
  do
  :: display_at < 8 -> wire[at] = display_record.deal_volume[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> wire[at] = display_record.high_price[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> wire[at] = display_record.low_price[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> wire[at] = display_record.days_volume_i_8[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> wire[at] = display_record.last_order_qty[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  wire[at] = display_record.last_order_buy_sell; at = at + 1;
  display_at = 0;
  do
  :: display_at < 8 -> wire[at] = display_record.last_order_price[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  wire[at] = display_record.number_of_depth; at = at + 1;
  display_at = 0;
  do
  :: display_at < 8 -> wire[at] = display_record.open_interest[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> wire[at] = display_record.change[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  wire[at] = display_record.auction; at = at + 1;
  wire[at] = display_record.contract_status; at = at + 1;
  wire[at] = display_record.odd_lot; at = at + 1;
  display_at = 0;
  do
  :: display_at < 8 -> wire[at] = display_record.last_traded_quantity[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> wire[at] = display_record.date_sequence[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> wire[at] = display_record.secondary_contract_date_sequence[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> wire[at] = display_record.strike_sequence[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> wire[at] = display_record.market_shard_global_sequence_number[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> wire[at] = display_record.stack_sequence_number[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 21 -> wire[at] = display_record.unused_21[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  encode_update_time(display_record.update_time);
  display_at = 0;
  do
  :: display_at < 8 -> wire[at] = display_record.vwap[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> wire[at] = display_record.closing_price[display_at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  wire[at] = display_record.reserved_1; at = at + 1;
  skip
}

/* Display off the wire, 204 bytes from where the cursor stands */
inline decode_display(display_record) {
  display_record.trading_anonymous = wire[at]; at = at + 1;
  decode_contract(display_record.contract);
  display_at = 0;
  do
  :: display_at < 8 -> display_record.mid_price[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.last_dealt_price[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  decode_last_dealt_time(display_record.last_dealt_time);
  display_at = 0;
  do
  :: display_at < 8 -> display_record.deal_volume[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.high_price[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.low_price[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.days_volume_i_8[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.last_order_qty[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_record.last_order_buy_sell = wire[at]; at = at + 1;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.last_order_price[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_record.number_of_depth = wire[at]; at = at + 1;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.open_interest[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.change[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_record.auction = wire[at]; at = at + 1;
  display_record.contract_status = wire[at]; at = at + 1;
  display_record.odd_lot = wire[at]; at = at + 1;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.last_traded_quantity[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.date_sequence[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.secondary_contract_date_sequence[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.strike_sequence[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.market_shard_global_sequence_number[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> display_record.stack_sequence_number[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 21 -> display_record.unused_21[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  decode_update_time(display_record.update_time);
  display_at = 0;
  do
  :: display_at < 8 -> display_record.vwap[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> display_record.closing_price[display_at] = wire[at]; at = at + 1; display_at = display_at + 1
  :: else -> break
  od;
  display_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Display is what was written, byte for byte */
inline equal_display(display_read, display_written) {
  assert(display_read.trading_anonymous == display_written.trading_anonymous);
  equal_contract(display_read.contract, display_written.contract);
  display_at = 0;
  do
  :: display_at < 8 -> assert(display_read.mid_price[display_at] == display_written.mid_price[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> assert(display_read.last_dealt_price[display_at] == display_written.last_dealt_price[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  equal_last_dealt_time(display_read.last_dealt_time, display_written.last_dealt_time);
  display_at = 0;
  do
  :: display_at < 8 -> assert(display_read.deal_volume[display_at] == display_written.deal_volume[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> assert(display_read.high_price[display_at] == display_written.high_price[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> assert(display_read.low_price[display_at] == display_written.low_price[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> assert(display_read.days_volume_i_8[display_at] == display_written.days_volume_i_8[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> assert(display_read.last_order_qty[display_at] == display_written.last_order_qty[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  assert(display_read.last_order_buy_sell == display_written.last_order_buy_sell);
  display_at = 0;
  do
  :: display_at < 8 -> assert(display_read.last_order_price[display_at] == display_written.last_order_price[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  assert(display_read.number_of_depth == display_written.number_of_depth);
  display_at = 0;
  do
  :: display_at < 8 -> assert(display_read.open_interest[display_at] == display_written.open_interest[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> assert(display_read.change[display_at] == display_written.change[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  assert(display_read.auction == display_written.auction);
  assert(display_read.contract_status == display_written.contract_status);
  assert(display_read.odd_lot == display_written.odd_lot);
  display_at = 0;
  do
  :: display_at < 8 -> assert(display_read.last_traded_quantity[display_at] == display_written.last_traded_quantity[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> assert(display_read.date_sequence[display_at] == display_written.date_sequence[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> assert(display_read.secondary_contract_date_sequence[display_at] == display_written.secondary_contract_date_sequence[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> assert(display_read.strike_sequence[display_at] == display_written.strike_sequence[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> assert(display_read.market_shard_global_sequence_number[display_at] == display_written.market_shard_global_sequence_number[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 4 -> assert(display_read.stack_sequence_number[display_at] == display_written.stack_sequence_number[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 21 -> assert(display_read.unused_21[display_at] == display_written.unused_21[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  equal_update_time(display_read.update_time, display_written.update_time);
  display_at = 0;
  do
  :: display_at < 8 -> assert(display_read.vwap[display_at] == display_written.vwap[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  display_at = 0;
  do
  :: display_at < 8 -> assert(display_read.closing_price[display_at] == display_written.closing_price[display_at]); display_at = display_at + 1
  :: else -> break
  od;
  assert(display_read.reserved_1 == display_written.reserved_1);
  skip
}

/* ---- Buy Who Member: 6 bytes ------------------------------------------------- */

/* Member bidding */
typedef BuyWhoMember {
  byte buy_who_length_byte;
  byte buy_who_characters[5]
};

int buy_who_member_at;

/* every byte of Buy Who Member set to one value */
inline fill_buy_who_member(buy_who_member_record, buy_who_member_value) {
  buy_who_member_record.buy_who_length_byte = buy_who_member_value;
  buy_who_member_at = 0;
  do
  :: buy_who_member_at < 5 -> buy_who_member_record.buy_who_characters[buy_who_member_at] = buy_who_member_value; buy_who_member_at = buy_who_member_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Buy Who Member set to where it lies, so a field read out of place says so */
inline ramp_buy_who_member(buy_who_member_record, buy_who_member_base) {
  buy_who_member_record.buy_who_length_byte = (buy_who_member_base + 0 + 1) % 256;
  buy_who_member_at = 0;
  do
  :: buy_who_member_at < 5 -> buy_who_member_record.buy_who_characters[buy_who_member_at] = (buy_who_member_base + 1 + buy_who_member_at + 1) % 256; buy_who_member_at = buy_who_member_at + 1
  :: else -> break
  od;
  skip
}

/* Buy Who Member to the wire, 6 bytes from where the cursor stands */
inline encode_buy_who_member(buy_who_member_record) {
  wire[at] = buy_who_member_record.buy_who_length_byte; at = at + 1;
  buy_who_member_at = 0;
  do
  :: buy_who_member_at < 5 -> wire[at] = buy_who_member_record.buy_who_characters[buy_who_member_at]; at = at + 1; buy_who_member_at = buy_who_member_at + 1
  :: else -> break
  od;
  skip
}

/* Buy Who Member off the wire, 6 bytes from where the cursor stands */
inline decode_buy_who_member(buy_who_member_record) {
  buy_who_member_record.buy_who_length_byte = wire[at]; at = at + 1;
  buy_who_member_at = 0;
  do
  :: buy_who_member_at < 5 -> buy_who_member_record.buy_who_characters[buy_who_member_at] = wire[at]; at = at + 1; buy_who_member_at = buy_who_member_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Buy Who Member is what was written, byte for byte */
inline equal_buy_who_member(buy_who_member_read, buy_who_member_written) {
  assert(buy_who_member_read.buy_who_length_byte == buy_who_member_written.buy_who_length_byte);
  buy_who_member_at = 0;
  do
  :: buy_who_member_at < 5 -> assert(buy_who_member_read.buy_who_characters[buy_who_member_at] == buy_who_member_written.buy_who_characters[buy_who_member_at]); buy_who_member_at = buy_who_member_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Buy Who Unique Member: 6 bytes ------------------------------------------ */

/* Anonymous contract: length byte 0, then the unique member number */
typedef BuyWhoUniqueMember {
  byte buy_who_length_byte;
  byte unique_member_number[4];
  byte unused_1
};

int buy_who_unique_member_at;

/* every byte of Buy Who Unique Member set to one value */
inline fill_buy_who_unique_member(buy_who_unique_member_record, buy_who_unique_member_value) {
  buy_who_unique_member_record.buy_who_length_byte = buy_who_unique_member_value;
  buy_who_unique_member_at = 0;
  do
  :: buy_who_unique_member_at < 4 -> buy_who_unique_member_record.unique_member_number[buy_who_unique_member_at] = buy_who_unique_member_value; buy_who_unique_member_at = buy_who_unique_member_at + 1
  :: else -> break
  od;
  buy_who_unique_member_record.unused_1 = buy_who_unique_member_value;
  skip
}

/* each byte of Buy Who Unique Member set to where it lies, so a field read out of place says so */
inline ramp_buy_who_unique_member(buy_who_unique_member_record, buy_who_unique_member_base) {
  buy_who_unique_member_record.buy_who_length_byte = (buy_who_unique_member_base + 0 + 1) % 256;
  buy_who_unique_member_at = 0;
  do
  :: buy_who_unique_member_at < 4 -> buy_who_unique_member_record.unique_member_number[buy_who_unique_member_at] = (buy_who_unique_member_base + 1 + buy_who_unique_member_at + 1) % 256; buy_who_unique_member_at = buy_who_unique_member_at + 1
  :: else -> break
  od;
  buy_who_unique_member_record.unused_1 = (buy_who_unique_member_base + 5 + 1) % 256;
  skip
}

/* Buy Who Unique Member to the wire, 6 bytes from where the cursor stands */
inline encode_buy_who_unique_member(buy_who_unique_member_record) {
  wire[at] = buy_who_unique_member_record.buy_who_length_byte; at = at + 1;
  buy_who_unique_member_at = 0;
  do
  :: buy_who_unique_member_at < 4 -> wire[at] = buy_who_unique_member_record.unique_member_number[buy_who_unique_member_at]; at = at + 1; buy_who_unique_member_at = buy_who_unique_member_at + 1
  :: else -> break
  od;
  wire[at] = buy_who_unique_member_record.unused_1; at = at + 1;
  skip
}

/* Buy Who Unique Member off the wire, 6 bytes from where the cursor stands */
inline decode_buy_who_unique_member(buy_who_unique_member_record) {
  buy_who_unique_member_record.buy_who_length_byte = wire[at]; at = at + 1;
  buy_who_unique_member_at = 0;
  do
  :: buy_who_unique_member_at < 4 -> buy_who_unique_member_record.unique_member_number[buy_who_unique_member_at] = wire[at]; at = at + 1; buy_who_unique_member_at = buy_who_unique_member_at + 1
  :: else -> break
  od;
  buy_who_unique_member_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Buy Who Unique Member is what was written, byte for byte */
inline equal_buy_who_unique_member(buy_who_unique_member_read, buy_who_unique_member_written) {
  assert(buy_who_unique_member_read.buy_who_length_byte == buy_who_unique_member_written.buy_who_length_byte);
  buy_who_unique_member_at = 0;
  do
  :: buy_who_unique_member_at < 4 -> assert(buy_who_unique_member_read.unique_member_number[buy_who_unique_member_at] == buy_who_unique_member_written.unique_member_number[buy_who_unique_member_at]); buy_who_unique_member_at = buy_who_unique_member_at + 1
  :: else -> break
  od;
  assert(buy_who_unique_member_read.unused_1 == buy_who_unique_member_written.unused_1);
  skip
}

/* ---- Sell Who Member: 6 bytes ------------------------------------------------ */

/* Member asking */
typedef SellWhoMember {
  byte sell_who_length_byte;
  byte sell_who_characters[5]
};

int sell_who_member_at;

/* every byte of Sell Who Member set to one value */
inline fill_sell_who_member(sell_who_member_record, sell_who_member_value) {
  sell_who_member_record.sell_who_length_byte = sell_who_member_value;
  sell_who_member_at = 0;
  do
  :: sell_who_member_at < 5 -> sell_who_member_record.sell_who_characters[sell_who_member_at] = sell_who_member_value; sell_who_member_at = sell_who_member_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sell Who Member set to where it lies, so a field read out of place says so */
inline ramp_sell_who_member(sell_who_member_record, sell_who_member_base) {
  sell_who_member_record.sell_who_length_byte = (sell_who_member_base + 0 + 1) % 256;
  sell_who_member_at = 0;
  do
  :: sell_who_member_at < 5 -> sell_who_member_record.sell_who_characters[sell_who_member_at] = (sell_who_member_base + 1 + sell_who_member_at + 1) % 256; sell_who_member_at = sell_who_member_at + 1
  :: else -> break
  od;
  skip
}

/* Sell Who Member to the wire, 6 bytes from where the cursor stands */
inline encode_sell_who_member(sell_who_member_record) {
  wire[at] = sell_who_member_record.sell_who_length_byte; at = at + 1;
  sell_who_member_at = 0;
  do
  :: sell_who_member_at < 5 -> wire[at] = sell_who_member_record.sell_who_characters[sell_who_member_at]; at = at + 1; sell_who_member_at = sell_who_member_at + 1
  :: else -> break
  od;
  skip
}

/* Sell Who Member off the wire, 6 bytes from where the cursor stands */
inline decode_sell_who_member(sell_who_member_record) {
  sell_who_member_record.sell_who_length_byte = wire[at]; at = at + 1;
  sell_who_member_at = 0;
  do
  :: sell_who_member_at < 5 -> sell_who_member_record.sell_who_characters[sell_who_member_at] = wire[at]; at = at + 1; sell_who_member_at = sell_who_member_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sell Who Member is what was written, byte for byte */
inline equal_sell_who_member(sell_who_member_read, sell_who_member_written) {
  assert(sell_who_member_read.sell_who_length_byte == sell_who_member_written.sell_who_length_byte);
  sell_who_member_at = 0;
  do
  :: sell_who_member_at < 5 -> assert(sell_who_member_read.sell_who_characters[sell_who_member_at] == sell_who_member_written.sell_who_characters[sell_who_member_at]); sell_who_member_at = sell_who_member_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sell Who Unique Member: 6 bytes ----------------------------------------- */

/* Anonymous contract: length byte 0, then the unique member number */
typedef SellWhoUniqueMember {
  byte sell_who_length_byte;
  byte unique_member_number[4];
  byte unused_1
};

int sell_who_unique_member_at;

/* every byte of Sell Who Unique Member set to one value */
inline fill_sell_who_unique_member(sell_who_unique_member_record, sell_who_unique_member_value) {
  sell_who_unique_member_record.sell_who_length_byte = sell_who_unique_member_value;
  sell_who_unique_member_at = 0;
  do
  :: sell_who_unique_member_at < 4 -> sell_who_unique_member_record.unique_member_number[sell_who_unique_member_at] = sell_who_unique_member_value; sell_who_unique_member_at = sell_who_unique_member_at + 1
  :: else -> break
  od;
  sell_who_unique_member_record.unused_1 = sell_who_unique_member_value;
  skip
}

/* each byte of Sell Who Unique Member set to where it lies, so a field read out of place says so */
inline ramp_sell_who_unique_member(sell_who_unique_member_record, sell_who_unique_member_base) {
  sell_who_unique_member_record.sell_who_length_byte = (sell_who_unique_member_base + 0 + 1) % 256;
  sell_who_unique_member_at = 0;
  do
  :: sell_who_unique_member_at < 4 -> sell_who_unique_member_record.unique_member_number[sell_who_unique_member_at] = (sell_who_unique_member_base + 1 + sell_who_unique_member_at + 1) % 256; sell_who_unique_member_at = sell_who_unique_member_at + 1
  :: else -> break
  od;
  sell_who_unique_member_record.unused_1 = (sell_who_unique_member_base + 5 + 1) % 256;
  skip
}

/* Sell Who Unique Member to the wire, 6 bytes from where the cursor stands */
inline encode_sell_who_unique_member(sell_who_unique_member_record) {
  wire[at] = sell_who_unique_member_record.sell_who_length_byte; at = at + 1;
  sell_who_unique_member_at = 0;
  do
  :: sell_who_unique_member_at < 4 -> wire[at] = sell_who_unique_member_record.unique_member_number[sell_who_unique_member_at]; at = at + 1; sell_who_unique_member_at = sell_who_unique_member_at + 1
  :: else -> break
  od;
  wire[at] = sell_who_unique_member_record.unused_1; at = at + 1;
  skip
}

/* Sell Who Unique Member off the wire, 6 bytes from where the cursor stands */
inline decode_sell_who_unique_member(sell_who_unique_member_record) {
  sell_who_unique_member_record.sell_who_length_byte = wire[at]; at = at + 1;
  sell_who_unique_member_at = 0;
  do
  :: sell_who_unique_member_at < 4 -> sell_who_unique_member_record.unique_member_number[sell_who_unique_member_at] = wire[at]; at = at + 1; sell_who_unique_member_at = sell_who_unique_member_at + 1
  :: else -> break
  od;
  sell_who_unique_member_record.unused_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Sell Who Unique Member is what was written, byte for byte */
inline equal_sell_who_unique_member(sell_who_unique_member_read, sell_who_unique_member_written) {
  assert(sell_who_unique_member_read.sell_who_length_byte == sell_who_unique_member_written.sell_who_length_byte);
  sell_who_unique_member_at = 0;
  do
  :: sell_who_unique_member_at < 4 -> assert(sell_who_unique_member_read.unique_member_number[sell_who_unique_member_at] == sell_who_unique_member_written.unique_member_number[sell_who_unique_member_at]); sell_who_unique_member_at = sell_who_unique_member_at + 1
  :: else -> break
  od;
  assert(sell_who_unique_member_read.unused_1 == sell_who_unique_member_written.unused_1);
  skip
}

/* ---- Index Sequence Number: 4 bytes ------------------------------------------ */

/* Indicates the sequence number of the index. */
typedef IndexSequenceNumber {
  byte index_sequence_number_length_byte;
  byte index_sequence_number_characters[3]
};

int index_sequence_number_at;

/* every byte of Index Sequence Number set to one value */
inline fill_index_sequence_number(index_sequence_number_record, index_sequence_number_value) {
  index_sequence_number_record.index_sequence_number_length_byte = index_sequence_number_value;
  index_sequence_number_at = 0;
  do
  :: index_sequence_number_at < 3 -> index_sequence_number_record.index_sequence_number_characters[index_sequence_number_at] = index_sequence_number_value; index_sequence_number_at = index_sequence_number_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Sequence Number set to where it lies, so a field read out of place says so */
inline ramp_index_sequence_number(index_sequence_number_record, index_sequence_number_base) {
  index_sequence_number_record.index_sequence_number_length_byte = (index_sequence_number_base + 0 + 1) % 256;
  index_sequence_number_at = 0;
  do
  :: index_sequence_number_at < 3 -> index_sequence_number_record.index_sequence_number_characters[index_sequence_number_at] = (index_sequence_number_base + 1 + index_sequence_number_at + 1) % 256; index_sequence_number_at = index_sequence_number_at + 1
  :: else -> break
  od;
  skip
}

/* Index Sequence Number to the wire, 4 bytes from where the cursor stands */
inline encode_index_sequence_number(index_sequence_number_record) {
  wire[at] = index_sequence_number_record.index_sequence_number_length_byte; at = at + 1;
  index_sequence_number_at = 0;
  do
  :: index_sequence_number_at < 3 -> wire[at] = index_sequence_number_record.index_sequence_number_characters[index_sequence_number_at]; at = at + 1; index_sequence_number_at = index_sequence_number_at + 1
  :: else -> break
  od;
  skip
}

/* Index Sequence Number off the wire, 4 bytes from where the cursor stands */
inline decode_index_sequence_number(index_sequence_number_record) {
  index_sequence_number_record.index_sequence_number_length_byte = wire[at]; at = at + 1;
  index_sequence_number_at = 0;
  do
  :: index_sequence_number_at < 3 -> index_sequence_number_record.index_sequence_number_characters[index_sequence_number_at] = wire[at]; at = at + 1; index_sequence_number_at = index_sequence_number_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Sequence Number is what was written, byte for byte */
inline equal_index_sequence_number(index_sequence_number_read, index_sequence_number_written) {
  assert(index_sequence_number_read.index_sequence_number_length_byte == index_sequence_number_written.index_sequence_number_length_byte);
  index_sequence_number_at = 0;
  do
  :: index_sequence_number_at < 3 -> assert(index_sequence_number_read.index_sequence_number_characters[index_sequence_number_at] == index_sequence_number_written.index_sequence_number_characters[index_sequence_number_at]); index_sequence_number_at = index_sequence_number_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indices Message: 44 bytes ----------------------------------------------- */

/* Each Index will be sent in this format. */
typedef IndicesMessage {
  IndexSequenceNumber index_sequence_number;
  byte opening_price[8];
  byte index_price[8];
  UpdateTime update_time;
  UpdateDate update_date;
  byte market_capitalisation[8]
};

int indices_message_at;

/* every byte of Indices Message set to one value */
inline fill_indices_message(indices_message_record, indices_message_value) {
  fill_index_sequence_number(indices_message_record.index_sequence_number, indices_message_value);
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> indices_message_record.opening_price[indices_message_at] = indices_message_value; indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> indices_message_record.index_price[indices_message_at] = indices_message_value; indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  fill_update_time(indices_message_record.update_time, indices_message_value);
  fill_update_date(indices_message_record.update_date, indices_message_value);
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> indices_message_record.market_capitalisation[indices_message_at] = indices_message_value; indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indices Message set to where it lies, so a field read out of place says so */
inline ramp_indices_message(indices_message_record, indices_message_base) {
  ramp_index_sequence_number(indices_message_record.index_sequence_number, indices_message_base + 0);
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> indices_message_record.opening_price[indices_message_at] = (indices_message_base + 4 + indices_message_at + 1) % 256; indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> indices_message_record.index_price[indices_message_at] = (indices_message_base + 12 + indices_message_at + 1) % 256; indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  ramp_update_time(indices_message_record.update_time, indices_message_base + 20);
  ramp_update_date(indices_message_record.update_date, indices_message_base + 24);
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> indices_message_record.market_capitalisation[indices_message_at] = (indices_message_base + 36 + indices_message_at + 1) % 256; indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indices Message to the wire, 44 bytes from where the cursor stands */
inline encode_indices_message(indices_message_record) {
  encode_index_sequence_number(indices_message_record.index_sequence_number);
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> wire[at] = indices_message_record.opening_price[indices_message_at]; at = at + 1; indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> wire[at] = indices_message_record.index_price[indices_message_at]; at = at + 1; indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  encode_update_time(indices_message_record.update_time);
  encode_update_date(indices_message_record.update_date);
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> wire[at] = indices_message_record.market_capitalisation[indices_message_at]; at = at + 1; indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indices Message off the wire, 44 bytes from where the cursor stands */
inline decode_indices_message(indices_message_record) {
  decode_index_sequence_number(indices_message_record.index_sequence_number);
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> indices_message_record.opening_price[indices_message_at] = wire[at]; at = at + 1; indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> indices_message_record.index_price[indices_message_at] = wire[at]; at = at + 1; indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  decode_update_time(indices_message_record.update_time);
  decode_update_date(indices_message_record.update_date);
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> indices_message_record.market_capitalisation[indices_message_at] = wire[at]; at = at + 1; indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indices Message is what was written, byte for byte */
inline equal_indices_message(indices_message_read, indices_message_written) {
  equal_index_sequence_number(indices_message_read.index_sequence_number, indices_message_written.index_sequence_number);
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> assert(indices_message_read.opening_price[indices_message_at] == indices_message_written.opening_price[indices_message_at]); indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> assert(indices_message_read.index_price[indices_message_at] == indices_message_written.index_price[indices_message_at]); indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  equal_update_time(indices_message_read.update_time, indices_message_written.update_time);
  equal_update_date(indices_message_read.update_date, indices_message_written.update_date);
  indices_message_at = 0;
  do
  :: indices_message_at < 8 -> assert(indices_message_read.market_capitalisation[indices_message_at] == indices_message_written.market_capitalisation[indices_message_at]); indices_message_at = indices_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message P 250: 250 bytes ------------------------------------------------ */

/* A Description of the error. */
typedef MessageP250 {
  byte message_p_250_length_byte;
  byte message_p_250_characters[249]
};

int message_p250_at;

/* every byte of Message P 250 set to one value */
inline fill_message_p250(message_p250_record, message_p250_value) {
  message_p250_record.message_p_250_length_byte = message_p250_value;
  message_p250_at = 0;
  do
  :: message_p250_at < 249 -> message_p250_record.message_p_250_characters[message_p250_at] = message_p250_value; message_p250_at = message_p250_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message P 250 set to where it lies, so a field read out of place says so */
inline ramp_message_p250(message_p250_record, message_p250_base) {
  message_p250_record.message_p_250_length_byte = (message_p250_base + 0 + 1) % 256;
  message_p250_at = 0;
  do
  :: message_p250_at < 249 -> message_p250_record.message_p_250_characters[message_p250_at] = (message_p250_base + 1 + message_p250_at + 1) % 256; message_p250_at = message_p250_at + 1
  :: else -> break
  od;
  skip
}

/* Message P 250 to the wire, 250 bytes from where the cursor stands */
inline encode_message_p250(message_p250_record) {
  wire[at] = message_p250_record.message_p_250_length_byte; at = at + 1;
  message_p250_at = 0;
  do
  :: message_p250_at < 249 -> wire[at] = message_p250_record.message_p_250_characters[message_p250_at]; at = at + 1; message_p250_at = message_p250_at + 1
  :: else -> break
  od;
  skip
}

/* Message P 250 off the wire, 250 bytes from where the cursor stands */
inline decode_message_p250(message_p250_record) {
  message_p250_record.message_p_250_length_byte = wire[at]; at = at + 1;
  message_p250_at = 0;
  do
  :: message_p250_at < 249 -> message_p250_record.message_p_250_characters[message_p250_at] = wire[at]; at = at + 1; message_p250_at = message_p250_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message P 250 is what was written, byte for byte */
inline equal_message_p250(message_p250_read, message_p250_written) {
  assert(message_p250_read.message_p_250_length_byte == message_p250_written.message_p_250_length_byte);
  message_p250_at = 0;
  do
  :: message_p250_at < 249 -> assert(message_p250_read.message_p_250_characters[message_p250_at] == message_p250_written.message_p_250_characters[message_p250_at]); message_p250_at = message_p250_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Exchange Announcements Message: 263 bytes ------------------------------- */

/* Error and information messages. */
typedef ExchangeAnnouncementsMessage {
  byte market_number_i_4[4];
  byte market_shard_number_i_4[4];
  byte error_number[4];
  byte information_or_error_indicator;
  MessageP250 message_p_250
};

int exchange_announcements_message_at;

/* every byte of Exchange Announcements Message set to one value */
inline fill_exchange_announcements_message(exchange_announcements_message_record, exchange_announcements_message_value) {
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> exchange_announcements_message_record.market_number_i_4[exchange_announcements_message_at] = exchange_announcements_message_value; exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> exchange_announcements_message_record.market_shard_number_i_4[exchange_announcements_message_at] = exchange_announcements_message_value; exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> exchange_announcements_message_record.error_number[exchange_announcements_message_at] = exchange_announcements_message_value; exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  exchange_announcements_message_record.information_or_error_indicator = exchange_announcements_message_value;
  fill_message_p250(exchange_announcements_message_record.message_p_250, exchange_announcements_message_value);
  skip
}

/* each byte of Exchange Announcements Message set to where it lies, so a field read out of place says so */
inline ramp_exchange_announcements_message(exchange_announcements_message_record, exchange_announcements_message_base) {
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> exchange_announcements_message_record.market_number_i_4[exchange_announcements_message_at] = (exchange_announcements_message_base + 0 + exchange_announcements_message_at + 1) % 256; exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> exchange_announcements_message_record.market_shard_number_i_4[exchange_announcements_message_at] = (exchange_announcements_message_base + 4 + exchange_announcements_message_at + 1) % 256; exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> exchange_announcements_message_record.error_number[exchange_announcements_message_at] = (exchange_announcements_message_base + 8 + exchange_announcements_message_at + 1) % 256; exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  exchange_announcements_message_record.information_or_error_indicator = (exchange_announcements_message_base + 12 + 1) % 256;
  ramp_message_p250(exchange_announcements_message_record.message_p_250, exchange_announcements_message_base + 13);
  skip
}

/* Exchange Announcements Message to the wire, 263 bytes from where the cursor stands */
inline encode_exchange_announcements_message(exchange_announcements_message_record) {
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> wire[at] = exchange_announcements_message_record.market_number_i_4[exchange_announcements_message_at]; at = at + 1; exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> wire[at] = exchange_announcements_message_record.market_shard_number_i_4[exchange_announcements_message_at]; at = at + 1; exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> wire[at] = exchange_announcements_message_record.error_number[exchange_announcements_message_at]; at = at + 1; exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  wire[at] = exchange_announcements_message_record.information_or_error_indicator; at = at + 1;
  encode_message_p250(exchange_announcements_message_record.message_p_250);
  skip
}

/* Exchange Announcements Message off the wire, 263 bytes from where the cursor stands */
inline decode_exchange_announcements_message(exchange_announcements_message_record) {
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> exchange_announcements_message_record.market_number_i_4[exchange_announcements_message_at] = wire[at]; at = at + 1; exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> exchange_announcements_message_record.market_shard_number_i_4[exchange_announcements_message_at] = wire[at]; at = at + 1; exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> exchange_announcements_message_record.error_number[exchange_announcements_message_at] = wire[at]; at = at + 1; exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  exchange_announcements_message_record.information_or_error_indicator = wire[at]; at = at + 1;
  decode_message_p250(exchange_announcements_message_record.message_p_250);
  skip
}

/* what was read of Exchange Announcements Message is what was written, byte for byte */
inline equal_exchange_announcements_message(exchange_announcements_message_read, exchange_announcements_message_written) {
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> assert(exchange_announcements_message_read.market_number_i_4[exchange_announcements_message_at] == exchange_announcements_message_written.market_number_i_4[exchange_announcements_message_at]); exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> assert(exchange_announcements_message_read.market_shard_number_i_4[exchange_announcements_message_at] == exchange_announcements_message_written.market_shard_number_i_4[exchange_announcements_message_at]); exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  exchange_announcements_message_at = 0;
  do
  :: exchange_announcements_message_at < 4 -> assert(exchange_announcements_message_read.error_number[exchange_announcements_message_at] == exchange_announcements_message_written.error_number[exchange_announcements_message_at]); exchange_announcements_message_at = exchange_announcements_message_at + 1
  :: else -> break
  od;
  assert(exchange_announcements_message_read.information_or_error_indicator == exchange_announcements_message_written.information_or_error_indicator);
  equal_message_p250(exchange_announcements_message_read.message_p_250, exchange_announcements_message_written.message_p_250);
  skip
}

/* ---- Notification Of Failure Message: 12 bytes ------------------------------- */

/* Sent on the failure or the recovery of the exchange trading system. */
typedef NotificationOfFailureMessage {
  byte failure_notice_identifier[4];
  byte market_number_i_4[4];
  byte market_shard_number_i_4[4]
};

int notification_of_failure_message_at;

/* every byte of Notification Of Failure Message set to one value */
inline fill_notification_of_failure_message(notification_of_failure_message_record, notification_of_failure_message_value) {
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> notification_of_failure_message_record.failure_notice_identifier[notification_of_failure_message_at] = notification_of_failure_message_value; notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> notification_of_failure_message_record.market_number_i_4[notification_of_failure_message_at] = notification_of_failure_message_value; notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> notification_of_failure_message_record.market_shard_number_i_4[notification_of_failure_message_at] = notification_of_failure_message_value; notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Notification Of Failure Message set to where it lies, so a field read out of place says so */
inline ramp_notification_of_failure_message(notification_of_failure_message_record, notification_of_failure_message_base) {
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> notification_of_failure_message_record.failure_notice_identifier[notification_of_failure_message_at] = (notification_of_failure_message_base + 0 + notification_of_failure_message_at + 1) % 256; notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> notification_of_failure_message_record.market_number_i_4[notification_of_failure_message_at] = (notification_of_failure_message_base + 4 + notification_of_failure_message_at + 1) % 256; notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> notification_of_failure_message_record.market_shard_number_i_4[notification_of_failure_message_at] = (notification_of_failure_message_base + 8 + notification_of_failure_message_at + 1) % 256; notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  skip
}

/* Notification Of Failure Message to the wire, 12 bytes from where the cursor stands */
inline encode_notification_of_failure_message(notification_of_failure_message_record) {
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> wire[at] = notification_of_failure_message_record.failure_notice_identifier[notification_of_failure_message_at]; at = at + 1; notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> wire[at] = notification_of_failure_message_record.market_number_i_4[notification_of_failure_message_at]; at = at + 1; notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> wire[at] = notification_of_failure_message_record.market_shard_number_i_4[notification_of_failure_message_at]; at = at + 1; notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  skip
}

/* Notification Of Failure Message off the wire, 12 bytes from where the cursor stands */
inline decode_notification_of_failure_message(notification_of_failure_message_record) {
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> notification_of_failure_message_record.failure_notice_identifier[notification_of_failure_message_at] = wire[at]; at = at + 1; notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> notification_of_failure_message_record.market_number_i_4[notification_of_failure_message_at] = wire[at]; at = at + 1; notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> notification_of_failure_message_record.market_shard_number_i_4[notification_of_failure_message_at] = wire[at]; at = at + 1; notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Notification Of Failure Message is what was written, byte for byte */
inline equal_notification_of_failure_message(notification_of_failure_message_read, notification_of_failure_message_written) {
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> assert(notification_of_failure_message_read.failure_notice_identifier[notification_of_failure_message_at] == notification_of_failure_message_written.failure_notice_identifier[notification_of_failure_message_at]); notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> assert(notification_of_failure_message_read.market_number_i_4[notification_of_failure_message_at] == notification_of_failure_message_written.market_number_i_4[notification_of_failure_message_at]); notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  notification_of_failure_message_at = 0;
  do
  :: notification_of_failure_message_at < 4 -> assert(notification_of_failure_message_read.market_shard_number_i_4[notification_of_failure_message_at] == notification_of_failure_message_written.market_shard_number_i_4[notification_of_failure_message_at]); notification_of_failure_message_at = notification_of_failure_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reference Message Type: 3 bytes ----------------------------------------- */

/* Indicates the message type of the incoming message this reject is in response to. */
typedef ReferenceMessageType {
  byte reference_message_type_length_byte;
  byte reference_message_type_characters[2]
};

int reference_message_type_at;

/* every byte of Reference Message Type set to one value */
inline fill_reference_message_type(reference_message_type_record, reference_message_type_value) {
  reference_message_type_record.reference_message_type_length_byte = reference_message_type_value;
  reference_message_type_at = 0;
  do
  :: reference_message_type_at < 2 -> reference_message_type_record.reference_message_type_characters[reference_message_type_at] = reference_message_type_value; reference_message_type_at = reference_message_type_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reference Message Type set to where it lies, so a field read out of place says so */
inline ramp_reference_message_type(reference_message_type_record, reference_message_type_base) {
  reference_message_type_record.reference_message_type_length_byte = (reference_message_type_base + 0 + 1) % 256;
  reference_message_type_at = 0;
  do
  :: reference_message_type_at < 2 -> reference_message_type_record.reference_message_type_characters[reference_message_type_at] = (reference_message_type_base + 1 + reference_message_type_at + 1) % 256; reference_message_type_at = reference_message_type_at + 1
  :: else -> break
  od;
  skip
}

/* Reference Message Type to the wire, 3 bytes from where the cursor stands */
inline encode_reference_message_type(reference_message_type_record) {
  wire[at] = reference_message_type_record.reference_message_type_length_byte; at = at + 1;
  reference_message_type_at = 0;
  do
  :: reference_message_type_at < 2 -> wire[at] = reference_message_type_record.reference_message_type_characters[reference_message_type_at]; at = at + 1; reference_message_type_at = reference_message_type_at + 1
  :: else -> break
  od;
  skip
}

/* Reference Message Type off the wire, 3 bytes from where the cursor stands */
inline decode_reference_message_type(reference_message_type_record) {
  reference_message_type_record.reference_message_type_length_byte = wire[at]; at = at + 1;
  reference_message_type_at = 0;
  do
  :: reference_message_type_at < 2 -> reference_message_type_record.reference_message_type_characters[reference_message_type_at] = wire[at]; at = at + 1; reference_message_type_at = reference_message_type_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reference Message Type is what was written, byte for byte */
inline equal_reference_message_type(reference_message_type_read, reference_message_type_written) {
  assert(reference_message_type_read.reference_message_type_length_byte == reference_message_type_written.reference_message_type_length_byte);
  reference_message_type_at = 0;
  do
  :: reference_message_type_at < 2 -> assert(reference_message_type_read.reference_message_type_characters[reference_message_type_at] == reference_message_type_written.reference_message_type_characters[reference_message_type_at]); reference_message_type_at = reference_message_type_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Text P 250: 250 bytes --------------------------------------------------- */

/* The text of the rejection message. */
typedef TextP250 {
  byte text_p_250_length_byte;
  byte text_p_250_characters[249]
};

int text_p250_at;

/* every byte of Text P 250 set to one value */
inline fill_text_p250(text_p250_record, text_p250_value) {
  text_p250_record.text_p_250_length_byte = text_p250_value;
  text_p250_at = 0;
  do
  :: text_p250_at < 249 -> text_p250_record.text_p_250_characters[text_p250_at] = text_p250_value; text_p250_at = text_p250_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Text P 250 set to where it lies, so a field read out of place says so */
inline ramp_text_p250(text_p250_record, text_p250_base) {
  text_p250_record.text_p_250_length_byte = (text_p250_base + 0 + 1) % 256;
  text_p250_at = 0;
  do
  :: text_p250_at < 249 -> text_p250_record.text_p_250_characters[text_p250_at] = (text_p250_base + 1 + text_p250_at + 1) % 256; text_p250_at = text_p250_at + 1
  :: else -> break
  od;
  skip
}

/* Text P 250 to the wire, 250 bytes from where the cursor stands */
inline encode_text_p250(text_p250_record) {
  wire[at] = text_p250_record.text_p_250_length_byte; at = at + 1;
  text_p250_at = 0;
  do
  :: text_p250_at < 249 -> wire[at] = text_p250_record.text_p_250_characters[text_p250_at]; at = at + 1; text_p250_at = text_p250_at + 1
  :: else -> break
  od;
  skip
}

/* Text P 250 off the wire, 250 bytes from where the cursor stands */
inline decode_text_p250(text_p250_record) {
  text_p250_record.text_p_250_length_byte = wire[at]; at = at + 1;
  text_p250_at = 0;
  do
  :: text_p250_at < 249 -> text_p250_record.text_p_250_characters[text_p250_at] = wire[at]; at = at + 1; text_p250_at = text_p250_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Text P 250 is what was written, byte for byte */
inline equal_text_p250(text_p250_read, text_p250_written) {
  assert(text_p250_read.text_p_250_length_byte == text_p250_written.text_p_250_length_byte);
  text_p250_at = 0;
  do
  :: text_p250_at < 249 -> assert(text_p250_read.text_p_250_characters[text_p250_at] == text_p250_written.text_p_250_characters[text_p250_at]); text_p250_at = text_p250_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Business Message Reject Message: 257 bytes ------------------------------ */

/* Returned in response to an incoming message to indicate a failure to process this message for some business validation failure. */
typedef BusinessMessageRejectMessage {
  byte reference_sequence_number[4];
  ReferenceMessageType reference_message_type;
  TextP250 text_p_250
};

int business_message_reject_message_at;

/* every byte of Business Message Reject Message set to one value */
inline fill_business_message_reject_message(business_message_reject_message_record, business_message_reject_message_value) {
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 4 -> business_message_reject_message_record.reference_sequence_number[business_message_reject_message_at] = business_message_reject_message_value; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  fill_reference_message_type(business_message_reject_message_record.reference_message_type, business_message_reject_message_value);
  fill_text_p250(business_message_reject_message_record.text_p_250, business_message_reject_message_value);
  skip
}

/* each byte of Business Message Reject Message set to where it lies, so a field read out of place says so */
inline ramp_business_message_reject_message(business_message_reject_message_record, business_message_reject_message_base) {
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 4 -> business_message_reject_message_record.reference_sequence_number[business_message_reject_message_at] = (business_message_reject_message_base + 0 + business_message_reject_message_at + 1) % 256; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  ramp_reference_message_type(business_message_reject_message_record.reference_message_type, business_message_reject_message_base + 4);
  ramp_text_p250(business_message_reject_message_record.text_p_250, business_message_reject_message_base + 7);
  skip
}

/* Business Message Reject Message to the wire, 257 bytes from where the cursor stands */
inline encode_business_message_reject_message(business_message_reject_message_record) {
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 4 -> wire[at] = business_message_reject_message_record.reference_sequence_number[business_message_reject_message_at]; at = at + 1; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  encode_reference_message_type(business_message_reject_message_record.reference_message_type);
  encode_text_p250(business_message_reject_message_record.text_p_250);
  skip
}

/* Business Message Reject Message off the wire, 257 bytes from where the cursor stands */
inline decode_business_message_reject_message(business_message_reject_message_record) {
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 4 -> business_message_reject_message_record.reference_sequence_number[business_message_reject_message_at] = wire[at]; at = at + 1; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  decode_reference_message_type(business_message_reject_message_record.reference_message_type);
  decode_text_p250(business_message_reject_message_record.text_p_250);
  skip
}

/* what was read of Business Message Reject Message is what was written, byte for byte */
inline equal_business_message_reject_message(business_message_reject_message_read, business_message_reject_message_written) {
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 4 -> assert(business_message_reject_message_read.reference_sequence_number[business_message_reject_message_at] == business_message_reject_message_written.reference_sequence_number[business_message_reject_message_at]); business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  equal_reference_message_type(business_message_reject_message_read.reference_message_type, business_message_reject_message_written.reference_message_type);
  equal_text_p250(business_message_reject_message_read.text_p_250, business_message_reject_message_written.text_p_250);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Transport Header: encoded, read back, and compared */
proctype check_transport_header() {
  TransportHeader transport_header_sent;
  TransportHeader transport_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transport_header(transport_header_sent, 0)
  :: pattern == 1 -> fill_transport_header(transport_header_sent, 32)
  :: pattern == 2 -> fill_transport_header(transport_header_sent, 255)
  :: else -> ramp_transport_header(transport_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transport_header(transport_header_sent);
    assert(at == 4);
    at = 0;
    decode_transport_header(transport_header_got);
    assert(at == 4);
    equal_transport_header(transport_header_got, transport_header_sent)
  }
}

/* User Name: encoded, read back, and compared */
proctype check_user_name() {
  UserName user_name_sent;
  UserName user_name_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_name(user_name_sent, 0)
  :: pattern == 1 -> fill_user_name(user_name_sent, 32)
  :: pattern == 2 -> fill_user_name(user_name_sent, 255)
  :: else -> ramp_user_name(user_name_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_name(user_name_sent);
    assert(at == 16);
    at = 0;
    decode_user_name(user_name_got);
    assert(at == 16);
    equal_user_name(user_name_got, user_name_sent)
  }
}

/* Time: encoded, read back, and compared */
proctype check_time() {
  Time time_sent;
  Time time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time(time_sent, 0)
  :: pattern == 1 -> fill_time(time_sent, 32)
  :: pattern == 2 -> fill_time(time_sent, 255)
  :: else -> ramp_time(time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time(time_sent);
    assert(at == 4);
    at = 0;
    decode_time(time_got);
    assert(at == 4);
    equal_time(time_got, time_sent)
  }
}

/* Server Message Header: encoded, read back, and compared */
proctype check_server_message_header() {
  ServerMessageHeader server_message_header_sent;
  ServerMessageHeader server_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_server_message_header(server_message_header_sent, 0)
  :: pattern == 1 -> fill_server_message_header(server_message_header_sent, 32)
  :: pattern == 2 -> fill_server_message_header(server_message_header_sent, 255)
  :: else -> ramp_server_message_header(server_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_server_message_header(server_message_header_sent);
    assert(at == 29);
    at = 0;
    decode_server_message_header(server_message_header_got);
    assert(at == 29);
    equal_server_message_header(server_message_header_got, server_message_header_sent)
  }
}

/* Today Date: encoded, read back, and compared */
proctype check_today_date() {
  TodayDate today_date_sent;
  TodayDate today_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_today_date(today_date_sent, 0)
  :: pattern == 1 -> fill_today_date(today_date_sent, 32)
  :: pattern == 2 -> fill_today_date(today_date_sent, 255)
  :: else -> ramp_today_date(today_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_today_date(today_date_sent);
    assert(at == 12);
    at = 0;
    decode_today_date(today_date_got);
    assert(at == 12);
    equal_today_date(today_date_got, today_date_sent)
  }
}

/* Country Code: encoded, read back, and compared */
proctype check_country_code() {
  CountryCode country_code_sent;
  CountryCode country_code_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_country_code(country_code_sent, 0)
  :: pattern == 1 -> fill_country_code(country_code_sent, 32)
  :: pattern == 2 -> fill_country_code(country_code_sent, 255)
  :: else -> ramp_country_code(country_code_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_country_code(country_code_sent);
    assert(at == 4);
    at = 0;
    decode_country_code(country_code_got);
    assert(at == 4);
    equal_country_code(country_code_got, country_code_sent)
  }
}

/* Previous Business Day: encoded, read back, and compared */
proctype check_previous_business_day() {
  PreviousBusinessDay previous_business_day_sent;
  PreviousBusinessDay previous_business_day_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_previous_business_day(previous_business_day_sent, 0)
  :: pattern == 1 -> fill_previous_business_day(previous_business_day_sent, 32)
  :: pattern == 2 -> fill_previous_business_day(previous_business_day_sent, 255)
  :: else -> ramp_previous_business_day(previous_business_day_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_previous_business_day(previous_business_day_sent);
    assert(at == 12);
    at = 0;
    decode_previous_business_day(previous_business_day_got);
    assert(at == 12);
    equal_previous_business_day(previous_business_day_got, previous_business_day_sent)
  }
}

/* Text P 50: encoded, read back, and compared */
proctype check_text_p50() {
  TextP50 text_p50_sent;
  TextP50 text_p50_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_text_p50(text_p50_sent, 0)
  :: pattern == 1 -> fill_text_p50(text_p50_sent, 32)
  :: pattern == 2 -> fill_text_p50(text_p50_sent, 255)
  :: else -> ramp_text_p50(text_p50_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_text_p50(text_p50_sent);
    assert(at == 50);
    at = 0;
    decode_text_p50(text_p50_got);
    assert(at == 50);
    equal_text_p50(text_p50_got, text_p50_sent)
  }
}

/* Member Code P 6: encoded, read back, and compared */
proctype check_member_code_p6() {
  MemberCodeP6 member_code_p6_sent;
  MemberCodeP6 member_code_p6_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_member_code_p6(member_code_p6_sent, 0)
  :: pattern == 1 -> fill_member_code_p6(member_code_p6_sent, 32)
  :: pattern == 2 -> fill_member_code_p6(member_code_p6_sent, 255)
  :: else -> ramp_member_code_p6(member_code_p6_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_member_code_p6(member_code_p6_sent);
    assert(at == 6);
    at = 0;
    decode_member_code_p6(member_code_p6_got);
    assert(at == 6);
    equal_member_code_p6(member_code_p6_got, member_code_p6_sent)
  }
}

/* Session Key Challenge Message: encoded, read back, and compared */
proctype check_session_key_challenge_message() {
  SessionKeyChallengeMessage session_key_challenge_message_sent;
  SessionKeyChallengeMessage session_key_challenge_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_session_key_challenge_message(session_key_challenge_message_sent, 0)
  :: pattern == 1 -> fill_session_key_challenge_message(session_key_challenge_message_sent, 32)
  :: pattern == 2 -> fill_session_key_challenge_message(session_key_challenge_message_sent, 255)
  :: else -> ramp_session_key_challenge_message(session_key_challenge_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_session_key_challenge_message(session_key_challenge_message_sent);
    assert(at == 243);
    at = 0;
    decode_session_key_challenge_message(session_key_challenge_message_got);
    assert(at == 243);
    equal_session_key_challenge_message(session_key_challenge_message_got, session_key_challenge_message_sent)
  }
}

/* Download Date: encoded, read back, and compared */
proctype check_download_date() {
  DownloadDate download_date_sent;
  DownloadDate download_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_download_date(download_date_sent, 0)
  :: pattern == 1 -> fill_download_date(download_date_sent, 32)
  :: pattern == 2 -> fill_download_date(download_date_sent, 255)
  :: else -> ramp_download_date(download_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_download_date(download_date_sent);
    assert(at == 12);
    at = 0;
    decode_download_date(download_date_got);
    assert(at == 12);
    equal_download_date(download_date_got, download_date_sent)
  }
}

/* Date: encoded, read back, and compared */
proctype check_date() {
  Date date_sent;
  Date date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_date(date_sent, 0)
  :: pattern == 1 -> fill_date(date_sent, 32)
  :: pattern == 2 -> fill_date(date_sent, 255)
  :: else -> ramp_date(date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_date(date_sent);
    assert(at == 12);
    at = 0;
    decode_date(date_got);
    assert(at == 12);
    equal_date(date_got, date_sent)
  }
}

/* Instrument Name P 5: encoded, read back, and compared */
proctype check_instrument_name_p5() {
  InstrumentNameP5 instrument_name_p5_sent;
  InstrumentNameP5 instrument_name_p5_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_name_p5(instrument_name_p5_sent, 0)
  :: pattern == 1 -> fill_instrument_name_p5(instrument_name_p5_sent, 32)
  :: pattern == 2 -> fill_instrument_name_p5(instrument_name_p5_sent, 255)
  :: else -> ramp_instrument_name_p5(instrument_name_p5_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_name_p5(instrument_name_p5_sent);
    assert(at == 5);
    at = 0;
    decode_instrument_name_p5(instrument_name_p5_got);
    assert(at == 5);
    equal_instrument_name_p5(instrument_name_p5_got, instrument_name_p5_sent)
  }
}

/* Secondary Date: encoded, read back, and compared */
proctype check_secondary_date() {
  SecondaryDate secondary_date_sent;
  SecondaryDate secondary_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_secondary_date(secondary_date_sent, 0)
  :: pattern == 1 -> fill_secondary_date(secondary_date_sent, 32)
  :: pattern == 2 -> fill_secondary_date(secondary_date_sent, 255)
  :: else -> ramp_secondary_date(secondary_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_secondary_date(secondary_date_sent);
    assert(at == 12);
    at = 0;
    decode_secondary_date(secondary_date_got);
    assert(at == 12);
    equal_secondary_date(secondary_date_got, secondary_date_sent)
  }
}

/* Secondary Instrument Name P 5: encoded, read back, and compared */
proctype check_secondary_instrument_name_p5() {
  SecondaryInstrumentNameP5 secondary_instrument_name_p5_sent;
  SecondaryInstrumentNameP5 secondary_instrument_name_p5_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_secondary_instrument_name_p5(secondary_instrument_name_p5_sent, 0)
  :: pattern == 1 -> fill_secondary_instrument_name_p5(secondary_instrument_name_p5_sent, 32)
  :: pattern == 2 -> fill_secondary_instrument_name_p5(secondary_instrument_name_p5_sent, 255)
  :: else -> ramp_secondary_instrument_name_p5(secondary_instrument_name_p5_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_secondary_instrument_name_p5(secondary_instrument_name_p5_sent);
    assert(at == 5);
    at = 0;
    decode_secondary_instrument_name_p5(secondary_instrument_name_p5_got);
    assert(at == 5);
    equal_secondary_instrument_name_p5(secondary_instrument_name_p5_got, secondary_instrument_name_p5_sent)
  }
}

/* Contract: encoded, read back, and compared */
proctype check_contract() {
  Contract contract_sent;
  Contract contract_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contract(contract_sent, 0)
  :: pattern == 1 -> fill_contract(contract_sent, 32)
  :: pattern == 2 -> fill_contract(contract_sent, 255)
  :: else -> ramp_contract(contract_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contract(contract_sent);
    assert(at == 48);
    at = 0;
    decode_contract(contract_got);
    assert(at == 48);
    equal_contract(contract_got, contract_sent)
  }
}

/* Market Display Data: encoded, read back, and compared */
proctype check_market_display_data() {
  MarketDisplayData market_display_data_sent;
  MarketDisplayData market_display_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_display_data(market_display_data_sent, 0)
  :: pattern == 1 -> fill_market_display_data(market_display_data_sent, 32)
  :: pattern == 2 -> fill_market_display_data(market_display_data_sent, 255)
  :: else -> ramp_market_display_data(market_display_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_display_data(market_display_data_sent);
    assert(at == 80);
    at = 0;
    decode_market_display_data(market_display_data_got);
    assert(at == 80);
    equal_market_display_data(market_display_data_got, market_display_data_sent)
  }
}

/* Isin Code: encoded, read back, and compared */
proctype check_isin_code() {
  IsinCode isin_code_sent;
  IsinCode isin_code_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_isin_code(isin_code_sent, 0)
  :: pattern == 1 -> fill_isin_code(isin_code_sent, 32)
  :: pattern == 2 -> fill_isin_code(isin_code_sent, 255)
  :: else -> ramp_isin_code(isin_code_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_isin_code(isin_code_sent);
    assert(at == 13);
    at = 0;
    decode_isin_code(isin_code_got);
    assert(at == 13);
    equal_isin_code(isin_code_got, isin_code_sent)
  }
}

/* Description P 62: encoded, read back, and compared */
proctype check_description_p62() {
  DescriptionP62 description_p62_sent;
  DescriptionP62 description_p62_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_description_p62(description_p62_sent, 0)
  :: pattern == 1 -> fill_description_p62(description_p62_sent, 32)
  :: pattern == 2 -> fill_description_p62(description_p62_sent, 255)
  :: else -> ramp_description_p62(description_p62_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_description_p62(description_p62_sent);
    assert(at == 62);
    at = 0;
    decode_description_p62(description_p62_got);
    assert(at == 62);
    equal_description_p62(description_p62_got, description_p62_sent)
  }
}

/* Maturity Date: encoded, read back, and compared */
proctype check_maturity_date() {
  MaturityDate maturity_date_sent;
  MaturityDate maturity_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_maturity_date(maturity_date_sent, 0)
  :: pattern == 1 -> fill_maturity_date(maturity_date_sent, 32)
  :: pattern == 2 -> fill_maturity_date(maturity_date_sent, 255)
  :: else -> ramp_maturity_date(maturity_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_maturity_date(maturity_date_sent);
    assert(at == 12);
    at = 0;
    decode_maturity_date(maturity_date_got);
    assert(at == 12);
    equal_maturity_date(maturity_date_got, maturity_date_sent)
  }
}

/* Issue Date: encoded, read back, and compared */
proctype check_issue_date() {
  IssueDate issue_date_sent;
  IssueDate issue_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_issue_date(issue_date_sent, 0)
  :: pattern == 1 -> fill_issue_date(issue_date_sent, 32)
  :: pattern == 2 -> fill_issue_date(issue_date_sent, 255)
  :: else -> ramp_issue_date(issue_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_issue_date(issue_date_sent);
    assert(at == 12);
    at = 0;
    decode_issue_date(issue_date_got);
    assert(at == 12);
    equal_issue_date(issue_date_got, issue_date_sent)
  }
}

/* Group Description: encoded, read back, and compared */
proctype check_group_description() {
  GroupDescription group_description_sent;
  GroupDescription group_description_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_description(group_description_sent, 0)
  :: pattern == 1 -> fill_group_description(group_description_sent, 32)
  :: pattern == 2 -> fill_group_description(group_description_sent, 255)
  :: else -> ramp_group_description(group_description_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_description(group_description_sent);
    assert(at == 60);
    at = 0;
    decode_group_description(group_description_got);
    assert(at == 60);
    equal_group_description(group_description_got, group_description_sent)
  }
}

/* First Trade Reference: encoded, read back, and compared */
proctype check_first_trade_reference() {
  FirstTradeReference first_trade_reference_sent;
  FirstTradeReference first_trade_reference_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_first_trade_reference(first_trade_reference_sent, 0)
  :: pattern == 1 -> fill_first_trade_reference(first_trade_reference_sent, 32)
  :: pattern == 2 -> fill_first_trade_reference(first_trade_reference_sent, 255)
  :: else -> ramp_first_trade_reference(first_trade_reference_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_first_trade_reference(first_trade_reference_sent);
    assert(at == 10);
    at = 0;
    decode_first_trade_reference(first_trade_reference_got);
    assert(at == 10);
    equal_first_trade_reference(first_trade_reference_got, first_trade_reference_sent)
  }
}

/* Display Name: encoded, read back, and compared */
proctype check_display_name() {
  DisplayName display_name_sent;
  DisplayName display_name_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_display_name(display_name_sent, 0)
  :: pattern == 1 -> fill_display_name(display_name_sent, 32)
  :: pattern == 2 -> fill_display_name(display_name_sent, 255)
  :: else -> ramp_display_name(display_name_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_display_name(display_name_sent);
    assert(at == 30);
    at = 0;
    decode_display_name(display_name_got);
    assert(at == 30);
    equal_display_name(display_name_got, display_name_sent)
  }
}

/* Classification: encoded, read back, and compared */
proctype check_classification() {
  Classification classification_sent;
  Classification classification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_classification(classification_sent, 0)
  :: pattern == 1 -> fill_classification(classification_sent, 32)
  :: pattern == 2 -> fill_classification(classification_sent, 255)
  :: else -> ramp_classification(classification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_classification(classification_sent);
    assert(at == 30);
    at = 0;
    decode_classification(classification_got);
    assert(at == 30);
    equal_classification(classification_got, classification_sent)
  }
}

/* Vetting Agent Name: encoded, read back, and compared */
proctype check_vetting_agent_name() {
  VettingAgentName vetting_agent_name_sent;
  VettingAgentName vetting_agent_name_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_vetting_agent_name(vetting_agent_name_sent, 0)
  :: pattern == 1 -> fill_vetting_agent_name(vetting_agent_name_sent, 32)
  :: pattern == 2 -> fill_vetting_agent_name(vetting_agent_name_sent, 255)
  :: else -> ramp_vetting_agent_name(vetting_agent_name_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_vetting_agent_name(vetting_agent_name_sent);
    assert(at == 30);
    at = 0;
    decode_vetting_agent_name(vetting_agent_name_got);
    assert(at == 30);
    equal_vetting_agent_name(vetting_agent_name_got, vetting_agent_name_sent)
  }
}

/* Vetting Agent Contact: encoded, read back, and compared */
proctype check_vetting_agent_contact() {
  VettingAgentContact vetting_agent_contact_sent;
  VettingAgentContact vetting_agent_contact_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_vetting_agent_contact(vetting_agent_contact_sent, 0)
  :: pattern == 1 -> fill_vetting_agent_contact(vetting_agent_contact_sent, 32)
  :: pattern == 2 -> fill_vetting_agent_contact(vetting_agent_contact_sent, 255)
  :: else -> ramp_vetting_agent_contact(vetting_agent_contact_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_vetting_agent_contact(vetting_agent_contact_sent);
    assert(at == 30);
    at = 0;
    decode_vetting_agent_contact(vetting_agent_contact_got);
    assert(at == 30);
    equal_vetting_agent_contact(vetting_agent_contact_got, vetting_agent_contact_sent)
  }
}

/* Sector: encoded, read back, and compared */
proctype check_sector() {
  Sector sector_sent;
  Sector sector_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sector(sector_sent, 0)
  :: pattern == 1 -> fill_sector(sector_sent, 32)
  :: pattern == 2 -> fill_sector(sector_sent, 255)
  :: else -> ramp_sector(sector_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sector(sector_sent);
    assert(at == 30);
    at = 0;
    decode_sector(sector_got);
    assert(at == 30);
    equal_sector(sector_got, sector_sent)
  }
}

/* Security Type: encoded, read back, and compared */
proctype check_security_type() {
  SecurityType security_type_sent;
  SecurityType security_type_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_type(security_type_sent, 0)
  :: pattern == 1 -> fill_security_type(security_type_sent, 32)
  :: pattern == 2 -> fill_security_type(security_type_sent, 255)
  :: else -> ramp_security_type(security_type_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_type(security_type_sent);
    assert(at == 30);
    at = 0;
    decode_security_type(security_type_got);
    assert(at == 30);
    equal_security_type(security_type_got, security_type_sent)
  }
}

/* Instruments Data: encoded, read back, and compared */
proctype check_instruments_data() {
  InstrumentsData instruments_data_sent;
  InstrumentsData instruments_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instruments_data(instruments_data_sent, 0)
  :: pattern == 1 -> fill_instruments_data(instruments_data_sent, 32)
  :: pattern == 2 -> fill_instruments_data(instruments_data_sent, 255)
  :: else -> ramp_instruments_data(instruments_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instruments_data(instruments_data_sent);
    assert(at == 486);
    at = 0;
    decode_instruments_data(instruments_data_got);
    assert(at == 486);
    equal_instruments_data(instruments_data_got, instruments_data_sent)
  }
}

/* Expiry Date: encoded, read back, and compared */
proctype check_expiry_date() {
  ExpiryDate expiry_date_sent;
  ExpiryDate expiry_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expiry_date(expiry_date_sent, 0)
  :: pattern == 1 -> fill_expiry_date(expiry_date_sent, 32)
  :: pattern == 2 -> fill_expiry_date(expiry_date_sent, 255)
  :: else -> ramp_expiry_date(expiry_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expiry_date(expiry_date_sent);
    assert(at == 12);
    at = 0;
    decode_expiry_date(expiry_date_got);
    assert(at == 12);
    equal_expiry_date(expiry_date_got, expiry_date_sent)
  }
}

/* Valuation Date: encoded, read back, and compared */
proctype check_valuation_date() {
  ValuationDate valuation_date_sent;
  ValuationDate valuation_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_valuation_date(valuation_date_sent, 0)
  :: pattern == 1 -> fill_valuation_date(valuation_date_sent, 32)
  :: pattern == 2 -> fill_valuation_date(valuation_date_sent, 255)
  :: else -> ramp_valuation_date(valuation_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_valuation_date(valuation_date_sent);
    assert(at == 12);
    at = 0;
    decode_valuation_date(valuation_date_got);
    assert(at == 12);
    equal_valuation_date(valuation_date_got, valuation_date_sent)
  }
}

/* Clearance Date: encoded, read back, and compared */
proctype check_clearance_date() {
  ClearanceDate clearance_date_sent;
  ClearanceDate clearance_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clearance_date(clearance_date_sent, 0)
  :: pattern == 1 -> fill_clearance_date(clearance_date_sent, 32)
  :: pattern == 2 -> fill_clearance_date(clearance_date_sent, 255)
  :: else -> ramp_clearance_date(clearance_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clearance_date(clearance_date_sent);
    assert(at == 12);
    at = 0;
    decode_clearance_date(clearance_date_got);
    assert(at == 12);
    equal_clearance_date(clearance_date_got, clearance_date_sent)
  }
}

/* Contract Dates: encoded, read back, and compared */
proctype check_contract_dates() {
  ContractDates contract_dates_sent;
  ContractDates contract_dates_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contract_dates(contract_dates_sent, 0)
  :: pattern == 1 -> fill_contract_dates(contract_dates_sent, 32)
  :: pattern == 2 -> fill_contract_dates(contract_dates_sent, 255)
  :: else -> ramp_contract_dates(contract_dates_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contract_dates(contract_dates_sent);
    assert(at == 243);
    at = 0;
    decode_contract_dates(contract_dates_got);
    assert(at == 243);
    equal_contract_dates(contract_dates_got, contract_dates_sent)
  }
}

/* Strike Expiry Date: encoded, read back, and compared */
proctype check_strike_expiry_date() {
  StrikeExpiryDate strike_expiry_date_sent;
  StrikeExpiryDate strike_expiry_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_strike_expiry_date(strike_expiry_date_sent, 0)
  :: pattern == 1 -> fill_strike_expiry_date(strike_expiry_date_sent, 32)
  :: pattern == 2 -> fill_strike_expiry_date(strike_expiry_date_sent, 255)
  :: else -> ramp_strike_expiry_date(strike_expiry_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_strike_expiry_date(strike_expiry_date_sent);
    assert(at == 12);
    at = 0;
    decode_strike_expiry_date(strike_expiry_date_got);
    assert(at == 12);
    equal_strike_expiry_date(strike_expiry_date_got, strike_expiry_date_sent)
  }
}

/* Strike Data: encoded, read back, and compared */
proctype check_strike_data() {
  StrikeData strike_data_sent;
  StrikeData strike_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_strike_data(strike_data_sent, 0)
  :: pattern == 1 -> fill_strike_data(strike_data_sent, 32)
  :: pattern == 2 -> fill_strike_data(strike_data_sent, 255)
  :: else -> ramp_strike_data(strike_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_strike_data(strike_data_sent);
    assert(at == 30);
    at = 0;
    decode_strike_data(strike_data_got);
    assert(at == 30);
    equal_strike_data(strike_data_got, strike_data_sent)
  }
}

/* Member Code P 5: encoded, read back, and compared */
proctype check_member_code_p5() {
  MemberCodeP5 member_code_p5_sent;
  MemberCodeP5 member_code_p5_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_member_code_p5(member_code_p5_sent, 0)
  :: pattern == 1 -> fill_member_code_p5(member_code_p5_sent, 32)
  :: pattern == 2 -> fill_member_code_p5(member_code_p5_sent, 255)
  :: else -> ramp_member_code_p5(member_code_p5_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_member_code_p5(member_code_p5_sent);
    assert(at == 5);
    at = 0;
    decode_member_code_p5(member_code_p5_got);
    assert(at == 5);
    equal_member_code_p5(member_code_p5_got, member_code_p5_sent)
  }
}

/* Description P 50: encoded, read back, and compared */
proctype check_description_p50() {
  DescriptionP50 description_p50_sent;
  DescriptionP50 description_p50_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_description_p50(description_p50_sent, 0)
  :: pattern == 1 -> fill_description_p50(description_p50_sent, 32)
  :: pattern == 2 -> fill_description_p50(description_p50_sent, 255)
  :: else -> ramp_description_p50(description_p50_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_description_p50(description_p50_sent);
    assert(at == 50);
    at = 0;
    decode_description_p50(description_p50_got);
    assert(at == 50);
    equal_description_p50(description_p50_got, description_p50_sent)
  }
}

/* Sor Account: encoded, read back, and compared */
proctype check_sor_account() {
  SorAccount sor_account_sent;
  SorAccount sor_account_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sor_account(sor_account_sent, 0)
  :: pattern == 1 -> fill_sor_account(sor_account_sent, 32)
  :: pattern == 2 -> fill_sor_account(sor_account_sent, 255)
  :: else -> ramp_sor_account(sor_account_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sor_account(sor_account_sent);
    assert(at == 17);
    at = 0;
    decode_sor_account(sor_account_got);
    assert(at == 17);
    equal_sor_account(sor_account_got, sor_account_sent)
  }
}

/* Member Data: encoded, read back, and compared */
proctype check_member_data() {
  MemberData member_data_sent;
  MemberData member_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_member_data(member_data_sent, 0)
  :: pattern == 1 -> fill_member_data(member_data_sent, 32)
  :: pattern == 2 -> fill_member_data(member_data_sent, 255)
  :: else -> ramp_member_data(member_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_member_data(member_data_sent);
    assert(at == 96);
    at = 0;
    decode_member_data(member_data_got);
    assert(at == 96);
    equal_member_data(member_data_got, member_data_sent)
  }
}

/* Mtm Data: encoded, read back, and compared */
proctype check_mtm_data() {
  MtmData mtm_data_sent;
  MtmData mtm_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mtm_data(mtm_data_sent, 0)
  :: pattern == 1 -> fill_mtm_data(mtm_data_sent, 32)
  :: pattern == 2 -> fill_mtm_data(mtm_data_sent, 255)
  :: else -> ramp_mtm_data(mtm_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mtm_data(mtm_data_sent);
    assert(at == 160);
    at = 0;
    decode_mtm_data(mtm_data_got);
    assert(at == 160);
    equal_mtm_data(mtm_data_got, mtm_data_sent)
  }
}

/* Holiday Date: encoded, read back, and compared */
proctype check_holiday_date() {
  HolidayDate holiday_date_sent;
  HolidayDate holiday_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_holiday_date(holiday_date_sent, 0)
  :: pattern == 1 -> fill_holiday_date(holiday_date_sent, 32)
  :: pattern == 2 -> fill_holiday_date(holiday_date_sent, 255)
  :: else -> ramp_holiday_date(holiday_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_holiday_date(holiday_date_sent);
    assert(at == 12);
    at = 0;
    decode_holiday_date(holiday_date_got);
    assert(at == 12);
    equal_holiday_date(holiday_date_got, holiday_date_sent)
  }
}

/* Holiday Data: encoded, read back, and compared */
proctype check_holiday_data() {
  HolidayData holiday_data_sent;
  HolidayData holiday_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_holiday_data(holiday_data_sent, 0)
  :: pattern == 1 -> fill_holiday_data(holiday_data_sent, 32)
  :: pattern == 2 -> fill_holiday_data(holiday_data_sent, 255)
  :: else -> ramp_holiday_data(holiday_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_holiday_data(holiday_data_sent);
    assert(at == 23);
    at = 0;
    decode_holiday_data(holiday_data_got);
    assert(at == 23);
    equal_holiday_data(holiday_data_got, holiday_data_sent)
  }
}

/* Instrument Type Code: encoded, read back, and compared */
proctype check_instrument_type_code() {
  InstrumentTypeCode instrument_type_code_sent;
  InstrumentTypeCode instrument_type_code_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_type_code(instrument_type_code_sent, 0)
  :: pattern == 1 -> fill_instrument_type_code(instrument_type_code_sent, 32)
  :: pattern == 2 -> fill_instrument_type_code(instrument_type_code_sent, 255)
  :: else -> ramp_instrument_type_code(instrument_type_code_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_type_code(instrument_type_code_sent);
    assert(at == 10);
    at = 0;
    decode_instrument_type_code(instrument_type_code_got);
    assert(at == 10);
    equal_instrument_type_code(instrument_type_code_got, instrument_type_code_sent)
  }
}

/* Instrument Type Name: encoded, read back, and compared */
proctype check_instrument_type_name() {
  InstrumentTypeName instrument_type_name_sent;
  InstrumentTypeName instrument_type_name_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_type_name(instrument_type_name_sent, 0)
  :: pattern == 1 -> fill_instrument_type_name(instrument_type_name_sent, 32)
  :: pattern == 2 -> fill_instrument_type_name(instrument_type_name_sent, 255)
  :: else -> ramp_instrument_type_name(instrument_type_name_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_type_name(instrument_type_name_sent);
    assert(at == 25);
    at = 0;
    decode_instrument_type_name(instrument_type_name_got);
    assert(at == 25);
    equal_instrument_type_name(instrument_type_name_got, instrument_type_name_sent)
  }
}

/* Instrument Types: encoded, read back, and compared */
proctype check_instrument_types() {
  InstrumentTypes instrument_types_sent;
  InstrumentTypes instrument_types_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_types(instrument_types_sent, 0)
  :: pattern == 1 -> fill_instrument_types(instrument_types_sent, 32)
  :: pattern == 2 -> fill_instrument_types(instrument_types_sent, 255)
  :: else -> ramp_instrument_types(instrument_types_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_types(instrument_types_sent);
    assert(at == 48);
    at = 0;
    decode_instrument_types(instrument_types_got);
    assert(at == 48);
    equal_instrument_types(instrument_types_got, instrument_types_sent)
  }
}

/* Clearing Member Code: encoded, read back, and compared */
proctype check_clearing_member_code() {
  ClearingMemberCode clearing_member_code_sent;
  ClearingMemberCode clearing_member_code_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clearing_member_code(clearing_member_code_sent, 0)
  :: pattern == 1 -> fill_clearing_member_code(clearing_member_code_sent, 32)
  :: pattern == 2 -> fill_clearing_member_code(clearing_member_code_sent, 255)
  :: else -> ramp_clearing_member_code(clearing_member_code_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clearing_member_code(clearing_member_code_sent);
    assert(at == 6);
    at = 0;
    decode_clearing_member_code(clearing_member_code_got);
    assert(at == 6);
    equal_clearing_member_code(clearing_member_code_got, clearing_member_code_sent)
  }
}

/* Clearing Member Description: encoded, read back, and compared */
proctype check_clearing_member_description() {
  ClearingMemberDescription clearing_member_description_sent;
  ClearingMemberDescription clearing_member_description_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clearing_member_description(clearing_member_description_sent, 0)
  :: pattern == 1 -> fill_clearing_member_description(clearing_member_description_sent, 32)
  :: pattern == 2 -> fill_clearing_member_description(clearing_member_description_sent, 255)
  :: else -> ramp_clearing_member_description(clearing_member_description_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clearing_member_description(clearing_member_description_sent);
    assert(at == 50);
    at = 0;
    decode_clearing_member_description(clearing_member_description_got);
    assert(at == 50);
    equal_clearing_member_description(clearing_member_description_got, clearing_member_description_sent)
  }
}

/* Clearing Member Data: encoded, read back, and compared */
proctype check_clearing_member_data() {
  ClearingMemberData clearing_member_data_sent;
  ClearingMemberData clearing_member_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clearing_member_data(clearing_member_data_sent, 0)
  :: pattern == 1 -> fill_clearing_member_data(clearing_member_data_sent, 32)
  :: pattern == 2 -> fill_clearing_member_data(clearing_member_data_sent, 255)
  :: else -> ramp_clearing_member_data(clearing_member_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clearing_member_data(clearing_member_data_sent);
    assert(at == 60);
    at = 0;
    decode_clearing_member_data(clearing_member_data_got);
    assert(at == 60);
    equal_clearing_member_data(clearing_member_data_got, clearing_member_data_sent)
  }
}

/* Announcement Date: encoded, read back, and compared */
proctype check_announcement_date() {
  AnnouncementDate announcement_date_sent;
  AnnouncementDate announcement_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_announcement_date(announcement_date_sent, 0)
  :: pattern == 1 -> fill_announcement_date(announcement_date_sent, 32)
  :: pattern == 2 -> fill_announcement_date(announcement_date_sent, 255)
  :: else -> ramp_announcement_date(announcement_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_announcement_date(announcement_date_sent);
    assert(at == 12);
    at = 0;
    decode_announcement_date(announcement_date_got);
    assert(at == 12);
    equal_announcement_date(announcement_date_got, announcement_date_sent)
  }
}

/* Announcement Time: encoded, read back, and compared */
proctype check_announcement_time() {
  AnnouncementTime announcement_time_sent;
  AnnouncementTime announcement_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_announcement_time(announcement_time_sent, 0)
  :: pattern == 1 -> fill_announcement_time(announcement_time_sent, 32)
  :: pattern == 2 -> fill_announcement_time(announcement_time_sent, 255)
  :: else -> ramp_announcement_time(announcement_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_announcement_time(announcement_time_sent);
    assert(at == 4);
    at = 0;
    decode_announcement_time(announcement_time_got);
    assert(at == 4);
    equal_announcement_time(announcement_time_got, announcement_time_sent)
  }
}

/* Announcement: encoded, read back, and compared */
proctype check_announcement() {
  Announcement announcement_sent;
  Announcement announcement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_announcement(announcement_sent, 0)
  :: pattern == 1 -> fill_announcement(announcement_sent, 32)
  :: pattern == 2 -> fill_announcement(announcement_sent, 255)
  :: else -> ramp_announcement(announcement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_announcement(announcement_sent);
    assert(at == 255);
    at = 0;
    decode_announcement(announcement_got);
    assert(at == 255);
    equal_announcement(announcement_got, announcement_sent)
  }
}

/* Exchange Announcements: encoded, read back, and compared */
proctype check_exchange_announcements() {
  ExchangeAnnouncements exchange_announcements_sent;
  ExchangeAnnouncements exchange_announcements_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_exchange_announcements(exchange_announcements_sent, 0)
  :: pattern == 1 -> fill_exchange_announcements(exchange_announcements_sent, 32)
  :: pattern == 2 -> fill_exchange_announcements(exchange_announcements_sent, 255)
  :: else -> ramp_exchange_announcements(exchange_announcements_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_exchange_announcements(exchange_announcements_sent);
    assert(at == 279);
    at = 0;
    decode_exchange_announcements(exchange_announcements_got);
    assert(at == 279);
    equal_exchange_announcements(exchange_announcements_got, exchange_announcements_sent)
  }
}

/* Message Category Value: encoded, read back, and compared */
proctype check_message_category_value() {
  MessageCategoryValue message_category_value_sent;
  MessageCategoryValue message_category_value_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_category_value(message_category_value_sent, 0)
  :: pattern == 1 -> fill_message_category_value(message_category_value_sent, 32)
  :: pattern == 2 -> fill_message_category_value(message_category_value_sent, 255)
  :: else -> ramp_message_category_value(message_category_value_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_category_value(message_category_value_sent);
    assert(at == 50);
    at = 0;
    decode_message_category_value(message_category_value_got);
    assert(at == 50);
    equal_message_category_value(message_category_value_got, message_category_value_sent)
  }
}

/* Message P 255: encoded, read back, and compared */
proctype check_message_p255() {
  MessageP255 message_p255_sent;
  MessageP255 message_p255_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_p255(message_p255_sent, 0)
  :: pattern == 1 -> fill_message_p255(message_p255_sent, 32)
  :: pattern == 2 -> fill_message_p255(message_p255_sent, 255)
  :: else -> ramp_message_p255(message_p255_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_p255(message_p255_sent);
    assert(at == 255);
    at = 0;
    decode_message_p255(message_p255_got);
    assert(at == 255);
    equal_message_p255(message_p255_got, message_p255_sent)
  }
}

/* News Service: encoded, read back, and compared */
proctype check_news_service() {
  NewsService news_service_sent;
  NewsService news_service_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_news_service(news_service_sent, 0)
  :: pattern == 1 -> fill_news_service(news_service_sent, 32)
  :: pattern == 2 -> fill_news_service(news_service_sent, 255)
  :: else -> ramp_news_service(news_service_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_news_service(news_service_sent);
    assert(at == 329);
    at = 0;
    decode_news_service(news_service_got);
    assert(at == 329);
    equal_news_service(news_service_got, news_service_sent)
  }
}

/* Coupon Date: encoded, read back, and compared */
proctype check_coupon_date() {
  CouponDate coupon_date_sent;
  CouponDate coupon_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_coupon_date(coupon_date_sent, 0)
  :: pattern == 1 -> fill_coupon_date(coupon_date_sent, 32)
  :: pattern == 2 -> fill_coupon_date(coupon_date_sent, 255)
  :: else -> ramp_coupon_date(coupon_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_coupon_date(coupon_date_sent);
    assert(at == 12);
    at = 0;
    decode_coupon_date(coupon_date_got);
    assert(at == 12);
    equal_coupon_date(coupon_date_got, coupon_date_sent)
  }
}

/* Books Close Date: encoded, read back, and compared */
proctype check_books_close_date() {
  BooksCloseDate books_close_date_sent;
  BooksCloseDate books_close_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_books_close_date(books_close_date_sent, 0)
  :: pattern == 1 -> fill_books_close_date(books_close_date_sent, 32)
  :: pattern == 2 -> fill_books_close_date(books_close_date_sent, 255)
  :: else -> ramp_books_close_date(books_close_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_books_close_date(books_close_date_sent);
    assert(at == 12);
    at = 0;
    decode_books_close_date(books_close_date_got);
    assert(at == 12);
    equal_books_close_date(books_close_date_got, books_close_date_sent)
  }
}

/* Coupon Information: encoded, read back, and compared */
proctype check_coupon_information() {
  CouponInformation coupon_information_sent;
  CouponInformation coupon_information_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_coupon_information(coupon_information_sent, 0)
  :: pattern == 1 -> fill_coupon_information(coupon_information_sent, 32)
  :: pattern == 2 -> fill_coupon_information(coupon_information_sent, 255)
  :: else -> ramp_coupon_information(coupon_information_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_coupon_information(coupon_information_sent);
    assert(at == 48);
    at = 0;
    decode_coupon_information(coupon_information_got);
    assert(at == 48);
    equal_coupon_information(coupon_information_got, coupon_information_sent)
  }
}

/* Trading Session Name: encoded, read back, and compared */
proctype check_trading_session_name() {
  TradingSessionName trading_session_name_sent;
  TradingSessionName trading_session_name_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_session_name(trading_session_name_sent, 0)
  :: pattern == 1 -> fill_trading_session_name(trading_session_name_sent, 32)
  :: pattern == 2 -> fill_trading_session_name(trading_session_name_sent, 255)
  :: else -> ramp_trading_session_name(trading_session_name_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_session_name(trading_session_name_sent);
    assert(at == 56);
    at = 0;
    decode_trading_session_name(trading_session_name_got);
    assert(at == 56);
    equal_trading_session_name(trading_session_name_got, trading_session_name_sent)
  }
}

/* Opening Auction Start Time: encoded, read back, and compared */
proctype check_opening_auction_start_time() {
  OpeningAuctionStartTime opening_auction_start_time_sent;
  OpeningAuctionStartTime opening_auction_start_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_opening_auction_start_time(opening_auction_start_time_sent, 0)
  :: pattern == 1 -> fill_opening_auction_start_time(opening_auction_start_time_sent, 32)
  :: pattern == 2 -> fill_opening_auction_start_time(opening_auction_start_time_sent, 255)
  :: else -> ramp_opening_auction_start_time(opening_auction_start_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_opening_auction_start_time(opening_auction_start_time_sent);
    assert(at == 4);
    at = 0;
    decode_opening_auction_start_time(opening_auction_start_time_got);
    assert(at == 4);
    equal_opening_auction_start_time(opening_auction_start_time_got, opening_auction_start_time_sent)
  }
}

/* Opening Auction Close Time: encoded, read back, and compared */
proctype check_opening_auction_close_time() {
  OpeningAuctionCloseTime opening_auction_close_time_sent;
  OpeningAuctionCloseTime opening_auction_close_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_opening_auction_close_time(opening_auction_close_time_sent, 0)
  :: pattern == 1 -> fill_opening_auction_close_time(opening_auction_close_time_sent, 32)
  :: pattern == 2 -> fill_opening_auction_close_time(opening_auction_close_time_sent, 255)
  :: else -> ramp_opening_auction_close_time(opening_auction_close_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_opening_auction_close_time(opening_auction_close_time_sent);
    assert(at == 4);
    at = 0;
    decode_opening_auction_close_time(opening_auction_close_time_got);
    assert(at == 4);
    equal_opening_auction_close_time(opening_auction_close_time_got, opening_auction_close_time_sent)
  }
}

/* Closing Auction Start Time: encoded, read back, and compared */
proctype check_closing_auction_start_time() {
  ClosingAuctionStartTime closing_auction_start_time_sent;
  ClosingAuctionStartTime closing_auction_start_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_closing_auction_start_time(closing_auction_start_time_sent, 0)
  :: pattern == 1 -> fill_closing_auction_start_time(closing_auction_start_time_sent, 32)
  :: pattern == 2 -> fill_closing_auction_start_time(closing_auction_start_time_sent, 255)
  :: else -> ramp_closing_auction_start_time(closing_auction_start_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_closing_auction_start_time(closing_auction_start_time_sent);
    assert(at == 4);
    at = 0;
    decode_closing_auction_start_time(closing_auction_start_time_got);
    assert(at == 4);
    equal_closing_auction_start_time(closing_auction_start_time_got, closing_auction_start_time_sent)
  }
}

/* Closing Auction Close Time: encoded, read back, and compared */
proctype check_closing_auction_close_time() {
  ClosingAuctionCloseTime closing_auction_close_time_sent;
  ClosingAuctionCloseTime closing_auction_close_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_closing_auction_close_time(closing_auction_close_time_sent, 0)
  :: pattern == 1 -> fill_closing_auction_close_time(closing_auction_close_time_sent, 32)
  :: pattern == 2 -> fill_closing_auction_close_time(closing_auction_close_time_sent, 255)
  :: else -> ramp_closing_auction_close_time(closing_auction_close_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_closing_auction_close_time(closing_auction_close_time_sent);
    assert(at == 4);
    at = 0;
    decode_closing_auction_close_time(closing_auction_close_time_got);
    assert(at == 4);
    equal_closing_auction_close_time(closing_auction_close_time_got, closing_auction_close_time_sent)
  }
}

/* Contract Open Time: encoded, read back, and compared */
proctype check_contract_open_time() {
  ContractOpenTime contract_open_time_sent;
  ContractOpenTime contract_open_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contract_open_time(contract_open_time_sent, 0)
  :: pattern == 1 -> fill_contract_open_time(contract_open_time_sent, 32)
  :: pattern == 2 -> fill_contract_open_time(contract_open_time_sent, 255)
  :: else -> ramp_contract_open_time(contract_open_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contract_open_time(contract_open_time_sent);
    assert(at == 4);
    at = 0;
    decode_contract_open_time(contract_open_time_got);
    assert(at == 4);
    equal_contract_open_time(contract_open_time_got, contract_open_time_sent)
  }
}

/* Contract Close Time: encoded, read back, and compared */
proctype check_contract_close_time() {
  ContractCloseTime contract_close_time_sent;
  ContractCloseTime contract_close_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contract_close_time(contract_close_time_sent, 0)
  :: pattern == 1 -> fill_contract_close_time(contract_close_time_sent, 32)
  :: pattern == 2 -> fill_contract_close_time(contract_close_time_sent, 255)
  :: else -> ramp_contract_close_time(contract_close_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contract_close_time(contract_close_time_sent);
    assert(at == 4);
    at = 0;
    decode_contract_close_time(contract_close_time_got);
    assert(at == 4);
    equal_contract_close_time(contract_close_time_got, contract_close_time_sent)
  }
}

/* Intraday Auction One Start Time: encoded, read back, and compared */
proctype check_intraday_auction_one_start_time() {
  IntradayAuctionOneStartTime intraday_auction_one_start_time_sent;
  IntradayAuctionOneStartTime intraday_auction_one_start_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_intraday_auction_one_start_time(intraday_auction_one_start_time_sent, 0)
  :: pattern == 1 -> fill_intraday_auction_one_start_time(intraday_auction_one_start_time_sent, 32)
  :: pattern == 2 -> fill_intraday_auction_one_start_time(intraday_auction_one_start_time_sent, 255)
  :: else -> ramp_intraday_auction_one_start_time(intraday_auction_one_start_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_intraday_auction_one_start_time(intraday_auction_one_start_time_sent);
    assert(at == 4);
    at = 0;
    decode_intraday_auction_one_start_time(intraday_auction_one_start_time_got);
    assert(at == 4);
    equal_intraday_auction_one_start_time(intraday_auction_one_start_time_got, intraday_auction_one_start_time_sent)
  }
}

/* Intraday Auction One Auction Close Time: encoded, read back, and compared */
proctype check_intraday_auction_one_auction_close_time() {
  IntradayAuctionOneAuctionCloseTime intraday_auction_one_auction_close_time_sent;
  IntradayAuctionOneAuctionCloseTime intraday_auction_one_auction_close_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_intraday_auction_one_auction_close_time(intraday_auction_one_auction_close_time_sent, 0)
  :: pattern == 1 -> fill_intraday_auction_one_auction_close_time(intraday_auction_one_auction_close_time_sent, 32)
  :: pattern == 2 -> fill_intraday_auction_one_auction_close_time(intraday_auction_one_auction_close_time_sent, 255)
  :: else -> ramp_intraday_auction_one_auction_close_time(intraday_auction_one_auction_close_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_intraday_auction_one_auction_close_time(intraday_auction_one_auction_close_time_sent);
    assert(at == 4);
    at = 0;
    decode_intraday_auction_one_auction_close_time(intraday_auction_one_auction_close_time_got);
    assert(at == 4);
    equal_intraday_auction_one_auction_close_time(intraday_auction_one_auction_close_time_got, intraday_auction_one_auction_close_time_sent)
  }
}

/* Intraday Auction Two Start Time: encoded, read back, and compared */
proctype check_intraday_auction_two_start_time() {
  IntradayAuctionTwoStartTime intraday_auction_two_start_time_sent;
  IntradayAuctionTwoStartTime intraday_auction_two_start_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_intraday_auction_two_start_time(intraday_auction_two_start_time_sent, 0)
  :: pattern == 1 -> fill_intraday_auction_two_start_time(intraday_auction_two_start_time_sent, 32)
  :: pattern == 2 -> fill_intraday_auction_two_start_time(intraday_auction_two_start_time_sent, 255)
  :: else -> ramp_intraday_auction_two_start_time(intraday_auction_two_start_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_intraday_auction_two_start_time(intraday_auction_two_start_time_sent);
    assert(at == 4);
    at = 0;
    decode_intraday_auction_two_start_time(intraday_auction_two_start_time_got);
    assert(at == 4);
    equal_intraday_auction_two_start_time(intraday_auction_two_start_time_got, intraday_auction_two_start_time_sent)
  }
}

/* Intraday Auction Two Auction Close Time: encoded, read back, and compared */
proctype check_intraday_auction_two_auction_close_time() {
  IntradayAuctionTwoAuctionCloseTime intraday_auction_two_auction_close_time_sent;
  IntradayAuctionTwoAuctionCloseTime intraday_auction_two_auction_close_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_intraday_auction_two_auction_close_time(intraday_auction_two_auction_close_time_sent, 0)
  :: pattern == 1 -> fill_intraday_auction_two_auction_close_time(intraday_auction_two_auction_close_time_sent, 32)
  :: pattern == 2 -> fill_intraday_auction_two_auction_close_time(intraday_auction_two_auction_close_time_sent, 255)
  :: else -> ramp_intraday_auction_two_auction_close_time(intraday_auction_two_auction_close_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_intraday_auction_two_auction_close_time(intraday_auction_two_auction_close_time_sent);
    assert(at == 4);
    at = 0;
    decode_intraday_auction_two_auction_close_time(intraday_auction_two_auction_close_time_got);
    assert(at == 4);
    equal_intraday_auction_two_auction_close_time(intraday_auction_two_auction_close_time_got, intraday_auction_two_auction_close_time_sent)
  }
}

/* Intraday Auction Three Start Time: encoded, read back, and compared */
proctype check_intraday_auction_three_start_time() {
  IntradayAuctionThreeStartTime intraday_auction_three_start_time_sent;
  IntradayAuctionThreeStartTime intraday_auction_three_start_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_intraday_auction_three_start_time(intraday_auction_three_start_time_sent, 0)
  :: pattern == 1 -> fill_intraday_auction_three_start_time(intraday_auction_three_start_time_sent, 32)
  :: pattern == 2 -> fill_intraday_auction_three_start_time(intraday_auction_three_start_time_sent, 255)
  :: else -> ramp_intraday_auction_three_start_time(intraday_auction_three_start_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_intraday_auction_three_start_time(intraday_auction_three_start_time_sent);
    assert(at == 4);
    at = 0;
    decode_intraday_auction_three_start_time(intraday_auction_three_start_time_got);
    assert(at == 4);
    equal_intraday_auction_three_start_time(intraday_auction_three_start_time_got, intraday_auction_three_start_time_sent)
  }
}

/* Intraday Auction Three Auction Close Time: encoded, read back, and compared */
proctype check_intraday_auction_three_auction_close_time() {
  IntradayAuctionThreeAuctionCloseTime intraday_auction_three_auction_close_time_sent;
  IntradayAuctionThreeAuctionCloseTime intraday_auction_three_auction_close_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_intraday_auction_three_auction_close_time(intraday_auction_three_auction_close_time_sent, 0)
  :: pattern == 1 -> fill_intraday_auction_three_auction_close_time(intraday_auction_three_auction_close_time_sent, 32)
  :: pattern == 2 -> fill_intraday_auction_three_auction_close_time(intraday_auction_three_auction_close_time_sent, 255)
  :: else -> ramp_intraday_auction_three_auction_close_time(intraday_auction_three_auction_close_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_intraday_auction_three_auction_close_time(intraday_auction_three_auction_close_time_sent);
    assert(at == 4);
    at = 0;
    decode_intraday_auction_three_auction_close_time(intraday_auction_three_auction_close_time_got);
    assert(at == 4);
    equal_intraday_auction_three_auction_close_time(intraday_auction_three_auction_close_time_got, intraday_auction_three_auction_close_time_sent)
  }
}

/* Overnight Admin Open Time: encoded, read back, and compared */
proctype check_overnight_admin_open_time() {
  OvernightAdminOpenTime overnight_admin_open_time_sent;
  OvernightAdminOpenTime overnight_admin_open_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_overnight_admin_open_time(overnight_admin_open_time_sent, 0)
  :: pattern == 1 -> fill_overnight_admin_open_time(overnight_admin_open_time_sent, 32)
  :: pattern == 2 -> fill_overnight_admin_open_time(overnight_admin_open_time_sent, 255)
  :: else -> ramp_overnight_admin_open_time(overnight_admin_open_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_overnight_admin_open_time(overnight_admin_open_time_sent);
    assert(at == 4);
    at = 0;
    decode_overnight_admin_open_time(overnight_admin_open_time_got);
    assert(at == 4);
    equal_overnight_admin_open_time(overnight_admin_open_time_got, overnight_admin_open_time_sent)
  }
}

/* Overnight Admin Close Time: encoded, read back, and compared */
proctype check_overnight_admin_close_time() {
  OvernightAdminCloseTime overnight_admin_close_time_sent;
  OvernightAdminCloseTime overnight_admin_close_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_overnight_admin_close_time(overnight_admin_close_time_sent, 0)
  :: pattern == 1 -> fill_overnight_admin_close_time(overnight_admin_close_time_sent, 32)
  :: pattern == 2 -> fill_overnight_admin_close_time(overnight_admin_close_time_sent, 255)
  :: else -> ramp_overnight_admin_close_time(overnight_admin_close_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_overnight_admin_close_time(overnight_admin_close_time_sent);
    assert(at == 4);
    at = 0;
    decode_overnight_admin_close_time(overnight_admin_close_time_got);
    assert(at == 4);
    equal_overnight_admin_close_time(overnight_admin_close_time_got, overnight_admin_close_time_sent)
  }
}

/* Admin Period Close Time: encoded, read back, and compared */
proctype check_admin_period_close_time() {
  AdminPeriodCloseTime admin_period_close_time_sent;
  AdminPeriodCloseTime admin_period_close_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_admin_period_close_time(admin_period_close_time_sent, 0)
  :: pattern == 1 -> fill_admin_period_close_time(admin_period_close_time_sent, 32)
  :: pattern == 2 -> fill_admin_period_close_time(admin_period_close_time_sent, 255)
  :: else -> ramp_admin_period_close_time(admin_period_close_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_admin_period_close_time(admin_period_close_time_sent);
    assert(at == 4);
    at = 0;
    decode_admin_period_close_time(admin_period_close_time_got);
    assert(at == 4);
    equal_admin_period_close_time(admin_period_close_time_got, admin_period_close_time_sent)
  }
}

/* Pre Open Order Entry Open Time: encoded, read back, and compared */
proctype check_pre_open_order_entry_open_time() {
  PreOpenOrderEntryOpenTime pre_open_order_entry_open_time_sent;
  PreOpenOrderEntryOpenTime pre_open_order_entry_open_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_pre_open_order_entry_open_time(pre_open_order_entry_open_time_sent, 0)
  :: pattern == 1 -> fill_pre_open_order_entry_open_time(pre_open_order_entry_open_time_sent, 32)
  :: pattern == 2 -> fill_pre_open_order_entry_open_time(pre_open_order_entry_open_time_sent, 255)
  :: else -> ramp_pre_open_order_entry_open_time(pre_open_order_entry_open_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_pre_open_order_entry_open_time(pre_open_order_entry_open_time_sent);
    assert(at == 4);
    at = 0;
    decode_pre_open_order_entry_open_time(pre_open_order_entry_open_time_got);
    assert(at == 4);
    equal_pre_open_order_entry_open_time(pre_open_order_entry_open_time_got, pre_open_order_entry_open_time_sent)
  }
}

/* Pre Open Order Entry Close Time: encoded, read back, and compared */
proctype check_pre_open_order_entry_close_time() {
  PreOpenOrderEntryCloseTime pre_open_order_entry_close_time_sent;
  PreOpenOrderEntryCloseTime pre_open_order_entry_close_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_pre_open_order_entry_close_time(pre_open_order_entry_close_time_sent, 0)
  :: pattern == 1 -> fill_pre_open_order_entry_close_time(pre_open_order_entry_close_time_sent, 32)
  :: pattern == 2 -> fill_pre_open_order_entry_close_time(pre_open_order_entry_close_time_sent, 255)
  :: else -> ramp_pre_open_order_entry_close_time(pre_open_order_entry_close_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_pre_open_order_entry_close_time(pre_open_order_entry_close_time_sent);
    assert(at == 4);
    at = 0;
    decode_pre_open_order_entry_close_time(pre_open_order_entry_close_time_got);
    assert(at == 4);
    equal_pre_open_order_entry_close_time(pre_open_order_entry_close_time_got, pre_open_order_entry_close_time_sent)
  }
}

/* Trading Sessions: encoded, read back, and compared */
proctype check_trading_sessions() {
  TradingSessions trading_sessions_sent;
  TradingSessions trading_sessions_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_sessions(trading_sessions_sent, 0)
  :: pattern == 1 -> fill_trading_sessions(trading_sessions_sent, 32)
  :: pattern == 2 -> fill_trading_sessions(trading_sessions_sent, 255)
  :: else -> ramp_trading_sessions(trading_sessions_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_sessions(trading_sessions_sent);
    assert(at == 144);
    at = 0;
    decode_trading_sessions(trading_sessions_got);
    assert(at == 144);
    equal_trading_sessions(trading_sessions_got, trading_sessions_sent)
  }
}

/* Update Time: encoded, read back, and compared */
proctype check_update_time() {
  UpdateTime update_time_sent;
  UpdateTime update_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_update_time(update_time_sent, 0)
  :: pattern == 1 -> fill_update_time(update_time_sent, 32)
  :: pattern == 2 -> fill_update_time(update_time_sent, 255)
  :: else -> ramp_update_time(update_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_update_time(update_time_sent);
    assert(at == 4);
    at = 0;
    decode_update_time(update_time_got);
    assert(at == 4);
    equal_update_time(update_time_got, update_time_sent)
  }
}

/* Update Date: encoded, read back, and compared */
proctype check_update_date() {
  UpdateDate update_date_sent;
  UpdateDate update_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_update_date(update_date_sent, 0)
  :: pattern == 1 -> fill_update_date(update_date_sent, 32)
  :: pattern == 2 -> fill_update_date(update_date_sent, 255)
  :: else -> ramp_update_date(update_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_update_date(update_date_sent);
    assert(at == 12);
    at = 0;
    decode_update_date(update_date_got);
    assert(at == 12);
    equal_update_date(update_date_got, update_date_sent)
  }
}

/* Indices Price Data: encoded, read back, and compared */
proctype check_indices_price_data() {
  IndicesPriceData indices_price_data_sent;
  IndicesPriceData indices_price_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indices_price_data(indices_price_data_sent, 0)
  :: pattern == 1 -> fill_indices_price_data(indices_price_data_sent, 32)
  :: pattern == 2 -> fill_indices_price_data(indices_price_data_sent, 255)
  :: else -> ramp_indices_price_data(indices_price_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indices_price_data(indices_price_data_sent);
    assert(at == 44);
    at = 0;
    decode_indices_price_data(indices_price_data_got);
    assert(at == 44);
    equal_indices_price_data(indices_price_data_got, indices_price_data_sent)
  }
}

/* Indices Code: encoded, read back, and compared */
proctype check_indices_code() {
  IndicesCode indices_code_sent;
  IndicesCode indices_code_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indices_code(indices_code_sent, 0)
  :: pattern == 1 -> fill_indices_code(indices_code_sent, 32)
  :: pattern == 2 -> fill_indices_code(indices_code_sent, 255)
  :: else -> ramp_indices_code(indices_code_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indices_code(indices_code_sent);
    assert(at == 20);
    at = 0;
    decode_indices_code(indices_code_got);
    assert(at == 20);
    equal_indices_code(indices_code_got, indices_code_sent)
  }
}

/* Indices Description: encoded, read back, and compared */
proctype check_indices_description() {
  IndicesDescription indices_description_sent;
  IndicesDescription indices_description_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indices_description(indices_description_sent, 0)
  :: pattern == 1 -> fill_indices_description(indices_description_sent, 32)
  :: pattern == 2 -> fill_indices_description(indices_description_sent, 255)
  :: else -> ramp_indices_description(indices_description_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indices_description(indices_description_sent);
    assert(at == 50);
    at = 0;
    decode_indices_description(indices_description_got);
    assert(at == 50);
    equal_indices_description(indices_description_got, indices_description_sent)
  }
}

/* Indices Data: encoded, read back, and compared */
proctype check_indices_data() {
  IndicesData indices_data_sent;
  IndicesData indices_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indices_data(indices_data_sent, 0)
  :: pattern == 1 -> fill_indices_data(indices_data_sent, 32)
  :: pattern == 2 -> fill_indices_data(indices_data_sent, 255)
  :: else -> ramp_indices_data(indices_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indices_data(indices_data_sent);
    assert(at == 104);
    at = 0;
    decode_indices_data(indices_data_got);
    assert(at == 104);
    equal_indices_data(indices_data_got, indices_data_sent)
  }
}

/* Shares In Issue Data: encoded, read back, and compared */
proctype check_shares_in_issue_data() {
  SharesInIssueData shares_in_issue_data_sent;
  SharesInIssueData shares_in_issue_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_shares_in_issue_data(shares_in_issue_data_sent, 0)
  :: pattern == 1 -> fill_shares_in_issue_data(shares_in_issue_data_sent, 32)
  :: pattern == 2 -> fill_shares_in_issue_data(shares_in_issue_data_sent, 255)
  :: else -> ramp_shares_in_issue_data(shares_in_issue_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_shares_in_issue_data(shares_in_issue_data_sent);
    assert(at == 40);
    at = 0;
    decode_shares_in_issue_data(shares_in_issue_data_got);
    assert(at == 40);
    equal_shares_in_issue_data(shares_in_issue_data_got, shares_in_issue_data_sent)
  }
}

/* Trade Date: encoded, read back, and compared */
proctype check_trade_date() {
  TradeDate trade_date_sent;
  TradeDate trade_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_date(trade_date_sent, 0)
  :: pattern == 1 -> fill_trade_date(trade_date_sent, 32)
  :: pattern == 2 -> fill_trade_date(trade_date_sent, 255)
  :: else -> ramp_trade_date(trade_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_date(trade_date_sent);
    assert(at == 12);
    at = 0;
    decode_trade_date(trade_date_got);
    assert(at == 12);
    equal_trade_date(trade_date_got, trade_date_sent)
  }
}

/* Index Data: encoded, read back, and compared */
proctype check_index_data() {
  IndexData index_data_sent;
  IndexData index_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_data(index_data_sent, 0)
  :: pattern == 1 -> fill_index_data(index_data_sent, 32)
  :: pattern == 2 -> fill_index_data(index_data_sent, 255)
  :: else -> ramp_index_data(index_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_data(index_data_sent);
    assert(at == 36);
    at = 0;
    decode_index_data(index_data_got);
    assert(at == 36);
    equal_index_data(index_data_got, index_data_sent)
  }
}

/* Index Constituents Data: encoded, read back, and compared */
proctype check_index_constituents_data() {
  IndexConstituentsData index_constituents_data_sent;
  IndexConstituentsData index_constituents_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_constituents_data(index_constituents_data_sent, 0)
  :: pattern == 1 -> fill_index_constituents_data(index_constituents_data_sent, 32)
  :: pattern == 2 -> fill_index_constituents_data(index_constituents_data_sent, 255)
  :: else -> ramp_index_constituents_data(index_constituents_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_constituents_data(index_constituents_data_sent);
    assert(at == 12);
    at = 0;
    decode_index_constituents_data(index_constituents_data_got);
    assert(at == 12);
    equal_index_constituents_data(index_constituents_data_got, index_constituents_data_sent)
  }
}

/* Secondary Expiry Date: encoded, read back, and compared */
proctype check_secondary_expiry_date() {
  SecondaryExpiryDate secondary_expiry_date_sent;
  SecondaryExpiryDate secondary_expiry_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_secondary_expiry_date(secondary_expiry_date_sent, 0)
  :: pattern == 1 -> fill_secondary_expiry_date(secondary_expiry_date_sent, 32)
  :: pattern == 2 -> fill_secondary_expiry_date(secondary_expiry_date_sent, 255)
  :: else -> ramp_secondary_expiry_date(secondary_expiry_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_secondary_expiry_date(secondary_expiry_date_sent);
    assert(at == 12);
    at = 0;
    decode_secondary_expiry_date(secondary_expiry_date_got);
    assert(at == 12);
    equal_secondary_expiry_date(secondary_expiry_date_got, secondary_expiry_date_sent)
  }
}

/* Order Contract: encoded, read back, and compared */
proctype check_order_contract() {
  OrderContract order_contract_sent;
  OrderContract order_contract_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_contract(order_contract_sent, 0)
  :: pattern == 1 -> fill_order_contract(order_contract_sent, 32)
  :: pattern == 2 -> fill_order_contract(order_contract_sent, 255)
  :: else -> ramp_order_contract(order_contract_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_contract(order_contract_sent);
    assert(at == 48);
    at = 0;
    decode_order_contract(order_contract_got);
    assert(at == 48);
    equal_order_contract(order_contract_got, order_contract_sent)
  }
}

/* Completed Trade Message: encoded, read back, and compared */
proctype check_completed_trade_message() {
  CompletedTradeMessage completed_trade_message_sent;
  CompletedTradeMessage completed_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_completed_trade_message(completed_trade_message_sent, 0)
  :: pattern == 1 -> fill_completed_trade_message(completed_trade_message_sent, 32)
  :: pattern == 2 -> fill_completed_trade_message(completed_trade_message_sent, 255)
  :: else -> ramp_completed_trade_message(completed_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_completed_trade_message(completed_trade_message_sent);
    assert(at == 156);
    at = 0;
    decode_completed_trade_message(completed_trade_message_got);
    assert(at == 156);
    equal_completed_trade_message(completed_trade_message_got, completed_trade_message_sent)
  }
}

/* Last Dealt Time: encoded, read back, and compared */
proctype check_last_dealt_time() {
  LastDealtTime last_dealt_time_sent;
  LastDealtTime last_dealt_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_last_dealt_time(last_dealt_time_sent, 0)
  :: pattern == 1 -> fill_last_dealt_time(last_dealt_time_sent, 32)
  :: pattern == 2 -> fill_last_dealt_time(last_dealt_time_sent, 255)
  :: else -> ramp_last_dealt_time(last_dealt_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_last_dealt_time(last_dealt_time_sent);
    assert(at == 4);
    at = 0;
    decode_last_dealt_time(last_dealt_time_got);
    assert(at == 4);
    equal_last_dealt_time(last_dealt_time_got, last_dealt_time_sent)
  }
}

/* Display: encoded, read back, and compared */
proctype check_display() {
  Display display_sent;
  Display display_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_display(display_sent, 0)
  :: pattern == 1 -> fill_display(display_sent, 32)
  :: pattern == 2 -> fill_display(display_sent, 255)
  :: else -> ramp_display(display_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_display(display_sent);
    assert(at == 204);
    at = 0;
    decode_display(display_got);
    assert(at == 204);
    equal_display(display_got, display_sent)
  }
}

/* Buy Who Member: encoded, read back, and compared */
proctype check_buy_who_member() {
  BuyWhoMember buy_who_member_sent;
  BuyWhoMember buy_who_member_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_buy_who_member(buy_who_member_sent, 0)
  :: pattern == 1 -> fill_buy_who_member(buy_who_member_sent, 32)
  :: pattern == 2 -> fill_buy_who_member(buy_who_member_sent, 255)
  :: else -> ramp_buy_who_member(buy_who_member_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_buy_who_member(buy_who_member_sent);
    assert(at == 6);
    at = 0;
    decode_buy_who_member(buy_who_member_got);
    assert(at == 6);
    equal_buy_who_member(buy_who_member_got, buy_who_member_sent)
  }
}

/* Buy Who Unique Member: encoded, read back, and compared */
proctype check_buy_who_unique_member() {
  BuyWhoUniqueMember buy_who_unique_member_sent;
  BuyWhoUniqueMember buy_who_unique_member_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_buy_who_unique_member(buy_who_unique_member_sent, 0)
  :: pattern == 1 -> fill_buy_who_unique_member(buy_who_unique_member_sent, 32)
  :: pattern == 2 -> fill_buy_who_unique_member(buy_who_unique_member_sent, 255)
  :: else -> ramp_buy_who_unique_member(buy_who_unique_member_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_buy_who_unique_member(buy_who_unique_member_sent);
    assert(at == 6);
    at = 0;
    decode_buy_who_unique_member(buy_who_unique_member_got);
    assert(at == 6);
    equal_buy_who_unique_member(buy_who_unique_member_got, buy_who_unique_member_sent)
  }
}

/* Sell Who Member: encoded, read back, and compared */
proctype check_sell_who_member() {
  SellWhoMember sell_who_member_sent;
  SellWhoMember sell_who_member_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sell_who_member(sell_who_member_sent, 0)
  :: pattern == 1 -> fill_sell_who_member(sell_who_member_sent, 32)
  :: pattern == 2 -> fill_sell_who_member(sell_who_member_sent, 255)
  :: else -> ramp_sell_who_member(sell_who_member_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sell_who_member(sell_who_member_sent);
    assert(at == 6);
    at = 0;
    decode_sell_who_member(sell_who_member_got);
    assert(at == 6);
    equal_sell_who_member(sell_who_member_got, sell_who_member_sent)
  }
}

/* Sell Who Unique Member: encoded, read back, and compared */
proctype check_sell_who_unique_member() {
  SellWhoUniqueMember sell_who_unique_member_sent;
  SellWhoUniqueMember sell_who_unique_member_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sell_who_unique_member(sell_who_unique_member_sent, 0)
  :: pattern == 1 -> fill_sell_who_unique_member(sell_who_unique_member_sent, 32)
  :: pattern == 2 -> fill_sell_who_unique_member(sell_who_unique_member_sent, 255)
  :: else -> ramp_sell_who_unique_member(sell_who_unique_member_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sell_who_unique_member(sell_who_unique_member_sent);
    assert(at == 6);
    at = 0;
    decode_sell_who_unique_member(sell_who_unique_member_got);
    assert(at == 6);
    equal_sell_who_unique_member(sell_who_unique_member_got, sell_who_unique_member_sent)
  }
}

/* Index Sequence Number: encoded, read back, and compared */
proctype check_index_sequence_number() {
  IndexSequenceNumber index_sequence_number_sent;
  IndexSequenceNumber index_sequence_number_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_sequence_number(index_sequence_number_sent, 0)
  :: pattern == 1 -> fill_index_sequence_number(index_sequence_number_sent, 32)
  :: pattern == 2 -> fill_index_sequence_number(index_sequence_number_sent, 255)
  :: else -> ramp_index_sequence_number(index_sequence_number_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_sequence_number(index_sequence_number_sent);
    assert(at == 4);
    at = 0;
    decode_index_sequence_number(index_sequence_number_got);
    assert(at == 4);
    equal_index_sequence_number(index_sequence_number_got, index_sequence_number_sent)
  }
}

/* Indices Message: encoded, read back, and compared */
proctype check_indices_message() {
  IndicesMessage indices_message_sent;
  IndicesMessage indices_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indices_message(indices_message_sent, 0)
  :: pattern == 1 -> fill_indices_message(indices_message_sent, 32)
  :: pattern == 2 -> fill_indices_message(indices_message_sent, 255)
  :: else -> ramp_indices_message(indices_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indices_message(indices_message_sent);
    assert(at == 44);
    at = 0;
    decode_indices_message(indices_message_got);
    assert(at == 44);
    equal_indices_message(indices_message_got, indices_message_sent)
  }
}

/* Message P 250: encoded, read back, and compared */
proctype check_message_p250() {
  MessageP250 message_p250_sent;
  MessageP250 message_p250_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_p250(message_p250_sent, 0)
  :: pattern == 1 -> fill_message_p250(message_p250_sent, 32)
  :: pattern == 2 -> fill_message_p250(message_p250_sent, 255)
  :: else -> ramp_message_p250(message_p250_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_p250(message_p250_sent);
    assert(at == 250);
    at = 0;
    decode_message_p250(message_p250_got);
    assert(at == 250);
    equal_message_p250(message_p250_got, message_p250_sent)
  }
}

/* Exchange Announcements Message: encoded, read back, and compared */
proctype check_exchange_announcements_message() {
  ExchangeAnnouncementsMessage exchange_announcements_message_sent;
  ExchangeAnnouncementsMessage exchange_announcements_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_exchange_announcements_message(exchange_announcements_message_sent, 0)
  :: pattern == 1 -> fill_exchange_announcements_message(exchange_announcements_message_sent, 32)
  :: pattern == 2 -> fill_exchange_announcements_message(exchange_announcements_message_sent, 255)
  :: else -> ramp_exchange_announcements_message(exchange_announcements_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_exchange_announcements_message(exchange_announcements_message_sent);
    assert(at == 263);
    at = 0;
    decode_exchange_announcements_message(exchange_announcements_message_got);
    assert(at == 263);
    equal_exchange_announcements_message(exchange_announcements_message_got, exchange_announcements_message_sent)
  }
}

/* Notification Of Failure Message: encoded, read back, and compared */
proctype check_notification_of_failure_message() {
  NotificationOfFailureMessage notification_of_failure_message_sent;
  NotificationOfFailureMessage notification_of_failure_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_notification_of_failure_message(notification_of_failure_message_sent, 0)
  :: pattern == 1 -> fill_notification_of_failure_message(notification_of_failure_message_sent, 32)
  :: pattern == 2 -> fill_notification_of_failure_message(notification_of_failure_message_sent, 255)
  :: else -> ramp_notification_of_failure_message(notification_of_failure_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_notification_of_failure_message(notification_of_failure_message_sent);
    assert(at == 12);
    at = 0;
    decode_notification_of_failure_message(notification_of_failure_message_got);
    assert(at == 12);
    equal_notification_of_failure_message(notification_of_failure_message_got, notification_of_failure_message_sent)
  }
}

/* Reference Message Type: encoded, read back, and compared */
proctype check_reference_message_type() {
  ReferenceMessageType reference_message_type_sent;
  ReferenceMessageType reference_message_type_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reference_message_type(reference_message_type_sent, 0)
  :: pattern == 1 -> fill_reference_message_type(reference_message_type_sent, 32)
  :: pattern == 2 -> fill_reference_message_type(reference_message_type_sent, 255)
  :: else -> ramp_reference_message_type(reference_message_type_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reference_message_type(reference_message_type_sent);
    assert(at == 3);
    at = 0;
    decode_reference_message_type(reference_message_type_got);
    assert(at == 3);
    equal_reference_message_type(reference_message_type_got, reference_message_type_sent)
  }
}

/* Text P 250: encoded, read back, and compared */
proctype check_text_p250() {
  TextP250 text_p250_sent;
  TextP250 text_p250_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_text_p250(text_p250_sent, 0)
  :: pattern == 1 -> fill_text_p250(text_p250_sent, 32)
  :: pattern == 2 -> fill_text_p250(text_p250_sent, 255)
  :: else -> ramp_text_p250(text_p250_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_text_p250(text_p250_sent);
    assert(at == 250);
    at = 0;
    decode_text_p250(text_p250_got);
    assert(at == 250);
    equal_text_p250(text_p250_got, text_p250_sent)
  }
}

/* Business Message Reject Message: encoded, read back, and compared */
proctype check_business_message_reject_message() {
  BusinessMessageRejectMessage business_message_reject_message_sent;
  BusinessMessageRejectMessage business_message_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_business_message_reject_message(business_message_reject_message_sent, 0)
  :: pattern == 1 -> fill_business_message_reject_message(business_message_reject_message_sent, 32)
  :: pattern == 2 -> fill_business_message_reject_message(business_message_reject_message_sent, 255)
  :: else -> ramp_business_message_reject_message(business_message_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_business_message_reject_message(business_message_reject_message_sent);
    assert(at == 257);
    at = 0;
    decode_business_message_reject_message(business_message_reject_message_got);
    assert(at == 257);
    equal_business_message_reject_message(business_message_reject_message_got, business_message_reject_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_transport_header()
  :: run check_user_name()
  :: run check_time()
  :: run check_server_message_header()
  :: run check_today_date()
  :: run check_country_code()
  :: run check_previous_business_day()
  :: run check_text_p50()
  :: run check_member_code_p6()
  :: run check_session_key_challenge_message()
  :: run check_download_date()
  :: run check_date()
  :: run check_instrument_name_p5()
  :: run check_secondary_date()
  :: run check_secondary_instrument_name_p5()
  :: run check_contract()
  :: run check_market_display_data()
  :: run check_isin_code()
  :: run check_description_p62()
  :: run check_maturity_date()
  :: run check_issue_date()
  :: run check_group_description()
  :: run check_first_trade_reference()
  :: run check_display_name()
  :: run check_classification()
  :: run check_vetting_agent_name()
  :: run check_vetting_agent_contact()
  :: run check_sector()
  :: run check_security_type()
  :: run check_instruments_data()
  :: run check_expiry_date()
  :: run check_valuation_date()
  :: run check_clearance_date()
  :: run check_contract_dates()
  :: run check_strike_expiry_date()
  :: run check_strike_data()
  :: run check_member_code_p5()
  :: run check_description_p50()
  :: run check_sor_account()
  :: run check_member_data()
  :: run check_mtm_data()
  :: run check_holiday_date()
  :: run check_holiday_data()
  :: run check_instrument_type_code()
  :: run check_instrument_type_name()
  :: run check_instrument_types()
  :: run check_clearing_member_code()
  :: run check_clearing_member_description()
  :: run check_clearing_member_data()
  :: run check_announcement_date()
  :: run check_announcement_time()
  :: run check_announcement()
  :: run check_exchange_announcements()
  :: run check_message_category_value()
  :: run check_message_p255()
  :: run check_news_service()
  :: run check_coupon_date()
  :: run check_books_close_date()
  :: run check_coupon_information()
  :: run check_trading_session_name()
  :: run check_opening_auction_start_time()
  :: run check_opening_auction_close_time()
  :: run check_closing_auction_start_time()
  :: run check_closing_auction_close_time()
  :: run check_contract_open_time()
  :: run check_contract_close_time()
  :: run check_intraday_auction_one_start_time()
  :: run check_intraday_auction_one_auction_close_time()
  :: run check_intraday_auction_two_start_time()
  :: run check_intraday_auction_two_auction_close_time()
  :: run check_intraday_auction_three_start_time()
  :: run check_intraday_auction_three_auction_close_time()
  :: run check_overnight_admin_open_time()
  :: run check_overnight_admin_close_time()
  :: run check_admin_period_close_time()
  :: run check_pre_open_order_entry_open_time()
  :: run check_pre_open_order_entry_close_time()
  :: run check_trading_sessions()
  :: run check_update_time()
  :: run check_update_date()
  :: run check_indices_price_data()
  :: run check_indices_code()
  :: run check_indices_description()
  :: run check_indices_data()
  :: run check_shares_in_issue_data()
  :: run check_trade_date()
  :: run check_index_data()
  :: run check_index_constituents_data()
  :: run check_secondary_expiry_date()
  :: run check_order_contract()
  :: run check_completed_trade_message()
  :: run check_last_dealt_time()
  :: run check_display()
  :: run check_buy_who_member()
  :: run check_buy_who_unique_member()
  :: run check_sell_who_member()
  :: run check_sell_who_unique_member()
  :: run check_index_sequence_number()
  :: run check_indices_message()
  :: run check_message_p250()
  :: run check_exchange_announcements_message()
  :: run check_notification_of_failure_message()
  :: run check_reference_message_type()
  :: run check_text_p250()
  :: run check_business_message_reject_message()
  fi
}
