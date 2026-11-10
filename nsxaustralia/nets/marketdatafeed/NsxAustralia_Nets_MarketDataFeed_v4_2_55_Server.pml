/*
 * Nation Stock Exchange of Australia NSX Market Data Feed
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
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 891

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Server Packet Header: 3 bytes ------------------------------------------- */

/* Packet header of a packet sent by the server */
typedef ServerPacketHeader {
  byte packet_length[2];
  byte server_packet_type
};

int server_packet_header_at;

/* every byte of Server Packet Header set to one value */
inline fill_server_packet_header(server_packet_header_record, server_packet_header_value) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> server_packet_header_record.packet_length[server_packet_header_at] = server_packet_header_value; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  server_packet_header_record.server_packet_type = server_packet_header_value;
  skip
}

/* each byte of Server Packet Header set to where it lies, so a field read out of place says so */
inline ramp_server_packet_header(server_packet_header_record, server_packet_header_base) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> server_packet_header_record.packet_length[server_packet_header_at] = (server_packet_header_base + 0 + server_packet_header_at + 1) % 256; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  server_packet_header_record.server_packet_type = (server_packet_header_base + 2 + 1) % 256;
  skip
}

/* Server Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_server_packet_header(server_packet_header_record) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> wire[at] = server_packet_header_record.packet_length[server_packet_header_at]; at = at + 1; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = server_packet_header_record.server_packet_type; at = at + 1;
  skip
}

/* Server Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_server_packet_header(server_packet_header_record) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> server_packet_header_record.packet_length[server_packet_header_at] = wire[at]; at = at + 1; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  server_packet_header_record.server_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Server Packet Header is what was written, byte for byte */
inline equal_server_packet_header(server_packet_header_read, server_packet_header_written) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> assert(server_packet_header_read.packet_length[server_packet_header_at] == server_packet_header_written.packet_length[server_packet_header_at]); server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  assert(server_packet_header_read.server_packet_type == server_packet_header_written.server_packet_type);
  skip
}

/* ---- Login Accepted Packet: 30 bytes ----------------------------------------- */

/* The SoupBinTCP server sends a Login Accepted Packet in response to receiving a valid Login Request from the client */
typedef LoginAcceptedPacket {
  byte accepted_session[10];
  byte accepted_sequence_number[20]
};

int login_accepted_packet_at;

/* every byte of Login Accepted Packet set to one value */
inline fill_login_accepted_packet(login_accepted_packet_record, login_accepted_packet_value) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_session[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Accepted Packet set to where it lies, so a field read out of place says so */
inline ramp_login_accepted_packet(login_accepted_packet_record, login_accepted_packet_base) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_session[login_accepted_packet_at] = (login_accepted_packet_base + 0 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = (login_accepted_packet_base + 10 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet to the wire, 30 bytes from where the cursor stands */
inline encode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> wire[at] = login_accepted_packet_record.accepted_session[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> wire[at] = login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet off the wire, 30 bytes from where the cursor stands */
inline decode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_session[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Accepted Packet is what was written, byte for byte */
inline equal_login_accepted_packet(login_accepted_packet_read, login_accepted_packet_written) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> assert(login_accepted_packet_read.accepted_session[login_accepted_packet_at] == login_accepted_packet_written.accepted_session[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> assert(login_accepted_packet_read.accepted_sequence_number[login_accepted_packet_at] == login_accepted_packet_written.accepted_sequence_number[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Rejected Packet: 1 bytes ------------------------------------------ */

/* The SoupBinTCP server sends this packet in response to an invalid Login Request Packet from the client */
typedef LoginRejectedPacket {
  byte reject_reason_code
};

/* every byte of Login Rejected Packet set to one value */
inline fill_login_rejected_packet(login_rejected_packet_record, login_rejected_packet_value) {
  login_rejected_packet_record.reject_reason_code = login_rejected_packet_value;
  skip
}

/* each byte of Login Rejected Packet set to where it lies, so a field read out of place says so */
inline ramp_login_rejected_packet(login_rejected_packet_record, login_rejected_packet_base) {
  login_rejected_packet_record.reject_reason_code = (login_rejected_packet_base + 0 + 1) % 256;
  skip
}

/* Login Rejected Packet to the wire, 1 bytes from where the cursor stands */
inline encode_login_rejected_packet(login_rejected_packet_record) {
  wire[at] = login_rejected_packet_record.reject_reason_code; at = at + 1;
  skip
}

/* Login Rejected Packet off the wire, 1 bytes from where the cursor stands */
inline decode_login_rejected_packet(login_rejected_packet_record) {
  login_rejected_packet_record.reject_reason_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Rejected Packet is what was written, byte for byte */
inline equal_login_rejected_packet(login_rejected_packet_read, login_rejected_packet_written) {
  assert(login_rejected_packet_read.reject_reason_code == login_rejected_packet_written.reject_reason_code);
  skip
}

/* ---- Timestamp Message: 8 bytes ---------------------------------------------- */

/* This message is sent to provide the time since Epoch. It should be used in combination with the Timestamp field of individual messages to determine the exact time for each message. */
typedef TimestampMessage {
  byte nanosecond[8]
};

int timestamp_message_at;

/* every byte of Timestamp Message set to one value */
inline fill_timestamp_message(timestamp_message_record, timestamp_message_value) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 8 -> timestamp_message_record.nanosecond[timestamp_message_at] = timestamp_message_value; timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Timestamp Message set to where it lies, so a field read out of place says so */
inline ramp_timestamp_message(timestamp_message_record, timestamp_message_base) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 8 -> timestamp_message_record.nanosecond[timestamp_message_at] = (timestamp_message_base + 0 + timestamp_message_at + 1) % 256; timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp Message to the wire, 8 bytes from where the cursor stands */
inline encode_timestamp_message(timestamp_message_record) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 8 -> wire[at] = timestamp_message_record.nanosecond[timestamp_message_at]; at = at + 1; timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp Message off the wire, 8 bytes from where the cursor stands */
inline decode_timestamp_message(timestamp_message_record) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 8 -> timestamp_message_record.nanosecond[timestamp_message_at] = wire[at]; at = at + 1; timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Timestamp Message is what was written, byte for byte */
inline equal_timestamp_message(timestamp_message_read, timestamp_message_written) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 8 -> assert(timestamp_message_read.nanosecond[timestamp_message_at] == timestamp_message_written.nanosecond[timestamp_message_at]); timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 61 bytes ------------------------------------------ */

/* This message will be sent to provide information about events that are scheduled or triggered by the system. Events may occur at Orderbook, Board, Board+Product or System level. */
typedef SystemEventMessage {
  byte timestamp[4];
  byte group[20];
  byte product[12];
  byte orderbook[4];
  byte event_code[12];
  byte event_status;
  byte scheduled_time[8]
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 20 -> system_event_message_record.group[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 12 -> system_event_message_record.product[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.orderbook[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 12 -> system_event_message_record.event_code[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_status = system_event_message_value;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.scheduled_time[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 20 -> system_event_message_record.group[system_event_message_at] = (system_event_message_base + 4 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 12 -> system_event_message_record.product[system_event_message_at] = (system_event_message_base + 24 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.orderbook[system_event_message_at] = (system_event_message_base + 36 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 12 -> system_event_message_record.event_code[system_event_message_at] = (system_event_message_base + 40 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_status = (system_event_message_base + 52 + 1) % 256;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.scheduled_time[system_event_message_at] = (system_event_message_base + 53 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message to the wire, 61 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 20 -> wire[at] = system_event_message_record.group[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 12 -> wire[at] = system_event_message_record.product[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.orderbook[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 12 -> wire[at] = system_event_message_record.event_code[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_status; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.scheduled_time[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message off the wire, 61 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 20 -> system_event_message_record.group[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 12 -> system_event_message_record.product[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.orderbook[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 12 -> system_event_message_record.event_code[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_status = wire[at]; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.scheduled_time[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 20 -> assert(system_event_message_read.group[system_event_message_at] == system_event_message_written.group[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 12 -> assert(system_event_message_read.product[system_event_message_at] == system_event_message_written.product[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.orderbook[system_event_message_at] == system_event_message_written.orderbook[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 12 -> assert(system_event_message_read.event_code[system_event_message_at] == system_event_message_written.event_code[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_status == system_event_message_written.event_status);
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.scheduled_time[system_event_message_at] == system_event_message_written.scheduled_time[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price Tick Size Message: 24 bytes --------------------------------------- */

/* This message provides the price ticks (steps) for the orderbooks in the system. It should be used as a lookup from Orderbook Directory [R] messages. */
typedef PriceTickSizeMessage {
  byte timestamp[4];
  byte tick_size_table_id[4];
  byte tick_size[8];
  byte price_start[8]
};

int price_tick_size_message_at;

/* every byte of Price Tick Size Message set to one value */
inline fill_price_tick_size_message(price_tick_size_message_record, price_tick_size_message_value) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.timestamp[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.tick_size_table_id[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 8 -> price_tick_size_message_record.tick_size[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 8 -> price_tick_size_message_record.price_start[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Tick Size Message set to where it lies, so a field read out of place says so */
inline ramp_price_tick_size_message(price_tick_size_message_record, price_tick_size_message_base) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.timestamp[price_tick_size_message_at] = (price_tick_size_message_base + 0 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.tick_size_table_id[price_tick_size_message_at] = (price_tick_size_message_base + 4 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 8 -> price_tick_size_message_record.tick_size[price_tick_size_message_at] = (price_tick_size_message_base + 8 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 8 -> price_tick_size_message_record.price_start[price_tick_size_message_at] = (price_tick_size_message_base + 16 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Tick Size Message to the wire, 24 bytes from where the cursor stands */
inline encode_price_tick_size_message(price_tick_size_message_record) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> wire[at] = price_tick_size_message_record.timestamp[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> wire[at] = price_tick_size_message_record.tick_size_table_id[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 8 -> wire[at] = price_tick_size_message_record.tick_size[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 8 -> wire[at] = price_tick_size_message_record.price_start[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Tick Size Message off the wire, 24 bytes from where the cursor stands */
inline decode_price_tick_size_message(price_tick_size_message_record) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.timestamp[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.tick_size_table_id[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 8 -> price_tick_size_message_record.tick_size[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 8 -> price_tick_size_message_record.price_start[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Tick Size Message is what was written, byte for byte */
inline equal_price_tick_size_message(price_tick_size_message_read, price_tick_size_message_written) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> assert(price_tick_size_message_read.timestamp[price_tick_size_message_at] == price_tick_size_message_written.timestamp[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> assert(price_tick_size_message_read.tick_size_table_id[price_tick_size_message_at] == price_tick_size_message_written.tick_size_table_id[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 8 -> assert(price_tick_size_message_read.tick_size[price_tick_size_message_at] == price_tick_size_message_written.tick_size[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 8 -> assert(price_tick_size_message_read.price_start[price_tick_size_message_at] == price_tick_size_message_written.price_start[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quantity Tick Size Message: 24 bytes ------------------------------------ */

/* This message provides the quantity ticks (steps) for the orderbooks in the system. It should be used as a lookup from Orderbook Directory [R] messages. */
typedef QuantityTickSizeMessage {
  byte timestamp[4];
  byte tick_size_table_id[4];
  byte tick_size[8];
  byte quantity_start[8]
};

int quantity_tick_size_message_at;

/* every byte of Quantity Tick Size Message set to one value */
inline fill_quantity_tick_size_message(quantity_tick_size_message_record, quantity_tick_size_message_value) {
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.timestamp[quantity_tick_size_message_at] = quantity_tick_size_message_value; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.tick_size_table_id[quantity_tick_size_message_at] = quantity_tick_size_message_value; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.tick_size[quantity_tick_size_message_at] = quantity_tick_size_message_value; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.quantity_start[quantity_tick_size_message_at] = quantity_tick_size_message_value; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quantity Tick Size Message set to where it lies, so a field read out of place says so */
inline ramp_quantity_tick_size_message(quantity_tick_size_message_record, quantity_tick_size_message_base) {
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.timestamp[quantity_tick_size_message_at] = (quantity_tick_size_message_base + 0 + quantity_tick_size_message_at + 1) % 256; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.tick_size_table_id[quantity_tick_size_message_at] = (quantity_tick_size_message_base + 4 + quantity_tick_size_message_at + 1) % 256; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.tick_size[quantity_tick_size_message_at] = (quantity_tick_size_message_base + 8 + quantity_tick_size_message_at + 1) % 256; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.quantity_start[quantity_tick_size_message_at] = (quantity_tick_size_message_base + 16 + quantity_tick_size_message_at + 1) % 256; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quantity Tick Size Message to the wire, 24 bytes from where the cursor stands */
inline encode_quantity_tick_size_message(quantity_tick_size_message_record) {
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> wire[at] = quantity_tick_size_message_record.timestamp[quantity_tick_size_message_at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> wire[at] = quantity_tick_size_message_record.tick_size_table_id[quantity_tick_size_message_at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> wire[at] = quantity_tick_size_message_record.tick_size[quantity_tick_size_message_at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> wire[at] = quantity_tick_size_message_record.quantity_start[quantity_tick_size_message_at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quantity Tick Size Message off the wire, 24 bytes from where the cursor stands */
inline decode_quantity_tick_size_message(quantity_tick_size_message_record) {
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.timestamp[quantity_tick_size_message_at] = wire[at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> quantity_tick_size_message_record.tick_size_table_id[quantity_tick_size_message_at] = wire[at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.tick_size[quantity_tick_size_message_at] = wire[at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> quantity_tick_size_message_record.quantity_start[quantity_tick_size_message_at] = wire[at]; at = at + 1; quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quantity Tick Size Message is what was written, byte for byte */
inline equal_quantity_tick_size_message(quantity_tick_size_message_read, quantity_tick_size_message_written) {
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> assert(quantity_tick_size_message_read.timestamp[quantity_tick_size_message_at] == quantity_tick_size_message_written.timestamp[quantity_tick_size_message_at]); quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 4 -> assert(quantity_tick_size_message_read.tick_size_table_id[quantity_tick_size_message_at] == quantity_tick_size_message_written.tick_size_table_id[quantity_tick_size_message_at]); quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> assert(quantity_tick_size_message_read.tick_size[quantity_tick_size_message_at] == quantity_tick_size_message_written.tick_size[quantity_tick_size_message_at]); quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  quantity_tick_size_message_at = 0;
  do
  :: quantity_tick_size_message_at < 8 -> assert(quantity_tick_size_message_read.quantity_start[quantity_tick_size_message_at] == quantity_tick_size_message_written.quantity_start[quantity_tick_size_message_at]); quantity_tick_size_message_at = quantity_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Orderbook Directory Message: 320 bytes ---------------------------------- */

/* Orderbook Directory Messages are transmitted during the reference data spin. Static data messages are sent at the beginning of the feed and contain exchange reference information. */
typedef OrderbookDirectoryMessage {
  byte timestamp[4];
  byte orderbook[4];
  byte isin[12];
  byte security_code[100];
  byte security_name[100];
  byte currency[3];
  byte board[20];
  byte product[12];
  byte minimum_quantity[8];
  byte quantity_tick_size_table_id[4];
  byte quantity_decimals[4];
  byte price_tick_size_table_id[4];
  byte price_decimals[4];
  byte listing[8];
  byte expiry[8];
  byte asset_type;
  byte settle_date[4];
  byte reference_alpha_12[12];
  byte remarks[8]
};

int orderbook_directory_message_at;

/* every byte of Orderbook Directory Message set to one value */
inline fill_orderbook_directory_message(orderbook_directory_message_record, orderbook_directory_message_value) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.timestamp[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.orderbook[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.isin[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 100 -> orderbook_directory_message_record.security_code[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 100 -> orderbook_directory_message_record.security_name[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> orderbook_directory_message_record.currency[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 20 -> orderbook_directory_message_record.board[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.product[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.minimum_quantity[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_tick_size_table_id[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_decimals[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_tick_size_table_id[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_decimals[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.listing[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.expiry[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.asset_type = orderbook_directory_message_value;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.settle_date[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.reference_alpha_12[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.remarks[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Orderbook Directory Message set to where it lies, so a field read out of place says so */
inline ramp_orderbook_directory_message(orderbook_directory_message_record, orderbook_directory_message_base) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.timestamp[orderbook_directory_message_at] = (orderbook_directory_message_base + 0 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.orderbook[orderbook_directory_message_at] = (orderbook_directory_message_base + 4 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.isin[orderbook_directory_message_at] = (orderbook_directory_message_base + 8 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 100 -> orderbook_directory_message_record.security_code[orderbook_directory_message_at] = (orderbook_directory_message_base + 20 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 100 -> orderbook_directory_message_record.security_name[orderbook_directory_message_at] = (orderbook_directory_message_base + 120 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> orderbook_directory_message_record.currency[orderbook_directory_message_at] = (orderbook_directory_message_base + 220 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 20 -> orderbook_directory_message_record.board[orderbook_directory_message_at] = (orderbook_directory_message_base + 223 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.product[orderbook_directory_message_at] = (orderbook_directory_message_base + 243 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.minimum_quantity[orderbook_directory_message_at] = (orderbook_directory_message_base + 255 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_tick_size_table_id[orderbook_directory_message_at] = (orderbook_directory_message_base + 263 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_decimals[orderbook_directory_message_at] = (orderbook_directory_message_base + 267 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_tick_size_table_id[orderbook_directory_message_at] = (orderbook_directory_message_base + 271 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_decimals[orderbook_directory_message_at] = (orderbook_directory_message_base + 275 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.listing[orderbook_directory_message_at] = (orderbook_directory_message_base + 279 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.expiry[orderbook_directory_message_at] = (orderbook_directory_message_base + 287 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.asset_type = (orderbook_directory_message_base + 295 + 1) % 256;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.settle_date[orderbook_directory_message_at] = (orderbook_directory_message_base + 296 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.reference_alpha_12[orderbook_directory_message_at] = (orderbook_directory_message_base + 300 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.remarks[orderbook_directory_message_at] = (orderbook_directory_message_base + 312 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orderbook Directory Message to the wire, 320 bytes from where the cursor stands */
inline encode_orderbook_directory_message(orderbook_directory_message_record) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.timestamp[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.orderbook[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> wire[at] = orderbook_directory_message_record.isin[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 100 -> wire[at] = orderbook_directory_message_record.security_code[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 100 -> wire[at] = orderbook_directory_message_record.security_name[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> wire[at] = orderbook_directory_message_record.currency[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 20 -> wire[at] = orderbook_directory_message_record.board[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> wire[at] = orderbook_directory_message_record.product[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> wire[at] = orderbook_directory_message_record.minimum_quantity[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.quantity_tick_size_table_id[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.quantity_decimals[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.price_tick_size_table_id[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.price_decimals[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> wire[at] = orderbook_directory_message_record.listing[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> wire[at] = orderbook_directory_message_record.expiry[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = orderbook_directory_message_record.asset_type; at = at + 1;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.settle_date[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> wire[at] = orderbook_directory_message_record.reference_alpha_12[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> wire[at] = orderbook_directory_message_record.remarks[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orderbook Directory Message off the wire, 320 bytes from where the cursor stands */
inline decode_orderbook_directory_message(orderbook_directory_message_record) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.timestamp[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.orderbook[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.isin[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 100 -> orderbook_directory_message_record.security_code[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 100 -> orderbook_directory_message_record.security_name[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> orderbook_directory_message_record.currency[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 20 -> orderbook_directory_message_record.board[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.product[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.minimum_quantity[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_tick_size_table_id[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.quantity_decimals[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_tick_size_table_id[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_decimals[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.listing[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.expiry[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_record.asset_type = wire[at]; at = at + 1;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.settle_date[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.reference_alpha_12[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> orderbook_directory_message_record.remarks[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Orderbook Directory Message is what was written, byte for byte */
inline equal_orderbook_directory_message(orderbook_directory_message_read, orderbook_directory_message_written) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.timestamp[orderbook_directory_message_at] == orderbook_directory_message_written.timestamp[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.orderbook[orderbook_directory_message_at] == orderbook_directory_message_written.orderbook[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> assert(orderbook_directory_message_read.isin[orderbook_directory_message_at] == orderbook_directory_message_written.isin[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 100 -> assert(orderbook_directory_message_read.security_code[orderbook_directory_message_at] == orderbook_directory_message_written.security_code[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 100 -> assert(orderbook_directory_message_read.security_name[orderbook_directory_message_at] == orderbook_directory_message_written.security_name[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 3 -> assert(orderbook_directory_message_read.currency[orderbook_directory_message_at] == orderbook_directory_message_written.currency[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 20 -> assert(orderbook_directory_message_read.board[orderbook_directory_message_at] == orderbook_directory_message_written.board[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> assert(orderbook_directory_message_read.product[orderbook_directory_message_at] == orderbook_directory_message_written.product[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> assert(orderbook_directory_message_read.minimum_quantity[orderbook_directory_message_at] == orderbook_directory_message_written.minimum_quantity[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.quantity_tick_size_table_id[orderbook_directory_message_at] == orderbook_directory_message_written.quantity_tick_size_table_id[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.quantity_decimals[orderbook_directory_message_at] == orderbook_directory_message_written.quantity_decimals[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.price_tick_size_table_id[orderbook_directory_message_at] == orderbook_directory_message_written.price_tick_size_table_id[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.price_decimals[orderbook_directory_message_at] == orderbook_directory_message_written.price_decimals[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> assert(orderbook_directory_message_read.listing[orderbook_directory_message_at] == orderbook_directory_message_written.listing[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> assert(orderbook_directory_message_read.expiry[orderbook_directory_message_at] == orderbook_directory_message_written.expiry[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  assert(orderbook_directory_message_read.asset_type == orderbook_directory_message_written.asset_type);
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.settle_date[orderbook_directory_message_at] == orderbook_directory_message_written.settle_date[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> assert(orderbook_directory_message_read.reference_alpha_12[orderbook_directory_message_at] == orderbook_directory_message_written.reference_alpha_12[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 8 -> assert(orderbook_directory_message_read.remarks[orderbook_directory_message_at] == orderbook_directory_message_written.remarks[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Orderbook Trading Action Message: 10 bytes ------------------------------ */

/* This message indicates the current trading state of an orderbook. */
typedef OrderbookTradingActionMessage {
  byte timestamp[4];
  byte orderbook[4];
  byte trading_state;
  byte reason
};

int orderbook_trading_action_message_at;

/* every byte of Orderbook Trading Action Message set to one value */
inline fill_orderbook_trading_action_message(orderbook_trading_action_message_record, orderbook_trading_action_message_value) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.timestamp[orderbook_trading_action_message_at] = orderbook_trading_action_message_value; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.orderbook[orderbook_trading_action_message_at] = orderbook_trading_action_message_value; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_record.trading_state = orderbook_trading_action_message_value;
  orderbook_trading_action_message_record.reason = orderbook_trading_action_message_value;
  skip
}

/* each byte of Orderbook Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_orderbook_trading_action_message(orderbook_trading_action_message_record, orderbook_trading_action_message_base) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.timestamp[orderbook_trading_action_message_at] = (orderbook_trading_action_message_base + 0 + orderbook_trading_action_message_at + 1) % 256; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.orderbook[orderbook_trading_action_message_at] = (orderbook_trading_action_message_base + 4 + orderbook_trading_action_message_at + 1) % 256; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_record.trading_state = (orderbook_trading_action_message_base + 8 + 1) % 256;
  orderbook_trading_action_message_record.reason = (orderbook_trading_action_message_base + 9 + 1) % 256;
  skip
}

/* Orderbook Trading Action Message to the wire, 10 bytes from where the cursor stands */
inline encode_orderbook_trading_action_message(orderbook_trading_action_message_record) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> wire[at] = orderbook_trading_action_message_record.timestamp[orderbook_trading_action_message_at]; at = at + 1; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> wire[at] = orderbook_trading_action_message_record.orderbook[orderbook_trading_action_message_at]; at = at + 1; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = orderbook_trading_action_message_record.trading_state; at = at + 1;
  wire[at] = orderbook_trading_action_message_record.reason; at = at + 1;
  skip
}

/* Orderbook Trading Action Message off the wire, 10 bytes from where the cursor stands */
inline decode_orderbook_trading_action_message(orderbook_trading_action_message_record) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.timestamp[orderbook_trading_action_message_at] = wire[at]; at = at + 1; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> orderbook_trading_action_message_record.orderbook[orderbook_trading_action_message_at] = wire[at]; at = at + 1; orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_record.trading_state = wire[at]; at = at + 1;
  orderbook_trading_action_message_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Orderbook Trading Action Message is what was written, byte for byte */
inline equal_orderbook_trading_action_message(orderbook_trading_action_message_read, orderbook_trading_action_message_written) {
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> assert(orderbook_trading_action_message_read.timestamp[orderbook_trading_action_message_at] == orderbook_trading_action_message_written.timestamp[orderbook_trading_action_message_at]); orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  orderbook_trading_action_message_at = 0;
  do
  :: orderbook_trading_action_message_at < 4 -> assert(orderbook_trading_action_message_read.orderbook[orderbook_trading_action_message_at] == orderbook_trading_action_message_written.orderbook[orderbook_trading_action_message_at]); orderbook_trading_action_message_at = orderbook_trading_action_message_at + 1
  :: else -> break
  od;
  assert(orderbook_trading_action_message_read.trading_state == orderbook_trading_action_message_written.trading_state);
  assert(orderbook_trading_action_message_read.reason == orderbook_trading_action_message_written.reason);
  skip
}

/* ---- Orderbook Attribute Message: 18 bytes ----------------------------------- */

/* This message provides dynamic reference values for an orderbook. */
typedef OrderbookAttributeMessage {
  byte timestamp[4];
  byte orderbook[4];
  byte attribute_value[8];
  byte attribute_type;
  byte reason
};

int orderbook_attribute_message_at;

/* every byte of Orderbook Attribute Message set to one value */
inline fill_orderbook_attribute_message(orderbook_attribute_message_record, orderbook_attribute_message_value) {
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 4 -> orderbook_attribute_message_record.timestamp[orderbook_attribute_message_at] = orderbook_attribute_message_value; orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 4 -> orderbook_attribute_message_record.orderbook[orderbook_attribute_message_at] = orderbook_attribute_message_value; orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 8 -> orderbook_attribute_message_record.attribute_value[orderbook_attribute_message_at] = orderbook_attribute_message_value; orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  orderbook_attribute_message_record.attribute_type = orderbook_attribute_message_value;
  orderbook_attribute_message_record.reason = orderbook_attribute_message_value;
  skip
}

/* each byte of Orderbook Attribute Message set to where it lies, so a field read out of place says so */
inline ramp_orderbook_attribute_message(orderbook_attribute_message_record, orderbook_attribute_message_base) {
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 4 -> orderbook_attribute_message_record.timestamp[orderbook_attribute_message_at] = (orderbook_attribute_message_base + 0 + orderbook_attribute_message_at + 1) % 256; orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 4 -> orderbook_attribute_message_record.orderbook[orderbook_attribute_message_at] = (orderbook_attribute_message_base + 4 + orderbook_attribute_message_at + 1) % 256; orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 8 -> orderbook_attribute_message_record.attribute_value[orderbook_attribute_message_at] = (orderbook_attribute_message_base + 8 + orderbook_attribute_message_at + 1) % 256; orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  orderbook_attribute_message_record.attribute_type = (orderbook_attribute_message_base + 16 + 1) % 256;
  orderbook_attribute_message_record.reason = (orderbook_attribute_message_base + 17 + 1) % 256;
  skip
}

/* Orderbook Attribute Message to the wire, 18 bytes from where the cursor stands */
inline encode_orderbook_attribute_message(orderbook_attribute_message_record) {
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 4 -> wire[at] = orderbook_attribute_message_record.timestamp[orderbook_attribute_message_at]; at = at + 1; orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 4 -> wire[at] = orderbook_attribute_message_record.orderbook[orderbook_attribute_message_at]; at = at + 1; orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 8 -> wire[at] = orderbook_attribute_message_record.attribute_value[orderbook_attribute_message_at]; at = at + 1; orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  wire[at] = orderbook_attribute_message_record.attribute_type; at = at + 1;
  wire[at] = orderbook_attribute_message_record.reason; at = at + 1;
  skip
}

/* Orderbook Attribute Message off the wire, 18 bytes from where the cursor stands */
inline decode_orderbook_attribute_message(orderbook_attribute_message_record) {
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 4 -> orderbook_attribute_message_record.timestamp[orderbook_attribute_message_at] = wire[at]; at = at + 1; orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 4 -> orderbook_attribute_message_record.orderbook[orderbook_attribute_message_at] = wire[at]; at = at + 1; orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 8 -> orderbook_attribute_message_record.attribute_value[orderbook_attribute_message_at] = wire[at]; at = at + 1; orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  orderbook_attribute_message_record.attribute_type = wire[at]; at = at + 1;
  orderbook_attribute_message_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Orderbook Attribute Message is what was written, byte for byte */
inline equal_orderbook_attribute_message(orderbook_attribute_message_read, orderbook_attribute_message_written) {
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 4 -> assert(orderbook_attribute_message_read.timestamp[orderbook_attribute_message_at] == orderbook_attribute_message_written.timestamp[orderbook_attribute_message_at]); orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 4 -> assert(orderbook_attribute_message_read.orderbook[orderbook_attribute_message_at] == orderbook_attribute_message_written.orderbook[orderbook_attribute_message_at]); orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  orderbook_attribute_message_at = 0;
  do
  :: orderbook_attribute_message_at < 8 -> assert(orderbook_attribute_message_read.attribute_value[orderbook_attribute_message_at] == orderbook_attribute_message_written.attribute_value[orderbook_attribute_message_at]); orderbook_attribute_message_at = orderbook_attribute_message_at + 1
  :: else -> break
  od;
  assert(orderbook_attribute_message_read.attribute_type == orderbook_attribute_message_written.attribute_type);
  assert(orderbook_attribute_message_read.reason == orderbook_attribute_message_written.reason);
  skip
}

/* ---- Firm Directory Message: 38 bytes ---------------------------------------- */

/* This message provides reference information about system participants. */
typedef FirmDirectoryMessage {
  byte timestamp[4];
  byte firm_id[4];
  byte firm_code[30]
};

int firm_directory_message_at;

/* every byte of Firm Directory Message set to one value */
inline fill_firm_directory_message(firm_directory_message_record, firm_directory_message_value) {
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 4 -> firm_directory_message_record.timestamp[firm_directory_message_at] = firm_directory_message_value; firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 4 -> firm_directory_message_record.firm_id[firm_directory_message_at] = firm_directory_message_value; firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 30 -> firm_directory_message_record.firm_code[firm_directory_message_at] = firm_directory_message_value; firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Firm Directory Message set to where it lies, so a field read out of place says so */
inline ramp_firm_directory_message(firm_directory_message_record, firm_directory_message_base) {
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 4 -> firm_directory_message_record.timestamp[firm_directory_message_at] = (firm_directory_message_base + 0 + firm_directory_message_at + 1) % 256; firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 4 -> firm_directory_message_record.firm_id[firm_directory_message_at] = (firm_directory_message_base + 4 + firm_directory_message_at + 1) % 256; firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 30 -> firm_directory_message_record.firm_code[firm_directory_message_at] = (firm_directory_message_base + 8 + firm_directory_message_at + 1) % 256; firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Firm Directory Message to the wire, 38 bytes from where the cursor stands */
inline encode_firm_directory_message(firm_directory_message_record) {
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 4 -> wire[at] = firm_directory_message_record.timestamp[firm_directory_message_at]; at = at + 1; firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 4 -> wire[at] = firm_directory_message_record.firm_id[firm_directory_message_at]; at = at + 1; firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 30 -> wire[at] = firm_directory_message_record.firm_code[firm_directory_message_at]; at = at + 1; firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Firm Directory Message off the wire, 38 bytes from where the cursor stands */
inline decode_firm_directory_message(firm_directory_message_record) {
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 4 -> firm_directory_message_record.timestamp[firm_directory_message_at] = wire[at]; at = at + 1; firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 4 -> firm_directory_message_record.firm_id[firm_directory_message_at] = wire[at]; at = at + 1; firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 30 -> firm_directory_message_record.firm_code[firm_directory_message_at] = wire[at]; at = at + 1; firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Firm Directory Message is what was written, byte for byte */
inline equal_firm_directory_message(firm_directory_message_read, firm_directory_message_written) {
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 4 -> assert(firm_directory_message_read.timestamp[firm_directory_message_at] == firm_directory_message_written.timestamp[firm_directory_message_at]); firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 4 -> assert(firm_directory_message_read.firm_id[firm_directory_message_at] == firm_directory_message_written.firm_id[firm_directory_message_at]); firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  firm_directory_message_at = 0;
  do
  :: firm_directory_message_at < 30 -> assert(firm_directory_message_read.firm_code[firm_directory_message_at] == firm_directory_message_written.firm_code[firm_directory_message_at]); firm_directory_message_at = firm_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Message: 37 bytes --------------------------------------------- */

/* This message is sent when an order is added to the orderbook. */
typedef AddOrderMessage {
  byte timestamp[4];
  byte order_number[8];
  byte order_verb;
  byte quantity[8];
  byte orderbook[4];
  byte price[8];
  byte firm_id[4]
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.timestamp[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_number[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_verb = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.quantity[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.orderbook[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.firm_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.timestamp[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_number[add_order_message_at] = (add_order_message_base + 4 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_verb = (add_order_message_base + 12 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.quantity[add_order_message_at] = (add_order_message_base + 13 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.orderbook[add_order_message_at] = (add_order_message_base + 21 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 25 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.firm_id[add_order_message_at] = (add_order_message_base + 33 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message to the wire, 37 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.timestamp[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.order_number[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.order_verb; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.quantity[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.orderbook[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.firm_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message off the wire, 37 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.timestamp[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_number[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_verb = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.quantity[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.orderbook[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.firm_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.timestamp[add_order_message_at] == add_order_message_written.timestamp[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.order_number[add_order_message_at] == add_order_message_written.order_number[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.order_verb == add_order_message_written.order_verb);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.quantity[add_order_message_at] == add_order_message_written.quantity[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.orderbook[add_order_message_at] == add_order_message_written.orderbook[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.firm_id[add_order_message_at] == add_order_message_written.firm_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message: 33 bytes ---------------------------------------- */

/* This message is sent when an order on the book is executed in whole or in part. */
typedef OrderExecutedMessage {
  byte timestamp[4];
  byte order_number[8];
  byte executed_quantity[8];
  byte match_number[8];
  byte printable;
  byte aggressor_firm_id[4]
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.timestamp[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.printable = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.aggressor_firm_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.timestamp[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_number[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = (order_executed_message_base + 20 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.printable = (order_executed_message_base + 28 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.aggressor_firm_id[order_executed_message_at] = (order_executed_message_base + 29 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 33 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.timestamp[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.match_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.printable; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.aggressor_firm_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 33 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.timestamp[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.printable = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.aggressor_firm_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.timestamp[order_executed_message_at] == order_executed_message_written.timestamp[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_number[order_executed_message_at] == order_executed_message_written.order_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.match_number[order_executed_message_at] == order_executed_message_written.match_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.printable == order_executed_message_written.printable);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.aggressor_firm_id[order_executed_message_at] == order_executed_message_written.aggressor_firm_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed With Price Message: 37 bytes ----------------------------- */

/* This message is sent when an order on the book is executed in whole or in part at a negotiated price different from the order price. */
typedef OrderExecutedWithPriceMessage {
  byte timestamp[4];
  byte order_number[8];
  byte executed_quantity[8];
  byte match_number[8];
  byte printable;
  byte execution_price[8]
};

int order_executed_with_price_message_at;

/* every byte of Order Executed With Price Message set to one value */
inline fill_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_value) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.printable = order_executed_with_price_message_value;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed With Price Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_base) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 0 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 4 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 12 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 20 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.printable = (order_executed_with_price_message_base + 28 + 1) % 256;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 29 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message to the wire, 37 bytes from where the cursor stands */
inline encode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.order_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.match_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_with_price_message_record.printable; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message off the wire, 37 bytes from where the cursor stands */
inline decode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.printable = wire[at]; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed With Price Message is what was written, byte for byte */
inline equal_order_executed_with_price_message(order_executed_with_price_message_read, order_executed_with_price_message_written) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.timestamp[order_executed_with_price_message_at] == order_executed_with_price_message_written.timestamp[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.order_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.order_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.executed_quantity[order_executed_with_price_message_at] == order_executed_with_price_message_written.executed_quantity[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.match_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.match_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  assert(order_executed_with_price_message_read.printable == order_executed_with_price_message_written.printable);
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.execution_price[order_executed_with_price_message_at] == order_executed_with_price_message_written.execution_price[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Broken Trade Message: 13 bytes ------------------------------------------ */

/* This message is sent when a trade is cancelled. */
typedef BrokenTradeMessage {
  byte timestamp[4];
  byte match_number[8];
  byte reason
};

int broken_trade_message_at;

/* every byte of Broken Trade Message set to one value */
inline fill_broken_trade_message(broken_trade_message_record, broken_trade_message_value) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.timestamp[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.reason = broken_trade_message_value;
  skip
}

/* each byte of Broken Trade Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_message(broken_trade_message_record, broken_trade_message_base) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.timestamp[broken_trade_message_at] = (broken_trade_message_base + 0 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = (broken_trade_message_base + 4 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.reason = (broken_trade_message_base + 12 + 1) % 256;
  skip
}

/* Broken Trade Message to the wire, 13 bytes from where the cursor stands */
inline encode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> wire[at] = broken_trade_message_record.timestamp[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.match_number[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = broken_trade_message_record.reason; at = at + 1;
  skip
}

/* Broken Trade Message off the wire, 13 bytes from where the cursor stands */
inline decode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.timestamp[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Broken Trade Message is what was written, byte for byte */
inline equal_broken_trade_message(broken_trade_message_read, broken_trade_message_written) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> assert(broken_trade_message_read.timestamp[broken_trade_message_at] == broken_trade_message_written.timestamp[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.match_number[broken_trade_message_at] == broken_trade_message_written.match_number[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  assert(broken_trade_message_read.reason == broken_trade_message_written.reason);
  skip
}

/* ---- Order Delete Message: 12 bytes ------------------------------------------ */

/* This message indicates when an order has been removed from the orderbook. */
typedef OrderDeleteMessage {
  byte timestamp[4];
  byte order_number[8]
};

int order_delete_message_at;

/* every byte of Order Delete Message set to one value */
inline fill_order_delete_message(order_delete_message_record, order_delete_message_value) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.timestamp[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_number[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Delete Message set to where it lies, so a field read out of place says so */
inline ramp_order_delete_message(order_delete_message_record, order_delete_message_base) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.timestamp[order_delete_message_at] = (order_delete_message_base + 0 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_number[order_delete_message_at] = (order_delete_message_base + 4 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message to the wire, 12 bytes from where the cursor stands */
inline encode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> wire[at] = order_delete_message_record.timestamp[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.order_number[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message off the wire, 12 bytes from where the cursor stands */
inline decode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.timestamp[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_number[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Delete Message is what was written, byte for byte */
inline equal_order_delete_message(order_delete_message_read, order_delete_message_written) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> assert(order_delete_message_read.timestamp[order_delete_message_at] == order_delete_message_written.timestamp[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.order_number[order_delete_message_at] == order_delete_message_written.order_number[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replace Message: 36 bytes ----------------------------------------- */

/* This message indicates when an order in the orderbook has been modified. */
typedef OrderReplaceMessage {
  byte timestamp[4];
  byte original_order_number[8];
  byte new_order_number[8];
  byte quantity[8];
  byte price[8]
};

int order_replace_message_at;

/* every byte of Order Replace Message set to one value */
inline fill_order_replace_message(order_replace_message_record, order_replace_message_value) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.timestamp[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.original_order_number[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.new_order_number[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.quantity[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.price[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replace Message set to where it lies, so a field read out of place says so */
inline ramp_order_replace_message(order_replace_message_record, order_replace_message_base) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.timestamp[order_replace_message_at] = (order_replace_message_base + 0 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.original_order_number[order_replace_message_at] = (order_replace_message_base + 4 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.new_order_number[order_replace_message_at] = (order_replace_message_base + 12 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.quantity[order_replace_message_at] = (order_replace_message_base + 20 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.price[order_replace_message_at] = (order_replace_message_base + 28 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Message to the wire, 36 bytes from where the cursor stands */
inline encode_order_replace_message(order_replace_message_record) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> wire[at] = order_replace_message_record.timestamp[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.original_order_number[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.new_order_number[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.quantity[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.price[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Message off the wire, 36 bytes from where the cursor stands */
inline decode_order_replace_message(order_replace_message_record) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.timestamp[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.original_order_number[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.new_order_number[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.quantity[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.price[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replace Message is what was written, byte for byte */
inline equal_order_replace_message(order_replace_message_read, order_replace_message_written) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> assert(order_replace_message_read.timestamp[order_replace_message_at] == order_replace_message_written.timestamp[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.original_order_number[order_replace_message_at] == order_replace_message_written.original_order_number[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.new_order_number[order_replace_message_at] == order_replace_message_written.new_order_number[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.quantity[order_replace_message_at] == order_replace_message_written.quantity[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.price[order_replace_message_at] == order_replace_message_written.price[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indicative Price Quantity Message: 57 bytes ----------------------------- */

/* This message provides auction information including the theoretical opening price and quantity. */
typedef IndicativePriceQuantityMessage {
  byte timestamp[4];
  byte theoretical_opening_quantity[8];
  byte orderbook[4];
  byte best_bid[8];
  byte best_offer[8];
  byte theoretical_opening_price[8];
  byte cross_type;
  byte best_bid_size[8];
  byte best_offer_size[8]
};

int indicative_price_quantity_message_at;

/* every byte of Indicative Price Quantity Message set to one value */
inline fill_indicative_price_quantity_message(indicative_price_quantity_message_record, indicative_price_quantity_message_value) {
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.timestamp[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.theoretical_opening_quantity[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.orderbook[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.best_bid[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.best_offer[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.theoretical_opening_price[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_record.cross_type = indicative_price_quantity_message_value;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.best_bid_size[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.best_offer_size[indicative_price_quantity_message_at] = indicative_price_quantity_message_value; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indicative Price Quantity Message set to where it lies, so a field read out of place says so */
inline ramp_indicative_price_quantity_message(indicative_price_quantity_message_record, indicative_price_quantity_message_base) {
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.timestamp[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 0 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.theoretical_opening_quantity[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 4 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.orderbook[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 12 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.best_bid[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 16 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.best_offer[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 24 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.theoretical_opening_price[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 32 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_record.cross_type = (indicative_price_quantity_message_base + 40 + 1) % 256;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.best_bid_size[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 41 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.best_offer_size[indicative_price_quantity_message_at] = (indicative_price_quantity_message_base + 49 + indicative_price_quantity_message_at + 1) % 256; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Price Quantity Message to the wire, 57 bytes from where the cursor stands */
inline encode_indicative_price_quantity_message(indicative_price_quantity_message_record) {
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> wire[at] = indicative_price_quantity_message_record.timestamp[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> wire[at] = indicative_price_quantity_message_record.theoretical_opening_quantity[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> wire[at] = indicative_price_quantity_message_record.orderbook[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> wire[at] = indicative_price_quantity_message_record.best_bid[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> wire[at] = indicative_price_quantity_message_record.best_offer[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> wire[at] = indicative_price_quantity_message_record.theoretical_opening_price[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  wire[at] = indicative_price_quantity_message_record.cross_type; at = at + 1;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> wire[at] = indicative_price_quantity_message_record.best_bid_size[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> wire[at] = indicative_price_quantity_message_record.best_offer_size[indicative_price_quantity_message_at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Price Quantity Message off the wire, 57 bytes from where the cursor stands */
inline decode_indicative_price_quantity_message(indicative_price_quantity_message_record) {
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.timestamp[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.theoretical_opening_quantity[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> indicative_price_quantity_message_record.orderbook[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.best_bid[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.best_offer[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.theoretical_opening_price[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_record.cross_type = wire[at]; at = at + 1;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.best_bid_size[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> indicative_price_quantity_message_record.best_offer_size[indicative_price_quantity_message_at] = wire[at]; at = at + 1; indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indicative Price Quantity Message is what was written, byte for byte */
inline equal_indicative_price_quantity_message(indicative_price_quantity_message_read, indicative_price_quantity_message_written) {
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> assert(indicative_price_quantity_message_read.timestamp[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.timestamp[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> assert(indicative_price_quantity_message_read.theoretical_opening_quantity[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.theoretical_opening_quantity[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 4 -> assert(indicative_price_quantity_message_read.orderbook[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.orderbook[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> assert(indicative_price_quantity_message_read.best_bid[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.best_bid[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> assert(indicative_price_quantity_message_read.best_offer[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.best_offer[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> assert(indicative_price_quantity_message_read.theoretical_opening_price[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.theoretical_opening_price[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  assert(indicative_price_quantity_message_read.cross_type == indicative_price_quantity_message_written.cross_type);
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> assert(indicative_price_quantity_message_read.best_bid_size[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.best_bid_size[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  indicative_price_quantity_message_at = 0;
  do
  :: indicative_price_quantity_message_at < 8 -> assert(indicative_price_quantity_message_read.best_offer_size[indicative_price_quantity_message_at] == indicative_price_quantity_message_written.best_offer_size[indicative_price_quantity_message_at]); indicative_price_quantity_message_at = indicative_price_quantity_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 43 bytes ------------------------------------------------- */

/* This message is sent to provide information about off-book matching. */
typedef TradeMessage {
  byte timestamp[4];
  byte executed_quantity[8];
  byte orderbook[4];
  byte printable;
  byte execution_price[8];
  byte match_number[8];
  byte trade_indicator;
  byte buy_firm_id[4];
  byte sell_firm_id[4];
  byte trade_source
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.timestamp[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.executed_quantity[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.orderbook[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.printable = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.execution_price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_indicator = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.buy_firm_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.sell_firm_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_source = trade_message_value;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.timestamp[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.executed_quantity[trade_message_at] = (trade_message_base + 4 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.orderbook[trade_message_at] = (trade_message_base + 12 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.printable = (trade_message_base + 16 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.execution_price[trade_message_at] = (trade_message_base + 17 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_number[trade_message_at] = (trade_message_base + 25 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_indicator = (trade_message_base + 33 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.buy_firm_id[trade_message_at] = (trade_message_base + 34 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.sell_firm_id[trade_message_at] = (trade_message_base + 38 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_source = (trade_message_base + 42 + 1) % 256;
  skip
}

/* Trade Message to the wire, 43 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.timestamp[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.executed_quantity[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.orderbook[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.printable; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.execution_price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.match_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.trade_indicator; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.buy_firm_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.sell_firm_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.trade_source; at = at + 1;
  skip
}

/* Trade Message off the wire, 43 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.timestamp[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.executed_quantity[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.orderbook[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.printable = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.execution_price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_indicator = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.buy_firm_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.sell_firm_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_source = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.timestamp[trade_message_at] == trade_message_written.timestamp[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.executed_quantity[trade_message_at] == trade_message_written.executed_quantity[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.orderbook[trade_message_at] == trade_message_written.orderbook[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.printable == trade_message_written.printable);
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.execution_price[trade_message_at] == trade_message_written.execution_price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.match_number[trade_message_at] == trade_message_written.match_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.trade_indicator == trade_message_written.trade_indicator);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.buy_firm_id[trade_message_at] == trade_message_written.buy_firm_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.sell_firm_id[trade_message_at] == trade_message_written.sell_firm_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.trade_source == trade_message_written.trade_source);
  skip
}

/* ---- News Message: 891 bytes ------------------------------------------------- */

/* This message disseminates exchange news. */
typedef NewsMessage {
  byte timestamp[4];
  byte orderbook[4];
  byte news_id[4];
  byte firm_code[30];
  byte title[81];
  byte reference_null_terminated_char_256[256];
  byte news_text[512]
};

int news_message_at;

/* every byte of News Message set to one value */
inline fill_news_message(news_message_record, news_message_value) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.timestamp[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.orderbook[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.news_id[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 30 -> news_message_record.firm_code[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 81 -> news_message_record.title[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 256 -> news_message_record.reference_null_terminated_char_256[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 512 -> news_message_record.news_text[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of News Message set to where it lies, so a field read out of place says so */
inline ramp_news_message(news_message_record, news_message_base) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.timestamp[news_message_at] = (news_message_base + 0 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.orderbook[news_message_at] = (news_message_base + 4 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.news_id[news_message_at] = (news_message_base + 8 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 30 -> news_message_record.firm_code[news_message_at] = (news_message_base + 12 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 81 -> news_message_record.title[news_message_at] = (news_message_base + 42 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 256 -> news_message_record.reference_null_terminated_char_256[news_message_at] = (news_message_base + 123 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 512 -> news_message_record.news_text[news_message_at] = (news_message_base + 379 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* News Message to the wire, 891 bytes from where the cursor stands */
inline encode_news_message(news_message_record) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> wire[at] = news_message_record.timestamp[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> wire[at] = news_message_record.orderbook[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> wire[at] = news_message_record.news_id[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 30 -> wire[at] = news_message_record.firm_code[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 81 -> wire[at] = news_message_record.title[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 256 -> wire[at] = news_message_record.reference_null_terminated_char_256[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 512 -> wire[at] = news_message_record.news_text[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* News Message off the wire, 891 bytes from where the cursor stands */
inline decode_news_message(news_message_record) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.timestamp[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.orderbook[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.news_id[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 30 -> news_message_record.firm_code[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 81 -> news_message_record.title[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 256 -> news_message_record.reference_null_terminated_char_256[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 512 -> news_message_record.news_text[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of News Message is what was written, byte for byte */
inline equal_news_message(news_message_read, news_message_written) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> assert(news_message_read.timestamp[news_message_at] == news_message_written.timestamp[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> assert(news_message_read.orderbook[news_message_at] == news_message_written.orderbook[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> assert(news_message_read.news_id[news_message_at] == news_message_written.news_id[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 30 -> assert(news_message_read.firm_code[news_message_at] == news_message_written.firm_code[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 81 -> assert(news_message_read.title[news_message_at] == news_message_written.title[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 256 -> assert(news_message_read.reference_null_terminated_char_256[news_message_at] == news_message_written.reference_null_terminated_char_256[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 512 -> assert(news_message_read.news_text[news_message_at] == news_message_written.news_text[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Member Directory Message: 20 bytes -------------------------------- */

/* This message provides details about index members and their respective weightings within an index. */
typedef IndexMemberDirectoryMessage {
  byte timestamp[4];
  byte index_orderbook[4];
  byte member_orderbook[4];
  byte weight[8]
};

int index_member_directory_message_at;

/* every byte of Index Member Directory Message set to one value */
inline fill_index_member_directory_message(index_member_directory_message_record, index_member_directory_message_value) {
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.timestamp[index_member_directory_message_at] = index_member_directory_message_value; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.index_orderbook[index_member_directory_message_at] = index_member_directory_message_value; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.member_orderbook[index_member_directory_message_at] = index_member_directory_message_value; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 8 -> index_member_directory_message_record.weight[index_member_directory_message_at] = index_member_directory_message_value; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Member Directory Message set to where it lies, so a field read out of place says so */
inline ramp_index_member_directory_message(index_member_directory_message_record, index_member_directory_message_base) {
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.timestamp[index_member_directory_message_at] = (index_member_directory_message_base + 0 + index_member_directory_message_at + 1) % 256; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.index_orderbook[index_member_directory_message_at] = (index_member_directory_message_base + 4 + index_member_directory_message_at + 1) % 256; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.member_orderbook[index_member_directory_message_at] = (index_member_directory_message_base + 8 + index_member_directory_message_at + 1) % 256; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 8 -> index_member_directory_message_record.weight[index_member_directory_message_at] = (index_member_directory_message_base + 12 + index_member_directory_message_at + 1) % 256; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Member Directory Message to the wire, 20 bytes from where the cursor stands */
inline encode_index_member_directory_message(index_member_directory_message_record) {
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> wire[at] = index_member_directory_message_record.timestamp[index_member_directory_message_at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> wire[at] = index_member_directory_message_record.index_orderbook[index_member_directory_message_at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> wire[at] = index_member_directory_message_record.member_orderbook[index_member_directory_message_at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 8 -> wire[at] = index_member_directory_message_record.weight[index_member_directory_message_at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Member Directory Message off the wire, 20 bytes from where the cursor stands */
inline decode_index_member_directory_message(index_member_directory_message_record) {
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.timestamp[index_member_directory_message_at] = wire[at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.index_orderbook[index_member_directory_message_at] = wire[at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> index_member_directory_message_record.member_orderbook[index_member_directory_message_at] = wire[at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 8 -> index_member_directory_message_record.weight[index_member_directory_message_at] = wire[at]; at = at + 1; index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Member Directory Message is what was written, byte for byte */
inline equal_index_member_directory_message(index_member_directory_message_read, index_member_directory_message_written) {
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> assert(index_member_directory_message_read.timestamp[index_member_directory_message_at] == index_member_directory_message_written.timestamp[index_member_directory_message_at]); index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> assert(index_member_directory_message_read.index_orderbook[index_member_directory_message_at] == index_member_directory_message_written.index_orderbook[index_member_directory_message_at]); index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 4 -> assert(index_member_directory_message_read.member_orderbook[index_member_directory_message_at] == index_member_directory_message_written.member_orderbook[index_member_directory_message_at]); index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  index_member_directory_message_at = 0;
  do
  :: index_member_directory_message_at < 8 -> assert(index_member_directory_message_read.weight[index_member_directory_message_at] == index_member_directory_message_written.weight[index_member_directory_message_at]); index_member_directory_message_at = index_member_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Value Message: 16 bytes ------------------------------------------- */

/* This message disseminates index values to market participants. */
typedef IndexValueMessage {
  byte timestamp[4];
  byte index_orderbook[4];
  byte index_value[8]
};

int index_value_message_at;

/* every byte of Index Value Message set to one value */
inline fill_index_value_message(index_value_message_record, index_value_message_value) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.timestamp[index_value_message_at] = index_value_message_value; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.index_orderbook[index_value_message_at] = index_value_message_value; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 8 -> index_value_message_record.index_value[index_value_message_at] = index_value_message_value; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Value Message set to where it lies, so a field read out of place says so */
inline ramp_index_value_message(index_value_message_record, index_value_message_base) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.timestamp[index_value_message_at] = (index_value_message_base + 0 + index_value_message_at + 1) % 256; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.index_orderbook[index_value_message_at] = (index_value_message_base + 4 + index_value_message_at + 1) % 256; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 8 -> index_value_message_record.index_value[index_value_message_at] = (index_value_message_base + 8 + index_value_message_at + 1) % 256; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Value Message to the wire, 16 bytes from where the cursor stands */
inline encode_index_value_message(index_value_message_record) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> wire[at] = index_value_message_record.timestamp[index_value_message_at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> wire[at] = index_value_message_record.index_orderbook[index_value_message_at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 8 -> wire[at] = index_value_message_record.index_value[index_value_message_at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Value Message off the wire, 16 bytes from where the cursor stands */
inline decode_index_value_message(index_value_message_record) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.timestamp[index_value_message_at] = wire[at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.index_orderbook[index_value_message_at] = wire[at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 8 -> index_value_message_record.index_value[index_value_message_at] = wire[at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Value Message is what was written, byte for byte */
inline equal_index_value_message(index_value_message_read, index_value_message_written) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> assert(index_value_message_read.timestamp[index_value_message_at] == index_value_message_written.timestamp[index_value_message_at]); index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> assert(index_value_message_read.index_orderbook[index_value_message_at] == index_value_message_written.index_orderbook[index_value_message_at]); index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 8 -> assert(index_value_message_read.index_value[index_value_message_at] == index_value_message_written.index_value[index_value_message_at]); index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Server Packet Header: encoded, read back, and compared */
proctype check_server_packet_header() {
  ServerPacketHeader server_packet_header_sent;
  ServerPacketHeader server_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_server_packet_header(server_packet_header_sent, 0)
  :: pattern == 1 -> fill_server_packet_header(server_packet_header_sent, 32)
  :: pattern == 2 -> fill_server_packet_header(server_packet_header_sent, 255)
  :: else -> ramp_server_packet_header(server_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_server_packet_header(server_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_server_packet_header(server_packet_header_got);
    assert(at == 3);
    equal_server_packet_header(server_packet_header_got, server_packet_header_sent)
  }
}

/* Login Accepted Packet: encoded, read back, and compared */
proctype check_login_accepted_packet() {
  LoginAcceptedPacket login_accepted_packet_sent;
  LoginAcceptedPacket login_accepted_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_accepted_packet(login_accepted_packet_sent, 0)
  :: pattern == 1 -> fill_login_accepted_packet(login_accepted_packet_sent, 32)
  :: pattern == 2 -> fill_login_accepted_packet(login_accepted_packet_sent, 255)
  :: else -> ramp_login_accepted_packet(login_accepted_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_accepted_packet(login_accepted_packet_sent);
    assert(at == 30);
    at = 0;
    decode_login_accepted_packet(login_accepted_packet_got);
    assert(at == 30);
    equal_login_accepted_packet(login_accepted_packet_got, login_accepted_packet_sent)
  }
}

/* Login Rejected Packet: encoded, read back, and compared */
proctype check_login_rejected_packet() {
  LoginRejectedPacket login_rejected_packet_sent;
  LoginRejectedPacket login_rejected_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_rejected_packet(login_rejected_packet_sent, 0)
  :: pattern == 1 -> fill_login_rejected_packet(login_rejected_packet_sent, 32)
  :: pattern == 2 -> fill_login_rejected_packet(login_rejected_packet_sent, 255)
  :: else -> ramp_login_rejected_packet(login_rejected_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_rejected_packet(login_rejected_packet_sent);
    assert(at == 1);
    at = 0;
    decode_login_rejected_packet(login_rejected_packet_got);
    assert(at == 1);
    equal_login_rejected_packet(login_rejected_packet_got, login_rejected_packet_sent)
  }
}

/* Timestamp Message: encoded, read back, and compared */
proctype check_timestamp_message() {
  TimestampMessage timestamp_message_sent;
  TimestampMessage timestamp_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_timestamp_message(timestamp_message_sent, 0)
  :: pattern == 1 -> fill_timestamp_message(timestamp_message_sent, 32)
  :: pattern == 2 -> fill_timestamp_message(timestamp_message_sent, 255)
  :: else -> ramp_timestamp_message(timestamp_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_timestamp_message(timestamp_message_sent);
    assert(at == 8);
    at = 0;
    decode_timestamp_message(timestamp_message_got);
    assert(at == 8);
    equal_timestamp_message(timestamp_message_got, timestamp_message_sent)
  }
}

/* System Event Message: encoded, read back, and compared */
proctype check_system_event_message() {
  SystemEventMessage system_event_message_sent;
  SystemEventMessage system_event_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_event_message(system_event_message_sent, 0)
  :: pattern == 1 -> fill_system_event_message(system_event_message_sent, 32)
  :: pattern == 2 -> fill_system_event_message(system_event_message_sent, 255)
  :: else -> ramp_system_event_message(system_event_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_event_message(system_event_message_sent);
    assert(at == 61);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 61);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Price Tick Size Message: encoded, read back, and compared */
proctype check_price_tick_size_message() {
  PriceTickSizeMessage price_tick_size_message_sent;
  PriceTickSizeMessage price_tick_size_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_tick_size_message(price_tick_size_message_sent, 0)
  :: pattern == 1 -> fill_price_tick_size_message(price_tick_size_message_sent, 32)
  :: pattern == 2 -> fill_price_tick_size_message(price_tick_size_message_sent, 255)
  :: else -> ramp_price_tick_size_message(price_tick_size_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_tick_size_message(price_tick_size_message_sent);
    assert(at == 24);
    at = 0;
    decode_price_tick_size_message(price_tick_size_message_got);
    assert(at == 24);
    equal_price_tick_size_message(price_tick_size_message_got, price_tick_size_message_sent)
  }
}

/* Quantity Tick Size Message: encoded, read back, and compared */
proctype check_quantity_tick_size_message() {
  QuantityTickSizeMessage quantity_tick_size_message_sent;
  QuantityTickSizeMessage quantity_tick_size_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quantity_tick_size_message(quantity_tick_size_message_sent, 0)
  :: pattern == 1 -> fill_quantity_tick_size_message(quantity_tick_size_message_sent, 32)
  :: pattern == 2 -> fill_quantity_tick_size_message(quantity_tick_size_message_sent, 255)
  :: else -> ramp_quantity_tick_size_message(quantity_tick_size_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quantity_tick_size_message(quantity_tick_size_message_sent);
    assert(at == 24);
    at = 0;
    decode_quantity_tick_size_message(quantity_tick_size_message_got);
    assert(at == 24);
    equal_quantity_tick_size_message(quantity_tick_size_message_got, quantity_tick_size_message_sent)
  }
}

/* Orderbook Directory Message: encoded, read back, and compared */
proctype check_orderbook_directory_message() {
  OrderbookDirectoryMessage orderbook_directory_message_sent;
  OrderbookDirectoryMessage orderbook_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_orderbook_directory_message(orderbook_directory_message_sent, 0)
  :: pattern == 1 -> fill_orderbook_directory_message(orderbook_directory_message_sent, 32)
  :: pattern == 2 -> fill_orderbook_directory_message(orderbook_directory_message_sent, 255)
  :: else -> ramp_orderbook_directory_message(orderbook_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_orderbook_directory_message(orderbook_directory_message_sent);
    assert(at == 320);
    at = 0;
    decode_orderbook_directory_message(orderbook_directory_message_got);
    assert(at == 320);
    equal_orderbook_directory_message(orderbook_directory_message_got, orderbook_directory_message_sent)
  }
}

/* Orderbook Trading Action Message: encoded, read back, and compared */
proctype check_orderbook_trading_action_message() {
  OrderbookTradingActionMessage orderbook_trading_action_message_sent;
  OrderbookTradingActionMessage orderbook_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_orderbook_trading_action_message(orderbook_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_orderbook_trading_action_message(orderbook_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_orderbook_trading_action_message(orderbook_trading_action_message_sent, 255)
  :: else -> ramp_orderbook_trading_action_message(orderbook_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_orderbook_trading_action_message(orderbook_trading_action_message_sent);
    assert(at == 10);
    at = 0;
    decode_orderbook_trading_action_message(orderbook_trading_action_message_got);
    assert(at == 10);
    equal_orderbook_trading_action_message(orderbook_trading_action_message_got, orderbook_trading_action_message_sent)
  }
}

/* Orderbook Attribute Message: encoded, read back, and compared */
proctype check_orderbook_attribute_message() {
  OrderbookAttributeMessage orderbook_attribute_message_sent;
  OrderbookAttributeMessage orderbook_attribute_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_orderbook_attribute_message(orderbook_attribute_message_sent, 0)
  :: pattern == 1 -> fill_orderbook_attribute_message(orderbook_attribute_message_sent, 32)
  :: pattern == 2 -> fill_orderbook_attribute_message(orderbook_attribute_message_sent, 255)
  :: else -> ramp_orderbook_attribute_message(orderbook_attribute_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_orderbook_attribute_message(orderbook_attribute_message_sent);
    assert(at == 18);
    at = 0;
    decode_orderbook_attribute_message(orderbook_attribute_message_got);
    assert(at == 18);
    equal_orderbook_attribute_message(orderbook_attribute_message_got, orderbook_attribute_message_sent)
  }
}

/* Firm Directory Message: encoded, read back, and compared */
proctype check_firm_directory_message() {
  FirmDirectoryMessage firm_directory_message_sent;
  FirmDirectoryMessage firm_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_firm_directory_message(firm_directory_message_sent, 0)
  :: pattern == 1 -> fill_firm_directory_message(firm_directory_message_sent, 32)
  :: pattern == 2 -> fill_firm_directory_message(firm_directory_message_sent, 255)
  :: else -> ramp_firm_directory_message(firm_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_firm_directory_message(firm_directory_message_sent);
    assert(at == 38);
    at = 0;
    decode_firm_directory_message(firm_directory_message_got);
    assert(at == 38);
    equal_firm_directory_message(firm_directory_message_got, firm_directory_message_sent)
  }
}

/* Add Order Message: encoded, read back, and compared */
proctype check_add_order_message() {
  AddOrderMessage add_order_message_sent;
  AddOrderMessage add_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message(add_order_message_sent, 0)
  :: pattern == 1 -> fill_add_order_message(add_order_message_sent, 32)
  :: pattern == 2 -> fill_add_order_message(add_order_message_sent, 255)
  :: else -> ramp_add_order_message(add_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message(add_order_message_sent);
    assert(at == 37);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 37);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Order Executed Message: encoded, read back, and compared */
proctype check_order_executed_message() {
  OrderExecutedMessage order_executed_message_sent;
  OrderExecutedMessage order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_message(order_executed_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_message(order_executed_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_message(order_executed_message_sent, 255)
  :: else -> ramp_order_executed_message(order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_message(order_executed_message_sent);
    assert(at == 33);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 33);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Order Executed With Price Message: encoded, read back, and compared */
proctype check_order_executed_with_price_message() {
  OrderExecutedWithPriceMessage order_executed_with_price_message_sent;
  OrderExecutedWithPriceMessage order_executed_with_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 255)
  :: else -> ramp_order_executed_with_price_message(order_executed_with_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_with_price_message(order_executed_with_price_message_sent);
    assert(at == 37);
    at = 0;
    decode_order_executed_with_price_message(order_executed_with_price_message_got);
    assert(at == 37);
    equal_order_executed_with_price_message(order_executed_with_price_message_got, order_executed_with_price_message_sent)
  }
}

/* Broken Trade Message: encoded, read back, and compared */
proctype check_broken_trade_message() {
  BrokenTradeMessage broken_trade_message_sent;
  BrokenTradeMessage broken_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_broken_trade_message(broken_trade_message_sent, 0)
  :: pattern == 1 -> fill_broken_trade_message(broken_trade_message_sent, 32)
  :: pattern == 2 -> fill_broken_trade_message(broken_trade_message_sent, 255)
  :: else -> ramp_broken_trade_message(broken_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_broken_trade_message(broken_trade_message_sent);
    assert(at == 13);
    at = 0;
    decode_broken_trade_message(broken_trade_message_got);
    assert(at == 13);
    equal_broken_trade_message(broken_trade_message_got, broken_trade_message_sent)
  }
}

/* Order Delete Message: encoded, read back, and compared */
proctype check_order_delete_message() {
  OrderDeleteMessage order_delete_message_sent;
  OrderDeleteMessage order_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_delete_message(order_delete_message_sent, 0)
  :: pattern == 1 -> fill_order_delete_message(order_delete_message_sent, 32)
  :: pattern == 2 -> fill_order_delete_message(order_delete_message_sent, 255)
  :: else -> ramp_order_delete_message(order_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_delete_message(order_delete_message_sent);
    assert(at == 12);
    at = 0;
    decode_order_delete_message(order_delete_message_got);
    assert(at == 12);
    equal_order_delete_message(order_delete_message_got, order_delete_message_sent)
  }
}

/* Order Replace Message: encoded, read back, and compared */
proctype check_order_replace_message() {
  OrderReplaceMessage order_replace_message_sent;
  OrderReplaceMessage order_replace_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replace_message(order_replace_message_sent, 0)
  :: pattern == 1 -> fill_order_replace_message(order_replace_message_sent, 32)
  :: pattern == 2 -> fill_order_replace_message(order_replace_message_sent, 255)
  :: else -> ramp_order_replace_message(order_replace_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replace_message(order_replace_message_sent);
    assert(at == 36);
    at = 0;
    decode_order_replace_message(order_replace_message_got);
    assert(at == 36);
    equal_order_replace_message(order_replace_message_got, order_replace_message_sent)
  }
}

/* Indicative Price Quantity Message: encoded, read back, and compared */
proctype check_indicative_price_quantity_message() {
  IndicativePriceQuantityMessage indicative_price_quantity_message_sent;
  IndicativePriceQuantityMessage indicative_price_quantity_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indicative_price_quantity_message(indicative_price_quantity_message_sent, 0)
  :: pattern == 1 -> fill_indicative_price_quantity_message(indicative_price_quantity_message_sent, 32)
  :: pattern == 2 -> fill_indicative_price_quantity_message(indicative_price_quantity_message_sent, 255)
  :: else -> ramp_indicative_price_quantity_message(indicative_price_quantity_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indicative_price_quantity_message(indicative_price_quantity_message_sent);
    assert(at == 57);
    at = 0;
    decode_indicative_price_quantity_message(indicative_price_quantity_message_got);
    assert(at == 57);
    equal_indicative_price_quantity_message(indicative_price_quantity_message_got, indicative_price_quantity_message_sent)
  }
}

/* Trade Message: encoded, read back, and compared */
proctype check_trade_message() {
  TradeMessage trade_message_sent;
  TradeMessage trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message(trade_message_sent, 0)
  :: pattern == 1 -> fill_trade_message(trade_message_sent, 32)
  :: pattern == 2 -> fill_trade_message(trade_message_sent, 255)
  :: else -> ramp_trade_message(trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message(trade_message_sent);
    assert(at == 43);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 43);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* News Message: encoded, read back, and compared */
proctype check_news_message() {
  NewsMessage news_message_sent;
  NewsMessage news_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_news_message(news_message_sent, 0)
  :: pattern == 1 -> fill_news_message(news_message_sent, 32)
  :: pattern == 2 -> fill_news_message(news_message_sent, 255)
  :: else -> ramp_news_message(news_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_news_message(news_message_sent);
    assert(at == 891);
    at = 0;
    decode_news_message(news_message_got);
    assert(at == 891);
    equal_news_message(news_message_got, news_message_sent)
  }
}

/* Index Member Directory Message: encoded, read back, and compared */
proctype check_index_member_directory_message() {
  IndexMemberDirectoryMessage index_member_directory_message_sent;
  IndexMemberDirectoryMessage index_member_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_member_directory_message(index_member_directory_message_sent, 0)
  :: pattern == 1 -> fill_index_member_directory_message(index_member_directory_message_sent, 32)
  :: pattern == 2 -> fill_index_member_directory_message(index_member_directory_message_sent, 255)
  :: else -> ramp_index_member_directory_message(index_member_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_member_directory_message(index_member_directory_message_sent);
    assert(at == 20);
    at = 0;
    decode_index_member_directory_message(index_member_directory_message_got);
    assert(at == 20);
    equal_index_member_directory_message(index_member_directory_message_got, index_member_directory_message_sent)
  }
}

/* Index Value Message: encoded, read back, and compared */
proctype check_index_value_message() {
  IndexValueMessage index_value_message_sent;
  IndexValueMessage index_value_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_value_message(index_value_message_sent, 0)
  :: pattern == 1 -> fill_index_value_message(index_value_message_sent, 32)
  :: pattern == 2 -> fill_index_value_message(index_value_message_sent, 255)
  :: else -> ramp_index_value_message(index_value_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_value_message(index_value_message_sent);
    assert(at == 16);
    at = 0;
    decode_index_value_message(index_value_message_got);
    assert(at == 16);
    equal_index_value_message(index_value_message_got, index_value_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_timestamp_message()
  :: run check_system_event_message()
  :: run check_price_tick_size_message()
  :: run check_quantity_tick_size_message()
  :: run check_orderbook_directory_message()
  :: run check_orderbook_trading_action_message()
  :: run check_orderbook_attribute_message()
  :: run check_firm_directory_message()
  :: run check_add_order_message()
  :: run check_order_executed_message()
  :: run check_order_executed_with_price_message()
  :: run check_broken_trade_message()
  :: run check_order_delete_message()
  :: run check_order_replace_message()
  :: run check_indicative_price_quantity_message()
  :: run check_trade_message()
  :: run check_news_message()
  :: run check_index_member_directory_message()
  :: run check_index_value_message()
  fi
}
