/*
 * Bolsa Institucional de Valores Order Entry
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
#define WIRE 59

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

/* System event message */
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

/* ---- Accepted Message: 59 bytes ---------------------------------------------- */

/* Accepted message echoing the data fields of the Enter Order Message */
typedef AcceptedMessage {
  byte timestamp[8];
  byte order_token[4];
  byte account_type;
  byte account_id[4];
  byte order_verb;
  byte quantity[8];
  byte orderbook[4];
  byte price[4];
  byte time_in_force[4];
  byte client_id[4];
  byte order_reference_number[8];
  byte minimum_quantity[8];
  byte order_state
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
  :: accepted_message_at < 4 -> accepted_message_record.order_token[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.account_type = accepted_message_value;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.account_id[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.order_verb = accepted_message_value;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.quantity[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.orderbook[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
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
  :: accepted_message_at < 4 -> accepted_message_record.client_id[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.order_reference_number[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.minimum_quantity[accepted_message_at] = accepted_message_value; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.order_state = accepted_message_value;
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
  :: accepted_message_at < 4 -> accepted_message_record.order_token[accepted_message_at] = (accepted_message_base + 8 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.account_type = (accepted_message_base + 12 + 1) % 256;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.account_id[accepted_message_at] = (accepted_message_base + 13 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.order_verb = (accepted_message_base + 17 + 1) % 256;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.quantity[accepted_message_at] = (accepted_message_base + 18 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.orderbook[accepted_message_at] = (accepted_message_base + 26 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.price[accepted_message_at] = (accepted_message_base + 30 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.time_in_force[accepted_message_at] = (accepted_message_base + 34 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.client_id[accepted_message_at] = (accepted_message_base + 38 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.order_reference_number[accepted_message_at] = (accepted_message_base + 42 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.minimum_quantity[accepted_message_at] = (accepted_message_base + 50 + accepted_message_at + 1) % 256; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.order_state = (accepted_message_base + 58 + 1) % 256;
  skip
}

/* Accepted Message to the wire, 59 bytes from where the cursor stands */
inline encode_accepted_message(accepted_message_record) {
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> wire[at] = accepted_message_record.timestamp[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> wire[at] = accepted_message_record.order_token[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = accepted_message_record.account_type; at = at + 1;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> wire[at] = accepted_message_record.account_id[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = accepted_message_record.order_verb; at = at + 1;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> wire[at] = accepted_message_record.quantity[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> wire[at] = accepted_message_record.orderbook[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
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
  :: accepted_message_at < 4 -> wire[at] = accepted_message_record.client_id[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> wire[at] = accepted_message_record.order_reference_number[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> wire[at] = accepted_message_record.minimum_quantity[accepted_message_at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = accepted_message_record.order_state; at = at + 1;
  skip
}

/* Accepted Message off the wire, 59 bytes from where the cursor stands */
inline decode_accepted_message(accepted_message_record) {
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.timestamp[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.order_token[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.account_type = wire[at]; at = at + 1;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.account_id[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.order_verb = wire[at]; at = at + 1;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.quantity[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> accepted_message_record.orderbook[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
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
  :: accepted_message_at < 4 -> accepted_message_record.client_id[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.order_reference_number[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> accepted_message_record.minimum_quantity[accepted_message_at] = wire[at]; at = at + 1; accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_record.order_state = wire[at]; at = at + 1;
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
  :: accepted_message_at < 4 -> assert(accepted_message_read.order_token[accepted_message_at] == accepted_message_written.order_token[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  assert(accepted_message_read.account_type == accepted_message_written.account_type);
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> assert(accepted_message_read.account_id[accepted_message_at] == accepted_message_written.account_id[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  assert(accepted_message_read.order_verb == accepted_message_written.order_verb);
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> assert(accepted_message_read.quantity[accepted_message_at] == accepted_message_written.quantity[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 4 -> assert(accepted_message_read.orderbook[accepted_message_at] == accepted_message_written.orderbook[accepted_message_at]); accepted_message_at = accepted_message_at + 1
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
  :: accepted_message_at < 4 -> assert(accepted_message_read.client_id[accepted_message_at] == accepted_message_written.client_id[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> assert(accepted_message_read.order_reference_number[accepted_message_at] == accepted_message_written.order_reference_number[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  accepted_message_at = 0;
  do
  :: accepted_message_at < 8 -> assert(accepted_message_read.minimum_quantity[accepted_message_at] == accepted_message_written.minimum_quantity[accepted_message_at]); accepted_message_at = accepted_message_at + 1
  :: else -> break
  od;
  assert(accepted_message_read.order_state == accepted_message_written.order_state);
  skip
}

/* ---- Replaced Message: 42 bytes ---------------------------------------------- */

/* Replaced message */
typedef ReplacedMessage {
  byte timestamp[8];
  byte replacement_order_token[4];
  byte order_verb;
  byte quantity[8];
  byte orderbook[4];
  byte price[4];
  byte order_reference_number[8];
  byte order_state;
  byte previous_order_token[4]
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
  :: replaced_message_at < 4 -> replaced_message_record.replacement_order_token[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.order_verb = replaced_message_value;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.quantity[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.orderbook[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.price[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.order_reference_number[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.order_state = replaced_message_value;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.previous_order_token[replaced_message_at] = replaced_message_value; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
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
  :: replaced_message_at < 4 -> replaced_message_record.replacement_order_token[replaced_message_at] = (replaced_message_base + 8 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.order_verb = (replaced_message_base + 12 + 1) % 256;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.quantity[replaced_message_at] = (replaced_message_base + 13 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.orderbook[replaced_message_at] = (replaced_message_base + 21 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.price[replaced_message_at] = (replaced_message_base + 25 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.order_reference_number[replaced_message_at] = (replaced_message_base + 29 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.order_state = (replaced_message_base + 37 + 1) % 256;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.previous_order_token[replaced_message_at] = (replaced_message_base + 38 + replaced_message_at + 1) % 256; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replaced Message to the wire, 42 bytes from where the cursor stands */
inline encode_replaced_message(replaced_message_record) {
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> wire[at] = replaced_message_record.timestamp[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> wire[at] = replaced_message_record.replacement_order_token[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = replaced_message_record.order_verb; at = at + 1;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> wire[at] = replaced_message_record.quantity[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> wire[at] = replaced_message_record.orderbook[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> wire[at] = replaced_message_record.price[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> wire[at] = replaced_message_record.order_reference_number[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = replaced_message_record.order_state; at = at + 1;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> wire[at] = replaced_message_record.previous_order_token[replaced_message_at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replaced Message off the wire, 42 bytes from where the cursor stands */
inline decode_replaced_message(replaced_message_record) {
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.timestamp[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.replacement_order_token[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.order_verb = wire[at]; at = at + 1;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.quantity[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.orderbook[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.price[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> replaced_message_record.order_reference_number[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_record.order_state = wire[at]; at = at + 1;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> replaced_message_record.previous_order_token[replaced_message_at] = wire[at]; at = at + 1; replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
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
  :: replaced_message_at < 4 -> assert(replaced_message_read.replacement_order_token[replaced_message_at] == replaced_message_written.replacement_order_token[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  assert(replaced_message_read.order_verb == replaced_message_written.order_verb);
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> assert(replaced_message_read.quantity[replaced_message_at] == replaced_message_written.quantity[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> assert(replaced_message_read.orderbook[replaced_message_at] == replaced_message_written.orderbook[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> assert(replaced_message_read.price[replaced_message_at] == replaced_message_written.price[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  replaced_message_at = 0;
  do
  :: replaced_message_at < 8 -> assert(replaced_message_read.order_reference_number[replaced_message_at] == replaced_message_written.order_reference_number[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  assert(replaced_message_read.order_state == replaced_message_written.order_state);
  replaced_message_at = 0;
  do
  :: replaced_message_at < 4 -> assert(replaced_message_read.previous_order_token[replaced_message_at] == replaced_message_written.previous_order_token[replaced_message_at]); replaced_message_at = replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Canceled Message: 21 bytes ---------------------------------------------- */

/* Canceled order message */
typedef CanceledMessage {
  byte timestamp[8];
  byte order_token[4];
  byte quantity[8];
  byte canceled_reason
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
  :: canceled_message_at < 4 -> canceled_message_record.order_token[canceled_message_at] = canceled_message_value; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 8 -> canceled_message_record.quantity[canceled_message_at] = canceled_message_value; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_record.canceled_reason = canceled_message_value;
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
  :: canceled_message_at < 4 -> canceled_message_record.order_token[canceled_message_at] = (canceled_message_base + 8 + canceled_message_at + 1) % 256; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 8 -> canceled_message_record.quantity[canceled_message_at] = (canceled_message_base + 12 + canceled_message_at + 1) % 256; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_record.canceled_reason = (canceled_message_base + 20 + 1) % 256;
  skip
}

/* Canceled Message to the wire, 21 bytes from where the cursor stands */
inline encode_canceled_message(canceled_message_record) {
  canceled_message_at = 0;
  do
  :: canceled_message_at < 8 -> wire[at] = canceled_message_record.timestamp[canceled_message_at]; at = at + 1; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 4 -> wire[at] = canceled_message_record.order_token[canceled_message_at]; at = at + 1; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 8 -> wire[at] = canceled_message_record.quantity[canceled_message_at]; at = at + 1; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = canceled_message_record.canceled_reason; at = at + 1;
  skip
}

/* Canceled Message off the wire, 21 bytes from where the cursor stands */
inline decode_canceled_message(canceled_message_record) {
  canceled_message_at = 0;
  do
  :: canceled_message_at < 8 -> canceled_message_record.timestamp[canceled_message_at] = wire[at]; at = at + 1; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 4 -> canceled_message_record.order_token[canceled_message_at] = wire[at]; at = at + 1; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 8 -> canceled_message_record.quantity[canceled_message_at] = wire[at]; at = at + 1; canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_record.canceled_reason = wire[at]; at = at + 1;
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
  :: canceled_message_at < 4 -> assert(canceled_message_read.order_token[canceled_message_at] == canceled_message_written.order_token[canceled_message_at]); canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  canceled_message_at = 0;
  do
  :: canceled_message_at < 8 -> assert(canceled_message_read.quantity[canceled_message_at] == canceled_message_written.quantity[canceled_message_at]); canceled_message_at = canceled_message_at + 1
  :: else -> break
  od;
  assert(canceled_message_read.canceled_reason == canceled_message_written.canceled_reason);
  skip
}

/* ---- Executed Order Message: 37 bytes ---------------------------------------- */

/* Order executed message */
typedef ExecutedOrderMessage {
  byte timestamp[8];
  byte order_token[4];
  byte executed_quantity[8];
  byte executed_price[4];
  byte liquidity_flag;
  byte match_number[8];
  byte counter_party_id[4]
};

int executed_order_message_at;

/* every byte of Executed Order Message set to one value */
inline fill_executed_order_message(executed_order_message_record, executed_order_message_value) {
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> executed_order_message_record.timestamp[executed_order_message_at] = executed_order_message_value; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> executed_order_message_record.order_token[executed_order_message_at] = executed_order_message_value; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> executed_order_message_record.executed_quantity[executed_order_message_at] = executed_order_message_value; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> executed_order_message_record.executed_price[executed_order_message_at] = executed_order_message_value; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_record.liquidity_flag = executed_order_message_value;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> executed_order_message_record.match_number[executed_order_message_at] = executed_order_message_value; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> executed_order_message_record.counter_party_id[executed_order_message_at] = executed_order_message_value; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Executed Order Message set to where it lies, so a field read out of place says so */
inline ramp_executed_order_message(executed_order_message_record, executed_order_message_base) {
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> executed_order_message_record.timestamp[executed_order_message_at] = (executed_order_message_base + 0 + executed_order_message_at + 1) % 256; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> executed_order_message_record.order_token[executed_order_message_at] = (executed_order_message_base + 8 + executed_order_message_at + 1) % 256; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> executed_order_message_record.executed_quantity[executed_order_message_at] = (executed_order_message_base + 12 + executed_order_message_at + 1) % 256; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> executed_order_message_record.executed_price[executed_order_message_at] = (executed_order_message_base + 20 + executed_order_message_at + 1) % 256; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_record.liquidity_flag = (executed_order_message_base + 24 + 1) % 256;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> executed_order_message_record.match_number[executed_order_message_at] = (executed_order_message_base + 25 + executed_order_message_at + 1) % 256; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> executed_order_message_record.counter_party_id[executed_order_message_at] = (executed_order_message_base + 33 + executed_order_message_at + 1) % 256; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Executed Order Message to the wire, 37 bytes from where the cursor stands */
inline encode_executed_order_message(executed_order_message_record) {
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> wire[at] = executed_order_message_record.timestamp[executed_order_message_at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> wire[at] = executed_order_message_record.order_token[executed_order_message_at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> wire[at] = executed_order_message_record.executed_quantity[executed_order_message_at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> wire[at] = executed_order_message_record.executed_price[executed_order_message_at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  wire[at] = executed_order_message_record.liquidity_flag; at = at + 1;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> wire[at] = executed_order_message_record.match_number[executed_order_message_at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> wire[at] = executed_order_message_record.counter_party_id[executed_order_message_at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Executed Order Message off the wire, 37 bytes from where the cursor stands */
inline decode_executed_order_message(executed_order_message_record) {
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> executed_order_message_record.timestamp[executed_order_message_at] = wire[at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> executed_order_message_record.order_token[executed_order_message_at] = wire[at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> executed_order_message_record.executed_quantity[executed_order_message_at] = wire[at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> executed_order_message_record.executed_price[executed_order_message_at] = wire[at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_record.liquidity_flag = wire[at]; at = at + 1;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> executed_order_message_record.match_number[executed_order_message_at] = wire[at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> executed_order_message_record.counter_party_id[executed_order_message_at] = wire[at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Executed Order Message is what was written, byte for byte */
inline equal_executed_order_message(executed_order_message_read, executed_order_message_written) {
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> assert(executed_order_message_read.timestamp[executed_order_message_at] == executed_order_message_written.timestamp[executed_order_message_at]); executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> assert(executed_order_message_read.order_token[executed_order_message_at] == executed_order_message_written.order_token[executed_order_message_at]); executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> assert(executed_order_message_read.executed_quantity[executed_order_message_at] == executed_order_message_written.executed_quantity[executed_order_message_at]); executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> assert(executed_order_message_read.executed_price[executed_order_message_at] == executed_order_message_written.executed_price[executed_order_message_at]); executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  assert(executed_order_message_read.liquidity_flag == executed_order_message_written.liquidity_flag);
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 8 -> assert(executed_order_message_read.match_number[executed_order_message_at] == executed_order_message_written.match_number[executed_order_message_at]); executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 4 -> assert(executed_order_message_read.counter_party_id[executed_order_message_at] == executed_order_message_written.counter_party_id[executed_order_message_at]); executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Broken Trade Message: 21 bytes ------------------------------------------ */

/* Broken trade message */
typedef BrokenTradeMessage {
  byte timestamp[8];
  byte order_token[4];
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
  :: broken_trade_message_at < 4 -> broken_trade_message_record.order_token[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
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
  :: broken_trade_message_at < 4 -> broken_trade_message_record.order_token[broken_trade_message_at] = (broken_trade_message_base + 8 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = (broken_trade_message_base + 12 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.broken_trade_reason = (broken_trade_message_base + 20 + 1) % 256;
  skip
}

/* Broken Trade Message to the wire, 21 bytes from where the cursor stands */
inline encode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.timestamp[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> wire[at] = broken_trade_message_record.order_token[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
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

/* Broken Trade Message off the wire, 21 bytes from where the cursor stands */
inline decode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.timestamp[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.order_token[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
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
  :: broken_trade_message_at < 4 -> assert(broken_trade_message_read.order_token[broken_trade_message_at] == broken_trade_message_written.order_token[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
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

/* ---- Rejected Order Message: 13 bytes ---------------------------------------- */

/* Rejected order message */
typedef RejectedOrderMessage {
  byte timestamp[8];
  byte order_token[4];
  byte rejected_reason
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
  :: rejected_order_message_at < 4 -> rejected_order_message_record.order_token[rejected_order_message_at] = rejected_order_message_value; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_record.rejected_reason = rejected_order_message_value;
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
  :: rejected_order_message_at < 4 -> rejected_order_message_record.order_token[rejected_order_message_at] = (rejected_order_message_base + 8 + rejected_order_message_at + 1) % 256; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_record.rejected_reason = (rejected_order_message_base + 12 + 1) % 256;
  skip
}

/* Rejected Order Message to the wire, 13 bytes from where the cursor stands */
inline encode_rejected_order_message(rejected_order_message_record) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 8 -> wire[at] = rejected_order_message_record.timestamp[rejected_order_message_at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 4 -> wire[at] = rejected_order_message_record.order_token[rejected_order_message_at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  wire[at] = rejected_order_message_record.rejected_reason; at = at + 1;
  skip
}

/* Rejected Order Message off the wire, 13 bytes from where the cursor stands */
inline decode_rejected_order_message(rejected_order_message_record) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 8 -> rejected_order_message_record.timestamp[rejected_order_message_at] = wire[at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 4 -> rejected_order_message_record.order_token[rejected_order_message_at] = wire[at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_record.rejected_reason = wire[at]; at = at + 1;
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
  :: rejected_order_message_at < 4 -> assert(rejected_order_message_read.order_token[rejected_order_message_at] == rejected_order_message_written.order_token[rejected_order_message_at]); rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  assert(rejected_order_message_read.rejected_reason == rejected_order_message_written.rejected_reason);
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
    assert(at == 59);
    at = 0;
    decode_accepted_message(accepted_message_got);
    assert(at == 59);
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
    assert(at == 42);
    at = 0;
    decode_replaced_message(replaced_message_got);
    assert(at == 42);
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
    assert(at == 21);
    at = 0;
    decode_canceled_message(canceled_message_got);
    assert(at == 21);
    equal_canceled_message(canceled_message_got, canceled_message_sent)
  }
}

/* Executed Order Message: encoded, read back, and compared */
proctype check_executed_order_message() {
  ExecutedOrderMessage executed_order_message_sent;
  ExecutedOrderMessage executed_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_executed_order_message(executed_order_message_sent, 0)
  :: pattern == 1 -> fill_executed_order_message(executed_order_message_sent, 32)
  :: pattern == 2 -> fill_executed_order_message(executed_order_message_sent, 255)
  :: else -> ramp_executed_order_message(executed_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_executed_order_message(executed_order_message_sent);
    assert(at == 37);
    at = 0;
    decode_executed_order_message(executed_order_message_got);
    assert(at == 37);
    equal_executed_order_message(executed_order_message_got, executed_order_message_sent)
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
    assert(at == 21);
    at = 0;
    decode_broken_trade_message(broken_trade_message_got);
    assert(at == 21);
    equal_broken_trade_message(broken_trade_message_got, broken_trade_message_sent)
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
    assert(at == 13);
    at = 0;
    decode_rejected_order_message(rejected_order_message_got);
    assert(at == 13);
    equal_rejected_order_message(rejected_order_message_got, rejected_order_message_sent)
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
  :: run check_executed_order_message()
  :: run check_broken_trade_message()
  :: run check_rejected_order_message()
  fi
}
