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
 *   - a run of a stated number of entries
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 624

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

/* ---- Client Message Header: 29 bytes ----------------------------------------- */

/* Table 2: Message Header */
typedef ClientMessageHeader {
  byte sequence_number[4];
  UserName user_name;
  byte user_number[4];
  Time time;
  byte client_message_type
};

int client_message_header_at;

/* every byte of Client Message Header set to one value */
inline fill_client_message_header(client_message_header_record, client_message_header_value) {
  client_message_header_at = 0;
  do
  :: client_message_header_at < 4 -> client_message_header_record.sequence_number[client_message_header_at] = client_message_header_value; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  fill_user_name(client_message_header_record.user_name, client_message_header_value);
  client_message_header_at = 0;
  do
  :: client_message_header_at < 4 -> client_message_header_record.user_number[client_message_header_at] = client_message_header_value; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  fill_time(client_message_header_record.time, client_message_header_value);
  client_message_header_record.client_message_type = client_message_header_value;
  skip
}

/* each byte of Client Message Header set to where it lies, so a field read out of place says so */
inline ramp_client_message_header(client_message_header_record, client_message_header_base) {
  client_message_header_at = 0;
  do
  :: client_message_header_at < 4 -> client_message_header_record.sequence_number[client_message_header_at] = (client_message_header_base + 0 + client_message_header_at + 1) % 256; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  ramp_user_name(client_message_header_record.user_name, client_message_header_base + 4);
  client_message_header_at = 0;
  do
  :: client_message_header_at < 4 -> client_message_header_record.user_number[client_message_header_at] = (client_message_header_base + 20 + client_message_header_at + 1) % 256; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  ramp_time(client_message_header_record.time, client_message_header_base + 24);
  client_message_header_record.client_message_type = (client_message_header_base + 28 + 1) % 256;
  skip
}

/* Client Message Header to the wire, 29 bytes from where the cursor stands */
inline encode_client_message_header(client_message_header_record) {
  client_message_header_at = 0;
  do
  :: client_message_header_at < 4 -> wire[at] = client_message_header_record.sequence_number[client_message_header_at]; at = at + 1; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  encode_user_name(client_message_header_record.user_name);
  client_message_header_at = 0;
  do
  :: client_message_header_at < 4 -> wire[at] = client_message_header_record.user_number[client_message_header_at]; at = at + 1; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  encode_time(client_message_header_record.time);
  wire[at] = client_message_header_record.client_message_type; at = at + 1;
  skip
}

/* Client Message Header off the wire, 29 bytes from where the cursor stands */
inline decode_client_message_header(client_message_header_record) {
  client_message_header_at = 0;
  do
  :: client_message_header_at < 4 -> client_message_header_record.sequence_number[client_message_header_at] = wire[at]; at = at + 1; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  decode_user_name(client_message_header_record.user_name);
  client_message_header_at = 0;
  do
  :: client_message_header_at < 4 -> client_message_header_record.user_number[client_message_header_at] = wire[at]; at = at + 1; client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  decode_time(client_message_header_record.time);
  client_message_header_record.client_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Client Message Header is what was written, byte for byte */
inline equal_client_message_header(client_message_header_read, client_message_header_written) {
  client_message_header_at = 0;
  do
  :: client_message_header_at < 4 -> assert(client_message_header_read.sequence_number[client_message_header_at] == client_message_header_written.sequence_number[client_message_header_at]); client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  equal_user_name(client_message_header_read.user_name, client_message_header_written.user_name);
  client_message_header_at = 0;
  do
  :: client_message_header_at < 4 -> assert(client_message_header_read.user_number[client_message_header_at] == client_message_header_written.user_number[client_message_header_at]); client_message_header_at = client_message_header_at + 1
  :: else -> break
  od;
  equal_time(client_message_header_read.time, client_message_header_written.time);
  assert(client_message_header_read.client_message_type == client_message_header_written.client_message_type);
  skip
}

/* ---- Log In Message: 624 bytes ----------------------------------------------- */

/* Log in message. */
typedef LogInMessage {
  byte encrypted_password[312];
  byte new_password[312]
};

int log_in_message_at;

/* every byte of Log In Message set to one value */
inline fill_log_in_message(log_in_message_record, log_in_message_value) {
  log_in_message_at = 0;
  do
  :: log_in_message_at < 312 -> log_in_message_record.encrypted_password[log_in_message_at] = log_in_message_value; log_in_message_at = log_in_message_at + 1
  :: else -> break
  od;
  log_in_message_at = 0;
  do
  :: log_in_message_at < 312 -> log_in_message_record.new_password[log_in_message_at] = log_in_message_value; log_in_message_at = log_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Log In Message set to where it lies, so a field read out of place says so */
inline ramp_log_in_message(log_in_message_record, log_in_message_base) {
  log_in_message_at = 0;
  do
  :: log_in_message_at < 312 -> log_in_message_record.encrypted_password[log_in_message_at] = (log_in_message_base + 0 + log_in_message_at + 1) % 256; log_in_message_at = log_in_message_at + 1
  :: else -> break
  od;
  log_in_message_at = 0;
  do
  :: log_in_message_at < 312 -> log_in_message_record.new_password[log_in_message_at] = (log_in_message_base + 312 + log_in_message_at + 1) % 256; log_in_message_at = log_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Log In Message to the wire, 624 bytes from where the cursor stands */
inline encode_log_in_message(log_in_message_record) {
  log_in_message_at = 0;
  do
  :: log_in_message_at < 312 -> wire[at] = log_in_message_record.encrypted_password[log_in_message_at]; at = at + 1; log_in_message_at = log_in_message_at + 1
  :: else -> break
  od;
  log_in_message_at = 0;
  do
  :: log_in_message_at < 312 -> wire[at] = log_in_message_record.new_password[log_in_message_at]; at = at + 1; log_in_message_at = log_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Log In Message off the wire, 624 bytes from where the cursor stands */
inline decode_log_in_message(log_in_message_record) {
  log_in_message_at = 0;
  do
  :: log_in_message_at < 312 -> log_in_message_record.encrypted_password[log_in_message_at] = wire[at]; at = at + 1; log_in_message_at = log_in_message_at + 1
  :: else -> break
  od;
  log_in_message_at = 0;
  do
  :: log_in_message_at < 312 -> log_in_message_record.new_password[log_in_message_at] = wire[at]; at = at + 1; log_in_message_at = log_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Log In Message is what was written, byte for byte */
inline equal_log_in_message(log_in_message_read, log_in_message_written) {
  log_in_message_at = 0;
  do
  :: log_in_message_at < 312 -> assert(log_in_message_read.encrypted_password[log_in_message_at] == log_in_message_written.encrypted_password[log_in_message_at]); log_in_message_at = log_in_message_at + 1
  :: else -> break
  od;
  log_in_message_at = 0;
  do
  :: log_in_message_at < 312 -> assert(log_in_message_read.new_password[log_in_message_at] == log_in_message_written.new_password[log_in_message_at]); log_in_message_at = log_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Re Request Message: 12 bytes -------------------------------------------- */

/* Re-Request of 59 messages. */
typedef ReRequestMessage {
  byte from_sequence[4];
  byte to_sequence[4];
  byte market_shard_number_i_4[4]
};

int re_request_message_at;

/* every byte of Re Request Message set to one value */
inline fill_re_request_message(re_request_message_record, re_request_message_value) {
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> re_request_message_record.from_sequence[re_request_message_at] = re_request_message_value; re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> re_request_message_record.to_sequence[re_request_message_at] = re_request_message_value; re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> re_request_message_record.market_shard_number_i_4[re_request_message_at] = re_request_message_value; re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Re Request Message set to where it lies, so a field read out of place says so */
inline ramp_re_request_message(re_request_message_record, re_request_message_base) {
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> re_request_message_record.from_sequence[re_request_message_at] = (re_request_message_base + 0 + re_request_message_at + 1) % 256; re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> re_request_message_record.to_sequence[re_request_message_at] = (re_request_message_base + 4 + re_request_message_at + 1) % 256; re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> re_request_message_record.market_shard_number_i_4[re_request_message_at] = (re_request_message_base + 8 + re_request_message_at + 1) % 256; re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Re Request Message to the wire, 12 bytes from where the cursor stands */
inline encode_re_request_message(re_request_message_record) {
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> wire[at] = re_request_message_record.from_sequence[re_request_message_at]; at = at + 1; re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> wire[at] = re_request_message_record.to_sequence[re_request_message_at]; at = at + 1; re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> wire[at] = re_request_message_record.market_shard_number_i_4[re_request_message_at]; at = at + 1; re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Re Request Message off the wire, 12 bytes from where the cursor stands */
inline decode_re_request_message(re_request_message_record) {
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> re_request_message_record.from_sequence[re_request_message_at] = wire[at]; at = at + 1; re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> re_request_message_record.to_sequence[re_request_message_at] = wire[at]; at = at + 1; re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> re_request_message_record.market_shard_number_i_4[re_request_message_at] = wire[at]; at = at + 1; re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Re Request Message is what was written, byte for byte */
inline equal_re_request_message(re_request_message_read, re_request_message_written) {
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> assert(re_request_message_read.from_sequence[re_request_message_at] == re_request_message_written.from_sequence[re_request_message_at]); re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> assert(re_request_message_read.to_sequence[re_request_message_at] == re_request_message_written.to_sequence[re_request_message_at]); re_request_message_at = re_request_message_at + 1
  :: else -> break
  od;
  re_request_message_at = 0;
  do
  :: re_request_message_at < 4 -> assert(re_request_message_read.market_shard_number_i_4[re_request_message_at] == re_request_message_written.market_shard_number_i_4[re_request_message_at]); re_request_message_at = re_request_message_at + 1
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

/* ---- Request Data Retrieval Message: 24 bytes -------------------------------- */

/* Allows users to request data from the system. */
typedef RequestDataRetrievalMessage {
  byte data_type;
  byte unused_1;
  byte last_piece_of_chunk;
  byte re_request;
  byte action[4];
  byte specific_record[4];
  DownloadDate download_date
};

int request_data_retrieval_message_at;

/* every byte of Request Data Retrieval Message set to one value */
inline fill_request_data_retrieval_message(request_data_retrieval_message_record, request_data_retrieval_message_value) {
  request_data_retrieval_message_record.data_type = request_data_retrieval_message_value;
  request_data_retrieval_message_record.unused_1 = request_data_retrieval_message_value;
  request_data_retrieval_message_record.last_piece_of_chunk = request_data_retrieval_message_value;
  request_data_retrieval_message_record.re_request = request_data_retrieval_message_value;
  request_data_retrieval_message_at = 0;
  do
  :: request_data_retrieval_message_at < 4 -> request_data_retrieval_message_record.action[request_data_retrieval_message_at] = request_data_retrieval_message_value; request_data_retrieval_message_at = request_data_retrieval_message_at + 1
  :: else -> break
  od;
  request_data_retrieval_message_at = 0;
  do
  :: request_data_retrieval_message_at < 4 -> request_data_retrieval_message_record.specific_record[request_data_retrieval_message_at] = request_data_retrieval_message_value; request_data_retrieval_message_at = request_data_retrieval_message_at + 1
  :: else -> break
  od;
  fill_download_date(request_data_retrieval_message_record.download_date, request_data_retrieval_message_value);
  skip
}

/* each byte of Request Data Retrieval Message set to where it lies, so a field read out of place says so */
inline ramp_request_data_retrieval_message(request_data_retrieval_message_record, request_data_retrieval_message_base) {
  request_data_retrieval_message_record.data_type = (request_data_retrieval_message_base + 0 + 1) % 256;
  request_data_retrieval_message_record.unused_1 = (request_data_retrieval_message_base + 1 + 1) % 256;
  request_data_retrieval_message_record.last_piece_of_chunk = (request_data_retrieval_message_base + 2 + 1) % 256;
  request_data_retrieval_message_record.re_request = (request_data_retrieval_message_base + 3 + 1) % 256;
  request_data_retrieval_message_at = 0;
  do
  :: request_data_retrieval_message_at < 4 -> request_data_retrieval_message_record.action[request_data_retrieval_message_at] = (request_data_retrieval_message_base + 4 + request_data_retrieval_message_at + 1) % 256; request_data_retrieval_message_at = request_data_retrieval_message_at + 1
  :: else -> break
  od;
  request_data_retrieval_message_at = 0;
  do
  :: request_data_retrieval_message_at < 4 -> request_data_retrieval_message_record.specific_record[request_data_retrieval_message_at] = (request_data_retrieval_message_base + 8 + request_data_retrieval_message_at + 1) % 256; request_data_retrieval_message_at = request_data_retrieval_message_at + 1
  :: else -> break
  od;
  ramp_download_date(request_data_retrieval_message_record.download_date, request_data_retrieval_message_base + 12);
  skip
}

/* Request Data Retrieval Message to the wire, 24 bytes from where the cursor stands */
inline encode_request_data_retrieval_message(request_data_retrieval_message_record) {
  wire[at] = request_data_retrieval_message_record.data_type; at = at + 1;
  wire[at] = request_data_retrieval_message_record.unused_1; at = at + 1;
  wire[at] = request_data_retrieval_message_record.last_piece_of_chunk; at = at + 1;
  wire[at] = request_data_retrieval_message_record.re_request; at = at + 1;
  request_data_retrieval_message_at = 0;
  do
  :: request_data_retrieval_message_at < 4 -> wire[at] = request_data_retrieval_message_record.action[request_data_retrieval_message_at]; at = at + 1; request_data_retrieval_message_at = request_data_retrieval_message_at + 1
  :: else -> break
  od;
  request_data_retrieval_message_at = 0;
  do
  :: request_data_retrieval_message_at < 4 -> wire[at] = request_data_retrieval_message_record.specific_record[request_data_retrieval_message_at]; at = at + 1; request_data_retrieval_message_at = request_data_retrieval_message_at + 1
  :: else -> break
  od;
  encode_download_date(request_data_retrieval_message_record.download_date);
  skip
}

/* Request Data Retrieval Message off the wire, 24 bytes from where the cursor stands */
inline decode_request_data_retrieval_message(request_data_retrieval_message_record) {
  request_data_retrieval_message_record.data_type = wire[at]; at = at + 1;
  request_data_retrieval_message_record.unused_1 = wire[at]; at = at + 1;
  request_data_retrieval_message_record.last_piece_of_chunk = wire[at]; at = at + 1;
  request_data_retrieval_message_record.re_request = wire[at]; at = at + 1;
  request_data_retrieval_message_at = 0;
  do
  :: request_data_retrieval_message_at < 4 -> request_data_retrieval_message_record.action[request_data_retrieval_message_at] = wire[at]; at = at + 1; request_data_retrieval_message_at = request_data_retrieval_message_at + 1
  :: else -> break
  od;
  request_data_retrieval_message_at = 0;
  do
  :: request_data_retrieval_message_at < 4 -> request_data_retrieval_message_record.specific_record[request_data_retrieval_message_at] = wire[at]; at = at + 1; request_data_retrieval_message_at = request_data_retrieval_message_at + 1
  :: else -> break
  od;
  decode_download_date(request_data_retrieval_message_record.download_date);
  skip
}

/* what was read of Request Data Retrieval Message is what was written, byte for byte */
inline equal_request_data_retrieval_message(request_data_retrieval_message_read, request_data_retrieval_message_written) {
  assert(request_data_retrieval_message_read.data_type == request_data_retrieval_message_written.data_type);
  assert(request_data_retrieval_message_read.unused_1 == request_data_retrieval_message_written.unused_1);
  assert(request_data_retrieval_message_read.last_piece_of_chunk == request_data_retrieval_message_written.last_piece_of_chunk);
  assert(request_data_retrieval_message_read.re_request == request_data_retrieval_message_written.re_request);
  request_data_retrieval_message_at = 0;
  do
  :: request_data_retrieval_message_at < 4 -> assert(request_data_retrieval_message_read.action[request_data_retrieval_message_at] == request_data_retrieval_message_written.action[request_data_retrieval_message_at]); request_data_retrieval_message_at = request_data_retrieval_message_at + 1
  :: else -> break
  od;
  request_data_retrieval_message_at = 0;
  do
  :: request_data_retrieval_message_at < 4 -> assert(request_data_retrieval_message_read.specific_record[request_data_retrieval_message_at] == request_data_retrieval_message_written.specific_record[request_data_retrieval_message_at]); request_data_retrieval_message_at = request_data_retrieval_message_at + 1
  :: else -> break
  od;
  equal_download_date(request_data_retrieval_message_read.download_date, request_data_retrieval_message_written.download_date);
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

/* ---- Contract Name: 48 bytes ------------------------------------------------- */

/* Contract Name */
typedef ContractName {
  byte identifier_prefix_i_4[4];
  Date date;
  InstrumentNameP5 instrument_name_p_5;
  byte strike[8];
  byte call_put_c_1;
  SecondaryDate secondary_date;
  SecondaryInstrumentNameP5 secondary_instrum_fyw9js;
  byte is_delta_option
};

int contract_name_at;

/* every byte of Contract Name set to one value */
inline fill_contract_name(contract_name_record, contract_name_value) {
  contract_name_at = 0;
  do
  :: contract_name_at < 4 -> contract_name_record.identifier_prefix_i_4[contract_name_at] = contract_name_value; contract_name_at = contract_name_at + 1
  :: else -> break
  od;
  fill_date(contract_name_record.date, contract_name_value);
  fill_instrument_name_p5(contract_name_record.instrument_name_p_5, contract_name_value);
  contract_name_at = 0;
  do
  :: contract_name_at < 8 -> contract_name_record.strike[contract_name_at] = contract_name_value; contract_name_at = contract_name_at + 1
  :: else -> break
  od;
  contract_name_record.call_put_c_1 = contract_name_value;
  fill_secondary_date(contract_name_record.secondary_date, contract_name_value);
  fill_secondary_instrument_name_p5(contract_name_record.secondary_instrum_fyw9js, contract_name_value);
  contract_name_record.is_delta_option = contract_name_value;
  skip
}

/* each byte of Contract Name set to where it lies, so a field read out of place says so */
inline ramp_contract_name(contract_name_record, contract_name_base) {
  contract_name_at = 0;
  do
  :: contract_name_at < 4 -> contract_name_record.identifier_prefix_i_4[contract_name_at] = (contract_name_base + 0 + contract_name_at + 1) % 256; contract_name_at = contract_name_at + 1
  :: else -> break
  od;
  ramp_date(contract_name_record.date, contract_name_base + 4);
  ramp_instrument_name_p5(contract_name_record.instrument_name_p_5, contract_name_base + 16);
  contract_name_at = 0;
  do
  :: contract_name_at < 8 -> contract_name_record.strike[contract_name_at] = (contract_name_base + 21 + contract_name_at + 1) % 256; contract_name_at = contract_name_at + 1
  :: else -> break
  od;
  contract_name_record.call_put_c_1 = (contract_name_base + 29 + 1) % 256;
  ramp_secondary_date(contract_name_record.secondary_date, contract_name_base + 30);
  ramp_secondary_instrument_name_p5(contract_name_record.secondary_instrum_fyw9js, contract_name_base + 42);
  contract_name_record.is_delta_option = (contract_name_base + 47 + 1) % 256;
  skip
}

/* Contract Name to the wire, 48 bytes from where the cursor stands */
inline encode_contract_name(contract_name_record) {
  contract_name_at = 0;
  do
  :: contract_name_at < 4 -> wire[at] = contract_name_record.identifier_prefix_i_4[contract_name_at]; at = at + 1; contract_name_at = contract_name_at + 1
  :: else -> break
  od;
  encode_date(contract_name_record.date);
  encode_instrument_name_p5(contract_name_record.instrument_name_p_5);
  contract_name_at = 0;
  do
  :: contract_name_at < 8 -> wire[at] = contract_name_record.strike[contract_name_at]; at = at + 1; contract_name_at = contract_name_at + 1
  :: else -> break
  od;
  wire[at] = contract_name_record.call_put_c_1; at = at + 1;
  encode_secondary_date(contract_name_record.secondary_date);
  encode_secondary_instrument_name_p5(contract_name_record.secondary_instrum_fyw9js);
  wire[at] = contract_name_record.is_delta_option; at = at + 1;
  skip
}

/* Contract Name off the wire, 48 bytes from where the cursor stands */
inline decode_contract_name(contract_name_record) {
  contract_name_at = 0;
  do
  :: contract_name_at < 4 -> contract_name_record.identifier_prefix_i_4[contract_name_at] = wire[at]; at = at + 1; contract_name_at = contract_name_at + 1
  :: else -> break
  od;
  decode_date(contract_name_record.date);
  decode_instrument_name_p5(contract_name_record.instrument_name_p_5);
  contract_name_at = 0;
  do
  :: contract_name_at < 8 -> contract_name_record.strike[contract_name_at] = wire[at]; at = at + 1; contract_name_at = contract_name_at + 1
  :: else -> break
  od;
  contract_name_record.call_put_c_1 = wire[at]; at = at + 1;
  decode_secondary_date(contract_name_record.secondary_date);
  decode_secondary_instrument_name_p5(contract_name_record.secondary_instrum_fyw9js);
  contract_name_record.is_delta_option = wire[at]; at = at + 1;
  skip
}

/* what was read of Contract Name is what was written, byte for byte */
inline equal_contract_name(contract_name_read, contract_name_written) {
  contract_name_at = 0;
  do
  :: contract_name_at < 4 -> assert(contract_name_read.identifier_prefix_i_4[contract_name_at] == contract_name_written.identifier_prefix_i_4[contract_name_at]); contract_name_at = contract_name_at + 1
  :: else -> break
  od;
  equal_date(contract_name_read.date, contract_name_written.date);
  equal_instrument_name_p5(contract_name_read.instrument_name_p_5, contract_name_written.instrument_name_p_5);
  contract_name_at = 0;
  do
  :: contract_name_at < 8 -> assert(contract_name_read.strike[contract_name_at] == contract_name_written.strike[contract_name_at]); contract_name_at = contract_name_at + 1
  :: else -> break
  od;
  assert(contract_name_read.call_put_c_1 == contract_name_written.call_put_c_1);
  equal_secondary_date(contract_name_read.secondary_date, contract_name_written.secondary_date);
  equal_secondary_instrument_name_p5(contract_name_read.secondary_instrum_fyw9js, contract_name_written.secondary_instrum_fyw9js);
  assert(contract_name_read.is_delta_option == contract_name_written.is_delta_option);
  skip
}

/* ---- Request Daily Trend Message: 48 bytes ----------------------------------- */

/* Request the on screen trade history for a contract for the current trading session. */
typedef RequestDailyTrendMessage {
  ContractName contract_name
};

/* every byte of Request Daily Trend Message set to one value */
inline fill_request_daily_trend_message(request_daily_trend_message_record, request_daily_trend_message_value) {
  fill_contract_name(request_daily_trend_message_record.contract_name, request_daily_trend_message_value);
  skip
}

/* each byte of Request Daily Trend Message set to where it lies, so a field read out of place says so */
inline ramp_request_daily_trend_message(request_daily_trend_message_record, request_daily_trend_message_base) {
  ramp_contract_name(request_daily_trend_message_record.contract_name, request_daily_trend_message_base + 0);
  skip
}

/* Request Daily Trend Message to the wire, 48 bytes from where the cursor stands */
inline encode_request_daily_trend_message(request_daily_trend_message_record) {
  encode_contract_name(request_daily_trend_message_record.contract_name);
  skip
}

/* Request Daily Trend Message off the wire, 48 bytes from where the cursor stands */
inline decode_request_daily_trend_message(request_daily_trend_message_record) {
  decode_contract_name(request_daily_trend_message_record.contract_name);
  skip
}

/* what was read of Request Daily Trend Message is what was written, byte for byte */
inline equal_request_daily_trend_message(request_daily_trend_message_read, request_daily_trend_message_written) {
  equal_contract_name(request_daily_trend_message_read.contract_name, request_daily_trend_message_written.contract_name);
  skip
}

/* ---- Option Contract Subscription Message: 48 bytes -------------------------- */

/* Subscribe to Display Updates on the contracts listed. */
typedef OptionContractSubscriptionMessage {
  ContractName contract_name
};

/* every byte of Option Contract Subscription Message set to one value */
inline fill_option_contract_subscription_message(option_contract_subscription_message_record, option_contract_subscription_message_value) {
  fill_contract_name(option_contract_subscription_message_record.contract_name, option_contract_subscription_message_value);
  skip
}

/* each byte of Option Contract Subscription Message set to where it lies, so a field read out of place says so */
inline ramp_option_contract_subscription_message(option_contract_subscription_message_record, option_contract_subscription_message_base) {
  ramp_contract_name(option_contract_subscription_message_record.contract_name, option_contract_subscription_message_base + 0);
  skip
}

/* Option Contract Subscription Message to the wire, 48 bytes from where the cursor stands */
inline encode_option_contract_subscription_message(option_contract_subscription_message_record) {
  encode_contract_name(option_contract_subscription_message_record.contract_name);
  skip
}

/* Option Contract Subscription Message off the wire, 48 bytes from where the cursor stands */
inline decode_option_contract_subscription_message(option_contract_subscription_message_record) {
  decode_contract_name(option_contract_subscription_message_record.contract_name);
  skip
}

/* what was read of Option Contract Subscription Message is what was written, byte for byte */
inline equal_option_contract_subscription_message(option_contract_subscription_message_read, option_contract_subscription_message_written) {
  equal_contract_name(option_contract_subscription_message_read.contract_name, option_contract_subscription_message_written.contract_name);
  skip
}

/* ---- Subscribing To Indices Service Message: 1 bytes ------------------------- */

/* Subscribe or unsubscribe from the indices service. */
typedef SubscribingToIndicesServiceMessage {
  byte subscribe
};

/* every byte of Subscribing To Indices Service Message set to one value */
inline fill_subscribing_to_indices_service_message(subscribing_to_indices_service_message_record, subscribing_to_indices_service_message_value) {
  subscribing_to_indices_service_message_record.subscribe = subscribing_to_indices_service_message_value;
  skip
}

/* each byte of Subscribing To Indices Service Message set to where it lies, so a field read out of place says so */
inline ramp_subscribing_to_indices_service_message(subscribing_to_indices_service_message_record, subscribing_to_indices_service_message_base) {
  subscribing_to_indices_service_message_record.subscribe = (subscribing_to_indices_service_message_base + 0 + 1) % 256;
  skip
}

/* Subscribing To Indices Service Message to the wire, 1 bytes from where the cursor stands */
inline encode_subscribing_to_indices_service_message(subscribing_to_indices_service_message_record) {
  wire[at] = subscribing_to_indices_service_message_record.subscribe; at = at + 1;
  skip
}

/* Subscribing To Indices Service Message off the wire, 1 bytes from where the cursor stands */
inline decode_subscribing_to_indices_service_message(subscribing_to_indices_service_message_record) {
  subscribing_to_indices_service_message_record.subscribe = wire[at]; at = at + 1;
  skip
}

/* what was read of Subscribing To Indices Service Message is what was written, byte for byte */
inline equal_subscribing_to_indices_service_message(subscribing_to_indices_service_message_read, subscribing_to_indices_service_message_written) {
  assert(subscribing_to_indices_service_message_read.subscribe == subscribing_to_indices_service_message_written.subscribe);
  skip
}

/* ---- Option Statistics Request Message: 48 bytes ----------------------------- */

/* Request a Display Update with information for all option contracts traded since the beginning of the trading session. */
typedef OptionStatisticsRequestMessage {
  ContractName contract_name
};

/* every byte of Option Statistics Request Message set to one value */
inline fill_option_statistics_request_message(option_statistics_request_message_record, option_statistics_request_message_value) {
  fill_contract_name(option_statistics_request_message_record.contract_name, option_statistics_request_message_value);
  skip
}

/* each byte of Option Statistics Request Message set to where it lies, so a field read out of place says so */
inline ramp_option_statistics_request_message(option_statistics_request_message_record, option_statistics_request_message_base) {
  ramp_contract_name(option_statistics_request_message_record.contract_name, option_statistics_request_message_base + 0);
  skip
}

/* Option Statistics Request Message to the wire, 48 bytes from where the cursor stands */
inline encode_option_statistics_request_message(option_statistics_request_message_record) {
  encode_contract_name(option_statistics_request_message_record.contract_name);
  skip
}

/* Option Statistics Request Message off the wire, 48 bytes from where the cursor stands */
inline decode_option_statistics_request_message(option_statistics_request_message_record) {
  decode_contract_name(option_statistics_request_message_record.contract_name);
  skip
}

/* what was read of Option Statistics Request Message is what was written, byte for byte */
inline equal_option_statistics_request_message(option_statistics_request_message_read, option_statistics_request_message_written) {
  equal_contract_name(option_statistics_request_message_read.contract_name, option_statistics_request_message_written.contract_name);
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

/* Client Message Header: encoded, read back, and compared */
proctype check_client_message_header() {
  ClientMessageHeader client_message_header_sent;
  ClientMessageHeader client_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_client_message_header(client_message_header_sent, 0)
  :: pattern == 1 -> fill_client_message_header(client_message_header_sent, 32)
  :: pattern == 2 -> fill_client_message_header(client_message_header_sent, 255)
  :: else -> ramp_client_message_header(client_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_client_message_header(client_message_header_sent);
    assert(at == 29);
    at = 0;
    decode_client_message_header(client_message_header_got);
    assert(at == 29);
    equal_client_message_header(client_message_header_got, client_message_header_sent)
  }
}

/* Log In Message: encoded, read back, and compared */
proctype check_log_in_message() {
  LogInMessage log_in_message_sent;
  LogInMessage log_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_log_in_message(log_in_message_sent, 0)
  :: pattern == 1 -> fill_log_in_message(log_in_message_sent, 32)
  :: pattern == 2 -> fill_log_in_message(log_in_message_sent, 255)
  :: else -> ramp_log_in_message(log_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_log_in_message(log_in_message_sent);
    assert(at == 624);
    at = 0;
    decode_log_in_message(log_in_message_got);
    assert(at == 624);
    equal_log_in_message(log_in_message_got, log_in_message_sent)
  }
}

/* Re Request Message: encoded, read back, and compared */
proctype check_re_request_message() {
  ReRequestMessage re_request_message_sent;
  ReRequestMessage re_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_re_request_message(re_request_message_sent, 0)
  :: pattern == 1 -> fill_re_request_message(re_request_message_sent, 32)
  :: pattern == 2 -> fill_re_request_message(re_request_message_sent, 255)
  :: else -> ramp_re_request_message(re_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_re_request_message(re_request_message_sent);
    assert(at == 12);
    at = 0;
    decode_re_request_message(re_request_message_got);
    assert(at == 12);
    equal_re_request_message(re_request_message_got, re_request_message_sent)
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

/* Request Data Retrieval Message: encoded, read back, and compared */
proctype check_request_data_retrieval_message() {
  RequestDataRetrievalMessage request_data_retrieval_message_sent;
  RequestDataRetrievalMessage request_data_retrieval_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_data_retrieval_message(request_data_retrieval_message_sent, 0)
  :: pattern == 1 -> fill_request_data_retrieval_message(request_data_retrieval_message_sent, 32)
  :: pattern == 2 -> fill_request_data_retrieval_message(request_data_retrieval_message_sent, 255)
  :: else -> ramp_request_data_retrieval_message(request_data_retrieval_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_data_retrieval_message(request_data_retrieval_message_sent);
    assert(at == 24);
    at = 0;
    decode_request_data_retrieval_message(request_data_retrieval_message_got);
    assert(at == 24);
    equal_request_data_retrieval_message(request_data_retrieval_message_got, request_data_retrieval_message_sent)
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

/* Contract Name: encoded, read back, and compared */
proctype check_contract_name() {
  ContractName contract_name_sent;
  ContractName contract_name_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contract_name(contract_name_sent, 0)
  :: pattern == 1 -> fill_contract_name(contract_name_sent, 32)
  :: pattern == 2 -> fill_contract_name(contract_name_sent, 255)
  :: else -> ramp_contract_name(contract_name_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contract_name(contract_name_sent);
    assert(at == 48);
    at = 0;
    decode_contract_name(contract_name_got);
    assert(at == 48);
    equal_contract_name(contract_name_got, contract_name_sent)
  }
}

/* Request Daily Trend Message: encoded, read back, and compared */
proctype check_request_daily_trend_message() {
  RequestDailyTrendMessage request_daily_trend_message_sent;
  RequestDailyTrendMessage request_daily_trend_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_daily_trend_message(request_daily_trend_message_sent, 0)
  :: pattern == 1 -> fill_request_daily_trend_message(request_daily_trend_message_sent, 32)
  :: pattern == 2 -> fill_request_daily_trend_message(request_daily_trend_message_sent, 255)
  :: else -> ramp_request_daily_trend_message(request_daily_trend_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_daily_trend_message(request_daily_trend_message_sent);
    assert(at == 48);
    at = 0;
    decode_request_daily_trend_message(request_daily_trend_message_got);
    assert(at == 48);
    equal_request_daily_trend_message(request_daily_trend_message_got, request_daily_trend_message_sent)
  }
}

/* Option Contract Subscription Message: encoded, read back, and compared */
proctype check_option_contract_subscription_message() {
  OptionContractSubscriptionMessage option_contract_subscription_message_sent;
  OptionContractSubscriptionMessage option_contract_subscription_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_option_contract_subscription_message(option_contract_subscription_message_sent, 0)
  :: pattern == 1 -> fill_option_contract_subscription_message(option_contract_subscription_message_sent, 32)
  :: pattern == 2 -> fill_option_contract_subscription_message(option_contract_subscription_message_sent, 255)
  :: else -> ramp_option_contract_subscription_message(option_contract_subscription_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_option_contract_subscription_message(option_contract_subscription_message_sent);
    assert(at == 48);
    at = 0;
    decode_option_contract_subscription_message(option_contract_subscription_message_got);
    assert(at == 48);
    equal_option_contract_subscription_message(option_contract_subscription_message_got, option_contract_subscription_message_sent)
  }
}

/* Subscribing To Indices Service Message: encoded, read back, and compared */
proctype check_subscribing_to_indices_service_message() {
  SubscribingToIndicesServiceMessage subscribing_to_indices_service_message_sent;
  SubscribingToIndicesServiceMessage subscribing_to_indices_service_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_subscribing_to_indices_service_message(subscribing_to_indices_service_message_sent, 0)
  :: pattern == 1 -> fill_subscribing_to_indices_service_message(subscribing_to_indices_service_message_sent, 32)
  :: pattern == 2 -> fill_subscribing_to_indices_service_message(subscribing_to_indices_service_message_sent, 255)
  :: else -> ramp_subscribing_to_indices_service_message(subscribing_to_indices_service_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_subscribing_to_indices_service_message(subscribing_to_indices_service_message_sent);
    assert(at == 1);
    at = 0;
    decode_subscribing_to_indices_service_message(subscribing_to_indices_service_message_got);
    assert(at == 1);
    equal_subscribing_to_indices_service_message(subscribing_to_indices_service_message_got, subscribing_to_indices_service_message_sent)
  }
}

/* Option Statistics Request Message: encoded, read back, and compared */
proctype check_option_statistics_request_message() {
  OptionStatisticsRequestMessage option_statistics_request_message_sent;
  OptionStatisticsRequestMessage option_statistics_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_option_statistics_request_message(option_statistics_request_message_sent, 0)
  :: pattern == 1 -> fill_option_statistics_request_message(option_statistics_request_message_sent, 32)
  :: pattern == 2 -> fill_option_statistics_request_message(option_statistics_request_message_sent, 255)
  :: else -> ramp_option_statistics_request_message(option_statistics_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_option_statistics_request_message(option_statistics_request_message_sent);
    assert(at == 48);
    at = 0;
    decode_option_statistics_request_message(option_statistics_request_message_got);
    assert(at == 48);
    equal_option_statistics_request_message(option_statistics_request_message_got, option_statistics_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_transport_header()
  :: run check_user_name()
  :: run check_time()
  :: run check_client_message_header()
  :: run check_log_in_message()
  :: run check_re_request_message()
  :: run check_download_date()
  :: run check_request_data_retrieval_message()
  :: run check_date()
  :: run check_instrument_name_p5()
  :: run check_secondary_date()
  :: run check_secondary_instrument_name_p5()
  :: run check_contract()
  :: run check_contract_name()
  :: run check_request_daily_trend_message()
  :: run check_option_contract_subscription_message()
  :: run check_subscribing_to_indices_service_message()
  :: run check_option_statistics_request_message()
  fi
}
