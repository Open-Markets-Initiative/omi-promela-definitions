/*
 * Chicago Board Options Exchange Tcp One Equities
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
 *   - a Reassemble rule
 *   - a run filling what frames it
 *   - a field read in bits
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 57

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 8 bytes -------------------------------------------------- */

typedef PacketHeader {
  byte length[2];
  byte message_count;
  byte unit;
  byte sequence[4]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = packet_header_value;
  packet_header_record.unit = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = (packet_header_base + 2 + 1) % 256;
  packet_header_record.unit = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 8 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.message_count; at = at + 1;
  wire[at] = packet_header_record.unit; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 8 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = wire[at]; at = at + 1;
  packet_header_record.unit = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.length[packet_header_at] == packet_header_written.length[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.message_count == packet_header_written.message_count);
  assert(packet_header_read.unit == packet_header_written.unit);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence[packet_header_at] == packet_header_written.sequence[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 2 bytes ------------------------------------------------- */

typedef MessageHeader {
  byte message_length;
  byte message_type
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.message_length = message_header_value;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.message_length = (message_header_base + 0 + 1) % 256;
  message_header_record.message_type = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.message_length; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.message_length = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.message_length == message_header_written.message_length);
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Cboe One Login Message: 24 bytes ---------------------------------------- */

/* The Cboe One Login message is the first message sent to the server by a user's process after its connection to the server is established. */
typedef CboeOneLoginMessage {
  byte session_sub_id[4];
  byte username[4];
  byte filler[2];
  byte password[10];
  byte next_sequence[4]
};

int cboe_one_login_message_at;

/* every byte of Cboe One Login Message set to one value */
inline fill_cboe_one_login_message(cboe_one_login_message_record, cboe_one_login_message_value) {
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> cboe_one_login_message_record.session_sub_id[cboe_one_login_message_at] = cboe_one_login_message_value; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> cboe_one_login_message_record.username[cboe_one_login_message_at] = cboe_one_login_message_value; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 2 -> cboe_one_login_message_record.filler[cboe_one_login_message_at] = cboe_one_login_message_value; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 10 -> cboe_one_login_message_record.password[cboe_one_login_message_at] = cboe_one_login_message_value; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> cboe_one_login_message_record.next_sequence[cboe_one_login_message_at] = cboe_one_login_message_value; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cboe One Login Message set to where it lies, so a field read out of place says so */
inline ramp_cboe_one_login_message(cboe_one_login_message_record, cboe_one_login_message_base) {
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> cboe_one_login_message_record.session_sub_id[cboe_one_login_message_at] = (cboe_one_login_message_base + 0 + cboe_one_login_message_at + 1) % 256; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> cboe_one_login_message_record.username[cboe_one_login_message_at] = (cboe_one_login_message_base + 4 + cboe_one_login_message_at + 1) % 256; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 2 -> cboe_one_login_message_record.filler[cboe_one_login_message_at] = (cboe_one_login_message_base + 8 + cboe_one_login_message_at + 1) % 256; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 10 -> cboe_one_login_message_record.password[cboe_one_login_message_at] = (cboe_one_login_message_base + 10 + cboe_one_login_message_at + 1) % 256; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> cboe_one_login_message_record.next_sequence[cboe_one_login_message_at] = (cboe_one_login_message_base + 20 + cboe_one_login_message_at + 1) % 256; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cboe One Login Message to the wire, 24 bytes from where the cursor stands */
inline encode_cboe_one_login_message(cboe_one_login_message_record) {
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> wire[at] = cboe_one_login_message_record.session_sub_id[cboe_one_login_message_at]; at = at + 1; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> wire[at] = cboe_one_login_message_record.username[cboe_one_login_message_at]; at = at + 1; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 2 -> wire[at] = cboe_one_login_message_record.filler[cboe_one_login_message_at]; at = at + 1; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 10 -> wire[at] = cboe_one_login_message_record.password[cboe_one_login_message_at]; at = at + 1; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> wire[at] = cboe_one_login_message_record.next_sequence[cboe_one_login_message_at]; at = at + 1; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cboe One Login Message off the wire, 24 bytes from where the cursor stands */
inline decode_cboe_one_login_message(cboe_one_login_message_record) {
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> cboe_one_login_message_record.session_sub_id[cboe_one_login_message_at] = wire[at]; at = at + 1; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> cboe_one_login_message_record.username[cboe_one_login_message_at] = wire[at]; at = at + 1; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 2 -> cboe_one_login_message_record.filler[cboe_one_login_message_at] = wire[at]; at = at + 1; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 10 -> cboe_one_login_message_record.password[cboe_one_login_message_at] = wire[at]; at = at + 1; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> cboe_one_login_message_record.next_sequence[cboe_one_login_message_at] = wire[at]; at = at + 1; cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cboe One Login Message is what was written, byte for byte */
inline equal_cboe_one_login_message(cboe_one_login_message_read, cboe_one_login_message_written) {
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> assert(cboe_one_login_message_read.session_sub_id[cboe_one_login_message_at] == cboe_one_login_message_written.session_sub_id[cboe_one_login_message_at]); cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> assert(cboe_one_login_message_read.username[cboe_one_login_message_at] == cboe_one_login_message_written.username[cboe_one_login_message_at]); cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 2 -> assert(cboe_one_login_message_read.filler[cboe_one_login_message_at] == cboe_one_login_message_written.filler[cboe_one_login_message_at]); cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 10 -> assert(cboe_one_login_message_read.password[cboe_one_login_message_at] == cboe_one_login_message_written.password[cboe_one_login_message_at]); cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  cboe_one_login_message_at = 0;
  do
  :: cboe_one_login_message_at < 4 -> assert(cboe_one_login_message_read.next_sequence[cboe_one_login_message_at] == cboe_one_login_message_written.next_sequence[cboe_one_login_message_at]); cboe_one_login_message_at = cboe_one_login_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response Message: 1 bytes ----------------------------------------- */

/* The Login Response message is sent by the server to a user's process in response to a Login message. */
typedef LoginResponseMessage {
  byte status
};

/* every byte of Login Response Message set to one value */
inline fill_login_response_message(login_response_message_record, login_response_message_value) {
  login_response_message_record.status = login_response_message_value;
  skip
}

/* each byte of Login Response Message set to where it lies, so a field read out of place says so */
inline ramp_login_response_message(login_response_message_record, login_response_message_base) {
  login_response_message_record.status = (login_response_message_base + 0 + 1) % 256;
  skip
}

/* Login Response Message to the wire, 1 bytes from where the cursor stands */
inline encode_login_response_message(login_response_message_record) {
  wire[at] = login_response_message_record.status; at = at + 1;
  skip
}

/* Login Response Message off the wire, 1 bytes from where the cursor stands */
inline decode_login_response_message(login_response_message_record) {
  login_response_message_record.status = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Response Message is what was written, byte for byte */
inline equal_login_response_message(login_response_message_read, login_response_message_written) {
  assert(login_response_message_read.status == login_response_message_written.status);
  skip
}

/* ---- Replay Complete Message: 4 bytes ---------------------------------------- */

/* The Replay Complete message is sent to indicate that messages related to refreshing the state of the Cboe books have been delivered. */
typedef ReplayCompleteMessage {
  byte sequence[4]
};

int replay_complete_message_at;

/* every byte of Replay Complete Message set to one value */
inline fill_replay_complete_message(replay_complete_message_record, replay_complete_message_value) {
  replay_complete_message_at = 0;
  do
  :: replay_complete_message_at < 4 -> replay_complete_message_record.sequence[replay_complete_message_at] = replay_complete_message_value; replay_complete_message_at = replay_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replay Complete Message set to where it lies, so a field read out of place says so */
inline ramp_replay_complete_message(replay_complete_message_record, replay_complete_message_base) {
  replay_complete_message_at = 0;
  do
  :: replay_complete_message_at < 4 -> replay_complete_message_record.sequence[replay_complete_message_at] = (replay_complete_message_base + 0 + replay_complete_message_at + 1) % 256; replay_complete_message_at = replay_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Complete Message to the wire, 4 bytes from where the cursor stands */
inline encode_replay_complete_message(replay_complete_message_record) {
  replay_complete_message_at = 0;
  do
  :: replay_complete_message_at < 4 -> wire[at] = replay_complete_message_record.sequence[replay_complete_message_at]; at = at + 1; replay_complete_message_at = replay_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Complete Message off the wire, 4 bytes from where the cursor stands */
inline decode_replay_complete_message(replay_complete_message_record) {
  replay_complete_message_at = 0;
  do
  :: replay_complete_message_at < 4 -> replay_complete_message_record.sequence[replay_complete_message_at] = wire[at]; at = at + 1; replay_complete_message_at = replay_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replay Complete Message is what was written, byte for byte */
inline equal_replay_complete_message(replay_complete_message_read, replay_complete_message_written) {
  replay_complete_message_at = 0;
  do
  :: replay_complete_message_at < 4 -> assert(replay_complete_message_read.sequence[replay_complete_message_at] == replay_complete_message_written.sequence[replay_complete_message_at]); replay_complete_message_at = replay_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Clear Quote Message: 17 bytes ------------------------------------------- */

/* The Clear Quote message instructs feed recipients to clear all quotes and Summary and/or ADAP information for the specified symbol on the specified market(s). */
typedef ClearQuoteMessage {
  byte last_update_timestamp[8];
  byte symbol[8];
  byte market_center
};

int clear_quote_message_at;

/* every byte of Clear Quote Message set to one value */
inline fill_clear_quote_message(clear_quote_message_record, clear_quote_message_value) {
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> clear_quote_message_record.last_update_timestamp[clear_quote_message_at] = clear_quote_message_value; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> clear_quote_message_record.symbol[clear_quote_message_at] = clear_quote_message_value; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_record.market_center = clear_quote_message_value;
  skip
}

/* each byte of Clear Quote Message set to where it lies, so a field read out of place says so */
inline ramp_clear_quote_message(clear_quote_message_record, clear_quote_message_base) {
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> clear_quote_message_record.last_update_timestamp[clear_quote_message_at] = (clear_quote_message_base + 0 + clear_quote_message_at + 1) % 256; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> clear_quote_message_record.symbol[clear_quote_message_at] = (clear_quote_message_base + 8 + clear_quote_message_at + 1) % 256; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_record.market_center = (clear_quote_message_base + 16 + 1) % 256;
  skip
}

/* Clear Quote Message to the wire, 17 bytes from where the cursor stands */
inline encode_clear_quote_message(clear_quote_message_record) {
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> wire[at] = clear_quote_message_record.last_update_timestamp[clear_quote_message_at]; at = at + 1; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> wire[at] = clear_quote_message_record.symbol[clear_quote_message_at]; at = at + 1; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = clear_quote_message_record.market_center; at = at + 1;
  skip
}

/* Clear Quote Message off the wire, 17 bytes from where the cursor stands */
inline decode_clear_quote_message(clear_quote_message_record) {
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> clear_quote_message_record.last_update_timestamp[clear_quote_message_at] = wire[at]; at = at + 1; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> clear_quote_message_record.symbol[clear_quote_message_at] = wire[at]; at = at + 1; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_record.market_center = wire[at]; at = at + 1;
  skip
}

/* what was read of Clear Quote Message is what was written, byte for byte */
inline equal_clear_quote_message(clear_quote_message_read, clear_quote_message_written) {
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> assert(clear_quote_message_read.last_update_timestamp[clear_quote_message_at] == clear_quote_message_written.last_update_timestamp[clear_quote_message_at]); clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> assert(clear_quote_message_read.symbol[clear_quote_message_at] == clear_quote_message_written.symbol[clear_quote_message_at]); clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  assert(clear_quote_message_read.market_center == clear_quote_message_written.market_center);
  skip
}

/* ---- Best Quote Update Message: 33 bytes ------------------------------------- */

/* The Best Quote Update message is used to update one side of the Cboe consolidated quote information for a symbol. */
typedef BestQuoteUpdateMessage {
  byte last_update_timestamp[8];
  byte symbol[8];
  byte side_indicator;
  byte consolidated_best_quote_price[8];
  byte consolidated_quote_quantity[8]
};

int best_quote_update_message_at;

/* every byte of Best Quote Update Message set to one value */
inline fill_best_quote_update_message(best_quote_update_message_record, best_quote_update_message_value) {
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.last_update_timestamp[best_quote_update_message_at] = best_quote_update_message_value; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.symbol[best_quote_update_message_at] = best_quote_update_message_value; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_record.side_indicator = best_quote_update_message_value;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.consolidated_best_quote_price[best_quote_update_message_at] = best_quote_update_message_value; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.consolidated_quote_quantity[best_quote_update_message_at] = best_quote_update_message_value; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Quote Update Message set to where it lies, so a field read out of place says so */
inline ramp_best_quote_update_message(best_quote_update_message_record, best_quote_update_message_base) {
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.last_update_timestamp[best_quote_update_message_at] = (best_quote_update_message_base + 0 + best_quote_update_message_at + 1) % 256; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.symbol[best_quote_update_message_at] = (best_quote_update_message_base + 8 + best_quote_update_message_at + 1) % 256; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_record.side_indicator = (best_quote_update_message_base + 16 + 1) % 256;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.consolidated_best_quote_price[best_quote_update_message_at] = (best_quote_update_message_base + 17 + best_quote_update_message_at + 1) % 256; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.consolidated_quote_quantity[best_quote_update_message_at] = (best_quote_update_message_base + 25 + best_quote_update_message_at + 1) % 256; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Quote Update Message to the wire, 33 bytes from where the cursor stands */
inline encode_best_quote_update_message(best_quote_update_message_record) {
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> wire[at] = best_quote_update_message_record.last_update_timestamp[best_quote_update_message_at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> wire[at] = best_quote_update_message_record.symbol[best_quote_update_message_at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  wire[at] = best_quote_update_message_record.side_indicator; at = at + 1;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> wire[at] = best_quote_update_message_record.consolidated_best_quote_price[best_quote_update_message_at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> wire[at] = best_quote_update_message_record.consolidated_quote_quantity[best_quote_update_message_at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Quote Update Message off the wire, 33 bytes from where the cursor stands */
inline decode_best_quote_update_message(best_quote_update_message_record) {
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.last_update_timestamp[best_quote_update_message_at] = wire[at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.symbol[best_quote_update_message_at] = wire[at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_record.side_indicator = wire[at]; at = at + 1;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.consolidated_best_quote_price[best_quote_update_message_at] = wire[at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.consolidated_quote_quantity[best_quote_update_message_at] = wire[at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Quote Update Message is what was written, byte for byte */
inline equal_best_quote_update_message(best_quote_update_message_read, best_quote_update_message_written) {
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> assert(best_quote_update_message_read.last_update_timestamp[best_quote_update_message_at] == best_quote_update_message_written.last_update_timestamp[best_quote_update_message_at]); best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> assert(best_quote_update_message_read.symbol[best_quote_update_message_at] == best_quote_update_message_written.symbol[best_quote_update_message_at]); best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  assert(best_quote_update_message_read.side_indicator == best_quote_update_message_written.side_indicator);
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> assert(best_quote_update_message_read.consolidated_best_quote_price[best_quote_update_message_at] == best_quote_update_message_written.consolidated_best_quote_price[best_quote_update_message_at]); best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> assert(best_quote_update_message_read.consolidated_quote_quantity[best_quote_update_message_at] == best_quote_update_message_written.consolidated_quote_quantity[best_quote_update_message_at]); best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cboe Market Status Message: 11 bytes ------------------------------------ */

/* The Cboe Market Status message is disseminated to reflect a change in the status of a market. */
typedef CboeMarketStatusMessage {
  byte timestamp[8];
  byte market_center;
  byte market_status;
  byte session_indicator
};

int cboe_market_status_message_at;

/* every byte of Cboe Market Status Message set to one value */
inline fill_cboe_market_status_message(cboe_market_status_message_record, cboe_market_status_message_value) {
  cboe_market_status_message_at = 0;
  do
  :: cboe_market_status_message_at < 8 -> cboe_market_status_message_record.timestamp[cboe_market_status_message_at] = cboe_market_status_message_value; cboe_market_status_message_at = cboe_market_status_message_at + 1
  :: else -> break
  od;
  cboe_market_status_message_record.market_center = cboe_market_status_message_value;
  cboe_market_status_message_record.market_status = cboe_market_status_message_value;
  cboe_market_status_message_record.session_indicator = cboe_market_status_message_value;
  skip
}

/* each byte of Cboe Market Status Message set to where it lies, so a field read out of place says so */
inline ramp_cboe_market_status_message(cboe_market_status_message_record, cboe_market_status_message_base) {
  cboe_market_status_message_at = 0;
  do
  :: cboe_market_status_message_at < 8 -> cboe_market_status_message_record.timestamp[cboe_market_status_message_at] = (cboe_market_status_message_base + 0 + cboe_market_status_message_at + 1) % 256; cboe_market_status_message_at = cboe_market_status_message_at + 1
  :: else -> break
  od;
  cboe_market_status_message_record.market_center = (cboe_market_status_message_base + 8 + 1) % 256;
  cboe_market_status_message_record.market_status = (cboe_market_status_message_base + 9 + 1) % 256;
  cboe_market_status_message_record.session_indicator = (cboe_market_status_message_base + 10 + 1) % 256;
  skip
}

/* Cboe Market Status Message to the wire, 11 bytes from where the cursor stands */
inline encode_cboe_market_status_message(cboe_market_status_message_record) {
  cboe_market_status_message_at = 0;
  do
  :: cboe_market_status_message_at < 8 -> wire[at] = cboe_market_status_message_record.timestamp[cboe_market_status_message_at]; at = at + 1; cboe_market_status_message_at = cboe_market_status_message_at + 1
  :: else -> break
  od;
  wire[at] = cboe_market_status_message_record.market_center; at = at + 1;
  wire[at] = cboe_market_status_message_record.market_status; at = at + 1;
  wire[at] = cboe_market_status_message_record.session_indicator; at = at + 1;
  skip
}

/* Cboe Market Status Message off the wire, 11 bytes from where the cursor stands */
inline decode_cboe_market_status_message(cboe_market_status_message_record) {
  cboe_market_status_message_at = 0;
  do
  :: cboe_market_status_message_at < 8 -> cboe_market_status_message_record.timestamp[cboe_market_status_message_at] = wire[at]; at = at + 1; cboe_market_status_message_at = cboe_market_status_message_at + 1
  :: else -> break
  od;
  cboe_market_status_message_record.market_center = wire[at]; at = at + 1;
  cboe_market_status_message_record.market_status = wire[at]; at = at + 1;
  cboe_market_status_message_record.session_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Cboe Market Status Message is what was written, byte for byte */
inline equal_cboe_market_status_message(cboe_market_status_message_read, cboe_market_status_message_written) {
  cboe_market_status_message_at = 0;
  do
  :: cboe_market_status_message_at < 8 -> assert(cboe_market_status_message_read.timestamp[cboe_market_status_message_at] == cboe_market_status_message_written.timestamp[cboe_market_status_message_at]); cboe_market_status_message_at = cboe_market_status_message_at + 1
  :: else -> break
  od;
  assert(cboe_market_status_message_read.market_center == cboe_market_status_message_written.market_center);
  assert(cboe_market_status_message_read.market_status == cboe_market_status_message_written.market_status);
  assert(cboe_market_status_message_read.session_indicator == cboe_market_status_message_written.session_indicator);
  skip
}

/* ---- Short Update Adap Block: 10 bytes --------------------------------------- */

/* Short Update ADAP Block */
typedef ShortUpdateAdapBlock {
  byte market_center;
  byte side;
  byte price_short[4];
  byte quantity_short[4]
};

int short_update_adap_block_at;

/* every byte of Short Update Adap Block set to one value */
inline fill_short_update_adap_block(short_update_adap_block_record, short_update_adap_block_value) {
  short_update_adap_block_record.market_center = short_update_adap_block_value;
  short_update_adap_block_record.side = short_update_adap_block_value;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.price_short[short_update_adap_block_at] = short_update_adap_block_value; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.quantity_short[short_update_adap_block_at] = short_update_adap_block_value; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Update Adap Block set to where it lies, so a field read out of place says so */
inline ramp_short_update_adap_block(short_update_adap_block_record, short_update_adap_block_base) {
  short_update_adap_block_record.market_center = (short_update_adap_block_base + 0 + 1) % 256;
  short_update_adap_block_record.side = (short_update_adap_block_base + 1 + 1) % 256;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.price_short[short_update_adap_block_at] = (short_update_adap_block_base + 2 + short_update_adap_block_at + 1) % 256; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.quantity_short[short_update_adap_block_at] = (short_update_adap_block_base + 6 + short_update_adap_block_at + 1) % 256; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* Short Update Adap Block to the wire, 10 bytes from where the cursor stands */
inline encode_short_update_adap_block(short_update_adap_block_record) {
  wire[at] = short_update_adap_block_record.market_center; at = at + 1;
  wire[at] = short_update_adap_block_record.side; at = at + 1;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> wire[at] = short_update_adap_block_record.price_short[short_update_adap_block_at]; at = at + 1; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> wire[at] = short_update_adap_block_record.quantity_short[short_update_adap_block_at]; at = at + 1; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* Short Update Adap Block off the wire, 10 bytes from where the cursor stands */
inline decode_short_update_adap_block(short_update_adap_block_record) {
  short_update_adap_block_record.market_center = wire[at]; at = at + 1;
  short_update_adap_block_record.side = wire[at]; at = at + 1;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.price_short[short_update_adap_block_at] = wire[at]; at = at + 1; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.quantity_short[short_update_adap_block_at] = wire[at]; at = at + 1; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Update Adap Block is what was written, byte for byte */
inline equal_short_update_adap_block(short_update_adap_block_read, short_update_adap_block_written) {
  assert(short_update_adap_block_read.market_center == short_update_adap_block_written.market_center);
  assert(short_update_adap_block_read.side == short_update_adap_block_written.side);
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> assert(short_update_adap_block_read.price_short[short_update_adap_block_at] == short_update_adap_block_written.price_short[short_update_adap_block_at]); short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> assert(short_update_adap_block_read.quantity_short[short_update_adap_block_at] == short_update_adap_block_written.quantity_short[short_update_adap_block_at]); short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Update Adap Block: 18 bytes ---------------------------------------- */

/* Long Update ADAP Block */
typedef LongUpdateAdapBlock {
  byte market_center;
  byte side;
  byte price_long[8];
  byte quantity_long[8]
};

int long_update_adap_block_at;

/* every byte of Long Update Adap Block set to one value */
inline fill_long_update_adap_block(long_update_adap_block_record, long_update_adap_block_value) {
  long_update_adap_block_record.market_center = long_update_adap_block_value;
  long_update_adap_block_record.side = long_update_adap_block_value;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.price_long[long_update_adap_block_at] = long_update_adap_block_value; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.quantity_long[long_update_adap_block_at] = long_update_adap_block_value; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Update Adap Block set to where it lies, so a field read out of place says so */
inline ramp_long_update_adap_block(long_update_adap_block_record, long_update_adap_block_base) {
  long_update_adap_block_record.market_center = (long_update_adap_block_base + 0 + 1) % 256;
  long_update_adap_block_record.side = (long_update_adap_block_base + 1 + 1) % 256;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.price_long[long_update_adap_block_at] = (long_update_adap_block_base + 2 + long_update_adap_block_at + 1) % 256; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.quantity_long[long_update_adap_block_at] = (long_update_adap_block_base + 10 + long_update_adap_block_at + 1) % 256; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* Long Update Adap Block to the wire, 18 bytes from where the cursor stands */
inline encode_long_update_adap_block(long_update_adap_block_record) {
  wire[at] = long_update_adap_block_record.market_center; at = at + 1;
  wire[at] = long_update_adap_block_record.side; at = at + 1;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> wire[at] = long_update_adap_block_record.price_long[long_update_adap_block_at]; at = at + 1; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> wire[at] = long_update_adap_block_record.quantity_long[long_update_adap_block_at]; at = at + 1; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* Long Update Adap Block off the wire, 18 bytes from where the cursor stands */
inline decode_long_update_adap_block(long_update_adap_block_record) {
  long_update_adap_block_record.market_center = wire[at]; at = at + 1;
  long_update_adap_block_record.side = wire[at]; at = at + 1;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.price_long[long_update_adap_block_at] = wire[at]; at = at + 1; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.quantity_long[long_update_adap_block_at] = wire[at]; at = at + 1; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Update Adap Block is what was written, byte for byte */
inline equal_long_update_adap_block(long_update_adap_block_read, long_update_adap_block_written) {
  assert(long_update_adap_block_read.market_center == long_update_adap_block_written.market_center);
  assert(long_update_adap_block_read.side == long_update_adap_block_written.side);
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> assert(long_update_adap_block_read.price_long[long_update_adap_block_at] == long_update_adap_block_written.price_long[long_update_adap_block_at]); long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> assert(long_update_adap_block_read.quantity_long[long_update_adap_block_at] == long_update_adap_block_written.quantity_long[long_update_adap_block_at]); long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Rpi Message: 18 bytes --------------------------------------------------- */

/* The Retail Price Improvement (RPI) message is a retail liquidity indicator that includes symbol and side, but not price and size. */
typedef RpiMessage {
  byte timestamp[8];
  byte symbol[8];
  byte market_center;
  byte retail_price_improvement
};

int rpi_message_at;

/* every byte of Rpi Message set to one value */
inline fill_rpi_message(rpi_message_record, rpi_message_value) {
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> rpi_message_record.timestamp[rpi_message_at] = rpi_message_value; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> rpi_message_record.symbol[rpi_message_at] = rpi_message_value; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_record.market_center = rpi_message_value;
  rpi_message_record.retail_price_improvement = rpi_message_value;
  skip
}

/* each byte of Rpi Message set to where it lies, so a field read out of place says so */
inline ramp_rpi_message(rpi_message_record, rpi_message_base) {
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> rpi_message_record.timestamp[rpi_message_at] = (rpi_message_base + 0 + rpi_message_at + 1) % 256; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> rpi_message_record.symbol[rpi_message_at] = (rpi_message_base + 8 + rpi_message_at + 1) % 256; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_record.market_center = (rpi_message_base + 16 + 1) % 256;
  rpi_message_record.retail_price_improvement = (rpi_message_base + 17 + 1) % 256;
  skip
}

/* Rpi Message to the wire, 18 bytes from where the cursor stands */
inline encode_rpi_message(rpi_message_record) {
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> wire[at] = rpi_message_record.timestamp[rpi_message_at]; at = at + 1; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> wire[at] = rpi_message_record.symbol[rpi_message_at]; at = at + 1; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  wire[at] = rpi_message_record.market_center; at = at + 1;
  wire[at] = rpi_message_record.retail_price_improvement; at = at + 1;
  skip
}

/* Rpi Message off the wire, 18 bytes from where the cursor stands */
inline decode_rpi_message(rpi_message_record) {
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> rpi_message_record.timestamp[rpi_message_at] = wire[at]; at = at + 1; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> rpi_message_record.symbol[rpi_message_at] = wire[at]; at = at + 1; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_record.market_center = wire[at]; at = at + 1;
  rpi_message_record.retail_price_improvement = wire[at]; at = at + 1;
  skip
}

/* what was read of Rpi Message is what was written, byte for byte */
inline equal_rpi_message(rpi_message_read, rpi_message_written) {
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> assert(rpi_message_read.timestamp[rpi_message_at] == rpi_message_written.timestamp[rpi_message_at]); rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> assert(rpi_message_read.symbol[rpi_message_at] == rpi_message_written.symbol[rpi_message_at]); rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  assert(rpi_message_read.market_center == rpi_message_written.market_center);
  assert(rpi_message_read.retail_price_improvement == rpi_message_written.retail_price_improvement);
  skip
}

/* ---- Trading Status Message: 19 bytes ---------------------------------------- */

/* The Trading Status message is used to indicate the current trading status of a security on a Cboe exchange. */
typedef TradingStatusMessage {
  byte timestamp[8];
  byte symbol[8];
  byte market_center;
  byte trading_status;
  byte reg_sho_action
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.market_center = trading_status_message_value;
  trading_status_message_record.trading_status = trading_status_message_value;
  trading_status_message_record.reg_sho_action = trading_status_message_value;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol[trading_status_message_at] = (trading_status_message_base + 8 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.market_center = (trading_status_message_base + 16 + 1) % 256;
  trading_status_message_record.trading_status = (trading_status_message_base + 17 + 1) % 256;
  trading_status_message_record.reg_sho_action = (trading_status_message_base + 18 + 1) % 256;
  skip
}

/* Trading Status Message to the wire, 19 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.timestamp[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.symbol[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.market_center; at = at + 1;
  wire[at] = trading_status_message_record.trading_status; at = at + 1;
  wire[at] = trading_status_message_record.reg_sho_action; at = at + 1;
  skip
}

/* Trading Status Message off the wire, 19 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.market_center = wire[at]; at = at + 1;
  trading_status_message_record.trading_status = wire[at]; at = at + 1;
  trading_status_message_record.reg_sho_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.timestamp[trading_status_message_at] == trading_status_message_written.timestamp[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.symbol[trading_status_message_at] == trading_status_message_written.symbol[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.market_center == trading_status_message_written.market_center);
  assert(trading_status_message_read.trading_status == trading_status_message_written.trading_status);
  assert(trading_status_message_read.reg_sho_action == trading_status_message_written.reg_sho_action);
  skip
}

/* ---- Opening Closing Price Message: 26 bytes --------------------------------- */

/* The Opening/Closing Price message is used to indicate the Opening or Closing price of a security on any of the Cboe markets and the primary listing market. */
typedef OpeningClosingPriceMessage {
  byte timestamp[8];
  byte symbol[8];
  byte market_center;
  byte open_close_indicator;
  byte price_long[8]
};

int opening_closing_price_message_at;

/* every byte of Opening Closing Price Message set to one value */
inline fill_opening_closing_price_message(opening_closing_price_message_record, opening_closing_price_message_value) {
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.timestamp[opening_closing_price_message_at] = opening_closing_price_message_value; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.symbol[opening_closing_price_message_at] = opening_closing_price_message_value; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_record.market_center = opening_closing_price_message_value;
  opening_closing_price_message_record.open_close_indicator = opening_closing_price_message_value;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.price_long[opening_closing_price_message_at] = opening_closing_price_message_value; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Opening Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_opening_closing_price_message(opening_closing_price_message_record, opening_closing_price_message_base) {
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.timestamp[opening_closing_price_message_at] = (opening_closing_price_message_base + 0 + opening_closing_price_message_at + 1) % 256; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.symbol[opening_closing_price_message_at] = (opening_closing_price_message_base + 8 + opening_closing_price_message_at + 1) % 256; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_record.market_center = (opening_closing_price_message_base + 16 + 1) % 256;
  opening_closing_price_message_record.open_close_indicator = (opening_closing_price_message_base + 17 + 1) % 256;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.price_long[opening_closing_price_message_at] = (opening_closing_price_message_base + 18 + opening_closing_price_message_at + 1) % 256; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Closing Price Message to the wire, 26 bytes from where the cursor stands */
inline encode_opening_closing_price_message(opening_closing_price_message_record) {
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> wire[at] = opening_closing_price_message_record.timestamp[opening_closing_price_message_at]; at = at + 1; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> wire[at] = opening_closing_price_message_record.symbol[opening_closing_price_message_at]; at = at + 1; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  wire[at] = opening_closing_price_message_record.market_center; at = at + 1;
  wire[at] = opening_closing_price_message_record.open_close_indicator; at = at + 1;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> wire[at] = opening_closing_price_message_record.price_long[opening_closing_price_message_at]; at = at + 1; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Closing Price Message off the wire, 26 bytes from where the cursor stands */
inline decode_opening_closing_price_message(opening_closing_price_message_record) {
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.timestamp[opening_closing_price_message_at] = wire[at]; at = at + 1; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.symbol[opening_closing_price_message_at] = wire[at]; at = at + 1; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_record.market_center = wire[at]; at = at + 1;
  opening_closing_price_message_record.open_close_indicator = wire[at]; at = at + 1;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.price_long[opening_closing_price_message_at] = wire[at]; at = at + 1; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Opening Closing Price Message is what was written, byte for byte */
inline equal_opening_closing_price_message(opening_closing_price_message_read, opening_closing_price_message_written) {
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> assert(opening_closing_price_message_read.timestamp[opening_closing_price_message_at] == opening_closing_price_message_written.timestamp[opening_closing_price_message_at]); opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> assert(opening_closing_price_message_read.symbol[opening_closing_price_message_at] == opening_closing_price_message_written.symbol[opening_closing_price_message_at]); opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  assert(opening_closing_price_message_read.market_center == opening_closing_price_message_written.market_center);
  assert(opening_closing_price_message_read.open_close_indicator == opening_closing_price_message_written.open_close_indicator);
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> assert(opening_closing_price_message_read.price_long[opening_closing_price_message_at] == opening_closing_price_message_written.price_long[opening_closing_price_message_at]); opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Fractional End Of Day Summary Message: 57 bytes ------------------------- */

/* The Fractional End of Day Summary message is used to give a consolidated, high-level overview of a security for the day. */
typedef FractionalEndOfDaySummaryMessage {
  byte timestamp[8];
  byte symbol[8];
  byte data_source;
  byte opening_price[8];
  byte closing_price[8];
  byte high_price[8];
  byte low_price[8];
  byte national_cumulative_volume[8]
};

int fractional_end_of_day_summary_message_at;

/* every byte of Fractional End Of Day Summary Message set to one value */
inline fill_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_record, fractional_end_of_day_summary_message_value) {
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.timestamp[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.symbol[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_record.data_source = fractional_end_of_day_summary_message_value;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.opening_price[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.closing_price[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.high_price[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.low_price[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.national_cumulative_volume[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Fractional End Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_record, fractional_end_of_day_summary_message_base) {
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.timestamp[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 0 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.symbol[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 8 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_record.data_source = (fractional_end_of_day_summary_message_base + 16 + 1) % 256;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.opening_price[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 17 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.closing_price[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 25 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.high_price[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 33 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.low_price[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 41 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.national_cumulative_volume[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 49 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional End Of Day Summary Message to the wire, 57 bytes from where the cursor stands */
inline encode_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_record) {
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.timestamp[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.symbol[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_end_of_day_summary_message_record.data_source; at = at + 1;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.opening_price[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.closing_price[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.high_price[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.low_price[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.national_cumulative_volume[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional End Of Day Summary Message off the wire, 57 bytes from where the cursor stands */
inline decode_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_record) {
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.timestamp[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.symbol[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_record.data_source = wire[at]; at = at + 1;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.opening_price[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.closing_price[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.high_price[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.low_price[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.national_cumulative_volume[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Fractional End Of Day Summary Message is what was written, byte for byte */
inline equal_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_read, fractional_end_of_day_summary_message_written) {
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.timestamp[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.timestamp[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.symbol[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.symbol[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(fractional_end_of_day_summary_message_read.data_source == fractional_end_of_day_summary_message_written.data_source);
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.opening_price[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.opening_price[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.closing_price[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.closing_price[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.high_price[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.high_price[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.low_price[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.low_price[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.national_cumulative_volume[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.national_cumulative_volume[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
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
    assert(at == 8);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 8);
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
    assert(at == 2);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 2);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Cboe One Login Message: encoded, read back, and compared */
proctype check_cboe_one_login_message() {
  CboeOneLoginMessage cboe_one_login_message_sent;
  CboeOneLoginMessage cboe_one_login_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cboe_one_login_message(cboe_one_login_message_sent, 0)
  :: pattern == 1 -> fill_cboe_one_login_message(cboe_one_login_message_sent, 32)
  :: pattern == 2 -> fill_cboe_one_login_message(cboe_one_login_message_sent, 255)
  :: else -> ramp_cboe_one_login_message(cboe_one_login_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cboe_one_login_message(cboe_one_login_message_sent);
    assert(at == 24);
    at = 0;
    decode_cboe_one_login_message(cboe_one_login_message_got);
    assert(at == 24);
    equal_cboe_one_login_message(cboe_one_login_message_got, cboe_one_login_message_sent)
  }
}

/* Login Response Message: encoded, read back, and compared */
proctype check_login_response_message() {
  LoginResponseMessage login_response_message_sent;
  LoginResponseMessage login_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_response_message(login_response_message_sent, 0)
  :: pattern == 1 -> fill_login_response_message(login_response_message_sent, 32)
  :: pattern == 2 -> fill_login_response_message(login_response_message_sent, 255)
  :: else -> ramp_login_response_message(login_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_response_message(login_response_message_sent);
    assert(at == 1);
    at = 0;
    decode_login_response_message(login_response_message_got);
    assert(at == 1);
    equal_login_response_message(login_response_message_got, login_response_message_sent)
  }
}

/* Replay Complete Message: encoded, read back, and compared */
proctype check_replay_complete_message() {
  ReplayCompleteMessage replay_complete_message_sent;
  ReplayCompleteMessage replay_complete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_complete_message(replay_complete_message_sent, 0)
  :: pattern == 1 -> fill_replay_complete_message(replay_complete_message_sent, 32)
  :: pattern == 2 -> fill_replay_complete_message(replay_complete_message_sent, 255)
  :: else -> ramp_replay_complete_message(replay_complete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_complete_message(replay_complete_message_sent);
    assert(at == 4);
    at = 0;
    decode_replay_complete_message(replay_complete_message_got);
    assert(at == 4);
    equal_replay_complete_message(replay_complete_message_got, replay_complete_message_sent)
  }
}

/* Clear Quote Message: encoded, read back, and compared */
proctype check_clear_quote_message() {
  ClearQuoteMessage clear_quote_message_sent;
  ClearQuoteMessage clear_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clear_quote_message(clear_quote_message_sent, 0)
  :: pattern == 1 -> fill_clear_quote_message(clear_quote_message_sent, 32)
  :: pattern == 2 -> fill_clear_quote_message(clear_quote_message_sent, 255)
  :: else -> ramp_clear_quote_message(clear_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clear_quote_message(clear_quote_message_sent);
    assert(at == 17);
    at = 0;
    decode_clear_quote_message(clear_quote_message_got);
    assert(at == 17);
    equal_clear_quote_message(clear_quote_message_got, clear_quote_message_sent)
  }
}

/* Best Quote Update Message: encoded, read back, and compared */
proctype check_best_quote_update_message() {
  BestQuoteUpdateMessage best_quote_update_message_sent;
  BestQuoteUpdateMessage best_quote_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_quote_update_message(best_quote_update_message_sent, 0)
  :: pattern == 1 -> fill_best_quote_update_message(best_quote_update_message_sent, 32)
  :: pattern == 2 -> fill_best_quote_update_message(best_quote_update_message_sent, 255)
  :: else -> ramp_best_quote_update_message(best_quote_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_quote_update_message(best_quote_update_message_sent);
    assert(at == 33);
    at = 0;
    decode_best_quote_update_message(best_quote_update_message_got);
    assert(at == 33);
    equal_best_quote_update_message(best_quote_update_message_got, best_quote_update_message_sent)
  }
}

/* Cboe Market Status Message: encoded, read back, and compared */
proctype check_cboe_market_status_message() {
  CboeMarketStatusMessage cboe_market_status_message_sent;
  CboeMarketStatusMessage cboe_market_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cboe_market_status_message(cboe_market_status_message_sent, 0)
  :: pattern == 1 -> fill_cboe_market_status_message(cboe_market_status_message_sent, 32)
  :: pattern == 2 -> fill_cboe_market_status_message(cboe_market_status_message_sent, 255)
  :: else -> ramp_cboe_market_status_message(cboe_market_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cboe_market_status_message(cboe_market_status_message_sent);
    assert(at == 11);
    at = 0;
    decode_cboe_market_status_message(cboe_market_status_message_got);
    assert(at == 11);
    equal_cboe_market_status_message(cboe_market_status_message_got, cboe_market_status_message_sent)
  }
}

/* Short Update Adap Block: encoded, read back, and compared */
proctype check_short_update_adap_block() {
  ShortUpdateAdapBlock short_update_adap_block_sent;
  ShortUpdateAdapBlock short_update_adap_block_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_update_adap_block(short_update_adap_block_sent, 0)
  :: pattern == 1 -> fill_short_update_adap_block(short_update_adap_block_sent, 32)
  :: pattern == 2 -> fill_short_update_adap_block(short_update_adap_block_sent, 255)
  :: else -> ramp_short_update_adap_block(short_update_adap_block_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_update_adap_block(short_update_adap_block_sent);
    assert(at == 10);
    at = 0;
    decode_short_update_adap_block(short_update_adap_block_got);
    assert(at == 10);
    equal_short_update_adap_block(short_update_adap_block_got, short_update_adap_block_sent)
  }
}

/* Long Update Adap Block: encoded, read back, and compared */
proctype check_long_update_adap_block() {
  LongUpdateAdapBlock long_update_adap_block_sent;
  LongUpdateAdapBlock long_update_adap_block_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_update_adap_block(long_update_adap_block_sent, 0)
  :: pattern == 1 -> fill_long_update_adap_block(long_update_adap_block_sent, 32)
  :: pattern == 2 -> fill_long_update_adap_block(long_update_adap_block_sent, 255)
  :: else -> ramp_long_update_adap_block(long_update_adap_block_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_update_adap_block(long_update_adap_block_sent);
    assert(at == 18);
    at = 0;
    decode_long_update_adap_block(long_update_adap_block_got);
    assert(at == 18);
    equal_long_update_adap_block(long_update_adap_block_got, long_update_adap_block_sent)
  }
}

/* Rpi Message: encoded, read back, and compared */
proctype check_rpi_message() {
  RpiMessage rpi_message_sent;
  RpiMessage rpi_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rpi_message(rpi_message_sent, 0)
  :: pattern == 1 -> fill_rpi_message(rpi_message_sent, 32)
  :: pattern == 2 -> fill_rpi_message(rpi_message_sent, 255)
  :: else -> ramp_rpi_message(rpi_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rpi_message(rpi_message_sent);
    assert(at == 18);
    at = 0;
    decode_rpi_message(rpi_message_got);
    assert(at == 18);
    equal_rpi_message(rpi_message_got, rpi_message_sent)
  }
}

/* Trading Status Message: encoded, read back, and compared */
proctype check_trading_status_message() {
  TradingStatusMessage trading_status_message_sent;
  TradingStatusMessage trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_status_message(trading_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_status_message(trading_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_status_message(trading_status_message_sent, 255)
  :: else -> ramp_trading_status_message(trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_status_message(trading_status_message_sent);
    assert(at == 19);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 19);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
  }
}

/* Opening Closing Price Message: encoded, read back, and compared */
proctype check_opening_closing_price_message() {
  OpeningClosingPriceMessage opening_closing_price_message_sent;
  OpeningClosingPriceMessage opening_closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_opening_closing_price_message(opening_closing_price_message_sent, 0)
  :: pattern == 1 -> fill_opening_closing_price_message(opening_closing_price_message_sent, 32)
  :: pattern == 2 -> fill_opening_closing_price_message(opening_closing_price_message_sent, 255)
  :: else -> ramp_opening_closing_price_message(opening_closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_opening_closing_price_message(opening_closing_price_message_sent);
    assert(at == 26);
    at = 0;
    decode_opening_closing_price_message(opening_closing_price_message_got);
    assert(at == 26);
    equal_opening_closing_price_message(opening_closing_price_message_got, opening_closing_price_message_sent)
  }
}

/* Fractional End Of Day Summary Message: encoded, read back, and compared */
proctype check_fractional_end_of_day_summary_message() {
  FractionalEndOfDaySummaryMessage fractional_end_of_day_summary_message_sent;
  FractionalEndOfDaySummaryMessage fractional_end_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_sent, 255)
  :: else -> ramp_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_sent);
    assert(at == 57);
    at = 0;
    decode_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_got);
    assert(at == 57);
    equal_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_got, fractional_end_of_day_summary_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_cboe_one_login_message()
  :: run check_login_response_message()
  :: run check_replay_complete_message()
  :: run check_clear_quote_message()
  :: run check_best_quote_update_message()
  :: run check_cboe_market_status_message()
  :: run check_short_update_adap_block()
  :: run check_long_update_adap_block()
  :: run check_rpi_message()
  :: run check_trading_status_message()
  :: run check_opening_closing_price_message()
  :: run check_fractional_end_of_day_summary_message()
  fi
}
