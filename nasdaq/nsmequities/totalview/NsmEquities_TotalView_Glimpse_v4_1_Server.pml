/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) TotalView Itch
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
#define WIRE 33

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

/* ---- Timestamp Seconds Message: 4 bytes -------------------------------------- */

/* Reflects the number of seconds past midnight that the Timestamp message was generated. Note: A Timestamp - Second message will be disseminated for every second for which there is at least one payload message. */
typedef TimestampSecondsMessage {
  byte second[4]
};

int timestamp_seconds_message_at;

/* every byte of Timestamp Seconds Message set to one value */
inline fill_timestamp_seconds_message(timestamp_seconds_message_record, timestamp_seconds_message_value) {
  timestamp_seconds_message_at = 0;
  do
  :: timestamp_seconds_message_at < 4 -> timestamp_seconds_message_record.second[timestamp_seconds_message_at] = timestamp_seconds_message_value; timestamp_seconds_message_at = timestamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Timestamp Seconds Message set to where it lies, so a field read out of place says so */
inline ramp_timestamp_seconds_message(timestamp_seconds_message_record, timestamp_seconds_message_base) {
  timestamp_seconds_message_at = 0;
  do
  :: timestamp_seconds_message_at < 4 -> timestamp_seconds_message_record.second[timestamp_seconds_message_at] = (timestamp_seconds_message_base + 0 + timestamp_seconds_message_at + 1) % 256; timestamp_seconds_message_at = timestamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp Seconds Message to the wire, 4 bytes from where the cursor stands */
inline encode_timestamp_seconds_message(timestamp_seconds_message_record) {
  timestamp_seconds_message_at = 0;
  do
  :: timestamp_seconds_message_at < 4 -> wire[at] = timestamp_seconds_message_record.second[timestamp_seconds_message_at]; at = at + 1; timestamp_seconds_message_at = timestamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp Seconds Message off the wire, 4 bytes from where the cursor stands */
inline decode_timestamp_seconds_message(timestamp_seconds_message_record) {
  timestamp_seconds_message_at = 0;
  do
  :: timestamp_seconds_message_at < 4 -> timestamp_seconds_message_record.second[timestamp_seconds_message_at] = wire[at]; at = at + 1; timestamp_seconds_message_at = timestamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Timestamp Seconds Message is what was written, byte for byte */
inline equal_timestamp_seconds_message(timestamp_seconds_message_read, timestamp_seconds_message_written) {
  timestamp_seconds_message_at = 0;
  do
  :: timestamp_seconds_message_at < 4 -> assert(timestamp_seconds_message_read.second[timestamp_seconds_message_at] == timestamp_seconds_message_written.second[timestamp_seconds_message_at]); timestamp_seconds_message_at = timestamp_seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 5 bytes ------------------------------------------- */

/* NASDAQ GLIMPSE product is designed to support the same system event messages as the NASDAQ TotalView-ITCH feed. On GLIMPSE, NASDAQ will send out system event messages for those events that occurred up to the time of the GLIMPSE snapshot request. */
typedef SystemEventMessage {
  byte timestamp_nanoseconds[4];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp_nanoseconds[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp_nanoseconds[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 4 + 1) % 256;
  skip
}

/* System Event Message to the wire, 5 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.timestamp_nanoseconds[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 5 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp_nanoseconds[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.timestamp_nanoseconds[system_event_message_at] == system_event_message_written.timestamp_nanoseconds[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Add Order Message: 29 bytes --------------------------------------------- */

/* Add Order - No MPID Attribution Message. This message will be generated for unattributed orders accepted by the NASDAQ system. Note: If a firm wants to display a MPID for unattributed orders, NASDAQ recommends that it use the MPID of NSDQ. */
typedef AddOrderMessage {
  byte timestamp_nanoseconds[4];
  byte order_reference_number[8];
  byte buy_sell_indicator;
  byte shares[4];
  byte stock[8];
  byte price[4]
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.timestamp_nanoseconds[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_reference_number[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.buy_sell_indicator = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.shares[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.stock[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.timestamp_nanoseconds[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_reference_number[add_order_message_at] = (add_order_message_base + 4 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.buy_sell_indicator = (add_order_message_base + 12 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.shares[add_order_message_at] = (add_order_message_base + 13 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.stock[add_order_message_at] = (add_order_message_base + 17 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 25 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message to the wire, 29 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.timestamp_nanoseconds[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.order_reference_number[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.buy_sell_indicator; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.shares[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.stock[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message off the wire, 29 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.timestamp_nanoseconds[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_reference_number[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.shares[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.stock[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.timestamp_nanoseconds[add_order_message_at] == add_order_message_written.timestamp_nanoseconds[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.order_reference_number[add_order_message_at] == add_order_message_written.order_reference_number[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.buy_sell_indicator == add_order_message_written.buy_sell_indicator);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.shares[add_order_message_at] == add_order_message_written.shares[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.stock[add_order_message_at] == add_order_message_written.stock[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Mpid Attribution Message: 33 bytes ---------------------------- */

/* Add Order with MPID Attribution Message. This message will be generated for attributed orders and quotations accepted by the NASDAQ system. */
typedef AddOrderMpidAttributionMessage {
  byte timestamp_nanoseconds[4];
  byte order_reference_number[8];
  byte buy_sell_indicator;
  byte shares[4];
  byte stock[8];
  byte price[4];
  byte attribution[4]
};

int add_order_mpid_attribution_message_at;

/* every byte of Add Order Mpid Attribution Message set to one value */
inline fill_add_order_mpid_attribution_message(add_order_mpid_attribution_message_record, add_order_mpid_attribution_message_value) {
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.timestamp_nanoseconds[add_order_mpid_attribution_message_at] = add_order_mpid_attribution_message_value; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> add_order_mpid_attribution_message_record.order_reference_number[add_order_mpid_attribution_message_at] = add_order_mpid_attribution_message_value; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_record.buy_sell_indicator = add_order_mpid_attribution_message_value;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.shares[add_order_mpid_attribution_message_at] = add_order_mpid_attribution_message_value; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> add_order_mpid_attribution_message_record.stock[add_order_mpid_attribution_message_at] = add_order_mpid_attribution_message_value; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.price[add_order_mpid_attribution_message_at] = add_order_mpid_attribution_message_value; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.attribution[add_order_mpid_attribution_message_at] = add_order_mpid_attribution_message_value; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Mpid Attribution Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_mpid_attribution_message(add_order_mpid_attribution_message_record, add_order_mpid_attribution_message_base) {
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.timestamp_nanoseconds[add_order_mpid_attribution_message_at] = (add_order_mpid_attribution_message_base + 0 + add_order_mpid_attribution_message_at + 1) % 256; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> add_order_mpid_attribution_message_record.order_reference_number[add_order_mpid_attribution_message_at] = (add_order_mpid_attribution_message_base + 4 + add_order_mpid_attribution_message_at + 1) % 256; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_record.buy_sell_indicator = (add_order_mpid_attribution_message_base + 12 + 1) % 256;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.shares[add_order_mpid_attribution_message_at] = (add_order_mpid_attribution_message_base + 13 + add_order_mpid_attribution_message_at + 1) % 256; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> add_order_mpid_attribution_message_record.stock[add_order_mpid_attribution_message_at] = (add_order_mpid_attribution_message_base + 17 + add_order_mpid_attribution_message_at + 1) % 256; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.price[add_order_mpid_attribution_message_at] = (add_order_mpid_attribution_message_base + 25 + add_order_mpid_attribution_message_at + 1) % 256; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.attribution[add_order_mpid_attribution_message_at] = (add_order_mpid_attribution_message_base + 29 + add_order_mpid_attribution_message_at + 1) % 256; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Mpid Attribution Message to the wire, 33 bytes from where the cursor stands */
inline encode_add_order_mpid_attribution_message(add_order_mpid_attribution_message_record) {
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> wire[at] = add_order_mpid_attribution_message_record.timestamp_nanoseconds[add_order_mpid_attribution_message_at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> wire[at] = add_order_mpid_attribution_message_record.order_reference_number[add_order_mpid_attribution_message_at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_mpid_attribution_message_record.buy_sell_indicator; at = at + 1;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> wire[at] = add_order_mpid_attribution_message_record.shares[add_order_mpid_attribution_message_at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> wire[at] = add_order_mpid_attribution_message_record.stock[add_order_mpid_attribution_message_at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> wire[at] = add_order_mpid_attribution_message_record.price[add_order_mpid_attribution_message_at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> wire[at] = add_order_mpid_attribution_message_record.attribution[add_order_mpid_attribution_message_at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Mpid Attribution Message off the wire, 33 bytes from where the cursor stands */
inline decode_add_order_mpid_attribution_message(add_order_mpid_attribution_message_record) {
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.timestamp_nanoseconds[add_order_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> add_order_mpid_attribution_message_record.order_reference_number[add_order_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.shares[add_order_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> add_order_mpid_attribution_message_record.stock[add_order_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.price[add_order_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> add_order_mpid_attribution_message_record.attribution[add_order_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Mpid Attribution Message is what was written, byte for byte */
inline equal_add_order_mpid_attribution_message(add_order_mpid_attribution_message_read, add_order_mpid_attribution_message_written) {
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> assert(add_order_mpid_attribution_message_read.timestamp_nanoseconds[add_order_mpid_attribution_message_at] == add_order_mpid_attribution_message_written.timestamp_nanoseconds[add_order_mpid_attribution_message_at]); add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> assert(add_order_mpid_attribution_message_read.order_reference_number[add_order_mpid_attribution_message_at] == add_order_mpid_attribution_message_written.order_reference_number[add_order_mpid_attribution_message_at]); add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  assert(add_order_mpid_attribution_message_read.buy_sell_indicator == add_order_mpid_attribution_message_written.buy_sell_indicator);
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> assert(add_order_mpid_attribution_message_read.shares[add_order_mpid_attribution_message_at] == add_order_mpid_attribution_message_written.shares[add_order_mpid_attribution_message_at]); add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 8 -> assert(add_order_mpid_attribution_message_read.stock[add_order_mpid_attribution_message_at] == add_order_mpid_attribution_message_written.stock[add_order_mpid_attribution_message_at]); add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> assert(add_order_mpid_attribution_message_read.price[add_order_mpid_attribution_message_at] == add_order_mpid_attribution_message_written.price[add_order_mpid_attribution_message_at]); add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_mpid_attribution_message_at = 0;
  do
  :: add_order_mpid_attribution_message_at < 4 -> assert(add_order_mpid_attribution_message_read.attribution[add_order_mpid_attribution_message_at] == add_order_mpid_attribution_message_written.attribution[add_order_mpid_attribution_message_at]); add_order_mpid_attribution_message_at = add_order_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Directory Message: 19 bytes --------------------------------------- */

/* At the start of each GLIMPSE transmission, NASDAQ will disseminate stock directory messages for all symbols in NASDAQ execution system for the current trading day. Please note that the Symbol Directory spin may include halted issues. Firms must process the Trading Action message for current trading state information. */
typedef StockDirectoryMessage {
  byte timestamp_nanoseconds[4];
  byte stock[8];
  byte market_category;
  byte financial_status_indicator;
  byte round_lot_size[4];
  byte round_lots_only
};

int stock_directory_message_at;

/* every byte of Stock Directory Message set to one value */
inline fill_stock_directory_message(stock_directory_message_record, stock_directory_message_value) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.timestamp_nanoseconds[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = stock_directory_message_value;
  stock_directory_message_record.financial_status_indicator = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = stock_directory_message_value;
  skip
}

/* each byte of Stock Directory Message set to where it lies, so a field read out of place says so */
inline ramp_stock_directory_message(stock_directory_message_record, stock_directory_message_base) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.timestamp_nanoseconds[stock_directory_message_at] = (stock_directory_message_base + 0 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock[stock_directory_message_at] = (stock_directory_message_base + 4 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = (stock_directory_message_base + 12 + 1) % 256;
  stock_directory_message_record.financial_status_indicator = (stock_directory_message_base + 13 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = (stock_directory_message_base + 14 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = (stock_directory_message_base + 18 + 1) % 256;
  skip
}

/* Stock Directory Message to the wire, 19 bytes from where the cursor stands */
inline encode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> wire[at] = stock_directory_message_record.timestamp_nanoseconds[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> wire[at] = stock_directory_message_record.stock[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.market_category; at = at + 1;
  wire[at] = stock_directory_message_record.financial_status_indicator; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> wire[at] = stock_directory_message_record.round_lot_size[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.round_lots_only; at = at + 1;
  skip
}

/* Stock Directory Message off the wire, 19 bytes from where the cursor stands */
inline decode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.timestamp_nanoseconds[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = wire[at]; at = at + 1;
  stock_directory_message_record.financial_status_indicator = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock Directory Message is what was written, byte for byte */
inline equal_stock_directory_message(stock_directory_message_read, stock_directory_message_written) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> assert(stock_directory_message_read.timestamp_nanoseconds[stock_directory_message_at] == stock_directory_message_written.timestamp_nanoseconds[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> assert(stock_directory_message_read.stock[stock_directory_message_at] == stock_directory_message_written.stock[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.market_category == stock_directory_message_written.market_category);
  assert(stock_directory_message_read.financial_status_indicator == stock_directory_message_written.financial_status_indicator);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> assert(stock_directory_message_read.round_lot_size[stock_directory_message_at] == stock_directory_message_written.round_lot_size[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.round_lots_only == stock_directory_message_written.round_lots_only);
  skip
}

/* ---- Stock Trading Action Message: 18 bytes ---------------------------------- */

/* NASDAQ uses this administrative message to indicate the current trading status of a security to the trading community. In the GLIMPSE transmission, NASDAQ will send out a Stock Trading Action message for only those NASDAQ, NYSE, NYSE Amex, NYSE Arca and BATS issues that were eligible for trading during the current trading session. */
typedef StockTradingActionMessage {
  byte timestamp_nanoseconds[4];
  byte stock[8];
  byte trading_state;
  byte reserved;
  byte reason[4]
};

int stock_trading_action_message_at;

/* every byte of Stock Trading Action Message set to one value */
inline fill_stock_trading_action_message(stock_trading_action_message_record, stock_trading_action_message_value) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.timestamp_nanoseconds[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.stock[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.trading_state = stock_trading_action_message_value;
  stock_trading_action_message_record.reserved = stock_trading_action_message_value;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_stock_trading_action_message(stock_trading_action_message_record, stock_trading_action_message_base) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.timestamp_nanoseconds[stock_trading_action_message_at] = (stock_trading_action_message_base + 0 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.stock[stock_trading_action_message_at] = (stock_trading_action_message_base + 4 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.trading_state = (stock_trading_action_message_base + 12 + 1) % 256;
  stock_trading_action_message_record.reserved = (stock_trading_action_message_base + 13 + 1) % 256;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = (stock_trading_action_message_base + 14 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message to the wire, 18 bytes from where the cursor stands */
inline encode_stock_trading_action_message(stock_trading_action_message_record) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> wire[at] = stock_trading_action_message_record.timestamp_nanoseconds[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> wire[at] = stock_trading_action_message_record.stock[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_trading_action_message_record.trading_state; at = at + 1;
  wire[at] = stock_trading_action_message_record.reserved; at = at + 1;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> wire[at] = stock_trading_action_message_record.reason[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message off the wire, 18 bytes from where the cursor stands */
inline decode_stock_trading_action_message(stock_trading_action_message_record) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.timestamp_nanoseconds[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.stock[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.trading_state = wire[at]; at = at + 1;
  stock_trading_action_message_record.reserved = wire[at]; at = at + 1;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Trading Action Message is what was written, byte for byte */
inline equal_stock_trading_action_message(stock_trading_action_message_read, stock_trading_action_message_written) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> assert(stock_trading_action_message_read.timestamp_nanoseconds[stock_trading_action_message_at] == stock_trading_action_message_written.timestamp_nanoseconds[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> assert(stock_trading_action_message_read.stock[stock_trading_action_message_at] == stock_trading_action_message_written.stock[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  assert(stock_trading_action_message_read.trading_state == stock_trading_action_message_written.trading_state);
  assert(stock_trading_action_message_read.reserved == stock_trading_action_message_written.reserved);
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> assert(stock_trading_action_message_read.reason[stock_trading_action_message_at] == stock_trading_action_message_written.reason[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reg Sho Restriction Message: 13 bytes ----------------------------------- */

/* Reg SHO Short Sale Price Test Restricted Indicator. NASDAQ will process orders based on the most Reg SHO Restriction status value. */
typedef RegShoRestrictionMessage {
  byte timestamp_nanoseconds[4];
  byte stock[8];
  byte reg_sho_action
};

int reg_sho_restriction_message_at;

/* every byte of Reg Sho Restriction Message set to one value */
inline fill_reg_sho_restriction_message(reg_sho_restriction_message_record, reg_sho_restriction_message_value) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 4 -> reg_sho_restriction_message_record.timestamp_nanoseconds[reg_sho_restriction_message_at] = reg_sho_restriction_message_value; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.stock[reg_sho_restriction_message_at] = reg_sho_restriction_message_value; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_record.reg_sho_action = reg_sho_restriction_message_value;
  skip
}

/* each byte of Reg Sho Restriction Message set to where it lies, so a field read out of place says so */
inline ramp_reg_sho_restriction_message(reg_sho_restriction_message_record, reg_sho_restriction_message_base) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 4 -> reg_sho_restriction_message_record.timestamp_nanoseconds[reg_sho_restriction_message_at] = (reg_sho_restriction_message_base + 0 + reg_sho_restriction_message_at + 1) % 256; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.stock[reg_sho_restriction_message_at] = (reg_sho_restriction_message_base + 4 + reg_sho_restriction_message_at + 1) % 256; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_record.reg_sho_action = (reg_sho_restriction_message_base + 12 + 1) % 256;
  skip
}

/* Reg Sho Restriction Message to the wire, 13 bytes from where the cursor stands */
inline encode_reg_sho_restriction_message(reg_sho_restriction_message_record) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 4 -> wire[at] = reg_sho_restriction_message_record.timestamp_nanoseconds[reg_sho_restriction_message_at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> wire[at] = reg_sho_restriction_message_record.stock[reg_sho_restriction_message_at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  wire[at] = reg_sho_restriction_message_record.reg_sho_action; at = at + 1;
  skip
}

/* Reg Sho Restriction Message off the wire, 13 bytes from where the cursor stands */
inline decode_reg_sho_restriction_message(reg_sho_restriction_message_record) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 4 -> reg_sho_restriction_message_record.timestamp_nanoseconds[reg_sho_restriction_message_at] = wire[at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.stock[reg_sho_restriction_message_at] = wire[at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_record.reg_sho_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Reg Sho Restriction Message is what was written, byte for byte */
inline equal_reg_sho_restriction_message(reg_sho_restriction_message_read, reg_sho_restriction_message_written) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 4 -> assert(reg_sho_restriction_message_read.timestamp_nanoseconds[reg_sho_restriction_message_at] == reg_sho_restriction_message_written.timestamp_nanoseconds[reg_sho_restriction_message_at]); reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> assert(reg_sho_restriction_message_read.stock[reg_sho_restriction_message_at] == reg_sho_restriction_message_written.stock[reg_sho_restriction_message_at]); reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  assert(reg_sho_restriction_message_read.reg_sho_action == reg_sho_restriction_message_written.reg_sho_action);
  skip
}

/* ---- Retail Price Improvement Indicator Message: 13 bytes -------------------- */

/* Identifies a retail interest indication of the Bid, Ask or both the Bid and Ask for NASDAQ-listed securities. */
typedef RetailPriceImprovementIndicatorMessage {
  byte timestamp_nanoseconds[4];
  byte stock[8];
  byte interest_flag
};

int retail_price_improvement_indicator_message_at;

/* every byte of Retail Price Improvement Indicator Message set to one value */
inline fill_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_record, retail_price_improvement_indicator_message_value) {
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 4 -> retail_price_improvement_indicator_message_record.timestamp_nanoseconds[retail_price_improvement_indicator_message_at] = retail_price_improvement_indicator_message_value; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 8 -> retail_price_improvement_indicator_message_record.stock[retail_price_improvement_indicator_message_at] = retail_price_improvement_indicator_message_value; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_record.interest_flag = retail_price_improvement_indicator_message_value;
  skip
}

/* each byte of Retail Price Improvement Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_record, retail_price_improvement_indicator_message_base) {
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 4 -> retail_price_improvement_indicator_message_record.timestamp_nanoseconds[retail_price_improvement_indicator_message_at] = (retail_price_improvement_indicator_message_base + 0 + retail_price_improvement_indicator_message_at + 1) % 256; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 8 -> retail_price_improvement_indicator_message_record.stock[retail_price_improvement_indicator_message_at] = (retail_price_improvement_indicator_message_base + 4 + retail_price_improvement_indicator_message_at + 1) % 256; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_record.interest_flag = (retail_price_improvement_indicator_message_base + 12 + 1) % 256;
  skip
}

/* Retail Price Improvement Indicator Message to the wire, 13 bytes from where the cursor stands */
inline encode_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_record) {
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 4 -> wire[at] = retail_price_improvement_indicator_message_record.timestamp_nanoseconds[retail_price_improvement_indicator_message_at]; at = at + 1; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 8 -> wire[at] = retail_price_improvement_indicator_message_record.stock[retail_price_improvement_indicator_message_at]; at = at + 1; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = retail_price_improvement_indicator_message_record.interest_flag; at = at + 1;
  skip
}

/* Retail Price Improvement Indicator Message off the wire, 13 bytes from where the cursor stands */
inline decode_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_record) {
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 4 -> retail_price_improvement_indicator_message_record.timestamp_nanoseconds[retail_price_improvement_indicator_message_at] = wire[at]; at = at + 1; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 8 -> retail_price_improvement_indicator_message_record.stock[retail_price_improvement_indicator_message_at] = wire[at]; at = at + 1; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_record.interest_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Retail Price Improvement Indicator Message is what was written, byte for byte */
inline equal_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_read, retail_price_improvement_indicator_message_written) {
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 4 -> assert(retail_price_improvement_indicator_message_read.timestamp_nanoseconds[retail_price_improvement_indicator_message_at] == retail_price_improvement_indicator_message_written.timestamp_nanoseconds[retail_price_improvement_indicator_message_at]); retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 8 -> assert(retail_price_improvement_indicator_message_read.stock[retail_price_improvement_indicator_message_at] == retail_price_improvement_indicator_message_written.stock[retail_price_improvement_indicator_message_at]); retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  assert(retail_price_improvement_indicator_message_read.interest_flag == retail_price_improvement_indicator_message_written.interest_flag);
  skip
}

/* ---- End Of Snapshot Message: 20 bytes --------------------------------------- */

/* The Snapshot message reflects the NASDAQ TotalView-ITCH 4.1 sequence number at the time that the NASDAQ GLIMPSE 4.1 spin was requested. */
typedef EndOfSnapshotMessage {
  byte itch_sequence_number[20]
};

int end_of_snapshot_message_at;

/* every byte of End Of Snapshot Message set to one value */
inline fill_end_of_snapshot_message(end_of_snapshot_message_record, end_of_snapshot_message_value) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> end_of_snapshot_message_record.itch_sequence_number[end_of_snapshot_message_at] = end_of_snapshot_message_value; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_snapshot_message(end_of_snapshot_message_record, end_of_snapshot_message_base) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> end_of_snapshot_message_record.itch_sequence_number[end_of_snapshot_message_at] = (end_of_snapshot_message_base + 0 + end_of_snapshot_message_at + 1) % 256; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Snapshot Message to the wire, 20 bytes from where the cursor stands */
inline encode_end_of_snapshot_message(end_of_snapshot_message_record) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> wire[at] = end_of_snapshot_message_record.itch_sequence_number[end_of_snapshot_message_at]; at = at + 1; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Snapshot Message off the wire, 20 bytes from where the cursor stands */
inline decode_end_of_snapshot_message(end_of_snapshot_message_record) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> end_of_snapshot_message_record.itch_sequence_number[end_of_snapshot_message_at] = wire[at]; at = at + 1; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Snapshot Message is what was written, byte for byte */
inline equal_end_of_snapshot_message(end_of_snapshot_message_read, end_of_snapshot_message_written) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 20 -> assert(end_of_snapshot_message_read.itch_sequence_number[end_of_snapshot_message_at] == end_of_snapshot_message_written.itch_sequence_number[end_of_snapshot_message_at]); end_of_snapshot_message_at = end_of_snapshot_message_at + 1
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

/* Timestamp Seconds Message: encoded, read back, and compared */
proctype check_timestamp_seconds_message() {
  TimestampSecondsMessage timestamp_seconds_message_sent;
  TimestampSecondsMessage timestamp_seconds_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_timestamp_seconds_message(timestamp_seconds_message_sent, 0)
  :: pattern == 1 -> fill_timestamp_seconds_message(timestamp_seconds_message_sent, 32)
  :: pattern == 2 -> fill_timestamp_seconds_message(timestamp_seconds_message_sent, 255)
  :: else -> ramp_timestamp_seconds_message(timestamp_seconds_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_timestamp_seconds_message(timestamp_seconds_message_sent);
    assert(at == 4);
    at = 0;
    decode_timestamp_seconds_message(timestamp_seconds_message_got);
    assert(at == 4);
    equal_timestamp_seconds_message(timestamp_seconds_message_got, timestamp_seconds_message_sent)
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
    assert(at == 5);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 5);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
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
    assert(at == 29);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 29);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Add Order Mpid Attribution Message: encoded, read back, and compared */
proctype check_add_order_mpid_attribution_message() {
  AddOrderMpidAttributionMessage add_order_mpid_attribution_message_sent;
  AddOrderMpidAttributionMessage add_order_mpid_attribution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_mpid_attribution_message(add_order_mpid_attribution_message_sent, 0)
  :: pattern == 1 -> fill_add_order_mpid_attribution_message(add_order_mpid_attribution_message_sent, 32)
  :: pattern == 2 -> fill_add_order_mpid_attribution_message(add_order_mpid_attribution_message_sent, 255)
  :: else -> ramp_add_order_mpid_attribution_message(add_order_mpid_attribution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_mpid_attribution_message(add_order_mpid_attribution_message_sent);
    assert(at == 33);
    at = 0;
    decode_add_order_mpid_attribution_message(add_order_mpid_attribution_message_got);
    assert(at == 33);
    equal_add_order_mpid_attribution_message(add_order_mpid_attribution_message_got, add_order_mpid_attribution_message_sent)
  }
}

/* Stock Directory Message: encoded, read back, and compared */
proctype check_stock_directory_message() {
  StockDirectoryMessage stock_directory_message_sent;
  StockDirectoryMessage stock_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_directory_message(stock_directory_message_sent, 0)
  :: pattern == 1 -> fill_stock_directory_message(stock_directory_message_sent, 32)
  :: pattern == 2 -> fill_stock_directory_message(stock_directory_message_sent, 255)
  :: else -> ramp_stock_directory_message(stock_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_directory_message(stock_directory_message_sent);
    assert(at == 19);
    at = 0;
    decode_stock_directory_message(stock_directory_message_got);
    assert(at == 19);
    equal_stock_directory_message(stock_directory_message_got, stock_directory_message_sent)
  }
}

/* Stock Trading Action Message: encoded, read back, and compared */
proctype check_stock_trading_action_message() {
  StockTradingActionMessage stock_trading_action_message_sent;
  StockTradingActionMessage stock_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_trading_action_message(stock_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_stock_trading_action_message(stock_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_stock_trading_action_message(stock_trading_action_message_sent, 255)
  :: else -> ramp_stock_trading_action_message(stock_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_trading_action_message(stock_trading_action_message_sent);
    assert(at == 18);
    at = 0;
    decode_stock_trading_action_message(stock_trading_action_message_got);
    assert(at == 18);
    equal_stock_trading_action_message(stock_trading_action_message_got, stock_trading_action_message_sent)
  }
}

/* Reg Sho Restriction Message: encoded, read back, and compared */
proctype check_reg_sho_restriction_message() {
  RegShoRestrictionMessage reg_sho_restriction_message_sent;
  RegShoRestrictionMessage reg_sho_restriction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reg_sho_restriction_message(reg_sho_restriction_message_sent, 0)
  :: pattern == 1 -> fill_reg_sho_restriction_message(reg_sho_restriction_message_sent, 32)
  :: pattern == 2 -> fill_reg_sho_restriction_message(reg_sho_restriction_message_sent, 255)
  :: else -> ramp_reg_sho_restriction_message(reg_sho_restriction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reg_sho_restriction_message(reg_sho_restriction_message_sent);
    assert(at == 13);
    at = 0;
    decode_reg_sho_restriction_message(reg_sho_restriction_message_got);
    assert(at == 13);
    equal_reg_sho_restriction_message(reg_sho_restriction_message_got, reg_sho_restriction_message_sent)
  }
}

/* Retail Price Improvement Indicator Message: encoded, read back, and compared */
proctype check_retail_price_improvement_indicator_message() {
  RetailPriceImprovementIndicatorMessage retail_price_improvement_indicator_message_sent;
  RetailPriceImprovementIndicatorMessage retail_price_improvement_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_sent, 0)
  :: pattern == 1 -> fill_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_sent, 32)
  :: pattern == 2 -> fill_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_sent, 255)
  :: else -> ramp_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_sent);
    assert(at == 13);
    at = 0;
    decode_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_got);
    assert(at == 13);
    equal_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_got, retail_price_improvement_indicator_message_sent)
  }
}

/* End Of Snapshot Message: encoded, read back, and compared */
proctype check_end_of_snapshot_message() {
  EndOfSnapshotMessage end_of_snapshot_message_sent;
  EndOfSnapshotMessage end_of_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_snapshot_message(end_of_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_end_of_snapshot_message(end_of_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_end_of_snapshot_message(end_of_snapshot_message_sent, 255)
  :: else -> ramp_end_of_snapshot_message(end_of_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_snapshot_message(end_of_snapshot_message_sent);
    assert(at == 20);
    at = 0;
    decode_end_of_snapshot_message(end_of_snapshot_message_got);
    assert(at == 20);
    equal_end_of_snapshot_message(end_of_snapshot_message_got, end_of_snapshot_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_timestamp_seconds_message()
  :: run check_system_event_message()
  :: run check_add_order_message()
  :: run check_add_order_mpid_attribution_message()
  :: run check_stock_directory_message()
  :: run check_stock_trading_action_message()
  :: run check_reg_sho_restriction_message()
  :: run check_retail_price_improvement_indicator_message()
  :: run check_end_of_snapshot_message()
  fi
}
