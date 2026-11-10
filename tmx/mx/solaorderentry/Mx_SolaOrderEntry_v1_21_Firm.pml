/*
 * TMX Group Sola Order Entry
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
#define WIRE 207

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Heartbeat Response: 20 bytes -------------------------------------------- */

typedef HeartbeatResponse {
  byte user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[8];
  byte last_exchange_message_id_sent_to_participant[6];
  byte user_message_timestamp_local_hhmmss[6]
};

int heartbeat_response_at;

/* every byte of Heartbeat Response set to one value */
inline fill_heartbeat_response(heartbeat_response_record, heartbeat_response_value) {
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 8 -> heartbeat_response_record.user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[heartbeat_response_at] = heartbeat_response_value; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> heartbeat_response_record.last_exchange_message_id_sent_to_participant[heartbeat_response_at] = heartbeat_response_value; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> heartbeat_response_record.user_message_timestamp_local_hhmmss[heartbeat_response_at] = heartbeat_response_value; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Response set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_response(heartbeat_response_record, heartbeat_response_base) {
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 8 -> heartbeat_response_record.user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[heartbeat_response_at] = (heartbeat_response_base + 0 + heartbeat_response_at + 1) % 256; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> heartbeat_response_record.last_exchange_message_id_sent_to_participant[heartbeat_response_at] = (heartbeat_response_base + 8 + heartbeat_response_at + 1) % 256; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> heartbeat_response_record.user_message_timestamp_local_hhmmss[heartbeat_response_at] = (heartbeat_response_base + 14 + heartbeat_response_at + 1) % 256; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Response to the wire, 20 bytes from where the cursor stands */
inline encode_heartbeat_response(heartbeat_response_record) {
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 8 -> wire[at] = heartbeat_response_record.user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[heartbeat_response_at]; at = at + 1; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> wire[at] = heartbeat_response_record.last_exchange_message_id_sent_to_participant[heartbeat_response_at]; at = at + 1; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> wire[at] = heartbeat_response_record.user_message_timestamp_local_hhmmss[heartbeat_response_at]; at = at + 1; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Response off the wire, 20 bytes from where the cursor stands */
inline decode_heartbeat_response(heartbeat_response_record) {
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 8 -> heartbeat_response_record.user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[heartbeat_response_at] = wire[at]; at = at + 1; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> heartbeat_response_record.last_exchange_message_id_sent_to_participant[heartbeat_response_at] = wire[at]; at = at + 1; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> heartbeat_response_record.user_message_timestamp_local_hhmmss[heartbeat_response_at] = wire[at]; at = at + 1; heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Response is what was written, byte for byte */
inline equal_heartbeat_response(heartbeat_response_read, heartbeat_response_written) {
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 8 -> assert(heartbeat_response_read.user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[heartbeat_response_at] == heartbeat_response_written.user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[heartbeat_response_at]); heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> assert(heartbeat_response_read.last_exchange_message_id_sent_to_participant[heartbeat_response_at] == heartbeat_response_written.last_exchange_message_id_sent_to_participant[heartbeat_response_at]); heartbeat_response_at = heartbeat_response_at + 1
  :: else -> break
  od;
  heartbeat_response_at = 0;
  do
  :: heartbeat_response_at < 6 -> assert(heartbeat_response_read.user_message_timestamp_local_hhmmss[heartbeat_response_at] == heartbeat_response_written.user_message_timestamp_local_hhmmss[heartbeat_response_at]); heartbeat_response_at = heartbeat_response_at + 1
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

/* ---- Incoming Messages Header: 22 bytes -------------------------------------- */

/* The guide states these fields once, as the Incoming Messages Header, for every business message a Participant sends. Message Type is read by the packet before the branch, so it is not repeated here. */
typedef IncomingMessagesHeader {
  byte user_timestamp_local_hhmmss[6];
  byte trader_id[8];
  byte user_sequence_id[8]
};

int incoming_messages_header_at;

/* every byte of Incoming Messages Header set to one value */
inline fill_incoming_messages_header(incoming_messages_header_record, incoming_messages_header_value) {
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 6 -> incoming_messages_header_record.user_timestamp_local_hhmmss[incoming_messages_header_at] = incoming_messages_header_value; incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 8 -> incoming_messages_header_record.trader_id[incoming_messages_header_at] = incoming_messages_header_value; incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 8 -> incoming_messages_header_record.user_sequence_id[incoming_messages_header_at] = incoming_messages_header_value; incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Incoming Messages Header set to where it lies, so a field read out of place says so */
inline ramp_incoming_messages_header(incoming_messages_header_record, incoming_messages_header_base) {
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 6 -> incoming_messages_header_record.user_timestamp_local_hhmmss[incoming_messages_header_at] = (incoming_messages_header_base + 0 + incoming_messages_header_at + 1) % 256; incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 8 -> incoming_messages_header_record.trader_id[incoming_messages_header_at] = (incoming_messages_header_base + 6 + incoming_messages_header_at + 1) % 256; incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 8 -> incoming_messages_header_record.user_sequence_id[incoming_messages_header_at] = (incoming_messages_header_base + 14 + incoming_messages_header_at + 1) % 256; incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  skip
}

/* Incoming Messages Header to the wire, 22 bytes from where the cursor stands */
inline encode_incoming_messages_header(incoming_messages_header_record) {
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 6 -> wire[at] = incoming_messages_header_record.user_timestamp_local_hhmmss[incoming_messages_header_at]; at = at + 1; incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 8 -> wire[at] = incoming_messages_header_record.trader_id[incoming_messages_header_at]; at = at + 1; incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 8 -> wire[at] = incoming_messages_header_record.user_sequence_id[incoming_messages_header_at]; at = at + 1; incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  skip
}

/* Incoming Messages Header off the wire, 22 bytes from where the cursor stands */
inline decode_incoming_messages_header(incoming_messages_header_record) {
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 6 -> incoming_messages_header_record.user_timestamp_local_hhmmss[incoming_messages_header_at] = wire[at]; at = at + 1; incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 8 -> incoming_messages_header_record.trader_id[incoming_messages_header_at] = wire[at]; at = at + 1; incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 8 -> incoming_messages_header_record.user_sequence_id[incoming_messages_header_at] = wire[at]; at = at + 1; incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Incoming Messages Header is what was written, byte for byte */
inline equal_incoming_messages_header(incoming_messages_header_read, incoming_messages_header_written) {
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 6 -> assert(incoming_messages_header_read.user_timestamp_local_hhmmss[incoming_messages_header_at] == incoming_messages_header_written.user_timestamp_local_hhmmss[incoming_messages_header_at]); incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 8 -> assert(incoming_messages_header_read.trader_id[incoming_messages_header_at] == incoming_messages_header_written.trader_id[incoming_messages_header_at]); incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  incoming_messages_header_at = 0;
  do
  :: incoming_messages_header_at < 8 -> assert(incoming_messages_header_read.user_sequence_id[incoming_messages_header_at] == incoming_messages_header_written.user_sequence_id[incoming_messages_header_at]); incoming_messages_header_at = incoming_messages_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Request: 22 bytes ------------------------------------------------- */

typedef OrderRequest {
  IncomingMessagesHeader incoming_messages_header
};

/* every byte of Order Request set to one value */
inline fill_order_request(order_request_record, order_request_value) {
  fill_incoming_messages_header(order_request_record.incoming_messages_header, order_request_value);
  skip
}

/* each byte of Order Request set to where it lies, so a field read out of place says so */
inline ramp_order_request(order_request_record, order_request_base) {
  ramp_incoming_messages_header(order_request_record.incoming_messages_header, order_request_base + 0);
  skip
}

/* Order Request to the wire, 22 bytes from where the cursor stands */
inline encode_order_request(order_request_record) {
  encode_incoming_messages_header(order_request_record.incoming_messages_header);
  skip
}

/* Order Request off the wire, 22 bytes from where the cursor stands */
inline decode_order_request(order_request_record) {
  decode_incoming_messages_header(order_request_record.incoming_messages_header);
  skip
}

/* what was read of Order Request is what was written, byte for byte */
inline equal_order_request(order_request_read, order_request_written) {
  equal_incoming_messages_header(order_request_read.incoming_messages_header, order_request_written.incoming_messages_header);
  skip
}

/* ---- Clearing Data: 20 bytes ------------------------------------------------- */

/* The guide states these fields once, as Clearing Data, for every message that carries them. */
typedef ClearingData {
  byte clearing_instruction[12];
  byte account_type;
  byte open_close;
  byte hedge_spec;
  byte filler_5[5]
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
  clearing_data_at = 0;
  do
  :: clearing_data_at < 5 -> clearing_data_record.filler_5[clearing_data_at] = clearing_data_value; clearing_data_at = clearing_data_at + 1
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
  clearing_data_at = 0;
  do
  :: clearing_data_at < 5 -> clearing_data_record.filler_5[clearing_data_at] = (clearing_data_base + 15 + clearing_data_at + 1) % 256; clearing_data_at = clearing_data_at + 1
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
  clearing_data_at = 0;
  do
  :: clearing_data_at < 5 -> wire[at] = clearing_data_record.filler_5[clearing_data_at]; at = at + 1; clearing_data_at = clearing_data_at + 1
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
  clearing_data_at = 0;
  do
  :: clearing_data_at < 5 -> clearing_data_record.filler_5[clearing_data_at] = wire[at]; at = at + 1; clearing_data_at = clearing_data_at + 1
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
  clearing_data_at = 0;
  do
  :: clearing_data_at < 5 -> assert(clearing_data_read.filler_5[clearing_data_at] == clearing_data_written.filler_5[clearing_data_at]); clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Owner Data: 50 bytes ---------------------------------------------------- */

/* The guide states this field once, as Owner Data, for every message that carries it. */
typedef OwnerData {
  byte memo[50]
};

int owner_data_at;

/* every byte of Owner Data set to one value */
inline fill_owner_data(owner_data_record, owner_data_value) {
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
  :: owner_data_at < 50 -> owner_data_record.memo[owner_data_at] = (owner_data_base + 0 + owner_data_at + 1) % 256; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Owner Data to the wire, 50 bytes from where the cursor stands */
inline encode_owner_data(owner_data_record) {
  owner_data_at = 0;
  do
  :: owner_data_at < 50 -> wire[at] = owner_data_record.memo[owner_data_at]; at = at + 1; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Owner Data off the wire, 50 bytes from where the cursor stands */
inline decode_owner_data(owner_data_record) {
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
  :: owner_data_at < 50 -> assert(owner_data_read.memo[owner_data_at] == owner_data_written.memo[owner_data_at]); owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bulk Quote Data: 174 bytes ---------------------------------------------- */

typedef BulkQuoteData {
  IncomingMessagesHeader incoming_messages_header;
  byte group[2];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte maximum_number_trades[2];
  byte minimum_volume[8];
  byte filler_2[2];
  byte calculation_time_interval[8];
  byte maximum_total_volume[8];
  byte maximum_total_value[8];
  byte delta_maximum_volume[8];
  byte delta_maximum_value[8];
  byte anti_wash_id[8];
  byte filler_20[20]
};

int bulk_quote_data_at;

/* every byte of Bulk Quote Data set to one value */
inline fill_bulk_quote_data(bulk_quote_data_record, bulk_quote_data_value) {
  fill_incoming_messages_header(bulk_quote_data_record.incoming_messages_header, bulk_quote_data_value);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.group[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  fill_clearing_data(bulk_quote_data_record.clearing_data, bulk_quote_data_value);
  fill_owner_data(bulk_quote_data_record.owner_data, bulk_quote_data_value);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.maximum_number_trades[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.minimum_volume[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.filler_2[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
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
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.delta_maximum_volume[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.delta_maximum_value[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.anti_wash_id[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 20 -> bulk_quote_data_record.filler_20[bulk_quote_data_at] = bulk_quote_data_value; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bulk Quote Data set to where it lies, so a field read out of place says so */
inline ramp_bulk_quote_data(bulk_quote_data_record, bulk_quote_data_base) {
  ramp_incoming_messages_header(bulk_quote_data_record.incoming_messages_header, bulk_quote_data_base + 0);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.group[bulk_quote_data_at] = (bulk_quote_data_base + 22 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  ramp_clearing_data(bulk_quote_data_record.clearing_data, bulk_quote_data_base + 24);
  ramp_owner_data(bulk_quote_data_record.owner_data, bulk_quote_data_base + 44);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.maximum_number_trades[bulk_quote_data_at] = (bulk_quote_data_base + 94 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.minimum_volume[bulk_quote_data_at] = (bulk_quote_data_base + 96 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.filler_2[bulk_quote_data_at] = (bulk_quote_data_base + 104 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.calculation_time_interval[bulk_quote_data_at] = (bulk_quote_data_base + 106 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_total_volume[bulk_quote_data_at] = (bulk_quote_data_base + 114 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.maximum_total_value[bulk_quote_data_at] = (bulk_quote_data_base + 122 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.delta_maximum_volume[bulk_quote_data_at] = (bulk_quote_data_base + 130 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.delta_maximum_value[bulk_quote_data_at] = (bulk_quote_data_base + 138 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.anti_wash_id[bulk_quote_data_at] = (bulk_quote_data_base + 146 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 20 -> bulk_quote_data_record.filler_20[bulk_quote_data_at] = (bulk_quote_data_base + 154 + bulk_quote_data_at + 1) % 256; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  skip
}

/* Bulk Quote Data to the wire, 174 bytes from where the cursor stands */
inline encode_bulk_quote_data(bulk_quote_data_record) {
  encode_incoming_messages_header(bulk_quote_data_record.incoming_messages_header);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> wire[at] = bulk_quote_data_record.group[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  encode_clearing_data(bulk_quote_data_record.clearing_data);
  encode_owner_data(bulk_quote_data_record.owner_data);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> wire[at] = bulk_quote_data_record.maximum_number_trades[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> wire[at] = bulk_quote_data_record.minimum_volume[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> wire[at] = bulk_quote_data_record.filler_2[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
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
  :: bulk_quote_data_at < 8 -> wire[at] = bulk_quote_data_record.delta_maximum_volume[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> wire[at] = bulk_quote_data_record.delta_maximum_value[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> wire[at] = bulk_quote_data_record.anti_wash_id[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 20 -> wire[at] = bulk_quote_data_record.filler_20[bulk_quote_data_at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  skip
}

/* Bulk Quote Data off the wire, 174 bytes from where the cursor stands */
inline decode_bulk_quote_data(bulk_quote_data_record) {
  decode_incoming_messages_header(bulk_quote_data_record.incoming_messages_header);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.group[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  decode_clearing_data(bulk_quote_data_record.clearing_data);
  decode_owner_data(bulk_quote_data_record.owner_data);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.maximum_number_trades[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.minimum_volume[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> bulk_quote_data_record.filler_2[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
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
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.delta_maximum_volume[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.delta_maximum_value[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> bulk_quote_data_record.anti_wash_id[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 20 -> bulk_quote_data_record.filler_20[bulk_quote_data_at] = wire[at]; at = at + 1; bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bulk Quote Data is what was written, byte for byte */
inline equal_bulk_quote_data(bulk_quote_data_read, bulk_quote_data_written) {
  equal_incoming_messages_header(bulk_quote_data_read.incoming_messages_header, bulk_quote_data_written.incoming_messages_header);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> assert(bulk_quote_data_read.group[bulk_quote_data_at] == bulk_quote_data_written.group[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  equal_clearing_data(bulk_quote_data_read.clearing_data, bulk_quote_data_written.clearing_data);
  equal_owner_data(bulk_quote_data_read.owner_data, bulk_quote_data_written.owner_data);
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> assert(bulk_quote_data_read.maximum_number_trades[bulk_quote_data_at] == bulk_quote_data_written.maximum_number_trades[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> assert(bulk_quote_data_read.minimum_volume[bulk_quote_data_at] == bulk_quote_data_written.minimum_volume[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 2 -> assert(bulk_quote_data_read.filler_2[bulk_quote_data_at] == bulk_quote_data_written.filler_2[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
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
  :: bulk_quote_data_at < 8 -> assert(bulk_quote_data_read.delta_maximum_volume[bulk_quote_data_at] == bulk_quote_data_written.delta_maximum_volume[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> assert(bulk_quote_data_read.delta_maximum_value[bulk_quote_data_at] == bulk_quote_data_written.delta_maximum_value[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 8 -> assert(bulk_quote_data_read.anti_wash_id[bulk_quote_data_at] == bulk_quote_data_written.anti_wash_id[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  bulk_quote_data_at = 0;
  do
  :: bulk_quote_data_at < 20 -> assert(bulk_quote_data_read.filler_20[bulk_quote_data_at] == bulk_quote_data_written.filler_20[bulk_quote_data_at]); bulk_quote_data_at = bulk_quote_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Global Cancellation: 25 bytes ------------------------------------------- */

typedef GlobalCancellation {
  IncomingMessagesHeader incoming_messages_header;
  byte group[2];
  byte type_of_cancellation_q_quotes_only
};

int global_cancellation_at;

/* every byte of Global Cancellation set to one value */
inline fill_global_cancellation(global_cancellation_record, global_cancellation_value) {
  fill_incoming_messages_header(global_cancellation_record.incoming_messages_header, global_cancellation_value);
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 2 -> global_cancellation_record.group[global_cancellation_at] = global_cancellation_value; global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  global_cancellation_record.type_of_cancellation_q_quotes_only = global_cancellation_value;
  skip
}

/* each byte of Global Cancellation set to where it lies, so a field read out of place says so */
inline ramp_global_cancellation(global_cancellation_record, global_cancellation_base) {
  ramp_incoming_messages_header(global_cancellation_record.incoming_messages_header, global_cancellation_base + 0);
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 2 -> global_cancellation_record.group[global_cancellation_at] = (global_cancellation_base + 22 + global_cancellation_at + 1) % 256; global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  global_cancellation_record.type_of_cancellation_q_quotes_only = (global_cancellation_base + 24 + 1) % 256;
  skip
}

/* Global Cancellation to the wire, 25 bytes from where the cursor stands */
inline encode_global_cancellation(global_cancellation_record) {
  encode_incoming_messages_header(global_cancellation_record.incoming_messages_header);
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 2 -> wire[at] = global_cancellation_record.group[global_cancellation_at]; at = at + 1; global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  wire[at] = global_cancellation_record.type_of_cancellation_q_quotes_only; at = at + 1;
  skip
}

/* Global Cancellation off the wire, 25 bytes from where the cursor stands */
inline decode_global_cancellation(global_cancellation_record) {
  decode_incoming_messages_header(global_cancellation_record.incoming_messages_header);
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 2 -> global_cancellation_record.group[global_cancellation_at] = wire[at]; at = at + 1; global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  global_cancellation_record.type_of_cancellation_q_quotes_only = wire[at]; at = at + 1;
  skip
}

/* what was read of Global Cancellation is what was written, byte for byte */
inline equal_global_cancellation(global_cancellation_read, global_cancellation_written) {
  equal_incoming_messages_header(global_cancellation_read.incoming_messages_header, global_cancellation_written.incoming_messages_header);
  global_cancellation_at = 0;
  do
  :: global_cancellation_at < 2 -> assert(global_cancellation_read.group[global_cancellation_at] == global_cancellation_written.group[global_cancellation_at]); global_cancellation_at = global_cancellation_at + 1
  :: else -> break
  od;
  assert(global_cancellation_read.type_of_cancellation_q_quotes_only == global_cancellation_written.type_of_cancellation_q_quotes_only);
  skip
}

/* ---- User Global Cancellation: 37 bytes -------------------------------------- */

typedef UserGlobalCancellation {
  IncomingMessagesHeader incoming_messages_header;
  byte group_filter[2];
  byte instrument_filter[4];
  byte type_of_cancellation;
  byte account_type_filter[8]
};

int user_global_cancellation_at;

/* every byte of User Global Cancellation set to one value */
inline fill_user_global_cancellation(user_global_cancellation_record, user_global_cancellation_value) {
  fill_incoming_messages_header(user_global_cancellation_record.incoming_messages_header, user_global_cancellation_value);
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 2 -> user_global_cancellation_record.group_filter[user_global_cancellation_at] = user_global_cancellation_value; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 4 -> user_global_cancellation_record.instrument_filter[user_global_cancellation_at] = user_global_cancellation_value; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_record.type_of_cancellation = user_global_cancellation_value;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> user_global_cancellation_record.account_type_filter[user_global_cancellation_at] = user_global_cancellation_value; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Global Cancellation set to where it lies, so a field read out of place says so */
inline ramp_user_global_cancellation(user_global_cancellation_record, user_global_cancellation_base) {
  ramp_incoming_messages_header(user_global_cancellation_record.incoming_messages_header, user_global_cancellation_base + 0);
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 2 -> user_global_cancellation_record.group_filter[user_global_cancellation_at] = (user_global_cancellation_base + 22 + user_global_cancellation_at + 1) % 256; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 4 -> user_global_cancellation_record.instrument_filter[user_global_cancellation_at] = (user_global_cancellation_base + 24 + user_global_cancellation_at + 1) % 256; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_record.type_of_cancellation = (user_global_cancellation_base + 28 + 1) % 256;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> user_global_cancellation_record.account_type_filter[user_global_cancellation_at] = (user_global_cancellation_base + 29 + user_global_cancellation_at + 1) % 256; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* User Global Cancellation to the wire, 37 bytes from where the cursor stands */
inline encode_user_global_cancellation(user_global_cancellation_record) {
  encode_incoming_messages_header(user_global_cancellation_record.incoming_messages_header);
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 2 -> wire[at] = user_global_cancellation_record.group_filter[user_global_cancellation_at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 4 -> wire[at] = user_global_cancellation_record.instrument_filter[user_global_cancellation_at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  wire[at] = user_global_cancellation_record.type_of_cancellation; at = at + 1;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> wire[at] = user_global_cancellation_record.account_type_filter[user_global_cancellation_at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* User Global Cancellation off the wire, 37 bytes from where the cursor stands */
inline decode_user_global_cancellation(user_global_cancellation_record) {
  decode_incoming_messages_header(user_global_cancellation_record.incoming_messages_header);
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 2 -> user_global_cancellation_record.group_filter[user_global_cancellation_at] = wire[at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 4 -> user_global_cancellation_record.instrument_filter[user_global_cancellation_at] = wire[at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_record.type_of_cancellation = wire[at]; at = at + 1;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> user_global_cancellation_record.account_type_filter[user_global_cancellation_at] = wire[at]; at = at + 1; user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Global Cancellation is what was written, byte for byte */
inline equal_user_global_cancellation(user_global_cancellation_read, user_global_cancellation_written) {
  equal_incoming_messages_header(user_global_cancellation_read.incoming_messages_header, user_global_cancellation_written.incoming_messages_header);
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 2 -> assert(user_global_cancellation_read.group_filter[user_global_cancellation_at] == user_global_cancellation_written.group_filter[user_global_cancellation_at]); user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 4 -> assert(user_global_cancellation_read.instrument_filter[user_global_cancellation_at] == user_global_cancellation_written.instrument_filter[user_global_cancellation_at]); user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  assert(user_global_cancellation_read.type_of_cancellation == user_global_cancellation_written.type_of_cancellation);
  user_global_cancellation_at = 0;
  do
  :: user_global_cancellation_at < 8 -> assert(user_global_cancellation_read.account_type_filter[user_global_cancellation_at] == user_global_cancellation_written.account_type_filter[user_global_cancellation_at]); user_global_cancellation_at = user_global_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Set Global Risk Limits: 101 bytes --------------------------------------- */

typedef SetGlobalRiskLimits {
  IncomingMessagesHeader incoming_messages_header;
  byte global_net_exposure_action;
  byte default_net_exposure_action;
  byte default_long_exposure_action;
  byte default_short_exposure_action;
  byte default_net_position_action;
  byte default_long_position_action;
  byte default_short_position_action;
  byte global_net_exposure_limit[10];
  byte default_maximum_order_quantity[8];
  byte default_net_exposure_limit[10];
  byte default_long_exposure_limit[10];
  byte default_short_exposure_limit[10];
  byte default_net_position_limit[8];
  byte default_long_position_limit[8];
  byte default_short_position_limit[8]
};

int set_global_risk_limits_at;

/* every byte of Set Global Risk Limits set to one value */
inline fill_set_global_risk_limits(set_global_risk_limits_record, set_global_risk_limits_value) {
  fill_incoming_messages_header(set_global_risk_limits_record.incoming_messages_header, set_global_risk_limits_value);
  set_global_risk_limits_record.global_net_exposure_action = set_global_risk_limits_value;
  set_global_risk_limits_record.default_net_exposure_action = set_global_risk_limits_value;
  set_global_risk_limits_record.default_long_exposure_action = set_global_risk_limits_value;
  set_global_risk_limits_record.default_short_exposure_action = set_global_risk_limits_value;
  set_global_risk_limits_record.default_net_position_action = set_global_risk_limits_value;
  set_global_risk_limits_record.default_long_position_action = set_global_risk_limits_value;
  set_global_risk_limits_record.default_short_position_action = set_global_risk_limits_value;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> set_global_risk_limits_record.global_net_exposure_limit[set_global_risk_limits_at] = set_global_risk_limits_value; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> set_global_risk_limits_record.default_maximum_order_quantity[set_global_risk_limits_at] = set_global_risk_limits_value; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> set_global_risk_limits_record.default_net_exposure_limit[set_global_risk_limits_at] = set_global_risk_limits_value; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> set_global_risk_limits_record.default_long_exposure_limit[set_global_risk_limits_at] = set_global_risk_limits_value; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> set_global_risk_limits_record.default_short_exposure_limit[set_global_risk_limits_at] = set_global_risk_limits_value; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> set_global_risk_limits_record.default_net_position_limit[set_global_risk_limits_at] = set_global_risk_limits_value; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> set_global_risk_limits_record.default_long_position_limit[set_global_risk_limits_at] = set_global_risk_limits_value; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> set_global_risk_limits_record.default_short_position_limit[set_global_risk_limits_at] = set_global_risk_limits_value; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Set Global Risk Limits set to where it lies, so a field read out of place says so */
inline ramp_set_global_risk_limits(set_global_risk_limits_record, set_global_risk_limits_base) {
  ramp_incoming_messages_header(set_global_risk_limits_record.incoming_messages_header, set_global_risk_limits_base + 0);
  set_global_risk_limits_record.global_net_exposure_action = (set_global_risk_limits_base + 22 + 1) % 256;
  set_global_risk_limits_record.default_net_exposure_action = (set_global_risk_limits_base + 23 + 1) % 256;
  set_global_risk_limits_record.default_long_exposure_action = (set_global_risk_limits_base + 24 + 1) % 256;
  set_global_risk_limits_record.default_short_exposure_action = (set_global_risk_limits_base + 25 + 1) % 256;
  set_global_risk_limits_record.default_net_position_action = (set_global_risk_limits_base + 26 + 1) % 256;
  set_global_risk_limits_record.default_long_position_action = (set_global_risk_limits_base + 27 + 1) % 256;
  set_global_risk_limits_record.default_short_position_action = (set_global_risk_limits_base + 28 + 1) % 256;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> set_global_risk_limits_record.global_net_exposure_limit[set_global_risk_limits_at] = (set_global_risk_limits_base + 29 + set_global_risk_limits_at + 1) % 256; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> set_global_risk_limits_record.default_maximum_order_quantity[set_global_risk_limits_at] = (set_global_risk_limits_base + 39 + set_global_risk_limits_at + 1) % 256; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> set_global_risk_limits_record.default_net_exposure_limit[set_global_risk_limits_at] = (set_global_risk_limits_base + 47 + set_global_risk_limits_at + 1) % 256; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> set_global_risk_limits_record.default_long_exposure_limit[set_global_risk_limits_at] = (set_global_risk_limits_base + 57 + set_global_risk_limits_at + 1) % 256; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> set_global_risk_limits_record.default_short_exposure_limit[set_global_risk_limits_at] = (set_global_risk_limits_base + 67 + set_global_risk_limits_at + 1) % 256; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> set_global_risk_limits_record.default_net_position_limit[set_global_risk_limits_at] = (set_global_risk_limits_base + 77 + set_global_risk_limits_at + 1) % 256; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> set_global_risk_limits_record.default_long_position_limit[set_global_risk_limits_at] = (set_global_risk_limits_base + 85 + set_global_risk_limits_at + 1) % 256; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> set_global_risk_limits_record.default_short_position_limit[set_global_risk_limits_at] = (set_global_risk_limits_base + 93 + set_global_risk_limits_at + 1) % 256; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  skip
}

/* Set Global Risk Limits to the wire, 101 bytes from where the cursor stands */
inline encode_set_global_risk_limits(set_global_risk_limits_record) {
  encode_incoming_messages_header(set_global_risk_limits_record.incoming_messages_header);
  wire[at] = set_global_risk_limits_record.global_net_exposure_action; at = at + 1;
  wire[at] = set_global_risk_limits_record.default_net_exposure_action; at = at + 1;
  wire[at] = set_global_risk_limits_record.default_long_exposure_action; at = at + 1;
  wire[at] = set_global_risk_limits_record.default_short_exposure_action; at = at + 1;
  wire[at] = set_global_risk_limits_record.default_net_position_action; at = at + 1;
  wire[at] = set_global_risk_limits_record.default_long_position_action; at = at + 1;
  wire[at] = set_global_risk_limits_record.default_short_position_action; at = at + 1;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> wire[at] = set_global_risk_limits_record.global_net_exposure_limit[set_global_risk_limits_at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> wire[at] = set_global_risk_limits_record.default_maximum_order_quantity[set_global_risk_limits_at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> wire[at] = set_global_risk_limits_record.default_net_exposure_limit[set_global_risk_limits_at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> wire[at] = set_global_risk_limits_record.default_long_exposure_limit[set_global_risk_limits_at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> wire[at] = set_global_risk_limits_record.default_short_exposure_limit[set_global_risk_limits_at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> wire[at] = set_global_risk_limits_record.default_net_position_limit[set_global_risk_limits_at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> wire[at] = set_global_risk_limits_record.default_long_position_limit[set_global_risk_limits_at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> wire[at] = set_global_risk_limits_record.default_short_position_limit[set_global_risk_limits_at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  skip
}

/* Set Global Risk Limits off the wire, 101 bytes from where the cursor stands */
inline decode_set_global_risk_limits(set_global_risk_limits_record) {
  decode_incoming_messages_header(set_global_risk_limits_record.incoming_messages_header);
  set_global_risk_limits_record.global_net_exposure_action = wire[at]; at = at + 1;
  set_global_risk_limits_record.default_net_exposure_action = wire[at]; at = at + 1;
  set_global_risk_limits_record.default_long_exposure_action = wire[at]; at = at + 1;
  set_global_risk_limits_record.default_short_exposure_action = wire[at]; at = at + 1;
  set_global_risk_limits_record.default_net_position_action = wire[at]; at = at + 1;
  set_global_risk_limits_record.default_long_position_action = wire[at]; at = at + 1;
  set_global_risk_limits_record.default_short_position_action = wire[at]; at = at + 1;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> set_global_risk_limits_record.global_net_exposure_limit[set_global_risk_limits_at] = wire[at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> set_global_risk_limits_record.default_maximum_order_quantity[set_global_risk_limits_at] = wire[at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> set_global_risk_limits_record.default_net_exposure_limit[set_global_risk_limits_at] = wire[at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> set_global_risk_limits_record.default_long_exposure_limit[set_global_risk_limits_at] = wire[at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> set_global_risk_limits_record.default_short_exposure_limit[set_global_risk_limits_at] = wire[at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> set_global_risk_limits_record.default_net_position_limit[set_global_risk_limits_at] = wire[at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> set_global_risk_limits_record.default_long_position_limit[set_global_risk_limits_at] = wire[at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> set_global_risk_limits_record.default_short_position_limit[set_global_risk_limits_at] = wire[at]; at = at + 1; set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Set Global Risk Limits is what was written, byte for byte */
inline equal_set_global_risk_limits(set_global_risk_limits_read, set_global_risk_limits_written) {
  equal_incoming_messages_header(set_global_risk_limits_read.incoming_messages_header, set_global_risk_limits_written.incoming_messages_header);
  assert(set_global_risk_limits_read.global_net_exposure_action == set_global_risk_limits_written.global_net_exposure_action);
  assert(set_global_risk_limits_read.default_net_exposure_action == set_global_risk_limits_written.default_net_exposure_action);
  assert(set_global_risk_limits_read.default_long_exposure_action == set_global_risk_limits_written.default_long_exposure_action);
  assert(set_global_risk_limits_read.default_short_exposure_action == set_global_risk_limits_written.default_short_exposure_action);
  assert(set_global_risk_limits_read.default_net_position_action == set_global_risk_limits_written.default_net_position_action);
  assert(set_global_risk_limits_read.default_long_position_action == set_global_risk_limits_written.default_long_position_action);
  assert(set_global_risk_limits_read.default_short_position_action == set_global_risk_limits_written.default_short_position_action);
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> assert(set_global_risk_limits_read.global_net_exposure_limit[set_global_risk_limits_at] == set_global_risk_limits_written.global_net_exposure_limit[set_global_risk_limits_at]); set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> assert(set_global_risk_limits_read.default_maximum_order_quantity[set_global_risk_limits_at] == set_global_risk_limits_written.default_maximum_order_quantity[set_global_risk_limits_at]); set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> assert(set_global_risk_limits_read.default_net_exposure_limit[set_global_risk_limits_at] == set_global_risk_limits_written.default_net_exposure_limit[set_global_risk_limits_at]); set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> assert(set_global_risk_limits_read.default_long_exposure_limit[set_global_risk_limits_at] == set_global_risk_limits_written.default_long_exposure_limit[set_global_risk_limits_at]); set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 10 -> assert(set_global_risk_limits_read.default_short_exposure_limit[set_global_risk_limits_at] == set_global_risk_limits_written.default_short_exposure_limit[set_global_risk_limits_at]); set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> assert(set_global_risk_limits_read.default_net_position_limit[set_global_risk_limits_at] == set_global_risk_limits_written.default_net_position_limit[set_global_risk_limits_at]); set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> assert(set_global_risk_limits_read.default_long_position_limit[set_global_risk_limits_at] == set_global_risk_limits_written.default_long_position_limit[set_global_risk_limits_at]); set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  set_global_risk_limits_at = 0;
  do
  :: set_global_risk_limits_at < 8 -> assert(set_global_risk_limits_read.default_short_position_limit[set_global_risk_limits_at] == set_global_risk_limits_written.default_short_position_limit[set_global_risk_limits_at]); set_global_risk_limits_at = set_global_risk_limits_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Entry: 181 bytes -------------------------------------------------- */

typedef OrderEntry {
  IncomingMessagesHeader incoming_messages_header;
  byte group[2];
  byte instrument[4];
  byte price_type;
  byte verb_side;
  byte quantity[8];
  byte price[10];
  byte special_price_term;
  byte additional_price[10];
  byte quantity_term;
  byte additional_quantity[8];
  byte duration_type;
  byte gtd_date[8];
  byte executing_participant[4];
  byte filler_1;
  ClearingData clearing_data;
  OwnerData owner_data;
  byte anti_wash_id[8];
  byte anti_wash_instruction;
  byte filler_20[20]
};

int order_entry_at;

/* every byte of Order Entry set to one value */
inline fill_order_entry(order_entry_record, order_entry_value) {
  fill_incoming_messages_header(order_entry_record.incoming_messages_header, order_entry_value);
  order_entry_at = 0;
  do
  :: order_entry_at < 2 -> order_entry_record.group[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> order_entry_record.instrument[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
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
  :: order_entry_at < 10 -> order_entry_record.additional_price[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
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
  order_entry_record.filler_1 = order_entry_value;
  fill_clearing_data(order_entry_record.clearing_data, order_entry_value);
  fill_owner_data(order_entry_record.owner_data, order_entry_value);
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.anti_wash_id[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.anti_wash_instruction = order_entry_value;
  order_entry_at = 0;
  do
  :: order_entry_at < 20 -> order_entry_record.filler_20[order_entry_at] = order_entry_value; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Entry set to where it lies, so a field read out of place says so */
inline ramp_order_entry(order_entry_record, order_entry_base) {
  ramp_incoming_messages_header(order_entry_record.incoming_messages_header, order_entry_base + 0);
  order_entry_at = 0;
  do
  :: order_entry_at < 2 -> order_entry_record.group[order_entry_at] = (order_entry_base + 22 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> order_entry_record.instrument[order_entry_at] = (order_entry_base + 24 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.price_type = (order_entry_base + 28 + 1) % 256;
  order_entry_record.verb_side = (order_entry_base + 29 + 1) % 256;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.quantity[order_entry_at] = (order_entry_base + 30 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 10 -> order_entry_record.price[order_entry_at] = (order_entry_base + 38 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.special_price_term = (order_entry_base + 48 + 1) % 256;
  order_entry_at = 0;
  do
  :: order_entry_at < 10 -> order_entry_record.additional_price[order_entry_at] = (order_entry_base + 49 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.quantity_term = (order_entry_base + 59 + 1) % 256;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.additional_quantity[order_entry_at] = (order_entry_base + 60 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.duration_type = (order_entry_base + 68 + 1) % 256;
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.gtd_date[order_entry_at] = (order_entry_base + 69 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> order_entry_record.executing_participant[order_entry_at] = (order_entry_base + 77 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.filler_1 = (order_entry_base + 81 + 1) % 256;
  ramp_clearing_data(order_entry_record.clearing_data, order_entry_base + 82);
  ramp_owner_data(order_entry_record.owner_data, order_entry_base + 102);
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.anti_wash_id[order_entry_at] = (order_entry_base + 152 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.anti_wash_instruction = (order_entry_base + 160 + 1) % 256;
  order_entry_at = 0;
  do
  :: order_entry_at < 20 -> order_entry_record.filler_20[order_entry_at] = (order_entry_base + 161 + order_entry_at + 1) % 256; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Order Entry to the wire, 181 bytes from where the cursor stands */
inline encode_order_entry(order_entry_record) {
  encode_incoming_messages_header(order_entry_record.incoming_messages_header);
  order_entry_at = 0;
  do
  :: order_entry_at < 2 -> wire[at] = order_entry_record.group[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> wire[at] = order_entry_record.instrument[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
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
  :: order_entry_at < 10 -> wire[at] = order_entry_record.additional_price[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
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
  wire[at] = order_entry_record.filler_1; at = at + 1;
  encode_clearing_data(order_entry_record.clearing_data);
  encode_owner_data(order_entry_record.owner_data);
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> wire[at] = order_entry_record.anti_wash_id[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  wire[at] = order_entry_record.anti_wash_instruction; at = at + 1;
  order_entry_at = 0;
  do
  :: order_entry_at < 20 -> wire[at] = order_entry_record.filler_20[order_entry_at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Order Entry off the wire, 181 bytes from where the cursor stands */
inline decode_order_entry(order_entry_record) {
  decode_incoming_messages_header(order_entry_record.incoming_messages_header);
  order_entry_at = 0;
  do
  :: order_entry_at < 2 -> order_entry_record.group[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> order_entry_record.instrument[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
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
  :: order_entry_at < 10 -> order_entry_record.additional_price[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
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
  order_entry_record.filler_1 = wire[at]; at = at + 1;
  decode_clearing_data(order_entry_record.clearing_data);
  decode_owner_data(order_entry_record.owner_data);
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> order_entry_record.anti_wash_id[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_record.anti_wash_instruction = wire[at]; at = at + 1;
  order_entry_at = 0;
  do
  :: order_entry_at < 20 -> order_entry_record.filler_20[order_entry_at] = wire[at]; at = at + 1; order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Entry is what was written, byte for byte */
inline equal_order_entry(order_entry_read, order_entry_written) {
  equal_incoming_messages_header(order_entry_read.incoming_messages_header, order_entry_written.incoming_messages_header);
  order_entry_at = 0;
  do
  :: order_entry_at < 2 -> assert(order_entry_read.group[order_entry_at] == order_entry_written.group[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  order_entry_at = 0;
  do
  :: order_entry_at < 4 -> assert(order_entry_read.instrument[order_entry_at] == order_entry_written.instrument[order_entry_at]); order_entry_at = order_entry_at + 1
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
  :: order_entry_at < 10 -> assert(order_entry_read.additional_price[order_entry_at] == order_entry_written.additional_price[order_entry_at]); order_entry_at = order_entry_at + 1
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
  assert(order_entry_read.filler_1 == order_entry_written.filler_1);
  equal_clearing_data(order_entry_read.clearing_data, order_entry_written.clearing_data);
  equal_owner_data(order_entry_read.owner_data, order_entry_written.owner_data);
  order_entry_at = 0;
  do
  :: order_entry_at < 8 -> assert(order_entry_read.anti_wash_id[order_entry_at] == order_entry_written.anti_wash_id[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  assert(order_entry_read.anti_wash_instruction == order_entry_written.anti_wash_instruction);
  order_entry_at = 0;
  do
  :: order_entry_at < 20 -> assert(order_entry_read.filler_20[order_entry_at] == order_entry_written.filler_20[order_entry_at]); order_entry_at = order_entry_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modification: 190 bytes ------------------------------------------- */

typedef OrderModification {
  IncomingMessagesHeader incoming_messages_header;
  byte group[2];
  byte instrument[4];
  byte price_type;
  byte verb_side;
  byte quantity_sign;
  byte quantity[8];
  byte price[10];
  byte special_price_term;
  byte additional_price[10];
  byte quantity_term;
  byte additional_quantity[8];
  byte duration_type;
  byte gtd_date[8];
  byte filler_4[4];
  byte filler_1;
  byte modified_order_id[8];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte anti_wash_id[8];
  byte anti_wash_instruction;
  byte filler_20[20]
};

int order_modification_at;

/* every byte of Order Modification set to one value */
inline fill_order_modification(order_modification_record, order_modification_value) {
  fill_incoming_messages_header(order_modification_record.incoming_messages_header, order_modification_value);
  order_modification_at = 0;
  do
  :: order_modification_at < 2 -> order_modification_record.group[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> order_modification_record.instrument[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
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
  :: order_modification_at < 10 -> order_modification_record.additional_price[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.quantity_term = order_modification_value;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.additional_quantity[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
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
  :: order_modification_at < 4 -> order_modification_record.filler_4[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.filler_1 = order_modification_value;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.modified_order_id[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  fill_clearing_data(order_modification_record.clearing_data, order_modification_value);
  fill_owner_data(order_modification_record.owner_data, order_modification_value);
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.anti_wash_id[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.anti_wash_instruction = order_modification_value;
  order_modification_at = 0;
  do
  :: order_modification_at < 20 -> order_modification_record.filler_20[order_modification_at] = order_modification_value; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modification set to where it lies, so a field read out of place says so */
inline ramp_order_modification(order_modification_record, order_modification_base) {
  ramp_incoming_messages_header(order_modification_record.incoming_messages_header, order_modification_base + 0);
  order_modification_at = 0;
  do
  :: order_modification_at < 2 -> order_modification_record.group[order_modification_at] = (order_modification_base + 22 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> order_modification_record.instrument[order_modification_at] = (order_modification_base + 24 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.price_type = (order_modification_base + 28 + 1) % 256;
  order_modification_record.verb_side = (order_modification_base + 29 + 1) % 256;
  order_modification_record.quantity_sign = (order_modification_base + 30 + 1) % 256;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.quantity[order_modification_at] = (order_modification_base + 31 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 10 -> order_modification_record.price[order_modification_at] = (order_modification_base + 39 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.special_price_term = (order_modification_base + 49 + 1) % 256;
  order_modification_at = 0;
  do
  :: order_modification_at < 10 -> order_modification_record.additional_price[order_modification_at] = (order_modification_base + 50 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.quantity_term = (order_modification_base + 60 + 1) % 256;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.additional_quantity[order_modification_at] = (order_modification_base + 61 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.duration_type = (order_modification_base + 69 + 1) % 256;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.gtd_date[order_modification_at] = (order_modification_base + 70 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> order_modification_record.filler_4[order_modification_at] = (order_modification_base + 78 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.filler_1 = (order_modification_base + 82 + 1) % 256;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.modified_order_id[order_modification_at] = (order_modification_base + 83 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  ramp_clearing_data(order_modification_record.clearing_data, order_modification_base + 91);
  ramp_owner_data(order_modification_record.owner_data, order_modification_base + 111);
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.anti_wash_id[order_modification_at] = (order_modification_base + 161 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.anti_wash_instruction = (order_modification_base + 169 + 1) % 256;
  order_modification_at = 0;
  do
  :: order_modification_at < 20 -> order_modification_record.filler_20[order_modification_at] = (order_modification_base + 170 + order_modification_at + 1) % 256; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modification to the wire, 190 bytes from where the cursor stands */
inline encode_order_modification(order_modification_record) {
  encode_incoming_messages_header(order_modification_record.incoming_messages_header);
  order_modification_at = 0;
  do
  :: order_modification_at < 2 -> wire[at] = order_modification_record.group[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> wire[at] = order_modification_record.instrument[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
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
  :: order_modification_at < 10 -> wire[at] = order_modification_record.additional_price[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  wire[at] = order_modification_record.quantity_term; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> wire[at] = order_modification_record.additional_quantity[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
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
  :: order_modification_at < 4 -> wire[at] = order_modification_record.filler_4[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  wire[at] = order_modification_record.filler_1; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> wire[at] = order_modification_record.modified_order_id[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  encode_clearing_data(order_modification_record.clearing_data);
  encode_owner_data(order_modification_record.owner_data);
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> wire[at] = order_modification_record.anti_wash_id[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  wire[at] = order_modification_record.anti_wash_instruction; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 20 -> wire[at] = order_modification_record.filler_20[order_modification_at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modification off the wire, 190 bytes from where the cursor stands */
inline decode_order_modification(order_modification_record) {
  decode_incoming_messages_header(order_modification_record.incoming_messages_header);
  order_modification_at = 0;
  do
  :: order_modification_at < 2 -> order_modification_record.group[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> order_modification_record.instrument[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
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
  :: order_modification_at < 10 -> order_modification_record.additional_price[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.quantity_term = wire[at]; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.additional_quantity[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
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
  :: order_modification_at < 4 -> order_modification_record.filler_4[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.filler_1 = wire[at]; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.modified_order_id[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  decode_clearing_data(order_modification_record.clearing_data);
  decode_owner_data(order_modification_record.owner_data);
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> order_modification_record.anti_wash_id[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_record.anti_wash_instruction = wire[at]; at = at + 1;
  order_modification_at = 0;
  do
  :: order_modification_at < 20 -> order_modification_record.filler_20[order_modification_at] = wire[at]; at = at + 1; order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modification is what was written, byte for byte */
inline equal_order_modification(order_modification_read, order_modification_written) {
  equal_incoming_messages_header(order_modification_read.incoming_messages_header, order_modification_written.incoming_messages_header);
  order_modification_at = 0;
  do
  :: order_modification_at < 2 -> assert(order_modification_read.group[order_modification_at] == order_modification_written.group[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  order_modification_at = 0;
  do
  :: order_modification_at < 4 -> assert(order_modification_read.instrument[order_modification_at] == order_modification_written.instrument[order_modification_at]); order_modification_at = order_modification_at + 1
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
  :: order_modification_at < 10 -> assert(order_modification_read.additional_price[order_modification_at] == order_modification_written.additional_price[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  assert(order_modification_read.quantity_term == order_modification_written.quantity_term);
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> assert(order_modification_read.additional_quantity[order_modification_at] == order_modification_written.additional_quantity[order_modification_at]); order_modification_at = order_modification_at + 1
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
  :: order_modification_at < 4 -> assert(order_modification_read.filler_4[order_modification_at] == order_modification_written.filler_4[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  assert(order_modification_read.filler_1 == order_modification_written.filler_1);
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> assert(order_modification_read.modified_order_id[order_modification_at] == order_modification_written.modified_order_id[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  equal_clearing_data(order_modification_read.clearing_data, order_modification_written.clearing_data);
  equal_owner_data(order_modification_read.owner_data, order_modification_written.owner_data);
  order_modification_at = 0;
  do
  :: order_modification_at < 8 -> assert(order_modification_read.anti_wash_id[order_modification_at] == order_modification_written.anti_wash_id[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  assert(order_modification_read.anti_wash_instruction == order_modification_written.anti_wash_instruction);
  order_modification_at = 0;
  do
  :: order_modification_at < 20 -> assert(order_modification_read.filler_20[order_modification_at] == order_modification_written.filler_20[order_modification_at]); order_modification_at = order_modification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Buying Clearing Data: 20 bytes ------------------------------------------ */

/* Clearing Data for the buying side, which OX: Cross Entry carries alongside the other side. */
typedef BuyingClearingData {
  byte clearing_instruction[12];
  byte account_type;
  byte open_close;
  byte hedge_spec;
  byte filler_5[5]
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
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 5 -> buying_clearing_data_record.filler_5[buying_clearing_data_at] = buying_clearing_data_value; buying_clearing_data_at = buying_clearing_data_at + 1
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
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 5 -> buying_clearing_data_record.filler_5[buying_clearing_data_at] = (buying_clearing_data_base + 15 + buying_clearing_data_at + 1) % 256; buying_clearing_data_at = buying_clearing_data_at + 1
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
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 5 -> wire[at] = buying_clearing_data_record.filler_5[buying_clearing_data_at]; at = at + 1; buying_clearing_data_at = buying_clearing_data_at + 1
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
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 5 -> buying_clearing_data_record.filler_5[buying_clearing_data_at] = wire[at]; at = at + 1; buying_clearing_data_at = buying_clearing_data_at + 1
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
  buying_clearing_data_at = 0;
  do
  :: buying_clearing_data_at < 5 -> assert(buying_clearing_data_read.filler_5[buying_clearing_data_at] == buying_clearing_data_written.filler_5[buying_clearing_data_at]); buying_clearing_data_at = buying_clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Selling Clearing Data: 20 bytes ----------------------------------------- */

/* Clearing Data for the selling side, which OX: Cross Entry carries alongside the other side. */
typedef SellingClearingData {
  byte clearing_instruction[12];
  byte account_type;
  byte open_close;
  byte hedge_spec;
  byte filler_5[5]
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
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 5 -> selling_clearing_data_record.filler_5[selling_clearing_data_at] = selling_clearing_data_value; selling_clearing_data_at = selling_clearing_data_at + 1
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
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 5 -> selling_clearing_data_record.filler_5[selling_clearing_data_at] = (selling_clearing_data_base + 15 + selling_clearing_data_at + 1) % 256; selling_clearing_data_at = selling_clearing_data_at + 1
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
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 5 -> wire[at] = selling_clearing_data_record.filler_5[selling_clearing_data_at]; at = at + 1; selling_clearing_data_at = selling_clearing_data_at + 1
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
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 5 -> selling_clearing_data_record.filler_5[selling_clearing_data_at] = wire[at]; at = at + 1; selling_clearing_data_at = selling_clearing_data_at + 1
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
  selling_clearing_data_at = 0;
  do
  :: selling_clearing_data_at < 5 -> assert(selling_clearing_data_read.filler_5[selling_clearing_data_at] == selling_clearing_data_written.filler_5[selling_clearing_data_at]); selling_clearing_data_at = selling_clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Buying Owner Data: 50 bytes --------------------------------------------- */

/* Owner Data for the buying side, which OX: Cross Entry carries alongside the other side. */
typedef BuyingOwnerData {
  byte memo[50]
};

int buying_owner_data_at;

/* every byte of Buying Owner Data set to one value */
inline fill_buying_owner_data(buying_owner_data_record, buying_owner_data_value) {
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
  :: buying_owner_data_at < 50 -> buying_owner_data_record.memo[buying_owner_data_at] = (buying_owner_data_base + 0 + buying_owner_data_at + 1) % 256; buying_owner_data_at = buying_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Buying Owner Data to the wire, 50 bytes from where the cursor stands */
inline encode_buying_owner_data(buying_owner_data_record) {
  buying_owner_data_at = 0;
  do
  :: buying_owner_data_at < 50 -> wire[at] = buying_owner_data_record.memo[buying_owner_data_at]; at = at + 1; buying_owner_data_at = buying_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Buying Owner Data off the wire, 50 bytes from where the cursor stands */
inline decode_buying_owner_data(buying_owner_data_record) {
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
  :: buying_owner_data_at < 50 -> assert(buying_owner_data_read.memo[buying_owner_data_at] == buying_owner_data_written.memo[buying_owner_data_at]); buying_owner_data_at = buying_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Selling Owner Data: 50 bytes -------------------------------------------- */

/* Owner Data for the selling side, which OX: Cross Entry carries alongside the other side. */
typedef SellingOwnerData {
  byte memo[50]
};

int selling_owner_data_at;

/* every byte of Selling Owner Data set to one value */
inline fill_selling_owner_data(selling_owner_data_record, selling_owner_data_value) {
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
  :: selling_owner_data_at < 50 -> selling_owner_data_record.memo[selling_owner_data_at] = (selling_owner_data_base + 0 + selling_owner_data_at + 1) % 256; selling_owner_data_at = selling_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Selling Owner Data to the wire, 50 bytes from where the cursor stands */
inline encode_selling_owner_data(selling_owner_data_record) {
  selling_owner_data_at = 0;
  do
  :: selling_owner_data_at < 50 -> wire[at] = selling_owner_data_record.memo[selling_owner_data_at]; at = at + 1; selling_owner_data_at = selling_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Selling Owner Data off the wire, 50 bytes from where the cursor stands */
inline decode_selling_owner_data(selling_owner_data_record) {
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
  :: selling_owner_data_at < 50 -> assert(selling_owner_data_read.memo[selling_owner_data_at] == selling_owner_data_written.memo[selling_owner_data_at]); selling_owner_data_at = selling_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cross Entry: 207 bytes -------------------------------------------------- */

typedef CrossEntry {
  IncomingMessagesHeader incoming_messages_header;
  byte group[2];
  byte instrument[4];
  byte filler_1;
  byte quantity[8];
  byte price[10];
  BuyingClearingData buying_clearing_data;
  SellingClearingData selling_clearing_data;
  BuyingOwnerData buying_owner_data;
  SellingOwnerData selling_owner_data;
  byte filler_20[20]
};

int cross_entry_at;

/* every byte of Cross Entry set to one value */
inline fill_cross_entry(cross_entry_record, cross_entry_value) {
  fill_incoming_messages_header(cross_entry_record.incoming_messages_header, cross_entry_value);
  cross_entry_at = 0;
  do
  :: cross_entry_at < 2 -> cross_entry_record.group[cross_entry_at] = cross_entry_value; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 4 -> cross_entry_record.instrument[cross_entry_at] = cross_entry_value; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  cross_entry_record.filler_1 = cross_entry_value;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 8 -> cross_entry_record.quantity[cross_entry_at] = cross_entry_value; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 10 -> cross_entry_record.price[cross_entry_at] = cross_entry_value; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  fill_buying_clearing_data(cross_entry_record.buying_clearing_data, cross_entry_value);
  fill_selling_clearing_data(cross_entry_record.selling_clearing_data, cross_entry_value);
  fill_buying_owner_data(cross_entry_record.buying_owner_data, cross_entry_value);
  fill_selling_owner_data(cross_entry_record.selling_owner_data, cross_entry_value);
  cross_entry_at = 0;
  do
  :: cross_entry_at < 20 -> cross_entry_record.filler_20[cross_entry_at] = cross_entry_value; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cross Entry set to where it lies, so a field read out of place says so */
inline ramp_cross_entry(cross_entry_record, cross_entry_base) {
  ramp_incoming_messages_header(cross_entry_record.incoming_messages_header, cross_entry_base + 0);
  cross_entry_at = 0;
  do
  :: cross_entry_at < 2 -> cross_entry_record.group[cross_entry_at] = (cross_entry_base + 22 + cross_entry_at + 1) % 256; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 4 -> cross_entry_record.instrument[cross_entry_at] = (cross_entry_base + 24 + cross_entry_at + 1) % 256; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  cross_entry_record.filler_1 = (cross_entry_base + 28 + 1) % 256;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 8 -> cross_entry_record.quantity[cross_entry_at] = (cross_entry_base + 29 + cross_entry_at + 1) % 256; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 10 -> cross_entry_record.price[cross_entry_at] = (cross_entry_base + 37 + cross_entry_at + 1) % 256; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  ramp_buying_clearing_data(cross_entry_record.buying_clearing_data, cross_entry_base + 47);
  ramp_selling_clearing_data(cross_entry_record.selling_clearing_data, cross_entry_base + 67);
  ramp_buying_owner_data(cross_entry_record.buying_owner_data, cross_entry_base + 87);
  ramp_selling_owner_data(cross_entry_record.selling_owner_data, cross_entry_base + 137);
  cross_entry_at = 0;
  do
  :: cross_entry_at < 20 -> cross_entry_record.filler_20[cross_entry_at] = (cross_entry_base + 187 + cross_entry_at + 1) % 256; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Entry to the wire, 207 bytes from where the cursor stands */
inline encode_cross_entry(cross_entry_record) {
  encode_incoming_messages_header(cross_entry_record.incoming_messages_header);
  cross_entry_at = 0;
  do
  :: cross_entry_at < 2 -> wire[at] = cross_entry_record.group[cross_entry_at]; at = at + 1; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 4 -> wire[at] = cross_entry_record.instrument[cross_entry_at]; at = at + 1; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  wire[at] = cross_entry_record.filler_1; at = at + 1;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 8 -> wire[at] = cross_entry_record.quantity[cross_entry_at]; at = at + 1; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 10 -> wire[at] = cross_entry_record.price[cross_entry_at]; at = at + 1; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  encode_buying_clearing_data(cross_entry_record.buying_clearing_data);
  encode_selling_clearing_data(cross_entry_record.selling_clearing_data);
  encode_buying_owner_data(cross_entry_record.buying_owner_data);
  encode_selling_owner_data(cross_entry_record.selling_owner_data);
  cross_entry_at = 0;
  do
  :: cross_entry_at < 20 -> wire[at] = cross_entry_record.filler_20[cross_entry_at]; at = at + 1; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Entry off the wire, 207 bytes from where the cursor stands */
inline decode_cross_entry(cross_entry_record) {
  decode_incoming_messages_header(cross_entry_record.incoming_messages_header);
  cross_entry_at = 0;
  do
  :: cross_entry_at < 2 -> cross_entry_record.group[cross_entry_at] = wire[at]; at = at + 1; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 4 -> cross_entry_record.instrument[cross_entry_at] = wire[at]; at = at + 1; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  cross_entry_record.filler_1 = wire[at]; at = at + 1;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 8 -> cross_entry_record.quantity[cross_entry_at] = wire[at]; at = at + 1; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 10 -> cross_entry_record.price[cross_entry_at] = wire[at]; at = at + 1; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  decode_buying_clearing_data(cross_entry_record.buying_clearing_data);
  decode_selling_clearing_data(cross_entry_record.selling_clearing_data);
  decode_buying_owner_data(cross_entry_record.buying_owner_data);
  decode_selling_owner_data(cross_entry_record.selling_owner_data);
  cross_entry_at = 0;
  do
  :: cross_entry_at < 20 -> cross_entry_record.filler_20[cross_entry_at] = wire[at]; at = at + 1; cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cross Entry is what was written, byte for byte */
inline equal_cross_entry(cross_entry_read, cross_entry_written) {
  equal_incoming_messages_header(cross_entry_read.incoming_messages_header, cross_entry_written.incoming_messages_header);
  cross_entry_at = 0;
  do
  :: cross_entry_at < 2 -> assert(cross_entry_read.group[cross_entry_at] == cross_entry_written.group[cross_entry_at]); cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 4 -> assert(cross_entry_read.instrument[cross_entry_at] == cross_entry_written.instrument[cross_entry_at]); cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  assert(cross_entry_read.filler_1 == cross_entry_written.filler_1);
  cross_entry_at = 0;
  do
  :: cross_entry_at < 8 -> assert(cross_entry_read.quantity[cross_entry_at] == cross_entry_written.quantity[cross_entry_at]); cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  cross_entry_at = 0;
  do
  :: cross_entry_at < 10 -> assert(cross_entry_read.price[cross_entry_at] == cross_entry_written.price[cross_entry_at]); cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  equal_buying_clearing_data(cross_entry_read.buying_clearing_data, cross_entry_written.buying_clearing_data);
  equal_selling_clearing_data(cross_entry_read.selling_clearing_data, cross_entry_written.selling_clearing_data);
  equal_buying_owner_data(cross_entry_read.buying_owner_data, cross_entry_written.buying_owner_data);
  equal_selling_owner_data(cross_entry_read.selling_owner_data, cross_entry_written.selling_owner_data);
  cross_entry_at = 0;
  do
  :: cross_entry_at < 20 -> assert(cross_entry_read.filler_20[cross_entry_at] == cross_entry_written.filler_20[cross_entry_at]); cross_entry_at = cross_entry_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sail Request For Quote With Side: 37 bytes ------------------------------ */

typedef SailRequestForQuoteWithSide {
  IncomingMessagesHeader incoming_messages_header;
  byte group[2];
  byte instrument[4];
  byte quantity[8];
  byte market_side
};

int sail_request_for_quote_with_side_at;

/* every byte of Sail Request For Quote With Side set to one value */
inline fill_sail_request_for_quote_with_side(sail_request_for_quote_with_side_record, sail_request_for_quote_with_side_value) {
  fill_incoming_messages_header(sail_request_for_quote_with_side_record.incoming_messages_header, sail_request_for_quote_with_side_value);
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 2 -> sail_request_for_quote_with_side_record.group[sail_request_for_quote_with_side_at] = sail_request_for_quote_with_side_value; sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 4 -> sail_request_for_quote_with_side_record.instrument[sail_request_for_quote_with_side_at] = sail_request_for_quote_with_side_value; sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 8 -> sail_request_for_quote_with_side_record.quantity[sail_request_for_quote_with_side_at] = sail_request_for_quote_with_side_value; sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  sail_request_for_quote_with_side_record.market_side = sail_request_for_quote_with_side_value;
  skip
}

/* each byte of Sail Request For Quote With Side set to where it lies, so a field read out of place says so */
inline ramp_sail_request_for_quote_with_side(sail_request_for_quote_with_side_record, sail_request_for_quote_with_side_base) {
  ramp_incoming_messages_header(sail_request_for_quote_with_side_record.incoming_messages_header, sail_request_for_quote_with_side_base + 0);
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 2 -> sail_request_for_quote_with_side_record.group[sail_request_for_quote_with_side_at] = (sail_request_for_quote_with_side_base + 22 + sail_request_for_quote_with_side_at + 1) % 256; sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 4 -> sail_request_for_quote_with_side_record.instrument[sail_request_for_quote_with_side_at] = (sail_request_for_quote_with_side_base + 24 + sail_request_for_quote_with_side_at + 1) % 256; sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 8 -> sail_request_for_quote_with_side_record.quantity[sail_request_for_quote_with_side_at] = (sail_request_for_quote_with_side_base + 28 + sail_request_for_quote_with_side_at + 1) % 256; sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  sail_request_for_quote_with_side_record.market_side = (sail_request_for_quote_with_side_base + 36 + 1) % 256;
  skip
}

/* Sail Request For Quote With Side to the wire, 37 bytes from where the cursor stands */
inline encode_sail_request_for_quote_with_side(sail_request_for_quote_with_side_record) {
  encode_incoming_messages_header(sail_request_for_quote_with_side_record.incoming_messages_header);
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 2 -> wire[at] = sail_request_for_quote_with_side_record.group[sail_request_for_quote_with_side_at]; at = at + 1; sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 4 -> wire[at] = sail_request_for_quote_with_side_record.instrument[sail_request_for_quote_with_side_at]; at = at + 1; sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 8 -> wire[at] = sail_request_for_quote_with_side_record.quantity[sail_request_for_quote_with_side_at]; at = at + 1; sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  wire[at] = sail_request_for_quote_with_side_record.market_side; at = at + 1;
  skip
}

/* Sail Request For Quote With Side off the wire, 37 bytes from where the cursor stands */
inline decode_sail_request_for_quote_with_side(sail_request_for_quote_with_side_record) {
  decode_incoming_messages_header(sail_request_for_quote_with_side_record.incoming_messages_header);
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 2 -> sail_request_for_quote_with_side_record.group[sail_request_for_quote_with_side_at] = wire[at]; at = at + 1; sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 4 -> sail_request_for_quote_with_side_record.instrument[sail_request_for_quote_with_side_at] = wire[at]; at = at + 1; sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 8 -> sail_request_for_quote_with_side_record.quantity[sail_request_for_quote_with_side_at] = wire[at]; at = at + 1; sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  sail_request_for_quote_with_side_record.market_side = wire[at]; at = at + 1;
  skip
}

/* what was read of Sail Request For Quote With Side is what was written, byte for byte */
inline equal_sail_request_for_quote_with_side(sail_request_for_quote_with_side_read, sail_request_for_quote_with_side_written) {
  equal_incoming_messages_header(sail_request_for_quote_with_side_read.incoming_messages_header, sail_request_for_quote_with_side_written.incoming_messages_header);
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 2 -> assert(sail_request_for_quote_with_side_read.group[sail_request_for_quote_with_side_at] == sail_request_for_quote_with_side_written.group[sail_request_for_quote_with_side_at]); sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 4 -> assert(sail_request_for_quote_with_side_read.instrument[sail_request_for_quote_with_side_at] == sail_request_for_quote_with_side_written.instrument[sail_request_for_quote_with_side_at]); sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  sail_request_for_quote_with_side_at = 0;
  do
  :: sail_request_for_quote_with_side_at < 8 -> assert(sail_request_for_quote_with_side_read.quantity[sail_request_for_quote_with_side_at] == sail_request_for_quote_with_side_written.quantity[sail_request_for_quote_with_side_at]); sail_request_for_quote_with_side_at = sail_request_for_quote_with_side_at + 1
  :: else -> break
  od;
  assert(sail_request_for_quote_with_side_read.market_side == sail_request_for_quote_with_side_written.market_side);
  skip
}

/* ---- Bulk Quote Participant Bqp Protection Subscription: 25 bytes ------------ */

typedef BulkQuoteParticipantBqpProtectionSubscription {
  IncomingMessagesHeader incoming_messages_header;
  byte group[2];
  byte protection_type_advanced_protection_advanced_protection_disabled
};

int bulk_quote_participant_bqp_protection_subscription_at;

/* every byte of Bulk Quote Participant Bqp Protection Subscription set to one value */
inline fill_bulk_quote_participant_bqp_protection_subscription(bulk_quote_participant_bqp_protection_subscription_record, bulk_quote_participant_bqp_protection_subscription_value) {
  fill_incoming_messages_header(bulk_quote_participant_bqp_protection_subscription_record.incoming_messages_header, bulk_quote_participant_bqp_protection_subscription_value);
  bulk_quote_participant_bqp_protection_subscription_at = 0;
  do
  :: bulk_quote_participant_bqp_protection_subscription_at < 2 -> bulk_quote_participant_bqp_protection_subscription_record.group[bulk_quote_participant_bqp_protection_subscription_at] = bulk_quote_participant_bqp_protection_subscription_value; bulk_quote_participant_bqp_protection_subscription_at = bulk_quote_participant_bqp_protection_subscription_at + 1
  :: else -> break
  od;
  bulk_quote_participant_bqp_protection_subscription_record.protection_type_advanced_protection_advanced_protection_disabled = bulk_quote_participant_bqp_protection_subscription_value;
  skip
}

/* each byte of Bulk Quote Participant Bqp Protection Subscription set to where it lies, so a field read out of place says so */
inline ramp_bulk_quote_participant_bqp_protection_subscription(bulk_quote_participant_bqp_protection_subscription_record, bulk_quote_participant_bqp_protection_subscription_base) {
  ramp_incoming_messages_header(bulk_quote_participant_bqp_protection_subscription_record.incoming_messages_header, bulk_quote_participant_bqp_protection_subscription_base + 0);
  bulk_quote_participant_bqp_protection_subscription_at = 0;
  do
  :: bulk_quote_participant_bqp_protection_subscription_at < 2 -> bulk_quote_participant_bqp_protection_subscription_record.group[bulk_quote_participant_bqp_protection_subscription_at] = (bulk_quote_participant_bqp_protection_subscription_base + 22 + bulk_quote_participant_bqp_protection_subscription_at + 1) % 256; bulk_quote_participant_bqp_protection_subscription_at = bulk_quote_participant_bqp_protection_subscription_at + 1
  :: else -> break
  od;
  bulk_quote_participant_bqp_protection_subscription_record.protection_type_advanced_protection_advanced_protection_disabled = (bulk_quote_participant_bqp_protection_subscription_base + 24 + 1) % 256;
  skip
}

/* Bulk Quote Participant Bqp Protection Subscription to the wire, 25 bytes from where the cursor stands */
inline encode_bulk_quote_participant_bqp_protection_subscription(bulk_quote_participant_bqp_protection_subscription_record) {
  encode_incoming_messages_header(bulk_quote_participant_bqp_protection_subscription_record.incoming_messages_header);
  bulk_quote_participant_bqp_protection_subscription_at = 0;
  do
  :: bulk_quote_participant_bqp_protection_subscription_at < 2 -> wire[at] = bulk_quote_participant_bqp_protection_subscription_record.group[bulk_quote_participant_bqp_protection_subscription_at]; at = at + 1; bulk_quote_participant_bqp_protection_subscription_at = bulk_quote_participant_bqp_protection_subscription_at + 1
  :: else -> break
  od;
  wire[at] = bulk_quote_participant_bqp_protection_subscription_record.protection_type_advanced_protection_advanced_protection_disabled; at = at + 1;
  skip
}

/* Bulk Quote Participant Bqp Protection Subscription off the wire, 25 bytes from where the cursor stands */
inline decode_bulk_quote_participant_bqp_protection_subscription(bulk_quote_participant_bqp_protection_subscription_record) {
  decode_incoming_messages_header(bulk_quote_participant_bqp_protection_subscription_record.incoming_messages_header);
  bulk_quote_participant_bqp_protection_subscription_at = 0;
  do
  :: bulk_quote_participant_bqp_protection_subscription_at < 2 -> bulk_quote_participant_bqp_protection_subscription_record.group[bulk_quote_participant_bqp_protection_subscription_at] = wire[at]; at = at + 1; bulk_quote_participant_bqp_protection_subscription_at = bulk_quote_participant_bqp_protection_subscription_at + 1
  :: else -> break
  od;
  bulk_quote_participant_bqp_protection_subscription_record.protection_type_advanced_protection_advanced_protection_disabled = wire[at]; at = at + 1;
  skip
}

/* what was read of Bulk Quote Participant Bqp Protection Subscription is what was written, byte for byte */
inline equal_bulk_quote_participant_bqp_protection_subscription(bulk_quote_participant_bqp_protection_subscription_read, bulk_quote_participant_bqp_protection_subscription_written) {
  equal_incoming_messages_header(bulk_quote_participant_bqp_protection_subscription_read.incoming_messages_header, bulk_quote_participant_bqp_protection_subscription_written.incoming_messages_header);
  bulk_quote_participant_bqp_protection_subscription_at = 0;
  do
  :: bulk_quote_participant_bqp_protection_subscription_at < 2 -> assert(bulk_quote_participant_bqp_protection_subscription_read.group[bulk_quote_participant_bqp_protection_subscription_at] == bulk_quote_participant_bqp_protection_subscription_written.group[bulk_quote_participant_bqp_protection_subscription_at]); bulk_quote_participant_bqp_protection_subscription_at = bulk_quote_participant_bqp_protection_subscription_at + 1
  :: else -> break
  od;
  assert(bulk_quote_participant_bqp_protection_subscription_read.protection_type_advanced_protection_advanced_protection_disabled == bulk_quote_participant_bqp_protection_subscription_written.protection_type_advanced_protection_advanced_protection_disabled);
  skip
}

/* ---- Request For Quote: 36 bytes --------------------------------------------- */

typedef RequestForQuote {
  IncomingMessagesHeader incoming_messages_header;
  byte group[2];
  byte instrument[4];
  byte quantity[8]
};

int request_for_quote_at;

/* every byte of Request For Quote set to one value */
inline fill_request_for_quote(request_for_quote_record, request_for_quote_value) {
  fill_incoming_messages_header(request_for_quote_record.incoming_messages_header, request_for_quote_value);
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 2 -> request_for_quote_record.group[request_for_quote_at] = request_for_quote_value; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 4 -> request_for_quote_record.instrument[request_for_quote_at] = request_for_quote_value; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 8 -> request_for_quote_record.quantity[request_for_quote_at] = request_for_quote_value; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Request For Quote set to where it lies, so a field read out of place says so */
inline ramp_request_for_quote(request_for_quote_record, request_for_quote_base) {
  ramp_incoming_messages_header(request_for_quote_record.incoming_messages_header, request_for_quote_base + 0);
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 2 -> request_for_quote_record.group[request_for_quote_at] = (request_for_quote_base + 22 + request_for_quote_at + 1) % 256; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 4 -> request_for_quote_record.instrument[request_for_quote_at] = (request_for_quote_base + 24 + request_for_quote_at + 1) % 256; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 8 -> request_for_quote_record.quantity[request_for_quote_at] = (request_for_quote_base + 28 + request_for_quote_at + 1) % 256; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  skip
}

/* Request For Quote to the wire, 36 bytes from where the cursor stands */
inline encode_request_for_quote(request_for_quote_record) {
  encode_incoming_messages_header(request_for_quote_record.incoming_messages_header);
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 2 -> wire[at] = request_for_quote_record.group[request_for_quote_at]; at = at + 1; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 4 -> wire[at] = request_for_quote_record.instrument[request_for_quote_at]; at = at + 1; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 8 -> wire[at] = request_for_quote_record.quantity[request_for_quote_at]; at = at + 1; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  skip
}

/* Request For Quote off the wire, 36 bytes from where the cursor stands */
inline decode_request_for_quote(request_for_quote_record) {
  decode_incoming_messages_header(request_for_quote_record.incoming_messages_header);
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 2 -> request_for_quote_record.group[request_for_quote_at] = wire[at]; at = at + 1; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 4 -> request_for_quote_record.instrument[request_for_quote_at] = wire[at]; at = at + 1; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 8 -> request_for_quote_record.quantity[request_for_quote_at] = wire[at]; at = at + 1; request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Request For Quote is what was written, byte for byte */
inline equal_request_for_quote(request_for_quote_read, request_for_quote_written) {
  equal_incoming_messages_header(request_for_quote_read.incoming_messages_header, request_for_quote_written.incoming_messages_header);
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 2 -> assert(request_for_quote_read.group[request_for_quote_at] == request_for_quote_written.group[request_for_quote_at]); request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 4 -> assert(request_for_quote_read.instrument[request_for_quote_at] == request_for_quote_written.instrument[request_for_quote_at]); request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  request_for_quote_at = 0;
  do
  :: request_for_quote_at < 8 -> assert(request_for_quote_read.quantity[request_for_quote_at] == request_for_quote_written.quantity[request_for_quote_at]); request_for_quote_at = request_for_quote_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancellation: 36 bytes -------------------------------------------- */

typedef OrderCancellation {
  IncomingMessagesHeader incoming_messages_header;
  byte group[2];
  byte instrument[4];
  byte cancelled_order_id[8]
};

int order_cancellation_at;

/* every byte of Order Cancellation set to one value */
inline fill_order_cancellation(order_cancellation_record, order_cancellation_value) {
  fill_incoming_messages_header(order_cancellation_record.incoming_messages_header, order_cancellation_value);
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 2 -> order_cancellation_record.group[order_cancellation_at] = order_cancellation_value; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 4 -> order_cancellation_record.instrument[order_cancellation_at] = order_cancellation_value; order_cancellation_at = order_cancellation_at + 1
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
  ramp_incoming_messages_header(order_cancellation_record.incoming_messages_header, order_cancellation_base + 0);
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 2 -> order_cancellation_record.group[order_cancellation_at] = (order_cancellation_base + 22 + order_cancellation_at + 1) % 256; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 4 -> order_cancellation_record.instrument[order_cancellation_at] = (order_cancellation_base + 24 + order_cancellation_at + 1) % 256; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 8 -> order_cancellation_record.cancelled_order_id[order_cancellation_at] = (order_cancellation_base + 28 + order_cancellation_at + 1) % 256; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation to the wire, 36 bytes from where the cursor stands */
inline encode_order_cancellation(order_cancellation_record) {
  encode_incoming_messages_header(order_cancellation_record.incoming_messages_header);
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 2 -> wire[at] = order_cancellation_record.group[order_cancellation_at]; at = at + 1; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 4 -> wire[at] = order_cancellation_record.instrument[order_cancellation_at]; at = at + 1; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 8 -> wire[at] = order_cancellation_record.cancelled_order_id[order_cancellation_at]; at = at + 1; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation off the wire, 36 bytes from where the cursor stands */
inline decode_order_cancellation(order_cancellation_record) {
  decode_incoming_messages_header(order_cancellation_record.incoming_messages_header);
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 2 -> order_cancellation_record.group[order_cancellation_at] = wire[at]; at = at + 1; order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 4 -> order_cancellation_record.instrument[order_cancellation_at] = wire[at]; at = at + 1; order_cancellation_at = order_cancellation_at + 1
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
  equal_incoming_messages_header(order_cancellation_read.incoming_messages_header, order_cancellation_written.incoming_messages_header);
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 2 -> assert(order_cancellation_read.group[order_cancellation_at] == order_cancellation_written.group[order_cancellation_at]); order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 4 -> assert(order_cancellation_read.instrument[order_cancellation_at] == order_cancellation_written.instrument[order_cancellation_at]); order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  order_cancellation_at = 0;
  do
  :: order_cancellation_at < 8 -> assert(order_cancellation_read.cancelled_order_id[order_cancellation_at] == order_cancellation_written.cancelled_order_id[order_cancellation_at]); order_cancellation_at = order_cancellation_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

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

/* Incoming Messages Header: encoded, read back, and compared */
proctype check_incoming_messages_header() {
  IncomingMessagesHeader incoming_messages_header_sent;
  IncomingMessagesHeader incoming_messages_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_incoming_messages_header(incoming_messages_header_sent, 0)
  :: pattern == 1 -> fill_incoming_messages_header(incoming_messages_header_sent, 32)
  :: pattern == 2 -> fill_incoming_messages_header(incoming_messages_header_sent, 255)
  :: else -> ramp_incoming_messages_header(incoming_messages_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_incoming_messages_header(incoming_messages_header_sent);
    assert(at == 22);
    at = 0;
    decode_incoming_messages_header(incoming_messages_header_got);
    assert(at == 22);
    equal_incoming_messages_header(incoming_messages_header_got, incoming_messages_header_sent)
  }
}

/* Order Request: encoded, read back, and compared */
proctype check_order_request() {
  OrderRequest order_request_sent;
  OrderRequest order_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_request(order_request_sent, 0)
  :: pattern == 1 -> fill_order_request(order_request_sent, 32)
  :: pattern == 2 -> fill_order_request(order_request_sent, 255)
  :: else -> ramp_order_request(order_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_request(order_request_sent);
    assert(at == 22);
    at = 0;
    decode_order_request(order_request_got);
    assert(at == 22);
    equal_order_request(order_request_got, order_request_sent)
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
    assert(at == 50);
    at = 0;
    decode_owner_data(owner_data_got);
    assert(at == 50);
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
    assert(at == 174);
    at = 0;
    decode_bulk_quote_data(bulk_quote_data_got);
    assert(at == 174);
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
    assert(at == 25);
    at = 0;
    decode_global_cancellation(global_cancellation_got);
    assert(at == 25);
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
    assert(at == 37);
    at = 0;
    decode_user_global_cancellation(user_global_cancellation_got);
    assert(at == 37);
    equal_user_global_cancellation(user_global_cancellation_got, user_global_cancellation_sent)
  }
}

/* Set Global Risk Limits: encoded, read back, and compared */
proctype check_set_global_risk_limits() {
  SetGlobalRiskLimits set_global_risk_limits_sent;
  SetGlobalRiskLimits set_global_risk_limits_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_set_global_risk_limits(set_global_risk_limits_sent, 0)
  :: pattern == 1 -> fill_set_global_risk_limits(set_global_risk_limits_sent, 32)
  :: pattern == 2 -> fill_set_global_risk_limits(set_global_risk_limits_sent, 255)
  :: else -> ramp_set_global_risk_limits(set_global_risk_limits_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_set_global_risk_limits(set_global_risk_limits_sent);
    assert(at == 101);
    at = 0;
    decode_set_global_risk_limits(set_global_risk_limits_got);
    assert(at == 101);
    equal_set_global_risk_limits(set_global_risk_limits_got, set_global_risk_limits_sent)
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
    assert(at == 181);
    at = 0;
    decode_order_entry(order_entry_got);
    assert(at == 181);
    equal_order_entry(order_entry_got, order_entry_sent)
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
    assert(at == 190);
    at = 0;
    decode_order_modification(order_modification_got);
    assert(at == 190);
    equal_order_modification(order_modification_got, order_modification_sent)
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
    assert(at == 50);
    at = 0;
    decode_buying_owner_data(buying_owner_data_got);
    assert(at == 50);
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
    assert(at == 50);
    at = 0;
    decode_selling_owner_data(selling_owner_data_got);
    assert(at == 50);
    equal_selling_owner_data(selling_owner_data_got, selling_owner_data_sent)
  }
}

/* Cross Entry: encoded, read back, and compared */
proctype check_cross_entry() {
  CrossEntry cross_entry_sent;
  CrossEntry cross_entry_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cross_entry(cross_entry_sent, 0)
  :: pattern == 1 -> fill_cross_entry(cross_entry_sent, 32)
  :: pattern == 2 -> fill_cross_entry(cross_entry_sent, 255)
  :: else -> ramp_cross_entry(cross_entry_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cross_entry(cross_entry_sent);
    assert(at == 207);
    at = 0;
    decode_cross_entry(cross_entry_got);
    assert(at == 207);
    equal_cross_entry(cross_entry_got, cross_entry_sent)
  }
}

/* Sail Request For Quote With Side: encoded, read back, and compared */
proctype check_sail_request_for_quote_with_side() {
  SailRequestForQuoteWithSide sail_request_for_quote_with_side_sent;
  SailRequestForQuoteWithSide sail_request_for_quote_with_side_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sail_request_for_quote_with_side(sail_request_for_quote_with_side_sent, 0)
  :: pattern == 1 -> fill_sail_request_for_quote_with_side(sail_request_for_quote_with_side_sent, 32)
  :: pattern == 2 -> fill_sail_request_for_quote_with_side(sail_request_for_quote_with_side_sent, 255)
  :: else -> ramp_sail_request_for_quote_with_side(sail_request_for_quote_with_side_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sail_request_for_quote_with_side(sail_request_for_quote_with_side_sent);
    assert(at == 37);
    at = 0;
    decode_sail_request_for_quote_with_side(sail_request_for_quote_with_side_got);
    assert(at == 37);
    equal_sail_request_for_quote_with_side(sail_request_for_quote_with_side_got, sail_request_for_quote_with_side_sent)
  }
}

/* Bulk Quote Participant Bqp Protection Subscription: encoded, read back, and compared */
proctype check_bulk_quote_participant_bqp_protection_subscription() {
  BulkQuoteParticipantBqpProtectionSubscription bulk_quote_participant_bqp_protection_subscription_sent;
  BulkQuoteParticipantBqpProtectionSubscription bulk_quote_participant_bqp_protection_subscription_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bulk_quote_participant_bqp_protection_subscription(bulk_quote_participant_bqp_protection_subscription_sent, 0)
  :: pattern == 1 -> fill_bulk_quote_participant_bqp_protection_subscription(bulk_quote_participant_bqp_protection_subscription_sent, 32)
  :: pattern == 2 -> fill_bulk_quote_participant_bqp_protection_subscription(bulk_quote_participant_bqp_protection_subscription_sent, 255)
  :: else -> ramp_bulk_quote_participant_bqp_protection_subscription(bulk_quote_participant_bqp_protection_subscription_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bulk_quote_participant_bqp_protection_subscription(bulk_quote_participant_bqp_protection_subscription_sent);
    assert(at == 25);
    at = 0;
    decode_bulk_quote_participant_bqp_protection_subscription(bulk_quote_participant_bqp_protection_subscription_got);
    assert(at == 25);
    equal_bulk_quote_participant_bqp_protection_subscription(bulk_quote_participant_bqp_protection_subscription_got, bulk_quote_participant_bqp_protection_subscription_sent)
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
    assert(at == 36);
    at = 0;
    decode_request_for_quote(request_for_quote_got);
    assert(at == 36);
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
    assert(at == 36);
    at = 0;
    decode_order_cancellation(order_cancellation_got);
    assert(at == 36);
    equal_order_cancellation(order_cancellation_got, order_cancellation_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_heartbeat_response()
  :: run check_user_disconnection()
  :: run check_incoming_messages_header()
  :: run check_order_request()
  :: run check_clearing_data()
  :: run check_owner_data()
  :: run check_bulk_quote_data()
  :: run check_global_cancellation()
  :: run check_user_global_cancellation()
  :: run check_set_global_risk_limits()
  :: run check_order_entry()
  :: run check_order_modification()
  :: run check_buying_clearing_data()
  :: run check_selling_clearing_data()
  :: run check_buying_owner_data()
  :: run check_selling_owner_data()
  :: run check_cross_entry()
  :: run check_sail_request_for_quote_with_side()
  :: run check_bulk_quote_participant_bqp_protection_subscription()
  :: run check_request_for_quote()
  :: run check_order_cancellation()
  fi
}
