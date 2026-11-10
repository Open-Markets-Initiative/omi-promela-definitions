/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Orders
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
#define WIRE 79

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

/* ---- System Event Message: 9 bytes ------------------------------------------- */

typedef SystemEventMessage {
  byte timestamp[8];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 8 + 1) % 256;
  skip
}

/* System Event Message to the wire, 9 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 9 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Accepted Message: 65 bytes ---------------------------------------------- */

typedef AcceptedMessage {
  byte timestamp[8];
  byte order_token[14];
  byte buy_sell_indicator;
  byte shares[4];
  byte stock[8];
  byte price[4];
  byte time_in_force[4];
  byte firm[4];
  byte display;
  byte order_reference_number[8];
  byte capacity;
  byte intermarket_sweep_eligibility;
  byte minimum_quantity[4];
  byte cross_type;
  byte order_state;
  byte bbo_weight_indicator
};

int accepted_message_at;

/* every byte of Accepted Message set to one value */
inline fill_accepted_message(accepted_message_record, accepted_message_value) {
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.timestamp[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 14 -> accepted_message_record.order_token[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.buy_sell_indicator = accepted_message_value;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.shares[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.stock[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.price[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.time_in_force[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.firm[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.display = accepted_message_value;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.order_reference_number[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.capacity = accepted_message_value;
  accepted_message_record.intermarket_sweep_eligibility = accepted_message_value;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.minimum_quantity[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.cross_type = accepted_message_value;
  accepted_message_record.order_state = accepted_message_value;
  accepted_message_record.bbo_weight_indicator = accepted_message_value;
  skip
}

/* each byte of Accepted Message set to where it lies, so a field read out of place says so */
inline ramp_accepted_message(accepted_message_record, accepted_message_base) {
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.timestamp[accepted_message_at] = (accepted_message_base + 0 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 14 -> accepted_message_record.order_token[accepted_message_at] = (accepted_message_base + 8 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.buy_sell_indicator = (accepted_message_base + 22 + 1) % 256;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.shares[accepted_message_at] = (accepted_message_base + 23 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.stock[accepted_message_at] = (accepted_message_base + 27 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.price[accepted_message_at] = (accepted_message_base + 35 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.time_in_force[accepted_message_at] = (accepted_message_base + 39 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.firm[accepted_message_at] = (accepted_message_base + 43 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.display = (accepted_message_base + 47 + 1) % 256;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.order_reference_number[accepted_message_at] = (accepted_message_base + 48 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.capacity = (accepted_message_base + 56 + 1) % 256;
  accepted_message_record.intermarket_sweep_eligibility = (accepted_message_base + 57 + 1) % 256;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.minimum_quantity[accepted_message_at] = (accepted_message_base + 58 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.cross_type = (accepted_message_base + 62 + 1) % 256;
  accepted_message_record.order_state = (accepted_message_base + 63 + 1) % 256;
  accepted_message_record.bbo_weight_indicator = (accepted_message_base + 64 + 1) % 256;
  skip
}

/* Accepted Message to the wire, 65 bytes from where the cursor stands */
inline encode_accepted_message(accepted_message_record) {
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> wire[at] = accepted_message_record.timestamp[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 14 -> wire[at] = accepted_message_record.order_token[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = accepted_message_record.buy_sell_indicator; at = at + 1;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> wire[at] = accepted_message_record.shares[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> wire[at] = accepted_message_record.stock[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> wire[at] = accepted_message_record.price[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> wire[at] = accepted_message_record.time_in_force[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> wire[at] = accepted_message_record.firm[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = accepted_message_record.display; at = at + 1;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> wire[at] = accepted_message_record.order_reference_number[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = accepted_message_record.capacity; at = at + 1;
  wire[at] = accepted_message_record.intermarket_sweep_eligibility; at = at + 1;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> wire[at] = accepted_message_record.minimum_quantity[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = accepted_message_record.cross_type; at = at + 1;
  wire[at] = accepted_message_record.order_state; at = at + 1;
  wire[at] = accepted_message_record.bbo_weight_indicator; at = at + 1;
  skip
}

/* Accepted Message off the wire, 65 bytes from where the cursor stands */
inline decode_accepted_message(accepted_message_record) {
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.timestamp[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 14 -> accepted_message_record.order_token[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.shares[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.stock[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.price[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.time_in_force[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.firm[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.display = wire[at]; at = at + 1;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.order_reference_number[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.capacity = wire[at]; at = at + 1;
  accepted_message_record.intermarket_sweep_eligibility = wire[at]; at = at + 1;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.minimum_quantity[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.cross_type = wire[at]; at = at + 1;
  accepted_message_record.order_state = wire[at]; at = at + 1;
  accepted_message_record.bbo_weight_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Accepted Message is what was written, byte for byte */
inline equal_accepted_message(accepted_message_read, accepted_message_written) {
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> assert(accepted_message_read.timestamp[accepted_message_at] == accepted_message_written.timestamp[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 14 -> assert(accepted_message_read.order_token[accepted_message_at] == accepted_message_written.order_token[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  assert(accepted_message_read.buy_sell_indicator == accepted_message_written.buy_sell_indicator);
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> assert(accepted_message_read.shares[accepted_message_at] == accepted_message_written.shares[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> assert(accepted_message_read.stock[accepted_message_at] == accepted_message_written.stock[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> assert(accepted_message_read.price[accepted_message_at] == accepted_message_written.price[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> assert(accepted_message_read.time_in_force[accepted_message_at] == accepted_message_written.time_in_force[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> assert(accepted_message_read.firm[accepted_message_at] == accepted_message_written.firm[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  assert(accepted_message_read.display == accepted_message_written.display);
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> assert(accepted_message_read.order_reference_number[accepted_message_at] == accepted_message_written.order_reference_number[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  assert(accepted_message_read.capacity == accepted_message_written.capacity);
  assert(accepted_message_read.intermarket_sweep_eligibility == accepted_message_written.intermarket_sweep_eligibility);
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> assert(accepted_message_read.minimum_quantity[accepted_message_at] == accepted_message_written.minimum_quantity[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  assert(accepted_message_read.cross_type == accepted_message_written.cross_type);
  assert(accepted_message_read.order_state == accepted_message_written.order_state);
  assert(accepted_message_read.bbo_weight_indicator == accepted_message_written.bbo_weight_indicator);
  skip
}

/* ---- Replaced Message: 79 bytes ---------------------------------------------- */

typedef ReplacedMessage {
  byte timestamp[8];
  byte replacement_order_token[14];
  byte buy_sell_indicator;
  byte shares[4];
  byte stock[8];
  byte price[4];
  byte time_in_force[4];
  byte firm[4];
  byte display;
  byte order_reference_number[8];
  byte capacity;
  byte intermarket_sweep_eligibility;
  byte minimum_quantity[4];
  byte cross_type;
  byte order_state;
  byte previous_order_token[14];
  byte bbo_weight_indicator
};

int replaced_message_at;

/* every byte of Replaced Message set to one value */
inline fill_replaced_message(replaced_message_record, replaced_message_value) {
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.timestamp[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 14 -> replaced_message_record.replacement_order_token[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.buy_sell_indicator = replaced_message_value;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.shares[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.stock[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.price[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.time_in_force[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.firm[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.display = replaced_message_value;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.order_reference_number[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.capacity = replaced_message_value;
  replaced_message_record.intermarket_sweep_eligibility = replaced_message_value;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.minimum_quantity[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.cross_type = replaced_message_value;
  replaced_message_record.order_state = replaced_message_value;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 14 -> replaced_message_record.previous_order_token[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.bbo_weight_indicator = replaced_message_value;
  skip
}

/* each byte of Replaced Message set to where it lies, so a field read out of place says so */
inline ramp_replaced_message(replaced_message_record, replaced_message_base) {
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.timestamp[replaced_message_at] = (replaced_message_base + 0 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 14 -> replaced_message_record.replacement_order_token[replaced_message_at] = (replaced_message_base + 8 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.buy_sell_indicator = (replaced_message_base + 22 + 1) % 256;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.shares[replaced_message_at] = (replaced_message_base + 23 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.stock[replaced_message_at] = (replaced_message_base + 27 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.price[replaced_message_at] = (replaced_message_base + 35 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.time_in_force[replaced_message_at] = (replaced_message_base + 39 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.firm[replaced_message_at] = (replaced_message_base + 43 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.display = (replaced_message_base + 47 + 1) % 256;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.order_reference_number[replaced_message_at] = (replaced_message_base + 48 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.capacity = (replaced_message_base + 56 + 1) % 256;
  replaced_message_record.intermarket_sweep_eligibility = (replaced_message_base + 57 + 1) % 256;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.minimum_quantity[replaced_message_at] = (replaced_message_base + 58 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.cross_type = (replaced_message_base + 62 + 1) % 256;
  replaced_message_record.order_state = (replaced_message_base + 63 + 1) % 256;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 14 -> replaced_message_record.previous_order_token[replaced_message_at] = (replaced_message_base + 64 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.bbo_weight_indicator = (replaced_message_base + 78 + 1) % 256;
  skip
}

/* Replaced Message to the wire, 79 bytes from where the cursor stands */
inline encode_replaced_message(replaced_message_record) {
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> wire[at] = replaced_message_record.timestamp[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 14 -> wire[at] = replaced_message_record.replacement_order_token[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = replaced_message_record.buy_sell_indicator; at = at + 1;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> wire[at] = replaced_message_record.shares[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> wire[at] = replaced_message_record.stock[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> wire[at] = replaced_message_record.price[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> wire[at] = replaced_message_record.time_in_force[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> wire[at] = replaced_message_record.firm[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = replaced_message_record.display; at = at + 1;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> wire[at] = replaced_message_record.order_reference_number[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = replaced_message_record.capacity; at = at + 1;
  wire[at] = replaced_message_record.intermarket_sweep_eligibility; at = at + 1;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> wire[at] = replaced_message_record.minimum_quantity[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = replaced_message_record.cross_type; at = at + 1;
  wire[at] = replaced_message_record.order_state; at = at + 1;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 14 -> wire[at] = replaced_message_record.previous_order_token[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = replaced_message_record.bbo_weight_indicator; at = at + 1;
  skip
}

/* Replaced Message off the wire, 79 bytes from where the cursor stands */
inline decode_replaced_message(replaced_message_record) {
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.timestamp[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 14 -> replaced_message_record.replacement_order_token[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.shares[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.stock[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.price[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.time_in_force[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.firm[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.display = wire[at]; at = at + 1;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.order_reference_number[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.capacity = wire[at]; at = at + 1;
  replaced_message_record.intermarket_sweep_eligibility = wire[at]; at = at + 1;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.minimum_quantity[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.cross_type = wire[at]; at = at + 1;
  replaced_message_record.order_state = wire[at]; at = at + 1;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 14 -> replaced_message_record.previous_order_token[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.bbo_weight_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Replaced Message is what was written, byte for byte */
inline equal_replaced_message(replaced_message_read, replaced_message_written) {
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> assert(replaced_message_read.timestamp[replaced_message_at] == replaced_message_written.timestamp[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 14 -> assert(replaced_message_read.replacement_order_token[replaced_message_at] == replaced_message_written.replacement_order_token[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  assert(replaced_message_read.buy_sell_indicator == replaced_message_written.buy_sell_indicator);
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> assert(replaced_message_read.shares[replaced_message_at] == replaced_message_written.shares[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> assert(replaced_message_read.stock[replaced_message_at] == replaced_message_written.stock[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> assert(replaced_message_read.price[replaced_message_at] == replaced_message_written.price[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> assert(replaced_message_read.time_in_force[replaced_message_at] == replaced_message_written.time_in_force[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> assert(replaced_message_read.firm[replaced_message_at] == replaced_message_written.firm[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  assert(replaced_message_read.display == replaced_message_written.display);
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> assert(replaced_message_read.order_reference_number[replaced_message_at] == replaced_message_written.order_reference_number[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  assert(replaced_message_read.capacity == replaced_message_written.capacity);
  assert(replaced_message_read.intermarket_sweep_eligibility == replaced_message_written.intermarket_sweep_eligibility);
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> assert(replaced_message_read.minimum_quantity[replaced_message_at] == replaced_message_written.minimum_quantity[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  assert(replaced_message_read.cross_type == replaced_message_written.cross_type);
  assert(replaced_message_read.order_state == replaced_message_written.order_state);
  replaced_message_at = 0;
  do
  :: replaced_message_at < 14 -> assert(replaced_message_read.previous_order_token[replaced_message_at] == replaced_message_written.previous_order_token[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  assert(replaced_message_read.bbo_weight_indicator == replaced_message_written.bbo_weight_indicator);
  skip
}

/* ---- Canceled Message: 27 bytes ---------------------------------------------- */

typedef CanceledMessage {
  byte timestamp[8];
  byte order_token[14];
  byte decrement_shares[4];
  byte cancel_order_reason
};

int canceled_message_at;

/* every byte of Canceled Message set to one value */
inline fill_canceled_message(canceled_message_record, canceled_message_value) {
  canceled_message_at = 0;
  do
  :: canceled_message_at < 8 -> canceled_message_record.timestamp[canceled_message_at] = canceled_message_value; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 14 -> canceled_message_record.order_token[canceled_message_at] = canceled_message_value; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 4 -> canceled_message_record.decrement_shares[canceled_message_at] = canceled_message_value; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_record.cancel_order_reason = canceled_message_value;
  skip
}

/* each byte of Canceled Message set to where it lies, so a field read out of place says so */
inline ramp_canceled_message(canceled_message_record, canceled_message_base) {
  canceled_message_at = 0;
  do
  :: canceled_message_at < 8 -> canceled_message_record.timestamp[canceled_message_at] = (canceled_message_base + 0 + canceled_message_at + 1) % 256; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 14 -> canceled_message_record.order_token[canceled_message_at] = (canceled_message_base + 8 + canceled_message_at + 1) % 256; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 4 -> canceled_message_record.decrement_shares[canceled_message_at] = (canceled_message_base + 22 + canceled_message_at + 1) % 256; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_record.cancel_order_reason = (canceled_message_base + 26 + 1) % 256;
  skip
}

/* Canceled Message to the wire, 27 bytes from where the cursor stands */
inline encode_canceled_message(canceled_message_record) {
  canceled_message_at = 0;
  do
  :: canceled_message_at < 8 -> wire[at] = canceled_message_record.timestamp[canceled_message_at]; at = at + 1; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 14 -> wire[at] = canceled_message_record.order_token[canceled_message_at]; at = at + 1; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 4 -> wire[at] = canceled_message_record.decrement_shares[canceled_message_at]; at = at + 1; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = canceled_message_record.cancel_order_reason; at = at + 1;
  skip
}

/* Canceled Message off the wire, 27 bytes from where the cursor stands */
inline decode_canceled_message(canceled_message_record) {
  canceled_message_at = 0;
  do
  :: canceled_message_at < 8 -> canceled_message_record.timestamp[canceled_message_at] = wire[at]; at = at + 1; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 14 -> canceled_message_record.order_token[canceled_message_at] = wire[at]; at = at + 1; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 4 -> canceled_message_record.decrement_shares[canceled_message_at] = wire[at]; at = at + 1; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_record.cancel_order_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Canceled Message is what was written, byte for byte */
inline equal_canceled_message(canceled_message_read, canceled_message_written) {
  canceled_message_at = 0;
  do
  :: canceled_message_at < 8 -> assert(canceled_message_read.timestamp[canceled_message_at] == canceled_message_written.timestamp[canceled_message_at]); canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 14 -> assert(canceled_message_read.order_token[canceled_message_at] == canceled_message_written.order_token[canceled_message_at]); canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 4 -> assert(canceled_message_read.decrement_shares[canceled_message_at] == canceled_message_written.decrement_shares[canceled_message_at]); canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  assert(canceled_message_read.cancel_order_reason == canceled_message_written.cancel_order_reason);
  skip
}

/* ---- Aiq Cancelled Message: 36 bytes ----------------------------------------- */

typedef AiqCancelledMessage {
  byte timestamp[8];
  byte order_token[14];
  byte decrement_shares[4];
  byte cancel_order_reason;
  byte quantity_prevented_from_trading[4];
  byte execution_price[4];
  byte liquidity_flag
};

int aiq_cancelled_message_at;

/* every byte of Aiq Cancelled Message set to one value */
inline fill_aiq_cancelled_message(aiq_cancelled_message_record, aiq_cancelled_message_value) {
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 8 -> aiq_cancelled_message_record.timestamp[aiq_cancelled_message_at] = aiq_cancelled_message_value; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 14 -> aiq_cancelled_message_record.order_token[aiq_cancelled_message_at] = aiq_cancelled_message_value; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> aiq_cancelled_message_record.decrement_shares[aiq_cancelled_message_at] = aiq_cancelled_message_value; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_record.cancel_order_reason = aiq_cancelled_message_value;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> aiq_cancelled_message_record.quantity_prevented_from_trading[aiq_cancelled_message_at] = aiq_cancelled_message_value; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> aiq_cancelled_message_record.execution_price[aiq_cancelled_message_at] = aiq_cancelled_message_value; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_record.liquidity_flag = aiq_cancelled_message_value;
  skip
}

/* each byte of Aiq Cancelled Message set to where it lies, so a field read out of place says so */
inline ramp_aiq_cancelled_message(aiq_cancelled_message_record, aiq_cancelled_message_base) {
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 8 -> aiq_cancelled_message_record.timestamp[aiq_cancelled_message_at] = (aiq_cancelled_message_base + 0 + aiq_cancelled_message_at + 1) % 256; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 14 -> aiq_cancelled_message_record.order_token[aiq_cancelled_message_at] = (aiq_cancelled_message_base + 8 + aiq_cancelled_message_at + 1) % 256; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> aiq_cancelled_message_record.decrement_shares[aiq_cancelled_message_at] = (aiq_cancelled_message_base + 22 + aiq_cancelled_message_at + 1) % 256; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_record.cancel_order_reason = (aiq_cancelled_message_base + 26 + 1) % 256;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> aiq_cancelled_message_record.quantity_prevented_from_trading[aiq_cancelled_message_at] = (aiq_cancelled_message_base + 27 + aiq_cancelled_message_at + 1) % 256; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> aiq_cancelled_message_record.execution_price[aiq_cancelled_message_at] = (aiq_cancelled_message_base + 31 + aiq_cancelled_message_at + 1) % 256; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_record.liquidity_flag = (aiq_cancelled_message_base + 35 + 1) % 256;
  skip
}

/* Aiq Cancelled Message to the wire, 36 bytes from where the cursor stands */
inline encode_aiq_cancelled_message(aiq_cancelled_message_record) {
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 8 -> wire[at] = aiq_cancelled_message_record.timestamp[aiq_cancelled_message_at]; at = at + 1; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 14 -> wire[at] = aiq_cancelled_message_record.order_token[aiq_cancelled_message_at]; at = at + 1; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> wire[at] = aiq_cancelled_message_record.decrement_shares[aiq_cancelled_message_at]; at = at + 1; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  wire[at] = aiq_cancelled_message_record.cancel_order_reason; at = at + 1;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> wire[at] = aiq_cancelled_message_record.quantity_prevented_from_trading[aiq_cancelled_message_at]; at = at + 1; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> wire[at] = aiq_cancelled_message_record.execution_price[aiq_cancelled_message_at]; at = at + 1; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  wire[at] = aiq_cancelled_message_record.liquidity_flag; at = at + 1;
  skip
}

/* Aiq Cancelled Message off the wire, 36 bytes from where the cursor stands */
inline decode_aiq_cancelled_message(aiq_cancelled_message_record) {
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 8 -> aiq_cancelled_message_record.timestamp[aiq_cancelled_message_at] = wire[at]; at = at + 1; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 14 -> aiq_cancelled_message_record.order_token[aiq_cancelled_message_at] = wire[at]; at = at + 1; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> aiq_cancelled_message_record.decrement_shares[aiq_cancelled_message_at] = wire[at]; at = at + 1; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_record.cancel_order_reason = wire[at]; at = at + 1;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> aiq_cancelled_message_record.quantity_prevented_from_trading[aiq_cancelled_message_at] = wire[at]; at = at + 1; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> aiq_cancelled_message_record.execution_price[aiq_cancelled_message_at] = wire[at]; at = at + 1; aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_record.liquidity_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Aiq Cancelled Message is what was written, byte for byte */
inline equal_aiq_cancelled_message(aiq_cancelled_message_read, aiq_cancelled_message_written) {
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 8 -> assert(aiq_cancelled_message_read.timestamp[aiq_cancelled_message_at] == aiq_cancelled_message_written.timestamp[aiq_cancelled_message_at]); aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 14 -> assert(aiq_cancelled_message_read.order_token[aiq_cancelled_message_at] == aiq_cancelled_message_written.order_token[aiq_cancelled_message_at]); aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> assert(aiq_cancelled_message_read.decrement_shares[aiq_cancelled_message_at] == aiq_cancelled_message_written.decrement_shares[aiq_cancelled_message_at]); aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  assert(aiq_cancelled_message_read.cancel_order_reason == aiq_cancelled_message_written.cancel_order_reason);
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> assert(aiq_cancelled_message_read.quantity_prevented_from_trading[aiq_cancelled_message_at] == aiq_cancelled_message_written.quantity_prevented_from_trading[aiq_cancelled_message_at]); aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  aiq_cancelled_message_at = 0;
  do
  :: aiq_cancelled_message_at < 4 -> assert(aiq_cancelled_message_read.execution_price[aiq_cancelled_message_at] == aiq_cancelled_message_written.execution_price[aiq_cancelled_message_at]); aiq_cancelled_message_at = aiq_cancelled_message_at + 1
  :: else -> break
  od;
  assert(aiq_cancelled_message_read.liquidity_flag == aiq_cancelled_message_written.liquidity_flag);
  skip
}

/* ---- Executed Message: 39 bytes ---------------------------------------------- */

typedef ExecutedMessage {
  byte timestamp[8];
  byte order_token[14];
  byte executed_shares[4];
  byte execution_price[4];
  byte liquidity_flag;
  byte match_number[8]
};

int executed_message_at;

/* every byte of Executed Message set to one value */
inline fill_executed_message(executed_message_record, executed_message_value) {
  executed_message_at = 0;
  do
  :: executed_message_at < 8 -> executed_message_record.timestamp[executed_message_at] = executed_message_value; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 14 -> executed_message_record.order_token[executed_message_at] = executed_message_value; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 4 -> executed_message_record.executed_shares[executed_message_at] = executed_message_value; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 4 -> executed_message_record.execution_price[executed_message_at] = executed_message_value; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_record.liquidity_flag = executed_message_value;
  executed_message_at = 0;
  do
  :: executed_message_at < 8 -> executed_message_record.match_number[executed_message_at] = executed_message_value; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Executed Message set to where it lies, so a field read out of place says so */
inline ramp_executed_message(executed_message_record, executed_message_base) {
  executed_message_at = 0;
  do
  :: executed_message_at < 8 -> executed_message_record.timestamp[executed_message_at] = (executed_message_base + 0 + executed_message_at + 1) % 256; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 14 -> executed_message_record.order_token[executed_message_at] = (executed_message_base + 8 + executed_message_at + 1) % 256; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 4 -> executed_message_record.executed_shares[executed_message_at] = (executed_message_base + 22 + executed_message_at + 1) % 256; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 4 -> executed_message_record.execution_price[executed_message_at] = (executed_message_base + 26 + executed_message_at + 1) % 256; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_record.liquidity_flag = (executed_message_base + 30 + 1) % 256;
  executed_message_at = 0;
  do
  :: executed_message_at < 8 -> executed_message_record.match_number[executed_message_at] = (executed_message_base + 31 + executed_message_at + 1) % 256; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Executed Message to the wire, 39 bytes from where the cursor stands */
inline encode_executed_message(executed_message_record) {
  executed_message_at = 0;
  do
  :: executed_message_at < 8 -> wire[at] = executed_message_record.timestamp[executed_message_at]; at = at + 1; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 14 -> wire[at] = executed_message_record.order_token[executed_message_at]; at = at + 1; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 4 -> wire[at] = executed_message_record.executed_shares[executed_message_at]; at = at + 1; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 4 -> wire[at] = executed_message_record.execution_price[executed_message_at]; at = at + 1; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  wire[at] = executed_message_record.liquidity_flag; at = at + 1;
  executed_message_at = 0;
  do
  :: executed_message_at < 8 -> wire[at] = executed_message_record.match_number[executed_message_at]; at = at + 1; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Executed Message off the wire, 39 bytes from where the cursor stands */
inline decode_executed_message(executed_message_record) {
  executed_message_at = 0;
  do
  :: executed_message_at < 8 -> executed_message_record.timestamp[executed_message_at] = wire[at]; at = at + 1; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 14 -> executed_message_record.order_token[executed_message_at] = wire[at]; at = at + 1; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 4 -> executed_message_record.executed_shares[executed_message_at] = wire[at]; at = at + 1; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 4 -> executed_message_record.execution_price[executed_message_at] = wire[at]; at = at + 1; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_record.liquidity_flag = wire[at]; at = at + 1;
  executed_message_at = 0;
  do
  :: executed_message_at < 8 -> executed_message_record.match_number[executed_message_at] = wire[at]; at = at + 1; executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Executed Message is what was written, byte for byte */
inline equal_executed_message(executed_message_read, executed_message_written) {
  executed_message_at = 0;
  do
  :: executed_message_at < 8 -> assert(executed_message_read.timestamp[executed_message_at] == executed_message_written.timestamp[executed_message_at]); executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 14 -> assert(executed_message_read.order_token[executed_message_at] == executed_message_written.order_token[executed_message_at]); executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 4 -> assert(executed_message_read.executed_shares[executed_message_at] == executed_message_written.executed_shares[executed_message_at]); executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  executed_message_at = 0;
  do
  :: executed_message_at < 4 -> assert(executed_message_read.execution_price[executed_message_at] == executed_message_written.execution_price[executed_message_at]); executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  assert(executed_message_read.liquidity_flag == executed_message_written.liquidity_flag);
  executed_message_at = 0;
  do
  :: executed_message_at < 8 -> assert(executed_message_read.match_number[executed_message_at] == executed_message_written.match_number[executed_message_at]); executed_message_at = executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Broken Trade Message: 31 bytes ------------------------------------------ */

typedef BrokenTradeMessage {
  byte timestamp[8];
  byte order_token[14];
  byte match_number[8];
  byte broken_trade_reason
};

int broken_trade_message_at;

/* every byte of Broken Trade Message set to one value */
inline fill_broken_trade_message(broken_trade_message_record, broken_trade_message_value) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.timestamp[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 14 -> broken_trade_message_record.order_token[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.broken_trade_reason = broken_trade_message_value;
  skip
}

/* each byte of Broken Trade Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_message(broken_trade_message_record, broken_trade_message_base) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.timestamp[broken_trade_message_at] = (broken_trade_message_base + 0 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 14 -> broken_trade_message_record.order_token[broken_trade_message_at] = (broken_trade_message_base + 8 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = (broken_trade_message_base + 22 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.broken_trade_reason = (broken_trade_message_base + 30 + 1) % 256;
  skip
}

/* Broken Trade Message to the wire, 31 bytes from where the cursor stands */
inline encode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.timestamp[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 14 -> wire[at] = broken_trade_message_record.order_token[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.match_number[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = broken_trade_message_record.broken_trade_reason; at = at + 1;
  skip
}

/* Broken Trade Message off the wire, 31 bytes from where the cursor stands */
inline decode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.timestamp[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 14 -> broken_trade_message_record.order_token[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.broken_trade_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Broken Trade Message is what was written, byte for byte */
inline equal_broken_trade_message(broken_trade_message_read, broken_trade_message_written) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.timestamp[broken_trade_message_at] == broken_trade_message_written.timestamp[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 14 -> assert(broken_trade_message_read.order_token[broken_trade_message_at] == broken_trade_message_written.order_token[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.match_number[broken_trade_message_at] == broken_trade_message_written.match_number[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  assert(broken_trade_message_read.broken_trade_reason == broken_trade_message_written.broken_trade_reason);
  skip
}

/* ---- Executed With Reference Price Message: 44 bytes ------------------------- */

typedef ExecutedWithReferencePriceMessage {
  byte timestamp[8];
  byte order_token[14];
  byte executed_shares[4];
  byte execution_price[4];
  byte liquidity_flag;
  byte match_number[8];
  byte reference_price[4];
  byte reference_price_type
};

int executed_with_reference_price_message_at;

/* every byte of Executed With Reference Price Message set to one value */
inline fill_executed_with_reference_price_message(executed_with_reference_price_message_record, executed_with_reference_price_message_value) {
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 8 -> executed_with_reference_price_message_record.timestamp[executed_with_reference_price_message_at] = executed_with_reference_price_message_value; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 14 -> executed_with_reference_price_message_record.order_token[executed_with_reference_price_message_at] = executed_with_reference_price_message_value; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> executed_with_reference_price_message_record.executed_shares[executed_with_reference_price_message_at] = executed_with_reference_price_message_value; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> executed_with_reference_price_message_record.execution_price[executed_with_reference_price_message_at] = executed_with_reference_price_message_value; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_record.liquidity_flag = executed_with_reference_price_message_value;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 8 -> executed_with_reference_price_message_record.match_number[executed_with_reference_price_message_at] = executed_with_reference_price_message_value; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> executed_with_reference_price_message_record.reference_price[executed_with_reference_price_message_at] = executed_with_reference_price_message_value; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_record.reference_price_type = executed_with_reference_price_message_value;
  skip
}

/* each byte of Executed With Reference Price Message set to where it lies, so a field read out of place says so */
inline ramp_executed_with_reference_price_message(executed_with_reference_price_message_record, executed_with_reference_price_message_base) {
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 8 -> executed_with_reference_price_message_record.timestamp[executed_with_reference_price_message_at] = (executed_with_reference_price_message_base + 0 + executed_with_reference_price_message_at + 1) % 256; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 14 -> executed_with_reference_price_message_record.order_token[executed_with_reference_price_message_at] = (executed_with_reference_price_message_base + 8 + executed_with_reference_price_message_at + 1) % 256; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> executed_with_reference_price_message_record.executed_shares[executed_with_reference_price_message_at] = (executed_with_reference_price_message_base + 22 + executed_with_reference_price_message_at + 1) % 256; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> executed_with_reference_price_message_record.execution_price[executed_with_reference_price_message_at] = (executed_with_reference_price_message_base + 26 + executed_with_reference_price_message_at + 1) % 256; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_record.liquidity_flag = (executed_with_reference_price_message_base + 30 + 1) % 256;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 8 -> executed_with_reference_price_message_record.match_number[executed_with_reference_price_message_at] = (executed_with_reference_price_message_base + 31 + executed_with_reference_price_message_at + 1) % 256; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> executed_with_reference_price_message_record.reference_price[executed_with_reference_price_message_at] = (executed_with_reference_price_message_base + 39 + executed_with_reference_price_message_at + 1) % 256; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_record.reference_price_type = (executed_with_reference_price_message_base + 43 + 1) % 256;
  skip
}

/* Executed With Reference Price Message to the wire, 44 bytes from where the cursor stands */
inline encode_executed_with_reference_price_message(executed_with_reference_price_message_record) {
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 8 -> wire[at] = executed_with_reference_price_message_record.timestamp[executed_with_reference_price_message_at]; at = at + 1; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 14 -> wire[at] = executed_with_reference_price_message_record.order_token[executed_with_reference_price_message_at]; at = at + 1; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> wire[at] = executed_with_reference_price_message_record.executed_shares[executed_with_reference_price_message_at]; at = at + 1; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> wire[at] = executed_with_reference_price_message_record.execution_price[executed_with_reference_price_message_at]; at = at + 1; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  wire[at] = executed_with_reference_price_message_record.liquidity_flag; at = at + 1;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 8 -> wire[at] = executed_with_reference_price_message_record.match_number[executed_with_reference_price_message_at]; at = at + 1; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> wire[at] = executed_with_reference_price_message_record.reference_price[executed_with_reference_price_message_at]; at = at + 1; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  wire[at] = executed_with_reference_price_message_record.reference_price_type; at = at + 1;
  skip
}

/* Executed With Reference Price Message off the wire, 44 bytes from where the cursor stands */
inline decode_executed_with_reference_price_message(executed_with_reference_price_message_record) {
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 8 -> executed_with_reference_price_message_record.timestamp[executed_with_reference_price_message_at] = wire[at]; at = at + 1; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 14 -> executed_with_reference_price_message_record.order_token[executed_with_reference_price_message_at] = wire[at]; at = at + 1; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> executed_with_reference_price_message_record.executed_shares[executed_with_reference_price_message_at] = wire[at]; at = at + 1; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> executed_with_reference_price_message_record.execution_price[executed_with_reference_price_message_at] = wire[at]; at = at + 1; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_record.liquidity_flag = wire[at]; at = at + 1;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 8 -> executed_with_reference_price_message_record.match_number[executed_with_reference_price_message_at] = wire[at]; at = at + 1; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> executed_with_reference_price_message_record.reference_price[executed_with_reference_price_message_at] = wire[at]; at = at + 1; executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_record.reference_price_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Executed With Reference Price Message is what was written, byte for byte */
inline equal_executed_with_reference_price_message(executed_with_reference_price_message_read, executed_with_reference_price_message_written) {
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 8 -> assert(executed_with_reference_price_message_read.timestamp[executed_with_reference_price_message_at] == executed_with_reference_price_message_written.timestamp[executed_with_reference_price_message_at]); executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 14 -> assert(executed_with_reference_price_message_read.order_token[executed_with_reference_price_message_at] == executed_with_reference_price_message_written.order_token[executed_with_reference_price_message_at]); executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> assert(executed_with_reference_price_message_read.executed_shares[executed_with_reference_price_message_at] == executed_with_reference_price_message_written.executed_shares[executed_with_reference_price_message_at]); executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> assert(executed_with_reference_price_message_read.execution_price[executed_with_reference_price_message_at] == executed_with_reference_price_message_written.execution_price[executed_with_reference_price_message_at]); executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  assert(executed_with_reference_price_message_read.liquidity_flag == executed_with_reference_price_message_written.liquidity_flag);
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 8 -> assert(executed_with_reference_price_message_read.match_number[executed_with_reference_price_message_at] == executed_with_reference_price_message_written.match_number[executed_with_reference_price_message_at]); executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  executed_with_reference_price_message_at = 0;
  do
  :: executed_with_reference_price_message_at < 4 -> assert(executed_with_reference_price_message_read.reference_price[executed_with_reference_price_message_at] == executed_with_reference_price_message_written.reference_price[executed_with_reference_price_message_at]); executed_with_reference_price_message_at = executed_with_reference_price_message_at + 1
  :: else -> break
  od;
  assert(executed_with_reference_price_message_read.reference_price_type == executed_with_reference_price_message_written.reference_price_type);
  skip
}

/* ---- Trade Correction Message: 40 bytes -------------------------------------- */

typedef TradeCorrectionMessage {
  byte timestamp[8];
  byte order_token[14];
  byte executed_shares[4];
  byte execution_price[4];
  byte liquidity_flag;
  byte match_number[8];
  byte reason
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 14 -> trade_correction_message_record.order_token[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.executed_shares[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.execution_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.liquidity_flag = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.match_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.reason = trade_correction_message_value;
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp[trade_correction_message_at] = (trade_correction_message_base + 0 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 14 -> trade_correction_message_record.order_token[trade_correction_message_at] = (trade_correction_message_base + 8 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.executed_shares[trade_correction_message_at] = (trade_correction_message_base + 22 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.execution_price[trade_correction_message_at] = (trade_correction_message_base + 26 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.liquidity_flag = (trade_correction_message_base + 30 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.match_number[trade_correction_message_at] = (trade_correction_message_base + 31 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.reason = (trade_correction_message_base + 39 + 1) % 256;
  skip
}

/* Trade Correction Message to the wire, 40 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.timestamp[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 14 -> wire[at] = trade_correction_message_record.order_token[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.executed_shares[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.execution_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.liquidity_flag; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.match_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.reason; at = at + 1;
  skip
}

/* Trade Correction Message off the wire, 40 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 14 -> trade_correction_message_record.order_token[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.executed_shares[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.execution_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.liquidity_flag = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.match_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.timestamp[trade_correction_message_at] == trade_correction_message_written.timestamp[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 14 -> assert(trade_correction_message_read.order_token[trade_correction_message_at] == trade_correction_message_written.order_token[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.executed_shares[trade_correction_message_at] == trade_correction_message_written.executed_shares[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.execution_price[trade_correction_message_at] == trade_correction_message_written.execution_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.liquidity_flag == trade_correction_message_written.liquidity_flag);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.match_number[trade_correction_message_at] == trade_correction_message_written.match_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.reason == trade_correction_message_written.reason);
  skip
}

/* ---- Rejected Order Message: 23 bytes ---------------------------------------- */

typedef RejectedOrderMessage {
  byte timestamp[8];
  byte order_token[14];
  byte rejected_order_reason
};

int rejected_order_message_at;

/* every byte of Rejected Order Message set to one value */
inline fill_rejected_order_message(rejected_order_message_record, rejected_order_message_value) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 8 -> rejected_order_message_record.timestamp[rejected_order_message_at] = rejected_order_message_value; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 14 -> rejected_order_message_record.order_token[rejected_order_message_at] = rejected_order_message_value; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_record.rejected_order_reason = rejected_order_message_value;
  skip
}

/* each byte of Rejected Order Message set to where it lies, so a field read out of place says so */
inline ramp_rejected_order_message(rejected_order_message_record, rejected_order_message_base) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 8 -> rejected_order_message_record.timestamp[rejected_order_message_at] = (rejected_order_message_base + 0 + rejected_order_message_at + 1) % 256; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 14 -> rejected_order_message_record.order_token[rejected_order_message_at] = (rejected_order_message_base + 8 + rejected_order_message_at + 1) % 256; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_record.rejected_order_reason = (rejected_order_message_base + 22 + 1) % 256;
  skip
}

/* Rejected Order Message to the wire, 23 bytes from where the cursor stands */
inline encode_rejected_order_message(rejected_order_message_record) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 8 -> wire[at] = rejected_order_message_record.timestamp[rejected_order_message_at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 14 -> wire[at] = rejected_order_message_record.order_token[rejected_order_message_at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  wire[at] = rejected_order_message_record.rejected_order_reason; at = at + 1;
  skip
}

/* Rejected Order Message off the wire, 23 bytes from where the cursor stands */
inline decode_rejected_order_message(rejected_order_message_record) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 8 -> rejected_order_message_record.timestamp[rejected_order_message_at] = wire[at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 14 -> rejected_order_message_record.order_token[rejected_order_message_at] = wire[at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_record.rejected_order_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Rejected Order Message is what was written, byte for byte */
inline equal_rejected_order_message(rejected_order_message_read, rejected_order_message_written) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 8 -> assert(rejected_order_message_read.timestamp[rejected_order_message_at] == rejected_order_message_written.timestamp[rejected_order_message_at]); rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 14 -> assert(rejected_order_message_read.order_token[rejected_order_message_at] == rejected_order_message_written.order_token[rejected_order_message_at]); rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  assert(rejected_order_message_read.rejected_order_reason == rejected_order_message_written.rejected_order_reason);
  skip
}

/* ---- Cancel Pending Message: 22 bytes ---------------------------------------- */

typedef CancelPendingMessage {
  byte timestamp[8];
  byte order_token[14]
};

int cancel_pending_message_at;

/* every byte of Cancel Pending Message set to one value */
inline fill_cancel_pending_message(cancel_pending_message_record, cancel_pending_message_value) {
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 8 -> cancel_pending_message_record.timestamp[cancel_pending_message_at] = cancel_pending_message_value; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 14 -> cancel_pending_message_record.order_token[cancel_pending_message_at] = cancel_pending_message_value; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Pending Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_pending_message(cancel_pending_message_record, cancel_pending_message_base) {
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 8 -> cancel_pending_message_record.timestamp[cancel_pending_message_at] = (cancel_pending_message_base + 0 + cancel_pending_message_at + 1) % 256; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 14 -> cancel_pending_message_record.order_token[cancel_pending_message_at] = (cancel_pending_message_base + 8 + cancel_pending_message_at + 1) % 256; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Pending Message to the wire, 22 bytes from where the cursor stands */
inline encode_cancel_pending_message(cancel_pending_message_record) {
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 8 -> wire[at] = cancel_pending_message_record.timestamp[cancel_pending_message_at]; at = at + 1; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 14 -> wire[at] = cancel_pending_message_record.order_token[cancel_pending_message_at]; at = at + 1; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Pending Message off the wire, 22 bytes from where the cursor stands */
inline decode_cancel_pending_message(cancel_pending_message_record) {
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 8 -> cancel_pending_message_record.timestamp[cancel_pending_message_at] = wire[at]; at = at + 1; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 14 -> cancel_pending_message_record.order_token[cancel_pending_message_at] = wire[at]; at = at + 1; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Pending Message is what was written, byte for byte */
inline equal_cancel_pending_message(cancel_pending_message_read, cancel_pending_message_written) {
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 8 -> assert(cancel_pending_message_read.timestamp[cancel_pending_message_at] == cancel_pending_message_written.timestamp[cancel_pending_message_at]); cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 14 -> assert(cancel_pending_message_read.order_token[cancel_pending_message_at] == cancel_pending_message_written.order_token[cancel_pending_message_at]); cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Reject Message: 22 bytes ----------------------------------------- */

typedef CancelRejectMessage {
  byte timestamp[8];
  byte order_token[14]
};

int cancel_reject_message_at;

/* every byte of Cancel Reject Message set to one value */
inline fill_cancel_reject_message(cancel_reject_message_record, cancel_reject_message_value) {
  cancel_reject_message_at = 0;
  do
  :: cancel_reject_message_at < 8 -> cancel_reject_message_record.timestamp[cancel_reject_message_at] = cancel_reject_message_value; cancel_reject_message_at = cancel_reject_message_at + 1
  :: else -> break
  od;
  cancel_reject_message_at = 0;
  do
  :: cancel_reject_message_at < 14 -> cancel_reject_message_record.order_token[cancel_reject_message_at] = cancel_reject_message_value; cancel_reject_message_at = cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Reject Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_reject_message(cancel_reject_message_record, cancel_reject_message_base) {
  cancel_reject_message_at = 0;
  do
  :: cancel_reject_message_at < 8 -> cancel_reject_message_record.timestamp[cancel_reject_message_at] = (cancel_reject_message_base + 0 + cancel_reject_message_at + 1) % 256; cancel_reject_message_at = cancel_reject_message_at + 1
  :: else -> break
  od;
  cancel_reject_message_at = 0;
  do
  :: cancel_reject_message_at < 14 -> cancel_reject_message_record.order_token[cancel_reject_message_at] = (cancel_reject_message_base + 8 + cancel_reject_message_at + 1) % 256; cancel_reject_message_at = cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Reject Message to the wire, 22 bytes from where the cursor stands */
inline encode_cancel_reject_message(cancel_reject_message_record) {
  cancel_reject_message_at = 0;
  do
  :: cancel_reject_message_at < 8 -> wire[at] = cancel_reject_message_record.timestamp[cancel_reject_message_at]; at = at + 1; cancel_reject_message_at = cancel_reject_message_at + 1
  :: else -> break
  od;
  cancel_reject_message_at = 0;
  do
  :: cancel_reject_message_at < 14 -> wire[at] = cancel_reject_message_record.order_token[cancel_reject_message_at]; at = at + 1; cancel_reject_message_at = cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Reject Message off the wire, 22 bytes from where the cursor stands */
inline decode_cancel_reject_message(cancel_reject_message_record) {
  cancel_reject_message_at = 0;
  do
  :: cancel_reject_message_at < 8 -> cancel_reject_message_record.timestamp[cancel_reject_message_at] = wire[at]; at = at + 1; cancel_reject_message_at = cancel_reject_message_at + 1
  :: else -> break
  od;
  cancel_reject_message_at = 0;
  do
  :: cancel_reject_message_at < 14 -> cancel_reject_message_record.order_token[cancel_reject_message_at] = wire[at]; at = at + 1; cancel_reject_message_at = cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Reject Message is what was written, byte for byte */
inline equal_cancel_reject_message(cancel_reject_message_read, cancel_reject_message_written) {
  cancel_reject_message_at = 0;
  do
  :: cancel_reject_message_at < 8 -> assert(cancel_reject_message_read.timestamp[cancel_reject_message_at] == cancel_reject_message_written.timestamp[cancel_reject_message_at]); cancel_reject_message_at = cancel_reject_message_at + 1
  :: else -> break
  od;
  cancel_reject_message_at = 0;
  do
  :: cancel_reject_message_at < 14 -> assert(cancel_reject_message_read.order_token[cancel_reject_message_at] == cancel_reject_message_written.order_token[cancel_reject_message_at]); cancel_reject_message_at = cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Priority Update Message: 35 bytes --------------------------------- */

typedef OrderPriorityUpdateMessage {
  byte timestamp[8];
  byte order_token[14];
  byte price[4];
  byte display;
  byte order_reference_number[8]
};

int order_priority_update_message_at;

/* every byte of Order Priority Update Message set to one value */
inline fill_order_priority_update_message(order_priority_update_message_record, order_priority_update_message_value) {
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 8 -> order_priority_update_message_record.timestamp[order_priority_update_message_at] = order_priority_update_message_value; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 14 -> order_priority_update_message_record.order_token[order_priority_update_message_at] = order_priority_update_message_value; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 4 -> order_priority_update_message_record.price[order_priority_update_message_at] = order_priority_update_message_value; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  order_priority_update_message_record.display = order_priority_update_message_value;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 8 -> order_priority_update_message_record.order_reference_number[order_priority_update_message_at] = order_priority_update_message_value; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Priority Update Message set to where it lies, so a field read out of place says so */
inline ramp_order_priority_update_message(order_priority_update_message_record, order_priority_update_message_base) {
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 8 -> order_priority_update_message_record.timestamp[order_priority_update_message_at] = (order_priority_update_message_base + 0 + order_priority_update_message_at + 1) % 256; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 14 -> order_priority_update_message_record.order_token[order_priority_update_message_at] = (order_priority_update_message_base + 8 + order_priority_update_message_at + 1) % 256; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 4 -> order_priority_update_message_record.price[order_priority_update_message_at] = (order_priority_update_message_base + 22 + order_priority_update_message_at + 1) % 256; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  order_priority_update_message_record.display = (order_priority_update_message_base + 26 + 1) % 256;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 8 -> order_priority_update_message_record.order_reference_number[order_priority_update_message_at] = (order_priority_update_message_base + 27 + order_priority_update_message_at + 1) % 256; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Priority Update Message to the wire, 35 bytes from where the cursor stands */
inline encode_order_priority_update_message(order_priority_update_message_record) {
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 8 -> wire[at] = order_priority_update_message_record.timestamp[order_priority_update_message_at]; at = at + 1; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 14 -> wire[at] = order_priority_update_message_record.order_token[order_priority_update_message_at]; at = at + 1; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 4 -> wire[at] = order_priority_update_message_record.price[order_priority_update_message_at]; at = at + 1; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  wire[at] = order_priority_update_message_record.display; at = at + 1;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 8 -> wire[at] = order_priority_update_message_record.order_reference_number[order_priority_update_message_at]; at = at + 1; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Priority Update Message off the wire, 35 bytes from where the cursor stands */
inline decode_order_priority_update_message(order_priority_update_message_record) {
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 8 -> order_priority_update_message_record.timestamp[order_priority_update_message_at] = wire[at]; at = at + 1; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 14 -> order_priority_update_message_record.order_token[order_priority_update_message_at] = wire[at]; at = at + 1; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 4 -> order_priority_update_message_record.price[order_priority_update_message_at] = wire[at]; at = at + 1; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  order_priority_update_message_record.display = wire[at]; at = at + 1;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 8 -> order_priority_update_message_record.order_reference_number[order_priority_update_message_at] = wire[at]; at = at + 1; order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Priority Update Message is what was written, byte for byte */
inline equal_order_priority_update_message(order_priority_update_message_read, order_priority_update_message_written) {
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 8 -> assert(order_priority_update_message_read.timestamp[order_priority_update_message_at] == order_priority_update_message_written.timestamp[order_priority_update_message_at]); order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 14 -> assert(order_priority_update_message_read.order_token[order_priority_update_message_at] == order_priority_update_message_written.order_token[order_priority_update_message_at]); order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 4 -> assert(order_priority_update_message_read.price[order_priority_update_message_at] == order_priority_update_message_written.price[order_priority_update_message_at]); order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  assert(order_priority_update_message_read.display == order_priority_update_message_written.display);
  order_priority_update_message_at = 0;
  do
  :: order_priority_update_message_at < 8 -> assert(order_priority_update_message_read.order_reference_number[order_priority_update_message_at] == order_priority_update_message_written.order_reference_number[order_priority_update_message_at]); order_priority_update_message_at = order_priority_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modified Message: 27 bytes ---------------------------------------- */

typedef OrderModifiedMessage {
  byte timestamp[8];
  byte order_token[14];
  byte buy_sell_indicator;
  byte shares[4]
};

int order_modified_message_at;

/* every byte of Order Modified Message set to one value */
inline fill_order_modified_message(order_modified_message_record, order_modified_message_value) {
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.timestamp[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 14 -> order_modified_message_record.order_token[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.buy_sell_indicator = order_modified_message_value;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.shares[order_modified_message_at] = order_modified_message_value; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modified Message set to where it lies, so a field read out of place says so */
inline ramp_order_modified_message(order_modified_message_record, order_modified_message_base) {
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.timestamp[order_modified_message_at] = (order_modified_message_base + 0 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 14 -> order_modified_message_record.order_token[order_modified_message_at] = (order_modified_message_base + 8 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.buy_sell_indicator = (order_modified_message_base + 22 + 1) % 256;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.shares[order_modified_message_at] = (order_modified_message_base + 23 + order_modified_message_at + 1) % 256; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Message to the wire, 27 bytes from where the cursor stands */
inline encode_order_modified_message(order_modified_message_record) {
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> wire[at] = order_modified_message_record.timestamp[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 14 -> wire[at] = order_modified_message_record.order_token[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  wire[at] = order_modified_message_record.buy_sell_indicator; at = at + 1;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> wire[at] = order_modified_message_record.shares[order_modified_message_at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modified Message off the wire, 27 bytes from where the cursor stands */
inline decode_order_modified_message(order_modified_message_record) {
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> order_modified_message_record.timestamp[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 14 -> order_modified_message_record.order_token[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> order_modified_message_record.shares[order_modified_message_at] = wire[at]; at = at + 1; order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modified Message is what was written, byte for byte */
inline equal_order_modified_message(order_modified_message_read, order_modified_message_written) {
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 8 -> assert(order_modified_message_read.timestamp[order_modified_message_at] == order_modified_message_written.timestamp[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 14 -> assert(order_modified_message_read.order_token[order_modified_message_at] == order_modified_message_written.order_token[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  assert(order_modified_message_read.buy_sell_indicator == order_modified_message_written.buy_sell_indicator);
  order_modified_message_at = 0;
  do
  :: order_modified_message_at < 4 -> assert(order_modified_message_read.shares[order_modified_message_at] == order_modified_message_written.shares[order_modified_message_at]); order_modified_message_at = order_modified_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequenced Trade Now Message: 22 bytes ----------------------------------- */

typedef SequencedTradeNowMessage {
  byte timestamp[8];
  byte order_token[14]
};

int sequenced_trade_now_message_at;

/* every byte of Sequenced Trade Now Message set to one value */
inline fill_sequenced_trade_now_message(sequenced_trade_now_message_record, sequenced_trade_now_message_value) {
  sequenced_trade_now_message_at = 0;
  do
  :: sequenced_trade_now_message_at < 8 -> sequenced_trade_now_message_record.timestamp[sequenced_trade_now_message_at] = sequenced_trade_now_message_value; sequenced_trade_now_message_at = sequenced_trade_now_message_at + 1
  :: else -> break
  od;
  sequenced_trade_now_message_at = 0;
  do
  :: sequenced_trade_now_message_at < 14 -> sequenced_trade_now_message_record.order_token[sequenced_trade_now_message_at] = sequenced_trade_now_message_value; sequenced_trade_now_message_at = sequenced_trade_now_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequenced Trade Now Message set to where it lies, so a field read out of place says so */
inline ramp_sequenced_trade_now_message(sequenced_trade_now_message_record, sequenced_trade_now_message_base) {
  sequenced_trade_now_message_at = 0;
  do
  :: sequenced_trade_now_message_at < 8 -> sequenced_trade_now_message_record.timestamp[sequenced_trade_now_message_at] = (sequenced_trade_now_message_base + 0 + sequenced_trade_now_message_at + 1) % 256; sequenced_trade_now_message_at = sequenced_trade_now_message_at + 1
  :: else -> break
  od;
  sequenced_trade_now_message_at = 0;
  do
  :: sequenced_trade_now_message_at < 14 -> sequenced_trade_now_message_record.order_token[sequenced_trade_now_message_at] = (sequenced_trade_now_message_base + 8 + sequenced_trade_now_message_at + 1) % 256; sequenced_trade_now_message_at = sequenced_trade_now_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequenced Trade Now Message to the wire, 22 bytes from where the cursor stands */
inline encode_sequenced_trade_now_message(sequenced_trade_now_message_record) {
  sequenced_trade_now_message_at = 0;
  do
  :: sequenced_trade_now_message_at < 8 -> wire[at] = sequenced_trade_now_message_record.timestamp[sequenced_trade_now_message_at]; at = at + 1; sequenced_trade_now_message_at = sequenced_trade_now_message_at + 1
  :: else -> break
  od;
  sequenced_trade_now_message_at = 0;
  do
  :: sequenced_trade_now_message_at < 14 -> wire[at] = sequenced_trade_now_message_record.order_token[sequenced_trade_now_message_at]; at = at + 1; sequenced_trade_now_message_at = sequenced_trade_now_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequenced Trade Now Message off the wire, 22 bytes from where the cursor stands */
inline decode_sequenced_trade_now_message(sequenced_trade_now_message_record) {
  sequenced_trade_now_message_at = 0;
  do
  :: sequenced_trade_now_message_at < 8 -> sequenced_trade_now_message_record.timestamp[sequenced_trade_now_message_at] = wire[at]; at = at + 1; sequenced_trade_now_message_at = sequenced_trade_now_message_at + 1
  :: else -> break
  od;
  sequenced_trade_now_message_at = 0;
  do
  :: sequenced_trade_now_message_at < 14 -> sequenced_trade_now_message_record.order_token[sequenced_trade_now_message_at] = wire[at]; at = at + 1; sequenced_trade_now_message_at = sequenced_trade_now_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequenced Trade Now Message is what was written, byte for byte */
inline equal_sequenced_trade_now_message(sequenced_trade_now_message_read, sequenced_trade_now_message_written) {
  sequenced_trade_now_message_at = 0;
  do
  :: sequenced_trade_now_message_at < 8 -> assert(sequenced_trade_now_message_read.timestamp[sequenced_trade_now_message_at] == sequenced_trade_now_message_written.timestamp[sequenced_trade_now_message_at]); sequenced_trade_now_message_at = sequenced_trade_now_message_at + 1
  :: else -> break
  od;
  sequenced_trade_now_message_at = 0;
  do
  :: sequenced_trade_now_message_at < 14 -> assert(sequenced_trade_now_message_read.order_token[sequenced_trade_now_message_at] == sequenced_trade_now_message_written.order_token[sequenced_trade_now_message_at]); sequenced_trade_now_message_at = sequenced_trade_now_message_at + 1
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
    assert(at == 9);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 9);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Accepted Message: encoded, read back, and compared */
proctype check_accepted_message() {
  AcceptedMessage accepted_message_sent;
  AcceptedMessage accepted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_accepted_message(accepted_message_sent, 0)
  :: pattern == 1 -> fill_accepted_message(accepted_message_sent, 32)
  :: pattern == 2 -> fill_accepted_message(accepted_message_sent, 255)
  :: else -> ramp_accepted_message(accepted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_accepted_message(accepted_message_sent);
    assert(at == 65);
    at = 0;
    decode_accepted_message(accepted_message_got);
    assert(at == 65);
    equal_accepted_message(accepted_message_got, accepted_message_sent)
  }
}

/* Replaced Message: encoded, read back, and compared */
proctype check_replaced_message() {
  ReplacedMessage replaced_message_sent;
  ReplacedMessage replaced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replaced_message(replaced_message_sent, 0)
  :: pattern == 1 -> fill_replaced_message(replaced_message_sent, 32)
  :: pattern == 2 -> fill_replaced_message(replaced_message_sent, 255)
  :: else -> ramp_replaced_message(replaced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replaced_message(replaced_message_sent);
    assert(at == 79);
    at = 0;
    decode_replaced_message(replaced_message_got);
    assert(at == 79);
    equal_replaced_message(replaced_message_got, replaced_message_sent)
  }
}

/* Canceled Message: encoded, read back, and compared */
proctype check_canceled_message() {
  CanceledMessage canceled_message_sent;
  CanceledMessage canceled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_canceled_message(canceled_message_sent, 0)
  :: pattern == 1 -> fill_canceled_message(canceled_message_sent, 32)
  :: pattern == 2 -> fill_canceled_message(canceled_message_sent, 255)
  :: else -> ramp_canceled_message(canceled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_canceled_message(canceled_message_sent);
    assert(at == 27);
    at = 0;
    decode_canceled_message(canceled_message_got);
    assert(at == 27);
    equal_canceled_message(canceled_message_got, canceled_message_sent)
  }
}

/* Aiq Cancelled Message: encoded, read back, and compared */
proctype check_aiq_cancelled_message() {
  AiqCancelledMessage aiq_cancelled_message_sent;
  AiqCancelledMessage aiq_cancelled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_aiq_cancelled_message(aiq_cancelled_message_sent, 0)
  :: pattern == 1 -> fill_aiq_cancelled_message(aiq_cancelled_message_sent, 32)
  :: pattern == 2 -> fill_aiq_cancelled_message(aiq_cancelled_message_sent, 255)
  :: else -> ramp_aiq_cancelled_message(aiq_cancelled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_aiq_cancelled_message(aiq_cancelled_message_sent);
    assert(at == 36);
    at = 0;
    decode_aiq_cancelled_message(aiq_cancelled_message_got);
    assert(at == 36);
    equal_aiq_cancelled_message(aiq_cancelled_message_got, aiq_cancelled_message_sent)
  }
}

/* Executed Message: encoded, read back, and compared */
proctype check_executed_message() {
  ExecutedMessage executed_message_sent;
  ExecutedMessage executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_executed_message(executed_message_sent, 0)
  :: pattern == 1 -> fill_executed_message(executed_message_sent, 32)
  :: pattern == 2 -> fill_executed_message(executed_message_sent, 255)
  :: else -> ramp_executed_message(executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_executed_message(executed_message_sent);
    assert(at == 39);
    at = 0;
    decode_executed_message(executed_message_got);
    assert(at == 39);
    equal_executed_message(executed_message_got, executed_message_sent)
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
    assert(at == 31);
    at = 0;
    decode_broken_trade_message(broken_trade_message_got);
    assert(at == 31);
    equal_broken_trade_message(broken_trade_message_got, broken_trade_message_sent)
  }
}

/* Executed With Reference Price Message: encoded, read back, and compared */
proctype check_executed_with_reference_price_message() {
  ExecutedWithReferencePriceMessage executed_with_reference_price_message_sent;
  ExecutedWithReferencePriceMessage executed_with_reference_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_executed_with_reference_price_message(executed_with_reference_price_message_sent, 0)
  :: pattern == 1 -> fill_executed_with_reference_price_message(executed_with_reference_price_message_sent, 32)
  :: pattern == 2 -> fill_executed_with_reference_price_message(executed_with_reference_price_message_sent, 255)
  :: else -> ramp_executed_with_reference_price_message(executed_with_reference_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_executed_with_reference_price_message(executed_with_reference_price_message_sent);
    assert(at == 44);
    at = 0;
    decode_executed_with_reference_price_message(executed_with_reference_price_message_got);
    assert(at == 44);
    equal_executed_with_reference_price_message(executed_with_reference_price_message_got, executed_with_reference_price_message_sent)
  }
}

/* Trade Correction Message: encoded, read back, and compared */
proctype check_trade_correction_message() {
  TradeCorrectionMessage trade_correction_message_sent;
  TradeCorrectionMessage trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_correction_message(trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_trade_correction_message(trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_trade_correction_message(trade_correction_message_sent, 255)
  :: else -> ramp_trade_correction_message(trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_correction_message(trade_correction_message_sent);
    assert(at == 40);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 40);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* Rejected Order Message: encoded, read back, and compared */
proctype check_rejected_order_message() {
  RejectedOrderMessage rejected_order_message_sent;
  RejectedOrderMessage rejected_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rejected_order_message(rejected_order_message_sent, 0)
  :: pattern == 1 -> fill_rejected_order_message(rejected_order_message_sent, 32)
  :: pattern == 2 -> fill_rejected_order_message(rejected_order_message_sent, 255)
  :: else -> ramp_rejected_order_message(rejected_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rejected_order_message(rejected_order_message_sent);
    assert(at == 23);
    at = 0;
    decode_rejected_order_message(rejected_order_message_got);
    assert(at == 23);
    equal_rejected_order_message(rejected_order_message_got, rejected_order_message_sent)
  }
}

/* Cancel Pending Message: encoded, read back, and compared */
proctype check_cancel_pending_message() {
  CancelPendingMessage cancel_pending_message_sent;
  CancelPendingMessage cancel_pending_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_pending_message(cancel_pending_message_sent, 0)
  :: pattern == 1 -> fill_cancel_pending_message(cancel_pending_message_sent, 32)
  :: pattern == 2 -> fill_cancel_pending_message(cancel_pending_message_sent, 255)
  :: else -> ramp_cancel_pending_message(cancel_pending_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_pending_message(cancel_pending_message_sent);
    assert(at == 22);
    at = 0;
    decode_cancel_pending_message(cancel_pending_message_got);
    assert(at == 22);
    equal_cancel_pending_message(cancel_pending_message_got, cancel_pending_message_sent)
  }
}

/* Cancel Reject Message: encoded, read back, and compared */
proctype check_cancel_reject_message() {
  CancelRejectMessage cancel_reject_message_sent;
  CancelRejectMessage cancel_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_reject_message(cancel_reject_message_sent, 0)
  :: pattern == 1 -> fill_cancel_reject_message(cancel_reject_message_sent, 32)
  :: pattern == 2 -> fill_cancel_reject_message(cancel_reject_message_sent, 255)
  :: else -> ramp_cancel_reject_message(cancel_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_reject_message(cancel_reject_message_sent);
    assert(at == 22);
    at = 0;
    decode_cancel_reject_message(cancel_reject_message_got);
    assert(at == 22);
    equal_cancel_reject_message(cancel_reject_message_got, cancel_reject_message_sent)
  }
}

/* Order Priority Update Message: encoded, read back, and compared */
proctype check_order_priority_update_message() {
  OrderPriorityUpdateMessage order_priority_update_message_sent;
  OrderPriorityUpdateMessage order_priority_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_priority_update_message(order_priority_update_message_sent, 0)
  :: pattern == 1 -> fill_order_priority_update_message(order_priority_update_message_sent, 32)
  :: pattern == 2 -> fill_order_priority_update_message(order_priority_update_message_sent, 255)
  :: else -> ramp_order_priority_update_message(order_priority_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_priority_update_message(order_priority_update_message_sent);
    assert(at == 35);
    at = 0;
    decode_order_priority_update_message(order_priority_update_message_got);
    assert(at == 35);
    equal_order_priority_update_message(order_priority_update_message_got, order_priority_update_message_sent)
  }
}

/* Order Modified Message: encoded, read back, and compared */
proctype check_order_modified_message() {
  OrderModifiedMessage order_modified_message_sent;
  OrderModifiedMessage order_modified_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modified_message(order_modified_message_sent, 0)
  :: pattern == 1 -> fill_order_modified_message(order_modified_message_sent, 32)
  :: pattern == 2 -> fill_order_modified_message(order_modified_message_sent, 255)
  :: else -> ramp_order_modified_message(order_modified_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modified_message(order_modified_message_sent);
    assert(at == 27);
    at = 0;
    decode_order_modified_message(order_modified_message_got);
    assert(at == 27);
    equal_order_modified_message(order_modified_message_got, order_modified_message_sent)
  }
}

/* Sequenced Trade Now Message: encoded, read back, and compared */
proctype check_sequenced_trade_now_message() {
  SequencedTradeNowMessage sequenced_trade_now_message_sent;
  SequencedTradeNowMessage sequenced_trade_now_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequenced_trade_now_message(sequenced_trade_now_message_sent, 0)
  :: pattern == 1 -> fill_sequenced_trade_now_message(sequenced_trade_now_message_sent, 32)
  :: pattern == 2 -> fill_sequenced_trade_now_message(sequenced_trade_now_message_sent, 255)
  :: else -> ramp_sequenced_trade_now_message(sequenced_trade_now_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequenced_trade_now_message(sequenced_trade_now_message_sent);
    assert(at == 22);
    at = 0;
    decode_sequenced_trade_now_message(sequenced_trade_now_message_got);
    assert(at == 22);
    equal_sequenced_trade_now_message(sequenced_trade_now_message_got, sequenced_trade_now_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_system_event_message()
  :: run check_accepted_message()
  :: run check_replaced_message()
  :: run check_canceled_message()
  :: run check_aiq_cancelled_message()
  :: run check_executed_message()
  :: run check_broken_trade_message()
  :: run check_executed_with_reference_price_message()
  :: run check_trade_correction_message()
  :: run check_rejected_order_message()
  :: run check_cancel_pending_message()
  :: run check_cancel_reject_message()
  :: run check_order_priority_update_message()
  :: run check_order_modified_message()
  :: run check_sequenced_trade_now_message()
  fi
}
