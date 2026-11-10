/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Rash
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
#define WIRE 147

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

/* ---- Sequenced Message Header: 9 bytes --------------------------------------- */

/* Time Stamp and type carried ahead of every RASH outbound sequenced message */
typedef SequencedMessageHeader {
  byte timestamp[8];
  byte sequenced_message_type
};

int sequenced_message_header_at;

/* every byte of Sequenced Message Header set to one value */
inline fill_sequenced_message_header(sequenced_message_header_record, sequenced_message_header_value) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = sequenced_message_header_value; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.sequenced_message_type = sequenced_message_header_value;
  skip
}

/* each byte of Sequenced Message Header set to where it lies, so a field read out of place says so */
inline ramp_sequenced_message_header(sequenced_message_header_record, sequenced_message_header_base) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = (sequenced_message_header_base + 0 + sequenced_message_header_at + 1) % 256; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.sequenced_message_type = (sequenced_message_header_base + 8 + 1) % 256;
  skip
}

/* Sequenced Message Header to the wire, 9 bytes from where the cursor stands */
inline encode_sequenced_message_header(sequenced_message_header_record) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> wire[at] = sequenced_message_header_record.timestamp[sequenced_message_header_at]; at = at + 1; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  wire[at] = sequenced_message_header_record.sequenced_message_type; at = at + 1;
  skip
}

/* Sequenced Message Header off the wire, 9 bytes from where the cursor stands */
inline decode_sequenced_message_header(sequenced_message_header_record) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = wire[at]; at = at + 1; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.sequenced_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Sequenced Message Header is what was written, byte for byte */
inline equal_sequenced_message_header(sequenced_message_header_read, sequenced_message_header_written) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> assert(sequenced_message_header_read.timestamp[sequenced_message_header_at] == sequenced_message_header_written.timestamp[sequenced_message_header_at]); sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  assert(sequenced_message_header_read.sequenced_message_type == sequenced_message_header_written.sequenced_message_type);
  skip
}

/* ---- System Event Message: 1 bytes ------------------------------------------- */

/* System Event Messages signal events that affect the entire system. */
typedef SystemEventMessage {
  byte event_code
};

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_record.event_code = (system_event_message_base + 0 + 1) % 256;
  skip
}

/* System Event Message to the wire, 1 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 1 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Accepted Order Message: 145 bytes --------------------------------------- */

/* An Accepted Order Message acknowledges the receipt of a valid Enter Order Message. The data fields from the Enter Order Message are echoed back; the accepted values may differ from the entered values for some fields. */
typedef AcceptedOrderMessage {
  byte order_token_client_order_id[14];
  byte side;
  byte shares_order_qty[6];
  byte stock_symbol[6];
  byte price[10];
  byte time_in_force[5];
  byte firm_client_id[4];
  byte display;
  byte order_reference_number[9];
  byte min_qty[6];
  byte max_floor[6];
  byte peg_type;
  byte peg_difference_sign;
  byte peg_difference[10];
  byte discretion_price[10];
  byte discretion_peg_type;
  byte discretion_peg_difference_sign;
  byte discretion_peg_difference[10];
  byte capacity_rule_80_a_indicator;
  byte random_reserve[6];
  byte route_dest_exec_broker[4];
  byte cust_terminal_id_sender_sub_id[32]
};

int accepted_order_message_at;

/* every byte of Accepted Order Message set to one value */
inline fill_accepted_order_message(accepted_order_message_record, accepted_order_message_value) {
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 14 -> accepted_order_message_record.order_token_client_order_id[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.side = accepted_order_message_value;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.shares_order_qty[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.stock_symbol[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> accepted_order_message_record.price[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 5 -> accepted_order_message_record.time_in_force[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 4 -> accepted_order_message_record.firm_client_id[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.display = accepted_order_message_value;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 9 -> accepted_order_message_record.order_reference_number[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.min_qty[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.max_floor[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.peg_type = accepted_order_message_value;
  accepted_order_message_record.peg_difference_sign = accepted_order_message_value;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> accepted_order_message_record.peg_difference[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> accepted_order_message_record.discretion_price[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.discretion_peg_type = accepted_order_message_value;
  accepted_order_message_record.discretion_peg_difference_sign = accepted_order_message_value;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> accepted_order_message_record.discretion_peg_difference[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.capacity_rule_80_a_indicator = accepted_order_message_value;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.random_reserve[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 4 -> accepted_order_message_record.route_dest_exec_broker[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 32 -> accepted_order_message_record.cust_terminal_id_sender_sub_id[accepted_order_message_at] = accepted_order_message_value; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Accepted Order Message set to where it lies, so a field read out of place says so */
inline ramp_accepted_order_message(accepted_order_message_record, accepted_order_message_base) {
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 14 -> accepted_order_message_record.order_token_client_order_id[accepted_order_message_at] = (accepted_order_message_base + 0 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.side = (accepted_order_message_base + 14 + 1) % 256;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.shares_order_qty[accepted_order_message_at] = (accepted_order_message_base + 15 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.stock_symbol[accepted_order_message_at] = (accepted_order_message_base + 21 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> accepted_order_message_record.price[accepted_order_message_at] = (accepted_order_message_base + 27 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 5 -> accepted_order_message_record.time_in_force[accepted_order_message_at] = (accepted_order_message_base + 37 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 4 -> accepted_order_message_record.firm_client_id[accepted_order_message_at] = (accepted_order_message_base + 42 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.display = (accepted_order_message_base + 46 + 1) % 256;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 9 -> accepted_order_message_record.order_reference_number[accepted_order_message_at] = (accepted_order_message_base + 47 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.min_qty[accepted_order_message_at] = (accepted_order_message_base + 56 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.max_floor[accepted_order_message_at] = (accepted_order_message_base + 62 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.peg_type = (accepted_order_message_base + 68 + 1) % 256;
  accepted_order_message_record.peg_difference_sign = (accepted_order_message_base + 69 + 1) % 256;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> accepted_order_message_record.peg_difference[accepted_order_message_at] = (accepted_order_message_base + 70 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> accepted_order_message_record.discretion_price[accepted_order_message_at] = (accepted_order_message_base + 80 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.discretion_peg_type = (accepted_order_message_base + 90 + 1) % 256;
  accepted_order_message_record.discretion_peg_difference_sign = (accepted_order_message_base + 91 + 1) % 256;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> accepted_order_message_record.discretion_peg_difference[accepted_order_message_at] = (accepted_order_message_base + 92 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.capacity_rule_80_a_indicator = (accepted_order_message_base + 102 + 1) % 256;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.random_reserve[accepted_order_message_at] = (accepted_order_message_base + 103 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 4 -> accepted_order_message_record.route_dest_exec_broker[accepted_order_message_at] = (accepted_order_message_base + 109 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 32 -> accepted_order_message_record.cust_terminal_id_sender_sub_id[accepted_order_message_at] = (accepted_order_message_base + 113 + accepted_order_message_at + 1) % 256; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Accepted Order Message to the wire, 145 bytes from where the cursor stands */
inline encode_accepted_order_message(accepted_order_message_record) {
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 14 -> wire[at] = accepted_order_message_record.order_token_client_order_id[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  wire[at] = accepted_order_message_record.side; at = at + 1;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> wire[at] = accepted_order_message_record.shares_order_qty[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> wire[at] = accepted_order_message_record.stock_symbol[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> wire[at] = accepted_order_message_record.price[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 5 -> wire[at] = accepted_order_message_record.time_in_force[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 4 -> wire[at] = accepted_order_message_record.firm_client_id[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  wire[at] = accepted_order_message_record.display; at = at + 1;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 9 -> wire[at] = accepted_order_message_record.order_reference_number[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> wire[at] = accepted_order_message_record.min_qty[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> wire[at] = accepted_order_message_record.max_floor[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  wire[at] = accepted_order_message_record.peg_type; at = at + 1;
  wire[at] = accepted_order_message_record.peg_difference_sign; at = at + 1;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> wire[at] = accepted_order_message_record.peg_difference[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> wire[at] = accepted_order_message_record.discretion_price[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  wire[at] = accepted_order_message_record.discretion_peg_type; at = at + 1;
  wire[at] = accepted_order_message_record.discretion_peg_difference_sign; at = at + 1;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> wire[at] = accepted_order_message_record.discretion_peg_difference[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  wire[at] = accepted_order_message_record.capacity_rule_80_a_indicator; at = at + 1;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> wire[at] = accepted_order_message_record.random_reserve[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 4 -> wire[at] = accepted_order_message_record.route_dest_exec_broker[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 32 -> wire[at] = accepted_order_message_record.cust_terminal_id_sender_sub_id[accepted_order_message_at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Accepted Order Message off the wire, 145 bytes from where the cursor stands */
inline decode_accepted_order_message(accepted_order_message_record) {
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 14 -> accepted_order_message_record.order_token_client_order_id[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.side = wire[at]; at = at + 1;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.shares_order_qty[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.stock_symbol[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> accepted_order_message_record.price[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 5 -> accepted_order_message_record.time_in_force[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 4 -> accepted_order_message_record.firm_client_id[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.display = wire[at]; at = at + 1;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 9 -> accepted_order_message_record.order_reference_number[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.min_qty[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.max_floor[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.peg_type = wire[at]; at = at + 1;
  accepted_order_message_record.peg_difference_sign = wire[at]; at = at + 1;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> accepted_order_message_record.peg_difference[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> accepted_order_message_record.discretion_price[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.discretion_peg_type = wire[at]; at = at + 1;
  accepted_order_message_record.discretion_peg_difference_sign = wire[at]; at = at + 1;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> accepted_order_message_record.discretion_peg_difference[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_record.capacity_rule_80_a_indicator = wire[at]; at = at + 1;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> accepted_order_message_record.random_reserve[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 4 -> accepted_order_message_record.route_dest_exec_broker[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 32 -> accepted_order_message_record.cust_terminal_id_sender_sub_id[accepted_order_message_at] = wire[at]; at = at + 1; accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Accepted Order Message is what was written, byte for byte */
inline equal_accepted_order_message(accepted_order_message_read, accepted_order_message_written) {
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 14 -> assert(accepted_order_message_read.order_token_client_order_id[accepted_order_message_at] == accepted_order_message_written.order_token_client_order_id[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  assert(accepted_order_message_read.side == accepted_order_message_written.side);
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> assert(accepted_order_message_read.shares_order_qty[accepted_order_message_at] == accepted_order_message_written.shares_order_qty[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> assert(accepted_order_message_read.stock_symbol[accepted_order_message_at] == accepted_order_message_written.stock_symbol[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> assert(accepted_order_message_read.price[accepted_order_message_at] == accepted_order_message_written.price[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 5 -> assert(accepted_order_message_read.time_in_force[accepted_order_message_at] == accepted_order_message_written.time_in_force[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 4 -> assert(accepted_order_message_read.firm_client_id[accepted_order_message_at] == accepted_order_message_written.firm_client_id[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  assert(accepted_order_message_read.display == accepted_order_message_written.display);
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 9 -> assert(accepted_order_message_read.order_reference_number[accepted_order_message_at] == accepted_order_message_written.order_reference_number[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> assert(accepted_order_message_read.min_qty[accepted_order_message_at] == accepted_order_message_written.min_qty[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> assert(accepted_order_message_read.max_floor[accepted_order_message_at] == accepted_order_message_written.max_floor[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  assert(accepted_order_message_read.peg_type == accepted_order_message_written.peg_type);
  assert(accepted_order_message_read.peg_difference_sign == accepted_order_message_written.peg_difference_sign);
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> assert(accepted_order_message_read.peg_difference[accepted_order_message_at] == accepted_order_message_written.peg_difference[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> assert(accepted_order_message_read.discretion_price[accepted_order_message_at] == accepted_order_message_written.discretion_price[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  assert(accepted_order_message_read.discretion_peg_type == accepted_order_message_written.discretion_peg_type);
  assert(accepted_order_message_read.discretion_peg_difference_sign == accepted_order_message_written.discretion_peg_difference_sign);
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 10 -> assert(accepted_order_message_read.discretion_peg_difference[accepted_order_message_at] == accepted_order_message_written.discretion_peg_difference[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  assert(accepted_order_message_read.capacity_rule_80_a_indicator == accepted_order_message_written.capacity_rule_80_a_indicator);
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 6 -> assert(accepted_order_message_read.random_reserve[accepted_order_message_at] == accepted_order_message_written.random_reserve[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 4 -> assert(accepted_order_message_read.route_dest_exec_broker[accepted_order_message_at] == accepted_order_message_written.route_dest_exec_broker[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  accepted_order_message_at = 0;
  do
  :: accepted_order_message_at < 32 -> assert(accepted_order_message_read.cust_terminal_id_sender_sub_id[accepted_order_message_at] == accepted_order_message_written.cust_terminal_id_sender_sub_id[accepted_order_message_at]); accepted_order_message_at = accepted_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Accepted Order Message With Cross Functionality: 147 bytes -------------- */

/* Similar to the regular Accepted Order Message, with the additional information provided upon order entry using the Enter Order Message with Cross Functionality. */
typedef AcceptedOrderMessageWithCrossFunctionality {
  byte order_token_client_order_id[14];
  byte side;
  byte shares_order_qty[6];
  byte stock_symbol[6];
  byte price[10];
  byte time_in_force[5];
  byte firm_client_id[4];
  byte display;
  byte order_reference_number[9];
  byte min_qty[6];
  byte max_floor[6];
  byte peg_type;
  byte peg_difference_sign;
  byte peg_difference[10];
  byte discretion_price[10];
  byte discretion_peg_type;
  byte discretion_peg_difference_sign;
  byte discretion_peg_difference[10];
  byte capacity_rule_80_a_indicator;
  byte random_reserve[6];
  byte route_dest_exec_broker[4];
  byte cust_terminal_id_sender_sub_id[32];
  byte inter_market_sweep_eligibility;
  byte cross_type
};

int accepted_order_message_with_cross_functionality_at;

/* every byte of Accepted Order Message With Cross Functionality set to one value */
inline fill_accepted_order_message_with_cross_functionality(accepted_order_message_with_cross_functionality_record, accepted_order_message_with_cross_functionality_value) {
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 14 -> accepted_order_message_with_cross_functionality_record.order_token_client_order_id[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.side = accepted_order_message_with_cross_functionality_value;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.shares_order_qty[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.stock_symbol[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> accepted_order_message_with_cross_functionality_record.price[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 5 -> accepted_order_message_with_cross_functionality_record.time_in_force[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 4 -> accepted_order_message_with_cross_functionality_record.firm_client_id[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.display = accepted_order_message_with_cross_functionality_value;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 9 -> accepted_order_message_with_cross_functionality_record.order_reference_number[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.min_qty[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.max_floor[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.peg_type = accepted_order_message_with_cross_functionality_value;
  accepted_order_message_with_cross_functionality_record.peg_difference_sign = accepted_order_message_with_cross_functionality_value;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> accepted_order_message_with_cross_functionality_record.peg_difference[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> accepted_order_message_with_cross_functionality_record.discretion_price[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.discretion_peg_type = accepted_order_message_with_cross_functionality_value;
  accepted_order_message_with_cross_functionality_record.discretion_peg_difference_sign = accepted_order_message_with_cross_functionality_value;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> accepted_order_message_with_cross_functionality_record.discretion_peg_difference[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.capacity_rule_80_a_indicator = accepted_order_message_with_cross_functionality_value;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.random_reserve[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 4 -> accepted_order_message_with_cross_functionality_record.route_dest_exec_broker[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 32 -> accepted_order_message_with_cross_functionality_record.cust_terminal_id_sender_sub_id[accepted_order_message_with_cross_functionality_at] = accepted_order_message_with_cross_functionality_value; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.inter_market_sweep_eligibility = accepted_order_message_with_cross_functionality_value;
  accepted_order_message_with_cross_functionality_record.cross_type = accepted_order_message_with_cross_functionality_value;
  skip
}

/* each byte of Accepted Order Message With Cross Functionality set to where it lies, so a field read out of place says so */
inline ramp_accepted_order_message_with_cross_functionality(accepted_order_message_with_cross_functionality_record, accepted_order_message_with_cross_functionality_base) {
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 14 -> accepted_order_message_with_cross_functionality_record.order_token_client_order_id[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 0 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.side = (accepted_order_message_with_cross_functionality_base + 14 + 1) % 256;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.shares_order_qty[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 15 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.stock_symbol[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 21 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> accepted_order_message_with_cross_functionality_record.price[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 27 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 5 -> accepted_order_message_with_cross_functionality_record.time_in_force[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 37 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 4 -> accepted_order_message_with_cross_functionality_record.firm_client_id[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 42 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.display = (accepted_order_message_with_cross_functionality_base + 46 + 1) % 256;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 9 -> accepted_order_message_with_cross_functionality_record.order_reference_number[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 47 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.min_qty[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 56 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.max_floor[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 62 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.peg_type = (accepted_order_message_with_cross_functionality_base + 68 + 1) % 256;
  accepted_order_message_with_cross_functionality_record.peg_difference_sign = (accepted_order_message_with_cross_functionality_base + 69 + 1) % 256;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> accepted_order_message_with_cross_functionality_record.peg_difference[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 70 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> accepted_order_message_with_cross_functionality_record.discretion_price[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 80 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.discretion_peg_type = (accepted_order_message_with_cross_functionality_base + 90 + 1) % 256;
  accepted_order_message_with_cross_functionality_record.discretion_peg_difference_sign = (accepted_order_message_with_cross_functionality_base + 91 + 1) % 256;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> accepted_order_message_with_cross_functionality_record.discretion_peg_difference[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 92 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.capacity_rule_80_a_indicator = (accepted_order_message_with_cross_functionality_base + 102 + 1) % 256;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.random_reserve[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 103 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 4 -> accepted_order_message_with_cross_functionality_record.route_dest_exec_broker[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 109 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 32 -> accepted_order_message_with_cross_functionality_record.cust_terminal_id_sender_sub_id[accepted_order_message_with_cross_functionality_at] = (accepted_order_message_with_cross_functionality_base + 113 + accepted_order_message_with_cross_functionality_at + 1) % 256; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.inter_market_sweep_eligibility = (accepted_order_message_with_cross_functionality_base + 145 + 1) % 256;
  accepted_order_message_with_cross_functionality_record.cross_type = (accepted_order_message_with_cross_functionality_base + 146 + 1) % 256;
  skip
}

/* Accepted Order Message With Cross Functionality to the wire, 147 bytes from where the cursor stands */
inline encode_accepted_order_message_with_cross_functionality(accepted_order_message_with_cross_functionality_record) {
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 14 -> wire[at] = accepted_order_message_with_cross_functionality_record.order_token_client_order_id[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  wire[at] = accepted_order_message_with_cross_functionality_record.side; at = at + 1;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> wire[at] = accepted_order_message_with_cross_functionality_record.shares_order_qty[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> wire[at] = accepted_order_message_with_cross_functionality_record.stock_symbol[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> wire[at] = accepted_order_message_with_cross_functionality_record.price[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 5 -> wire[at] = accepted_order_message_with_cross_functionality_record.time_in_force[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 4 -> wire[at] = accepted_order_message_with_cross_functionality_record.firm_client_id[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  wire[at] = accepted_order_message_with_cross_functionality_record.display; at = at + 1;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 9 -> wire[at] = accepted_order_message_with_cross_functionality_record.order_reference_number[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> wire[at] = accepted_order_message_with_cross_functionality_record.min_qty[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> wire[at] = accepted_order_message_with_cross_functionality_record.max_floor[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  wire[at] = accepted_order_message_with_cross_functionality_record.peg_type; at = at + 1;
  wire[at] = accepted_order_message_with_cross_functionality_record.peg_difference_sign; at = at + 1;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> wire[at] = accepted_order_message_with_cross_functionality_record.peg_difference[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> wire[at] = accepted_order_message_with_cross_functionality_record.discretion_price[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  wire[at] = accepted_order_message_with_cross_functionality_record.discretion_peg_type; at = at + 1;
  wire[at] = accepted_order_message_with_cross_functionality_record.discretion_peg_difference_sign; at = at + 1;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> wire[at] = accepted_order_message_with_cross_functionality_record.discretion_peg_difference[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  wire[at] = accepted_order_message_with_cross_functionality_record.capacity_rule_80_a_indicator; at = at + 1;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> wire[at] = accepted_order_message_with_cross_functionality_record.random_reserve[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 4 -> wire[at] = accepted_order_message_with_cross_functionality_record.route_dest_exec_broker[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 32 -> wire[at] = accepted_order_message_with_cross_functionality_record.cust_terminal_id_sender_sub_id[accepted_order_message_with_cross_functionality_at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  wire[at] = accepted_order_message_with_cross_functionality_record.inter_market_sweep_eligibility; at = at + 1;
  wire[at] = accepted_order_message_with_cross_functionality_record.cross_type; at = at + 1;
  skip
}

/* Accepted Order Message With Cross Functionality off the wire, 147 bytes from where the cursor stands */
inline decode_accepted_order_message_with_cross_functionality(accepted_order_message_with_cross_functionality_record) {
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 14 -> accepted_order_message_with_cross_functionality_record.order_token_client_order_id[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.side = wire[at]; at = at + 1;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.shares_order_qty[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.stock_symbol[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> accepted_order_message_with_cross_functionality_record.price[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 5 -> accepted_order_message_with_cross_functionality_record.time_in_force[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 4 -> accepted_order_message_with_cross_functionality_record.firm_client_id[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.display = wire[at]; at = at + 1;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 9 -> accepted_order_message_with_cross_functionality_record.order_reference_number[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.min_qty[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.max_floor[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.peg_type = wire[at]; at = at + 1;
  accepted_order_message_with_cross_functionality_record.peg_difference_sign = wire[at]; at = at + 1;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> accepted_order_message_with_cross_functionality_record.peg_difference[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> accepted_order_message_with_cross_functionality_record.discretion_price[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.discretion_peg_type = wire[at]; at = at + 1;
  accepted_order_message_with_cross_functionality_record.discretion_peg_difference_sign = wire[at]; at = at + 1;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> accepted_order_message_with_cross_functionality_record.discretion_peg_difference[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.capacity_rule_80_a_indicator = wire[at]; at = at + 1;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> accepted_order_message_with_cross_functionality_record.random_reserve[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 4 -> accepted_order_message_with_cross_functionality_record.route_dest_exec_broker[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 32 -> accepted_order_message_with_cross_functionality_record.cust_terminal_id_sender_sub_id[accepted_order_message_with_cross_functionality_at] = wire[at]; at = at + 1; accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_record.inter_market_sweep_eligibility = wire[at]; at = at + 1;
  accepted_order_message_with_cross_functionality_record.cross_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Accepted Order Message With Cross Functionality is what was written, byte for byte */
inline equal_accepted_order_message_with_cross_functionality(accepted_order_message_with_cross_functionality_read, accepted_order_message_with_cross_functionality_written) {
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 14 -> assert(accepted_order_message_with_cross_functionality_read.order_token_client_order_id[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.order_token_client_order_id[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  assert(accepted_order_message_with_cross_functionality_read.side == accepted_order_message_with_cross_functionality_written.side);
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> assert(accepted_order_message_with_cross_functionality_read.shares_order_qty[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.shares_order_qty[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> assert(accepted_order_message_with_cross_functionality_read.stock_symbol[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.stock_symbol[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> assert(accepted_order_message_with_cross_functionality_read.price[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.price[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 5 -> assert(accepted_order_message_with_cross_functionality_read.time_in_force[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.time_in_force[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 4 -> assert(accepted_order_message_with_cross_functionality_read.firm_client_id[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.firm_client_id[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  assert(accepted_order_message_with_cross_functionality_read.display == accepted_order_message_with_cross_functionality_written.display);
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 9 -> assert(accepted_order_message_with_cross_functionality_read.order_reference_number[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.order_reference_number[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> assert(accepted_order_message_with_cross_functionality_read.min_qty[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.min_qty[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> assert(accepted_order_message_with_cross_functionality_read.max_floor[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.max_floor[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  assert(accepted_order_message_with_cross_functionality_read.peg_type == accepted_order_message_with_cross_functionality_written.peg_type);
  assert(accepted_order_message_with_cross_functionality_read.peg_difference_sign == accepted_order_message_with_cross_functionality_written.peg_difference_sign);
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> assert(accepted_order_message_with_cross_functionality_read.peg_difference[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.peg_difference[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> assert(accepted_order_message_with_cross_functionality_read.discretion_price[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.discretion_price[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  assert(accepted_order_message_with_cross_functionality_read.discretion_peg_type == accepted_order_message_with_cross_functionality_written.discretion_peg_type);
  assert(accepted_order_message_with_cross_functionality_read.discretion_peg_difference_sign == accepted_order_message_with_cross_functionality_written.discretion_peg_difference_sign);
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 10 -> assert(accepted_order_message_with_cross_functionality_read.discretion_peg_difference[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.discretion_peg_difference[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  assert(accepted_order_message_with_cross_functionality_read.capacity_rule_80_a_indicator == accepted_order_message_with_cross_functionality_written.capacity_rule_80_a_indicator);
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 6 -> assert(accepted_order_message_with_cross_functionality_read.random_reserve[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.random_reserve[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 4 -> assert(accepted_order_message_with_cross_functionality_read.route_dest_exec_broker[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.route_dest_exec_broker[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  accepted_order_message_with_cross_functionality_at = 0;
  do
  :: accepted_order_message_with_cross_functionality_at < 32 -> assert(accepted_order_message_with_cross_functionality_read.cust_terminal_id_sender_sub_id[accepted_order_message_with_cross_functionality_at] == accepted_order_message_with_cross_functionality_written.cust_terminal_id_sender_sub_id[accepted_order_message_with_cross_functionality_at]); accepted_order_message_with_cross_functionality_at = accepted_order_message_with_cross_functionality_at + 1
  :: else -> break
  od;
  assert(accepted_order_message_with_cross_functionality_read.inter_market_sweep_eligibility == accepted_order_message_with_cross_functionality_written.inter_market_sweep_eligibility);
  assert(accepted_order_message_with_cross_functionality_read.cross_type == accepted_order_message_with_cross_functionality_written.cross_type);
  skip
}

/* ---- Canceled Order Message: 21 bytes ---------------------------------------- */

/* A Canceled Order Message informs you that an order has been reduced or canceled. Canceled shares reflect the number of shares that are out. */
typedef CanceledOrderMessage {
  byte order_token_client_order_id[14];
  byte shares[6];
  byte cancel_reason
};

int canceled_order_message_at;

/* every byte of Canceled Order Message set to one value */
inline fill_canceled_order_message(canceled_order_message_record, canceled_order_message_value) {
  canceled_order_message_at = 0;
  do
  :: canceled_order_message_at < 14 -> canceled_order_message_record.order_token_client_order_id[canceled_order_message_at] = canceled_order_message_value; canceled_order_message_at = canceled_order_message_at + 1
  :: else -> break
  od;
  canceled_order_message_at = 0;
  do
  :: canceled_order_message_at < 6 -> canceled_order_message_record.shares[canceled_order_message_at] = canceled_order_message_value; canceled_order_message_at = canceled_order_message_at + 1
  :: else -> break
  od;
  canceled_order_message_record.cancel_reason = canceled_order_message_value;
  skip
}

/* each byte of Canceled Order Message set to where it lies, so a field read out of place says so */
inline ramp_canceled_order_message(canceled_order_message_record, canceled_order_message_base) {
  canceled_order_message_at = 0;
  do
  :: canceled_order_message_at < 14 -> canceled_order_message_record.order_token_client_order_id[canceled_order_message_at] = (canceled_order_message_base + 0 + canceled_order_message_at + 1) % 256; canceled_order_message_at = canceled_order_message_at + 1
  :: else -> break
  od;
  canceled_order_message_at = 0;
  do
  :: canceled_order_message_at < 6 -> canceled_order_message_record.shares[canceled_order_message_at] = (canceled_order_message_base + 14 + canceled_order_message_at + 1) % 256; canceled_order_message_at = canceled_order_message_at + 1
  :: else -> break
  od;
  canceled_order_message_record.cancel_reason = (canceled_order_message_base + 20 + 1) % 256;
  skip
}

/* Canceled Order Message to the wire, 21 bytes from where the cursor stands */
inline encode_canceled_order_message(canceled_order_message_record) {
  canceled_order_message_at = 0;
  do
  :: canceled_order_message_at < 14 -> wire[at] = canceled_order_message_record.order_token_client_order_id[canceled_order_message_at]; at = at + 1; canceled_order_message_at = canceled_order_message_at + 1
  :: else -> break
  od;
  canceled_order_message_at = 0;
  do
  :: canceled_order_message_at < 6 -> wire[at] = canceled_order_message_record.shares[canceled_order_message_at]; at = at + 1; canceled_order_message_at = canceled_order_message_at + 1
  :: else -> break
  od;
  wire[at] = canceled_order_message_record.cancel_reason; at = at + 1;
  skip
}

/* Canceled Order Message off the wire, 21 bytes from where the cursor stands */
inline decode_canceled_order_message(canceled_order_message_record) {
  canceled_order_message_at = 0;
  do
  :: canceled_order_message_at < 14 -> canceled_order_message_record.order_token_client_order_id[canceled_order_message_at] = wire[at]; at = at + 1; canceled_order_message_at = canceled_order_message_at + 1
  :: else -> break
  od;
  canceled_order_message_at = 0;
  do
  :: canceled_order_message_at < 6 -> canceled_order_message_record.shares[canceled_order_message_at] = wire[at]; at = at + 1; canceled_order_message_at = canceled_order_message_at + 1
  :: else -> break
  od;
  canceled_order_message_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Canceled Order Message is what was written, byte for byte */
inline equal_canceled_order_message(canceled_order_message_read, canceled_order_message_written) {
  canceled_order_message_at = 0;
  do
  :: canceled_order_message_at < 14 -> assert(canceled_order_message_read.order_token_client_order_id[canceled_order_message_at] == canceled_order_message_written.order_token_client_order_id[canceled_order_message_at]); canceled_order_message_at = canceled_order_message_at + 1
  :: else -> break
  od;
  canceled_order_message_at = 0;
  do
  :: canceled_order_message_at < 6 -> assert(canceled_order_message_read.shares[canceled_order_message_at] == canceled_order_message_written.shares[canceled_order_message_at]); canceled_order_message_at = canceled_order_message_at + 1
  :: else -> break
  od;
  assert(canceled_order_message_read.cancel_reason == canceled_order_message_written.cancel_reason);
  skip
}

/* ---- Rejected Order Message: 15 bytes ---------------------------------------- */

/* A Rejected Order Message may be sent in response to an Enter Order Message if the order cannot be accepted at this time. The Token of a rejected order cannot be re-used. */
typedef RejectedOrderMessage {
  byte order_token_client_order_id[14];
  byte reject_reason
};

int rejected_order_message_at;

/* every byte of Rejected Order Message set to one value */
inline fill_rejected_order_message(rejected_order_message_record, rejected_order_message_value) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 14 -> rejected_order_message_record.order_token_client_order_id[rejected_order_message_at] = rejected_order_message_value; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_record.reject_reason = rejected_order_message_value;
  skip
}

/* each byte of Rejected Order Message set to where it lies, so a field read out of place says so */
inline ramp_rejected_order_message(rejected_order_message_record, rejected_order_message_base) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 14 -> rejected_order_message_record.order_token_client_order_id[rejected_order_message_at] = (rejected_order_message_base + 0 + rejected_order_message_at + 1) % 256; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_record.reject_reason = (rejected_order_message_base + 14 + 1) % 256;
  skip
}

/* Rejected Order Message to the wire, 15 bytes from where the cursor stands */
inline encode_rejected_order_message(rejected_order_message_record) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 14 -> wire[at] = rejected_order_message_record.order_token_client_order_id[rejected_order_message_at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  wire[at] = rejected_order_message_record.reject_reason; at = at + 1;
  skip
}

/* Rejected Order Message off the wire, 15 bytes from where the cursor stands */
inline decode_rejected_order_message(rejected_order_message_record) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 14 -> rejected_order_message_record.order_token_client_order_id[rejected_order_message_at] = wire[at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_record.reject_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Rejected Order Message is what was written, byte for byte */
inline equal_rejected_order_message(rejected_order_message_read, rejected_order_message_written) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 14 -> assert(rejected_order_message_read.order_token_client_order_id[rejected_order_message_at] == rejected_order_message_written.order_token_client_order_id[rejected_order_message_at]); rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  assert(rejected_order_message_read.reject_reason == rejected_order_message_written.reject_reason);
  skip
}

/* ---- Executed Order Message: 40 bytes ---------------------------------------- */

/* An Executed Order Message informs you that all or part of an order has been executed. */
typedef ExecutedOrderMessage {
  byte order_token_client_order_id[14];
  byte shares[6];
  byte price[10];
  byte liquidity;
  byte match_number[9]
};

int executed_order_message_at;

/* every byte of Executed Order Message set to one value */
inline fill_executed_order_message(executed_order_message_record, executed_order_message_value) {
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 14 -> executed_order_message_record.order_token_client_order_id[executed_order_message_at] = executed_order_message_value; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 6 -> executed_order_message_record.shares[executed_order_message_at] = executed_order_message_value; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 10 -> executed_order_message_record.price[executed_order_message_at] = executed_order_message_value; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_record.liquidity = executed_order_message_value;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 9 -> executed_order_message_record.match_number[executed_order_message_at] = executed_order_message_value; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Executed Order Message set to where it lies, so a field read out of place says so */
inline ramp_executed_order_message(executed_order_message_record, executed_order_message_base) {
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 14 -> executed_order_message_record.order_token_client_order_id[executed_order_message_at] = (executed_order_message_base + 0 + executed_order_message_at + 1) % 256; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 6 -> executed_order_message_record.shares[executed_order_message_at] = (executed_order_message_base + 14 + executed_order_message_at + 1) % 256; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 10 -> executed_order_message_record.price[executed_order_message_at] = (executed_order_message_base + 20 + executed_order_message_at + 1) % 256; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_record.liquidity = (executed_order_message_base + 30 + 1) % 256;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 9 -> executed_order_message_record.match_number[executed_order_message_at] = (executed_order_message_base + 31 + executed_order_message_at + 1) % 256; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Executed Order Message to the wire, 40 bytes from where the cursor stands */
inline encode_executed_order_message(executed_order_message_record) {
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 14 -> wire[at] = executed_order_message_record.order_token_client_order_id[executed_order_message_at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 6 -> wire[at] = executed_order_message_record.shares[executed_order_message_at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 10 -> wire[at] = executed_order_message_record.price[executed_order_message_at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  wire[at] = executed_order_message_record.liquidity; at = at + 1;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 9 -> wire[at] = executed_order_message_record.match_number[executed_order_message_at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Executed Order Message off the wire, 40 bytes from where the cursor stands */
inline decode_executed_order_message(executed_order_message_record) {
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 14 -> executed_order_message_record.order_token_client_order_id[executed_order_message_at] = wire[at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 6 -> executed_order_message_record.shares[executed_order_message_at] = wire[at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 10 -> executed_order_message_record.price[executed_order_message_at] = wire[at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_record.liquidity = wire[at]; at = at + 1;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 9 -> executed_order_message_record.match_number[executed_order_message_at] = wire[at]; at = at + 1; executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Executed Order Message is what was written, byte for byte */
inline equal_executed_order_message(executed_order_message_read, executed_order_message_written) {
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 14 -> assert(executed_order_message_read.order_token_client_order_id[executed_order_message_at] == executed_order_message_written.order_token_client_order_id[executed_order_message_at]); executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 6 -> assert(executed_order_message_read.shares[executed_order_message_at] == executed_order_message_written.shares[executed_order_message_at]); executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 10 -> assert(executed_order_message_read.price[executed_order_message_at] == executed_order_message_written.price[executed_order_message_at]); executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  assert(executed_order_message_read.liquidity == executed_order_message_written.liquidity);
  executed_order_message_at = 0;
  do
  :: executed_order_message_at < 9 -> assert(executed_order_message_read.match_number[executed_order_message_at] == executed_order_message_written.match_number[executed_order_message_at]); executed_order_message_at = executed_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Broken Trade Message: 24 bytes ------------------------------------------ */

/* A Broken Trade Message informs you that an execution has been broken. The trade is no longer good and will not clear. */
typedef BrokenTradeMessage {
  byte order_token[14];
  byte match_number[9];
  byte broken_trade_reason
};

int broken_trade_message_at;

/* every byte of Broken Trade Message set to one value */
inline fill_broken_trade_message(broken_trade_message_record, broken_trade_message_value) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 14 -> broken_trade_message_record.order_token[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 9 -> broken_trade_message_record.match_number[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.broken_trade_reason = broken_trade_message_value;
  skip
}

/* each byte of Broken Trade Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_message(broken_trade_message_record, broken_trade_message_base) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 14 -> broken_trade_message_record.order_token[broken_trade_message_at] = (broken_trade_message_base + 0 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 9 -> broken_trade_message_record.match_number[broken_trade_message_at] = (broken_trade_message_base + 14 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.broken_trade_reason = (broken_trade_message_base + 23 + 1) % 256;
  skip
}

/* Broken Trade Message to the wire, 24 bytes from where the cursor stands */
inline encode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 14 -> wire[at] = broken_trade_message_record.order_token[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 9 -> wire[at] = broken_trade_message_record.match_number[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = broken_trade_message_record.broken_trade_reason; at = at + 1;
  skip
}

/* Broken Trade Message off the wire, 24 bytes from where the cursor stands */
inline decode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 14 -> broken_trade_message_record.order_token[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 9 -> broken_trade_message_record.match_number[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.broken_trade_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Broken Trade Message is what was written, byte for byte */
inline equal_broken_trade_message(broken_trade_message_read, broken_trade_message_written) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 14 -> assert(broken_trade_message_read.order_token[broken_trade_message_at] == broken_trade_message_written.order_token[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 9 -> assert(broken_trade_message_read.match_number[broken_trade_message_at] == broken_trade_message_written.match_number[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  assert(broken_trade_message_read.broken_trade_reason == broken_trade_message_written.broken_trade_reason);
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

/* Sequenced Message Header: encoded, read back, and compared */
proctype check_sequenced_message_header() {
  SequencedMessageHeader sequenced_message_header_sent;
  SequencedMessageHeader sequenced_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequenced_message_header(sequenced_message_header_sent, 0)
  :: pattern == 1 -> fill_sequenced_message_header(sequenced_message_header_sent, 32)
  :: pattern == 2 -> fill_sequenced_message_header(sequenced_message_header_sent, 255)
  :: else -> ramp_sequenced_message_header(sequenced_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequenced_message_header(sequenced_message_header_sent);
    assert(at == 9);
    at = 0;
    decode_sequenced_message_header(sequenced_message_header_got);
    assert(at == 9);
    equal_sequenced_message_header(sequenced_message_header_got, sequenced_message_header_sent)
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
    assert(at == 1);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 1);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Accepted Order Message: encoded, read back, and compared */
proctype check_accepted_order_message() {
  AcceptedOrderMessage accepted_order_message_sent;
  AcceptedOrderMessage accepted_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_accepted_order_message(accepted_order_message_sent, 0)
  :: pattern == 1 -> fill_accepted_order_message(accepted_order_message_sent, 32)
  :: pattern == 2 -> fill_accepted_order_message(accepted_order_message_sent, 255)
  :: else -> ramp_accepted_order_message(accepted_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_accepted_order_message(accepted_order_message_sent);
    assert(at == 145);
    at = 0;
    decode_accepted_order_message(accepted_order_message_got);
    assert(at == 145);
    equal_accepted_order_message(accepted_order_message_got, accepted_order_message_sent)
  }
}

/* Accepted Order Message With Cross Functionality: encoded, read back, and compared */
proctype check_accepted_order_message_with_cross_functionality() {
  AcceptedOrderMessageWithCrossFunctionality accepted_order_message_with_cross_functionality_sent;
  AcceptedOrderMessageWithCrossFunctionality accepted_order_message_with_cross_functionality_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_accepted_order_message_with_cross_functionality(accepted_order_message_with_cross_functionality_sent, 0)
  :: pattern == 1 -> fill_accepted_order_message_with_cross_functionality(accepted_order_message_with_cross_functionality_sent, 32)
  :: pattern == 2 -> fill_accepted_order_message_with_cross_functionality(accepted_order_message_with_cross_functionality_sent, 255)
  :: else -> ramp_accepted_order_message_with_cross_functionality(accepted_order_message_with_cross_functionality_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_accepted_order_message_with_cross_functionality(accepted_order_message_with_cross_functionality_sent);
    assert(at == 147);
    at = 0;
    decode_accepted_order_message_with_cross_functionality(accepted_order_message_with_cross_functionality_got);
    assert(at == 147);
    equal_accepted_order_message_with_cross_functionality(accepted_order_message_with_cross_functionality_got, accepted_order_message_with_cross_functionality_sent)
  }
}

/* Canceled Order Message: encoded, read back, and compared */
proctype check_canceled_order_message() {
  CanceledOrderMessage canceled_order_message_sent;
  CanceledOrderMessage canceled_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_canceled_order_message(canceled_order_message_sent, 0)
  :: pattern == 1 -> fill_canceled_order_message(canceled_order_message_sent, 32)
  :: pattern == 2 -> fill_canceled_order_message(canceled_order_message_sent, 255)
  :: else -> ramp_canceled_order_message(canceled_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_canceled_order_message(canceled_order_message_sent);
    assert(at == 21);
    at = 0;
    decode_canceled_order_message(canceled_order_message_got);
    assert(at == 21);
    equal_canceled_order_message(canceled_order_message_got, canceled_order_message_sent)
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
    assert(at == 15);
    at = 0;
    decode_rejected_order_message(rejected_order_message_got);
    assert(at == 15);
    equal_rejected_order_message(rejected_order_message_got, rejected_order_message_sent)
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
    assert(at == 40);
    at = 0;
    decode_executed_order_message(executed_order_message_got);
    assert(at == 40);
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
    assert(at == 24);
    at = 0;
    decode_broken_trade_message(broken_trade_message_got);
    assert(at == 24);
    equal_broken_trade_message(broken_trade_message_got, broken_trade_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_sequenced_message_header()
  :: run check_system_event_message()
  :: run check_accepted_order_message()
  :: run check_accepted_order_message_with_cross_functionality()
  :: run check_canceled_order_message()
  :: run check_rejected_order_message()
  :: run check_executed_order_message()
  :: run check_broken_trade_message()
  fi
}
