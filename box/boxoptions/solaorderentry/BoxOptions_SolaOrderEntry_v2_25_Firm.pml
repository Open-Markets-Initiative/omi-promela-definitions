/*
 * Box Options Market Sola Order Entry
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 364

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Incoming Header: 24 bytes ----------------------------------------------- */

/* The header on all incoming participant business messages */
typedef IncomingHeader {
  byte message_type[2];
  byte user_time[6];
  byte trader_id[8];
  byte user_sequence_i_d[8]
};

int incoming_header_at;

/* every byte of Incoming Header set to one value */
inline fill_incoming_header(incoming_header_record, incoming_header_value) {
  incoming_header_at = 0;
  do
  :: incoming_header_at < 2 -> incoming_header_record.message_type[incoming_header_at] = incoming_header_value; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 6 -> incoming_header_record.user_time[incoming_header_at] = incoming_header_value; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 8 -> incoming_header_record.trader_id[incoming_header_at] = incoming_header_value; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 8 -> incoming_header_record.user_sequence_i_d[incoming_header_at] = incoming_header_value; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Incoming Header set to where it lies, so a field read out of place says so */
inline ramp_incoming_header(incoming_header_record, incoming_header_base) {
  incoming_header_at = 0;
  do
  :: incoming_header_at < 2 -> incoming_header_record.message_type[incoming_header_at] = (incoming_header_base + 0 + incoming_header_at + 1) % 256; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 6 -> incoming_header_record.user_time[incoming_header_at] = (incoming_header_base + 2 + incoming_header_at + 1) % 256; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 8 -> incoming_header_record.trader_id[incoming_header_at] = (incoming_header_base + 8 + incoming_header_at + 1) % 256; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 8 -> incoming_header_record.user_sequence_i_d[incoming_header_at] = (incoming_header_base + 16 + incoming_header_at + 1) % 256; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  skip
}

/* Incoming Header to the wire, 24 bytes from where the cursor stands */
inline encode_incoming_header(incoming_header_record) {
  incoming_header_at = 0;
  do
  :: incoming_header_at < 2 -> wire[at] = incoming_header_record.message_type[incoming_header_at]; at = at + 1; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 6 -> wire[at] = incoming_header_record.user_time[incoming_header_at]; at = at + 1; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 8 -> wire[at] = incoming_header_record.trader_id[incoming_header_at]; at = at + 1; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 8 -> wire[at] = incoming_header_record.user_sequence_i_d[incoming_header_at]; at = at + 1; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  skip
}

/* Incoming Header off the wire, 24 bytes from where the cursor stands */
inline decode_incoming_header(incoming_header_record) {
  incoming_header_at = 0;
  do
  :: incoming_header_at < 2 -> incoming_header_record.message_type[incoming_header_at] = wire[at]; at = at + 1; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 6 -> incoming_header_record.user_time[incoming_header_at] = wire[at]; at = at + 1; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 8 -> incoming_header_record.trader_id[incoming_header_at] = wire[at]; at = at + 1; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 8 -> incoming_header_record.user_sequence_i_d[incoming_header_at] = wire[at]; at = at + 1; incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Incoming Header is what was written, byte for byte */
inline equal_incoming_header(incoming_header_read, incoming_header_written) {
  incoming_header_at = 0;
  do
  :: incoming_header_at < 2 -> assert(incoming_header_read.message_type[incoming_header_at] == incoming_header_written.message_type[incoming_header_at]); incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 6 -> assert(incoming_header_read.user_time[incoming_header_at] == incoming_header_written.user_time[incoming_header_at]); incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 8 -> assert(incoming_header_read.trader_id[incoming_header_at] == incoming_header_written.trader_id[incoming_header_at]); incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  incoming_header_at = 0;
  do
  :: incoming_header_at < 8 -> assert(incoming_header_read.user_sequence_i_d[incoming_header_at] == incoming_header_written.user_sequence_i_d[incoming_header_at]); incoming_header_at = incoming_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- User Disconnection: 12 bytes -------------------------------------------- */

typedef UserDisconnection {
  byte user_id[8];
  byte session_id[4]
};

int user_disconnection_at;

/* every byte of User Disconnection set to one value */
inline fill_user_disconnection(user_disconnection_record, user_disconnection_value) {
  user_disconnection_at = 0;
  do
  :: user_disconnection_at < 8 -> user_disconnection_record.user_id[user_disconnection_at] = user_disconnection_value; user_disconnection_at = user_disconnection_at + 1
  :: else -> break
  od;
  user_disconnection_at = 0;
  do
  :: user_disconnection_at < 4 -> user_disconnection_record.session_id[user_disconnection_at] = user_disconnection_value; user_disconnection_at = user_disconnection_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Disconnection set to where it lies, so a field read out of place says so */
inline ramp_user_disconnection(user_disconnection_record, user_disconnection_base) {
  user_disconnection_at = 0;
  do
  :: user_disconnection_at < 8 -> user_disconnection_record.user_id[user_disconnection_at] = (user_disconnection_base + 0 + user_disconnection_at + 1) % 256; user_disconnection_at = user_disconnection_at + 1
  :: else -> break
  od;
  user_disconnection_at = 0;
  do
  :: user_disconnection_at < 4 -> user_disconnection_record.session_id[user_disconnection_at] = (user_disconnection_base + 8 + user_disconnection_at + 1) % 256; user_disconnection_at = user_disconnection_at + 1
  :: else -> break
  od;
  skip
}

/* User Disconnection to the wire, 12 bytes from where the cursor stands */
inline encode_user_disconnection(user_disconnection_record) {
  user_disconnection_at = 0;
  do
  :: user_disconnection_at < 8 -> wire[at] = user_disconnection_record.user_id[user_disconnection_at]; at = at + 1; user_disconnection_at = user_disconnection_at + 1
  :: else -> break
  od;
  user_disconnection_at = 0;
  do
  :: user_disconnection_at < 4 -> wire[at] = user_disconnection_record.session_id[user_disconnection_at]; at = at + 1; user_disconnection_at = user_disconnection_at + 1
  :: else -> break
  od;
  skip
}

/* User Disconnection off the wire, 12 bytes from where the cursor stands */
inline decode_user_disconnection(user_disconnection_record) {
  user_disconnection_at = 0;
  do
  :: user_disconnection_at < 8 -> user_disconnection_record.user_id[user_disconnection_at] = wire[at]; at = at + 1; user_disconnection_at = user_disconnection_at + 1
  :: else -> break
  od;
  user_disconnection_at = 0;
  do
  :: user_disconnection_at < 4 -> user_disconnection_record.session_id[user_disconnection_at] = wire[at]; at = at + 1; user_disconnection_at = user_disconnection_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Disconnection is what was written, byte for byte */
inline equal_user_disconnection(user_disconnection_read, user_disconnection_written) {
  user_disconnection_at = 0;
  do
  :: user_disconnection_at < 8 -> assert(user_disconnection_read.user_id[user_disconnection_at] == user_disconnection_written.user_id[user_disconnection_at]); user_disconnection_at = user_disconnection_at + 1
  :: else -> break
  od;
  user_disconnection_at = 0;
  do
  :: user_disconnection_at < 4 -> assert(user_disconnection_read.session_id[user_disconnection_at] == user_disconnection_written.session_id[user_disconnection_at]); user_disconnection_at = user_disconnection_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Heartbeat Response: 20 bytes -------------------------------------------- */

/* Stated by the guide as having the same number of bytes and format as TH, whose fields are written out here. */
typedef HeartbeatResponse {
  byte first_user_sequence_i_d[8];
  byte last_exchange_message_id_sent_to_participant[6];
  byte time_local[6]
};

int heartbeat_response_at;

/* every byte of Heartbeat Response set to one value */
inline fill_heartbeat_response(heartbeat_response_record, heartbeat_response_value) {
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 8 -> heartbeat_response_record.first_user_sequence_i_d[heartbeat_response_at] = heartbeat_response_value; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> heartbeat_response_record.last_exchange_message_id_sent_to_participant[heartbeat_response_at] = heartbeat_response_value; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> heartbeat_response_record.time_local[heartbeat_response_at] = heartbeat_response_value; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Response set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_response(heartbeat_response_record, heartbeat_response_base) {
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 8 -> heartbeat_response_record.first_user_sequence_i_d[heartbeat_response_at] = (heartbeat_response_base + 0 + heartbeat_response_at + 1) % 256; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> heartbeat_response_record.last_exchange_message_id_sent_to_participant[heartbeat_response_at] = (heartbeat_response_base + 8 + heartbeat_response_at + 1) % 256; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> heartbeat_response_record.time_local[heartbeat_response_at] = (heartbeat_response_base + 14 + heartbeat_response_at + 1) % 256; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Response to the wire, 20 bytes from where the cursor stands */
inline encode_heartbeat_response(heartbeat_response_record) {
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 8 -> wire[at] = heartbeat_response_record.first_user_sequence_i_d[heartbeat_response_at]; at = at + 1; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> wire[at] = heartbeat_response_record.last_exchange_message_id_sent_to_participant[heartbeat_response_at]; at = at + 1; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> wire[at] = heartbeat_response_record.time_local[heartbeat_response_at]; at = at + 1; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Response off the wire, 20 bytes from where the cursor stands */
inline decode_heartbeat_response(heartbeat_response_record) {
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 8 -> heartbeat_response_record.first_user_sequence_i_d[heartbeat_response_at] = wire[at]; at = at + 1; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> heartbeat_response_record.last_exchange_message_id_sent_to_participant[heartbeat_response_at] = wire[at]; at = at + 1; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> heartbeat_response_record.time_local[heartbeat_response_at] = wire[at]; at = at + 1; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Response is what was written, byte for byte */
inline equal_heartbeat_response(heartbeat_response_read, heartbeat_response_written) {
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 8 -> assert(heartbeat_response_read.first_user_sequence_i_d[heartbeat_response_at] == heartbeat_response_written.first_user_sequence_i_d[heartbeat_response_at]); heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> assert(heartbeat_response_read.last_exchange_message_id_sent_to_participant[heartbeat_response_at] == heartbeat_response_written.last_exchange_message_id_sent_to_participant[heartbeat_response_at]); heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> assert(heartbeat_response_read.time_local[heartbeat_response_at] == heartbeat_response_written.time_local[heartbeat_response_at]); heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Clearing Data: 20 bytes ------------------------------------------------- */

/* The guide states these fields once, as Clearing Data, for every message that carries them. */
typedef ClearingData {
  byte clearing_instruction[12];
  byte account_type;
  byte open_close;
  byte hedge_spec;
  byte clearing_operation_mode;
  byte clearing_destination[4]
};

int clearing_data_at;

/* every byte of Clearing Data set to one value */
inline fill_clearing_data(clearing_data_record, clearing_data_value) {
  clearing_data_at = 0;
  do
  :: clearing_data_at < 12 -> clearing_data_record.clearing_instruction[clearing_data_at] = clearing_data_value; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  clearing_data_record.account_type = clearing_data_value;
  clearing_data_record.open_close = clearing_data_value;
  clearing_data_record.hedge_spec = clearing_data_value;
  clearing_data_record.clearing_operation_mode = clearing_data_value;
  clearing_data_at = 0;
  do
  :: clearing_data_at < 4 -> clearing_data_record.clearing_destination[clearing_data_at] = clearing_data_value; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Clearing Data set to where it lies, so a field read out of place says so */
inline ramp_clearing_data(clearing_data_record, clearing_data_base) {
  clearing_data_at = 0;
  do
  :: clearing_data_at < 12 -> clearing_data_record.clearing_instruction[clearing_data_at] = (clearing_data_base + 0 + clearing_data_at + 1) % 256; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  clearing_data_record.account_type = (clearing_data_base + 12 + 1) % 256;
  clearing_data_record.open_close = (clearing_data_base + 13 + 1) % 256;
  clearing_data_record.hedge_spec = (clearing_data_base + 14 + 1) % 256;
  clearing_data_record.clearing_operation_mode = (clearing_data_base + 15 + 1) % 256;
  clearing_data_at = 0;
  do
  :: clearing_data_at < 4 -> clearing_data_record.clearing_destination[clearing_data_at] = (clearing_data_base + 16 + clearing_data_at + 1) % 256; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Data to the wire, 20 bytes from where the cursor stands */
inline encode_clearing_data(clearing_data_record) {
  clearing_data_at = 0;
  do
  :: clearing_data_at < 12 -> wire[at] = clearing_data_record.clearing_instruction[clearing_data_at]; at = at + 1; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  wire[at] = clearing_data_record.account_type; at = at + 1;
  wire[at] = clearing_data_record.open_close; at = at + 1;
  wire[at] = clearing_data_record.hedge_spec; at = at + 1;
  wire[at] = clearing_data_record.clearing_operation_mode; at = at + 1;
  clearing_data_at = 0;
  do
  :: clearing_data_at < 4 -> wire[at] = clearing_data_record.clearing_destination[clearing_data_at]; at = at + 1; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Data off the wire, 20 bytes from where the cursor stands */
inline decode_clearing_data(clearing_data_record) {
  clearing_data_at = 0;
  do
  :: clearing_data_at < 12 -> clearing_data_record.clearing_instruction[clearing_data_at] = wire[at]; at = at + 1; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  clearing_data_record.account_type = wire[at]; at = at + 1;
  clearing_data_record.open_close = wire[at]; at = at + 1;
  clearing_data_record.hedge_spec = wire[at]; at = at + 1;
  clearing_data_record.clearing_operation_mode = wire[at]; at = at + 1;
  clearing_data_at = 0;
  do
  :: clearing_data_at < 4 -> clearing_data_record.clearing_destination[clearing_data_at] = wire[at]; at = at + 1; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Clearing Data is what was written, byte for byte */
inline equal_clearing_data(clearing_data_read, clearing_data_written) {
  clearing_data_at = 0;
  do
  :: clearing_data_at < 12 -> assert(clearing_data_read.clearing_instruction[clearing_data_at] == clearing_data_written.clearing_instruction[clearing_data_at]); clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  assert(clearing_data_read.account_type == clearing_data_written.account_type);
  assert(clearing_data_read.open_close == clearing_data_written.open_close);
  assert(clearing_data_read.hedge_spec == clearing_data_written.hedge_spec);
  assert(clearing_data_read.clearing_operation_mode == clearing_data_written.clearing_operation_mode);
  clearing_data_at = 0;
  do
  :: clearing_data_at < 4 -> assert(clearing_data_read.clearing_destination[clearing_data_at] == clearing_data_written.clearing_destination[clearing_data_at]); clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Owner Data: 71 bytes ---------------------------------------------------- */

/* The guide states these fields once, as Owner Data, for every message that carries them. */
typedef OwnerData {
  byte client_order_id[20];
  byte pound_sign;
  byte memo[50]
};

int owner_data_at;

/* every byte of Owner Data set to one value */
inline fill_owner_data(owner_data_record, owner_data_value) {
  owner_data_at = 0;
  do
  :: owner_data_at < 20 -> owner_data_record.client_order_id[owner_data_at] = owner_data_value; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  owner_data_record.pound_sign = owner_data_value;
  owner_data_at = 0;
  do
  :: owner_data_at < 50 -> owner_data_record.memo[owner_data_at] = owner_data_value; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Owner Data set to where it lies, so a field read out of place says so */
inline ramp_owner_data(owner_data_record, owner_data_base) {
  owner_data_at = 0;
  do
  :: owner_data_at < 20 -> owner_data_record.client_order_id[owner_data_at] = (owner_data_base + 0 + owner_data_at + 1) % 256; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  owner_data_record.pound_sign = (owner_data_base + 20 + 1) % 256;
  owner_data_at = 0;
  do
  :: owner_data_at < 50 -> owner_data_record.memo[owner_data_at] = (owner_data_base + 21 + owner_data_at + 1) % 256; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Owner Data to the wire, 71 bytes from where the cursor stands */
inline encode_owner_data(owner_data_record) {
  owner_data_at = 0;
  do
  :: owner_data_at < 20 -> wire[at] = owner_data_record.client_order_id[owner_data_at]; at = at + 1; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  wire[at] = owner_data_record.pound_sign; at = at + 1;
  owner_data_at = 0;
  do
  :: owner_data_at < 50 -> wire[at] = owner_data_record.memo[owner_data_at]; at = at + 1; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Owner Data off the wire, 71 bytes from where the cursor stands */
inline decode_owner_data(owner_data_record) {
  owner_data_at = 0;
  do
  :: owner_data_at < 20 -> owner_data_record.client_order_id[owner_data_at] = wire[at]; at = at + 1; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  owner_data_record.pound_sign = wire[at]; at = at + 1;
  owner_data_at = 0;
  do
  :: owner_data_at < 50 -> owner_data_record.memo[owner_data_at] = wire[at]; at = at + 1; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Owner Data is what was written, byte for byte */
inline equal_owner_data(owner_data_read, owner_data_written) {
  owner_data_at = 0;
  do
  :: owner_data_at < 20 -> assert(owner_data_read.client_order_id[owner_data_at] == owner_data_written.client_order_id[owner_data_at]); owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  assert(owner_data_read.pound_sign == owner_data_written.pound_sign);
  owner_data_at = 0;
  do
  :: owner_data_at < 50 -> assert(owner_data_read.memo[owner_data_at] == owner_data_written.memo[owner_data_at]); owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bulk Quote Data: 203 bytes ---------------------------------------------- */

typedef BulkQuoteData {
  byte group[2];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte reserved_2[2];
  byte reserved_8[8];
  byte second_reserved_2[2];
  byte calculation_time_interval[8];
  byte maximum_total_volume[8];
  byte maximum_total_value[8];
  byte maximum_delta_volume[8];
  byte maximum_delta_value[8];
  byte percent_of_quote[8];
  byte post_trading_instructions[50]
};

int bulk_quote_data_at;

/* every byte of Bulk Quote Data set to one value */
inline fill_bulk_quote_data(bulk_quote_data_record, bulk_quote_data_value) {
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.group[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  fill_clearing_data(bulk_quote_data_record.clearing_data, bulk_quote_data_value);
  fill_owner_data(bulk_quote_data_record.owner_data, bulk_quote_data_value);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.reserved_2[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.reserved_8[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.second_reserved_2[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.calculation_time_interval[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_total_volume[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_total_value[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_delta_volume[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_delta_value[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.percent_of_quote[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 50 -> bulk_quote_data_record.post_trading_instructions[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bulk Quote Data set to where it lies, so a field read out of place says so */
inline ramp_bulk_quote_data(bulk_quote_data_record, bulk_quote_data_base) {
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.group[bulk_quote_data_at] = (bulk_quote_data_base + 0 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  ramp_clearing_data(bulk_quote_data_record.clearing_data, bulk_quote_data_base + 2);
  ramp_owner_data(bulk_quote_data_record.owner_data, bulk_quote_data_base + 22);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.reserved_2[bulk_quote_data_at] = (bulk_quote_data_base + 93 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.reserved_8[bulk_quote_data_at] = (bulk_quote_data_base + 95 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.second_reserved_2[bulk_quote_data_at] = (bulk_quote_data_base + 103 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.calculation_time_interval[bulk_quote_data_at] = (bulk_quote_data_base + 105 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_total_volume[bulk_quote_data_at] = (bulk_quote_data_base + 113 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_total_value[bulk_quote_data_at] = (bulk_quote_data_base + 121 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_delta_volume[bulk_quote_data_at] = (bulk_quote_data_base + 129 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_delta_value[bulk_quote_data_at] = (bulk_quote_data_base + 137 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.percent_of_quote[bulk_quote_data_at] = (bulk_quote_data_base + 145 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 50 -> bulk_quote_data_record.post_trading_instructions[bulk_quote_data_at] = (bulk_quote_data_base + 153 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  skip
}

/* Bulk Quote Data to the wire, 203 bytes from where the cursor stands */
inline encode_bulk_quote_data(bulk_quote_data_record) {
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> wire[at] = bulk_quote_data_record.group[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  encode_clearing_data(bulk_quote_data_record.clearing_data);
  encode_owner_data(bulk_quote_data_record.owner_data);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> wire[at] = bulk_quote_data_record.reserved_2[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> wire[at] = bulk_quote_data_record.reserved_8[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> wire[at] = bulk_quote_data_record.second_reserved_2[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> wire[at] = bulk_quote_data_record.calculation_time_interval[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> wire[at] = bulk_quote_data_record.maximum_total_volume[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> wire[at] = bulk_quote_data_record.maximum_total_value[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> wire[at] = bulk_quote_data_record.maximum_delta_volume[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> wire[at] = bulk_quote_data_record.maximum_delta_value[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> wire[at] = bulk_quote_data_record.percent_of_quote[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 50 -> wire[at] = bulk_quote_data_record.post_trading_instructions[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  skip
}

/* Bulk Quote Data off the wire, 203 bytes from where the cursor stands */
inline decode_bulk_quote_data(bulk_quote_data_record) {
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.group[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  decode_clearing_data(bulk_quote_data_record.clearing_data);
  decode_owner_data(bulk_quote_data_record.owner_data);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.reserved_2[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.reserved_8[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.second_reserved_2[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.calculation_time_interval[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_total_volume[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_total_value[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_delta_volume[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_delta_value[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.percent_of_quote[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 50 -> bulk_quote_data_record.post_trading_instructions[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bulk Quote Data is what was written, byte for byte */
inline equal_bulk_quote_data(bulk_quote_data_read, bulk_quote_data_written) {
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> assert(bulk_quote_data_read.group[bulk_quote_data_at] == bulk_quote_data_written.group[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  equal_clearing_data(bulk_quote_data_read.clearing_data, bulk_quote_data_written.clearing_data);
  equal_owner_data(bulk_quote_data_read.owner_data, bulk_quote_data_written.owner_data);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> assert(bulk_quote_data_read.reserved_2[bulk_quote_data_at] == bulk_quote_data_written.reserved_2[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> assert(bulk_quote_data_read.reserved_8[bulk_quote_data_at] == bulk_quote_data_written.reserved_8[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> assert(bulk_quote_data_read.second_reserved_2[bulk_quote_data_at] == bulk_quote_data_written.second_reserved_2[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> assert(bulk_quote_data_read.calculation_time_interval[bulk_quote_data_at] == bulk_quote_data_written.calculation_time_interval[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> assert(bulk_quote_data_read.maximum_total_volume[bulk_quote_data_at] == bulk_quote_data_written.maximum_total_volume[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> assert(bulk_quote_data_read.maximum_total_value[bulk_quote_data_at] == bulk_quote_data_written.maximum_total_value[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> assert(bulk_quote_data_read.maximum_delta_volume[bulk_quote_data_at] == bulk_quote_data_written.maximum_delta_volume[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> assert(bulk_quote_data_read.maximum_delta_value[bulk_quote_data_at] == bulk_quote_data_written.maximum_delta_value[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> assert(bulk_quote_data_read.percent_of_quote[bulk_quote_data_at] == bulk_quote_data_written.percent_of_quote[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 50 -> assert(bulk_quote_data_read.post_trading_instructions[bulk_quote_data_at] == bulk_quote_data_written.post_trading_instructions[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Global Cancellation: 11 bytes ------------------------------------------- */

typedef GlobalCancellation {
  byte group[2];
  byte type_of_cancellation;
  byte mm_cat_user_time[8]
};

int global_cancellation_at;

/* every byte of Global Cancellation set to one value */
inline fill_global_cancellation(global_cancellation_record, global_cancellation_value) {
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 2 -> global_cancellation_record.group[global_cancellation_at] = global_cancellation_value; global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  global_cancellation_record.type_of_cancellation = global_cancellation_value;
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 8 -> global_cancellation_record.mm_cat_user_time[global_cancellation_at] = global_cancellation_value; global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Global Cancellation set to where it lies, so a field read out of place says so */
inline ramp_global_cancellation(global_cancellation_record, global_cancellation_base) {
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 2 -> global_cancellation_record.group[global_cancellation_at] = (global_cancellation_base + 0 + global_cancellation_at + 1) % 256; global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  global_cancellation_record.type_of_cancellation = (global_cancellation_base + 2 + 1) % 256;
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 8 -> global_cancellation_record.mm_cat_user_time[global_cancellation_at] = (global_cancellation_base + 3 + global_cancellation_at + 1) % 256; global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* Global Cancellation to the wire, 11 bytes from where the cursor stands */
inline encode_global_cancellation(global_cancellation_record) {
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 2 -> wire[at] = global_cancellation_record.group[global_cancellation_at]; at = at + 1; global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  wire[at] = global_cancellation_record.type_of_cancellation; at = at + 1;
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 8 -> wire[at] = global_cancellation_record.mm_cat_user_time[global_cancellation_at]; at = at + 1; global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* Global Cancellation off the wire, 11 bytes from where the cursor stands */
inline decode_global_cancellation(global_cancellation_record) {
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 2 -> global_cancellation_record.group[global_cancellation_at] = wire[at]; at = at + 1; global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  global_cancellation_record.type_of_cancellation = wire[at]; at = at + 1;
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 8 -> global_cancellation_record.mm_cat_user_time[global_cancellation_at] = wire[at]; at = at + 1; global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Global Cancellation is what was written, byte for byte */
inline equal_global_cancellation(global_cancellation_read, global_cancellation_written) {
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 2 -> assert(global_cancellation_read.group[global_cancellation_at] == global_cancellation_written.group[global_cancellation_at]); global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  assert(global_cancellation_read.type_of_cancellation == global_cancellation_written.type_of_cancellation);
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 8 -> assert(global_cancellation_read.mm_cat_user_time[global_cancellation_at] == global_cancellation_written.mm_cat_user_time[global_cancellation_at]); global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* ---- User Global Cancellation: 23 bytes -------------------------------------- */

typedef UserGlobalCancellation {
  byte group[2];
  byte instrument_optional[4];
  byte type_of_cancellation;
  byte account_type_filter[8];
  byte mm_cat_user_time[8]
};

int user_global_cancellation_at;

/* every byte of User Global Cancellation set to one value */
inline fill_user_global_cancellation(user_global_cancellation_record, user_global_cancellation_value) {
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 2 -> user_global_cancellation_record.group[user_global_cancellation_at] = user_global_cancellation_value; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 4 -> user_global_cancellation_record.instrument_optional[user_global_cancellation_at] = user_global_cancellation_value; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_record.type_of_cancellation = user_global_cancellation_value;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> user_global_cancellation_record.account_type_filter[user_global_cancellation_at] = user_global_cancellation_value; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> user_global_cancellation_record.mm_cat_user_time[user_global_cancellation_at] = user_global_cancellation_value; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Global Cancellation set to where it lies, so a field read out of place says so */
inline ramp_user_global_cancellation(user_global_cancellation_record, user_global_cancellation_base) {
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 2 -> user_global_cancellation_record.group[user_global_cancellation_at] = (user_global_cancellation_base + 0 + user_global_cancellation_at + 1) % 256; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 4 -> user_global_cancellation_record.instrument_optional[user_global_cancellation_at] = (user_global_cancellation_base + 2 + user_global_cancellation_at + 1) % 256; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_record.type_of_cancellation = (user_global_cancellation_base + 6 + 1) % 256;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> user_global_cancellation_record.account_type_filter[user_global_cancellation_at] = (user_global_cancellation_base + 7 + user_global_cancellation_at + 1) % 256; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> user_global_cancellation_record.mm_cat_user_time[user_global_cancellation_at] = (user_global_cancellation_base + 15 + user_global_cancellation_at + 1) % 256; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* User Global Cancellation to the wire, 23 bytes from where the cursor stands */
inline encode_user_global_cancellation(user_global_cancellation_record) {
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 2 -> wire[at] = user_global_cancellation_record.group[user_global_cancellation_at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 4 -> wire[at] = user_global_cancellation_record.instrument_optional[user_global_cancellation_at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  wire[at] = user_global_cancellation_record.type_of_cancellation; at = at + 1;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> wire[at] = user_global_cancellation_record.account_type_filter[user_global_cancellation_at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> wire[at] = user_global_cancellation_record.mm_cat_user_time[user_global_cancellation_at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* User Global Cancellation off the wire, 23 bytes from where the cursor stands */
inline decode_user_global_cancellation(user_global_cancellation_record) {
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 2 -> user_global_cancellation_record.group[user_global_cancellation_at] = wire[at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 4 -> user_global_cancellation_record.instrument_optional[user_global_cancellation_at] = wire[at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_record.type_of_cancellation = wire[at]; at = at + 1;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> user_global_cancellation_record.account_type_filter[user_global_cancellation_at] = wire[at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> user_global_cancellation_record.mm_cat_user_time[user_global_cancellation_at] = wire[at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Global Cancellation is what was written, byte for byte */
inline equal_user_global_cancellation(user_global_cancellation_read, user_global_cancellation_written) {
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 2 -> assert(user_global_cancellation_read.group[user_global_cancellation_at] == user_global_cancellation_written.group[user_global_cancellation_at]); user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 4 -> assert(user_global_cancellation_read.instrument_optional[user_global_cancellation_at] == user_global_cancellation_written.instrument_optional[user_global_cancellation_at]); user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  assert(user_global_cancellation_read.type_of_cancellation == user_global_cancellation_written.type_of_cancellation);
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> assert(user_global_cancellation_read.account_type_filter[user_global_cancellation_at] == user_global_cancellation_written.account_type_filter[user_global_cancellation_at]); user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> assert(user_global_cancellation_read.mm_cat_user_time[user_global_cancellation_at] == user_global_cancellation_written.mm_cat_user_time[user_global_cancellation_at]); user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Directed Routed Order Rejection And Quote: 44 bytes --------------------- */

typedef DirectedRoutedOrderRejectionAndQuote {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte order_id[8];
  byte rejection_code[4];
  byte quote_quantity[8];
  byte quote_price[10]
};

int directed_routed_order_rejection_and_quote_at;

/* every byte of Directed Routed Order Rejection And Quote set to one value */
inline fill_directed_routed_order_rejection_and_quote(directed_routed_order_rejection_and_quote_record, directed_routed_order_rejection_and_quote_value) {
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 2 -> directed_routed_order_rejection_and_quote_record.group[directed_routed_order_rejection_and_quote_at] = directed_routed_order_rejection_and_quote_value; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 4 -> directed_routed_order_rejection_and_quote_record.instrument_optional[directed_routed_order_rejection_and_quote_at] = directed_routed_order_rejection_and_quote_value; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> directed_routed_order_rejection_and_quote_record.trader_id[directed_routed_order_rejection_and_quote_at] = directed_routed_order_rejection_and_quote_value; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> directed_routed_order_rejection_and_quote_record.order_id[directed_routed_order_rejection_and_quote_at] = directed_routed_order_rejection_and_quote_value; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 4 -> directed_routed_order_rejection_and_quote_record.rejection_code[directed_routed_order_rejection_and_quote_at] = directed_routed_order_rejection_and_quote_value; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> directed_routed_order_rejection_and_quote_record.quote_quantity[directed_routed_order_rejection_and_quote_at] = directed_routed_order_rejection_and_quote_value; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 10 -> directed_routed_order_rejection_and_quote_record.quote_price[directed_routed_order_rejection_and_quote_at] = directed_routed_order_rejection_and_quote_value; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Directed Routed Order Rejection And Quote set to where it lies, so a field read out of place says so */
inline ramp_directed_routed_order_rejection_and_quote(directed_routed_order_rejection_and_quote_record, directed_routed_order_rejection_and_quote_base) {
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 2 -> directed_routed_order_rejection_and_quote_record.group[directed_routed_order_rejection_and_quote_at] = (directed_routed_order_rejection_and_quote_base + 0 + directed_routed_order_rejection_and_quote_at + 1) % 256; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 4 -> directed_routed_order_rejection_and_quote_record.instrument_optional[directed_routed_order_rejection_and_quote_at] = (directed_routed_order_rejection_and_quote_base + 2 + directed_routed_order_rejection_and_quote_at + 1) % 256; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> directed_routed_order_rejection_and_quote_record.trader_id[directed_routed_order_rejection_and_quote_at] = (directed_routed_order_rejection_and_quote_base + 6 + directed_routed_order_rejection_and_quote_at + 1) % 256; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> directed_routed_order_rejection_and_quote_record.order_id[directed_routed_order_rejection_and_quote_at] = (directed_routed_order_rejection_and_quote_base + 14 + directed_routed_order_rejection_and_quote_at + 1) % 256; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 4 -> directed_routed_order_rejection_and_quote_record.rejection_code[directed_routed_order_rejection_and_quote_at] = (directed_routed_order_rejection_and_quote_base + 22 + directed_routed_order_rejection_and_quote_at + 1) % 256; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> directed_routed_order_rejection_and_quote_record.quote_quantity[directed_routed_order_rejection_and_quote_at] = (directed_routed_order_rejection_and_quote_base + 26 + directed_routed_order_rejection_and_quote_at + 1) % 256; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 10 -> directed_routed_order_rejection_and_quote_record.quote_price[directed_routed_order_rejection_and_quote_at] = (directed_routed_order_rejection_and_quote_base + 34 + directed_routed_order_rejection_and_quote_at + 1) % 256; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  skip
}

/* Directed Routed Order Rejection And Quote to the wire, 44 bytes from where the cursor stands */
inline encode_directed_routed_order_rejection_and_quote(directed_routed_order_rejection_and_quote_record) {
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 2 -> wire[at] = directed_routed_order_rejection_and_quote_record.group[directed_routed_order_rejection_and_quote_at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 4 -> wire[at] = directed_routed_order_rejection_and_quote_record.instrument_optional[directed_routed_order_rejection_and_quote_at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> wire[at] = directed_routed_order_rejection_and_quote_record.trader_id[directed_routed_order_rejection_and_quote_at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> wire[at] = directed_routed_order_rejection_and_quote_record.order_id[directed_routed_order_rejection_and_quote_at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 4 -> wire[at] = directed_routed_order_rejection_and_quote_record.rejection_code[directed_routed_order_rejection_and_quote_at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> wire[at] = directed_routed_order_rejection_and_quote_record.quote_quantity[directed_routed_order_rejection_and_quote_at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 10 -> wire[at] = directed_routed_order_rejection_and_quote_record.quote_price[directed_routed_order_rejection_and_quote_at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  skip
}

/* Directed Routed Order Rejection And Quote off the wire, 44 bytes from where the cursor stands */
inline decode_directed_routed_order_rejection_and_quote(directed_routed_order_rejection_and_quote_record) {
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 2 -> directed_routed_order_rejection_and_quote_record.group[directed_routed_order_rejection_and_quote_at] = wire[at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 4 -> directed_routed_order_rejection_and_quote_record.instrument_optional[directed_routed_order_rejection_and_quote_at] = wire[at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> directed_routed_order_rejection_and_quote_record.trader_id[directed_routed_order_rejection_and_quote_at] = wire[at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> directed_routed_order_rejection_and_quote_record.order_id[directed_routed_order_rejection_and_quote_at] = wire[at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 4 -> directed_routed_order_rejection_and_quote_record.rejection_code[directed_routed_order_rejection_and_quote_at] = wire[at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> directed_routed_order_rejection_and_quote_record.quote_quantity[directed_routed_order_rejection_and_quote_at] = wire[at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 10 -> directed_routed_order_rejection_and_quote_record.quote_price[directed_routed_order_rejection_and_quote_at] = wire[at]; at = at + 1; directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Directed Routed Order Rejection And Quote is what was written, byte for byte */
inline equal_directed_routed_order_rejection_and_quote(directed_routed_order_rejection_and_quote_read, directed_routed_order_rejection_and_quote_written) {
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 2 -> assert(directed_routed_order_rejection_and_quote_read.group[directed_routed_order_rejection_and_quote_at] == directed_routed_order_rejection_and_quote_written.group[directed_routed_order_rejection_and_quote_at]); directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 4 -> assert(directed_routed_order_rejection_and_quote_read.instrument_optional[directed_routed_order_rejection_and_quote_at] == directed_routed_order_rejection_and_quote_written.instrument_optional[directed_routed_order_rejection_and_quote_at]); directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> assert(directed_routed_order_rejection_and_quote_read.trader_id[directed_routed_order_rejection_and_quote_at] == directed_routed_order_rejection_and_quote_written.trader_id[directed_routed_order_rejection_and_quote_at]); directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> assert(directed_routed_order_rejection_and_quote_read.order_id[directed_routed_order_rejection_and_quote_at] == directed_routed_order_rejection_and_quote_written.order_id[directed_routed_order_rejection_and_quote_at]); directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 4 -> assert(directed_routed_order_rejection_and_quote_read.rejection_code[directed_routed_order_rejection_and_quote_at] == directed_routed_order_rejection_and_quote_written.rejection_code[directed_routed_order_rejection_and_quote_at]); directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 8 -> assert(directed_routed_order_rejection_and_quote_read.quote_quantity[directed_routed_order_rejection_and_quote_at] == directed_routed_order_rejection_and_quote_written.quote_quantity[directed_routed_order_rejection_and_quote_at]); directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  directed_routed_order_rejection_and_quote_at = 0;
  do
  :: directed_routed_order_rejection_and_quote_at < 10 -> assert(directed_routed_order_rejection_and_quote_read.quote_price[directed_routed_order_rejection_and_quote_at] == directed_routed_order_rejection_and_quote_written.quote_price[directed_routed_order_rejection_and_quote_at]); directed_routed_order_rejection_and_quote_at = directed_routed_order_rejection_and_quote_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Buying Clearing Data: 20 bytes ------------------------------------------ */

/* The guide states these fields once, as Clearing Data, for every message that carries them. */
typedef BuyingClearingData {
  byte clearing_instruction[12];
  byte account_type;
  byte open_close;
  byte hedge_spec;
  byte clearing_operation_mode;
  byte clearing_destination[4]
};

int buying_clearing_data_at;

/* every byte of Buying Clearing Data set to one value */
inline fill_buying_clearing_data(buying_clearing_data_record, buying_clearing_data_value) {
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 12 -> buying_clearing_data_record.clearing_instruction[buying_clearing_data_at] = buying_clearing_data_value; buying_clearing_data_at = buying_clearing_data_at + 1
  :: else -> break
  od;
  buying_clearing_data_record.account_type = buying_clearing_data_value;
  buying_clearing_data_record.open_close = buying_clearing_data_value;
  buying_clearing_data_record.hedge_spec = buying_clearing_data_value;
  buying_clearing_data_record.clearing_operation_mode = buying_clearing_data_value;
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 4 -> buying_clearing_data_record.clearing_destination[buying_clearing_data_at] = buying_clearing_data_value; buying_clearing_data_at = buying_clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Buying Clearing Data set to where it lies, so a field read out of place says so */
inline ramp_buying_clearing_data(buying_clearing_data_record, buying_clearing_data_base) {
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 12 -> buying_clearing_data_record.clearing_instruction[buying_clearing_data_at] = (buying_clearing_data_base + 0 + buying_clearing_data_at + 1) % 256; buying_clearing_data_at = buying_clearing_data_at + 1
  :: else -> break
  od;
  buying_clearing_data_record.account_type = (buying_clearing_data_base + 12 + 1) % 256;
  buying_clearing_data_record.open_close = (buying_clearing_data_base + 13 + 1) % 256;
  buying_clearing_data_record.hedge_spec = (buying_clearing_data_base + 14 + 1) % 256;
  buying_clearing_data_record.clearing_operation_mode = (buying_clearing_data_base + 15 + 1) % 256;
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 4 -> buying_clearing_data_record.clearing_destination[buying_clearing_data_at] = (buying_clearing_data_base + 16 + buying_clearing_data_at + 1) % 256; buying_clearing_data_at = buying_clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* Buying Clearing Data to the wire, 20 bytes from where the cursor stands */
inline encode_buying_clearing_data(buying_clearing_data_record) {
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 12 -> wire[at] = buying_clearing_data_record.clearing_instruction[buying_clearing_data_at]; at = at + 1; buying_clearing_data_at = buying_clearing_data_at + 1
  :: else -> break
  od;
  wire[at] = buying_clearing_data_record.account_type; at = at + 1;
  wire[at] = buying_clearing_data_record.open_close; at = at + 1;
  wire[at] = buying_clearing_data_record.hedge_spec; at = at + 1;
  wire[at] = buying_clearing_data_record.clearing_operation_mode; at = at + 1;
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 4 -> wire[at] = buying_clearing_data_record.clearing_destination[buying_clearing_data_at]; at = at + 1; buying_clearing_data_at = buying_clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* Buying Clearing Data off the wire, 20 bytes from where the cursor stands */
inline decode_buying_clearing_data(buying_clearing_data_record) {
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 12 -> buying_clearing_data_record.clearing_instruction[buying_clearing_data_at] = wire[at]; at = at + 1; buying_clearing_data_at = buying_clearing_data_at + 1
  :: else -> break
  od;
  buying_clearing_data_record.account_type = wire[at]; at = at + 1;
  buying_clearing_data_record.open_close = wire[at]; at = at + 1;
  buying_clearing_data_record.hedge_spec = wire[at]; at = at + 1;
  buying_clearing_data_record.clearing_operation_mode = wire[at]; at = at + 1;
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 4 -> buying_clearing_data_record.clearing_destination[buying_clearing_data_at] = wire[at]; at = at + 1; buying_clearing_data_at = buying_clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Buying Clearing Data is what was written, byte for byte */
inline equal_buying_clearing_data(buying_clearing_data_read, buying_clearing_data_written) {
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 12 -> assert(buying_clearing_data_read.clearing_instruction[buying_clearing_data_at] == buying_clearing_data_written.clearing_instruction[buying_clearing_data_at]); buying_clearing_data_at = buying_clearing_data_at + 1
  :: else -> break
  od;
  assert(buying_clearing_data_read.account_type == buying_clearing_data_written.account_type);
  assert(buying_clearing_data_read.open_close == buying_clearing_data_written.open_close);
  assert(buying_clearing_data_read.hedge_spec == buying_clearing_data_written.hedge_spec);
  assert(buying_clearing_data_read.clearing_operation_mode == buying_clearing_data_written.clearing_operation_mode);
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 4 -> assert(buying_clearing_data_read.clearing_destination[buying_clearing_data_at] == buying_clearing_data_written.clearing_destination[buying_clearing_data_at]); buying_clearing_data_at = buying_clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Selling Clearing Data: 20 bytes ----------------------------------------- */

/* The guide states these fields once, as Clearing Data, for every message that carries them. */
typedef SellingClearingData {
  byte clearing_instruction[12];
  byte account_type;
  byte open_close;
  byte hedge_spec;
  byte clearing_operation_mode;
  byte clearing_destination[4]
};

int selling_clearing_data_at;

/* every byte of Selling Clearing Data set to one value */
inline fill_selling_clearing_data(selling_clearing_data_record, selling_clearing_data_value) {
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 12 -> selling_clearing_data_record.clearing_instruction[selling_clearing_data_at] = selling_clearing_data_value; selling_clearing_data_at = selling_clearing_data_at + 1
  :: else -> break
  od;
  selling_clearing_data_record.account_type = selling_clearing_data_value;
  selling_clearing_data_record.open_close = selling_clearing_data_value;
  selling_clearing_data_record.hedge_spec = selling_clearing_data_value;
  selling_clearing_data_record.clearing_operation_mode = selling_clearing_data_value;
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 4 -> selling_clearing_data_record.clearing_destination[selling_clearing_data_at] = selling_clearing_data_value; selling_clearing_data_at = selling_clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Selling Clearing Data set to where it lies, so a field read out of place says so */
inline ramp_selling_clearing_data(selling_clearing_data_record, selling_clearing_data_base) {
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 12 -> selling_clearing_data_record.clearing_instruction[selling_clearing_data_at] = (selling_clearing_data_base + 0 + selling_clearing_data_at + 1) % 256; selling_clearing_data_at = selling_clearing_data_at + 1
  :: else -> break
  od;
  selling_clearing_data_record.account_type = (selling_clearing_data_base + 12 + 1) % 256;
  selling_clearing_data_record.open_close = (selling_clearing_data_base + 13 + 1) % 256;
  selling_clearing_data_record.hedge_spec = (selling_clearing_data_base + 14 + 1) % 256;
  selling_clearing_data_record.clearing_operation_mode = (selling_clearing_data_base + 15 + 1) % 256;
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 4 -> selling_clearing_data_record.clearing_destination[selling_clearing_data_at] = (selling_clearing_data_base + 16 + selling_clearing_data_at + 1) % 256; selling_clearing_data_at = selling_clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* Selling Clearing Data to the wire, 20 bytes from where the cursor stands */
inline encode_selling_clearing_data(selling_clearing_data_record) {
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 12 -> wire[at] = selling_clearing_data_record.clearing_instruction[selling_clearing_data_at]; at = at + 1; selling_clearing_data_at = selling_clearing_data_at + 1
  :: else -> break
  od;
  wire[at] = selling_clearing_data_record.account_type; at = at + 1;
  wire[at] = selling_clearing_data_record.open_close; at = at + 1;
  wire[at] = selling_clearing_data_record.hedge_spec; at = at + 1;
  wire[at] = selling_clearing_data_record.clearing_operation_mode; at = at + 1;
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 4 -> wire[at] = selling_clearing_data_record.clearing_destination[selling_clearing_data_at]; at = at + 1; selling_clearing_data_at = selling_clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* Selling Clearing Data off the wire, 20 bytes from where the cursor stands */
inline decode_selling_clearing_data(selling_clearing_data_record) {
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 12 -> selling_clearing_data_record.clearing_instruction[selling_clearing_data_at] = wire[at]; at = at + 1; selling_clearing_data_at = selling_clearing_data_at + 1
  :: else -> break
  od;
  selling_clearing_data_record.account_type = wire[at]; at = at + 1;
  selling_clearing_data_record.open_close = wire[at]; at = at + 1;
  selling_clearing_data_record.hedge_spec = wire[at]; at = at + 1;
  selling_clearing_data_record.clearing_operation_mode = wire[at]; at = at + 1;
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 4 -> selling_clearing_data_record.clearing_destination[selling_clearing_data_at] = wire[at]; at = at + 1; selling_clearing_data_at = selling_clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Selling Clearing Data is what was written, byte for byte */
inline equal_selling_clearing_data(selling_clearing_data_read, selling_clearing_data_written) {
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 12 -> assert(selling_clearing_data_read.clearing_instruction[selling_clearing_data_at] == selling_clearing_data_written.clearing_instruction[selling_clearing_data_at]); selling_clearing_data_at = selling_clearing_data_at + 1
  :: else -> break
  od;
  assert(selling_clearing_data_read.account_type == selling_clearing_data_written.account_type);
  assert(selling_clearing_data_read.open_close == selling_clearing_data_written.open_close);
  assert(selling_clearing_data_read.hedge_spec == selling_clearing_data_written.hedge_spec);
  assert(selling_clearing_data_read.clearing_operation_mode == selling_clearing_data_written.clearing_operation_mode);
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 4 -> assert(selling_clearing_data_read.clearing_destination[selling_clearing_data_at] == selling_clearing_data_written.clearing_destination[selling_clearing_data_at]); selling_clearing_data_at = selling_clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Buying Owner Data: 71 bytes --------------------------------------------- */

/* The guide states these fields once, as Owner Data, for every message that carries them. */
typedef BuyingOwnerData {
  byte client_order_id[20];
  byte pound_sign;
  byte memo[50]
};

int buying_owner_data_at;

/* every byte of Buying Owner Data set to one value */
inline fill_buying_owner_data(buying_owner_data_record, buying_owner_data_value) {
  buying_owner_data_at = 0;
  do
  :: buying_owner_data_at < 20 -> buying_owner_data_record.client_order_id[buying_owner_data_at] = buying_owner_data_value; buying_owner_data_at = buying_owner_data_at + 1
  :: else -> break
  od;
  buying_owner_data_record.pound_sign = buying_owner_data_value;
  buying_owner_data_at = 0;
  do
  :: buying_owner_data_at < 50 -> buying_owner_data_record.memo[buying_owner_data_at] = buying_owner_data_value; buying_owner_data_at = buying_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Buying Owner Data set to where it lies, so a field read out of place says so */
inline ramp_buying_owner_data(buying_owner_data_record, buying_owner_data_base) {
  buying_owner_data_at = 0;
  do
  :: buying_owner_data_at < 20 -> buying_owner_data_record.client_order_id[buying_owner_data_at] = (buying_owner_data_base + 0 + buying_owner_data_at + 1) % 256; buying_owner_data_at = buying_owner_data_at + 1
  :: else -> break
  od;
  buying_owner_data_record.pound_sign = (buying_owner_data_base + 20 + 1) % 256;
  buying_owner_data_at = 0;
  do
  :: buying_owner_data_at < 50 -> buying_owner_data_record.memo[buying_owner_data_at] = (buying_owner_data_base + 21 + buying_owner_data_at + 1) % 256; buying_owner_data_at = buying_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Buying Owner Data to the wire, 71 bytes from where the cursor stands */
inline encode_buying_owner_data(buying_owner_data_record) {
  buying_owner_data_at = 0;
  do
  :: buying_owner_data_at < 20 -> wire[at] = buying_owner_data_record.client_order_id[buying_owner_data_at]; at = at + 1; buying_owner_data_at = buying_owner_data_at + 1
  :: else -> break
  od;
  wire[at] = buying_owner_data_record.pound_sign; at = at + 1;
  buying_owner_data_at = 0;
  do
  :: buying_owner_data_at < 50 -> wire[at] = buying_owner_data_record.memo[buying_owner_data_at]; at = at + 1; buying_owner_data_at = buying_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Buying Owner Data off the wire, 71 bytes from where the cursor stands */
inline decode_buying_owner_data(buying_owner_data_record) {
  buying_owner_data_at = 0;
  do
  :: buying_owner_data_at < 20 -> buying_owner_data_record.client_order_id[buying_owner_data_at] = wire[at]; at = at + 1; buying_owner_data_at = buying_owner_data_at + 1
  :: else -> break
  od;
  buying_owner_data_record.pound_sign = wire[at]; at = at + 1;
  buying_owner_data_at = 0;
  do
  :: buying_owner_data_at < 50 -> buying_owner_data_record.memo[buying_owner_data_at] = wire[at]; at = at + 1; buying_owner_data_at = buying_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Buying Owner Data is what was written, byte for byte */
inline equal_buying_owner_data(buying_owner_data_read, buying_owner_data_written) {
  buying_owner_data_at = 0;
  do
  :: buying_owner_data_at < 20 -> assert(buying_owner_data_read.client_order_id[buying_owner_data_at] == buying_owner_data_written.client_order_id[buying_owner_data_at]); buying_owner_data_at = buying_owner_data_at + 1
  :: else -> break
  od;
  assert(buying_owner_data_read.pound_sign == buying_owner_data_written.pound_sign);
  buying_owner_data_at = 0;
  do
  :: buying_owner_data_at < 50 -> assert(buying_owner_data_read.memo[buying_owner_data_at] == buying_owner_data_written.memo[buying_owner_data_at]); buying_owner_data_at = buying_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Selling Owner Data: 71 bytes -------------------------------------------- */

/* The guide states these fields once, as Owner Data, for every message that carries them. */
typedef SellingOwnerData {
  byte client_order_id[20];
  byte pound_sign;
  byte memo[50]
};

int selling_owner_data_at;

/* every byte of Selling Owner Data set to one value */
inline fill_selling_owner_data(selling_owner_data_record, selling_owner_data_value) {
  selling_owner_data_at = 0;
  do
  :: selling_owner_data_at < 20 -> selling_owner_data_record.client_order_id[selling_owner_data_at] = selling_owner_data_value; selling_owner_data_at = selling_owner_data_at + 1
  :: else -> break
  od;
  selling_owner_data_record.pound_sign = selling_owner_data_value;
  selling_owner_data_at = 0;
  do
  :: selling_owner_data_at < 50 -> selling_owner_data_record.memo[selling_owner_data_at] = selling_owner_data_value; selling_owner_data_at = selling_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Selling Owner Data set to where it lies, so a field read out of place says so */
inline ramp_selling_owner_data(selling_owner_data_record, selling_owner_data_base) {
  selling_owner_data_at = 0;
  do
  :: selling_owner_data_at < 20 -> selling_owner_data_record.client_order_id[selling_owner_data_at] = (selling_owner_data_base + 0 + selling_owner_data_at + 1) % 256; selling_owner_data_at = selling_owner_data_at + 1
  :: else -> break
  od;
  selling_owner_data_record.pound_sign = (selling_owner_data_base + 20 + 1) % 256;
  selling_owner_data_at = 0;
  do
  :: selling_owner_data_at < 50 -> selling_owner_data_record.memo[selling_owner_data_at] = (selling_owner_data_base + 21 + selling_owner_data_at + 1) % 256; selling_owner_data_at = selling_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Selling Owner Data to the wire, 71 bytes from where the cursor stands */
inline encode_selling_owner_data(selling_owner_data_record) {
  selling_owner_data_at = 0;
  do
  :: selling_owner_data_at < 20 -> wire[at] = selling_owner_data_record.client_order_id[selling_owner_data_at]; at = at + 1; selling_owner_data_at = selling_owner_data_at + 1
  :: else -> break
  od;
  wire[at] = selling_owner_data_record.pound_sign; at = at + 1;
  selling_owner_data_at = 0;
  do
  :: selling_owner_data_at < 50 -> wire[at] = selling_owner_data_record.memo[selling_owner_data_at]; at = at + 1; selling_owner_data_at = selling_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Selling Owner Data off the wire, 71 bytes from where the cursor stands */
inline decode_selling_owner_data(selling_owner_data_record) {
  selling_owner_data_at = 0;
  do
  :: selling_owner_data_at < 20 -> selling_owner_data_record.client_order_id[selling_owner_data_at] = wire[at]; at = at + 1; selling_owner_data_at = selling_owner_data_at + 1
  :: else -> break
  od;
  selling_owner_data_record.pound_sign = wire[at]; at = at + 1;
  selling_owner_data_at = 0;
  do
  :: selling_owner_data_at < 50 -> selling_owner_data_record.memo[selling_owner_data_at] = wire[at]; at = at + 1; selling_owner_data_at = selling_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Selling Owner Data is what was written, byte for byte */
inline equal_selling_owner_data(selling_owner_data_read, selling_owner_data_written) {
  selling_owner_data_at = 0;
  do
  :: selling_owner_data_at < 20 -> assert(selling_owner_data_read.client_order_id[selling_owner_data_at] == selling_owner_data_written.client_order_id[selling_owner_data_at]); selling_owner_data_at = selling_owner_data_at + 1
  :: else -> break
  od;
  assert(selling_owner_data_read.pound_sign == selling_owner_data_written.pound_sign);
  selling_owner_data_at = 0;
  do
  :: selling_owner_data_at < 50 -> assert(selling_owner_data_read.memo[selling_owner_data_at] == selling_owner_data_written.memo[selling_owner_data_at]); selling_owner_data_at = selling_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Entry: 364 bytes ------------------------------------------------ */

typedef AuctionEntry {
  byte group[2];
  byte instrument_optional[4];
  byte verb_side;
  byte quantity[8];
  byte price[10];
  BuyingClearingData buying_clearing_data;
  SellingClearingData selling_clearing_data;
  BuyingOwnerData buying_owner_data;
  SellingOwnerData selling_owner_data;
  byte iml_handling;
  byte special_price_term;
  byte additional_price[10];
  byte quantity_term;
  byte additional_quantity[8];
  byte buying_post_trading_instruction[50];
  byte selling_post_trading_instruction[50];
  byte buying_additional_client_memo[16];
  byte selling_additional_client_memo[16];
  byte reserved_4[4]
};

int auction_entry_at;

/* every byte of Auction Entry set to one value */
inline fill_auction_entry(auction_entry_record, auction_entry_value) {
  auction_entry_at = 0;
  do
  :: auction_entry_at < 2 -> auction_entry_record.group[auction_entry_at] = auction_entry_value; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 4 -> auction_entry_record.instrument_optional[auction_entry_at] = auction_entry_value; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_record.verb_side = auction_entry_value;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 8 -> auction_entry_record.quantity[auction_entry_at] = auction_entry_value; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 10 -> auction_entry_record.price[auction_entry_at] = auction_entry_value; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  fill_buying_clearing_data(auction_entry_record.buying_clearing_data, auction_entry_value);
  fill_selling_clearing_data(auction_entry_record.selling_clearing_data, auction_entry_value);
  fill_buying_owner_data(auction_entry_record.buying_owner_data, auction_entry_value);
  fill_selling_owner_data(auction_entry_record.selling_owner_data, auction_entry_value);
  auction_entry_record.iml_handling = auction_entry_value;
  auction_entry_record.special_price_term = auction_entry_value;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 10 -> auction_entry_record.additional_price[auction_entry_at] = auction_entry_value; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_record.quantity_term = auction_entry_value;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 8 -> auction_entry_record.additional_quantity[auction_entry_at] = auction_entry_value; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 50 -> auction_entry_record.buying_post_trading_instruction[auction_entry_at] = auction_entry_value; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 50 -> auction_entry_record.selling_post_trading_instruction[auction_entry_at] = auction_entry_value; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 16 -> auction_entry_record.buying_additional_client_memo[auction_entry_at] = auction_entry_value; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 16 -> auction_entry_record.selling_additional_client_memo[auction_entry_at] = auction_entry_value; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 4 -> auction_entry_record.reserved_4[auction_entry_at] = auction_entry_value; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Entry set to where it lies, so a field read out of place says so */
inline ramp_auction_entry(auction_entry_record, auction_entry_base) {
  auction_entry_at = 0;
  do
  :: auction_entry_at < 2 -> auction_entry_record.group[auction_entry_at] = (auction_entry_base + 0 + auction_entry_at + 1) % 256; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 4 -> auction_entry_record.instrument_optional[auction_entry_at] = (auction_entry_base + 2 + auction_entry_at + 1) % 256; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_record.verb_side = (auction_entry_base + 6 + 1) % 256;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 8 -> auction_entry_record.quantity[auction_entry_at] = (auction_entry_base + 7 + auction_entry_at + 1) % 256; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 10 -> auction_entry_record.price[auction_entry_at] = (auction_entry_base + 15 + auction_entry_at + 1) % 256; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  ramp_buying_clearing_data(auction_entry_record.buying_clearing_data, auction_entry_base + 25);
  ramp_selling_clearing_data(auction_entry_record.selling_clearing_data, auction_entry_base + 45);
  ramp_buying_owner_data(auction_entry_record.buying_owner_data, auction_entry_base + 65);
  ramp_selling_owner_data(auction_entry_record.selling_owner_data, auction_entry_base + 136);
  auction_entry_record.iml_handling = (auction_entry_base + 207 + 1) % 256;
  auction_entry_record.special_price_term = (auction_entry_base + 208 + 1) % 256;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 10 -> auction_entry_record.additional_price[auction_entry_at] = (auction_entry_base + 209 + auction_entry_at + 1) % 256; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_record.quantity_term = (auction_entry_base + 219 + 1) % 256;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 8 -> auction_entry_record.additional_quantity[auction_entry_at] = (auction_entry_base + 220 + auction_entry_at + 1) % 256; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 50 -> auction_entry_record.buying_post_trading_instruction[auction_entry_at] = (auction_entry_base + 228 + auction_entry_at + 1) % 256; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 50 -> auction_entry_record.selling_post_trading_instruction[auction_entry_at] = (auction_entry_base + 278 + auction_entry_at + 1) % 256; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 16 -> auction_entry_record.buying_additional_client_memo[auction_entry_at] = (auction_entry_base + 328 + auction_entry_at + 1) % 256; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 16 -> auction_entry_record.selling_additional_client_memo[auction_entry_at] = (auction_entry_base + 344 + auction_entry_at + 1) % 256; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 4 -> auction_entry_record.reserved_4[auction_entry_at] = (auction_entry_base + 360 + auction_entry_at + 1) % 256; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Entry to the wire, 364 bytes from where the cursor stands */
inline encode_auction_entry(auction_entry_record) {
  auction_entry_at = 0;
  do
  :: auction_entry_at < 2 -> wire[at] = auction_entry_record.group[auction_entry_at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 4 -> wire[at] = auction_entry_record.instrument_optional[auction_entry_at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  wire[at] = auction_entry_record.verb_side; at = at + 1;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 8 -> wire[at] = auction_entry_record.quantity[auction_entry_at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 10 -> wire[at] = auction_entry_record.price[auction_entry_at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  encode_buying_clearing_data(auction_entry_record.buying_clearing_data);
  encode_selling_clearing_data(auction_entry_record.selling_clearing_data);
  encode_buying_owner_data(auction_entry_record.buying_owner_data);
  encode_selling_owner_data(auction_entry_record.selling_owner_data);
  wire[at] = auction_entry_record.iml_handling; at = at + 1;
  wire[at] = auction_entry_record.special_price_term; at = at + 1;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 10 -> wire[at] = auction_entry_record.additional_price[auction_entry_at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  wire[at] = auction_entry_record.quantity_term; at = at + 1;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 8 -> wire[at] = auction_entry_record.additional_quantity[auction_entry_at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 50 -> wire[at] = auction_entry_record.buying_post_trading_instruction[auction_entry_at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 50 -> wire[at] = auction_entry_record.selling_post_trading_instruction[auction_entry_at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 16 -> wire[at] = auction_entry_record.buying_additional_client_memo[auction_entry_at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 16 -> wire[at] = auction_entry_record.selling_additional_client_memo[auction_entry_at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 4 -> wire[at] = auction_entry_record.reserved_4[auction_entry_at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Entry off the wire, 364 bytes from where the cursor stands */
inline decode_auction_entry(auction_entry_record) {
  auction_entry_at = 0;
  do
  :: auction_entry_at < 2 -> auction_entry_record.group[auction_entry_at] = wire[at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 4 -> auction_entry_record.instrument_optional[auction_entry_at] = wire[at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_record.verb_side = wire[at]; at = at + 1;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 8 -> auction_entry_record.quantity[auction_entry_at] = wire[at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 10 -> auction_entry_record.price[auction_entry_at] = wire[at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  decode_buying_clearing_data(auction_entry_record.buying_clearing_data);
  decode_selling_clearing_data(auction_entry_record.selling_clearing_data);
  decode_buying_owner_data(auction_entry_record.buying_owner_data);
  decode_selling_owner_data(auction_entry_record.selling_owner_data);
  auction_entry_record.iml_handling = wire[at]; at = at + 1;
  auction_entry_record.special_price_term = wire[at]; at = at + 1;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 10 -> auction_entry_record.additional_price[auction_entry_at] = wire[at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_record.quantity_term = wire[at]; at = at + 1;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 8 -> auction_entry_record.additional_quantity[auction_entry_at] = wire[at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 50 -> auction_entry_record.buying_post_trading_instruction[auction_entry_at] = wire[at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 50 -> auction_entry_record.selling_post_trading_instruction[auction_entry_at] = wire[at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 16 -> auction_entry_record.buying_additional_client_memo[auction_entry_at] = wire[at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 16 -> auction_entry_record.selling_additional_client_memo[auction_entry_at] = wire[at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 4 -> auction_entry_record.reserved_4[auction_entry_at] = wire[at]; at = at + 1; auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Entry is what was written, byte for byte */
inline equal_auction_entry(auction_entry_read, auction_entry_written) {
  auction_entry_at = 0;
  do
  :: auction_entry_at < 2 -> assert(auction_entry_read.group[auction_entry_at] == auction_entry_written.group[auction_entry_at]); auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 4 -> assert(auction_entry_read.instrument_optional[auction_entry_at] == auction_entry_written.instrument_optional[auction_entry_at]); auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  assert(auction_entry_read.verb_side == auction_entry_written.verb_side);
  auction_entry_at = 0;
  do
  :: auction_entry_at < 8 -> assert(auction_entry_read.quantity[auction_entry_at] == auction_entry_written.quantity[auction_entry_at]); auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 10 -> assert(auction_entry_read.price[auction_entry_at] == auction_entry_written.price[auction_entry_at]); auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  equal_buying_clearing_data(auction_entry_read.buying_clearing_data, auction_entry_written.buying_clearing_data);
  equal_selling_clearing_data(auction_entry_read.selling_clearing_data, auction_entry_written.selling_clearing_data);
  equal_buying_owner_data(auction_entry_read.buying_owner_data, auction_entry_written.buying_owner_data);
  equal_selling_owner_data(auction_entry_read.selling_owner_data, auction_entry_written.selling_owner_data);
  assert(auction_entry_read.iml_handling == auction_entry_written.iml_handling);
  assert(auction_entry_read.special_price_term == auction_entry_written.special_price_term);
  auction_entry_at = 0;
  do
  :: auction_entry_at < 10 -> assert(auction_entry_read.additional_price[auction_entry_at] == auction_entry_written.additional_price[auction_entry_at]); auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  assert(auction_entry_read.quantity_term == auction_entry_written.quantity_term);
  auction_entry_at = 0;
  do
  :: auction_entry_at < 8 -> assert(auction_entry_read.additional_quantity[auction_entry_at] == auction_entry_written.additional_quantity[auction_entry_at]); auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 50 -> assert(auction_entry_read.buying_post_trading_instruction[auction_entry_at] == auction_entry_written.buying_post_trading_instruction[auction_entry_at]); auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 50 -> assert(auction_entry_read.selling_post_trading_instruction[auction_entry_at] == auction_entry_written.selling_post_trading_instruction[auction_entry_at]); auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 16 -> assert(auction_entry_read.buying_additional_client_memo[auction_entry_at] == auction_entry_written.buying_additional_client_memo[auction_entry_at]); auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 16 -> assert(auction_entry_read.selling_additional_client_memo[auction_entry_at] == auction_entry_written.selling_additional_client_memo[auction_entry_at]); auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  auction_entry_at = 0;
  do
  :: auction_entry_at < 4 -> assert(auction_entry_read.reserved_4[auction_entry_at] == auction_entry_written.reserved_4[auction_entry_at]); auction_entry_at = auction_entry_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Clearing Data Dealer: 20 bytes ------------------------------------------ */

/* The guide states these fields once, as Clearing Data, for every message that carries them. */
typedef ClearingDataDealer {
  byte clearing_instruction[12];
  byte account_type;
  byte open_close;
  byte hedge_spec;
  byte clearing_operation_mode;
  byte clearing_destination[4]
};

int clearing_data_dealer_at;

/* every byte of Clearing Data Dealer set to one value */
inline fill_clearing_data_dealer(clearing_data_dealer_record, clearing_data_dealer_value) {
  clearing_data_dealer_at = 0;
  do
  :: clearing_data_dealer_at < 12 -> clearing_data_dealer_record.clearing_instruction[clearing_data_dealer_at] = clearing_data_dealer_value; clearing_data_dealer_at = clearing_data_dealer_at + 1
  :: else -> break
  od;
  clearing_data_dealer_record.account_type = clearing_data_dealer_value;
  clearing_data_dealer_record.open_close = clearing_data_dealer_value;
  clearing_data_dealer_record.hedge_spec = clearing_data_dealer_value;
  clearing_data_dealer_record.clearing_operation_mode = clearing_data_dealer_value;
  clearing_data_dealer_at = 0;
  do
  :: clearing_data_dealer_at < 4 -> clearing_data_dealer_record.clearing_destination[clearing_data_dealer_at] = clearing_data_dealer_value; clearing_data_dealer_at = clearing_data_dealer_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Clearing Data Dealer set to where it lies, so a field read out of place says so */
inline ramp_clearing_data_dealer(clearing_data_dealer_record, clearing_data_dealer_base) {
  clearing_data_dealer_at = 0;
  do
  :: clearing_data_dealer_at < 12 -> clearing_data_dealer_record.clearing_instruction[clearing_data_dealer_at] = (clearing_data_dealer_base + 0 + clearing_data_dealer_at + 1) % 256; clearing_data_dealer_at = clearing_data_dealer_at + 1
  :: else -> break
  od;
  clearing_data_dealer_record.account_type = (clearing_data_dealer_base + 12 + 1) % 256;
  clearing_data_dealer_record.open_close = (clearing_data_dealer_base + 13 + 1) % 256;
  clearing_data_dealer_record.hedge_spec = (clearing_data_dealer_base + 14 + 1) % 256;
  clearing_data_dealer_record.clearing_operation_mode = (clearing_data_dealer_base + 15 + 1) % 256;
  clearing_data_dealer_at = 0;
  do
  :: clearing_data_dealer_at < 4 -> clearing_data_dealer_record.clearing_destination[clearing_data_dealer_at] = (clearing_data_dealer_base + 16 + clearing_data_dealer_at + 1) % 256; clearing_data_dealer_at = clearing_data_dealer_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Data Dealer to the wire, 20 bytes from where the cursor stands */
inline encode_clearing_data_dealer(clearing_data_dealer_record) {
  clearing_data_dealer_at = 0;
  do
  :: clearing_data_dealer_at < 12 -> wire[at] = clearing_data_dealer_record.clearing_instruction[clearing_data_dealer_at]; at = at + 1; clearing_data_dealer_at = clearing_data_dealer_at + 1
  :: else -> break
  od;
  wire[at] = clearing_data_dealer_record.account_type; at = at + 1;
  wire[at] = clearing_data_dealer_record.open_close; at = at + 1;
  wire[at] = clearing_data_dealer_record.hedge_spec; at = at + 1;
  wire[at] = clearing_data_dealer_record.clearing_operation_mode; at = at + 1;
  clearing_data_dealer_at = 0;
  do
  :: clearing_data_dealer_at < 4 -> wire[at] = clearing_data_dealer_record.clearing_destination[clearing_data_dealer_at]; at = at + 1; clearing_data_dealer_at = clearing_data_dealer_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Data Dealer off the wire, 20 bytes from where the cursor stands */
inline decode_clearing_data_dealer(clearing_data_dealer_record) {
  clearing_data_dealer_at = 0;
  do
  :: clearing_data_dealer_at < 12 -> clearing_data_dealer_record.clearing_instruction[clearing_data_dealer_at] = wire[at]; at = at + 1; clearing_data_dealer_at = clearing_data_dealer_at + 1
  :: else -> break
  od;
  clearing_data_dealer_record.account_type = wire[at]; at = at + 1;
  clearing_data_dealer_record.open_close = wire[at]; at = at + 1;
  clearing_data_dealer_record.hedge_spec = wire[at]; at = at + 1;
  clearing_data_dealer_record.clearing_operation_mode = wire[at]; at = at + 1;
  clearing_data_dealer_at = 0;
  do
  :: clearing_data_dealer_at < 4 -> clearing_data_dealer_record.clearing_destination[clearing_data_dealer_at] = wire[at]; at = at + 1; clearing_data_dealer_at = clearing_data_dealer_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Clearing Data Dealer is what was written, byte for byte */
inline equal_clearing_data_dealer(clearing_data_dealer_read, clearing_data_dealer_written) {
  clearing_data_dealer_at = 0;
  do
  :: clearing_data_dealer_at < 12 -> assert(clearing_data_dealer_read.clearing_instruction[clearing_data_dealer_at] == clearing_data_dealer_written.clearing_instruction[clearing_data_dealer_at]); clearing_data_dealer_at = clearing_data_dealer_at + 1
  :: else -> break
  od;
  assert(clearing_data_dealer_read.account_type == clearing_data_dealer_written.account_type);
  assert(clearing_data_dealer_read.open_close == clearing_data_dealer_written.open_close);
  assert(clearing_data_dealer_read.hedge_spec == clearing_data_dealer_written.hedge_spec);
  assert(clearing_data_dealer_read.clearing_operation_mode == clearing_data_dealer_written.clearing_operation_mode);
  clearing_data_dealer_at = 0;
  do
  :: clearing_data_dealer_at < 4 -> assert(clearing_data_dealer_read.clearing_destination[clearing_data_dealer_at] == clearing_data_dealer_written.clearing_destination[clearing_data_dealer_at]); clearing_data_dealer_at = clearing_data_dealer_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Owner Data Dealer: 71 bytes --------------------------------------------- */

/* The guide states these fields once, as Owner Data, for every message that carries them. */
typedef OwnerDataDealer {
  byte client_order_id[20];
  byte pound_sign;
  byte memo[50]
};

int owner_data_dealer_at;

/* every byte of Owner Data Dealer set to one value */
inline fill_owner_data_dealer(owner_data_dealer_record, owner_data_dealer_value) {
  owner_data_dealer_at = 0;
  do
  :: owner_data_dealer_at < 20 -> owner_data_dealer_record.client_order_id[owner_data_dealer_at] = owner_data_dealer_value; owner_data_dealer_at = owner_data_dealer_at + 1
  :: else -> break
  od;
  owner_data_dealer_record.pound_sign = owner_data_dealer_value;
  owner_data_dealer_at = 0;
  do
  :: owner_data_dealer_at < 50 -> owner_data_dealer_record.memo[owner_data_dealer_at] = owner_data_dealer_value; owner_data_dealer_at = owner_data_dealer_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Owner Data Dealer set to where it lies, so a field read out of place says so */
inline ramp_owner_data_dealer(owner_data_dealer_record, owner_data_dealer_base) {
  owner_data_dealer_at = 0;
  do
  :: owner_data_dealer_at < 20 -> owner_data_dealer_record.client_order_id[owner_data_dealer_at] = (owner_data_dealer_base + 0 + owner_data_dealer_at + 1) % 256; owner_data_dealer_at = owner_data_dealer_at + 1
  :: else -> break
  od;
  owner_data_dealer_record.pound_sign = (owner_data_dealer_base + 20 + 1) % 256;
  owner_data_dealer_at = 0;
  do
  :: owner_data_dealer_at < 50 -> owner_data_dealer_record.memo[owner_data_dealer_at] = (owner_data_dealer_base + 21 + owner_data_dealer_at + 1) % 256; owner_data_dealer_at = owner_data_dealer_at + 1
  :: else -> break
  od;
  skip
}

/* Owner Data Dealer to the wire, 71 bytes from where the cursor stands */
inline encode_owner_data_dealer(owner_data_dealer_record) {
  owner_data_dealer_at = 0;
  do
  :: owner_data_dealer_at < 20 -> wire[at] = owner_data_dealer_record.client_order_id[owner_data_dealer_at]; at = at + 1; owner_data_dealer_at = owner_data_dealer_at + 1
  :: else -> break
  od;
  wire[at] = owner_data_dealer_record.pound_sign; at = at + 1;
  owner_data_dealer_at = 0;
  do
  :: owner_data_dealer_at < 50 -> wire[at] = owner_data_dealer_record.memo[owner_data_dealer_at]; at = at + 1; owner_data_dealer_at = owner_data_dealer_at + 1
  :: else -> break
  od;
  skip
}

/* Owner Data Dealer off the wire, 71 bytes from where the cursor stands */
inline decode_owner_data_dealer(owner_data_dealer_record) {
  owner_data_dealer_at = 0;
  do
  :: owner_data_dealer_at < 20 -> owner_data_dealer_record.client_order_id[owner_data_dealer_at] = wire[at]; at = at + 1; owner_data_dealer_at = owner_data_dealer_at + 1
  :: else -> break
  od;
  owner_data_dealer_record.pound_sign = wire[at]; at = at + 1;
  owner_data_dealer_at = 0;
  do
  :: owner_data_dealer_at < 50 -> owner_data_dealer_record.memo[owner_data_dealer_at] = wire[at]; at = at + 1; owner_data_dealer_at = owner_data_dealer_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Owner Data Dealer is what was written, byte for byte */
inline equal_owner_data_dealer(owner_data_dealer_read, owner_data_dealer_written) {
  owner_data_dealer_at = 0;
  do
  :: owner_data_dealer_at < 20 -> assert(owner_data_dealer_read.client_order_id[owner_data_dealer_at] == owner_data_dealer_written.client_order_id[owner_data_dealer_at]); owner_data_dealer_at = owner_data_dealer_at + 1
  :: else -> break
  od;
  assert(owner_data_dealer_read.pound_sign == owner_data_dealer_written.pound_sign);
  owner_data_dealer_at = 0;
  do
  :: owner_data_dealer_at < 50 -> assert(owner_data_dealer_read.memo[owner_data_dealer_at] == owner_data_dealer_written.memo[owner_data_dealer_at]); owner_data_dealer_at = owner_data_dealer_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Directed Order Acceptation: 200 bytes ----------------------------------- */

typedef DirectedOrderAcceptation {
  byte group[2];
  byte instrument_optional[4];
  byte referenced_order_id[8];
  byte auction_starting_price[10];
  ClearingDataDealer clearing_data_dealer;
  OwnerDataDealer owner_data_dealer;
  byte additional_price[10];
  byte quantity_term;
  byte post_trading_instruction[50];
  byte additional_quantity[8];
  byte additional_client_memo[16]
};

int directed_order_acceptation_at;

/* every byte of Directed Order Acceptation set to one value */
inline fill_directed_order_acceptation(directed_order_acceptation_record, directed_order_acceptation_value) {
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 2 -> directed_order_acceptation_record.group[directed_order_acceptation_at] = directed_order_acceptation_value; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 4 -> directed_order_acceptation_record.instrument_optional[directed_order_acceptation_at] = directed_order_acceptation_value; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 8 -> directed_order_acceptation_record.referenced_order_id[directed_order_acceptation_at] = directed_order_acceptation_value; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 10 -> directed_order_acceptation_record.auction_starting_price[directed_order_acceptation_at] = directed_order_acceptation_value; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  fill_clearing_data_dealer(directed_order_acceptation_record.clearing_data_dealer, directed_order_acceptation_value);
  fill_owner_data_dealer(directed_order_acceptation_record.owner_data_dealer, directed_order_acceptation_value);
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 10 -> directed_order_acceptation_record.additional_price[directed_order_acceptation_at] = directed_order_acceptation_value; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_record.quantity_term = directed_order_acceptation_value;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 50 -> directed_order_acceptation_record.post_trading_instruction[directed_order_acceptation_at] = directed_order_acceptation_value; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 8 -> directed_order_acceptation_record.additional_quantity[directed_order_acceptation_at] = directed_order_acceptation_value; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 16 -> directed_order_acceptation_record.additional_client_memo[directed_order_acceptation_at] = directed_order_acceptation_value; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Directed Order Acceptation set to where it lies, so a field read out of place says so */
inline ramp_directed_order_acceptation(directed_order_acceptation_record, directed_order_acceptation_base) {
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 2 -> directed_order_acceptation_record.group[directed_order_acceptation_at] = (directed_order_acceptation_base + 0 + directed_order_acceptation_at + 1) % 256; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 4 -> directed_order_acceptation_record.instrument_optional[directed_order_acceptation_at] = (directed_order_acceptation_base + 2 + directed_order_acceptation_at + 1) % 256; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 8 -> directed_order_acceptation_record.referenced_order_id[directed_order_acceptation_at] = (directed_order_acceptation_base + 6 + directed_order_acceptation_at + 1) % 256; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 10 -> directed_order_acceptation_record.auction_starting_price[directed_order_acceptation_at] = (directed_order_acceptation_base + 14 + directed_order_acceptation_at + 1) % 256; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  ramp_clearing_data_dealer(directed_order_acceptation_record.clearing_data_dealer, directed_order_acceptation_base + 24);
  ramp_owner_data_dealer(directed_order_acceptation_record.owner_data_dealer, directed_order_acceptation_base + 44);
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 10 -> directed_order_acceptation_record.additional_price[directed_order_acceptation_at] = (directed_order_acceptation_base + 115 + directed_order_acceptation_at + 1) % 256; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_record.quantity_term = (directed_order_acceptation_base + 125 + 1) % 256;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 50 -> directed_order_acceptation_record.post_trading_instruction[directed_order_acceptation_at] = (directed_order_acceptation_base + 126 + directed_order_acceptation_at + 1) % 256; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 8 -> directed_order_acceptation_record.additional_quantity[directed_order_acceptation_at] = (directed_order_acceptation_base + 176 + directed_order_acceptation_at + 1) % 256; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 16 -> directed_order_acceptation_record.additional_client_memo[directed_order_acceptation_at] = (directed_order_acceptation_base + 184 + directed_order_acceptation_at + 1) % 256; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  skip
}

/* Directed Order Acceptation to the wire, 200 bytes from where the cursor stands */
inline encode_directed_order_acceptation(directed_order_acceptation_record) {
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 2 -> wire[at] = directed_order_acceptation_record.group[directed_order_acceptation_at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 4 -> wire[at] = directed_order_acceptation_record.instrument_optional[directed_order_acceptation_at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 8 -> wire[at] = directed_order_acceptation_record.referenced_order_id[directed_order_acceptation_at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 10 -> wire[at] = directed_order_acceptation_record.auction_starting_price[directed_order_acceptation_at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  encode_clearing_data_dealer(directed_order_acceptation_record.clearing_data_dealer);
  encode_owner_data_dealer(directed_order_acceptation_record.owner_data_dealer);
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 10 -> wire[at] = directed_order_acceptation_record.additional_price[directed_order_acceptation_at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  wire[at] = directed_order_acceptation_record.quantity_term; at = at + 1;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 50 -> wire[at] = directed_order_acceptation_record.post_trading_instruction[directed_order_acceptation_at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 8 -> wire[at] = directed_order_acceptation_record.additional_quantity[directed_order_acceptation_at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 16 -> wire[at] = directed_order_acceptation_record.additional_client_memo[directed_order_acceptation_at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  skip
}

/* Directed Order Acceptation off the wire, 200 bytes from where the cursor stands */
inline decode_directed_order_acceptation(directed_order_acceptation_record) {
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 2 -> directed_order_acceptation_record.group[directed_order_acceptation_at] = wire[at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 4 -> directed_order_acceptation_record.instrument_optional[directed_order_acceptation_at] = wire[at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 8 -> directed_order_acceptation_record.referenced_order_id[directed_order_acceptation_at] = wire[at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 10 -> directed_order_acceptation_record.auction_starting_price[directed_order_acceptation_at] = wire[at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  decode_clearing_data_dealer(directed_order_acceptation_record.clearing_data_dealer);
  decode_owner_data_dealer(directed_order_acceptation_record.owner_data_dealer);
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 10 -> directed_order_acceptation_record.additional_price[directed_order_acceptation_at] = wire[at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_record.quantity_term = wire[at]; at = at + 1;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 50 -> directed_order_acceptation_record.post_trading_instruction[directed_order_acceptation_at] = wire[at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 8 -> directed_order_acceptation_record.additional_quantity[directed_order_acceptation_at] = wire[at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 16 -> directed_order_acceptation_record.additional_client_memo[directed_order_acceptation_at] = wire[at]; at = at + 1; directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Directed Order Acceptation is what was written, byte for byte */
inline equal_directed_order_acceptation(directed_order_acceptation_read, directed_order_acceptation_written) {
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 2 -> assert(directed_order_acceptation_read.group[directed_order_acceptation_at] == directed_order_acceptation_written.group[directed_order_acceptation_at]); directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 4 -> assert(directed_order_acceptation_read.instrument_optional[directed_order_acceptation_at] == directed_order_acceptation_written.instrument_optional[directed_order_acceptation_at]); directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 8 -> assert(directed_order_acceptation_read.referenced_order_id[directed_order_acceptation_at] == directed_order_acceptation_written.referenced_order_id[directed_order_acceptation_at]); directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 10 -> assert(directed_order_acceptation_read.auction_starting_price[directed_order_acceptation_at] == directed_order_acceptation_written.auction_starting_price[directed_order_acceptation_at]); directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  equal_clearing_data_dealer(directed_order_acceptation_read.clearing_data_dealer, directed_order_acceptation_written.clearing_data_dealer);
  equal_owner_data_dealer(directed_order_acceptation_read.owner_data_dealer, directed_order_acceptation_written.owner_data_dealer);
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 10 -> assert(directed_order_acceptation_read.additional_price[directed_order_acceptation_at] == directed_order_acceptation_written.additional_price[directed_order_acceptation_at]); directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  assert(directed_order_acceptation_read.quantity_term == directed_order_acceptation_written.quantity_term);
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 50 -> assert(directed_order_acceptation_read.post_trading_instruction[directed_order_acceptation_at] == directed_order_acceptation_written.post_trading_instruction[directed_order_acceptation_at]); directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 8 -> assert(directed_order_acceptation_read.additional_quantity[directed_order_acceptation_at] == directed_order_acceptation_written.additional_quantity[directed_order_acceptation_at]); directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  directed_order_acceptation_at = 0;
  do
  :: directed_order_acceptation_at < 16 -> assert(directed_order_acceptation_read.additional_client_memo[directed_order_acceptation_at] == directed_order_acceptation_written.additional_client_memo[directed_order_acceptation_at]); directed_order_acceptation_at = directed_order_acceptation_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Entry: 221 bytes -------------------------------------------------- */

typedef OrderEntry {
  byte group[2];
  byte instrument_optional[4];
  byte price_type;
  byte verb_side;
  byte quantity[8];
  byte price[10];
  byte special_price_term;
  byte reserved_10[10];
  byte quantity_term;
  byte additional_quantity[8];
  byte duration_type;
  byte gtd_date[8];
  byte executing_participant[4];
  byte iml_handling;
  ClearingData clearing_data;
  OwnerData owner_data;
  byte post_trading_instructions[50];
  byte additional_client_memo[16];
  byte reserved_4[4]
};

int order_entry_at;

/* every byte of Order Entry set to one value */
inline fill_order_entry(order_entry_record, order_entry_value) {
  order_entry_at = 0;
  do
  :: order_entry_at < 2 -> order_entry_record.group[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> order_entry_record.instrument_optional[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.price_type = order_entry_value;
  order_entry_record.verb_side = order_entry_value;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.quantity[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 10 -> order_entry_record.price[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.special_price_term = order_entry_value;
  order_entry_at = 0;
  do
  :: order_entry_at < 10 -> order_entry_record.reserved_10[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.quantity_term = order_entry_value;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.additional_quantity[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.duration_type = order_entry_value;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.gtd_date[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> order_entry_record.executing_participant[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.iml_handling = order_entry_value;
  fill_clearing_data(order_entry_record.clearing_data, order_entry_value);
  fill_owner_data(order_entry_record.owner_data, order_entry_value);
  order_entry_at = 0;
  do
  :: order_entry_at < 50 -> order_entry_record.post_trading_instructions[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 16 -> order_entry_record.additional_client_memo[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> order_entry_record.reserved_4[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Entry set to where it lies, so a field read out of place says so */
inline ramp_order_entry(order_entry_record, order_entry_base) {
  order_entry_at = 0;
  do
  :: order_entry_at < 2 -> order_entry_record.group[order_entry_at] = (order_entry_base + 0 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> order_entry_record.instrument_optional[order_entry_at] = (order_entry_base + 2 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.price_type = (order_entry_base + 6 + 1) % 256;
  order_entry_record.verb_side = (order_entry_base + 7 + 1) % 256;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.quantity[order_entry_at] = (order_entry_base + 8 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 10 -> order_entry_record.price[order_entry_at] = (order_entry_base + 16 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.special_price_term = (order_entry_base + 26 + 1) % 256;
  order_entry_at = 0;
  do
  :: order_entry_at < 10 -> order_entry_record.reserved_10[order_entry_at] = (order_entry_base + 27 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.quantity_term = (order_entry_base + 37 + 1) % 256;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.additional_quantity[order_entry_at] = (order_entry_base + 38 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.duration_type = (order_entry_base + 46 + 1) % 256;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.gtd_date[order_entry_at] = (order_entry_base + 47 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> order_entry_record.executing_participant[order_entry_at] = (order_entry_base + 55 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.iml_handling = (order_entry_base + 59 + 1) % 256;
  ramp_clearing_data(order_entry_record.clearing_data, order_entry_base + 60);
  ramp_owner_data(order_entry_record.owner_data, order_entry_base + 80);
  order_entry_at = 0;
  do
  :: order_entry_at < 50 -> order_entry_record.post_trading_instructions[order_entry_at] = (order_entry_base + 151 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 16 -> order_entry_record.additional_client_memo[order_entry_at] = (order_entry_base + 201 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> order_entry_record.reserved_4[order_entry_at] = (order_entry_base + 217 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Order Entry to the wire, 221 bytes from where the cursor stands */
inline encode_order_entry(order_entry_record) {
  order_entry_at = 0;
  do
  :: order_entry_at < 2 -> wire[at] = order_entry_record.group[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> wire[at] = order_entry_record.instrument_optional[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  wire[at] = order_entry_record.price_type; at = at + 1;
  wire[at] = order_entry_record.verb_side; at = at + 1;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> wire[at] = order_entry_record.quantity[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 10 -> wire[at] = order_entry_record.price[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  wire[at] = order_entry_record.special_price_term; at = at + 1;
  order_entry_at = 0;
  do
  :: order_entry_at < 10 -> wire[at] = order_entry_record.reserved_10[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  wire[at] = order_entry_record.quantity_term; at = at + 1;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> wire[at] = order_entry_record.additional_quantity[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  wire[at] = order_entry_record.duration_type; at = at + 1;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> wire[at] = order_entry_record.gtd_date[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> wire[at] = order_entry_record.executing_participant[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  wire[at] = order_entry_record.iml_handling; at = at + 1;
  encode_clearing_data(order_entry_record.clearing_data);
  encode_owner_data(order_entry_record.owner_data);
  order_entry_at = 0;
  do
  :: order_entry_at < 50 -> wire[at] = order_entry_record.post_trading_instructions[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 16 -> wire[at] = order_entry_record.additional_client_memo[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> wire[at] = order_entry_record.reserved_4[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Order Entry off the wire, 221 bytes from where the cursor stands */
inline decode_order_entry(order_entry_record) {
  order_entry_at = 0;
  do
  :: order_entry_at < 2 -> order_entry_record.group[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> order_entry_record.instrument_optional[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.price_type = wire[at]; at = at + 1;
  order_entry_record.verb_side = wire[at]; at = at + 1;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.quantity[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 10 -> order_entry_record.price[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.special_price_term = wire[at]; at = at + 1;
  order_entry_at = 0;
  do
  :: order_entry_at < 10 -> order_entry_record.reserved_10[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.quantity_term = wire[at]; at = at + 1;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.additional_quantity[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.duration_type = wire[at]; at = at + 1;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.gtd_date[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> order_entry_record.executing_participant[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.iml_handling = wire[at]; at = at + 1;
  decode_clearing_data(order_entry_record.clearing_data);
  decode_owner_data(order_entry_record.owner_data);
  order_entry_at = 0;
  do
  :: order_entry_at < 50 -> order_entry_record.post_trading_instructions[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 16 -> order_entry_record.additional_client_memo[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> order_entry_record.reserved_4[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Entry is what was written, byte for byte */
inline equal_order_entry(order_entry_read, order_entry_written) {
  order_entry_at = 0;
  do
  :: order_entry_at < 2 -> assert(order_entry_read.group[order_entry_at] == order_entry_written.group[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> assert(order_entry_read.instrument_optional[order_entry_at] == order_entry_written.instrument_optional[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  assert(order_entry_read.price_type == order_entry_written.price_type);
  assert(order_entry_read.verb_side == order_entry_written.verb_side);
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> assert(order_entry_read.quantity[order_entry_at] == order_entry_written.quantity[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 10 -> assert(order_entry_read.price[order_entry_at] == order_entry_written.price[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  assert(order_entry_read.special_price_term == order_entry_written.special_price_term);
  order_entry_at = 0;
  do
  :: order_entry_at < 10 -> assert(order_entry_read.reserved_10[order_entry_at] == order_entry_written.reserved_10[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  assert(order_entry_read.quantity_term == order_entry_written.quantity_term);
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> assert(order_entry_read.additional_quantity[order_entry_at] == order_entry_written.additional_quantity[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  assert(order_entry_read.duration_type == order_entry_written.duration_type);
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> assert(order_entry_read.gtd_date[order_entry_at] == order_entry_written.gtd_date[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> assert(order_entry_read.executing_participant[order_entry_at] == order_entry_written.executing_participant[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  assert(order_entry_read.iml_handling == order_entry_written.iml_handling);
  equal_clearing_data(order_entry_read.clearing_data, order_entry_written.clearing_data);
  equal_owner_data(order_entry_read.owner_data, order_entry_written.owner_data);
  order_entry_at = 0;
  do
  :: order_entry_at < 50 -> assert(order_entry_read.post_trading_instructions[order_entry_at] == order_entry_written.post_trading_instructions[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 16 -> assert(order_entry_read.additional_client_memo[order_entry_at] == order_entry_written.additional_client_memo[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> assert(order_entry_read.reserved_4[order_entry_at] == order_entry_written.reserved_4[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Improvement Order Entry: 210 bytes -------------------------------------- */

typedef ImprovementOrderEntry {
  byte group[2];
  byte instrument_optional[4];
  byte verb_side;
  byte quantity_sign;
  byte quantity[8];
  byte price[10];
  byte auction_i_d_optional[6];
  byte reserved_17[17];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte post_trading_instructions[50];
  byte additional_client_memo[16];
  byte reserved_4[4]
};

int improvement_order_entry_at;

/* every byte of Improvement Order Entry set to one value */
inline fill_improvement_order_entry(improvement_order_entry_record, improvement_order_entry_value) {
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 2 -> improvement_order_entry_record.group[improvement_order_entry_at] = improvement_order_entry_value; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 4 -> improvement_order_entry_record.instrument_optional[improvement_order_entry_at] = improvement_order_entry_value; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_record.verb_side = improvement_order_entry_value;
  improvement_order_entry_record.quantity_sign = improvement_order_entry_value;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 8 -> improvement_order_entry_record.quantity[improvement_order_entry_at] = improvement_order_entry_value; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 10 -> improvement_order_entry_record.price[improvement_order_entry_at] = improvement_order_entry_value; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 6 -> improvement_order_entry_record.auction_i_d_optional[improvement_order_entry_at] = improvement_order_entry_value; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 17 -> improvement_order_entry_record.reserved_17[improvement_order_entry_at] = improvement_order_entry_value; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  fill_clearing_data(improvement_order_entry_record.clearing_data, improvement_order_entry_value);
  fill_owner_data(improvement_order_entry_record.owner_data, improvement_order_entry_value);
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 50 -> improvement_order_entry_record.post_trading_instructions[improvement_order_entry_at] = improvement_order_entry_value; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 16 -> improvement_order_entry_record.additional_client_memo[improvement_order_entry_at] = improvement_order_entry_value; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 4 -> improvement_order_entry_record.reserved_4[improvement_order_entry_at] = improvement_order_entry_value; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Improvement Order Entry set to where it lies, so a field read out of place says so */
inline ramp_improvement_order_entry(improvement_order_entry_record, improvement_order_entry_base) {
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 2 -> improvement_order_entry_record.group[improvement_order_entry_at] = (improvement_order_entry_base + 0 + improvement_order_entry_at + 1) % 256; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 4 -> improvement_order_entry_record.instrument_optional[improvement_order_entry_at] = (improvement_order_entry_base + 2 + improvement_order_entry_at + 1) % 256; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_record.verb_side = (improvement_order_entry_base + 6 + 1) % 256;
  improvement_order_entry_record.quantity_sign = (improvement_order_entry_base + 7 + 1) % 256;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 8 -> improvement_order_entry_record.quantity[improvement_order_entry_at] = (improvement_order_entry_base + 8 + improvement_order_entry_at + 1) % 256; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 10 -> improvement_order_entry_record.price[improvement_order_entry_at] = (improvement_order_entry_base + 16 + improvement_order_entry_at + 1) % 256; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 6 -> improvement_order_entry_record.auction_i_d_optional[improvement_order_entry_at] = (improvement_order_entry_base + 26 + improvement_order_entry_at + 1) % 256; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 17 -> improvement_order_entry_record.reserved_17[improvement_order_entry_at] = (improvement_order_entry_base + 32 + improvement_order_entry_at + 1) % 256; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  ramp_clearing_data(improvement_order_entry_record.clearing_data, improvement_order_entry_base + 49);
  ramp_owner_data(improvement_order_entry_record.owner_data, improvement_order_entry_base + 69);
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 50 -> improvement_order_entry_record.post_trading_instructions[improvement_order_entry_at] = (improvement_order_entry_base + 140 + improvement_order_entry_at + 1) % 256; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 16 -> improvement_order_entry_record.additional_client_memo[improvement_order_entry_at] = (improvement_order_entry_base + 190 + improvement_order_entry_at + 1) % 256; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 4 -> improvement_order_entry_record.reserved_4[improvement_order_entry_at] = (improvement_order_entry_base + 206 + improvement_order_entry_at + 1) % 256; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Improvement Order Entry to the wire, 210 bytes from where the cursor stands */
inline encode_improvement_order_entry(improvement_order_entry_record) {
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 2 -> wire[at] = improvement_order_entry_record.group[improvement_order_entry_at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 4 -> wire[at] = improvement_order_entry_record.instrument_optional[improvement_order_entry_at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  wire[at] = improvement_order_entry_record.verb_side; at = at + 1;
  wire[at] = improvement_order_entry_record.quantity_sign; at = at + 1;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 8 -> wire[at] = improvement_order_entry_record.quantity[improvement_order_entry_at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 10 -> wire[at] = improvement_order_entry_record.price[improvement_order_entry_at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 6 -> wire[at] = improvement_order_entry_record.auction_i_d_optional[improvement_order_entry_at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 17 -> wire[at] = improvement_order_entry_record.reserved_17[improvement_order_entry_at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  encode_clearing_data(improvement_order_entry_record.clearing_data);
  encode_owner_data(improvement_order_entry_record.owner_data);
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 50 -> wire[at] = improvement_order_entry_record.post_trading_instructions[improvement_order_entry_at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 16 -> wire[at] = improvement_order_entry_record.additional_client_memo[improvement_order_entry_at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 4 -> wire[at] = improvement_order_entry_record.reserved_4[improvement_order_entry_at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Improvement Order Entry off the wire, 210 bytes from where the cursor stands */
inline decode_improvement_order_entry(improvement_order_entry_record) {
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 2 -> improvement_order_entry_record.group[improvement_order_entry_at] = wire[at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 4 -> improvement_order_entry_record.instrument_optional[improvement_order_entry_at] = wire[at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_record.verb_side = wire[at]; at = at + 1;
  improvement_order_entry_record.quantity_sign = wire[at]; at = at + 1;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 8 -> improvement_order_entry_record.quantity[improvement_order_entry_at] = wire[at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 10 -> improvement_order_entry_record.price[improvement_order_entry_at] = wire[at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 6 -> improvement_order_entry_record.auction_i_d_optional[improvement_order_entry_at] = wire[at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 17 -> improvement_order_entry_record.reserved_17[improvement_order_entry_at] = wire[at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  decode_clearing_data(improvement_order_entry_record.clearing_data);
  decode_owner_data(improvement_order_entry_record.owner_data);
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 50 -> improvement_order_entry_record.post_trading_instructions[improvement_order_entry_at] = wire[at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 16 -> improvement_order_entry_record.additional_client_memo[improvement_order_entry_at] = wire[at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 4 -> improvement_order_entry_record.reserved_4[improvement_order_entry_at] = wire[at]; at = at + 1; improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Improvement Order Entry is what was written, byte for byte */
inline equal_improvement_order_entry(improvement_order_entry_read, improvement_order_entry_written) {
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 2 -> assert(improvement_order_entry_read.group[improvement_order_entry_at] == improvement_order_entry_written.group[improvement_order_entry_at]); improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 4 -> assert(improvement_order_entry_read.instrument_optional[improvement_order_entry_at] == improvement_order_entry_written.instrument_optional[improvement_order_entry_at]); improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  assert(improvement_order_entry_read.verb_side == improvement_order_entry_written.verb_side);
  assert(improvement_order_entry_read.quantity_sign == improvement_order_entry_written.quantity_sign);
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 8 -> assert(improvement_order_entry_read.quantity[improvement_order_entry_at] == improvement_order_entry_written.quantity[improvement_order_entry_at]); improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 10 -> assert(improvement_order_entry_read.price[improvement_order_entry_at] == improvement_order_entry_written.price[improvement_order_entry_at]); improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 6 -> assert(improvement_order_entry_read.auction_i_d_optional[improvement_order_entry_at] == improvement_order_entry_written.auction_i_d_optional[improvement_order_entry_at]); improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 17 -> assert(improvement_order_entry_read.reserved_17[improvement_order_entry_at] == improvement_order_entry_written.reserved_17[improvement_order_entry_at]); improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  equal_clearing_data(improvement_order_entry_read.clearing_data, improvement_order_entry_written.clearing_data);
  equal_owner_data(improvement_order_entry_read.owner_data, improvement_order_entry_written.owner_data);
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 50 -> assert(improvement_order_entry_read.post_trading_instructions[improvement_order_entry_at] == improvement_order_entry_written.post_trading_instructions[improvement_order_entry_at]); improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 16 -> assert(improvement_order_entry_read.additional_client_memo[improvement_order_entry_at] == improvement_order_entry_written.additional_client_memo[improvement_order_entry_at]); improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  improvement_order_entry_at = 0;
  do
  :: improvement_order_entry_at < 4 -> assert(improvement_order_entry_read.reserved_4[improvement_order_entry_at] == improvement_order_entry_written.reserved_4[improvement_order_entry_at]); improvement_order_entry_at = improvement_order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modification: 230 bytes ------------------------------------------- */

typedef OrderModification {
  byte group[2];
  byte instrument_optional[4];
  byte price_type;
  byte verb_side;
  byte quantity_sign;
  byte quantity[8];
  byte price[10];
  byte special_price_term;
  byte reserved_10[10];
  byte reserved_1;
  byte reserved_8[8];
  byte duration_type;
  byte gtd_date[8];
  byte firm_id[4];
  byte iml_handling;
  byte modified_order_id[8];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte post_trading_instruction[50];
  byte additional_client_memo[16];
  byte reserved_4[4]
};

int order_modification_at;

/* every byte of Order Modification set to one value */
inline fill_order_modification(order_modification_record, order_modification_value) {
  order_modification_at = 0;
  do
  :: order_modification_at < 2 -> order_modification_record.group[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> order_modification_record.instrument_optional[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.price_type = order_modification_value;
  order_modification_record.verb_side = order_modification_value;
  order_modification_record.quantity_sign = order_modification_value;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.quantity[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 10 -> order_modification_record.price[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.special_price_term = order_modification_value;
  order_modification_at = 0;
  do
  :: order_modification_at < 10 -> order_modification_record.reserved_10[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.reserved_1 = order_modification_value;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.reserved_8[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.duration_type = order_modification_value;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.gtd_date[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> order_modification_record.firm_id[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.iml_handling = order_modification_value;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.modified_order_id[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  fill_clearing_data(order_modification_record.clearing_data, order_modification_value);
  fill_owner_data(order_modification_record.owner_data, order_modification_value);
  order_modification_at = 0;
  do
  :: order_modification_at < 50 -> order_modification_record.post_trading_instruction[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 16 -> order_modification_record.additional_client_memo[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> order_modification_record.reserved_4[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modification set to where it lies, so a field read out of place says so */
inline ramp_order_modification(order_modification_record, order_modification_base) {
  order_modification_at = 0;
  do
  :: order_modification_at < 2 -> order_modification_record.group[order_modification_at] = (order_modification_base + 0 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> order_modification_record.instrument_optional[order_modification_at] = (order_modification_base + 2 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.price_type = (order_modification_base + 6 + 1) % 256;
  order_modification_record.verb_side = (order_modification_base + 7 + 1) % 256;
  order_modification_record.quantity_sign = (order_modification_base + 8 + 1) % 256;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.quantity[order_modification_at] = (order_modification_base + 9 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 10 -> order_modification_record.price[order_modification_at] = (order_modification_base + 17 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.special_price_term = (order_modification_base + 27 + 1) % 256;
  order_modification_at = 0;
  do
  :: order_modification_at < 10 -> order_modification_record.reserved_10[order_modification_at] = (order_modification_base + 28 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.reserved_1 = (order_modification_base + 38 + 1) % 256;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.reserved_8[order_modification_at] = (order_modification_base + 39 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.duration_type = (order_modification_base + 47 + 1) % 256;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.gtd_date[order_modification_at] = (order_modification_base + 48 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> order_modification_record.firm_id[order_modification_at] = (order_modification_base + 56 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.iml_handling = (order_modification_base + 60 + 1) % 256;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.modified_order_id[order_modification_at] = (order_modification_base + 61 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  ramp_clearing_data(order_modification_record.clearing_data, order_modification_base + 69);
  ramp_owner_data(order_modification_record.owner_data, order_modification_base + 89);
  order_modification_at = 0;
  do
  :: order_modification_at < 50 -> order_modification_record.post_trading_instruction[order_modification_at] = (order_modification_base + 160 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 16 -> order_modification_record.additional_client_memo[order_modification_at] = (order_modification_base + 210 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> order_modification_record.reserved_4[order_modification_at] = (order_modification_base + 226 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modification to the wire, 230 bytes from where the cursor stands */
inline encode_order_modification(order_modification_record) {
  order_modification_at = 0;
  do
  :: order_modification_at < 2 -> wire[at] = order_modification_record.group[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> wire[at] = order_modification_record.instrument_optional[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  wire[at] = order_modification_record.price_type; at = at + 1;
  wire[at] = order_modification_record.verb_side; at = at + 1;
  wire[at] = order_modification_record.quantity_sign; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> wire[at] = order_modification_record.quantity[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 10 -> wire[at] = order_modification_record.price[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  wire[at] = order_modification_record.special_price_term; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 10 -> wire[at] = order_modification_record.reserved_10[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  wire[at] = order_modification_record.reserved_1; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> wire[at] = order_modification_record.reserved_8[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  wire[at] = order_modification_record.duration_type; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> wire[at] = order_modification_record.gtd_date[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> wire[at] = order_modification_record.firm_id[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  wire[at] = order_modification_record.iml_handling; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> wire[at] = order_modification_record.modified_order_id[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  encode_clearing_data(order_modification_record.clearing_data);
  encode_owner_data(order_modification_record.owner_data);
  order_modification_at = 0;
  do
  :: order_modification_at < 50 -> wire[at] = order_modification_record.post_trading_instruction[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 16 -> wire[at] = order_modification_record.additional_client_memo[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> wire[at] = order_modification_record.reserved_4[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modification off the wire, 230 bytes from where the cursor stands */
inline decode_order_modification(order_modification_record) {
  order_modification_at = 0;
  do
  :: order_modification_at < 2 -> order_modification_record.group[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> order_modification_record.instrument_optional[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.price_type = wire[at]; at = at + 1;
  order_modification_record.verb_side = wire[at]; at = at + 1;
  order_modification_record.quantity_sign = wire[at]; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.quantity[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 10 -> order_modification_record.price[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.special_price_term = wire[at]; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 10 -> order_modification_record.reserved_10[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.reserved_1 = wire[at]; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.reserved_8[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.duration_type = wire[at]; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.gtd_date[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> order_modification_record.firm_id[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.iml_handling = wire[at]; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.modified_order_id[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  decode_clearing_data(order_modification_record.clearing_data);
  decode_owner_data(order_modification_record.owner_data);
  order_modification_at = 0;
  do
  :: order_modification_at < 50 -> order_modification_record.post_trading_instruction[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 16 -> order_modification_record.additional_client_memo[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> order_modification_record.reserved_4[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modification is what was written, byte for byte */
inline equal_order_modification(order_modification_read, order_modification_written) {
  order_modification_at = 0;
  do
  :: order_modification_at < 2 -> assert(order_modification_read.group[order_modification_at] == order_modification_written.group[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> assert(order_modification_read.instrument_optional[order_modification_at] == order_modification_written.instrument_optional[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  assert(order_modification_read.price_type == order_modification_written.price_type);
  assert(order_modification_read.verb_side == order_modification_written.verb_side);
  assert(order_modification_read.quantity_sign == order_modification_written.quantity_sign);
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> assert(order_modification_read.quantity[order_modification_at] == order_modification_written.quantity[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 10 -> assert(order_modification_read.price[order_modification_at] == order_modification_written.price[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  assert(order_modification_read.special_price_term == order_modification_written.special_price_term);
  order_modification_at = 0;
  do
  :: order_modification_at < 10 -> assert(order_modification_read.reserved_10[order_modification_at] == order_modification_written.reserved_10[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  assert(order_modification_read.reserved_1 == order_modification_written.reserved_1);
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> assert(order_modification_read.reserved_8[order_modification_at] == order_modification_written.reserved_8[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  assert(order_modification_read.duration_type == order_modification_written.duration_type);
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> assert(order_modification_read.gtd_date[order_modification_at] == order_modification_written.gtd_date[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> assert(order_modification_read.firm_id[order_modification_at] == order_modification_written.firm_id[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  assert(order_modification_read.iml_handling == order_modification_written.iml_handling);
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> assert(order_modification_read.modified_order_id[order_modification_at] == order_modification_written.modified_order_id[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  equal_clearing_data(order_modification_read.clearing_data, order_modification_written.clearing_data);
  equal_owner_data(order_modification_read.owner_data, order_modification_written.owner_data);
  order_modification_at = 0;
  do
  :: order_modification_at < 50 -> assert(order_modification_read.post_trading_instruction[order_modification_at] == order_modification_written.post_trading_instruction[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 16 -> assert(order_modification_read.additional_client_memo[order_modification_at] == order_modification_written.additional_client_memo[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> assert(order_modification_read.reserved_4[order_modification_at] == order_modification_written.reserved_4[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Maker Protection Subscription: 3 bytes --------------------------- */

typedef MarketMakerProtectionSubscription {
  byte group[2];
  byte protection_type_advanced_normal
};

int market_maker_protection_subscription_at;

/* every byte of Market Maker Protection Subscription set to one value */
inline fill_market_maker_protection_subscription(market_maker_protection_subscription_record, market_maker_protection_subscription_value) {
  market_maker_protection_subscription_at = 0;
  do
  :: market_maker_protection_subscription_at < 2 -> market_maker_protection_subscription_record.group[market_maker_protection_subscription_at] = market_maker_protection_subscription_value; market_maker_protection_subscription_at = market_maker_protection_subscription_at + 1
  :: else -> break
  od;
  market_maker_protection_subscription_record.protection_type_advanced_normal = market_maker_protection_subscription_value;
  skip
}

/* each byte of Market Maker Protection Subscription set to where it lies, so a field read out of place says so */
inline ramp_market_maker_protection_subscription(market_maker_protection_subscription_record, market_maker_protection_subscription_base) {
  market_maker_protection_subscription_at = 0;
  do
  :: market_maker_protection_subscription_at < 2 -> market_maker_protection_subscription_record.group[market_maker_protection_subscription_at] = (market_maker_protection_subscription_base + 0 + market_maker_protection_subscription_at + 1) % 256; market_maker_protection_subscription_at = market_maker_protection_subscription_at + 1
  :: else -> break
  od;
  market_maker_protection_subscription_record.protection_type_advanced_normal = (market_maker_protection_subscription_base + 2 + 1) % 256;
  skip
}

/* Market Maker Protection Subscription to the wire, 3 bytes from where the cursor stands */
inline encode_market_maker_protection_subscription(market_maker_protection_subscription_record) {
  market_maker_protection_subscription_at = 0;
  do
  :: market_maker_protection_subscription_at < 2 -> wire[at] = market_maker_protection_subscription_record.group[market_maker_protection_subscription_at]; at = at + 1; market_maker_protection_subscription_at = market_maker_protection_subscription_at + 1
  :: else -> break
  od;
  wire[at] = market_maker_protection_subscription_record.protection_type_advanced_normal; at = at + 1;
  skip
}

/* Market Maker Protection Subscription off the wire, 3 bytes from where the cursor stands */
inline decode_market_maker_protection_subscription(market_maker_protection_subscription_record) {
  market_maker_protection_subscription_at = 0;
  do
  :: market_maker_protection_subscription_at < 2 -> market_maker_protection_subscription_record.group[market_maker_protection_subscription_at] = wire[at]; at = at + 1; market_maker_protection_subscription_at = market_maker_protection_subscription_at + 1
  :: else -> break
  od;
  market_maker_protection_subscription_record.protection_type_advanced_normal = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Maker Protection Subscription is what was written, byte for byte */
inline equal_market_maker_protection_subscription(market_maker_protection_subscription_read, market_maker_protection_subscription_written) {
  market_maker_protection_subscription_at = 0;
  do
  :: market_maker_protection_subscription_at < 2 -> assert(market_maker_protection_subscription_read.group[market_maker_protection_subscription_at] == market_maker_protection_subscription_written.group[market_maker_protection_subscription_at]); market_maker_protection_subscription_at = market_maker_protection_subscription_at + 1
  :: else -> break
  od;
  assert(market_maker_protection_subscription_read.protection_type_advanced_normal == market_maker_protection_subscription_written.protection_type_advanced_normal);
  skip
}

/* ---- Request For Quote: 14 bytes --------------------------------------------- */

typedef RequestForQuote {
  byte group[2];
  byte instrument_optional[4];
  byte quantity_1[8]
};

int request_for_quote_at;

/* every byte of Request For Quote set to one value */
inline fill_request_for_quote(request_for_quote_record, request_for_quote_value) {
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 2 -> request_for_quote_record.group[request_for_quote_at] = request_for_quote_value; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 4 -> request_for_quote_record.instrument_optional[request_for_quote_at] = request_for_quote_value; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 8 -> request_for_quote_record.quantity_1[request_for_quote_at] = request_for_quote_value; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Request For Quote set to where it lies, so a field read out of place says so */
inline ramp_request_for_quote(request_for_quote_record, request_for_quote_base) {
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 2 -> request_for_quote_record.group[request_for_quote_at] = (request_for_quote_base + 0 + request_for_quote_at + 1) % 256; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 4 -> request_for_quote_record.instrument_optional[request_for_quote_at] = (request_for_quote_base + 2 + request_for_quote_at + 1) % 256; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 8 -> request_for_quote_record.quantity_1[request_for_quote_at] = (request_for_quote_base + 6 + request_for_quote_at + 1) % 256; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  skip
}

/* Request For Quote to the wire, 14 bytes from where the cursor stands */
inline encode_request_for_quote(request_for_quote_record) {
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 2 -> wire[at] = request_for_quote_record.group[request_for_quote_at]; at = at + 1; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 4 -> wire[at] = request_for_quote_record.instrument_optional[request_for_quote_at]; at = at + 1; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 8 -> wire[at] = request_for_quote_record.quantity_1[request_for_quote_at]; at = at + 1; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  skip
}

/* Request For Quote off the wire, 14 bytes from where the cursor stands */
inline decode_request_for_quote(request_for_quote_record) {
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 2 -> request_for_quote_record.group[request_for_quote_at] = wire[at]; at = at + 1; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 4 -> request_for_quote_record.instrument_optional[request_for_quote_at] = wire[at]; at = at + 1; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 8 -> request_for_quote_record.quantity_1[request_for_quote_at] = wire[at]; at = at + 1; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Request For Quote is what was written, byte for byte */
inline equal_request_for_quote(request_for_quote_read, request_for_quote_written) {
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 2 -> assert(request_for_quote_read.group[request_for_quote_at] == request_for_quote_written.group[request_for_quote_at]); request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 4 -> assert(request_for_quote_read.instrument_optional[request_for_quote_at] == request_for_quote_written.instrument_optional[request_for_quote_at]); request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 8 -> assert(request_for_quote_read.quantity_1[request_for_quote_at] == request_for_quote_written.quantity_1[request_for_quote_at]); request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancellation: 14 bytes -------------------------------------------- */

typedef OrderCancellation {
  byte group[2];
  byte instrument_optional[4];
  byte cancelled_order_id[8]
};

int order_cancellation_at;

/* every byte of Order Cancellation set to one value */
inline fill_order_cancellation(order_cancellation_record, order_cancellation_value) {
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 2 -> order_cancellation_record.group[order_cancellation_at] = order_cancellation_value; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 4 -> order_cancellation_record.instrument_optional[order_cancellation_at] = order_cancellation_value; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 8 -> order_cancellation_record.cancelled_order_id[order_cancellation_at] = order_cancellation_value; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancellation set to where it lies, so a field read out of place says so */
inline ramp_order_cancellation(order_cancellation_record, order_cancellation_base) {
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 2 -> order_cancellation_record.group[order_cancellation_at] = (order_cancellation_base + 0 + order_cancellation_at + 1) % 256; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 4 -> order_cancellation_record.instrument_optional[order_cancellation_at] = (order_cancellation_base + 2 + order_cancellation_at + 1) % 256; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 8 -> order_cancellation_record.cancelled_order_id[order_cancellation_at] = (order_cancellation_base + 6 + order_cancellation_at + 1) % 256; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation to the wire, 14 bytes from where the cursor stands */
inline encode_order_cancellation(order_cancellation_record) {
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 2 -> wire[at] = order_cancellation_record.group[order_cancellation_at]; at = at + 1; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 4 -> wire[at] = order_cancellation_record.instrument_optional[order_cancellation_at]; at = at + 1; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 8 -> wire[at] = order_cancellation_record.cancelled_order_id[order_cancellation_at]; at = at + 1; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation off the wire, 14 bytes from where the cursor stands */
inline decode_order_cancellation(order_cancellation_record) {
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 2 -> order_cancellation_record.group[order_cancellation_at] = wire[at]; at = at + 1; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 4 -> order_cancellation_record.instrument_optional[order_cancellation_at] = wire[at]; at = at + 1; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 8 -> order_cancellation_record.cancelled_order_id[order_cancellation_at] = wire[at]; at = at + 1; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancellation is what was written, byte for byte */
inline equal_order_cancellation(order_cancellation_read, order_cancellation_written) {
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 2 -> assert(order_cancellation_read.group[order_cancellation_at] == order_cancellation_written.group[order_cancellation_at]); order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 4 -> assert(order_cancellation_read.instrument_optional[order_cancellation_at] == order_cancellation_written.instrument_optional[order_cancellation_at]); order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 8 -> assert(order_cancellation_read.cancelled_order_id[order_cancellation_at] == order_cancellation_written.cancelled_order_id[order_cancellation_at]); order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Improvement Order Cancellation: 14 bytes -------------------------------- */

/* Stated by the guide as having the same number of bytes and format as XE, whose fields are written out here. */
typedef ImprovementOrderCancellation {
  byte group[2];
  byte instrument_optional[4];
  byte cancelled_order_id[8]
};

int improvement_order_cancellation_at;

/* every byte of Improvement Order Cancellation set to one value */
inline fill_improvement_order_cancellation(improvement_order_cancellation_record, improvement_order_cancellation_value) {
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 2 -> improvement_order_cancellation_record.group[improvement_order_cancellation_at] = improvement_order_cancellation_value; improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 4 -> improvement_order_cancellation_record.instrument_optional[improvement_order_cancellation_at] = improvement_order_cancellation_value; improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 8 -> improvement_order_cancellation_record.cancelled_order_id[improvement_order_cancellation_at] = improvement_order_cancellation_value; improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Improvement Order Cancellation set to where it lies, so a field read out of place says so */
inline ramp_improvement_order_cancellation(improvement_order_cancellation_record, improvement_order_cancellation_base) {
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 2 -> improvement_order_cancellation_record.group[improvement_order_cancellation_at] = (improvement_order_cancellation_base + 0 + improvement_order_cancellation_at + 1) % 256; improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 4 -> improvement_order_cancellation_record.instrument_optional[improvement_order_cancellation_at] = (improvement_order_cancellation_base + 2 + improvement_order_cancellation_at + 1) % 256; improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 8 -> improvement_order_cancellation_record.cancelled_order_id[improvement_order_cancellation_at] = (improvement_order_cancellation_base + 6 + improvement_order_cancellation_at + 1) % 256; improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* Improvement Order Cancellation to the wire, 14 bytes from where the cursor stands */
inline encode_improvement_order_cancellation(improvement_order_cancellation_record) {
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 2 -> wire[at] = improvement_order_cancellation_record.group[improvement_order_cancellation_at]; at = at + 1; improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 4 -> wire[at] = improvement_order_cancellation_record.instrument_optional[improvement_order_cancellation_at]; at = at + 1; improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 8 -> wire[at] = improvement_order_cancellation_record.cancelled_order_id[improvement_order_cancellation_at]; at = at + 1; improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* Improvement Order Cancellation off the wire, 14 bytes from where the cursor stands */
inline decode_improvement_order_cancellation(improvement_order_cancellation_record) {
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 2 -> improvement_order_cancellation_record.group[improvement_order_cancellation_at] = wire[at]; at = at + 1; improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 4 -> improvement_order_cancellation_record.instrument_optional[improvement_order_cancellation_at] = wire[at]; at = at + 1; improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 8 -> improvement_order_cancellation_record.cancelled_order_id[improvement_order_cancellation_at] = wire[at]; at = at + 1; improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Improvement Order Cancellation is what was written, byte for byte */
inline equal_improvement_order_cancellation(improvement_order_cancellation_read, improvement_order_cancellation_written) {
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 2 -> assert(improvement_order_cancellation_read.group[improvement_order_cancellation_at] == improvement_order_cancellation_written.group[improvement_order_cancellation_at]); improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 4 -> assert(improvement_order_cancellation_read.instrument_optional[improvement_order_cancellation_at] == improvement_order_cancellation_written.instrument_optional[improvement_order_cancellation_at]); improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  improvement_order_cancellation_at = 0;
  do
  :: improvement_order_cancellation_at < 8 -> assert(improvement_order_cancellation_read.cancelled_order_id[improvement_order_cancellation_at] == improvement_order_cancellation_written.cancelled_order_id[improvement_order_cancellation_at]); improvement_order_cancellation_at = improvement_order_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Incoming Header: encoded, read back, and compared */
proctype check_incoming_header() {
  IncomingHeader incoming_header_sent;
  IncomingHeader incoming_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_incoming_header(incoming_header_sent, 0)
  :: pattern == 1 -> fill_incoming_header(incoming_header_sent, 32)
  :: pattern == 2 -> fill_incoming_header(incoming_header_sent, 255)
  :: else -> ramp_incoming_header(incoming_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_incoming_header(incoming_header_sent);
    assert(at == 24);
    at = 0;
    decode_incoming_header(incoming_header_got);
    assert(at == 24);
    equal_incoming_header(incoming_header_got, incoming_header_sent)
  }
}

/* User Disconnection: encoded, read back, and compared */
proctype check_user_disconnection() {
  UserDisconnection user_disconnection_sent;
  UserDisconnection user_disconnection_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_disconnection(user_disconnection_sent, 0)
  :: pattern == 1 -> fill_user_disconnection(user_disconnection_sent, 32)
  :: pattern == 2 -> fill_user_disconnection(user_disconnection_sent, 255)
  :: else -> ramp_user_disconnection(user_disconnection_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_disconnection(user_disconnection_sent);
    assert(at == 12);
    at = 0;
    decode_user_disconnection(user_disconnection_got);
    assert(at == 12);
    equal_user_disconnection(user_disconnection_got, user_disconnection_sent)
  }
}

/* Heartbeat Response: encoded, read back, and compared */
proctype check_heartbeat_response() {
  HeartbeatResponse heartbeat_response_sent;
  HeartbeatResponse heartbeat_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_heartbeat_response(heartbeat_response_sent, 0)
  :: pattern == 1 -> fill_heartbeat_response(heartbeat_response_sent, 32)
  :: pattern == 2 -> fill_heartbeat_response(heartbeat_response_sent, 255)
  :: else -> ramp_heartbeat_response(heartbeat_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_heartbeat_response(heartbeat_response_sent);
    assert(at == 20);
    at = 0;
    decode_heartbeat_response(heartbeat_response_got);
    assert(at == 20);
    equal_heartbeat_response(heartbeat_response_got, heartbeat_response_sent)
  }
}

/* Clearing Data: encoded, read back, and compared */
proctype check_clearing_data() {
  ClearingData clearing_data_sent;
  ClearingData clearing_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clearing_data(clearing_data_sent, 0)
  :: pattern == 1 -> fill_clearing_data(clearing_data_sent, 32)
  :: pattern == 2 -> fill_clearing_data(clearing_data_sent, 255)
  :: else -> ramp_clearing_data(clearing_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clearing_data(clearing_data_sent);
    assert(at == 20);
    at = 0;
    decode_clearing_data(clearing_data_got);
    assert(at == 20);
    equal_clearing_data(clearing_data_got, clearing_data_sent)
  }
}

/* Owner Data: encoded, read back, and compared */
proctype check_owner_data() {
  OwnerData owner_data_sent;
  OwnerData owner_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_owner_data(owner_data_sent, 0)
  :: pattern == 1 -> fill_owner_data(owner_data_sent, 32)
  :: pattern == 2 -> fill_owner_data(owner_data_sent, 255)
  :: else -> ramp_owner_data(owner_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_owner_data(owner_data_sent);
    assert(at == 71);
    at = 0;
    decode_owner_data(owner_data_got);
    assert(at == 71);
    equal_owner_data(owner_data_got, owner_data_sent)
  }
}

/* Bulk Quote Data: encoded, read back, and compared */
proctype check_bulk_quote_data() {
  BulkQuoteData bulk_quote_data_sent;
  BulkQuoteData bulk_quote_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bulk_quote_data(bulk_quote_data_sent, 0)
  :: pattern == 1 -> fill_bulk_quote_data(bulk_quote_data_sent, 32)
  :: pattern == 2 -> fill_bulk_quote_data(bulk_quote_data_sent, 255)
  :: else -> ramp_bulk_quote_data(bulk_quote_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bulk_quote_data(bulk_quote_data_sent);
    assert(at == 203);
    at = 0;
    decode_bulk_quote_data(bulk_quote_data_got);
    assert(at == 203);
    equal_bulk_quote_data(bulk_quote_data_got, bulk_quote_data_sent)
  }
}

/* Global Cancellation: encoded, read back, and compared */
proctype check_global_cancellation() {
  GlobalCancellation global_cancellation_sent;
  GlobalCancellation global_cancellation_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_global_cancellation(global_cancellation_sent, 0)
  :: pattern == 1 -> fill_global_cancellation(global_cancellation_sent, 32)
  :: pattern == 2 -> fill_global_cancellation(global_cancellation_sent, 255)
  :: else -> ramp_global_cancellation(global_cancellation_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_global_cancellation(global_cancellation_sent);
    assert(at == 11);
    at = 0;
    decode_global_cancellation(global_cancellation_got);
    assert(at == 11);
    equal_global_cancellation(global_cancellation_got, global_cancellation_sent)
  }
}

/* User Global Cancellation: encoded, read back, and compared */
proctype check_user_global_cancellation() {
  UserGlobalCancellation user_global_cancellation_sent;
  UserGlobalCancellation user_global_cancellation_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_global_cancellation(user_global_cancellation_sent, 0)
  :: pattern == 1 -> fill_user_global_cancellation(user_global_cancellation_sent, 32)
  :: pattern == 2 -> fill_user_global_cancellation(user_global_cancellation_sent, 255)
  :: else -> ramp_user_global_cancellation(user_global_cancellation_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_global_cancellation(user_global_cancellation_sent);
    assert(at == 23);
    at = 0;
    decode_user_global_cancellation(user_global_cancellation_got);
    assert(at == 23);
    equal_user_global_cancellation(user_global_cancellation_got, user_global_cancellation_sent)
  }
}

/* Directed Routed Order Rejection And Quote: encoded, read back, and compared */
proctype check_directed_routed_order_rejection_and_quote() {
  DirectedRoutedOrderRejectionAndQuote directed_routed_order_rejection_and_quote_sent;
  DirectedRoutedOrderRejectionAndQuote directed_routed_order_rejection_and_quote_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_directed_routed_order_rejection_and_quote(directed_routed_order_rejection_and_quote_sent, 0)
  :: pattern == 1 -> fill_directed_routed_order_rejection_and_quote(directed_routed_order_rejection_and_quote_sent, 32)
  :: pattern == 2 -> fill_directed_routed_order_rejection_and_quote(directed_routed_order_rejection_and_quote_sent, 255)
  :: else -> ramp_directed_routed_order_rejection_and_quote(directed_routed_order_rejection_and_quote_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_directed_routed_order_rejection_and_quote(directed_routed_order_rejection_and_quote_sent);
    assert(at == 44);
    at = 0;
    decode_directed_routed_order_rejection_and_quote(directed_routed_order_rejection_and_quote_got);
    assert(at == 44);
    equal_directed_routed_order_rejection_and_quote(directed_routed_order_rejection_and_quote_got, directed_routed_order_rejection_and_quote_sent)
  }
}

/* Buying Clearing Data: encoded, read back, and compared */
proctype check_buying_clearing_data() {
  BuyingClearingData buying_clearing_data_sent;
  BuyingClearingData buying_clearing_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_buying_clearing_data(buying_clearing_data_sent, 0)
  :: pattern == 1 -> fill_buying_clearing_data(buying_clearing_data_sent, 32)
  :: pattern == 2 -> fill_buying_clearing_data(buying_clearing_data_sent, 255)
  :: else -> ramp_buying_clearing_data(buying_clearing_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_buying_clearing_data(buying_clearing_data_sent);
    assert(at == 20);
    at = 0;
    decode_buying_clearing_data(buying_clearing_data_got);
    assert(at == 20);
    equal_buying_clearing_data(buying_clearing_data_got, buying_clearing_data_sent)
  }
}

/* Selling Clearing Data: encoded, read back, and compared */
proctype check_selling_clearing_data() {
  SellingClearingData selling_clearing_data_sent;
  SellingClearingData selling_clearing_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_selling_clearing_data(selling_clearing_data_sent, 0)
  :: pattern == 1 -> fill_selling_clearing_data(selling_clearing_data_sent, 32)
  :: pattern == 2 -> fill_selling_clearing_data(selling_clearing_data_sent, 255)
  :: else -> ramp_selling_clearing_data(selling_clearing_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_selling_clearing_data(selling_clearing_data_sent);
    assert(at == 20);
    at = 0;
    decode_selling_clearing_data(selling_clearing_data_got);
    assert(at == 20);
    equal_selling_clearing_data(selling_clearing_data_got, selling_clearing_data_sent)
  }
}

/* Buying Owner Data: encoded, read back, and compared */
proctype check_buying_owner_data() {
  BuyingOwnerData buying_owner_data_sent;
  BuyingOwnerData buying_owner_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_buying_owner_data(buying_owner_data_sent, 0)
  :: pattern == 1 -> fill_buying_owner_data(buying_owner_data_sent, 32)
  :: pattern == 2 -> fill_buying_owner_data(buying_owner_data_sent, 255)
  :: else -> ramp_buying_owner_data(buying_owner_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_buying_owner_data(buying_owner_data_sent);
    assert(at == 71);
    at = 0;
    decode_buying_owner_data(buying_owner_data_got);
    assert(at == 71);
    equal_buying_owner_data(buying_owner_data_got, buying_owner_data_sent)
  }
}

/* Selling Owner Data: encoded, read back, and compared */
proctype check_selling_owner_data() {
  SellingOwnerData selling_owner_data_sent;
  SellingOwnerData selling_owner_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_selling_owner_data(selling_owner_data_sent, 0)
  :: pattern == 1 -> fill_selling_owner_data(selling_owner_data_sent, 32)
  :: pattern == 2 -> fill_selling_owner_data(selling_owner_data_sent, 255)
  :: else -> ramp_selling_owner_data(selling_owner_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_selling_owner_data(selling_owner_data_sent);
    assert(at == 71);
    at = 0;
    decode_selling_owner_data(selling_owner_data_got);
    assert(at == 71);
    equal_selling_owner_data(selling_owner_data_got, selling_owner_data_sent)
  }
}

/* Auction Entry: encoded, read back, and compared */
proctype check_auction_entry() {
  AuctionEntry auction_entry_sent;
  AuctionEntry auction_entry_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_entry(auction_entry_sent, 0)
  :: pattern == 1 -> fill_auction_entry(auction_entry_sent, 32)
  :: pattern == 2 -> fill_auction_entry(auction_entry_sent, 255)
  :: else -> ramp_auction_entry(auction_entry_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_entry(auction_entry_sent);
    assert(at == 364);
    at = 0;
    decode_auction_entry(auction_entry_got);
    assert(at == 364);
    equal_auction_entry(auction_entry_got, auction_entry_sent)
  }
}

/* Clearing Data Dealer: encoded, read back, and compared */
proctype check_clearing_data_dealer() {
  ClearingDataDealer clearing_data_dealer_sent;
  ClearingDataDealer clearing_data_dealer_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clearing_data_dealer(clearing_data_dealer_sent, 0)
  :: pattern == 1 -> fill_clearing_data_dealer(clearing_data_dealer_sent, 32)
  :: pattern == 2 -> fill_clearing_data_dealer(clearing_data_dealer_sent, 255)
  :: else -> ramp_clearing_data_dealer(clearing_data_dealer_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clearing_data_dealer(clearing_data_dealer_sent);
    assert(at == 20);
    at = 0;
    decode_clearing_data_dealer(clearing_data_dealer_got);
    assert(at == 20);
    equal_clearing_data_dealer(clearing_data_dealer_got, clearing_data_dealer_sent)
  }
}

/* Owner Data Dealer: encoded, read back, and compared */
proctype check_owner_data_dealer() {
  OwnerDataDealer owner_data_dealer_sent;
  OwnerDataDealer owner_data_dealer_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_owner_data_dealer(owner_data_dealer_sent, 0)
  :: pattern == 1 -> fill_owner_data_dealer(owner_data_dealer_sent, 32)
  :: pattern == 2 -> fill_owner_data_dealer(owner_data_dealer_sent, 255)
  :: else -> ramp_owner_data_dealer(owner_data_dealer_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_owner_data_dealer(owner_data_dealer_sent);
    assert(at == 71);
    at = 0;
    decode_owner_data_dealer(owner_data_dealer_got);
    assert(at == 71);
    equal_owner_data_dealer(owner_data_dealer_got, owner_data_dealer_sent)
  }
}

/* Directed Order Acceptation: encoded, read back, and compared */
proctype check_directed_order_acceptation() {
  DirectedOrderAcceptation directed_order_acceptation_sent;
  DirectedOrderAcceptation directed_order_acceptation_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_directed_order_acceptation(directed_order_acceptation_sent, 0)
  :: pattern == 1 -> fill_directed_order_acceptation(directed_order_acceptation_sent, 32)
  :: pattern == 2 -> fill_directed_order_acceptation(directed_order_acceptation_sent, 255)
  :: else -> ramp_directed_order_acceptation(directed_order_acceptation_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_directed_order_acceptation(directed_order_acceptation_sent);
    assert(at == 200);
    at = 0;
    decode_directed_order_acceptation(directed_order_acceptation_got);
    assert(at == 200);
    equal_directed_order_acceptation(directed_order_acceptation_got, directed_order_acceptation_sent)
  }
}

/* Order Entry: encoded, read back, and compared */
proctype check_order_entry() {
  OrderEntry order_entry_sent;
  OrderEntry order_entry_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_entry(order_entry_sent, 0)
  :: pattern == 1 -> fill_order_entry(order_entry_sent, 32)
  :: pattern == 2 -> fill_order_entry(order_entry_sent, 255)
  :: else -> ramp_order_entry(order_entry_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_entry(order_entry_sent);
    assert(at == 221);
    at = 0;
    decode_order_entry(order_entry_got);
    assert(at == 221);
    equal_order_entry(order_entry_got, order_entry_sent)
  }
}

/* Improvement Order Entry: encoded, read back, and compared */
proctype check_improvement_order_entry() {
  ImprovementOrderEntry improvement_order_entry_sent;
  ImprovementOrderEntry improvement_order_entry_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_improvement_order_entry(improvement_order_entry_sent, 0)
  :: pattern == 1 -> fill_improvement_order_entry(improvement_order_entry_sent, 32)
  :: pattern == 2 -> fill_improvement_order_entry(improvement_order_entry_sent, 255)
  :: else -> ramp_improvement_order_entry(improvement_order_entry_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_improvement_order_entry(improvement_order_entry_sent);
    assert(at == 210);
    at = 0;
    decode_improvement_order_entry(improvement_order_entry_got);
    assert(at == 210);
    equal_improvement_order_entry(improvement_order_entry_got, improvement_order_entry_sent)
  }
}

/* Order Modification: encoded, read back, and compared */
proctype check_order_modification() {
  OrderModification order_modification_sent;
  OrderModification order_modification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modification(order_modification_sent, 0)
  :: pattern == 1 -> fill_order_modification(order_modification_sent, 32)
  :: pattern == 2 -> fill_order_modification(order_modification_sent, 255)
  :: else -> ramp_order_modification(order_modification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modification(order_modification_sent);
    assert(at == 230);
    at = 0;
    decode_order_modification(order_modification_got);
    assert(at == 230);
    equal_order_modification(order_modification_got, order_modification_sent)
  }
}

/* Market Maker Protection Subscription: encoded, read back, and compared */
proctype check_market_maker_protection_subscription() {
  MarketMakerProtectionSubscription market_maker_protection_subscription_sent;
  MarketMakerProtectionSubscription market_maker_protection_subscription_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_maker_protection_subscription(market_maker_protection_subscription_sent, 0)
  :: pattern == 1 -> fill_market_maker_protection_subscription(market_maker_protection_subscription_sent, 32)
  :: pattern == 2 -> fill_market_maker_protection_subscription(market_maker_protection_subscription_sent, 255)
  :: else -> ramp_market_maker_protection_subscription(market_maker_protection_subscription_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_maker_protection_subscription(market_maker_protection_subscription_sent);
    assert(at == 3);
    at = 0;
    decode_market_maker_protection_subscription(market_maker_protection_subscription_got);
    assert(at == 3);
    equal_market_maker_protection_subscription(market_maker_protection_subscription_got, market_maker_protection_subscription_sent)
  }
}

/* Request For Quote: encoded, read back, and compared */
proctype check_request_for_quote() {
  RequestForQuote request_for_quote_sent;
  RequestForQuote request_for_quote_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_for_quote(request_for_quote_sent, 0)
  :: pattern == 1 -> fill_request_for_quote(request_for_quote_sent, 32)
  :: pattern == 2 -> fill_request_for_quote(request_for_quote_sent, 255)
  :: else -> ramp_request_for_quote(request_for_quote_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_for_quote(request_for_quote_sent);
    assert(at == 14);
    at = 0;
    decode_request_for_quote(request_for_quote_got);
    assert(at == 14);
    equal_request_for_quote(request_for_quote_got, request_for_quote_sent)
  }
}

/* Order Cancellation: encoded, read back, and compared */
proctype check_order_cancellation() {
  OrderCancellation order_cancellation_sent;
  OrderCancellation order_cancellation_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancellation(order_cancellation_sent, 0)
  :: pattern == 1 -> fill_order_cancellation(order_cancellation_sent, 32)
  :: pattern == 2 -> fill_order_cancellation(order_cancellation_sent, 255)
  :: else -> ramp_order_cancellation(order_cancellation_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancellation(order_cancellation_sent);
    assert(at == 14);
    at = 0;
    decode_order_cancellation(order_cancellation_got);
    assert(at == 14);
    equal_order_cancellation(order_cancellation_got, order_cancellation_sent)
  }
}

/* Improvement Order Cancellation: encoded, read back, and compared */
proctype check_improvement_order_cancellation() {
  ImprovementOrderCancellation improvement_order_cancellation_sent;
  ImprovementOrderCancellation improvement_order_cancellation_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_improvement_order_cancellation(improvement_order_cancellation_sent, 0)
  :: pattern == 1 -> fill_improvement_order_cancellation(improvement_order_cancellation_sent, 32)
  :: pattern == 2 -> fill_improvement_order_cancellation(improvement_order_cancellation_sent, 255)
  :: else -> ramp_improvement_order_cancellation(improvement_order_cancellation_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_improvement_order_cancellation(improvement_order_cancellation_sent);
    assert(at == 14);
    at = 0;
    decode_improvement_order_cancellation(improvement_order_cancellation_got);
    assert(at == 14);
    equal_improvement_order_cancellation(improvement_order_cancellation_got, improvement_order_cancellation_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_incoming_header()
  :: run check_user_disconnection()
  :: run check_heartbeat_response()
  :: run check_clearing_data()
  :: run check_owner_data()
  :: run check_bulk_quote_data()
  :: run check_global_cancellation()
  :: run check_user_global_cancellation()
  :: run check_directed_routed_order_rejection_and_quote()
  :: run check_buying_clearing_data()
  :: run check_selling_clearing_data()
  :: run check_buying_owner_data()
  :: run check_selling_owner_data()
  :: run check_auction_entry()
  :: run check_clearing_data_dealer()
  :: run check_owner_data_dealer()
  :: run check_directed_order_acceptation()
  :: run check_order_entry()
  :: run check_improvement_order_entry()
  :: run check_order_modification()
  :: run check_market_maker_protection_subscription()
  :: run check_request_for_quote()
  :: run check_order_cancellation()
  :: run check_improvement_order_cancellation()
  fi
}
