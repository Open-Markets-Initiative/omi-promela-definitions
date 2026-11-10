/*
 * Japan Exchange Group Market By Order
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
 *   - a length prefix framing what follows
 *   - a field filling what is left of what holds it
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 15

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Tcp Packet Header: 3 bytes ---------------------------------------------- */

/* Jpx Flex Tcp packet header carrying length prefix and packet type discriminator */
typedef TcpPacketHeader {
  byte packet_length[2];
  byte packet_type
};

int tcp_packet_header_at;

/* every byte of Tcp Packet Header set to one value */
inline fill_tcp_packet_header(tcp_packet_header_record, tcp_packet_header_value) {
  tcp_packet_header_at = 0;
  do
  :: tcp_packet_header_at < 2 -> tcp_packet_header_record.packet_length[tcp_packet_header_at] = tcp_packet_header_value; tcp_packet_header_at = tcp_packet_header_at + 1
  :: else -> break
  od;
  tcp_packet_header_record.packet_type = tcp_packet_header_value;
  skip
}

/* each byte of Tcp Packet Header set to where it lies, so a field read out of place says so */
inline ramp_tcp_packet_header(tcp_packet_header_record, tcp_packet_header_base) {
  tcp_packet_header_at = 0;
  do
  :: tcp_packet_header_at < 2 -> tcp_packet_header_record.packet_length[tcp_packet_header_at] = (tcp_packet_header_base + 0 + tcp_packet_header_at + 1) % 256; tcp_packet_header_at = tcp_packet_header_at + 1
  :: else -> break
  od;
  tcp_packet_header_record.packet_type = (tcp_packet_header_base + 2 + 1) % 256;
  skip
}

/* Tcp Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_tcp_packet_header(tcp_packet_header_record) {
  tcp_packet_header_at = 0;
  do
  :: tcp_packet_header_at < 2 -> wire[at] = tcp_packet_header_record.packet_length[tcp_packet_header_at]; at = at + 1; tcp_packet_header_at = tcp_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = tcp_packet_header_record.packet_type; at = at + 1;
  skip
}

/* Tcp Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_tcp_packet_header(tcp_packet_header_record) {
  tcp_packet_header_at = 0;
  do
  :: tcp_packet_header_at < 2 -> tcp_packet_header_record.packet_length[tcp_packet_header_at] = wire[at]; at = at + 1; tcp_packet_header_at = tcp_packet_header_at + 1
  :: else -> break
  od;
  tcp_packet_header_record.packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Tcp Packet Header is what was written, byte for byte */
inline equal_tcp_packet_header(tcp_packet_header_read, tcp_packet_header_written) {
  tcp_packet_header_at = 0;
  do
  :: tcp_packet_header_at < 2 -> assert(tcp_packet_header_read.packet_length[tcp_packet_header_at] == tcp_packet_header_written.packet_length[tcp_packet_header_at]); tcp_packet_header_at = tcp_packet_header_at + 1
  :: else -> break
  od;
  assert(tcp_packet_header_read.packet_type == tcp_packet_header_written.packet_type);
  skip
}

/* ---- Login Request Retransmission Message: 15 bytes -------------------------- */

/* Tcp login request selecting retransmission, sent by the user. One of the two Packet Type codes the document gives the 18 byte Login Request. */
typedef LoginRequestRetransmissionMessage {
  byte user_id[6];
  byte multicast_group_number;
  byte number_of_system_reboots;
  byte sequence_number[4];
  byte requested_message_count[3]
};

int login_request_retransmission_message_at;

/* every byte of Login Request Retransmission Message set to one value */
inline fill_login_request_retransmission_message(login_request_retransmission_message_record, login_request_retransmission_message_value) {
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 6 -> login_request_retransmission_message_record.user_id[login_request_retransmission_message_at] = login_request_retransmission_message_value; login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  login_request_retransmission_message_record.multicast_group_number = login_request_retransmission_message_value;
  login_request_retransmission_message_record.number_of_system_reboots = login_request_retransmission_message_value;
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 4 -> login_request_retransmission_message_record.sequence_number[login_request_retransmission_message_at] = login_request_retransmission_message_value; login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 3 -> login_request_retransmission_message_record.requested_message_count[login_request_retransmission_message_at] = login_request_retransmission_message_value; login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request Retransmission Message set to where it lies, so a field read out of place says so */
inline ramp_login_request_retransmission_message(login_request_retransmission_message_record, login_request_retransmission_message_base) {
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 6 -> login_request_retransmission_message_record.user_id[login_request_retransmission_message_at] = (login_request_retransmission_message_base + 0 + login_request_retransmission_message_at + 1) % 256; login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  login_request_retransmission_message_record.multicast_group_number = (login_request_retransmission_message_base + 6 + 1) % 256;
  login_request_retransmission_message_record.number_of_system_reboots = (login_request_retransmission_message_base + 7 + 1) % 256;
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 4 -> login_request_retransmission_message_record.sequence_number[login_request_retransmission_message_at] = (login_request_retransmission_message_base + 8 + login_request_retransmission_message_at + 1) % 256; login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 3 -> login_request_retransmission_message_record.requested_message_count[login_request_retransmission_message_at] = (login_request_retransmission_message_base + 12 + login_request_retransmission_message_at + 1) % 256; login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Retransmission Message to the wire, 15 bytes from where the cursor stands */
inline encode_login_request_retransmission_message(login_request_retransmission_message_record) {
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 6 -> wire[at] = login_request_retransmission_message_record.user_id[login_request_retransmission_message_at]; at = at + 1; login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  wire[at] = login_request_retransmission_message_record.multicast_group_number; at = at + 1;
  wire[at] = login_request_retransmission_message_record.number_of_system_reboots; at = at + 1;
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 4 -> wire[at] = login_request_retransmission_message_record.sequence_number[login_request_retransmission_message_at]; at = at + 1; login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 3 -> wire[at] = login_request_retransmission_message_record.requested_message_count[login_request_retransmission_message_at]; at = at + 1; login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Retransmission Message off the wire, 15 bytes from where the cursor stands */
inline decode_login_request_retransmission_message(login_request_retransmission_message_record) {
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 6 -> login_request_retransmission_message_record.user_id[login_request_retransmission_message_at] = wire[at]; at = at + 1; login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  login_request_retransmission_message_record.multicast_group_number = wire[at]; at = at + 1;
  login_request_retransmission_message_record.number_of_system_reboots = wire[at]; at = at + 1;
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 4 -> login_request_retransmission_message_record.sequence_number[login_request_retransmission_message_at] = wire[at]; at = at + 1; login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 3 -> login_request_retransmission_message_record.requested_message_count[login_request_retransmission_message_at] = wire[at]; at = at + 1; login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request Retransmission Message is what was written, byte for byte */
inline equal_login_request_retransmission_message(login_request_retransmission_message_read, login_request_retransmission_message_written) {
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 6 -> assert(login_request_retransmission_message_read.user_id[login_request_retransmission_message_at] == login_request_retransmission_message_written.user_id[login_request_retransmission_message_at]); login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  assert(login_request_retransmission_message_read.multicast_group_number == login_request_retransmission_message_written.multicast_group_number);
  assert(login_request_retransmission_message_read.number_of_system_reboots == login_request_retransmission_message_written.number_of_system_reboots);
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 4 -> assert(login_request_retransmission_message_read.sequence_number[login_request_retransmission_message_at] == login_request_retransmission_message_written.sequence_number[login_request_retransmission_message_at]); login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  login_request_retransmission_message_at = 0;
  do
  :: login_request_retransmission_message_at < 3 -> assert(login_request_retransmission_message_read.requested_message_count[login_request_retransmission_message_at] == login_request_retransmission_message_written.requested_message_count[login_request_retransmission_message_at]); login_request_retransmission_message_at = login_request_retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Request Snapshot Message: 15 bytes -------------------------------- */

/* Tcp login request selecting snapshot, sent by the user. Same layout as the retransmission request; Number of System Reboots, Sequence Number and Requested Message Count are all set to 0. */
typedef LoginRequestSnapshotMessage {
  byte user_id[6];
  byte multicast_group_number;
  byte number_of_system_reboots;
  byte sequence_number[4];
  byte requested_message_count[3]
};

int login_request_snapshot_message_at;

/* every byte of Login Request Snapshot Message set to one value */
inline fill_login_request_snapshot_message(login_request_snapshot_message_record, login_request_snapshot_message_value) {
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 6 -> login_request_snapshot_message_record.user_id[login_request_snapshot_message_at] = login_request_snapshot_message_value; login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  login_request_snapshot_message_record.multicast_group_number = login_request_snapshot_message_value;
  login_request_snapshot_message_record.number_of_system_reboots = login_request_snapshot_message_value;
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 4 -> login_request_snapshot_message_record.sequence_number[login_request_snapshot_message_at] = login_request_snapshot_message_value; login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 3 -> login_request_snapshot_message_record.requested_message_count[login_request_snapshot_message_at] = login_request_snapshot_message_value; login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_login_request_snapshot_message(login_request_snapshot_message_record, login_request_snapshot_message_base) {
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 6 -> login_request_snapshot_message_record.user_id[login_request_snapshot_message_at] = (login_request_snapshot_message_base + 0 + login_request_snapshot_message_at + 1) % 256; login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  login_request_snapshot_message_record.multicast_group_number = (login_request_snapshot_message_base + 6 + 1) % 256;
  login_request_snapshot_message_record.number_of_system_reboots = (login_request_snapshot_message_base + 7 + 1) % 256;
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 4 -> login_request_snapshot_message_record.sequence_number[login_request_snapshot_message_at] = (login_request_snapshot_message_base + 8 + login_request_snapshot_message_at + 1) % 256; login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 3 -> login_request_snapshot_message_record.requested_message_count[login_request_snapshot_message_at] = (login_request_snapshot_message_base + 12 + login_request_snapshot_message_at + 1) % 256; login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Snapshot Message to the wire, 15 bytes from where the cursor stands */
inline encode_login_request_snapshot_message(login_request_snapshot_message_record) {
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 6 -> wire[at] = login_request_snapshot_message_record.user_id[login_request_snapshot_message_at]; at = at + 1; login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = login_request_snapshot_message_record.multicast_group_number; at = at + 1;
  wire[at] = login_request_snapshot_message_record.number_of_system_reboots; at = at + 1;
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 4 -> wire[at] = login_request_snapshot_message_record.sequence_number[login_request_snapshot_message_at]; at = at + 1; login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 3 -> wire[at] = login_request_snapshot_message_record.requested_message_count[login_request_snapshot_message_at]; at = at + 1; login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Snapshot Message off the wire, 15 bytes from where the cursor stands */
inline decode_login_request_snapshot_message(login_request_snapshot_message_record) {
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 6 -> login_request_snapshot_message_record.user_id[login_request_snapshot_message_at] = wire[at]; at = at + 1; login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  login_request_snapshot_message_record.multicast_group_number = wire[at]; at = at + 1;
  login_request_snapshot_message_record.number_of_system_reboots = wire[at]; at = at + 1;
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 4 -> login_request_snapshot_message_record.sequence_number[login_request_snapshot_message_at] = wire[at]; at = at + 1; login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 3 -> login_request_snapshot_message_record.requested_message_count[login_request_snapshot_message_at] = wire[at]; at = at + 1; login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request Snapshot Message is what was written, byte for byte */
inline equal_login_request_snapshot_message(login_request_snapshot_message_read, login_request_snapshot_message_written) {
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 6 -> assert(login_request_snapshot_message_read.user_id[login_request_snapshot_message_at] == login_request_snapshot_message_written.user_id[login_request_snapshot_message_at]); login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  assert(login_request_snapshot_message_read.multicast_group_number == login_request_snapshot_message_written.multicast_group_number);
  assert(login_request_snapshot_message_read.number_of_system_reboots == login_request_snapshot_message_written.number_of_system_reboots);
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 4 -> assert(login_request_snapshot_message_read.sequence_number[login_request_snapshot_message_at] == login_request_snapshot_message_written.sequence_number[login_request_snapshot_message_at]); login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  login_request_snapshot_message_at = 0;
  do
  :: login_request_snapshot_message_at < 3 -> assert(login_request_snapshot_message_read.requested_message_count[login_request_snapshot_message_at] == login_request_snapshot_message_written.requested_message_count[login_request_snapshot_message_at]); login_request_snapshot_message_at = login_request_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Result Accepted Message: 2 bytes ---------------------------------- */

/* Tcp login response accepting the request. Result Code carries A. */
typedef LoginResultAcceptedMessage {
  byte multicast_group_number;
  byte result_code
};

/* every byte of Login Result Accepted Message set to one value */
inline fill_login_result_accepted_message(login_result_accepted_message_record, login_result_accepted_message_value) {
  login_result_accepted_message_record.multicast_group_number = login_result_accepted_message_value;
  login_result_accepted_message_record.result_code = login_result_accepted_message_value;
  skip
}

/* each byte of Login Result Accepted Message set to where it lies, so a field read out of place says so */
inline ramp_login_result_accepted_message(login_result_accepted_message_record, login_result_accepted_message_base) {
  login_result_accepted_message_record.multicast_group_number = (login_result_accepted_message_base + 0 + 1) % 256;
  login_result_accepted_message_record.result_code = (login_result_accepted_message_base + 1 + 1) % 256;
  skip
}

/* Login Result Accepted Message to the wire, 2 bytes from where the cursor stands */
inline encode_login_result_accepted_message(login_result_accepted_message_record) {
  wire[at] = login_result_accepted_message_record.multicast_group_number; at = at + 1;
  wire[at] = login_result_accepted_message_record.result_code; at = at + 1;
  skip
}

/* Login Result Accepted Message off the wire, 2 bytes from where the cursor stands */
inline decode_login_result_accepted_message(login_result_accepted_message_record) {
  login_result_accepted_message_record.multicast_group_number = wire[at]; at = at + 1;
  login_result_accepted_message_record.result_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Result Accepted Message is what was written, byte for byte */
inline equal_login_result_accepted_message(login_result_accepted_message_read, login_result_accepted_message_written) {
  assert(login_result_accepted_message_read.multicast_group_number == login_result_accepted_message_written.multicast_group_number);
  assert(login_result_accepted_message_read.result_code == login_result_accepted_message_written.result_code);
  skip
}

/* ---- Login Result Rejected Message: 2 bytes ---------------------------------- */

/* Tcp login response rejecting the request. Same layout as the accepted response; Result Code carries the reason the request failed. */
typedef LoginResultRejectedMessage {
  byte multicast_group_number;
  byte result_code
};

/* every byte of Login Result Rejected Message set to one value */
inline fill_login_result_rejected_message(login_result_rejected_message_record, login_result_rejected_message_value) {
  login_result_rejected_message_record.multicast_group_number = login_result_rejected_message_value;
  login_result_rejected_message_record.result_code = login_result_rejected_message_value;
  skip
}

/* each byte of Login Result Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_login_result_rejected_message(login_result_rejected_message_record, login_result_rejected_message_base) {
  login_result_rejected_message_record.multicast_group_number = (login_result_rejected_message_base + 0 + 1) % 256;
  login_result_rejected_message_record.result_code = (login_result_rejected_message_base + 1 + 1) % 256;
  skip
}

/* Login Result Rejected Message to the wire, 2 bytes from where the cursor stands */
inline encode_login_result_rejected_message(login_result_rejected_message_record) {
  wire[at] = login_result_rejected_message_record.multicast_group_number; at = at + 1;
  wire[at] = login_result_rejected_message_record.result_code; at = at + 1;
  skip
}

/* Login Result Rejected Message off the wire, 2 bytes from where the cursor stands */
inline decode_login_result_rejected_message(login_result_rejected_message_record) {
  login_result_rejected_message_record.multicast_group_number = wire[at]; at = at + 1;
  login_result_rejected_message_record.result_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Result Rejected Message is what was written, byte for byte */
inline equal_login_result_rejected_message(login_result_rejected_message_read, login_result_rejected_message_written) {
  assert(login_result_rejected_message_read.multicast_group_number == login_result_rejected_message_written.multicast_group_number);
  assert(login_result_rejected_message_read.result_code == login_result_rejected_message_written.result_code);
  skip
}

/* ---- End Of Message Message: 6 bytes ----------------------------------------- */

/* Tcp end of message marker terminating a retransmission or snapshot session. */
typedef EndOfMessageMessage {
  byte multicast_group_number;
  byte number_of_system_reboots;
  byte next_sequence_number[4]
};

int end_of_message_message_at;

/* every byte of End Of Message Message set to one value */
inline fill_end_of_message_message(end_of_message_message_record, end_of_message_message_value) {
  end_of_message_message_record.multicast_group_number = end_of_message_message_value;
  end_of_message_message_record.number_of_system_reboots = end_of_message_message_value;
  end_of_message_message_at = 0;
  do
  :: end_of_message_message_at < 4 -> end_of_message_message_record.next_sequence_number[end_of_message_message_at] = end_of_message_message_value; end_of_message_message_at = end_of_message_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Message Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_message_message(end_of_message_message_record, end_of_message_message_base) {
  end_of_message_message_record.multicast_group_number = (end_of_message_message_base + 0 + 1) % 256;
  end_of_message_message_record.number_of_system_reboots = (end_of_message_message_base + 1 + 1) % 256;
  end_of_message_message_at = 0;
  do
  :: end_of_message_message_at < 4 -> end_of_message_message_record.next_sequence_number[end_of_message_message_at] = (end_of_message_message_base + 2 + end_of_message_message_at + 1) % 256; end_of_message_message_at = end_of_message_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Message Message to the wire, 6 bytes from where the cursor stands */
inline encode_end_of_message_message(end_of_message_message_record) {
  wire[at] = end_of_message_message_record.multicast_group_number; at = at + 1;
  wire[at] = end_of_message_message_record.number_of_system_reboots; at = at + 1;
  end_of_message_message_at = 0;
  do
  :: end_of_message_message_at < 4 -> wire[at] = end_of_message_message_record.next_sequence_number[end_of_message_message_at]; at = at + 1; end_of_message_message_at = end_of_message_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Message Message off the wire, 6 bytes from where the cursor stands */
inline decode_end_of_message_message(end_of_message_message_record) {
  end_of_message_message_record.multicast_group_number = wire[at]; at = at + 1;
  end_of_message_message_record.number_of_system_reboots = wire[at]; at = at + 1;
  end_of_message_message_at = 0;
  do
  :: end_of_message_message_at < 4 -> end_of_message_message_record.next_sequence_number[end_of_message_message_at] = wire[at]; at = at + 1; end_of_message_message_at = end_of_message_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Message Message is what was written, byte for byte */
inline equal_end_of_message_message(end_of_message_message_read, end_of_message_message_written) {
  assert(end_of_message_message_read.multicast_group_number == end_of_message_message_written.multicast_group_number);
  assert(end_of_message_message_read.number_of_system_reboots == end_of_message_message_written.number_of_system_reboots);
  end_of_message_message_at = 0;
  do
  :: end_of_message_message_at < 4 -> assert(end_of_message_message_read.next_sequence_number[end_of_message_message_at] == end_of_message_message_written.next_sequence_number[end_of_message_message_at]); end_of_message_message_at = end_of_message_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Tcp Packet Header: encoded, read back, and compared */
proctype check_tcp_packet_header() {
  TcpPacketHeader tcp_packet_header_sent;
  TcpPacketHeader tcp_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tcp_packet_header(tcp_packet_header_sent, 0)
  :: pattern == 1 -> fill_tcp_packet_header(tcp_packet_header_sent, 32)
  :: pattern == 2 -> fill_tcp_packet_header(tcp_packet_header_sent, 255)
  :: else -> ramp_tcp_packet_header(tcp_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tcp_packet_header(tcp_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_tcp_packet_header(tcp_packet_header_got);
    assert(at == 3);
    equal_tcp_packet_header(tcp_packet_header_got, tcp_packet_header_sent)
  }
}

/* Login Request Retransmission Message: encoded, read back, and compared */
proctype check_login_request_retransmission_message() {
  LoginRequestRetransmissionMessage login_request_retransmission_message_sent;
  LoginRequestRetransmissionMessage login_request_retransmission_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_request_retransmission_message(login_request_retransmission_message_sent, 0)
  :: pattern == 1 -> fill_login_request_retransmission_message(login_request_retransmission_message_sent, 32)
  :: pattern == 2 -> fill_login_request_retransmission_message(login_request_retransmission_message_sent, 255)
  :: else -> ramp_login_request_retransmission_message(login_request_retransmission_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_request_retransmission_message(login_request_retransmission_message_sent);
    assert(at == 15);
    at = 0;
    decode_login_request_retransmission_message(login_request_retransmission_message_got);
    assert(at == 15);
    equal_login_request_retransmission_message(login_request_retransmission_message_got, login_request_retransmission_message_sent)
  }
}

/* Login Request Snapshot Message: encoded, read back, and compared */
proctype check_login_request_snapshot_message() {
  LoginRequestSnapshotMessage login_request_snapshot_message_sent;
  LoginRequestSnapshotMessage login_request_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_request_snapshot_message(login_request_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_login_request_snapshot_message(login_request_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_login_request_snapshot_message(login_request_snapshot_message_sent, 255)
  :: else -> ramp_login_request_snapshot_message(login_request_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_request_snapshot_message(login_request_snapshot_message_sent);
    assert(at == 15);
    at = 0;
    decode_login_request_snapshot_message(login_request_snapshot_message_got);
    assert(at == 15);
    equal_login_request_snapshot_message(login_request_snapshot_message_got, login_request_snapshot_message_sent)
  }
}

/* Login Result Accepted Message: encoded, read back, and compared */
proctype check_login_result_accepted_message() {
  LoginResultAcceptedMessage login_result_accepted_message_sent;
  LoginResultAcceptedMessage login_result_accepted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_result_accepted_message(login_result_accepted_message_sent, 0)
  :: pattern == 1 -> fill_login_result_accepted_message(login_result_accepted_message_sent, 32)
  :: pattern == 2 -> fill_login_result_accepted_message(login_result_accepted_message_sent, 255)
  :: else -> ramp_login_result_accepted_message(login_result_accepted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_result_accepted_message(login_result_accepted_message_sent);
    assert(at == 2);
    at = 0;
    decode_login_result_accepted_message(login_result_accepted_message_got);
    assert(at == 2);
    equal_login_result_accepted_message(login_result_accepted_message_got, login_result_accepted_message_sent)
  }
}

/* Login Result Rejected Message: encoded, read back, and compared */
proctype check_login_result_rejected_message() {
  LoginResultRejectedMessage login_result_rejected_message_sent;
  LoginResultRejectedMessage login_result_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_result_rejected_message(login_result_rejected_message_sent, 0)
  :: pattern == 1 -> fill_login_result_rejected_message(login_result_rejected_message_sent, 32)
  :: pattern == 2 -> fill_login_result_rejected_message(login_result_rejected_message_sent, 255)
  :: else -> ramp_login_result_rejected_message(login_result_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_result_rejected_message(login_result_rejected_message_sent);
    assert(at == 2);
    at = 0;
    decode_login_result_rejected_message(login_result_rejected_message_got);
    assert(at == 2);
    equal_login_result_rejected_message(login_result_rejected_message_got, login_result_rejected_message_sent)
  }
}

/* End Of Message Message: encoded, read back, and compared */
proctype check_end_of_message_message() {
  EndOfMessageMessage end_of_message_message_sent;
  EndOfMessageMessage end_of_message_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_message_message(end_of_message_message_sent, 0)
  :: pattern == 1 -> fill_end_of_message_message(end_of_message_message_sent, 32)
  :: pattern == 2 -> fill_end_of_message_message(end_of_message_message_sent, 255)
  :: else -> ramp_end_of_message_message(end_of_message_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_message_message(end_of_message_message_sent);
    assert(at == 6);
    at = 0;
    decode_end_of_message_message(end_of_message_message_got);
    assert(at == 6);
    equal_end_of_message_message(end_of_message_message_got, end_of_message_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_tcp_packet_header()
  :: run check_login_request_retransmission_message()
  :: run check_login_request_snapshot_message()
  :: run check_login_result_accepted_message()
  :: run check_login_result_rejected_message()
  :: run check_end_of_message_message()
  fi
}
