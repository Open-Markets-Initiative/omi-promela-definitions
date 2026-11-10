/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Specialized Quote Interface
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 74

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

/* ---- Msar Accept Message: 30 bytes ------------------------------------------- */

/* The MSAR Request was accepted by the matching engine. Sequenced. */
typedef MsarAcceptMessage {
  byte badge[4];
  byte message_id[8];
  byte instrument_id[4];
  byte msar_type;
  byte auction_id[4];
  byte price[4];
  byte side;
  byte contracts[4]
};

int msar_accept_message_at;

/* every byte of Msar Accept Message set to one value */
inline fill_msar_accept_message(msar_accept_message_record, msar_accept_message_value) {
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.badge[msar_accept_message_at] = msar_accept_message_value; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 8 -> msar_accept_message_record.message_id[msar_accept_message_at] = msar_accept_message_value; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.instrument_id[msar_accept_message_at] = msar_accept_message_value; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_record.msar_type = msar_accept_message_value;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.auction_id[msar_accept_message_at] = msar_accept_message_value; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.price[msar_accept_message_at] = msar_accept_message_value; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_record.side = msar_accept_message_value;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.contracts[msar_accept_message_at] = msar_accept_message_value; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Msar Accept Message set to where it lies, so a field read out of place says so */
inline ramp_msar_accept_message(msar_accept_message_record, msar_accept_message_base) {
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.badge[msar_accept_message_at] = (msar_accept_message_base + 0 + msar_accept_message_at + 1) % 256; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 8 -> msar_accept_message_record.message_id[msar_accept_message_at] = (msar_accept_message_base + 4 + msar_accept_message_at + 1) % 256; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.instrument_id[msar_accept_message_at] = (msar_accept_message_base + 12 + msar_accept_message_at + 1) % 256; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_record.msar_type = (msar_accept_message_base + 16 + 1) % 256;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.auction_id[msar_accept_message_at] = (msar_accept_message_base + 17 + msar_accept_message_at + 1) % 256; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.price[msar_accept_message_at] = (msar_accept_message_base + 21 + msar_accept_message_at + 1) % 256; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_record.side = (msar_accept_message_base + 25 + 1) % 256;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.contracts[msar_accept_message_at] = (msar_accept_message_base + 26 + msar_accept_message_at + 1) % 256; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  skip
}

/* Msar Accept Message to the wire, 30 bytes from where the cursor stands */
inline encode_msar_accept_message(msar_accept_message_record) {
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> wire[at] = msar_accept_message_record.badge[msar_accept_message_at]; at = at + 1; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 8 -> wire[at] = msar_accept_message_record.message_id[msar_accept_message_at]; at = at + 1; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> wire[at] = msar_accept_message_record.instrument_id[msar_accept_message_at]; at = at + 1; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  wire[at] = msar_accept_message_record.msar_type; at = at + 1;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> wire[at] = msar_accept_message_record.auction_id[msar_accept_message_at]; at = at + 1; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> wire[at] = msar_accept_message_record.price[msar_accept_message_at]; at = at + 1; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  wire[at] = msar_accept_message_record.side; at = at + 1;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> wire[at] = msar_accept_message_record.contracts[msar_accept_message_at]; at = at + 1; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  skip
}

/* Msar Accept Message off the wire, 30 bytes from where the cursor stands */
inline decode_msar_accept_message(msar_accept_message_record) {
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.badge[msar_accept_message_at] = wire[at]; at = at + 1; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 8 -> msar_accept_message_record.message_id[msar_accept_message_at] = wire[at]; at = at + 1; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.instrument_id[msar_accept_message_at] = wire[at]; at = at + 1; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_record.msar_type = wire[at]; at = at + 1;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.auction_id[msar_accept_message_at] = wire[at]; at = at + 1; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.price[msar_accept_message_at] = wire[at]; at = at + 1; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_record.side = wire[at]; at = at + 1;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> msar_accept_message_record.contracts[msar_accept_message_at] = wire[at]; at = at + 1; msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Msar Accept Message is what was written, byte for byte */
inline equal_msar_accept_message(msar_accept_message_read, msar_accept_message_written) {
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> assert(msar_accept_message_read.badge[msar_accept_message_at] == msar_accept_message_written.badge[msar_accept_message_at]); msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 8 -> assert(msar_accept_message_read.message_id[msar_accept_message_at] == msar_accept_message_written.message_id[msar_accept_message_at]); msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> assert(msar_accept_message_read.instrument_id[msar_accept_message_at] == msar_accept_message_written.instrument_id[msar_accept_message_at]); msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  assert(msar_accept_message_read.msar_type == msar_accept_message_written.msar_type);
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> assert(msar_accept_message_read.auction_id[msar_accept_message_at] == msar_accept_message_written.auction_id[msar_accept_message_at]); msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> assert(msar_accept_message_read.price[msar_accept_message_at] == msar_accept_message_written.price[msar_accept_message_at]); msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  assert(msar_accept_message_read.side == msar_accept_message_written.side);
  msar_accept_message_at = 0;
  do
  :: msar_accept_message_at < 4 -> assert(msar_accept_message_read.contracts[msar_accept_message_at] == msar_accept_message_written.contracts[msar_accept_message_at]); msar_accept_message_at = msar_accept_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Msar Reject Message: 13 bytes ------------------------------------------- */

/* The MSAR Request is invalid and therefore rejected. Sequenced. */
typedef MsarRejectMessage {
  byte badge[4];
  byte message_id[8];
  byte status_code
};

int msar_reject_message_at;

/* every byte of Msar Reject Message set to one value */
inline fill_msar_reject_message(msar_reject_message_record, msar_reject_message_value) {
  msar_reject_message_at = 0;
  do
  :: msar_reject_message_at < 4 -> msar_reject_message_record.badge[msar_reject_message_at] = msar_reject_message_value; msar_reject_message_at = msar_reject_message_at + 1
  :: else -> break
  od;
  msar_reject_message_at = 0;
  do
  :: msar_reject_message_at < 8 -> msar_reject_message_record.message_id[msar_reject_message_at] = msar_reject_message_value; msar_reject_message_at = msar_reject_message_at + 1
  :: else -> break
  od;
  msar_reject_message_record.status_code = msar_reject_message_value;
  skip
}

/* each byte of Msar Reject Message set to where it lies, so a field read out of place says so */
inline ramp_msar_reject_message(msar_reject_message_record, msar_reject_message_base) {
  msar_reject_message_at = 0;
  do
  :: msar_reject_message_at < 4 -> msar_reject_message_record.badge[msar_reject_message_at] = (msar_reject_message_base + 0 + msar_reject_message_at + 1) % 256; msar_reject_message_at = msar_reject_message_at + 1
  :: else -> break
  od;
  msar_reject_message_at = 0;
  do
  :: msar_reject_message_at < 8 -> msar_reject_message_record.message_id[msar_reject_message_at] = (msar_reject_message_base + 4 + msar_reject_message_at + 1) % 256; msar_reject_message_at = msar_reject_message_at + 1
  :: else -> break
  od;
  msar_reject_message_record.status_code = (msar_reject_message_base + 12 + 1) % 256;
  skip
}

/* Msar Reject Message to the wire, 13 bytes from where the cursor stands */
inline encode_msar_reject_message(msar_reject_message_record) {
  msar_reject_message_at = 0;
  do
  :: msar_reject_message_at < 4 -> wire[at] = msar_reject_message_record.badge[msar_reject_message_at]; at = at + 1; msar_reject_message_at = msar_reject_message_at + 1
  :: else -> break
  od;
  msar_reject_message_at = 0;
  do
  :: msar_reject_message_at < 8 -> wire[at] = msar_reject_message_record.message_id[msar_reject_message_at]; at = at + 1; msar_reject_message_at = msar_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = msar_reject_message_record.status_code; at = at + 1;
  skip
}

/* Msar Reject Message off the wire, 13 bytes from where the cursor stands */
inline decode_msar_reject_message(msar_reject_message_record) {
  msar_reject_message_at = 0;
  do
  :: msar_reject_message_at < 4 -> msar_reject_message_record.badge[msar_reject_message_at] = wire[at]; at = at + 1; msar_reject_message_at = msar_reject_message_at + 1
  :: else -> break
  od;
  msar_reject_message_at = 0;
  do
  :: msar_reject_message_at < 8 -> msar_reject_message_record.message_id[msar_reject_message_at] = wire[at]; at = at + 1; msar_reject_message_at = msar_reject_message_at + 1
  :: else -> break
  od;
  msar_reject_message_record.status_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Msar Reject Message is what was written, byte for byte */
inline equal_msar_reject_message(msar_reject_message_read, msar_reject_message_written) {
  msar_reject_message_at = 0;
  do
  :: msar_reject_message_at < 4 -> assert(msar_reject_message_read.badge[msar_reject_message_at] == msar_reject_message_written.badge[msar_reject_message_at]); msar_reject_message_at = msar_reject_message_at + 1
  :: else -> break
  od;
  msar_reject_message_at = 0;
  do
  :: msar_reject_message_at < 8 -> assert(msar_reject_message_read.message_id[msar_reject_message_at] == msar_reject_message_written.message_id[msar_reject_message_at]); msar_reject_message_at = msar_reject_message_at + 1
  :: else -> break
  od;
  assert(msar_reject_message_read.status_code == msar_reject_message_written.status_code);
  skip
}

/* ---- Complex Msar Accept Message: 35 bytes ----------------------------------- */

/* The Complex MSAR Request was accepted by the matching engine. Sequenced. */
typedef ComplexMsarAcceptMessage {
  byte badge[4];
  byte message_id[8];
  byte instrument_id[4];
  byte msar_type;
  byte auction_id[4];
  byte price[4];
  byte side;
  byte contracts[4];
  byte price_protection;
  byte reserved_4[4]
};

int complex_msar_accept_message_at;

/* every byte of Complex Msar Accept Message set to one value */
inline fill_complex_msar_accept_message(complex_msar_accept_message_record, complex_msar_accept_message_value) {
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.badge[complex_msar_accept_message_at] = complex_msar_accept_message_value; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 8 -> complex_msar_accept_message_record.message_id[complex_msar_accept_message_at] = complex_msar_accept_message_value; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.instrument_id[complex_msar_accept_message_at] = complex_msar_accept_message_value; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_record.msar_type = complex_msar_accept_message_value;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.auction_id[complex_msar_accept_message_at] = complex_msar_accept_message_value; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.price[complex_msar_accept_message_at] = complex_msar_accept_message_value; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_record.side = complex_msar_accept_message_value;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.contracts[complex_msar_accept_message_at] = complex_msar_accept_message_value; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_record.price_protection = complex_msar_accept_message_value;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.reserved_4[complex_msar_accept_message_at] = complex_msar_accept_message_value; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Msar Accept Message set to where it lies, so a field read out of place says so */
inline ramp_complex_msar_accept_message(complex_msar_accept_message_record, complex_msar_accept_message_base) {
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.badge[complex_msar_accept_message_at] = (complex_msar_accept_message_base + 0 + complex_msar_accept_message_at + 1) % 256; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 8 -> complex_msar_accept_message_record.message_id[complex_msar_accept_message_at] = (complex_msar_accept_message_base + 4 + complex_msar_accept_message_at + 1) % 256; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.instrument_id[complex_msar_accept_message_at] = (complex_msar_accept_message_base + 12 + complex_msar_accept_message_at + 1) % 256; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_record.msar_type = (complex_msar_accept_message_base + 16 + 1) % 256;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.auction_id[complex_msar_accept_message_at] = (complex_msar_accept_message_base + 17 + complex_msar_accept_message_at + 1) % 256; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.price[complex_msar_accept_message_at] = (complex_msar_accept_message_base + 21 + complex_msar_accept_message_at + 1) % 256; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_record.side = (complex_msar_accept_message_base + 25 + 1) % 256;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.contracts[complex_msar_accept_message_at] = (complex_msar_accept_message_base + 26 + complex_msar_accept_message_at + 1) % 256; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_record.price_protection = (complex_msar_accept_message_base + 30 + 1) % 256;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.reserved_4[complex_msar_accept_message_at] = (complex_msar_accept_message_base + 31 + complex_msar_accept_message_at + 1) % 256; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Msar Accept Message to the wire, 35 bytes from where the cursor stands */
inline encode_complex_msar_accept_message(complex_msar_accept_message_record) {
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> wire[at] = complex_msar_accept_message_record.badge[complex_msar_accept_message_at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 8 -> wire[at] = complex_msar_accept_message_record.message_id[complex_msar_accept_message_at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> wire[at] = complex_msar_accept_message_record.instrument_id[complex_msar_accept_message_at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_accept_message_record.msar_type; at = at + 1;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> wire[at] = complex_msar_accept_message_record.auction_id[complex_msar_accept_message_at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> wire[at] = complex_msar_accept_message_record.price[complex_msar_accept_message_at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_accept_message_record.side; at = at + 1;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> wire[at] = complex_msar_accept_message_record.contracts[complex_msar_accept_message_at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_accept_message_record.price_protection; at = at + 1;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> wire[at] = complex_msar_accept_message_record.reserved_4[complex_msar_accept_message_at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Msar Accept Message off the wire, 35 bytes from where the cursor stands */
inline decode_complex_msar_accept_message(complex_msar_accept_message_record) {
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.badge[complex_msar_accept_message_at] = wire[at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 8 -> complex_msar_accept_message_record.message_id[complex_msar_accept_message_at] = wire[at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.instrument_id[complex_msar_accept_message_at] = wire[at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_record.msar_type = wire[at]; at = at + 1;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.auction_id[complex_msar_accept_message_at] = wire[at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.price[complex_msar_accept_message_at] = wire[at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_record.side = wire[at]; at = at + 1;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.contracts[complex_msar_accept_message_at] = wire[at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_record.price_protection = wire[at]; at = at + 1;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> complex_msar_accept_message_record.reserved_4[complex_msar_accept_message_at] = wire[at]; at = at + 1; complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Msar Accept Message is what was written, byte for byte */
inline equal_complex_msar_accept_message(complex_msar_accept_message_read, complex_msar_accept_message_written) {
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> assert(complex_msar_accept_message_read.badge[complex_msar_accept_message_at] == complex_msar_accept_message_written.badge[complex_msar_accept_message_at]); complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 8 -> assert(complex_msar_accept_message_read.message_id[complex_msar_accept_message_at] == complex_msar_accept_message_written.message_id[complex_msar_accept_message_at]); complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> assert(complex_msar_accept_message_read.instrument_id[complex_msar_accept_message_at] == complex_msar_accept_message_written.instrument_id[complex_msar_accept_message_at]); complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_accept_message_read.msar_type == complex_msar_accept_message_written.msar_type);
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> assert(complex_msar_accept_message_read.auction_id[complex_msar_accept_message_at] == complex_msar_accept_message_written.auction_id[complex_msar_accept_message_at]); complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> assert(complex_msar_accept_message_read.price[complex_msar_accept_message_at] == complex_msar_accept_message_written.price[complex_msar_accept_message_at]); complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_accept_message_read.side == complex_msar_accept_message_written.side);
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> assert(complex_msar_accept_message_read.contracts[complex_msar_accept_message_at] == complex_msar_accept_message_written.contracts[complex_msar_accept_message_at]); complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_accept_message_read.price_protection == complex_msar_accept_message_written.price_protection);
  complex_msar_accept_message_at = 0;
  do
  :: complex_msar_accept_message_at < 4 -> assert(complex_msar_accept_message_read.reserved_4[complex_msar_accept_message_at] == complex_msar_accept_message_written.reserved_4[complex_msar_accept_message_at]); complex_msar_accept_message_at = complex_msar_accept_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Msar Reject Message: 13 bytes ----------------------------------- */

/* The Complex MSAR Request is invalid and therefore rejected. Sequenced. */
typedef ComplexMsarRejectMessage {
  byte badge[4];
  byte message_id[8];
  byte status_code
};

int complex_msar_reject_message_at;

/* every byte of Complex Msar Reject Message set to one value */
inline fill_complex_msar_reject_message(complex_msar_reject_message_record, complex_msar_reject_message_value) {
  complex_msar_reject_message_at = 0;
  do
  :: complex_msar_reject_message_at < 4 -> complex_msar_reject_message_record.badge[complex_msar_reject_message_at] = complex_msar_reject_message_value; complex_msar_reject_message_at = complex_msar_reject_message_at + 1
  :: else -> break
  od;
  complex_msar_reject_message_at = 0;
  do
  :: complex_msar_reject_message_at < 8 -> complex_msar_reject_message_record.message_id[complex_msar_reject_message_at] = complex_msar_reject_message_value; complex_msar_reject_message_at = complex_msar_reject_message_at + 1
  :: else -> break
  od;
  complex_msar_reject_message_record.status_code = complex_msar_reject_message_value;
  skip
}

/* each byte of Complex Msar Reject Message set to where it lies, so a field read out of place says so */
inline ramp_complex_msar_reject_message(complex_msar_reject_message_record, complex_msar_reject_message_base) {
  complex_msar_reject_message_at = 0;
  do
  :: complex_msar_reject_message_at < 4 -> complex_msar_reject_message_record.badge[complex_msar_reject_message_at] = (complex_msar_reject_message_base + 0 + complex_msar_reject_message_at + 1) % 256; complex_msar_reject_message_at = complex_msar_reject_message_at + 1
  :: else -> break
  od;
  complex_msar_reject_message_at = 0;
  do
  :: complex_msar_reject_message_at < 8 -> complex_msar_reject_message_record.message_id[complex_msar_reject_message_at] = (complex_msar_reject_message_base + 4 + complex_msar_reject_message_at + 1) % 256; complex_msar_reject_message_at = complex_msar_reject_message_at + 1
  :: else -> break
  od;
  complex_msar_reject_message_record.status_code = (complex_msar_reject_message_base + 12 + 1) % 256;
  skip
}

/* Complex Msar Reject Message to the wire, 13 bytes from where the cursor stands */
inline encode_complex_msar_reject_message(complex_msar_reject_message_record) {
  complex_msar_reject_message_at = 0;
  do
  :: complex_msar_reject_message_at < 4 -> wire[at] = complex_msar_reject_message_record.badge[complex_msar_reject_message_at]; at = at + 1; complex_msar_reject_message_at = complex_msar_reject_message_at + 1
  :: else -> break
  od;
  complex_msar_reject_message_at = 0;
  do
  :: complex_msar_reject_message_at < 8 -> wire[at] = complex_msar_reject_message_record.message_id[complex_msar_reject_message_at]; at = at + 1; complex_msar_reject_message_at = complex_msar_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_reject_message_record.status_code; at = at + 1;
  skip
}

/* Complex Msar Reject Message off the wire, 13 bytes from where the cursor stands */
inline decode_complex_msar_reject_message(complex_msar_reject_message_record) {
  complex_msar_reject_message_at = 0;
  do
  :: complex_msar_reject_message_at < 4 -> complex_msar_reject_message_record.badge[complex_msar_reject_message_at] = wire[at]; at = at + 1; complex_msar_reject_message_at = complex_msar_reject_message_at + 1
  :: else -> break
  od;
  complex_msar_reject_message_at = 0;
  do
  :: complex_msar_reject_message_at < 8 -> complex_msar_reject_message_record.message_id[complex_msar_reject_message_at] = wire[at]; at = at + 1; complex_msar_reject_message_at = complex_msar_reject_message_at + 1
  :: else -> break
  od;
  complex_msar_reject_message_record.status_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Complex Msar Reject Message is what was written, byte for byte */
inline equal_complex_msar_reject_message(complex_msar_reject_message_read, complex_msar_reject_message_written) {
  complex_msar_reject_message_at = 0;
  do
  :: complex_msar_reject_message_at < 4 -> assert(complex_msar_reject_message_read.badge[complex_msar_reject_message_at] == complex_msar_reject_message_written.badge[complex_msar_reject_message_at]); complex_msar_reject_message_at = complex_msar_reject_message_at + 1
  :: else -> break
  od;
  complex_msar_reject_message_at = 0;
  do
  :: complex_msar_reject_message_at < 8 -> assert(complex_msar_reject_message_read.message_id[complex_msar_reject_message_at] == complex_msar_reject_message_written.message_id[complex_msar_reject_message_at]); complex_msar_reject_message_at = complex_msar_reject_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_reject_message_read.status_code == complex_msar_reject_message_written.status_code);
  skip
}

/* ---- Underlying Permission Notification Message: 26 bytes -------------------- */

/* Sent once per badge/underlying pair, typically right after the instrument directory messages, and intra-day when permissions change. Sequenced. */
typedef UnderlyingPermissionNotificationMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte badge[4];
  byte underlying[13];
  byte permitted
};

int underlying_permission_notification_message_at;

/* every byte of Underlying Permission Notification Message set to one value */
inline fill_underlying_permission_notification_message(underlying_permission_notification_message_record, underlying_permission_notification_message_value) {
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> underlying_permission_notification_message_record.seconds[underlying_permission_notification_message_at] = underlying_permission_notification_message_value; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> underlying_permission_notification_message_record.nanoseconds[underlying_permission_notification_message_at] = underlying_permission_notification_message_value; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> underlying_permission_notification_message_record.badge[underlying_permission_notification_message_at] = underlying_permission_notification_message_value; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 13 -> underlying_permission_notification_message_record.underlying[underlying_permission_notification_message_at] = underlying_permission_notification_message_value; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_record.permitted = underlying_permission_notification_message_value;
  skip
}

/* each byte of Underlying Permission Notification Message set to where it lies, so a field read out of place says so */
inline ramp_underlying_permission_notification_message(underlying_permission_notification_message_record, underlying_permission_notification_message_base) {
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> underlying_permission_notification_message_record.seconds[underlying_permission_notification_message_at] = (underlying_permission_notification_message_base + 0 + underlying_permission_notification_message_at + 1) % 256; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> underlying_permission_notification_message_record.nanoseconds[underlying_permission_notification_message_at] = (underlying_permission_notification_message_base + 4 + underlying_permission_notification_message_at + 1) % 256; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> underlying_permission_notification_message_record.badge[underlying_permission_notification_message_at] = (underlying_permission_notification_message_base + 8 + underlying_permission_notification_message_at + 1) % 256; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 13 -> underlying_permission_notification_message_record.underlying[underlying_permission_notification_message_at] = (underlying_permission_notification_message_base + 12 + underlying_permission_notification_message_at + 1) % 256; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_record.permitted = (underlying_permission_notification_message_base + 25 + 1) % 256;
  skip
}

/* Underlying Permission Notification Message to the wire, 26 bytes from where the cursor stands */
inline encode_underlying_permission_notification_message(underlying_permission_notification_message_record) {
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> wire[at] = underlying_permission_notification_message_record.seconds[underlying_permission_notification_message_at]; at = at + 1; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> wire[at] = underlying_permission_notification_message_record.nanoseconds[underlying_permission_notification_message_at]; at = at + 1; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> wire[at] = underlying_permission_notification_message_record.badge[underlying_permission_notification_message_at]; at = at + 1; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 13 -> wire[at] = underlying_permission_notification_message_record.underlying[underlying_permission_notification_message_at]; at = at + 1; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_permission_notification_message_record.permitted; at = at + 1;
  skip
}

/* Underlying Permission Notification Message off the wire, 26 bytes from where the cursor stands */
inline decode_underlying_permission_notification_message(underlying_permission_notification_message_record) {
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> underlying_permission_notification_message_record.seconds[underlying_permission_notification_message_at] = wire[at]; at = at + 1; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> underlying_permission_notification_message_record.nanoseconds[underlying_permission_notification_message_at] = wire[at]; at = at + 1; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> underlying_permission_notification_message_record.badge[underlying_permission_notification_message_at] = wire[at]; at = at + 1; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 13 -> underlying_permission_notification_message_record.underlying[underlying_permission_notification_message_at] = wire[at]; at = at + 1; underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_record.permitted = wire[at]; at = at + 1;
  skip
}

/* what was read of Underlying Permission Notification Message is what was written, byte for byte */
inline equal_underlying_permission_notification_message(underlying_permission_notification_message_read, underlying_permission_notification_message_written) {
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> assert(underlying_permission_notification_message_read.seconds[underlying_permission_notification_message_at] == underlying_permission_notification_message_written.seconds[underlying_permission_notification_message_at]); underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> assert(underlying_permission_notification_message_read.nanoseconds[underlying_permission_notification_message_at] == underlying_permission_notification_message_written.nanoseconds[underlying_permission_notification_message_at]); underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 4 -> assert(underlying_permission_notification_message_read.badge[underlying_permission_notification_message_at] == underlying_permission_notification_message_written.badge[underlying_permission_notification_message_at]); underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  underlying_permission_notification_message_at = 0;
  do
  :: underlying_permission_notification_message_at < 13 -> assert(underlying_permission_notification_message_read.underlying[underlying_permission_notification_message_at] == underlying_permission_notification_message_written.underlying[underlying_permission_notification_message_at]); underlying_permission_notification_message_at = underlying_permission_notification_message_at + 1
  :: else -> break
  od;
  assert(underlying_permission_notification_message_read.permitted == underlying_permission_notification_message_written.permitted);
  skip
}

/* ---- Mm Parameter Definition Notification Message: 74 bytes ------------------ */

/* Optionally delivered participant per-underlying/instrument type configuration settings. Sequenced. */
typedef MmParameterDefinitionNotificationMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte badge[4];
  byte instrument_type;
  byte underlying[13];
  byte interval[2];
  byte percentage[2];
  byte cum_qty[4];
  byte delta[4];
  byte vega[4];
  byte reserved_32[32]
};

int mm_parameter_definition_notification_message_at;

/* every byte of Mm Parameter Definition Notification Message set to one value */
inline fill_mm_parameter_definition_notification_message(mm_parameter_definition_notification_message_record, mm_parameter_definition_notification_message_value) {
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.seconds[mm_parameter_definition_notification_message_at] = mm_parameter_definition_notification_message_value; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.nanoseconds[mm_parameter_definition_notification_message_at] = mm_parameter_definition_notification_message_value; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.badge[mm_parameter_definition_notification_message_at] = mm_parameter_definition_notification_message_value; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_record.instrument_type = mm_parameter_definition_notification_message_value;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 13 -> mm_parameter_definition_notification_message_record.underlying[mm_parameter_definition_notification_message_at] = mm_parameter_definition_notification_message_value; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 2 -> mm_parameter_definition_notification_message_record.interval[mm_parameter_definition_notification_message_at] = mm_parameter_definition_notification_message_value; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 2 -> mm_parameter_definition_notification_message_record.percentage[mm_parameter_definition_notification_message_at] = mm_parameter_definition_notification_message_value; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.cum_qty[mm_parameter_definition_notification_message_at] = mm_parameter_definition_notification_message_value; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.delta[mm_parameter_definition_notification_message_at] = mm_parameter_definition_notification_message_value; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.vega[mm_parameter_definition_notification_message_at] = mm_parameter_definition_notification_message_value; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 32 -> mm_parameter_definition_notification_message_record.reserved_32[mm_parameter_definition_notification_message_at] = mm_parameter_definition_notification_message_value; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mm Parameter Definition Notification Message set to where it lies, so a field read out of place says so */
inline ramp_mm_parameter_definition_notification_message(mm_parameter_definition_notification_message_record, mm_parameter_definition_notification_message_base) {
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.seconds[mm_parameter_definition_notification_message_at] = (mm_parameter_definition_notification_message_base + 0 + mm_parameter_definition_notification_message_at + 1) % 256; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.nanoseconds[mm_parameter_definition_notification_message_at] = (mm_parameter_definition_notification_message_base + 4 + mm_parameter_definition_notification_message_at + 1) % 256; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.badge[mm_parameter_definition_notification_message_at] = (mm_parameter_definition_notification_message_base + 8 + mm_parameter_definition_notification_message_at + 1) % 256; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_record.instrument_type = (mm_parameter_definition_notification_message_base + 12 + 1) % 256;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 13 -> mm_parameter_definition_notification_message_record.underlying[mm_parameter_definition_notification_message_at] = (mm_parameter_definition_notification_message_base + 13 + mm_parameter_definition_notification_message_at + 1) % 256; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 2 -> mm_parameter_definition_notification_message_record.interval[mm_parameter_definition_notification_message_at] = (mm_parameter_definition_notification_message_base + 26 + mm_parameter_definition_notification_message_at + 1) % 256; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 2 -> mm_parameter_definition_notification_message_record.percentage[mm_parameter_definition_notification_message_at] = (mm_parameter_definition_notification_message_base + 28 + mm_parameter_definition_notification_message_at + 1) % 256; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.cum_qty[mm_parameter_definition_notification_message_at] = (mm_parameter_definition_notification_message_base + 30 + mm_parameter_definition_notification_message_at + 1) % 256; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.delta[mm_parameter_definition_notification_message_at] = (mm_parameter_definition_notification_message_base + 34 + mm_parameter_definition_notification_message_at + 1) % 256; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.vega[mm_parameter_definition_notification_message_at] = (mm_parameter_definition_notification_message_base + 38 + mm_parameter_definition_notification_message_at + 1) % 256; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 32 -> mm_parameter_definition_notification_message_record.reserved_32[mm_parameter_definition_notification_message_at] = (mm_parameter_definition_notification_message_base + 42 + mm_parameter_definition_notification_message_at + 1) % 256; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mm Parameter Definition Notification Message to the wire, 74 bytes from where the cursor stands */
inline encode_mm_parameter_definition_notification_message(mm_parameter_definition_notification_message_record) {
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> wire[at] = mm_parameter_definition_notification_message_record.seconds[mm_parameter_definition_notification_message_at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> wire[at] = mm_parameter_definition_notification_message_record.nanoseconds[mm_parameter_definition_notification_message_at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> wire[at] = mm_parameter_definition_notification_message_record.badge[mm_parameter_definition_notification_message_at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = mm_parameter_definition_notification_message_record.instrument_type; at = at + 1;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 13 -> wire[at] = mm_parameter_definition_notification_message_record.underlying[mm_parameter_definition_notification_message_at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 2 -> wire[at] = mm_parameter_definition_notification_message_record.interval[mm_parameter_definition_notification_message_at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 2 -> wire[at] = mm_parameter_definition_notification_message_record.percentage[mm_parameter_definition_notification_message_at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> wire[at] = mm_parameter_definition_notification_message_record.cum_qty[mm_parameter_definition_notification_message_at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> wire[at] = mm_parameter_definition_notification_message_record.delta[mm_parameter_definition_notification_message_at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> wire[at] = mm_parameter_definition_notification_message_record.vega[mm_parameter_definition_notification_message_at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 32 -> wire[at] = mm_parameter_definition_notification_message_record.reserved_32[mm_parameter_definition_notification_message_at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mm Parameter Definition Notification Message off the wire, 74 bytes from where the cursor stands */
inline decode_mm_parameter_definition_notification_message(mm_parameter_definition_notification_message_record) {
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.seconds[mm_parameter_definition_notification_message_at] = wire[at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.nanoseconds[mm_parameter_definition_notification_message_at] = wire[at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.badge[mm_parameter_definition_notification_message_at] = wire[at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_record.instrument_type = wire[at]; at = at + 1;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 13 -> mm_parameter_definition_notification_message_record.underlying[mm_parameter_definition_notification_message_at] = wire[at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 2 -> mm_parameter_definition_notification_message_record.interval[mm_parameter_definition_notification_message_at] = wire[at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 2 -> mm_parameter_definition_notification_message_record.percentage[mm_parameter_definition_notification_message_at] = wire[at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.cum_qty[mm_parameter_definition_notification_message_at] = wire[at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.delta[mm_parameter_definition_notification_message_at] = wire[at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> mm_parameter_definition_notification_message_record.vega[mm_parameter_definition_notification_message_at] = wire[at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 32 -> mm_parameter_definition_notification_message_record.reserved_32[mm_parameter_definition_notification_message_at] = wire[at]; at = at + 1; mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mm Parameter Definition Notification Message is what was written, byte for byte */
inline equal_mm_parameter_definition_notification_message(mm_parameter_definition_notification_message_read, mm_parameter_definition_notification_message_written) {
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> assert(mm_parameter_definition_notification_message_read.seconds[mm_parameter_definition_notification_message_at] == mm_parameter_definition_notification_message_written.seconds[mm_parameter_definition_notification_message_at]); mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> assert(mm_parameter_definition_notification_message_read.nanoseconds[mm_parameter_definition_notification_message_at] == mm_parameter_definition_notification_message_written.nanoseconds[mm_parameter_definition_notification_message_at]); mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> assert(mm_parameter_definition_notification_message_read.badge[mm_parameter_definition_notification_message_at] == mm_parameter_definition_notification_message_written.badge[mm_parameter_definition_notification_message_at]); mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  assert(mm_parameter_definition_notification_message_read.instrument_type == mm_parameter_definition_notification_message_written.instrument_type);
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 13 -> assert(mm_parameter_definition_notification_message_read.underlying[mm_parameter_definition_notification_message_at] == mm_parameter_definition_notification_message_written.underlying[mm_parameter_definition_notification_message_at]); mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 2 -> assert(mm_parameter_definition_notification_message_read.interval[mm_parameter_definition_notification_message_at] == mm_parameter_definition_notification_message_written.interval[mm_parameter_definition_notification_message_at]); mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 2 -> assert(mm_parameter_definition_notification_message_read.percentage[mm_parameter_definition_notification_message_at] == mm_parameter_definition_notification_message_written.percentage[mm_parameter_definition_notification_message_at]); mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> assert(mm_parameter_definition_notification_message_read.cum_qty[mm_parameter_definition_notification_message_at] == mm_parameter_definition_notification_message_written.cum_qty[mm_parameter_definition_notification_message_at]); mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> assert(mm_parameter_definition_notification_message_read.delta[mm_parameter_definition_notification_message_at] == mm_parameter_definition_notification_message_written.delta[mm_parameter_definition_notification_message_at]); mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 4 -> assert(mm_parameter_definition_notification_message_read.vega[mm_parameter_definition_notification_message_at] == mm_parameter_definition_notification_message_written.vega[mm_parameter_definition_notification_message_at]); mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_notification_message_at = 0;
  do
  :: mm_parameter_definition_notification_message_at < 32 -> assert(mm_parameter_definition_notification_message_read.reserved_32[mm_parameter_definition_notification_message_at] == mm_parameter_definition_notification_message_written.reserved_32[mm_parameter_definition_notification_message_at]); mm_parameter_definition_notification_message_at = mm_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Active Qp Self Replenishment Parameter Definition Notification Message: 61 bytes ---- */

/* Optionally delivered contract limit on the badges configured for ActiveQP. Sequenced. */
typedef ActiveQpSelfReplenishmentParameterDefinitionNotificationMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte badge[4];
  byte underlying[13];
  byte set_contract_limit[4];
  byte reserved_32[32]
};

int active_qp_self_replenishment_parameter_definition_notification_message_at;

/* every byte of Active Qp Self Replenishment Parameter Definition Notification Message set to one value */
inline fill_active_qp_self_replenishment_parameter_definition_notification_message(active_qp_self_replenishment_parameter_definition_notification_message_record, active_qp_self_replenishment_parameter_definition_notification_message_value) {
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> active_qp_self_replenishment_parameter_definition_notification_message_record.seconds[active_qp_self_replenishment_parameter_definition_notification_message_at] = active_qp_self_replenishment_parameter_definition_notification_message_value; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> active_qp_self_replenishment_parameter_definition_notification_message_record.nanoseconds[active_qp_self_replenishment_parameter_definition_notification_message_at] = active_qp_self_replenishment_parameter_definition_notification_message_value; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> active_qp_self_replenishment_parameter_definition_notification_message_record.badge[active_qp_self_replenishment_parameter_definition_notification_message_at] = active_qp_self_replenishment_parameter_definition_notification_message_value; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 13 -> active_qp_self_replenishment_parameter_definition_notification_message_record.underlying[active_qp_self_replenishment_parameter_definition_notification_message_at] = active_qp_self_replenishment_parameter_definition_notification_message_value; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> active_qp_self_replenishment_parameter_definition_notification_message_record.set_contract_limit[active_qp_self_replenishment_parameter_definition_notification_message_at] = active_qp_self_replenishment_parameter_definition_notification_message_value; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 32 -> active_qp_self_replenishment_parameter_definition_notification_message_record.reserved_32[active_qp_self_replenishment_parameter_definition_notification_message_at] = active_qp_self_replenishment_parameter_definition_notification_message_value; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Active Qp Self Replenishment Parameter Definition Notification Message set to where it lies, so a field read out of place says so */
inline ramp_active_qp_self_replenishment_parameter_definition_notification_message(active_qp_self_replenishment_parameter_definition_notification_message_record, active_qp_self_replenishment_parameter_definition_notification_message_base) {
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> active_qp_self_replenishment_parameter_definition_notification_message_record.seconds[active_qp_self_replenishment_parameter_definition_notification_message_at] = (active_qp_self_replenishment_parameter_definition_notification_message_base + 0 + active_qp_self_replenishment_parameter_definition_notification_message_at + 1) % 256; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> active_qp_self_replenishment_parameter_definition_notification_message_record.nanoseconds[active_qp_self_replenishment_parameter_definition_notification_message_at] = (active_qp_self_replenishment_parameter_definition_notification_message_base + 4 + active_qp_self_replenishment_parameter_definition_notification_message_at + 1) % 256; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> active_qp_self_replenishment_parameter_definition_notification_message_record.badge[active_qp_self_replenishment_parameter_definition_notification_message_at] = (active_qp_self_replenishment_parameter_definition_notification_message_base + 8 + active_qp_self_replenishment_parameter_definition_notification_message_at + 1) % 256; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 13 -> active_qp_self_replenishment_parameter_definition_notification_message_record.underlying[active_qp_self_replenishment_parameter_definition_notification_message_at] = (active_qp_self_replenishment_parameter_definition_notification_message_base + 12 + active_qp_self_replenishment_parameter_definition_notification_message_at + 1) % 256; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> active_qp_self_replenishment_parameter_definition_notification_message_record.set_contract_limit[active_qp_self_replenishment_parameter_definition_notification_message_at] = (active_qp_self_replenishment_parameter_definition_notification_message_base + 25 + active_qp_self_replenishment_parameter_definition_notification_message_at + 1) % 256; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 32 -> active_qp_self_replenishment_parameter_definition_notification_message_record.reserved_32[active_qp_self_replenishment_parameter_definition_notification_message_at] = (active_qp_self_replenishment_parameter_definition_notification_message_base + 29 + active_qp_self_replenishment_parameter_definition_notification_message_at + 1) % 256; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Qp Self Replenishment Parameter Definition Notification Message to the wire, 61 bytes from where the cursor stands */
inline encode_active_qp_self_replenishment_parameter_definition_notification_message(active_qp_self_replenishment_parameter_definition_notification_message_record) {
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> wire[at] = active_qp_self_replenishment_parameter_definition_notification_message_record.seconds[active_qp_self_replenishment_parameter_definition_notification_message_at]; at = at + 1; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> wire[at] = active_qp_self_replenishment_parameter_definition_notification_message_record.nanoseconds[active_qp_self_replenishment_parameter_definition_notification_message_at]; at = at + 1; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> wire[at] = active_qp_self_replenishment_parameter_definition_notification_message_record.badge[active_qp_self_replenishment_parameter_definition_notification_message_at]; at = at + 1; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 13 -> wire[at] = active_qp_self_replenishment_parameter_definition_notification_message_record.underlying[active_qp_self_replenishment_parameter_definition_notification_message_at]; at = at + 1; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> wire[at] = active_qp_self_replenishment_parameter_definition_notification_message_record.set_contract_limit[active_qp_self_replenishment_parameter_definition_notification_message_at]; at = at + 1; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 32 -> wire[at] = active_qp_self_replenishment_parameter_definition_notification_message_record.reserved_32[active_qp_self_replenishment_parameter_definition_notification_message_at]; at = at + 1; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Qp Self Replenishment Parameter Definition Notification Message off the wire, 61 bytes from where the cursor stands */
inline decode_active_qp_self_replenishment_parameter_definition_notification_message(active_qp_self_replenishment_parameter_definition_notification_message_record) {
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> active_qp_self_replenishment_parameter_definition_notification_message_record.seconds[active_qp_self_replenishment_parameter_definition_notification_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> active_qp_self_replenishment_parameter_definition_notification_message_record.nanoseconds[active_qp_self_replenishment_parameter_definition_notification_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> active_qp_self_replenishment_parameter_definition_notification_message_record.badge[active_qp_self_replenishment_parameter_definition_notification_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 13 -> active_qp_self_replenishment_parameter_definition_notification_message_record.underlying[active_qp_self_replenishment_parameter_definition_notification_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> active_qp_self_replenishment_parameter_definition_notification_message_record.set_contract_limit[active_qp_self_replenishment_parameter_definition_notification_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 32 -> active_qp_self_replenishment_parameter_definition_notification_message_record.reserved_32[active_qp_self_replenishment_parameter_definition_notification_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Active Qp Self Replenishment Parameter Definition Notification Message is what was written, byte for byte */
inline equal_active_qp_self_replenishment_parameter_definition_notification_message(active_qp_self_replenishment_parameter_definition_notification_message_read, active_qp_self_replenishment_parameter_definition_notification_message_written) {
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> assert(active_qp_self_replenishment_parameter_definition_notification_message_read.seconds[active_qp_self_replenishment_parameter_definition_notification_message_at] == active_qp_self_replenishment_parameter_definition_notification_message_written.seconds[active_qp_self_replenishment_parameter_definition_notification_message_at]); active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> assert(active_qp_self_replenishment_parameter_definition_notification_message_read.nanoseconds[active_qp_self_replenishment_parameter_definition_notification_message_at] == active_qp_self_replenishment_parameter_definition_notification_message_written.nanoseconds[active_qp_self_replenishment_parameter_definition_notification_message_at]); active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> assert(active_qp_self_replenishment_parameter_definition_notification_message_read.badge[active_qp_self_replenishment_parameter_definition_notification_message_at] == active_qp_self_replenishment_parameter_definition_notification_message_written.badge[active_qp_self_replenishment_parameter_definition_notification_message_at]); active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 13 -> assert(active_qp_self_replenishment_parameter_definition_notification_message_read.underlying[active_qp_self_replenishment_parameter_definition_notification_message_at] == active_qp_self_replenishment_parameter_definition_notification_message_written.underlying[active_qp_self_replenishment_parameter_definition_notification_message_at]); active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 4 -> assert(active_qp_self_replenishment_parameter_definition_notification_message_read.set_contract_limit[active_qp_self_replenishment_parameter_definition_notification_message_at] == active_qp_self_replenishment_parameter_definition_notification_message_written.set_contract_limit[active_qp_self_replenishment_parameter_definition_notification_message_at]); active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_parameter_definition_notification_message_at = 0;
  do
  :: active_qp_self_replenishment_parameter_definition_notification_message_at < 32 -> assert(active_qp_self_replenishment_parameter_definition_notification_message_read.reserved_32[active_qp_self_replenishment_parameter_definition_notification_message_at] == active_qp_self_replenishment_parameter_definition_notification_message_written.reserved_32[active_qp_self_replenishment_parameter_definition_notification_message_at]); active_qp_self_replenishment_parameter_definition_notification_message_at = active_qp_self_replenishment_parameter_definition_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 11 bytes ------------------------------------------ */

/* Signals a market or data feed handler event. Sequenced. */
typedef SystemEventMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte event_code;
  byte version;
  byte sub_version
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.seconds[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  system_event_message_record.version = system_event_message_value;
  system_event_message_record.sub_version = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.seconds[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = (system_event_message_base + 4 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 8 + 1) % 256;
  system_event_message_record.version = (system_event_message_base + 9 + 1) % 256;
  system_event_message_record.sub_version = (system_event_message_base + 10 + 1) % 256;
  skip
}

/* System Event Message to the wire, 11 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.seconds[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.nanoseconds[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  wire[at] = system_event_message_record.version; at = at + 1;
  wire[at] = system_event_message_record.sub_version; at = at + 1;
  skip
}

/* System Event Message off the wire, 11 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.seconds[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_record.version = wire[at]; at = at + 1;
  system_event_message_record.sub_version = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.seconds[system_event_message_at] == system_event_message_written.seconds[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.nanoseconds[system_event_message_at] == system_event_message_written.nanoseconds[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  assert(system_event_message_read.version == system_event_message_written.version);
  assert(system_event_message_read.sub_version == system_event_message_written.sub_version);
  skip
}

/* ---- Simple Instrument Directory Message: 59 bytes --------------------------- */

/* Disseminated at the start of each trading day for all symbols trading on the system, and intra-day when attributes change. Sequenced. */
typedef SimpleInstrumentDirectoryMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte instrument_id[4];
  byte security_symbol[8];
  byte expiration[2];
  byte strike_price[4];
  byte option_type;
  byte underlying_symbol[13];
  byte closing_type;
  byte tradable;
  byte mpv;
  byte reserved_16[16]
};

int simple_instrument_directory_message_at;

/* every byte of Simple Instrument Directory Message set to one value */
inline fill_simple_instrument_directory_message(simple_instrument_directory_message_record, simple_instrument_directory_message_value) {
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.seconds[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.nanoseconds[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.instrument_id[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> simple_instrument_directory_message_record.security_symbol[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> simple_instrument_directory_message_record.expiration[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.strike_price[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.option_type = simple_instrument_directory_message_value;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 13 -> simple_instrument_directory_message_record.underlying_symbol[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.closing_type = simple_instrument_directory_message_value;
  simple_instrument_directory_message_record.tradable = simple_instrument_directory_message_value;
  simple_instrument_directory_message_record.mpv = simple_instrument_directory_message_value;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 16 -> simple_instrument_directory_message_record.reserved_16[simple_instrument_directory_message_at] = simple_instrument_directory_message_value; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Instrument Directory Message set to where it lies, so a field read out of place says so */
inline ramp_simple_instrument_directory_message(simple_instrument_directory_message_record, simple_instrument_directory_message_base) {
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.seconds[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 0 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.nanoseconds[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 4 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.instrument_id[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 8 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> simple_instrument_directory_message_record.security_symbol[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 12 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> simple_instrument_directory_message_record.expiration[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 20 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.strike_price[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 22 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.option_type = (simple_instrument_directory_message_base + 26 + 1) % 256;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 13 -> simple_instrument_directory_message_record.underlying_symbol[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 27 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.closing_type = (simple_instrument_directory_message_base + 40 + 1) % 256;
  simple_instrument_directory_message_record.tradable = (simple_instrument_directory_message_base + 41 + 1) % 256;
  simple_instrument_directory_message_record.mpv = (simple_instrument_directory_message_base + 42 + 1) % 256;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 16 -> simple_instrument_directory_message_record.reserved_16[simple_instrument_directory_message_at] = (simple_instrument_directory_message_base + 43 + simple_instrument_directory_message_at + 1) % 256; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Instrument Directory Message to the wire, 59 bytes from where the cursor stands */
inline encode_simple_instrument_directory_message(simple_instrument_directory_message_record) {
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> wire[at] = simple_instrument_directory_message_record.seconds[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> wire[at] = simple_instrument_directory_message_record.nanoseconds[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> wire[at] = simple_instrument_directory_message_record.instrument_id[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> wire[at] = simple_instrument_directory_message_record.security_symbol[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> wire[at] = simple_instrument_directory_message_record.expiration[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> wire[at] = simple_instrument_directory_message_record.strike_price[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_instrument_directory_message_record.option_type; at = at + 1;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 13 -> wire[at] = simple_instrument_directory_message_record.underlying_symbol[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_instrument_directory_message_record.closing_type; at = at + 1;
  wire[at] = simple_instrument_directory_message_record.tradable; at = at + 1;
  wire[at] = simple_instrument_directory_message_record.mpv; at = at + 1;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 16 -> wire[at] = simple_instrument_directory_message_record.reserved_16[simple_instrument_directory_message_at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Instrument Directory Message off the wire, 59 bytes from where the cursor stands */
inline decode_simple_instrument_directory_message(simple_instrument_directory_message_record) {
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.seconds[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.nanoseconds[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.instrument_id[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> simple_instrument_directory_message_record.security_symbol[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> simple_instrument_directory_message_record.expiration[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> simple_instrument_directory_message_record.strike_price[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.option_type = wire[at]; at = at + 1;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 13 -> simple_instrument_directory_message_record.underlying_symbol[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_record.closing_type = wire[at]; at = at + 1;
  simple_instrument_directory_message_record.tradable = wire[at]; at = at + 1;
  simple_instrument_directory_message_record.mpv = wire[at]; at = at + 1;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 16 -> simple_instrument_directory_message_record.reserved_16[simple_instrument_directory_message_at] = wire[at]; at = at + 1; simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Instrument Directory Message is what was written, byte for byte */
inline equal_simple_instrument_directory_message(simple_instrument_directory_message_read, simple_instrument_directory_message_written) {
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> assert(simple_instrument_directory_message_read.seconds[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.seconds[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> assert(simple_instrument_directory_message_read.nanoseconds[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.nanoseconds[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> assert(simple_instrument_directory_message_read.instrument_id[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.instrument_id[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 8 -> assert(simple_instrument_directory_message_read.security_symbol[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.security_symbol[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 2 -> assert(simple_instrument_directory_message_read.expiration[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.expiration[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 4 -> assert(simple_instrument_directory_message_read.strike_price[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.strike_price[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  assert(simple_instrument_directory_message_read.option_type == simple_instrument_directory_message_written.option_type);
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 13 -> assert(simple_instrument_directory_message_read.underlying_symbol[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.underlying_symbol[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  assert(simple_instrument_directory_message_read.closing_type == simple_instrument_directory_message_written.closing_type);
  assert(simple_instrument_directory_message_read.tradable == simple_instrument_directory_message_written.tradable);
  assert(simple_instrument_directory_message_read.mpv == simple_instrument_directory_message_written.mpv);
  simple_instrument_directory_message_at = 0;
  do
  :: simple_instrument_directory_message_at < 16 -> assert(simple_instrument_directory_message_read.reserved_16[simple_instrument_directory_message_at] == simple_instrument_directory_message_written.reserved_16[simple_instrument_directory_message_at]); simple_instrument_directory_message_at = simple_instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Instrument Trading Action Message: 13 bytes ---------------------- */

/* Relays changes in trading status for a simple instrument. Sequenced. */
typedef SimpleInstrumentTradingActionMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte instrument_id[4];
  byte trading_state
};

int simple_instrument_trading_action_message_at;

/* every byte of Simple Instrument Trading Action Message set to one value */
inline fill_simple_instrument_trading_action_message(simple_instrument_trading_action_message_record, simple_instrument_trading_action_message_value) {
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> simple_instrument_trading_action_message_record.seconds[simple_instrument_trading_action_message_at] = simple_instrument_trading_action_message_value; simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> simple_instrument_trading_action_message_record.nanoseconds[simple_instrument_trading_action_message_at] = simple_instrument_trading_action_message_value; simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> simple_instrument_trading_action_message_record.instrument_id[simple_instrument_trading_action_message_at] = simple_instrument_trading_action_message_value; simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  simple_instrument_trading_action_message_record.trading_state = simple_instrument_trading_action_message_value;
  skip
}

/* each byte of Simple Instrument Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_simple_instrument_trading_action_message(simple_instrument_trading_action_message_record, simple_instrument_trading_action_message_base) {
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> simple_instrument_trading_action_message_record.seconds[simple_instrument_trading_action_message_at] = (simple_instrument_trading_action_message_base + 0 + simple_instrument_trading_action_message_at + 1) % 256; simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> simple_instrument_trading_action_message_record.nanoseconds[simple_instrument_trading_action_message_at] = (simple_instrument_trading_action_message_base + 4 + simple_instrument_trading_action_message_at + 1) % 256; simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> simple_instrument_trading_action_message_record.instrument_id[simple_instrument_trading_action_message_at] = (simple_instrument_trading_action_message_base + 8 + simple_instrument_trading_action_message_at + 1) % 256; simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  simple_instrument_trading_action_message_record.trading_state = (simple_instrument_trading_action_message_base + 12 + 1) % 256;
  skip
}

/* Simple Instrument Trading Action Message to the wire, 13 bytes from where the cursor stands */
inline encode_simple_instrument_trading_action_message(simple_instrument_trading_action_message_record) {
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> wire[at] = simple_instrument_trading_action_message_record.seconds[simple_instrument_trading_action_message_at]; at = at + 1; simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> wire[at] = simple_instrument_trading_action_message_record.nanoseconds[simple_instrument_trading_action_message_at]; at = at + 1; simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> wire[at] = simple_instrument_trading_action_message_record.instrument_id[simple_instrument_trading_action_message_at]; at = at + 1; simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_instrument_trading_action_message_record.trading_state; at = at + 1;
  skip
}

/* Simple Instrument Trading Action Message off the wire, 13 bytes from where the cursor stands */
inline decode_simple_instrument_trading_action_message(simple_instrument_trading_action_message_record) {
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> simple_instrument_trading_action_message_record.seconds[simple_instrument_trading_action_message_at] = wire[at]; at = at + 1; simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> simple_instrument_trading_action_message_record.nanoseconds[simple_instrument_trading_action_message_at] = wire[at]; at = at + 1; simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> simple_instrument_trading_action_message_record.instrument_id[simple_instrument_trading_action_message_at] = wire[at]; at = at + 1; simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  simple_instrument_trading_action_message_record.trading_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Instrument Trading Action Message is what was written, byte for byte */
inline equal_simple_instrument_trading_action_message(simple_instrument_trading_action_message_read, simple_instrument_trading_action_message_written) {
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> assert(simple_instrument_trading_action_message_read.seconds[simple_instrument_trading_action_message_at] == simple_instrument_trading_action_message_written.seconds[simple_instrument_trading_action_message_at]); simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> assert(simple_instrument_trading_action_message_read.nanoseconds[simple_instrument_trading_action_message_at] == simple_instrument_trading_action_message_written.nanoseconds[simple_instrument_trading_action_message_at]); simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  simple_instrument_trading_action_message_at = 0;
  do
  :: simple_instrument_trading_action_message_at < 4 -> assert(simple_instrument_trading_action_message_read.instrument_id[simple_instrument_trading_action_message_at] == simple_instrument_trading_action_message_written.instrument_id[simple_instrument_trading_action_message_at]); simple_instrument_trading_action_message_at = simple_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  assert(simple_instrument_trading_action_message_read.trading_state == simple_instrument_trading_action_message_written.trading_state);
  skip
}

/* ---- Complex Instrument Trading Action Message: 13 bytes --------------------- */

/* Relays changes in trading status for a complex strategy. Sequenced. */
typedef ComplexInstrumentTradingActionMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte instrument_id[4];
  byte trading_state
};

int complex_instrument_trading_action_message_at;

/* every byte of Complex Instrument Trading Action Message set to one value */
inline fill_complex_instrument_trading_action_message(complex_instrument_trading_action_message_record, complex_instrument_trading_action_message_value) {
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> complex_instrument_trading_action_message_record.seconds[complex_instrument_trading_action_message_at] = complex_instrument_trading_action_message_value; complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> complex_instrument_trading_action_message_record.nanoseconds[complex_instrument_trading_action_message_at] = complex_instrument_trading_action_message_value; complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> complex_instrument_trading_action_message_record.instrument_id[complex_instrument_trading_action_message_at] = complex_instrument_trading_action_message_value; complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  complex_instrument_trading_action_message_record.trading_state = complex_instrument_trading_action_message_value;
  skip
}

/* each byte of Complex Instrument Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_complex_instrument_trading_action_message(complex_instrument_trading_action_message_record, complex_instrument_trading_action_message_base) {
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> complex_instrument_trading_action_message_record.seconds[complex_instrument_trading_action_message_at] = (complex_instrument_trading_action_message_base + 0 + complex_instrument_trading_action_message_at + 1) % 256; complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> complex_instrument_trading_action_message_record.nanoseconds[complex_instrument_trading_action_message_at] = (complex_instrument_trading_action_message_base + 4 + complex_instrument_trading_action_message_at + 1) % 256; complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> complex_instrument_trading_action_message_record.instrument_id[complex_instrument_trading_action_message_at] = (complex_instrument_trading_action_message_base + 8 + complex_instrument_trading_action_message_at + 1) % 256; complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  complex_instrument_trading_action_message_record.trading_state = (complex_instrument_trading_action_message_base + 12 + 1) % 256;
  skip
}

/* Complex Instrument Trading Action Message to the wire, 13 bytes from where the cursor stands */
inline encode_complex_instrument_trading_action_message(complex_instrument_trading_action_message_record) {
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> wire[at] = complex_instrument_trading_action_message_record.seconds[complex_instrument_trading_action_message_at]; at = at + 1; complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> wire[at] = complex_instrument_trading_action_message_record.nanoseconds[complex_instrument_trading_action_message_at]; at = at + 1; complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> wire[at] = complex_instrument_trading_action_message_record.instrument_id[complex_instrument_trading_action_message_at]; at = at + 1; complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_instrument_trading_action_message_record.trading_state; at = at + 1;
  skip
}

/* Complex Instrument Trading Action Message off the wire, 13 bytes from where the cursor stands */
inline decode_complex_instrument_trading_action_message(complex_instrument_trading_action_message_record) {
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> complex_instrument_trading_action_message_record.seconds[complex_instrument_trading_action_message_at] = wire[at]; at = at + 1; complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> complex_instrument_trading_action_message_record.nanoseconds[complex_instrument_trading_action_message_at] = wire[at]; at = at + 1; complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> complex_instrument_trading_action_message_record.instrument_id[complex_instrument_trading_action_message_at] = wire[at]; at = at + 1; complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  complex_instrument_trading_action_message_record.trading_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Complex Instrument Trading Action Message is what was written, byte for byte */
inline equal_complex_instrument_trading_action_message(complex_instrument_trading_action_message_read, complex_instrument_trading_action_message_written) {
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> assert(complex_instrument_trading_action_message_read.seconds[complex_instrument_trading_action_message_at] == complex_instrument_trading_action_message_written.seconds[complex_instrument_trading_action_message_at]); complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> assert(complex_instrument_trading_action_message_read.nanoseconds[complex_instrument_trading_action_message_at] == complex_instrument_trading_action_message_written.nanoseconds[complex_instrument_trading_action_message_at]); complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  complex_instrument_trading_action_message_at = 0;
  do
  :: complex_instrument_trading_action_message_at < 4 -> assert(complex_instrument_trading_action_message_read.instrument_id[complex_instrument_trading_action_message_at] == complex_instrument_trading_action_message_written.instrument_id[complex_instrument_trading_action_message_at]); complex_instrument_trading_action_message_at = complex_instrument_trading_action_message_at + 1
  :: else -> break
  od;
  assert(complex_instrument_trading_action_message_read.trading_state == complex_instrument_trading_action_message_written.trading_state);
  skip
}

/* ---- Simple Quote Execution Notification Message: 46 bytes ------------------- */

/* Informs the firm that its quote for a given simple instrument has been executed. Only sent if subscribed. Sequenced. */
typedef SimpleQuoteExecutionNotificationMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte badge[4];
  byte instrument_id[4];
  byte message_id[8];
  byte auction_id[4];
  byte price[4];
  byte side;
  byte contracts[4];
  byte liquidity_indicator;
  byte cross_id[4];
  byte match_id[4]
};

int simple_quote_execution_notification_message_at;

/* every byte of Simple Quote Execution Notification Message set to one value */
inline fill_simple_quote_execution_notification_message(simple_quote_execution_notification_message_record, simple_quote_execution_notification_message_value) {
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.seconds[simple_quote_execution_notification_message_at] = simple_quote_execution_notification_message_value; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.nanoseconds[simple_quote_execution_notification_message_at] = simple_quote_execution_notification_message_value; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.badge[simple_quote_execution_notification_message_at] = simple_quote_execution_notification_message_value; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.instrument_id[simple_quote_execution_notification_message_at] = simple_quote_execution_notification_message_value; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 8 -> simple_quote_execution_notification_message_record.message_id[simple_quote_execution_notification_message_at] = simple_quote_execution_notification_message_value; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.auction_id[simple_quote_execution_notification_message_at] = simple_quote_execution_notification_message_value; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.price[simple_quote_execution_notification_message_at] = simple_quote_execution_notification_message_value; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_record.side = simple_quote_execution_notification_message_value;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.contracts[simple_quote_execution_notification_message_at] = simple_quote_execution_notification_message_value; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_record.liquidity_indicator = simple_quote_execution_notification_message_value;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.cross_id[simple_quote_execution_notification_message_at] = simple_quote_execution_notification_message_value; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.match_id[simple_quote_execution_notification_message_at] = simple_quote_execution_notification_message_value; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Quote Execution Notification Message set to where it lies, so a field read out of place says so */
inline ramp_simple_quote_execution_notification_message(simple_quote_execution_notification_message_record, simple_quote_execution_notification_message_base) {
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.seconds[simple_quote_execution_notification_message_at] = (simple_quote_execution_notification_message_base + 0 + simple_quote_execution_notification_message_at + 1) % 256; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.nanoseconds[simple_quote_execution_notification_message_at] = (simple_quote_execution_notification_message_base + 4 + simple_quote_execution_notification_message_at + 1) % 256; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.badge[simple_quote_execution_notification_message_at] = (simple_quote_execution_notification_message_base + 8 + simple_quote_execution_notification_message_at + 1) % 256; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.instrument_id[simple_quote_execution_notification_message_at] = (simple_quote_execution_notification_message_base + 12 + simple_quote_execution_notification_message_at + 1) % 256; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 8 -> simple_quote_execution_notification_message_record.message_id[simple_quote_execution_notification_message_at] = (simple_quote_execution_notification_message_base + 16 + simple_quote_execution_notification_message_at + 1) % 256; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.auction_id[simple_quote_execution_notification_message_at] = (simple_quote_execution_notification_message_base + 24 + simple_quote_execution_notification_message_at + 1) % 256; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.price[simple_quote_execution_notification_message_at] = (simple_quote_execution_notification_message_base + 28 + simple_quote_execution_notification_message_at + 1) % 256; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_record.side = (simple_quote_execution_notification_message_base + 32 + 1) % 256;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.contracts[simple_quote_execution_notification_message_at] = (simple_quote_execution_notification_message_base + 33 + simple_quote_execution_notification_message_at + 1) % 256; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_record.liquidity_indicator = (simple_quote_execution_notification_message_base + 37 + 1) % 256;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.cross_id[simple_quote_execution_notification_message_at] = (simple_quote_execution_notification_message_base + 38 + simple_quote_execution_notification_message_at + 1) % 256; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.match_id[simple_quote_execution_notification_message_at] = (simple_quote_execution_notification_message_base + 42 + simple_quote_execution_notification_message_at + 1) % 256; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Quote Execution Notification Message to the wire, 46 bytes from where the cursor stands */
inline encode_simple_quote_execution_notification_message(simple_quote_execution_notification_message_record) {
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> wire[at] = simple_quote_execution_notification_message_record.seconds[simple_quote_execution_notification_message_at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> wire[at] = simple_quote_execution_notification_message_record.nanoseconds[simple_quote_execution_notification_message_at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> wire[at] = simple_quote_execution_notification_message_record.badge[simple_quote_execution_notification_message_at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> wire[at] = simple_quote_execution_notification_message_record.instrument_id[simple_quote_execution_notification_message_at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 8 -> wire[at] = simple_quote_execution_notification_message_record.message_id[simple_quote_execution_notification_message_at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> wire[at] = simple_quote_execution_notification_message_record.auction_id[simple_quote_execution_notification_message_at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> wire[at] = simple_quote_execution_notification_message_record.price[simple_quote_execution_notification_message_at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_quote_execution_notification_message_record.side; at = at + 1;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> wire[at] = simple_quote_execution_notification_message_record.contracts[simple_quote_execution_notification_message_at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_quote_execution_notification_message_record.liquidity_indicator; at = at + 1;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> wire[at] = simple_quote_execution_notification_message_record.cross_id[simple_quote_execution_notification_message_at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> wire[at] = simple_quote_execution_notification_message_record.match_id[simple_quote_execution_notification_message_at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Quote Execution Notification Message off the wire, 46 bytes from where the cursor stands */
inline decode_simple_quote_execution_notification_message(simple_quote_execution_notification_message_record) {
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.seconds[simple_quote_execution_notification_message_at] = wire[at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.nanoseconds[simple_quote_execution_notification_message_at] = wire[at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.badge[simple_quote_execution_notification_message_at] = wire[at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.instrument_id[simple_quote_execution_notification_message_at] = wire[at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 8 -> simple_quote_execution_notification_message_record.message_id[simple_quote_execution_notification_message_at] = wire[at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.auction_id[simple_quote_execution_notification_message_at] = wire[at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.price[simple_quote_execution_notification_message_at] = wire[at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_record.side = wire[at]; at = at + 1;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.contracts[simple_quote_execution_notification_message_at] = wire[at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_record.liquidity_indicator = wire[at]; at = at + 1;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.cross_id[simple_quote_execution_notification_message_at] = wire[at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> simple_quote_execution_notification_message_record.match_id[simple_quote_execution_notification_message_at] = wire[at]; at = at + 1; simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Quote Execution Notification Message is what was written, byte for byte */
inline equal_simple_quote_execution_notification_message(simple_quote_execution_notification_message_read, simple_quote_execution_notification_message_written) {
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> assert(simple_quote_execution_notification_message_read.seconds[simple_quote_execution_notification_message_at] == simple_quote_execution_notification_message_written.seconds[simple_quote_execution_notification_message_at]); simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> assert(simple_quote_execution_notification_message_read.nanoseconds[simple_quote_execution_notification_message_at] == simple_quote_execution_notification_message_written.nanoseconds[simple_quote_execution_notification_message_at]); simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> assert(simple_quote_execution_notification_message_read.badge[simple_quote_execution_notification_message_at] == simple_quote_execution_notification_message_written.badge[simple_quote_execution_notification_message_at]); simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> assert(simple_quote_execution_notification_message_read.instrument_id[simple_quote_execution_notification_message_at] == simple_quote_execution_notification_message_written.instrument_id[simple_quote_execution_notification_message_at]); simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 8 -> assert(simple_quote_execution_notification_message_read.message_id[simple_quote_execution_notification_message_at] == simple_quote_execution_notification_message_written.message_id[simple_quote_execution_notification_message_at]); simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> assert(simple_quote_execution_notification_message_read.auction_id[simple_quote_execution_notification_message_at] == simple_quote_execution_notification_message_written.auction_id[simple_quote_execution_notification_message_at]); simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> assert(simple_quote_execution_notification_message_read.price[simple_quote_execution_notification_message_at] == simple_quote_execution_notification_message_written.price[simple_quote_execution_notification_message_at]); simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  assert(simple_quote_execution_notification_message_read.side == simple_quote_execution_notification_message_written.side);
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> assert(simple_quote_execution_notification_message_read.contracts[simple_quote_execution_notification_message_at] == simple_quote_execution_notification_message_written.contracts[simple_quote_execution_notification_message_at]); simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  assert(simple_quote_execution_notification_message_read.liquidity_indicator == simple_quote_execution_notification_message_written.liquidity_indicator);
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> assert(simple_quote_execution_notification_message_read.cross_id[simple_quote_execution_notification_message_at] == simple_quote_execution_notification_message_written.cross_id[simple_quote_execution_notification_message_at]); simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  simple_quote_execution_notification_message_at = 0;
  do
  :: simple_quote_execution_notification_message_at < 4 -> assert(simple_quote_execution_notification_message_read.match_id[simple_quote_execution_notification_message_at] == simple_quote_execution_notification_message_written.match_id[simple_quote_execution_notification_message_at]); simple_quote_execution_notification_message_at = simple_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Quote Execution Notification Message: 50 bytes ------------------ */

/* Informs the participant that its quote for a given complex instrument has been executed. Sequenced. */
typedef ComplexQuoteExecutionNotificationMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte badge[4];
  byte message_id[8];
  byte instrument_id[4];
  byte auction_id[4];
  byte price_6[8];
  byte side;
  byte contracts[4];
  byte liquidity_indicator;
  byte cross_id[4];
  byte match_id[4]
};

int complex_quote_execution_notification_message_at;

/* every byte of Complex Quote Execution Notification Message set to one value */
inline fill_complex_quote_execution_notification_message(complex_quote_execution_notification_message_record, complex_quote_execution_notification_message_value) {
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.seconds[complex_quote_execution_notification_message_at] = complex_quote_execution_notification_message_value; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.nanoseconds[complex_quote_execution_notification_message_at] = complex_quote_execution_notification_message_value; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.badge[complex_quote_execution_notification_message_at] = complex_quote_execution_notification_message_value; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 8 -> complex_quote_execution_notification_message_record.message_id[complex_quote_execution_notification_message_at] = complex_quote_execution_notification_message_value; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.instrument_id[complex_quote_execution_notification_message_at] = complex_quote_execution_notification_message_value; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.auction_id[complex_quote_execution_notification_message_at] = complex_quote_execution_notification_message_value; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 8 -> complex_quote_execution_notification_message_record.price_6[complex_quote_execution_notification_message_at] = complex_quote_execution_notification_message_value; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_record.side = complex_quote_execution_notification_message_value;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.contracts[complex_quote_execution_notification_message_at] = complex_quote_execution_notification_message_value; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_record.liquidity_indicator = complex_quote_execution_notification_message_value;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.cross_id[complex_quote_execution_notification_message_at] = complex_quote_execution_notification_message_value; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.match_id[complex_quote_execution_notification_message_at] = complex_quote_execution_notification_message_value; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Quote Execution Notification Message set to where it lies, so a field read out of place says so */
inline ramp_complex_quote_execution_notification_message(complex_quote_execution_notification_message_record, complex_quote_execution_notification_message_base) {
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.seconds[complex_quote_execution_notification_message_at] = (complex_quote_execution_notification_message_base + 0 + complex_quote_execution_notification_message_at + 1) % 256; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.nanoseconds[complex_quote_execution_notification_message_at] = (complex_quote_execution_notification_message_base + 4 + complex_quote_execution_notification_message_at + 1) % 256; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.badge[complex_quote_execution_notification_message_at] = (complex_quote_execution_notification_message_base + 8 + complex_quote_execution_notification_message_at + 1) % 256; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 8 -> complex_quote_execution_notification_message_record.message_id[complex_quote_execution_notification_message_at] = (complex_quote_execution_notification_message_base + 12 + complex_quote_execution_notification_message_at + 1) % 256; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.instrument_id[complex_quote_execution_notification_message_at] = (complex_quote_execution_notification_message_base + 20 + complex_quote_execution_notification_message_at + 1) % 256; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.auction_id[complex_quote_execution_notification_message_at] = (complex_quote_execution_notification_message_base + 24 + complex_quote_execution_notification_message_at + 1) % 256; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 8 -> complex_quote_execution_notification_message_record.price_6[complex_quote_execution_notification_message_at] = (complex_quote_execution_notification_message_base + 28 + complex_quote_execution_notification_message_at + 1) % 256; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_record.side = (complex_quote_execution_notification_message_base + 36 + 1) % 256;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.contracts[complex_quote_execution_notification_message_at] = (complex_quote_execution_notification_message_base + 37 + complex_quote_execution_notification_message_at + 1) % 256; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_record.liquidity_indicator = (complex_quote_execution_notification_message_base + 41 + 1) % 256;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.cross_id[complex_quote_execution_notification_message_at] = (complex_quote_execution_notification_message_base + 42 + complex_quote_execution_notification_message_at + 1) % 256; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.match_id[complex_quote_execution_notification_message_at] = (complex_quote_execution_notification_message_base + 46 + complex_quote_execution_notification_message_at + 1) % 256; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Quote Execution Notification Message to the wire, 50 bytes from where the cursor stands */
inline encode_complex_quote_execution_notification_message(complex_quote_execution_notification_message_record) {
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> wire[at] = complex_quote_execution_notification_message_record.seconds[complex_quote_execution_notification_message_at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> wire[at] = complex_quote_execution_notification_message_record.nanoseconds[complex_quote_execution_notification_message_at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> wire[at] = complex_quote_execution_notification_message_record.badge[complex_quote_execution_notification_message_at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 8 -> wire[at] = complex_quote_execution_notification_message_record.message_id[complex_quote_execution_notification_message_at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> wire[at] = complex_quote_execution_notification_message_record.instrument_id[complex_quote_execution_notification_message_at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> wire[at] = complex_quote_execution_notification_message_record.auction_id[complex_quote_execution_notification_message_at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 8 -> wire[at] = complex_quote_execution_notification_message_record.price_6[complex_quote_execution_notification_message_at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_quote_execution_notification_message_record.side; at = at + 1;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> wire[at] = complex_quote_execution_notification_message_record.contracts[complex_quote_execution_notification_message_at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_quote_execution_notification_message_record.liquidity_indicator; at = at + 1;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> wire[at] = complex_quote_execution_notification_message_record.cross_id[complex_quote_execution_notification_message_at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> wire[at] = complex_quote_execution_notification_message_record.match_id[complex_quote_execution_notification_message_at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Quote Execution Notification Message off the wire, 50 bytes from where the cursor stands */
inline decode_complex_quote_execution_notification_message(complex_quote_execution_notification_message_record) {
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.seconds[complex_quote_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.nanoseconds[complex_quote_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.badge[complex_quote_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 8 -> complex_quote_execution_notification_message_record.message_id[complex_quote_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.instrument_id[complex_quote_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.auction_id[complex_quote_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 8 -> complex_quote_execution_notification_message_record.price_6[complex_quote_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_record.side = wire[at]; at = at + 1;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.contracts[complex_quote_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_record.liquidity_indicator = wire[at]; at = at + 1;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.cross_id[complex_quote_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> complex_quote_execution_notification_message_record.match_id[complex_quote_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Quote Execution Notification Message is what was written, byte for byte */
inline equal_complex_quote_execution_notification_message(complex_quote_execution_notification_message_read, complex_quote_execution_notification_message_written) {
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> assert(complex_quote_execution_notification_message_read.seconds[complex_quote_execution_notification_message_at] == complex_quote_execution_notification_message_written.seconds[complex_quote_execution_notification_message_at]); complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> assert(complex_quote_execution_notification_message_read.nanoseconds[complex_quote_execution_notification_message_at] == complex_quote_execution_notification_message_written.nanoseconds[complex_quote_execution_notification_message_at]); complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> assert(complex_quote_execution_notification_message_read.badge[complex_quote_execution_notification_message_at] == complex_quote_execution_notification_message_written.badge[complex_quote_execution_notification_message_at]); complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 8 -> assert(complex_quote_execution_notification_message_read.message_id[complex_quote_execution_notification_message_at] == complex_quote_execution_notification_message_written.message_id[complex_quote_execution_notification_message_at]); complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> assert(complex_quote_execution_notification_message_read.instrument_id[complex_quote_execution_notification_message_at] == complex_quote_execution_notification_message_written.instrument_id[complex_quote_execution_notification_message_at]); complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> assert(complex_quote_execution_notification_message_read.auction_id[complex_quote_execution_notification_message_at] == complex_quote_execution_notification_message_written.auction_id[complex_quote_execution_notification_message_at]); complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 8 -> assert(complex_quote_execution_notification_message_read.price_6[complex_quote_execution_notification_message_at] == complex_quote_execution_notification_message_written.price_6[complex_quote_execution_notification_message_at]); complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_quote_execution_notification_message_read.side == complex_quote_execution_notification_message_written.side);
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> assert(complex_quote_execution_notification_message_read.contracts[complex_quote_execution_notification_message_at] == complex_quote_execution_notification_message_written.contracts[complex_quote_execution_notification_message_at]); complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_quote_execution_notification_message_read.liquidity_indicator == complex_quote_execution_notification_message_written.liquidity_indicator);
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> assert(complex_quote_execution_notification_message_read.cross_id[complex_quote_execution_notification_message_at] == complex_quote_execution_notification_message_written.cross_id[complex_quote_execution_notification_message_at]); complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_execution_notification_message_at = 0;
  do
  :: complex_quote_execution_notification_message_at < 4 -> assert(complex_quote_execution_notification_message_read.match_id[complex_quote_execution_notification_message_at] == complex_quote_execution_notification_message_written.match_id[complex_quote_execution_notification_message_at]); complex_quote_execution_notification_message_at = complex_quote_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Quote Leg Execution Notification Message: 55 bytes -------------- */

/* Leg level execution of a quote in a complex instrument. Sequenced. */
typedef ComplexQuoteLegExecutionNotificationMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte badge[4];
  byte message_id[8];
  byte instrument_id[4];
  byte leg_instrument_id[4];
  byte leg_id;
  byte auction_id[4];
  byte price_6[8];
  byte side;
  byte contracts[4];
  byte liquidity_indicator;
  byte cross_id[4];
  byte match_id[4]
};

int complex_quote_leg_execution_notification_message_at;

/* every byte of Complex Quote Leg Execution Notification Message set to one value */
inline fill_complex_quote_leg_execution_notification_message(complex_quote_leg_execution_notification_message_record, complex_quote_leg_execution_notification_message_value) {
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.seconds[complex_quote_leg_execution_notification_message_at] = complex_quote_leg_execution_notification_message_value; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.nanoseconds[complex_quote_leg_execution_notification_message_at] = complex_quote_leg_execution_notification_message_value; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.badge[complex_quote_leg_execution_notification_message_at] = complex_quote_leg_execution_notification_message_value; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 8 -> complex_quote_leg_execution_notification_message_record.message_id[complex_quote_leg_execution_notification_message_at] = complex_quote_leg_execution_notification_message_value; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.instrument_id[complex_quote_leg_execution_notification_message_at] = complex_quote_leg_execution_notification_message_value; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.leg_instrument_id[complex_quote_leg_execution_notification_message_at] = complex_quote_leg_execution_notification_message_value; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_record.leg_id = complex_quote_leg_execution_notification_message_value;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.auction_id[complex_quote_leg_execution_notification_message_at] = complex_quote_leg_execution_notification_message_value; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 8 -> complex_quote_leg_execution_notification_message_record.price_6[complex_quote_leg_execution_notification_message_at] = complex_quote_leg_execution_notification_message_value; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_record.side = complex_quote_leg_execution_notification_message_value;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.contracts[complex_quote_leg_execution_notification_message_at] = complex_quote_leg_execution_notification_message_value; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_record.liquidity_indicator = complex_quote_leg_execution_notification_message_value;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.cross_id[complex_quote_leg_execution_notification_message_at] = complex_quote_leg_execution_notification_message_value; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.match_id[complex_quote_leg_execution_notification_message_at] = complex_quote_leg_execution_notification_message_value; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Quote Leg Execution Notification Message set to where it lies, so a field read out of place says so */
inline ramp_complex_quote_leg_execution_notification_message(complex_quote_leg_execution_notification_message_record, complex_quote_leg_execution_notification_message_base) {
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.seconds[complex_quote_leg_execution_notification_message_at] = (complex_quote_leg_execution_notification_message_base + 0 + complex_quote_leg_execution_notification_message_at + 1) % 256; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.nanoseconds[complex_quote_leg_execution_notification_message_at] = (complex_quote_leg_execution_notification_message_base + 4 + complex_quote_leg_execution_notification_message_at + 1) % 256; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.badge[complex_quote_leg_execution_notification_message_at] = (complex_quote_leg_execution_notification_message_base + 8 + complex_quote_leg_execution_notification_message_at + 1) % 256; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 8 -> complex_quote_leg_execution_notification_message_record.message_id[complex_quote_leg_execution_notification_message_at] = (complex_quote_leg_execution_notification_message_base + 12 + complex_quote_leg_execution_notification_message_at + 1) % 256; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.instrument_id[complex_quote_leg_execution_notification_message_at] = (complex_quote_leg_execution_notification_message_base + 20 + complex_quote_leg_execution_notification_message_at + 1) % 256; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.leg_instrument_id[complex_quote_leg_execution_notification_message_at] = (complex_quote_leg_execution_notification_message_base + 24 + complex_quote_leg_execution_notification_message_at + 1) % 256; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_record.leg_id = (complex_quote_leg_execution_notification_message_base + 28 + 1) % 256;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.auction_id[complex_quote_leg_execution_notification_message_at] = (complex_quote_leg_execution_notification_message_base + 29 + complex_quote_leg_execution_notification_message_at + 1) % 256; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 8 -> complex_quote_leg_execution_notification_message_record.price_6[complex_quote_leg_execution_notification_message_at] = (complex_quote_leg_execution_notification_message_base + 33 + complex_quote_leg_execution_notification_message_at + 1) % 256; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_record.side = (complex_quote_leg_execution_notification_message_base + 41 + 1) % 256;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.contracts[complex_quote_leg_execution_notification_message_at] = (complex_quote_leg_execution_notification_message_base + 42 + complex_quote_leg_execution_notification_message_at + 1) % 256; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_record.liquidity_indicator = (complex_quote_leg_execution_notification_message_base + 46 + 1) % 256;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.cross_id[complex_quote_leg_execution_notification_message_at] = (complex_quote_leg_execution_notification_message_base + 47 + complex_quote_leg_execution_notification_message_at + 1) % 256; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.match_id[complex_quote_leg_execution_notification_message_at] = (complex_quote_leg_execution_notification_message_base + 51 + complex_quote_leg_execution_notification_message_at + 1) % 256; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Quote Leg Execution Notification Message to the wire, 55 bytes from where the cursor stands */
inline encode_complex_quote_leg_execution_notification_message(complex_quote_leg_execution_notification_message_record) {
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> wire[at] = complex_quote_leg_execution_notification_message_record.seconds[complex_quote_leg_execution_notification_message_at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> wire[at] = complex_quote_leg_execution_notification_message_record.nanoseconds[complex_quote_leg_execution_notification_message_at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> wire[at] = complex_quote_leg_execution_notification_message_record.badge[complex_quote_leg_execution_notification_message_at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 8 -> wire[at] = complex_quote_leg_execution_notification_message_record.message_id[complex_quote_leg_execution_notification_message_at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> wire[at] = complex_quote_leg_execution_notification_message_record.instrument_id[complex_quote_leg_execution_notification_message_at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> wire[at] = complex_quote_leg_execution_notification_message_record.leg_instrument_id[complex_quote_leg_execution_notification_message_at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_quote_leg_execution_notification_message_record.leg_id; at = at + 1;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> wire[at] = complex_quote_leg_execution_notification_message_record.auction_id[complex_quote_leg_execution_notification_message_at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 8 -> wire[at] = complex_quote_leg_execution_notification_message_record.price_6[complex_quote_leg_execution_notification_message_at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_quote_leg_execution_notification_message_record.side; at = at + 1;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> wire[at] = complex_quote_leg_execution_notification_message_record.contracts[complex_quote_leg_execution_notification_message_at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_quote_leg_execution_notification_message_record.liquidity_indicator; at = at + 1;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> wire[at] = complex_quote_leg_execution_notification_message_record.cross_id[complex_quote_leg_execution_notification_message_at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> wire[at] = complex_quote_leg_execution_notification_message_record.match_id[complex_quote_leg_execution_notification_message_at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Quote Leg Execution Notification Message off the wire, 55 bytes from where the cursor stands */
inline decode_complex_quote_leg_execution_notification_message(complex_quote_leg_execution_notification_message_record) {
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.seconds[complex_quote_leg_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.nanoseconds[complex_quote_leg_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.badge[complex_quote_leg_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 8 -> complex_quote_leg_execution_notification_message_record.message_id[complex_quote_leg_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.instrument_id[complex_quote_leg_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.leg_instrument_id[complex_quote_leg_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_record.leg_id = wire[at]; at = at + 1;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.auction_id[complex_quote_leg_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 8 -> complex_quote_leg_execution_notification_message_record.price_6[complex_quote_leg_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_record.side = wire[at]; at = at + 1;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.contracts[complex_quote_leg_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_record.liquidity_indicator = wire[at]; at = at + 1;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.cross_id[complex_quote_leg_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> complex_quote_leg_execution_notification_message_record.match_id[complex_quote_leg_execution_notification_message_at] = wire[at]; at = at + 1; complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Quote Leg Execution Notification Message is what was written, byte for byte */
inline equal_complex_quote_leg_execution_notification_message(complex_quote_leg_execution_notification_message_read, complex_quote_leg_execution_notification_message_written) {
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> assert(complex_quote_leg_execution_notification_message_read.seconds[complex_quote_leg_execution_notification_message_at] == complex_quote_leg_execution_notification_message_written.seconds[complex_quote_leg_execution_notification_message_at]); complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> assert(complex_quote_leg_execution_notification_message_read.nanoseconds[complex_quote_leg_execution_notification_message_at] == complex_quote_leg_execution_notification_message_written.nanoseconds[complex_quote_leg_execution_notification_message_at]); complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> assert(complex_quote_leg_execution_notification_message_read.badge[complex_quote_leg_execution_notification_message_at] == complex_quote_leg_execution_notification_message_written.badge[complex_quote_leg_execution_notification_message_at]); complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 8 -> assert(complex_quote_leg_execution_notification_message_read.message_id[complex_quote_leg_execution_notification_message_at] == complex_quote_leg_execution_notification_message_written.message_id[complex_quote_leg_execution_notification_message_at]); complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> assert(complex_quote_leg_execution_notification_message_read.instrument_id[complex_quote_leg_execution_notification_message_at] == complex_quote_leg_execution_notification_message_written.instrument_id[complex_quote_leg_execution_notification_message_at]); complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> assert(complex_quote_leg_execution_notification_message_read.leg_instrument_id[complex_quote_leg_execution_notification_message_at] == complex_quote_leg_execution_notification_message_written.leg_instrument_id[complex_quote_leg_execution_notification_message_at]); complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_quote_leg_execution_notification_message_read.leg_id == complex_quote_leg_execution_notification_message_written.leg_id);
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> assert(complex_quote_leg_execution_notification_message_read.auction_id[complex_quote_leg_execution_notification_message_at] == complex_quote_leg_execution_notification_message_written.auction_id[complex_quote_leg_execution_notification_message_at]); complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 8 -> assert(complex_quote_leg_execution_notification_message_read.price_6[complex_quote_leg_execution_notification_message_at] == complex_quote_leg_execution_notification_message_written.price_6[complex_quote_leg_execution_notification_message_at]); complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_quote_leg_execution_notification_message_read.side == complex_quote_leg_execution_notification_message_written.side);
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> assert(complex_quote_leg_execution_notification_message_read.contracts[complex_quote_leg_execution_notification_message_at] == complex_quote_leg_execution_notification_message_written.contracts[complex_quote_leg_execution_notification_message_at]); complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_quote_leg_execution_notification_message_read.liquidity_indicator == complex_quote_leg_execution_notification_message_written.liquidity_indicator);
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> assert(complex_quote_leg_execution_notification_message_read.cross_id[complex_quote_leg_execution_notification_message_at] == complex_quote_leg_execution_notification_message_written.cross_id[complex_quote_leg_execution_notification_message_at]); complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  complex_quote_leg_execution_notification_message_at = 0;
  do
  :: complex_quote_leg_execution_notification_message_at < 4 -> assert(complex_quote_leg_execution_notification_message_read.match_id[complex_quote_leg_execution_notification_message_at] == complex_quote_leg_execution_notification_message_written.match_id[complex_quote_leg_execution_notification_message_at]); complex_quote_leg_execution_notification_message_at = complex_quote_leg_execution_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Msar Notification Message: 47 bytes ------------------------------ */

/* Execution Notification Message: the MSAR Request for a given simple instrument has been executed or cancelled. The Side field reflects the side being swept. Sequenced. */
typedef SimpleMsarNotificationMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte badge[4];
  byte instrument_id[4];
  byte notification_type;
  byte message_id[8];
  byte auction_id[4];
  byte price[4];
  byte side;
  byte contracts[4];
  byte liquidity_indicator;
  byte cross_id[4];
  byte match_id[4]
};

int simple_msar_notification_message_at;

/* every byte of Simple Msar Notification Message set to one value */
inline fill_simple_msar_notification_message(simple_msar_notification_message_record, simple_msar_notification_message_value) {
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.seconds[simple_msar_notification_message_at] = simple_msar_notification_message_value; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.nanoseconds[simple_msar_notification_message_at] = simple_msar_notification_message_value; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.badge[simple_msar_notification_message_at] = simple_msar_notification_message_value; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.instrument_id[simple_msar_notification_message_at] = simple_msar_notification_message_value; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_record.notification_type = simple_msar_notification_message_value;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 8 -> simple_msar_notification_message_record.message_id[simple_msar_notification_message_at] = simple_msar_notification_message_value; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.auction_id[simple_msar_notification_message_at] = simple_msar_notification_message_value; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.price[simple_msar_notification_message_at] = simple_msar_notification_message_value; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_record.side = simple_msar_notification_message_value;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.contracts[simple_msar_notification_message_at] = simple_msar_notification_message_value; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_record.liquidity_indicator = simple_msar_notification_message_value;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.cross_id[simple_msar_notification_message_at] = simple_msar_notification_message_value; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.match_id[simple_msar_notification_message_at] = simple_msar_notification_message_value; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Msar Notification Message set to where it lies, so a field read out of place says so */
inline ramp_simple_msar_notification_message(simple_msar_notification_message_record, simple_msar_notification_message_base) {
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.seconds[simple_msar_notification_message_at] = (simple_msar_notification_message_base + 0 + simple_msar_notification_message_at + 1) % 256; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.nanoseconds[simple_msar_notification_message_at] = (simple_msar_notification_message_base + 4 + simple_msar_notification_message_at + 1) % 256; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.badge[simple_msar_notification_message_at] = (simple_msar_notification_message_base + 8 + simple_msar_notification_message_at + 1) % 256; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.instrument_id[simple_msar_notification_message_at] = (simple_msar_notification_message_base + 12 + simple_msar_notification_message_at + 1) % 256; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_record.notification_type = (simple_msar_notification_message_base + 16 + 1) % 256;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 8 -> simple_msar_notification_message_record.message_id[simple_msar_notification_message_at] = (simple_msar_notification_message_base + 17 + simple_msar_notification_message_at + 1) % 256; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.auction_id[simple_msar_notification_message_at] = (simple_msar_notification_message_base + 25 + simple_msar_notification_message_at + 1) % 256; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.price[simple_msar_notification_message_at] = (simple_msar_notification_message_base + 29 + simple_msar_notification_message_at + 1) % 256; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_record.side = (simple_msar_notification_message_base + 33 + 1) % 256;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.contracts[simple_msar_notification_message_at] = (simple_msar_notification_message_base + 34 + simple_msar_notification_message_at + 1) % 256; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_record.liquidity_indicator = (simple_msar_notification_message_base + 38 + 1) % 256;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.cross_id[simple_msar_notification_message_at] = (simple_msar_notification_message_base + 39 + simple_msar_notification_message_at + 1) % 256; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.match_id[simple_msar_notification_message_at] = (simple_msar_notification_message_base + 43 + simple_msar_notification_message_at + 1) % 256; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Msar Notification Message to the wire, 47 bytes from where the cursor stands */
inline encode_simple_msar_notification_message(simple_msar_notification_message_record) {
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> wire[at] = simple_msar_notification_message_record.seconds[simple_msar_notification_message_at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> wire[at] = simple_msar_notification_message_record.nanoseconds[simple_msar_notification_message_at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> wire[at] = simple_msar_notification_message_record.badge[simple_msar_notification_message_at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> wire[at] = simple_msar_notification_message_record.instrument_id[simple_msar_notification_message_at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_msar_notification_message_record.notification_type; at = at + 1;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 8 -> wire[at] = simple_msar_notification_message_record.message_id[simple_msar_notification_message_at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> wire[at] = simple_msar_notification_message_record.auction_id[simple_msar_notification_message_at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> wire[at] = simple_msar_notification_message_record.price[simple_msar_notification_message_at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_msar_notification_message_record.side; at = at + 1;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> wire[at] = simple_msar_notification_message_record.contracts[simple_msar_notification_message_at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_msar_notification_message_record.liquidity_indicator; at = at + 1;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> wire[at] = simple_msar_notification_message_record.cross_id[simple_msar_notification_message_at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> wire[at] = simple_msar_notification_message_record.match_id[simple_msar_notification_message_at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Msar Notification Message off the wire, 47 bytes from where the cursor stands */
inline decode_simple_msar_notification_message(simple_msar_notification_message_record) {
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.seconds[simple_msar_notification_message_at] = wire[at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.nanoseconds[simple_msar_notification_message_at] = wire[at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.badge[simple_msar_notification_message_at] = wire[at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.instrument_id[simple_msar_notification_message_at] = wire[at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_record.notification_type = wire[at]; at = at + 1;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 8 -> simple_msar_notification_message_record.message_id[simple_msar_notification_message_at] = wire[at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.auction_id[simple_msar_notification_message_at] = wire[at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.price[simple_msar_notification_message_at] = wire[at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_record.side = wire[at]; at = at + 1;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.contracts[simple_msar_notification_message_at] = wire[at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_record.liquidity_indicator = wire[at]; at = at + 1;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.cross_id[simple_msar_notification_message_at] = wire[at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> simple_msar_notification_message_record.match_id[simple_msar_notification_message_at] = wire[at]; at = at + 1; simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Msar Notification Message is what was written, byte for byte */
inline equal_simple_msar_notification_message(simple_msar_notification_message_read, simple_msar_notification_message_written) {
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> assert(simple_msar_notification_message_read.seconds[simple_msar_notification_message_at] == simple_msar_notification_message_written.seconds[simple_msar_notification_message_at]); simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> assert(simple_msar_notification_message_read.nanoseconds[simple_msar_notification_message_at] == simple_msar_notification_message_written.nanoseconds[simple_msar_notification_message_at]); simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> assert(simple_msar_notification_message_read.badge[simple_msar_notification_message_at] == simple_msar_notification_message_written.badge[simple_msar_notification_message_at]); simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> assert(simple_msar_notification_message_read.instrument_id[simple_msar_notification_message_at] == simple_msar_notification_message_written.instrument_id[simple_msar_notification_message_at]); simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  assert(simple_msar_notification_message_read.notification_type == simple_msar_notification_message_written.notification_type);
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 8 -> assert(simple_msar_notification_message_read.message_id[simple_msar_notification_message_at] == simple_msar_notification_message_written.message_id[simple_msar_notification_message_at]); simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> assert(simple_msar_notification_message_read.auction_id[simple_msar_notification_message_at] == simple_msar_notification_message_written.auction_id[simple_msar_notification_message_at]); simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> assert(simple_msar_notification_message_read.price[simple_msar_notification_message_at] == simple_msar_notification_message_written.price[simple_msar_notification_message_at]); simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  assert(simple_msar_notification_message_read.side == simple_msar_notification_message_written.side);
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> assert(simple_msar_notification_message_read.contracts[simple_msar_notification_message_at] == simple_msar_notification_message_written.contracts[simple_msar_notification_message_at]); simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  assert(simple_msar_notification_message_read.liquidity_indicator == simple_msar_notification_message_written.liquidity_indicator);
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> assert(simple_msar_notification_message_read.cross_id[simple_msar_notification_message_at] == simple_msar_notification_message_written.cross_id[simple_msar_notification_message_at]); simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  simple_msar_notification_message_at = 0;
  do
  :: simple_msar_notification_message_at < 4 -> assert(simple_msar_notification_message_read.match_id[simple_msar_notification_message_at] == simple_msar_notification_message_written.match_id[simple_msar_notification_message_at]); simple_msar_notification_message_at = simple_msar_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Msar Leg Notification Message: 61 bytes ------------------------- */

/* Leg-level information on the execution/out of an MSAR for a complex instrument. Precedes the corresponding Complex MSAR Notification. Sequenced. */
typedef ComplexMsarLegNotificationMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte badge[4];
  byte instrument_id[4];
  byte leg_id;
  byte leg_instrument_id[4];
  byte notification_type;
  byte message_id[8];
  byte auction_id[4];
  byte price[4];
  byte side;
  byte leg_side;
  byte contracts[4];
  byte liquidity_indicator;
  byte cross_id[4];
  byte match_id[4];
  byte price_6[8]
};

int complex_msar_leg_notification_message_at;

/* every byte of Complex Msar Leg Notification Message set to one value */
inline fill_complex_msar_leg_notification_message(complex_msar_leg_notification_message_record, complex_msar_leg_notification_message_value) {
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.seconds[complex_msar_leg_notification_message_at] = complex_msar_leg_notification_message_value; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.nanoseconds[complex_msar_leg_notification_message_at] = complex_msar_leg_notification_message_value; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.badge[complex_msar_leg_notification_message_at] = complex_msar_leg_notification_message_value; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.instrument_id[complex_msar_leg_notification_message_at] = complex_msar_leg_notification_message_value; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_record.leg_id = complex_msar_leg_notification_message_value;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.leg_instrument_id[complex_msar_leg_notification_message_at] = complex_msar_leg_notification_message_value; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_record.notification_type = complex_msar_leg_notification_message_value;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 8 -> complex_msar_leg_notification_message_record.message_id[complex_msar_leg_notification_message_at] = complex_msar_leg_notification_message_value; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.auction_id[complex_msar_leg_notification_message_at] = complex_msar_leg_notification_message_value; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.price[complex_msar_leg_notification_message_at] = complex_msar_leg_notification_message_value; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_record.side = complex_msar_leg_notification_message_value;
  complex_msar_leg_notification_message_record.leg_side = complex_msar_leg_notification_message_value;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.contracts[complex_msar_leg_notification_message_at] = complex_msar_leg_notification_message_value; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_record.liquidity_indicator = complex_msar_leg_notification_message_value;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.cross_id[complex_msar_leg_notification_message_at] = complex_msar_leg_notification_message_value; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.match_id[complex_msar_leg_notification_message_at] = complex_msar_leg_notification_message_value; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 8 -> complex_msar_leg_notification_message_record.price_6[complex_msar_leg_notification_message_at] = complex_msar_leg_notification_message_value; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Msar Leg Notification Message set to where it lies, so a field read out of place says so */
inline ramp_complex_msar_leg_notification_message(complex_msar_leg_notification_message_record, complex_msar_leg_notification_message_base) {
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.seconds[complex_msar_leg_notification_message_at] = (complex_msar_leg_notification_message_base + 0 + complex_msar_leg_notification_message_at + 1) % 256; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.nanoseconds[complex_msar_leg_notification_message_at] = (complex_msar_leg_notification_message_base + 4 + complex_msar_leg_notification_message_at + 1) % 256; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.badge[complex_msar_leg_notification_message_at] = (complex_msar_leg_notification_message_base + 8 + complex_msar_leg_notification_message_at + 1) % 256; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.instrument_id[complex_msar_leg_notification_message_at] = (complex_msar_leg_notification_message_base + 12 + complex_msar_leg_notification_message_at + 1) % 256; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_record.leg_id = (complex_msar_leg_notification_message_base + 16 + 1) % 256;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.leg_instrument_id[complex_msar_leg_notification_message_at] = (complex_msar_leg_notification_message_base + 17 + complex_msar_leg_notification_message_at + 1) % 256; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_record.notification_type = (complex_msar_leg_notification_message_base + 21 + 1) % 256;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 8 -> complex_msar_leg_notification_message_record.message_id[complex_msar_leg_notification_message_at] = (complex_msar_leg_notification_message_base + 22 + complex_msar_leg_notification_message_at + 1) % 256; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.auction_id[complex_msar_leg_notification_message_at] = (complex_msar_leg_notification_message_base + 30 + complex_msar_leg_notification_message_at + 1) % 256; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.price[complex_msar_leg_notification_message_at] = (complex_msar_leg_notification_message_base + 34 + complex_msar_leg_notification_message_at + 1) % 256; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_record.side = (complex_msar_leg_notification_message_base + 38 + 1) % 256;
  complex_msar_leg_notification_message_record.leg_side = (complex_msar_leg_notification_message_base + 39 + 1) % 256;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.contracts[complex_msar_leg_notification_message_at] = (complex_msar_leg_notification_message_base + 40 + complex_msar_leg_notification_message_at + 1) % 256; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_record.liquidity_indicator = (complex_msar_leg_notification_message_base + 44 + 1) % 256;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.cross_id[complex_msar_leg_notification_message_at] = (complex_msar_leg_notification_message_base + 45 + complex_msar_leg_notification_message_at + 1) % 256; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.match_id[complex_msar_leg_notification_message_at] = (complex_msar_leg_notification_message_base + 49 + complex_msar_leg_notification_message_at + 1) % 256; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 8 -> complex_msar_leg_notification_message_record.price_6[complex_msar_leg_notification_message_at] = (complex_msar_leg_notification_message_base + 53 + complex_msar_leg_notification_message_at + 1) % 256; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Msar Leg Notification Message to the wire, 61 bytes from where the cursor stands */
inline encode_complex_msar_leg_notification_message(complex_msar_leg_notification_message_record) {
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> wire[at] = complex_msar_leg_notification_message_record.seconds[complex_msar_leg_notification_message_at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> wire[at] = complex_msar_leg_notification_message_record.nanoseconds[complex_msar_leg_notification_message_at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> wire[at] = complex_msar_leg_notification_message_record.badge[complex_msar_leg_notification_message_at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> wire[at] = complex_msar_leg_notification_message_record.instrument_id[complex_msar_leg_notification_message_at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_leg_notification_message_record.leg_id; at = at + 1;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> wire[at] = complex_msar_leg_notification_message_record.leg_instrument_id[complex_msar_leg_notification_message_at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_leg_notification_message_record.notification_type; at = at + 1;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 8 -> wire[at] = complex_msar_leg_notification_message_record.message_id[complex_msar_leg_notification_message_at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> wire[at] = complex_msar_leg_notification_message_record.auction_id[complex_msar_leg_notification_message_at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> wire[at] = complex_msar_leg_notification_message_record.price[complex_msar_leg_notification_message_at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_leg_notification_message_record.side; at = at + 1;
  wire[at] = complex_msar_leg_notification_message_record.leg_side; at = at + 1;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> wire[at] = complex_msar_leg_notification_message_record.contracts[complex_msar_leg_notification_message_at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_leg_notification_message_record.liquidity_indicator; at = at + 1;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> wire[at] = complex_msar_leg_notification_message_record.cross_id[complex_msar_leg_notification_message_at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> wire[at] = complex_msar_leg_notification_message_record.match_id[complex_msar_leg_notification_message_at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 8 -> wire[at] = complex_msar_leg_notification_message_record.price_6[complex_msar_leg_notification_message_at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Msar Leg Notification Message off the wire, 61 bytes from where the cursor stands */
inline decode_complex_msar_leg_notification_message(complex_msar_leg_notification_message_record) {
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.seconds[complex_msar_leg_notification_message_at] = wire[at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.nanoseconds[complex_msar_leg_notification_message_at] = wire[at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.badge[complex_msar_leg_notification_message_at] = wire[at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.instrument_id[complex_msar_leg_notification_message_at] = wire[at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_record.leg_id = wire[at]; at = at + 1;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.leg_instrument_id[complex_msar_leg_notification_message_at] = wire[at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_record.notification_type = wire[at]; at = at + 1;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 8 -> complex_msar_leg_notification_message_record.message_id[complex_msar_leg_notification_message_at] = wire[at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.auction_id[complex_msar_leg_notification_message_at] = wire[at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.price[complex_msar_leg_notification_message_at] = wire[at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_record.side = wire[at]; at = at + 1;
  complex_msar_leg_notification_message_record.leg_side = wire[at]; at = at + 1;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.contracts[complex_msar_leg_notification_message_at] = wire[at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_record.liquidity_indicator = wire[at]; at = at + 1;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.cross_id[complex_msar_leg_notification_message_at] = wire[at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> complex_msar_leg_notification_message_record.match_id[complex_msar_leg_notification_message_at] = wire[at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 8 -> complex_msar_leg_notification_message_record.price_6[complex_msar_leg_notification_message_at] = wire[at]; at = at + 1; complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Msar Leg Notification Message is what was written, byte for byte */
inline equal_complex_msar_leg_notification_message(complex_msar_leg_notification_message_read, complex_msar_leg_notification_message_written) {
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> assert(complex_msar_leg_notification_message_read.seconds[complex_msar_leg_notification_message_at] == complex_msar_leg_notification_message_written.seconds[complex_msar_leg_notification_message_at]); complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> assert(complex_msar_leg_notification_message_read.nanoseconds[complex_msar_leg_notification_message_at] == complex_msar_leg_notification_message_written.nanoseconds[complex_msar_leg_notification_message_at]); complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> assert(complex_msar_leg_notification_message_read.badge[complex_msar_leg_notification_message_at] == complex_msar_leg_notification_message_written.badge[complex_msar_leg_notification_message_at]); complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> assert(complex_msar_leg_notification_message_read.instrument_id[complex_msar_leg_notification_message_at] == complex_msar_leg_notification_message_written.instrument_id[complex_msar_leg_notification_message_at]); complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_leg_notification_message_read.leg_id == complex_msar_leg_notification_message_written.leg_id);
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> assert(complex_msar_leg_notification_message_read.leg_instrument_id[complex_msar_leg_notification_message_at] == complex_msar_leg_notification_message_written.leg_instrument_id[complex_msar_leg_notification_message_at]); complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_leg_notification_message_read.notification_type == complex_msar_leg_notification_message_written.notification_type);
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 8 -> assert(complex_msar_leg_notification_message_read.message_id[complex_msar_leg_notification_message_at] == complex_msar_leg_notification_message_written.message_id[complex_msar_leg_notification_message_at]); complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> assert(complex_msar_leg_notification_message_read.auction_id[complex_msar_leg_notification_message_at] == complex_msar_leg_notification_message_written.auction_id[complex_msar_leg_notification_message_at]); complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> assert(complex_msar_leg_notification_message_read.price[complex_msar_leg_notification_message_at] == complex_msar_leg_notification_message_written.price[complex_msar_leg_notification_message_at]); complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_leg_notification_message_read.side == complex_msar_leg_notification_message_written.side);
  assert(complex_msar_leg_notification_message_read.leg_side == complex_msar_leg_notification_message_written.leg_side);
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> assert(complex_msar_leg_notification_message_read.contracts[complex_msar_leg_notification_message_at] == complex_msar_leg_notification_message_written.contracts[complex_msar_leg_notification_message_at]); complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_leg_notification_message_read.liquidity_indicator == complex_msar_leg_notification_message_written.liquidity_indicator);
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> assert(complex_msar_leg_notification_message_read.cross_id[complex_msar_leg_notification_message_at] == complex_msar_leg_notification_message_written.cross_id[complex_msar_leg_notification_message_at]); complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 4 -> assert(complex_msar_leg_notification_message_read.match_id[complex_msar_leg_notification_message_at] == complex_msar_leg_notification_message_written.match_id[complex_msar_leg_notification_message_at]); complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_leg_notification_message_at = 0;
  do
  :: complex_msar_leg_notification_message_at < 8 -> assert(complex_msar_leg_notification_message_read.price_6[complex_msar_leg_notification_message_at] == complex_msar_leg_notification_message_written.price_6[complex_msar_leg_notification_message_at]); complex_msar_leg_notification_message_at = complex_msar_leg_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Msar Notification Message: 55 bytes ----------------------------- */

/* Complex MSAR Execution Notification: the Complex MSAR Request has been executed or cancelled. Sequenced. */
typedef ComplexMsarNotificationMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte badge[4];
  byte instrument_id[4];
  byte notification_type;
  byte message_id[8];
  byte auction_id[4];
  byte price[4];
  byte side;
  byte contracts[4];
  byte liquidity_indicator;
  byte cross_id[4];
  byte match_id[4];
  byte price_6[8]
};

int complex_msar_notification_message_at;

/* every byte of Complex Msar Notification Message set to one value */
inline fill_complex_msar_notification_message(complex_msar_notification_message_record, complex_msar_notification_message_value) {
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.seconds[complex_msar_notification_message_at] = complex_msar_notification_message_value; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.nanoseconds[complex_msar_notification_message_at] = complex_msar_notification_message_value; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.badge[complex_msar_notification_message_at] = complex_msar_notification_message_value; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.instrument_id[complex_msar_notification_message_at] = complex_msar_notification_message_value; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_record.notification_type = complex_msar_notification_message_value;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 8 -> complex_msar_notification_message_record.message_id[complex_msar_notification_message_at] = complex_msar_notification_message_value; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.auction_id[complex_msar_notification_message_at] = complex_msar_notification_message_value; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.price[complex_msar_notification_message_at] = complex_msar_notification_message_value; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_record.side = complex_msar_notification_message_value;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.contracts[complex_msar_notification_message_at] = complex_msar_notification_message_value; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_record.liquidity_indicator = complex_msar_notification_message_value;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.cross_id[complex_msar_notification_message_at] = complex_msar_notification_message_value; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.match_id[complex_msar_notification_message_at] = complex_msar_notification_message_value; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 8 -> complex_msar_notification_message_record.price_6[complex_msar_notification_message_at] = complex_msar_notification_message_value; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Msar Notification Message set to where it lies, so a field read out of place says so */
inline ramp_complex_msar_notification_message(complex_msar_notification_message_record, complex_msar_notification_message_base) {
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.seconds[complex_msar_notification_message_at] = (complex_msar_notification_message_base + 0 + complex_msar_notification_message_at + 1) % 256; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.nanoseconds[complex_msar_notification_message_at] = (complex_msar_notification_message_base + 4 + complex_msar_notification_message_at + 1) % 256; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.badge[complex_msar_notification_message_at] = (complex_msar_notification_message_base + 8 + complex_msar_notification_message_at + 1) % 256; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.instrument_id[complex_msar_notification_message_at] = (complex_msar_notification_message_base + 12 + complex_msar_notification_message_at + 1) % 256; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_record.notification_type = (complex_msar_notification_message_base + 16 + 1) % 256;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 8 -> complex_msar_notification_message_record.message_id[complex_msar_notification_message_at] = (complex_msar_notification_message_base + 17 + complex_msar_notification_message_at + 1) % 256; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.auction_id[complex_msar_notification_message_at] = (complex_msar_notification_message_base + 25 + complex_msar_notification_message_at + 1) % 256; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.price[complex_msar_notification_message_at] = (complex_msar_notification_message_base + 29 + complex_msar_notification_message_at + 1) % 256; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_record.side = (complex_msar_notification_message_base + 33 + 1) % 256;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.contracts[complex_msar_notification_message_at] = (complex_msar_notification_message_base + 34 + complex_msar_notification_message_at + 1) % 256; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_record.liquidity_indicator = (complex_msar_notification_message_base + 38 + 1) % 256;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.cross_id[complex_msar_notification_message_at] = (complex_msar_notification_message_base + 39 + complex_msar_notification_message_at + 1) % 256; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.match_id[complex_msar_notification_message_at] = (complex_msar_notification_message_base + 43 + complex_msar_notification_message_at + 1) % 256; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 8 -> complex_msar_notification_message_record.price_6[complex_msar_notification_message_at] = (complex_msar_notification_message_base + 47 + complex_msar_notification_message_at + 1) % 256; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Msar Notification Message to the wire, 55 bytes from where the cursor stands */
inline encode_complex_msar_notification_message(complex_msar_notification_message_record) {
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> wire[at] = complex_msar_notification_message_record.seconds[complex_msar_notification_message_at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> wire[at] = complex_msar_notification_message_record.nanoseconds[complex_msar_notification_message_at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> wire[at] = complex_msar_notification_message_record.badge[complex_msar_notification_message_at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> wire[at] = complex_msar_notification_message_record.instrument_id[complex_msar_notification_message_at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_notification_message_record.notification_type; at = at + 1;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 8 -> wire[at] = complex_msar_notification_message_record.message_id[complex_msar_notification_message_at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> wire[at] = complex_msar_notification_message_record.auction_id[complex_msar_notification_message_at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> wire[at] = complex_msar_notification_message_record.price[complex_msar_notification_message_at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_notification_message_record.side; at = at + 1;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> wire[at] = complex_msar_notification_message_record.contracts[complex_msar_notification_message_at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_notification_message_record.liquidity_indicator; at = at + 1;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> wire[at] = complex_msar_notification_message_record.cross_id[complex_msar_notification_message_at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> wire[at] = complex_msar_notification_message_record.match_id[complex_msar_notification_message_at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 8 -> wire[at] = complex_msar_notification_message_record.price_6[complex_msar_notification_message_at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Msar Notification Message off the wire, 55 bytes from where the cursor stands */
inline decode_complex_msar_notification_message(complex_msar_notification_message_record) {
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.seconds[complex_msar_notification_message_at] = wire[at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.nanoseconds[complex_msar_notification_message_at] = wire[at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.badge[complex_msar_notification_message_at] = wire[at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.instrument_id[complex_msar_notification_message_at] = wire[at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_record.notification_type = wire[at]; at = at + 1;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 8 -> complex_msar_notification_message_record.message_id[complex_msar_notification_message_at] = wire[at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.auction_id[complex_msar_notification_message_at] = wire[at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.price[complex_msar_notification_message_at] = wire[at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_record.side = wire[at]; at = at + 1;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.contracts[complex_msar_notification_message_at] = wire[at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_record.liquidity_indicator = wire[at]; at = at + 1;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.cross_id[complex_msar_notification_message_at] = wire[at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> complex_msar_notification_message_record.match_id[complex_msar_notification_message_at] = wire[at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 8 -> complex_msar_notification_message_record.price_6[complex_msar_notification_message_at] = wire[at]; at = at + 1; complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Msar Notification Message is what was written, byte for byte */
inline equal_complex_msar_notification_message(complex_msar_notification_message_read, complex_msar_notification_message_written) {
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> assert(complex_msar_notification_message_read.seconds[complex_msar_notification_message_at] == complex_msar_notification_message_written.seconds[complex_msar_notification_message_at]); complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> assert(complex_msar_notification_message_read.nanoseconds[complex_msar_notification_message_at] == complex_msar_notification_message_written.nanoseconds[complex_msar_notification_message_at]); complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> assert(complex_msar_notification_message_read.badge[complex_msar_notification_message_at] == complex_msar_notification_message_written.badge[complex_msar_notification_message_at]); complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> assert(complex_msar_notification_message_read.instrument_id[complex_msar_notification_message_at] == complex_msar_notification_message_written.instrument_id[complex_msar_notification_message_at]); complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_notification_message_read.notification_type == complex_msar_notification_message_written.notification_type);
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 8 -> assert(complex_msar_notification_message_read.message_id[complex_msar_notification_message_at] == complex_msar_notification_message_written.message_id[complex_msar_notification_message_at]); complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> assert(complex_msar_notification_message_read.auction_id[complex_msar_notification_message_at] == complex_msar_notification_message_written.auction_id[complex_msar_notification_message_at]); complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> assert(complex_msar_notification_message_read.price[complex_msar_notification_message_at] == complex_msar_notification_message_written.price[complex_msar_notification_message_at]); complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_notification_message_read.side == complex_msar_notification_message_written.side);
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> assert(complex_msar_notification_message_read.contracts[complex_msar_notification_message_at] == complex_msar_notification_message_written.contracts[complex_msar_notification_message_at]); complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_notification_message_read.liquidity_indicator == complex_msar_notification_message_written.liquidity_indicator);
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> assert(complex_msar_notification_message_read.cross_id[complex_msar_notification_message_at] == complex_msar_notification_message_written.cross_id[complex_msar_notification_message_at]); complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 4 -> assert(complex_msar_notification_message_read.match_id[complex_msar_notification_message_at] == complex_msar_notification_message_written.match_id[complex_msar_notification_message_at]); complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  complex_msar_notification_message_at = 0;
  do
  :: complex_msar_notification_message_at < 8 -> assert(complex_msar_notification_message_read.price_6[complex_msar_notification_message_at] == complex_msar_notification_message_written.price_6[complex_msar_notification_message_at]); complex_msar_notification_message_at = complex_msar_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Opening Rotation Quote Spread Multiplier Notification Message: 22 bytes ---- */

/* Quote Spread Multiplier Message: sent once per underlying permitted on the port and whenever the effective multiplier changes intraday. Sequenced. */
typedef OpeningRotationQuoteSpreadMultiplierNotificationMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte underlying_symbol[13];
  byte multiplier
};

int opening_rotation_quote_spread_multiplier_notification_message_at;

/* every byte of Opening Rotation Quote Spread Multiplier Notification Message set to one value */
inline fill_opening_rotation_quote_spread_multiplier_notification_message(opening_rotation_quote_spread_multiplier_notification_message_record, opening_rotation_quote_spread_multiplier_notification_message_value) {
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 4 -> opening_rotation_quote_spread_multiplier_notification_message_record.seconds[opening_rotation_quote_spread_multiplier_notification_message_at] = opening_rotation_quote_spread_multiplier_notification_message_value; opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 4 -> opening_rotation_quote_spread_multiplier_notification_message_record.nanoseconds[opening_rotation_quote_spread_multiplier_notification_message_at] = opening_rotation_quote_spread_multiplier_notification_message_value; opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 13 -> opening_rotation_quote_spread_multiplier_notification_message_record.underlying_symbol[opening_rotation_quote_spread_multiplier_notification_message_at] = opening_rotation_quote_spread_multiplier_notification_message_value; opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  opening_rotation_quote_spread_multiplier_notification_message_record.multiplier = opening_rotation_quote_spread_multiplier_notification_message_value;
  skip
}

/* each byte of Opening Rotation Quote Spread Multiplier Notification Message set to where it lies, so a field read out of place says so */
inline ramp_opening_rotation_quote_spread_multiplier_notification_message(opening_rotation_quote_spread_multiplier_notification_message_record, opening_rotation_quote_spread_multiplier_notification_message_base) {
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 4 -> opening_rotation_quote_spread_multiplier_notification_message_record.seconds[opening_rotation_quote_spread_multiplier_notification_message_at] = (opening_rotation_quote_spread_multiplier_notification_message_base + 0 + opening_rotation_quote_spread_multiplier_notification_message_at + 1) % 256; opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 4 -> opening_rotation_quote_spread_multiplier_notification_message_record.nanoseconds[opening_rotation_quote_spread_multiplier_notification_message_at] = (opening_rotation_quote_spread_multiplier_notification_message_base + 4 + opening_rotation_quote_spread_multiplier_notification_message_at + 1) % 256; opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 13 -> opening_rotation_quote_spread_multiplier_notification_message_record.underlying_symbol[opening_rotation_quote_spread_multiplier_notification_message_at] = (opening_rotation_quote_spread_multiplier_notification_message_base + 8 + opening_rotation_quote_spread_multiplier_notification_message_at + 1) % 256; opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  opening_rotation_quote_spread_multiplier_notification_message_record.multiplier = (opening_rotation_quote_spread_multiplier_notification_message_base + 21 + 1) % 256;
  skip
}

/* Opening Rotation Quote Spread Multiplier Notification Message to the wire, 22 bytes from where the cursor stands */
inline encode_opening_rotation_quote_spread_multiplier_notification_message(opening_rotation_quote_spread_multiplier_notification_message_record) {
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 4 -> wire[at] = opening_rotation_quote_spread_multiplier_notification_message_record.seconds[opening_rotation_quote_spread_multiplier_notification_message_at]; at = at + 1; opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 4 -> wire[at] = opening_rotation_quote_spread_multiplier_notification_message_record.nanoseconds[opening_rotation_quote_spread_multiplier_notification_message_at]; at = at + 1; opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 13 -> wire[at] = opening_rotation_quote_spread_multiplier_notification_message_record.underlying_symbol[opening_rotation_quote_spread_multiplier_notification_message_at]; at = at + 1; opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = opening_rotation_quote_spread_multiplier_notification_message_record.multiplier; at = at + 1;
  skip
}

/* Opening Rotation Quote Spread Multiplier Notification Message off the wire, 22 bytes from where the cursor stands */
inline decode_opening_rotation_quote_spread_multiplier_notification_message(opening_rotation_quote_spread_multiplier_notification_message_record) {
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 4 -> opening_rotation_quote_spread_multiplier_notification_message_record.seconds[opening_rotation_quote_spread_multiplier_notification_message_at] = wire[at]; at = at + 1; opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 4 -> opening_rotation_quote_spread_multiplier_notification_message_record.nanoseconds[opening_rotation_quote_spread_multiplier_notification_message_at] = wire[at]; at = at + 1; opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 13 -> opening_rotation_quote_spread_multiplier_notification_message_record.underlying_symbol[opening_rotation_quote_spread_multiplier_notification_message_at] = wire[at]; at = at + 1; opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  opening_rotation_quote_spread_multiplier_notification_message_record.multiplier = wire[at]; at = at + 1;
  skip
}

/* what was read of Opening Rotation Quote Spread Multiplier Notification Message is what was written, byte for byte */
inline equal_opening_rotation_quote_spread_multiplier_notification_message(opening_rotation_quote_spread_multiplier_notification_message_read, opening_rotation_quote_spread_multiplier_notification_message_written) {
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 4 -> assert(opening_rotation_quote_spread_multiplier_notification_message_read.seconds[opening_rotation_quote_spread_multiplier_notification_message_at] == opening_rotation_quote_spread_multiplier_notification_message_written.seconds[opening_rotation_quote_spread_multiplier_notification_message_at]); opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 4 -> assert(opening_rotation_quote_spread_multiplier_notification_message_read.nanoseconds[opening_rotation_quote_spread_multiplier_notification_message_at] == opening_rotation_quote_spread_multiplier_notification_message_written.nanoseconds[opening_rotation_quote_spread_multiplier_notification_message_at]); opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  opening_rotation_quote_spread_multiplier_notification_message_at = 0;
  do
  :: opening_rotation_quote_spread_multiplier_notification_message_at < 13 -> assert(opening_rotation_quote_spread_multiplier_notification_message_read.underlying_symbol[opening_rotation_quote_spread_multiplier_notification_message_at] == opening_rotation_quote_spread_multiplier_notification_message_written.underlying_symbol[opening_rotation_quote_spread_multiplier_notification_message_at]); opening_rotation_quote_spread_multiplier_notification_message_at = opening_rotation_quote_spread_multiplier_notification_message_at + 1
  :: else -> break
  od;
  assert(opening_rotation_quote_spread_multiplier_notification_message_read.multiplier == opening_rotation_quote_spread_multiplier_notification_message_written.multiplier);
  skip
}

/* ---- Notification Subscription Reply Message: 13 bytes ----------------------- */

/* Reply to a Notification Subscription Request. Unsequenced. */
typedef NotificationSubscriptionReplyMessage {
  byte badge[4];
  byte message_id[8];
  byte status_code
};

int notification_subscription_reply_message_at;

/* every byte of Notification Subscription Reply Message set to one value */
inline fill_notification_subscription_reply_message(notification_subscription_reply_message_record, notification_subscription_reply_message_value) {
  notification_subscription_reply_message_at = 0;
  do
  :: notification_subscription_reply_message_at < 4 -> notification_subscription_reply_message_record.badge[notification_subscription_reply_message_at] = notification_subscription_reply_message_value; notification_subscription_reply_message_at = notification_subscription_reply_message_at + 1
  :: else -> break
  od;
  notification_subscription_reply_message_at = 0;
  do
  :: notification_subscription_reply_message_at < 8 -> notification_subscription_reply_message_record.message_id[notification_subscription_reply_message_at] = notification_subscription_reply_message_value; notification_subscription_reply_message_at = notification_subscription_reply_message_at + 1
  :: else -> break
  od;
  notification_subscription_reply_message_record.status_code = notification_subscription_reply_message_value;
  skip
}

/* each byte of Notification Subscription Reply Message set to where it lies, so a field read out of place says so */
inline ramp_notification_subscription_reply_message(notification_subscription_reply_message_record, notification_subscription_reply_message_base) {
  notification_subscription_reply_message_at = 0;
  do
  :: notification_subscription_reply_message_at < 4 -> notification_subscription_reply_message_record.badge[notification_subscription_reply_message_at] = (notification_subscription_reply_message_base + 0 + notification_subscription_reply_message_at + 1) % 256; notification_subscription_reply_message_at = notification_subscription_reply_message_at + 1
  :: else -> break
  od;
  notification_subscription_reply_message_at = 0;
  do
  :: notification_subscription_reply_message_at < 8 -> notification_subscription_reply_message_record.message_id[notification_subscription_reply_message_at] = (notification_subscription_reply_message_base + 4 + notification_subscription_reply_message_at + 1) % 256; notification_subscription_reply_message_at = notification_subscription_reply_message_at + 1
  :: else -> break
  od;
  notification_subscription_reply_message_record.status_code = (notification_subscription_reply_message_base + 12 + 1) % 256;
  skip
}

/* Notification Subscription Reply Message to the wire, 13 bytes from where the cursor stands */
inline encode_notification_subscription_reply_message(notification_subscription_reply_message_record) {
  notification_subscription_reply_message_at = 0;
  do
  :: notification_subscription_reply_message_at < 4 -> wire[at] = notification_subscription_reply_message_record.badge[notification_subscription_reply_message_at]; at = at + 1; notification_subscription_reply_message_at = notification_subscription_reply_message_at + 1
  :: else -> break
  od;
  notification_subscription_reply_message_at = 0;
  do
  :: notification_subscription_reply_message_at < 8 -> wire[at] = notification_subscription_reply_message_record.message_id[notification_subscription_reply_message_at]; at = at + 1; notification_subscription_reply_message_at = notification_subscription_reply_message_at + 1
  :: else -> break
  od;
  wire[at] = notification_subscription_reply_message_record.status_code; at = at + 1;
  skip
}

/* Notification Subscription Reply Message off the wire, 13 bytes from where the cursor stands */
inline decode_notification_subscription_reply_message(notification_subscription_reply_message_record) {
  notification_subscription_reply_message_at = 0;
  do
  :: notification_subscription_reply_message_at < 4 -> notification_subscription_reply_message_record.badge[notification_subscription_reply_message_at] = wire[at]; at = at + 1; notification_subscription_reply_message_at = notification_subscription_reply_message_at + 1
  :: else -> break
  od;
  notification_subscription_reply_message_at = 0;
  do
  :: notification_subscription_reply_message_at < 8 -> notification_subscription_reply_message_record.message_id[notification_subscription_reply_message_at] = wire[at]; at = at + 1; notification_subscription_reply_message_at = notification_subscription_reply_message_at + 1
  :: else -> break
  od;
  notification_subscription_reply_message_record.status_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Notification Subscription Reply Message is what was written, byte for byte */
inline equal_notification_subscription_reply_message(notification_subscription_reply_message_read, notification_subscription_reply_message_written) {
  notification_subscription_reply_message_at = 0;
  do
  :: notification_subscription_reply_message_at < 4 -> assert(notification_subscription_reply_message_read.badge[notification_subscription_reply_message_at] == notification_subscription_reply_message_written.badge[notification_subscription_reply_message_at]); notification_subscription_reply_message_at = notification_subscription_reply_message_at + 1
  :: else -> break
  od;
  notification_subscription_reply_message_at = 0;
  do
  :: notification_subscription_reply_message_at < 8 -> assert(notification_subscription_reply_message_read.message_id[notification_subscription_reply_message_at] == notification_subscription_reply_message_written.message_id[notification_subscription_reply_message_at]); notification_subscription_reply_message_at = notification_subscription_reply_message_at + 1
  :: else -> break
  od;
  assert(notification_subscription_reply_message_read.status_code == notification_subscription_reply_message_written.status_code);
  skip
}

/* ---- Add Complex Instrument Reply Message: 13 bytes -------------------------- */

/* Response to the Add Complex Instrument Request (AC) indicating the validity of the request. Unsequenced. */
typedef AddComplexInstrumentReplyMessage {
  byte badge[4];
  byte message_id[8];
  byte status_code
};

int add_complex_instrument_reply_message_at;

/* every byte of Add Complex Instrument Reply Message set to one value */
inline fill_add_complex_instrument_reply_message(add_complex_instrument_reply_message_record, add_complex_instrument_reply_message_value) {
  add_complex_instrument_reply_message_at = 0;
  do
  :: add_complex_instrument_reply_message_at < 4 -> add_complex_instrument_reply_message_record.badge[add_complex_instrument_reply_message_at] = add_complex_instrument_reply_message_value; add_complex_instrument_reply_message_at = add_complex_instrument_reply_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_reply_message_at = 0;
  do
  :: add_complex_instrument_reply_message_at < 8 -> add_complex_instrument_reply_message_record.message_id[add_complex_instrument_reply_message_at] = add_complex_instrument_reply_message_value; add_complex_instrument_reply_message_at = add_complex_instrument_reply_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_reply_message_record.status_code = add_complex_instrument_reply_message_value;
  skip
}

/* each byte of Add Complex Instrument Reply Message set to where it lies, so a field read out of place says so */
inline ramp_add_complex_instrument_reply_message(add_complex_instrument_reply_message_record, add_complex_instrument_reply_message_base) {
  add_complex_instrument_reply_message_at = 0;
  do
  :: add_complex_instrument_reply_message_at < 4 -> add_complex_instrument_reply_message_record.badge[add_complex_instrument_reply_message_at] = (add_complex_instrument_reply_message_base + 0 + add_complex_instrument_reply_message_at + 1) % 256; add_complex_instrument_reply_message_at = add_complex_instrument_reply_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_reply_message_at = 0;
  do
  :: add_complex_instrument_reply_message_at < 8 -> add_complex_instrument_reply_message_record.message_id[add_complex_instrument_reply_message_at] = (add_complex_instrument_reply_message_base + 4 + add_complex_instrument_reply_message_at + 1) % 256; add_complex_instrument_reply_message_at = add_complex_instrument_reply_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_reply_message_record.status_code = (add_complex_instrument_reply_message_base + 12 + 1) % 256;
  skip
}

/* Add Complex Instrument Reply Message to the wire, 13 bytes from where the cursor stands */
inline encode_add_complex_instrument_reply_message(add_complex_instrument_reply_message_record) {
  add_complex_instrument_reply_message_at = 0;
  do
  :: add_complex_instrument_reply_message_at < 4 -> wire[at] = add_complex_instrument_reply_message_record.badge[add_complex_instrument_reply_message_at]; at = at + 1; add_complex_instrument_reply_message_at = add_complex_instrument_reply_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_reply_message_at = 0;
  do
  :: add_complex_instrument_reply_message_at < 8 -> wire[at] = add_complex_instrument_reply_message_record.message_id[add_complex_instrument_reply_message_at]; at = at + 1; add_complex_instrument_reply_message_at = add_complex_instrument_reply_message_at + 1
  :: else -> break
  od;
  wire[at] = add_complex_instrument_reply_message_record.status_code; at = at + 1;
  skip
}

/* Add Complex Instrument Reply Message off the wire, 13 bytes from where the cursor stands */
inline decode_add_complex_instrument_reply_message(add_complex_instrument_reply_message_record) {
  add_complex_instrument_reply_message_at = 0;
  do
  :: add_complex_instrument_reply_message_at < 4 -> add_complex_instrument_reply_message_record.badge[add_complex_instrument_reply_message_at] = wire[at]; at = at + 1; add_complex_instrument_reply_message_at = add_complex_instrument_reply_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_reply_message_at = 0;
  do
  :: add_complex_instrument_reply_message_at < 8 -> add_complex_instrument_reply_message_record.message_id[add_complex_instrument_reply_message_at] = wire[at]; at = at + 1; add_complex_instrument_reply_message_at = add_complex_instrument_reply_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_reply_message_record.status_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Complex Instrument Reply Message is what was written, byte for byte */
inline equal_add_complex_instrument_reply_message(add_complex_instrument_reply_message_read, add_complex_instrument_reply_message_written) {
  add_complex_instrument_reply_message_at = 0;
  do
  :: add_complex_instrument_reply_message_at < 4 -> assert(add_complex_instrument_reply_message_read.badge[add_complex_instrument_reply_message_at] == add_complex_instrument_reply_message_written.badge[add_complex_instrument_reply_message_at]); add_complex_instrument_reply_message_at = add_complex_instrument_reply_message_at + 1
  :: else -> break
  od;
  add_complex_instrument_reply_message_at = 0;
  do
  :: add_complex_instrument_reply_message_at < 8 -> assert(add_complex_instrument_reply_message_read.message_id[add_complex_instrument_reply_message_at] == add_complex_instrument_reply_message_written.message_id[add_complex_instrument_reply_message_at]); add_complex_instrument_reply_message_at = add_complex_instrument_reply_message_at + 1
  :: else -> break
  od;
  assert(add_complex_instrument_reply_message_read.status_code == add_complex_instrument_reply_message_written.status_code);
  skip
}

/* ---- Mm Parameter Definition Reply Message: 13 bytes ------------------------- */

/* Response to the MM Parameter Definition Request (AE) indicating the validity of the request. Unsequenced. */
typedef MmParameterDefinitionReplyMessage {
  byte badge[4];
  byte message_id[8];
  byte status_code
};

int mm_parameter_definition_reply_message_at;

/* every byte of Mm Parameter Definition Reply Message set to one value */
inline fill_mm_parameter_definition_reply_message(mm_parameter_definition_reply_message_record, mm_parameter_definition_reply_message_value) {
  mm_parameter_definition_reply_message_at = 0;
  do
  :: mm_parameter_definition_reply_message_at < 4 -> mm_parameter_definition_reply_message_record.badge[mm_parameter_definition_reply_message_at] = mm_parameter_definition_reply_message_value; mm_parameter_definition_reply_message_at = mm_parameter_definition_reply_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_reply_message_at = 0;
  do
  :: mm_parameter_definition_reply_message_at < 8 -> mm_parameter_definition_reply_message_record.message_id[mm_parameter_definition_reply_message_at] = mm_parameter_definition_reply_message_value; mm_parameter_definition_reply_message_at = mm_parameter_definition_reply_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_reply_message_record.status_code = mm_parameter_definition_reply_message_value;
  skip
}

/* each byte of Mm Parameter Definition Reply Message set to where it lies, so a field read out of place says so */
inline ramp_mm_parameter_definition_reply_message(mm_parameter_definition_reply_message_record, mm_parameter_definition_reply_message_base) {
  mm_parameter_definition_reply_message_at = 0;
  do
  :: mm_parameter_definition_reply_message_at < 4 -> mm_parameter_definition_reply_message_record.badge[mm_parameter_definition_reply_message_at] = (mm_parameter_definition_reply_message_base + 0 + mm_parameter_definition_reply_message_at + 1) % 256; mm_parameter_definition_reply_message_at = mm_parameter_definition_reply_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_reply_message_at = 0;
  do
  :: mm_parameter_definition_reply_message_at < 8 -> mm_parameter_definition_reply_message_record.message_id[mm_parameter_definition_reply_message_at] = (mm_parameter_definition_reply_message_base + 4 + mm_parameter_definition_reply_message_at + 1) % 256; mm_parameter_definition_reply_message_at = mm_parameter_definition_reply_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_reply_message_record.status_code = (mm_parameter_definition_reply_message_base + 12 + 1) % 256;
  skip
}

/* Mm Parameter Definition Reply Message to the wire, 13 bytes from where the cursor stands */
inline encode_mm_parameter_definition_reply_message(mm_parameter_definition_reply_message_record) {
  mm_parameter_definition_reply_message_at = 0;
  do
  :: mm_parameter_definition_reply_message_at < 4 -> wire[at] = mm_parameter_definition_reply_message_record.badge[mm_parameter_definition_reply_message_at]; at = at + 1; mm_parameter_definition_reply_message_at = mm_parameter_definition_reply_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_reply_message_at = 0;
  do
  :: mm_parameter_definition_reply_message_at < 8 -> wire[at] = mm_parameter_definition_reply_message_record.message_id[mm_parameter_definition_reply_message_at]; at = at + 1; mm_parameter_definition_reply_message_at = mm_parameter_definition_reply_message_at + 1
  :: else -> break
  od;
  wire[at] = mm_parameter_definition_reply_message_record.status_code; at = at + 1;
  skip
}

/* Mm Parameter Definition Reply Message off the wire, 13 bytes from where the cursor stands */
inline decode_mm_parameter_definition_reply_message(mm_parameter_definition_reply_message_record) {
  mm_parameter_definition_reply_message_at = 0;
  do
  :: mm_parameter_definition_reply_message_at < 4 -> mm_parameter_definition_reply_message_record.badge[mm_parameter_definition_reply_message_at] = wire[at]; at = at + 1; mm_parameter_definition_reply_message_at = mm_parameter_definition_reply_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_reply_message_at = 0;
  do
  :: mm_parameter_definition_reply_message_at < 8 -> mm_parameter_definition_reply_message_record.message_id[mm_parameter_definition_reply_message_at] = wire[at]; at = at + 1; mm_parameter_definition_reply_message_at = mm_parameter_definition_reply_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_reply_message_record.status_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Mm Parameter Definition Reply Message is what was written, byte for byte */
inline equal_mm_parameter_definition_reply_message(mm_parameter_definition_reply_message_read, mm_parameter_definition_reply_message_written) {
  mm_parameter_definition_reply_message_at = 0;
  do
  :: mm_parameter_definition_reply_message_at < 4 -> assert(mm_parameter_definition_reply_message_read.badge[mm_parameter_definition_reply_message_at] == mm_parameter_definition_reply_message_written.badge[mm_parameter_definition_reply_message_at]); mm_parameter_definition_reply_message_at = mm_parameter_definition_reply_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_reply_message_at = 0;
  do
  :: mm_parameter_definition_reply_message_at < 8 -> assert(mm_parameter_definition_reply_message_read.message_id[mm_parameter_definition_reply_message_at] == mm_parameter_definition_reply_message_written.message_id[mm_parameter_definition_reply_message_at]); mm_parameter_definition_reply_message_at = mm_parameter_definition_reply_message_at + 1
  :: else -> break
  od;
  assert(mm_parameter_definition_reply_message_read.status_code == mm_parameter_definition_reply_message_written.status_code);
  skip
}

/* ---- Active Qp Self Replenishment Set Limit Reply Message: 30 bytes ---------- */

/* Acknowledgement message for Set Limit Message. Unsequenced. */
typedef ActiveQpSelfReplenishmentSetLimitReplyMessage {
  byte badge[4];
  byte message_id[8];
  byte underlying_symbol[13];
  byte set_value[4];
  byte status_code
};

int active_qp_self_replenishment_set_limit_reply_message_at;

/* every byte of Active Qp Self Replenishment Set Limit Reply Message set to one value */
inline fill_active_qp_self_replenishment_set_limit_reply_message(active_qp_self_replenishment_set_limit_reply_message_record, active_qp_self_replenishment_set_limit_reply_message_value) {
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 4 -> active_qp_self_replenishment_set_limit_reply_message_record.badge[active_qp_self_replenishment_set_limit_reply_message_at] = active_qp_self_replenishment_set_limit_reply_message_value; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 8 -> active_qp_self_replenishment_set_limit_reply_message_record.message_id[active_qp_self_replenishment_set_limit_reply_message_at] = active_qp_self_replenishment_set_limit_reply_message_value; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 13 -> active_qp_self_replenishment_set_limit_reply_message_record.underlying_symbol[active_qp_self_replenishment_set_limit_reply_message_at] = active_qp_self_replenishment_set_limit_reply_message_value; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 4 -> active_qp_self_replenishment_set_limit_reply_message_record.set_value[active_qp_self_replenishment_set_limit_reply_message_at] = active_qp_self_replenishment_set_limit_reply_message_value; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_record.status_code = active_qp_self_replenishment_set_limit_reply_message_value;
  skip
}

/* each byte of Active Qp Self Replenishment Set Limit Reply Message set to where it lies, so a field read out of place says so */
inline ramp_active_qp_self_replenishment_set_limit_reply_message(active_qp_self_replenishment_set_limit_reply_message_record, active_qp_self_replenishment_set_limit_reply_message_base) {
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 4 -> active_qp_self_replenishment_set_limit_reply_message_record.badge[active_qp_self_replenishment_set_limit_reply_message_at] = (active_qp_self_replenishment_set_limit_reply_message_base + 0 + active_qp_self_replenishment_set_limit_reply_message_at + 1) % 256; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 8 -> active_qp_self_replenishment_set_limit_reply_message_record.message_id[active_qp_self_replenishment_set_limit_reply_message_at] = (active_qp_self_replenishment_set_limit_reply_message_base + 4 + active_qp_self_replenishment_set_limit_reply_message_at + 1) % 256; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 13 -> active_qp_self_replenishment_set_limit_reply_message_record.underlying_symbol[active_qp_self_replenishment_set_limit_reply_message_at] = (active_qp_self_replenishment_set_limit_reply_message_base + 12 + active_qp_self_replenishment_set_limit_reply_message_at + 1) % 256; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 4 -> active_qp_self_replenishment_set_limit_reply_message_record.set_value[active_qp_self_replenishment_set_limit_reply_message_at] = (active_qp_self_replenishment_set_limit_reply_message_base + 25 + active_qp_self_replenishment_set_limit_reply_message_at + 1) % 256; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_record.status_code = (active_qp_self_replenishment_set_limit_reply_message_base + 29 + 1) % 256;
  skip
}

/* Active Qp Self Replenishment Set Limit Reply Message to the wire, 30 bytes from where the cursor stands */
inline encode_active_qp_self_replenishment_set_limit_reply_message(active_qp_self_replenishment_set_limit_reply_message_record) {
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 4 -> wire[at] = active_qp_self_replenishment_set_limit_reply_message_record.badge[active_qp_self_replenishment_set_limit_reply_message_at]; at = at + 1; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 8 -> wire[at] = active_qp_self_replenishment_set_limit_reply_message_record.message_id[active_qp_self_replenishment_set_limit_reply_message_at]; at = at + 1; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 13 -> wire[at] = active_qp_self_replenishment_set_limit_reply_message_record.underlying_symbol[active_qp_self_replenishment_set_limit_reply_message_at]; at = at + 1; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 4 -> wire[at] = active_qp_self_replenishment_set_limit_reply_message_record.set_value[active_qp_self_replenishment_set_limit_reply_message_at]; at = at + 1; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  wire[at] = active_qp_self_replenishment_set_limit_reply_message_record.status_code; at = at + 1;
  skip
}

/* Active Qp Self Replenishment Set Limit Reply Message off the wire, 30 bytes from where the cursor stands */
inline decode_active_qp_self_replenishment_set_limit_reply_message(active_qp_self_replenishment_set_limit_reply_message_record) {
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 4 -> active_qp_self_replenishment_set_limit_reply_message_record.badge[active_qp_self_replenishment_set_limit_reply_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 8 -> active_qp_self_replenishment_set_limit_reply_message_record.message_id[active_qp_self_replenishment_set_limit_reply_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 13 -> active_qp_self_replenishment_set_limit_reply_message_record.underlying_symbol[active_qp_self_replenishment_set_limit_reply_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 4 -> active_qp_self_replenishment_set_limit_reply_message_record.set_value[active_qp_self_replenishment_set_limit_reply_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_record.status_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Active Qp Self Replenishment Set Limit Reply Message is what was written, byte for byte */
inline equal_active_qp_self_replenishment_set_limit_reply_message(active_qp_self_replenishment_set_limit_reply_message_read, active_qp_self_replenishment_set_limit_reply_message_written) {
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 4 -> assert(active_qp_self_replenishment_set_limit_reply_message_read.badge[active_qp_self_replenishment_set_limit_reply_message_at] == active_qp_self_replenishment_set_limit_reply_message_written.badge[active_qp_self_replenishment_set_limit_reply_message_at]); active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 8 -> assert(active_qp_self_replenishment_set_limit_reply_message_read.message_id[active_qp_self_replenishment_set_limit_reply_message_at] == active_qp_self_replenishment_set_limit_reply_message_written.message_id[active_qp_self_replenishment_set_limit_reply_message_at]); active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 13 -> assert(active_qp_self_replenishment_set_limit_reply_message_read.underlying_symbol[active_qp_self_replenishment_set_limit_reply_message_at] == active_qp_self_replenishment_set_limit_reply_message_written.underlying_symbol[active_qp_self_replenishment_set_limit_reply_message_at]); active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_reply_message_at < 4 -> assert(active_qp_self_replenishment_set_limit_reply_message_read.set_value[active_qp_self_replenishment_set_limit_reply_message_at] == active_qp_self_replenishment_set_limit_reply_message_written.set_value[active_qp_self_replenishment_set_limit_reply_message_at]); active_qp_self_replenishment_set_limit_reply_message_at = active_qp_self_replenishment_set_limit_reply_message_at + 1
  :: else -> break
  od;
  assert(active_qp_self_replenishment_set_limit_reply_message_read.status_code == active_qp_self_replenishment_set_limit_reply_message_written.status_code);
  skip
}

/* ---- Underlying Purge Reply Message: 29 bytes -------------------------------- */

/* Underlying Purge Reply Message including SentTimestamp. Unsequenced. */
typedef UnderlyingPurgeReplyMessage {
  byte badge[4];
  byte message_id[8];
  byte sent_timestamp[8];
  byte status_code;
  byte sequence[8]
};

int underlying_purge_reply_message_at;

/* every byte of Underlying Purge Reply Message set to one value */
inline fill_underlying_purge_reply_message(underlying_purge_reply_message_record, underlying_purge_reply_message_value) {
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 4 -> underlying_purge_reply_message_record.badge[underlying_purge_reply_message_at] = underlying_purge_reply_message_value; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> underlying_purge_reply_message_record.message_id[underlying_purge_reply_message_at] = underlying_purge_reply_message_value; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> underlying_purge_reply_message_record.sent_timestamp[underlying_purge_reply_message_at] = underlying_purge_reply_message_value; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  underlying_purge_reply_message_record.status_code = underlying_purge_reply_message_value;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> underlying_purge_reply_message_record.sequence[underlying_purge_reply_message_at] = underlying_purge_reply_message_value; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Underlying Purge Reply Message set to where it lies, so a field read out of place says so */
inline ramp_underlying_purge_reply_message(underlying_purge_reply_message_record, underlying_purge_reply_message_base) {
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 4 -> underlying_purge_reply_message_record.badge[underlying_purge_reply_message_at] = (underlying_purge_reply_message_base + 0 + underlying_purge_reply_message_at + 1) % 256; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> underlying_purge_reply_message_record.message_id[underlying_purge_reply_message_at] = (underlying_purge_reply_message_base + 4 + underlying_purge_reply_message_at + 1) % 256; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> underlying_purge_reply_message_record.sent_timestamp[underlying_purge_reply_message_at] = (underlying_purge_reply_message_base + 12 + underlying_purge_reply_message_at + 1) % 256; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  underlying_purge_reply_message_record.status_code = (underlying_purge_reply_message_base + 20 + 1) % 256;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> underlying_purge_reply_message_record.sequence[underlying_purge_reply_message_at] = (underlying_purge_reply_message_base + 21 + underlying_purge_reply_message_at + 1) % 256; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Purge Reply Message to the wire, 29 bytes from where the cursor stands */
inline encode_underlying_purge_reply_message(underlying_purge_reply_message_record) {
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 4 -> wire[at] = underlying_purge_reply_message_record.badge[underlying_purge_reply_message_at]; at = at + 1; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> wire[at] = underlying_purge_reply_message_record.message_id[underlying_purge_reply_message_at]; at = at + 1; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> wire[at] = underlying_purge_reply_message_record.sent_timestamp[underlying_purge_reply_message_at]; at = at + 1; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_purge_reply_message_record.status_code; at = at + 1;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> wire[at] = underlying_purge_reply_message_record.sequence[underlying_purge_reply_message_at]; at = at + 1; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Purge Reply Message off the wire, 29 bytes from where the cursor stands */
inline decode_underlying_purge_reply_message(underlying_purge_reply_message_record) {
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 4 -> underlying_purge_reply_message_record.badge[underlying_purge_reply_message_at] = wire[at]; at = at + 1; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> underlying_purge_reply_message_record.message_id[underlying_purge_reply_message_at] = wire[at]; at = at + 1; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> underlying_purge_reply_message_record.sent_timestamp[underlying_purge_reply_message_at] = wire[at]; at = at + 1; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  underlying_purge_reply_message_record.status_code = wire[at]; at = at + 1;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> underlying_purge_reply_message_record.sequence[underlying_purge_reply_message_at] = wire[at]; at = at + 1; underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Underlying Purge Reply Message is what was written, byte for byte */
inline equal_underlying_purge_reply_message(underlying_purge_reply_message_read, underlying_purge_reply_message_written) {
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 4 -> assert(underlying_purge_reply_message_read.badge[underlying_purge_reply_message_at] == underlying_purge_reply_message_written.badge[underlying_purge_reply_message_at]); underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> assert(underlying_purge_reply_message_read.message_id[underlying_purge_reply_message_at] == underlying_purge_reply_message_written.message_id[underlying_purge_reply_message_at]); underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> assert(underlying_purge_reply_message_read.sent_timestamp[underlying_purge_reply_message_at] == underlying_purge_reply_message_written.sent_timestamp[underlying_purge_reply_message_at]); underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  assert(underlying_purge_reply_message_read.status_code == underlying_purge_reply_message_written.status_code);
  underlying_purge_reply_message_at = 0;
  do
  :: underlying_purge_reply_message_at < 8 -> assert(underlying_purge_reply_message_read.sequence[underlying_purge_reply_message_at] == underlying_purge_reply_message_written.sequence[underlying_purge_reply_message_at]); underlying_purge_reply_message_at = underlying_purge_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Reentry Reply Message: 21 bytes ---------------------------------- */

/* Market Reentry Reply Message. Unsequenced. */
typedef MarketReentryReplyMessage {
  byte badge[4];
  byte message_id[8];
  byte status_code;
  byte reserved_8[8]
};

int market_reentry_reply_message_at;

/* every byte of Market Reentry Reply Message set to one value */
inline fill_market_reentry_reply_message(market_reentry_reply_message_record, market_reentry_reply_message_value) {
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 4 -> market_reentry_reply_message_record.badge[market_reentry_reply_message_at] = market_reentry_reply_message_value; market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 8 -> market_reentry_reply_message_record.message_id[market_reentry_reply_message_at] = market_reentry_reply_message_value; market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  market_reentry_reply_message_record.status_code = market_reentry_reply_message_value;
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 8 -> market_reentry_reply_message_record.reserved_8[market_reentry_reply_message_at] = market_reentry_reply_message_value; market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Reentry Reply Message set to where it lies, so a field read out of place says so */
inline ramp_market_reentry_reply_message(market_reentry_reply_message_record, market_reentry_reply_message_base) {
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 4 -> market_reentry_reply_message_record.badge[market_reentry_reply_message_at] = (market_reentry_reply_message_base + 0 + market_reentry_reply_message_at + 1) % 256; market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 8 -> market_reentry_reply_message_record.message_id[market_reentry_reply_message_at] = (market_reentry_reply_message_base + 4 + market_reentry_reply_message_at + 1) % 256; market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  market_reentry_reply_message_record.status_code = (market_reentry_reply_message_base + 12 + 1) % 256;
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 8 -> market_reentry_reply_message_record.reserved_8[market_reentry_reply_message_at] = (market_reentry_reply_message_base + 13 + market_reentry_reply_message_at + 1) % 256; market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Reentry Reply Message to the wire, 21 bytes from where the cursor stands */
inline encode_market_reentry_reply_message(market_reentry_reply_message_record) {
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 4 -> wire[at] = market_reentry_reply_message_record.badge[market_reentry_reply_message_at]; at = at + 1; market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 8 -> wire[at] = market_reentry_reply_message_record.message_id[market_reentry_reply_message_at]; at = at + 1; market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  wire[at] = market_reentry_reply_message_record.status_code; at = at + 1;
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 8 -> wire[at] = market_reentry_reply_message_record.reserved_8[market_reentry_reply_message_at]; at = at + 1; market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Reentry Reply Message off the wire, 21 bytes from where the cursor stands */
inline decode_market_reentry_reply_message(market_reentry_reply_message_record) {
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 4 -> market_reentry_reply_message_record.badge[market_reentry_reply_message_at] = wire[at]; at = at + 1; market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 8 -> market_reentry_reply_message_record.message_id[market_reentry_reply_message_at] = wire[at]; at = at + 1; market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  market_reentry_reply_message_record.status_code = wire[at]; at = at + 1;
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 8 -> market_reentry_reply_message_record.reserved_8[market_reentry_reply_message_at] = wire[at]; at = at + 1; market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Reentry Reply Message is what was written, byte for byte */
inline equal_market_reentry_reply_message(market_reentry_reply_message_read, market_reentry_reply_message_written) {
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 4 -> assert(market_reentry_reply_message_read.badge[market_reentry_reply_message_at] == market_reentry_reply_message_written.badge[market_reentry_reply_message_at]); market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 8 -> assert(market_reentry_reply_message_read.message_id[market_reentry_reply_message_at] == market_reentry_reply_message_written.message_id[market_reentry_reply_message_at]); market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  assert(market_reentry_reply_message_read.status_code == market_reentry_reply_message_written.status_code);
  market_reentry_reply_message_at = 0;
  do
  :: market_reentry_reply_message_at < 8 -> assert(market_reentry_reply_message_read.reserved_8[market_reentry_reply_message_at] == market_reentry_reply_message_written.reserved_8[market_reentry_reply_message_at]); market_reentry_reply_message_at = market_reentry_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Active Qp Self Replenishment Request Reentry Reply Message: 38 bytes ---- */

/* Acknowledgement for the ActiveQP Request/Reentry Message. Unsequenced. */
typedef ActiveQpSelfReplenishmentRequestReentryReplyMessage {
  byte badge[4];
  byte message_id[8];
  byte underlying_symbol[13];
  byte status_code;
  byte requested_replenishment_value[4];
  byte active_counter_value[4];
  byte set_contract_limit[4]
};

int active_qp_self_replenishment_request_reentry_reply_message_at;

/* every byte of Active Qp Self Replenishment Request Reentry Reply Message set to one value */
inline fill_active_qp_self_replenishment_request_reentry_reply_message(active_qp_self_replenishment_request_reentry_reply_message_record, active_qp_self_replenishment_request_reentry_reply_message_value) {
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> active_qp_self_replenishment_request_reentry_reply_message_record.badge[active_qp_self_replenishment_request_reentry_reply_message_at] = active_qp_self_replenishment_request_reentry_reply_message_value; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 8 -> active_qp_self_replenishment_request_reentry_reply_message_record.message_id[active_qp_self_replenishment_request_reentry_reply_message_at] = active_qp_self_replenishment_request_reentry_reply_message_value; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 13 -> active_qp_self_replenishment_request_reentry_reply_message_record.underlying_symbol[active_qp_self_replenishment_request_reentry_reply_message_at] = active_qp_self_replenishment_request_reentry_reply_message_value; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_record.status_code = active_qp_self_replenishment_request_reentry_reply_message_value;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> active_qp_self_replenishment_request_reentry_reply_message_record.requested_replenishment_value[active_qp_self_replenishment_request_reentry_reply_message_at] = active_qp_self_replenishment_request_reentry_reply_message_value; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> active_qp_self_replenishment_request_reentry_reply_message_record.active_counter_value[active_qp_self_replenishment_request_reentry_reply_message_at] = active_qp_self_replenishment_request_reentry_reply_message_value; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> active_qp_self_replenishment_request_reentry_reply_message_record.set_contract_limit[active_qp_self_replenishment_request_reentry_reply_message_at] = active_qp_self_replenishment_request_reentry_reply_message_value; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Active Qp Self Replenishment Request Reentry Reply Message set to where it lies, so a field read out of place says so */
inline ramp_active_qp_self_replenishment_request_reentry_reply_message(active_qp_self_replenishment_request_reentry_reply_message_record, active_qp_self_replenishment_request_reentry_reply_message_base) {
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> active_qp_self_replenishment_request_reentry_reply_message_record.badge[active_qp_self_replenishment_request_reentry_reply_message_at] = (active_qp_self_replenishment_request_reentry_reply_message_base + 0 + active_qp_self_replenishment_request_reentry_reply_message_at + 1) % 256; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 8 -> active_qp_self_replenishment_request_reentry_reply_message_record.message_id[active_qp_self_replenishment_request_reentry_reply_message_at] = (active_qp_self_replenishment_request_reentry_reply_message_base + 4 + active_qp_self_replenishment_request_reentry_reply_message_at + 1) % 256; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 13 -> active_qp_self_replenishment_request_reentry_reply_message_record.underlying_symbol[active_qp_self_replenishment_request_reentry_reply_message_at] = (active_qp_self_replenishment_request_reentry_reply_message_base + 12 + active_qp_self_replenishment_request_reentry_reply_message_at + 1) % 256; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_record.status_code = (active_qp_self_replenishment_request_reentry_reply_message_base + 25 + 1) % 256;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> active_qp_self_replenishment_request_reentry_reply_message_record.requested_replenishment_value[active_qp_self_replenishment_request_reentry_reply_message_at] = (active_qp_self_replenishment_request_reentry_reply_message_base + 26 + active_qp_self_replenishment_request_reentry_reply_message_at + 1) % 256; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> active_qp_self_replenishment_request_reentry_reply_message_record.active_counter_value[active_qp_self_replenishment_request_reentry_reply_message_at] = (active_qp_self_replenishment_request_reentry_reply_message_base + 30 + active_qp_self_replenishment_request_reentry_reply_message_at + 1) % 256; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> active_qp_self_replenishment_request_reentry_reply_message_record.set_contract_limit[active_qp_self_replenishment_request_reentry_reply_message_at] = (active_qp_self_replenishment_request_reentry_reply_message_base + 34 + active_qp_self_replenishment_request_reentry_reply_message_at + 1) % 256; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Qp Self Replenishment Request Reentry Reply Message to the wire, 38 bytes from where the cursor stands */
inline encode_active_qp_self_replenishment_request_reentry_reply_message(active_qp_self_replenishment_request_reentry_reply_message_record) {
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> wire[at] = active_qp_self_replenishment_request_reentry_reply_message_record.badge[active_qp_self_replenishment_request_reentry_reply_message_at]; at = at + 1; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 8 -> wire[at] = active_qp_self_replenishment_request_reentry_reply_message_record.message_id[active_qp_self_replenishment_request_reentry_reply_message_at]; at = at + 1; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 13 -> wire[at] = active_qp_self_replenishment_request_reentry_reply_message_record.underlying_symbol[active_qp_self_replenishment_request_reentry_reply_message_at]; at = at + 1; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  wire[at] = active_qp_self_replenishment_request_reentry_reply_message_record.status_code; at = at + 1;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> wire[at] = active_qp_self_replenishment_request_reentry_reply_message_record.requested_replenishment_value[active_qp_self_replenishment_request_reentry_reply_message_at]; at = at + 1; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> wire[at] = active_qp_self_replenishment_request_reentry_reply_message_record.active_counter_value[active_qp_self_replenishment_request_reentry_reply_message_at]; at = at + 1; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> wire[at] = active_qp_self_replenishment_request_reentry_reply_message_record.set_contract_limit[active_qp_self_replenishment_request_reentry_reply_message_at]; at = at + 1; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Qp Self Replenishment Request Reentry Reply Message off the wire, 38 bytes from where the cursor stands */
inline decode_active_qp_self_replenishment_request_reentry_reply_message(active_qp_self_replenishment_request_reentry_reply_message_record) {
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> active_qp_self_replenishment_request_reentry_reply_message_record.badge[active_qp_self_replenishment_request_reentry_reply_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 8 -> active_qp_self_replenishment_request_reentry_reply_message_record.message_id[active_qp_self_replenishment_request_reentry_reply_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 13 -> active_qp_self_replenishment_request_reentry_reply_message_record.underlying_symbol[active_qp_self_replenishment_request_reentry_reply_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_record.status_code = wire[at]; at = at + 1;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> active_qp_self_replenishment_request_reentry_reply_message_record.requested_replenishment_value[active_qp_self_replenishment_request_reentry_reply_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> active_qp_self_replenishment_request_reentry_reply_message_record.active_counter_value[active_qp_self_replenishment_request_reentry_reply_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> active_qp_self_replenishment_request_reentry_reply_message_record.set_contract_limit[active_qp_self_replenishment_request_reentry_reply_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Active Qp Self Replenishment Request Reentry Reply Message is what was written, byte for byte */
inline equal_active_qp_self_replenishment_request_reentry_reply_message(active_qp_self_replenishment_request_reentry_reply_message_read, active_qp_self_replenishment_request_reentry_reply_message_written) {
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> assert(active_qp_self_replenishment_request_reentry_reply_message_read.badge[active_qp_self_replenishment_request_reentry_reply_message_at] == active_qp_self_replenishment_request_reentry_reply_message_written.badge[active_qp_self_replenishment_request_reentry_reply_message_at]); active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 8 -> assert(active_qp_self_replenishment_request_reentry_reply_message_read.message_id[active_qp_self_replenishment_request_reentry_reply_message_at] == active_qp_self_replenishment_request_reentry_reply_message_written.message_id[active_qp_self_replenishment_request_reentry_reply_message_at]); active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 13 -> assert(active_qp_self_replenishment_request_reentry_reply_message_read.underlying_symbol[active_qp_self_replenishment_request_reentry_reply_message_at] == active_qp_self_replenishment_request_reentry_reply_message_written.underlying_symbol[active_qp_self_replenishment_request_reentry_reply_message_at]); active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  assert(active_qp_self_replenishment_request_reentry_reply_message_read.status_code == active_qp_self_replenishment_request_reentry_reply_message_written.status_code);
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> assert(active_qp_self_replenishment_request_reentry_reply_message_read.requested_replenishment_value[active_qp_self_replenishment_request_reentry_reply_message_at] == active_qp_self_replenishment_request_reentry_reply_message_written.requested_replenishment_value[active_qp_self_replenishment_request_reentry_reply_message_at]); active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> assert(active_qp_self_replenishment_request_reentry_reply_message_read.active_counter_value[active_qp_self_replenishment_request_reentry_reply_message_at] == active_qp_self_replenishment_request_reentry_reply_message_written.active_counter_value[active_qp_self_replenishment_request_reentry_reply_message_at]); active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_reply_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_reply_message_at < 4 -> assert(active_qp_self_replenishment_request_reentry_reply_message_read.set_contract_limit[active_qp_self_replenishment_request_reentry_reply_message_at] == active_qp_self_replenishment_request_reentry_reply_message_written.set_contract_limit[active_qp_self_replenishment_request_reentry_reply_message_at]); active_qp_self_replenishment_request_reentry_reply_message_at = active_qp_self_replenishment_request_reentry_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Purge Notification Message: 49 bytes ------------------------- */

/* Informs the firm that its quotes for a given simple or complex instrument have been purged. Unsequenced. */
typedef InstrumentPurgeNotificationMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte badge[4];
  byte message_id[8];
  byte instrument_id[4];
  byte purge_reason;
  byte sequence[8];
  byte reserved_16[16]
};

int instrument_purge_notification_message_at;

/* every byte of Instrument Purge Notification Message set to one value */
inline fill_instrument_purge_notification_message(instrument_purge_notification_message_record, instrument_purge_notification_message_value) {
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> instrument_purge_notification_message_record.seconds[instrument_purge_notification_message_at] = instrument_purge_notification_message_value; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> instrument_purge_notification_message_record.nanoseconds[instrument_purge_notification_message_at] = instrument_purge_notification_message_value; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> instrument_purge_notification_message_record.badge[instrument_purge_notification_message_at] = instrument_purge_notification_message_value; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 8 -> instrument_purge_notification_message_record.message_id[instrument_purge_notification_message_at] = instrument_purge_notification_message_value; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> instrument_purge_notification_message_record.instrument_id[instrument_purge_notification_message_at] = instrument_purge_notification_message_value; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_record.purge_reason = instrument_purge_notification_message_value;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 8 -> instrument_purge_notification_message_record.sequence[instrument_purge_notification_message_at] = instrument_purge_notification_message_value; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 16 -> instrument_purge_notification_message_record.reserved_16[instrument_purge_notification_message_at] = instrument_purge_notification_message_value; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Purge Notification Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_purge_notification_message(instrument_purge_notification_message_record, instrument_purge_notification_message_base) {
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> instrument_purge_notification_message_record.seconds[instrument_purge_notification_message_at] = (instrument_purge_notification_message_base + 0 + instrument_purge_notification_message_at + 1) % 256; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> instrument_purge_notification_message_record.nanoseconds[instrument_purge_notification_message_at] = (instrument_purge_notification_message_base + 4 + instrument_purge_notification_message_at + 1) % 256; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> instrument_purge_notification_message_record.badge[instrument_purge_notification_message_at] = (instrument_purge_notification_message_base + 8 + instrument_purge_notification_message_at + 1) % 256; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 8 -> instrument_purge_notification_message_record.message_id[instrument_purge_notification_message_at] = (instrument_purge_notification_message_base + 12 + instrument_purge_notification_message_at + 1) % 256; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> instrument_purge_notification_message_record.instrument_id[instrument_purge_notification_message_at] = (instrument_purge_notification_message_base + 20 + instrument_purge_notification_message_at + 1) % 256; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_record.purge_reason = (instrument_purge_notification_message_base + 24 + 1) % 256;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 8 -> instrument_purge_notification_message_record.sequence[instrument_purge_notification_message_at] = (instrument_purge_notification_message_base + 25 + instrument_purge_notification_message_at + 1) % 256; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 16 -> instrument_purge_notification_message_record.reserved_16[instrument_purge_notification_message_at] = (instrument_purge_notification_message_base + 33 + instrument_purge_notification_message_at + 1) % 256; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Purge Notification Message to the wire, 49 bytes from where the cursor stands */
inline encode_instrument_purge_notification_message(instrument_purge_notification_message_record) {
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> wire[at] = instrument_purge_notification_message_record.seconds[instrument_purge_notification_message_at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> wire[at] = instrument_purge_notification_message_record.nanoseconds[instrument_purge_notification_message_at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> wire[at] = instrument_purge_notification_message_record.badge[instrument_purge_notification_message_at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 8 -> wire[at] = instrument_purge_notification_message_record.message_id[instrument_purge_notification_message_at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> wire[at] = instrument_purge_notification_message_record.instrument_id[instrument_purge_notification_message_at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_purge_notification_message_record.purge_reason; at = at + 1;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 8 -> wire[at] = instrument_purge_notification_message_record.sequence[instrument_purge_notification_message_at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 16 -> wire[at] = instrument_purge_notification_message_record.reserved_16[instrument_purge_notification_message_at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Purge Notification Message off the wire, 49 bytes from where the cursor stands */
inline decode_instrument_purge_notification_message(instrument_purge_notification_message_record) {
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> instrument_purge_notification_message_record.seconds[instrument_purge_notification_message_at] = wire[at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> instrument_purge_notification_message_record.nanoseconds[instrument_purge_notification_message_at] = wire[at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> instrument_purge_notification_message_record.badge[instrument_purge_notification_message_at] = wire[at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 8 -> instrument_purge_notification_message_record.message_id[instrument_purge_notification_message_at] = wire[at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> instrument_purge_notification_message_record.instrument_id[instrument_purge_notification_message_at] = wire[at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_record.purge_reason = wire[at]; at = at + 1;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 8 -> instrument_purge_notification_message_record.sequence[instrument_purge_notification_message_at] = wire[at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 16 -> instrument_purge_notification_message_record.reserved_16[instrument_purge_notification_message_at] = wire[at]; at = at + 1; instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Purge Notification Message is what was written, byte for byte */
inline equal_instrument_purge_notification_message(instrument_purge_notification_message_read, instrument_purge_notification_message_written) {
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> assert(instrument_purge_notification_message_read.seconds[instrument_purge_notification_message_at] == instrument_purge_notification_message_written.seconds[instrument_purge_notification_message_at]); instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> assert(instrument_purge_notification_message_read.nanoseconds[instrument_purge_notification_message_at] == instrument_purge_notification_message_written.nanoseconds[instrument_purge_notification_message_at]); instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> assert(instrument_purge_notification_message_read.badge[instrument_purge_notification_message_at] == instrument_purge_notification_message_written.badge[instrument_purge_notification_message_at]); instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 8 -> assert(instrument_purge_notification_message_read.message_id[instrument_purge_notification_message_at] == instrument_purge_notification_message_written.message_id[instrument_purge_notification_message_at]); instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 4 -> assert(instrument_purge_notification_message_read.instrument_id[instrument_purge_notification_message_at] == instrument_purge_notification_message_written.instrument_id[instrument_purge_notification_message_at]); instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  assert(instrument_purge_notification_message_read.purge_reason == instrument_purge_notification_message_written.purge_reason);
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 8 -> assert(instrument_purge_notification_message_read.sequence[instrument_purge_notification_message_at] == instrument_purge_notification_message_written.sequence[instrument_purge_notification_message_at]); instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  instrument_purge_notification_message_at = 0;
  do
  :: instrument_purge_notification_message_at < 16 -> assert(instrument_purge_notification_message_read.reserved_16[instrument_purge_notification_message_at] == instrument_purge_notification_message_written.reserved_16[instrument_purge_notification_message_at]); instrument_purge_notification_message_at = instrument_purge_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Underlying Purge Notification Message: 42 bytes ------------------------- */

/* Informs the firm that all the quotes for instruments associated with the given underlying have been purged (user request, Rapid Fire/ActiveQP risk protection or Kill-Switch). Unsequenced. */
typedef UnderlyingPurgeNotificationMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte badge[4];
  byte underlying[13];
  byte purge_reason;
  byte message_id[8];
  byte sequence[8]
};

int underlying_purge_notification_message_at;

/* every byte of Underlying Purge Notification Message set to one value */
inline fill_underlying_purge_notification_message(underlying_purge_notification_message_record, underlying_purge_notification_message_value) {
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> underlying_purge_notification_message_record.seconds[underlying_purge_notification_message_at] = underlying_purge_notification_message_value; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> underlying_purge_notification_message_record.nanoseconds[underlying_purge_notification_message_at] = underlying_purge_notification_message_value; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> underlying_purge_notification_message_record.badge[underlying_purge_notification_message_at] = underlying_purge_notification_message_value; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 13 -> underlying_purge_notification_message_record.underlying[underlying_purge_notification_message_at] = underlying_purge_notification_message_value; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_record.purge_reason = underlying_purge_notification_message_value;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 8 -> underlying_purge_notification_message_record.message_id[underlying_purge_notification_message_at] = underlying_purge_notification_message_value; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 8 -> underlying_purge_notification_message_record.sequence[underlying_purge_notification_message_at] = underlying_purge_notification_message_value; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Underlying Purge Notification Message set to where it lies, so a field read out of place says so */
inline ramp_underlying_purge_notification_message(underlying_purge_notification_message_record, underlying_purge_notification_message_base) {
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> underlying_purge_notification_message_record.seconds[underlying_purge_notification_message_at] = (underlying_purge_notification_message_base + 0 + underlying_purge_notification_message_at + 1) % 256; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> underlying_purge_notification_message_record.nanoseconds[underlying_purge_notification_message_at] = (underlying_purge_notification_message_base + 4 + underlying_purge_notification_message_at + 1) % 256; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> underlying_purge_notification_message_record.badge[underlying_purge_notification_message_at] = (underlying_purge_notification_message_base + 8 + underlying_purge_notification_message_at + 1) % 256; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 13 -> underlying_purge_notification_message_record.underlying[underlying_purge_notification_message_at] = (underlying_purge_notification_message_base + 12 + underlying_purge_notification_message_at + 1) % 256; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_record.purge_reason = (underlying_purge_notification_message_base + 25 + 1) % 256;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 8 -> underlying_purge_notification_message_record.message_id[underlying_purge_notification_message_at] = (underlying_purge_notification_message_base + 26 + underlying_purge_notification_message_at + 1) % 256; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 8 -> underlying_purge_notification_message_record.sequence[underlying_purge_notification_message_at] = (underlying_purge_notification_message_base + 34 + underlying_purge_notification_message_at + 1) % 256; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Purge Notification Message to the wire, 42 bytes from where the cursor stands */
inline encode_underlying_purge_notification_message(underlying_purge_notification_message_record) {
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> wire[at] = underlying_purge_notification_message_record.seconds[underlying_purge_notification_message_at]; at = at + 1; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> wire[at] = underlying_purge_notification_message_record.nanoseconds[underlying_purge_notification_message_at]; at = at + 1; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> wire[at] = underlying_purge_notification_message_record.badge[underlying_purge_notification_message_at]; at = at + 1; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 13 -> wire[at] = underlying_purge_notification_message_record.underlying[underlying_purge_notification_message_at]; at = at + 1; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_purge_notification_message_record.purge_reason; at = at + 1;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 8 -> wire[at] = underlying_purge_notification_message_record.message_id[underlying_purge_notification_message_at]; at = at + 1; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 8 -> wire[at] = underlying_purge_notification_message_record.sequence[underlying_purge_notification_message_at]; at = at + 1; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Purge Notification Message off the wire, 42 bytes from where the cursor stands */
inline decode_underlying_purge_notification_message(underlying_purge_notification_message_record) {
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> underlying_purge_notification_message_record.seconds[underlying_purge_notification_message_at] = wire[at]; at = at + 1; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> underlying_purge_notification_message_record.nanoseconds[underlying_purge_notification_message_at] = wire[at]; at = at + 1; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> underlying_purge_notification_message_record.badge[underlying_purge_notification_message_at] = wire[at]; at = at + 1; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 13 -> underlying_purge_notification_message_record.underlying[underlying_purge_notification_message_at] = wire[at]; at = at + 1; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_record.purge_reason = wire[at]; at = at + 1;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 8 -> underlying_purge_notification_message_record.message_id[underlying_purge_notification_message_at] = wire[at]; at = at + 1; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 8 -> underlying_purge_notification_message_record.sequence[underlying_purge_notification_message_at] = wire[at]; at = at + 1; underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Underlying Purge Notification Message is what was written, byte for byte */
inline equal_underlying_purge_notification_message(underlying_purge_notification_message_read, underlying_purge_notification_message_written) {
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> assert(underlying_purge_notification_message_read.seconds[underlying_purge_notification_message_at] == underlying_purge_notification_message_written.seconds[underlying_purge_notification_message_at]); underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> assert(underlying_purge_notification_message_read.nanoseconds[underlying_purge_notification_message_at] == underlying_purge_notification_message_written.nanoseconds[underlying_purge_notification_message_at]); underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 4 -> assert(underlying_purge_notification_message_read.badge[underlying_purge_notification_message_at] == underlying_purge_notification_message_written.badge[underlying_purge_notification_message_at]); underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 13 -> assert(underlying_purge_notification_message_read.underlying[underlying_purge_notification_message_at] == underlying_purge_notification_message_written.underlying[underlying_purge_notification_message_at]); underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  assert(underlying_purge_notification_message_read.purge_reason == underlying_purge_notification_message_written.purge_reason);
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 8 -> assert(underlying_purge_notification_message_read.message_id[underlying_purge_notification_message_at] == underlying_purge_notification_message_written.message_id[underlying_purge_notification_message_at]); underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  underlying_purge_notification_message_at = 0;
  do
  :: underlying_purge_notification_message_at < 8 -> assert(underlying_purge_notification_message_read.sequence[underlying_purge_notification_message_at] == underlying_purge_notification_message_written.sequence[underlying_purge_notification_message_at]); underlying_purge_notification_message_at = underlying_purge_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Reentry Notification Message: 42 bytes --------------------------- */

/* Informs that risk protection triggered by rapid fire/purge has been reset for the specified scope. Unsequenced. */
typedef MarketReentryNotificationMessage {
  byte seconds[4];
  byte nanoseconds[4];
  byte badge[4];
  byte underlying_symbol[13];
  byte reentry_scope;
  byte message_id[8];
  byte reserved_8[8]
};

int market_reentry_notification_message_at;

/* every byte of Market Reentry Notification Message set to one value */
inline fill_market_reentry_notification_message(market_reentry_notification_message_record, market_reentry_notification_message_value) {
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> market_reentry_notification_message_record.seconds[market_reentry_notification_message_at] = market_reentry_notification_message_value; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> market_reentry_notification_message_record.nanoseconds[market_reentry_notification_message_at] = market_reentry_notification_message_value; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> market_reentry_notification_message_record.badge[market_reentry_notification_message_at] = market_reentry_notification_message_value; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 13 -> market_reentry_notification_message_record.underlying_symbol[market_reentry_notification_message_at] = market_reentry_notification_message_value; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_record.reentry_scope = market_reentry_notification_message_value;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 8 -> market_reentry_notification_message_record.message_id[market_reentry_notification_message_at] = market_reentry_notification_message_value; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 8 -> market_reentry_notification_message_record.reserved_8[market_reentry_notification_message_at] = market_reentry_notification_message_value; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Reentry Notification Message set to where it lies, so a field read out of place says so */
inline ramp_market_reentry_notification_message(market_reentry_notification_message_record, market_reentry_notification_message_base) {
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> market_reentry_notification_message_record.seconds[market_reentry_notification_message_at] = (market_reentry_notification_message_base + 0 + market_reentry_notification_message_at + 1) % 256; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> market_reentry_notification_message_record.nanoseconds[market_reentry_notification_message_at] = (market_reentry_notification_message_base + 4 + market_reentry_notification_message_at + 1) % 256; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> market_reentry_notification_message_record.badge[market_reentry_notification_message_at] = (market_reentry_notification_message_base + 8 + market_reentry_notification_message_at + 1) % 256; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 13 -> market_reentry_notification_message_record.underlying_symbol[market_reentry_notification_message_at] = (market_reentry_notification_message_base + 12 + market_reentry_notification_message_at + 1) % 256; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_record.reentry_scope = (market_reentry_notification_message_base + 25 + 1) % 256;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 8 -> market_reentry_notification_message_record.message_id[market_reentry_notification_message_at] = (market_reentry_notification_message_base + 26 + market_reentry_notification_message_at + 1) % 256; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 8 -> market_reentry_notification_message_record.reserved_8[market_reentry_notification_message_at] = (market_reentry_notification_message_base + 34 + market_reentry_notification_message_at + 1) % 256; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Reentry Notification Message to the wire, 42 bytes from where the cursor stands */
inline encode_market_reentry_notification_message(market_reentry_notification_message_record) {
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> wire[at] = market_reentry_notification_message_record.seconds[market_reentry_notification_message_at]; at = at + 1; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> wire[at] = market_reentry_notification_message_record.nanoseconds[market_reentry_notification_message_at]; at = at + 1; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> wire[at] = market_reentry_notification_message_record.badge[market_reentry_notification_message_at]; at = at + 1; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 13 -> wire[at] = market_reentry_notification_message_record.underlying_symbol[market_reentry_notification_message_at]; at = at + 1; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = market_reentry_notification_message_record.reentry_scope; at = at + 1;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 8 -> wire[at] = market_reentry_notification_message_record.message_id[market_reentry_notification_message_at]; at = at + 1; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 8 -> wire[at] = market_reentry_notification_message_record.reserved_8[market_reentry_notification_message_at]; at = at + 1; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Reentry Notification Message off the wire, 42 bytes from where the cursor stands */
inline decode_market_reentry_notification_message(market_reentry_notification_message_record) {
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> market_reentry_notification_message_record.seconds[market_reentry_notification_message_at] = wire[at]; at = at + 1; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> market_reentry_notification_message_record.nanoseconds[market_reentry_notification_message_at] = wire[at]; at = at + 1; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> market_reentry_notification_message_record.badge[market_reentry_notification_message_at] = wire[at]; at = at + 1; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 13 -> market_reentry_notification_message_record.underlying_symbol[market_reentry_notification_message_at] = wire[at]; at = at + 1; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_record.reentry_scope = wire[at]; at = at + 1;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 8 -> market_reentry_notification_message_record.message_id[market_reentry_notification_message_at] = wire[at]; at = at + 1; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 8 -> market_reentry_notification_message_record.reserved_8[market_reentry_notification_message_at] = wire[at]; at = at + 1; market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Reentry Notification Message is what was written, byte for byte */
inline equal_market_reentry_notification_message(market_reentry_notification_message_read, market_reentry_notification_message_written) {
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> assert(market_reentry_notification_message_read.seconds[market_reentry_notification_message_at] == market_reentry_notification_message_written.seconds[market_reentry_notification_message_at]); market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> assert(market_reentry_notification_message_read.nanoseconds[market_reentry_notification_message_at] == market_reentry_notification_message_written.nanoseconds[market_reentry_notification_message_at]); market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 4 -> assert(market_reentry_notification_message_read.badge[market_reentry_notification_message_at] == market_reentry_notification_message_written.badge[market_reentry_notification_message_at]); market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 13 -> assert(market_reentry_notification_message_read.underlying_symbol[market_reentry_notification_message_at] == market_reentry_notification_message_written.underlying_symbol[market_reentry_notification_message_at]); market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  assert(market_reentry_notification_message_read.reentry_scope == market_reentry_notification_message_written.reentry_scope);
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 8 -> assert(market_reentry_notification_message_read.message_id[market_reentry_notification_message_at] == market_reentry_notification_message_written.message_id[market_reentry_notification_message_at]); market_reentry_notification_message_at = market_reentry_notification_message_at + 1
  :: else -> break
  od;
  market_reentry_notification_message_at = 0;
  do
  :: market_reentry_notification_message_at < 8 -> assert(market_reentry_notification_message_read.reserved_8[market_reentry_notification_message_at] == market_reentry_notification_message_written.reserved_8[market_reentry_notification_message_at]); market_reentry_notification_message_at = market_reentry_notification_message_at + 1
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

/* Msar Accept Message: encoded, read back, and compared */
proctype check_msar_accept_message() {
  MsarAcceptMessage msar_accept_message_sent;
  MsarAcceptMessage msar_accept_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_msar_accept_message(msar_accept_message_sent, 0)
  :: pattern == 1 -> fill_msar_accept_message(msar_accept_message_sent, 32)
  :: pattern == 2 -> fill_msar_accept_message(msar_accept_message_sent, 255)
  :: else -> ramp_msar_accept_message(msar_accept_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_msar_accept_message(msar_accept_message_sent);
    assert(at == 30);
    at = 0;
    decode_msar_accept_message(msar_accept_message_got);
    assert(at == 30);
    equal_msar_accept_message(msar_accept_message_got, msar_accept_message_sent)
  }
}

/* Msar Reject Message: encoded, read back, and compared */
proctype check_msar_reject_message() {
  MsarRejectMessage msar_reject_message_sent;
  MsarRejectMessage msar_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_msar_reject_message(msar_reject_message_sent, 0)
  :: pattern == 1 -> fill_msar_reject_message(msar_reject_message_sent, 32)
  :: pattern == 2 -> fill_msar_reject_message(msar_reject_message_sent, 255)
  :: else -> ramp_msar_reject_message(msar_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_msar_reject_message(msar_reject_message_sent);
    assert(at == 13);
    at = 0;
    decode_msar_reject_message(msar_reject_message_got);
    assert(at == 13);
    equal_msar_reject_message(msar_reject_message_got, msar_reject_message_sent)
  }
}

/* Complex Msar Accept Message: encoded, read back, and compared */
proctype check_complex_msar_accept_message() {
  ComplexMsarAcceptMessage complex_msar_accept_message_sent;
  ComplexMsarAcceptMessage complex_msar_accept_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_msar_accept_message(complex_msar_accept_message_sent, 0)
  :: pattern == 1 -> fill_complex_msar_accept_message(complex_msar_accept_message_sent, 32)
  :: pattern == 2 -> fill_complex_msar_accept_message(complex_msar_accept_message_sent, 255)
  :: else -> ramp_complex_msar_accept_message(complex_msar_accept_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_msar_accept_message(complex_msar_accept_message_sent);
    assert(at == 35);
    at = 0;
    decode_complex_msar_accept_message(complex_msar_accept_message_got);
    assert(at == 35);
    equal_complex_msar_accept_message(complex_msar_accept_message_got, complex_msar_accept_message_sent)
  }
}

/* Complex Msar Reject Message: encoded, read back, and compared */
proctype check_complex_msar_reject_message() {
  ComplexMsarRejectMessage complex_msar_reject_message_sent;
  ComplexMsarRejectMessage complex_msar_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_msar_reject_message(complex_msar_reject_message_sent, 0)
  :: pattern == 1 -> fill_complex_msar_reject_message(complex_msar_reject_message_sent, 32)
  :: pattern == 2 -> fill_complex_msar_reject_message(complex_msar_reject_message_sent, 255)
  :: else -> ramp_complex_msar_reject_message(complex_msar_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_msar_reject_message(complex_msar_reject_message_sent);
    assert(at == 13);
    at = 0;
    decode_complex_msar_reject_message(complex_msar_reject_message_got);
    assert(at == 13);
    equal_complex_msar_reject_message(complex_msar_reject_message_got, complex_msar_reject_message_sent)
  }
}

/* Underlying Permission Notification Message: encoded, read back, and compared */
proctype check_underlying_permission_notification_message() {
  UnderlyingPermissionNotificationMessage underlying_permission_notification_message_sent;
  UnderlyingPermissionNotificationMessage underlying_permission_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_permission_notification_message(underlying_permission_notification_message_sent, 0)
  :: pattern == 1 -> fill_underlying_permission_notification_message(underlying_permission_notification_message_sent, 32)
  :: pattern == 2 -> fill_underlying_permission_notification_message(underlying_permission_notification_message_sent, 255)
  :: else -> ramp_underlying_permission_notification_message(underlying_permission_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_permission_notification_message(underlying_permission_notification_message_sent);
    assert(at == 26);
    at = 0;
    decode_underlying_permission_notification_message(underlying_permission_notification_message_got);
    assert(at == 26);
    equal_underlying_permission_notification_message(underlying_permission_notification_message_got, underlying_permission_notification_message_sent)
  }
}

/* Mm Parameter Definition Notification Message: encoded, read back, and compared */
proctype check_mm_parameter_definition_notification_message() {
  MmParameterDefinitionNotificationMessage mm_parameter_definition_notification_message_sent;
  MmParameterDefinitionNotificationMessage mm_parameter_definition_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mm_parameter_definition_notification_message(mm_parameter_definition_notification_message_sent, 0)
  :: pattern == 1 -> fill_mm_parameter_definition_notification_message(mm_parameter_definition_notification_message_sent, 32)
  :: pattern == 2 -> fill_mm_parameter_definition_notification_message(mm_parameter_definition_notification_message_sent, 255)
  :: else -> ramp_mm_parameter_definition_notification_message(mm_parameter_definition_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mm_parameter_definition_notification_message(mm_parameter_definition_notification_message_sent);
    assert(at == 74);
    at = 0;
    decode_mm_parameter_definition_notification_message(mm_parameter_definition_notification_message_got);
    assert(at == 74);
    equal_mm_parameter_definition_notification_message(mm_parameter_definition_notification_message_got, mm_parameter_definition_notification_message_sent)
  }
}

/* Active Qp Self Replenishment Parameter Definition Notification Message: encoded, read back, and compared */
proctype check_active_qp_self_replenishment_parameter_definition_notification_message() {
  ActiveQpSelfReplenishmentParameterDefinitionNotificationMessage active_qp_self_replenishment_parameter_definition_notification_message_sent;
  ActiveQpSelfReplenishmentParameterDefinitionNotificationMessage active_qp_self_replenishment_parameter_definition_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_active_qp_self_replenishment_parameter_definition_notification_message(active_qp_self_replenishment_parameter_definition_notification_message_sent, 0)
  :: pattern == 1 -> fill_active_qp_self_replenishment_parameter_definition_notification_message(active_qp_self_replenishment_parameter_definition_notification_message_sent, 32)
  :: pattern == 2 -> fill_active_qp_self_replenishment_parameter_definition_notification_message(active_qp_self_replenishment_parameter_definition_notification_message_sent, 255)
  :: else -> ramp_active_qp_self_replenishment_parameter_definition_notification_message(active_qp_self_replenishment_parameter_definition_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_active_qp_self_replenishment_parameter_definition_notification_message(active_qp_self_replenishment_parameter_definition_notification_message_sent);
    assert(at == 61);
    at = 0;
    decode_active_qp_self_replenishment_parameter_definition_notification_message(active_qp_self_replenishment_parameter_definition_notification_message_got);
    assert(at == 61);
    equal_active_qp_self_replenishment_parameter_definition_notification_message(active_qp_self_replenishment_parameter_definition_notification_message_got, active_qp_self_replenishment_parameter_definition_notification_message_sent)
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
    assert(at == 11);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 11);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Simple Instrument Directory Message: encoded, read back, and compared */
proctype check_simple_instrument_directory_message() {
  SimpleInstrumentDirectoryMessage simple_instrument_directory_message_sent;
  SimpleInstrumentDirectoryMessage simple_instrument_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_instrument_directory_message(simple_instrument_directory_message_sent, 0)
  :: pattern == 1 -> fill_simple_instrument_directory_message(simple_instrument_directory_message_sent, 32)
  :: pattern == 2 -> fill_simple_instrument_directory_message(simple_instrument_directory_message_sent, 255)
  :: else -> ramp_simple_instrument_directory_message(simple_instrument_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_instrument_directory_message(simple_instrument_directory_message_sent);
    assert(at == 59);
    at = 0;
    decode_simple_instrument_directory_message(simple_instrument_directory_message_got);
    assert(at == 59);
    equal_simple_instrument_directory_message(simple_instrument_directory_message_got, simple_instrument_directory_message_sent)
  }
}

/* Simple Instrument Trading Action Message: encoded, read back, and compared */
proctype check_simple_instrument_trading_action_message() {
  SimpleInstrumentTradingActionMessage simple_instrument_trading_action_message_sent;
  SimpleInstrumentTradingActionMessage simple_instrument_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_instrument_trading_action_message(simple_instrument_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_simple_instrument_trading_action_message(simple_instrument_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_simple_instrument_trading_action_message(simple_instrument_trading_action_message_sent, 255)
  :: else -> ramp_simple_instrument_trading_action_message(simple_instrument_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_instrument_trading_action_message(simple_instrument_trading_action_message_sent);
    assert(at == 13);
    at = 0;
    decode_simple_instrument_trading_action_message(simple_instrument_trading_action_message_got);
    assert(at == 13);
    equal_simple_instrument_trading_action_message(simple_instrument_trading_action_message_got, simple_instrument_trading_action_message_sent)
  }
}

/* Complex Instrument Trading Action Message: encoded, read back, and compared */
proctype check_complex_instrument_trading_action_message() {
  ComplexInstrumentTradingActionMessage complex_instrument_trading_action_message_sent;
  ComplexInstrumentTradingActionMessage complex_instrument_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_instrument_trading_action_message(complex_instrument_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_complex_instrument_trading_action_message(complex_instrument_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_complex_instrument_trading_action_message(complex_instrument_trading_action_message_sent, 255)
  :: else -> ramp_complex_instrument_trading_action_message(complex_instrument_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_instrument_trading_action_message(complex_instrument_trading_action_message_sent);
    assert(at == 13);
    at = 0;
    decode_complex_instrument_trading_action_message(complex_instrument_trading_action_message_got);
    assert(at == 13);
    equal_complex_instrument_trading_action_message(complex_instrument_trading_action_message_got, complex_instrument_trading_action_message_sent)
  }
}

/* Simple Quote Execution Notification Message: encoded, read back, and compared */
proctype check_simple_quote_execution_notification_message() {
  SimpleQuoteExecutionNotificationMessage simple_quote_execution_notification_message_sent;
  SimpleQuoteExecutionNotificationMessage simple_quote_execution_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_quote_execution_notification_message(simple_quote_execution_notification_message_sent, 0)
  :: pattern == 1 -> fill_simple_quote_execution_notification_message(simple_quote_execution_notification_message_sent, 32)
  :: pattern == 2 -> fill_simple_quote_execution_notification_message(simple_quote_execution_notification_message_sent, 255)
  :: else -> ramp_simple_quote_execution_notification_message(simple_quote_execution_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_quote_execution_notification_message(simple_quote_execution_notification_message_sent);
    assert(at == 46);
    at = 0;
    decode_simple_quote_execution_notification_message(simple_quote_execution_notification_message_got);
    assert(at == 46);
    equal_simple_quote_execution_notification_message(simple_quote_execution_notification_message_got, simple_quote_execution_notification_message_sent)
  }
}

/* Complex Quote Execution Notification Message: encoded, read back, and compared */
proctype check_complex_quote_execution_notification_message() {
  ComplexQuoteExecutionNotificationMessage complex_quote_execution_notification_message_sent;
  ComplexQuoteExecutionNotificationMessage complex_quote_execution_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_quote_execution_notification_message(complex_quote_execution_notification_message_sent, 0)
  :: pattern == 1 -> fill_complex_quote_execution_notification_message(complex_quote_execution_notification_message_sent, 32)
  :: pattern == 2 -> fill_complex_quote_execution_notification_message(complex_quote_execution_notification_message_sent, 255)
  :: else -> ramp_complex_quote_execution_notification_message(complex_quote_execution_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_quote_execution_notification_message(complex_quote_execution_notification_message_sent);
    assert(at == 50);
    at = 0;
    decode_complex_quote_execution_notification_message(complex_quote_execution_notification_message_got);
    assert(at == 50);
    equal_complex_quote_execution_notification_message(complex_quote_execution_notification_message_got, complex_quote_execution_notification_message_sent)
  }
}

/* Complex Quote Leg Execution Notification Message: encoded, read back, and compared */
proctype check_complex_quote_leg_execution_notification_message() {
  ComplexQuoteLegExecutionNotificationMessage complex_quote_leg_execution_notification_message_sent;
  ComplexQuoteLegExecutionNotificationMessage complex_quote_leg_execution_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_quote_leg_execution_notification_message(complex_quote_leg_execution_notification_message_sent, 0)
  :: pattern == 1 -> fill_complex_quote_leg_execution_notification_message(complex_quote_leg_execution_notification_message_sent, 32)
  :: pattern == 2 -> fill_complex_quote_leg_execution_notification_message(complex_quote_leg_execution_notification_message_sent, 255)
  :: else -> ramp_complex_quote_leg_execution_notification_message(complex_quote_leg_execution_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_quote_leg_execution_notification_message(complex_quote_leg_execution_notification_message_sent);
    assert(at == 55);
    at = 0;
    decode_complex_quote_leg_execution_notification_message(complex_quote_leg_execution_notification_message_got);
    assert(at == 55);
    equal_complex_quote_leg_execution_notification_message(complex_quote_leg_execution_notification_message_got, complex_quote_leg_execution_notification_message_sent)
  }
}

/* Simple Msar Notification Message: encoded, read back, and compared */
proctype check_simple_msar_notification_message() {
  SimpleMsarNotificationMessage simple_msar_notification_message_sent;
  SimpleMsarNotificationMessage simple_msar_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_msar_notification_message(simple_msar_notification_message_sent, 0)
  :: pattern == 1 -> fill_simple_msar_notification_message(simple_msar_notification_message_sent, 32)
  :: pattern == 2 -> fill_simple_msar_notification_message(simple_msar_notification_message_sent, 255)
  :: else -> ramp_simple_msar_notification_message(simple_msar_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_msar_notification_message(simple_msar_notification_message_sent);
    assert(at == 47);
    at = 0;
    decode_simple_msar_notification_message(simple_msar_notification_message_got);
    assert(at == 47);
    equal_simple_msar_notification_message(simple_msar_notification_message_got, simple_msar_notification_message_sent)
  }
}

/* Complex Msar Leg Notification Message: encoded, read back, and compared */
proctype check_complex_msar_leg_notification_message() {
  ComplexMsarLegNotificationMessage complex_msar_leg_notification_message_sent;
  ComplexMsarLegNotificationMessage complex_msar_leg_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_msar_leg_notification_message(complex_msar_leg_notification_message_sent, 0)
  :: pattern == 1 -> fill_complex_msar_leg_notification_message(complex_msar_leg_notification_message_sent, 32)
  :: pattern == 2 -> fill_complex_msar_leg_notification_message(complex_msar_leg_notification_message_sent, 255)
  :: else -> ramp_complex_msar_leg_notification_message(complex_msar_leg_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_msar_leg_notification_message(complex_msar_leg_notification_message_sent);
    assert(at == 61);
    at = 0;
    decode_complex_msar_leg_notification_message(complex_msar_leg_notification_message_got);
    assert(at == 61);
    equal_complex_msar_leg_notification_message(complex_msar_leg_notification_message_got, complex_msar_leg_notification_message_sent)
  }
}

/* Complex Msar Notification Message: encoded, read back, and compared */
proctype check_complex_msar_notification_message() {
  ComplexMsarNotificationMessage complex_msar_notification_message_sent;
  ComplexMsarNotificationMessage complex_msar_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_msar_notification_message(complex_msar_notification_message_sent, 0)
  :: pattern == 1 -> fill_complex_msar_notification_message(complex_msar_notification_message_sent, 32)
  :: pattern == 2 -> fill_complex_msar_notification_message(complex_msar_notification_message_sent, 255)
  :: else -> ramp_complex_msar_notification_message(complex_msar_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_msar_notification_message(complex_msar_notification_message_sent);
    assert(at == 55);
    at = 0;
    decode_complex_msar_notification_message(complex_msar_notification_message_got);
    assert(at == 55);
    equal_complex_msar_notification_message(complex_msar_notification_message_got, complex_msar_notification_message_sent)
  }
}

/* Opening Rotation Quote Spread Multiplier Notification Message: encoded, read back, and compared */
proctype check_opening_rotation_quote_spread_multiplier_notification_message() {
  OpeningRotationQuoteSpreadMultiplierNotificationMessage opening_rotation_quote_spread_multiplier_notification_message_sent;
  OpeningRotationQuoteSpreadMultiplierNotificationMessage opening_rotation_quote_spread_multiplier_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_opening_rotation_quote_spread_multiplier_notification_message(opening_rotation_quote_spread_multiplier_notification_message_sent, 0)
  :: pattern == 1 -> fill_opening_rotation_quote_spread_multiplier_notification_message(opening_rotation_quote_spread_multiplier_notification_message_sent, 32)
  :: pattern == 2 -> fill_opening_rotation_quote_spread_multiplier_notification_message(opening_rotation_quote_spread_multiplier_notification_message_sent, 255)
  :: else -> ramp_opening_rotation_quote_spread_multiplier_notification_message(opening_rotation_quote_spread_multiplier_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_opening_rotation_quote_spread_multiplier_notification_message(opening_rotation_quote_spread_multiplier_notification_message_sent);
    assert(at == 22);
    at = 0;
    decode_opening_rotation_quote_spread_multiplier_notification_message(opening_rotation_quote_spread_multiplier_notification_message_got);
    assert(at == 22);
    equal_opening_rotation_quote_spread_multiplier_notification_message(opening_rotation_quote_spread_multiplier_notification_message_got, opening_rotation_quote_spread_multiplier_notification_message_sent)
  }
}

/* Notification Subscription Reply Message: encoded, read back, and compared */
proctype check_notification_subscription_reply_message() {
  NotificationSubscriptionReplyMessage notification_subscription_reply_message_sent;
  NotificationSubscriptionReplyMessage notification_subscription_reply_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_notification_subscription_reply_message(notification_subscription_reply_message_sent, 0)
  :: pattern == 1 -> fill_notification_subscription_reply_message(notification_subscription_reply_message_sent, 32)
  :: pattern == 2 -> fill_notification_subscription_reply_message(notification_subscription_reply_message_sent, 255)
  :: else -> ramp_notification_subscription_reply_message(notification_subscription_reply_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_notification_subscription_reply_message(notification_subscription_reply_message_sent);
    assert(at == 13);
    at = 0;
    decode_notification_subscription_reply_message(notification_subscription_reply_message_got);
    assert(at == 13);
    equal_notification_subscription_reply_message(notification_subscription_reply_message_got, notification_subscription_reply_message_sent)
  }
}

/* Add Complex Instrument Reply Message: encoded, read back, and compared */
proctype check_add_complex_instrument_reply_message() {
  AddComplexInstrumentReplyMessage add_complex_instrument_reply_message_sent;
  AddComplexInstrumentReplyMessage add_complex_instrument_reply_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_complex_instrument_reply_message(add_complex_instrument_reply_message_sent, 0)
  :: pattern == 1 -> fill_add_complex_instrument_reply_message(add_complex_instrument_reply_message_sent, 32)
  :: pattern == 2 -> fill_add_complex_instrument_reply_message(add_complex_instrument_reply_message_sent, 255)
  :: else -> ramp_add_complex_instrument_reply_message(add_complex_instrument_reply_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_complex_instrument_reply_message(add_complex_instrument_reply_message_sent);
    assert(at == 13);
    at = 0;
    decode_add_complex_instrument_reply_message(add_complex_instrument_reply_message_got);
    assert(at == 13);
    equal_add_complex_instrument_reply_message(add_complex_instrument_reply_message_got, add_complex_instrument_reply_message_sent)
  }
}

/* Mm Parameter Definition Reply Message: encoded, read back, and compared */
proctype check_mm_parameter_definition_reply_message() {
  MmParameterDefinitionReplyMessage mm_parameter_definition_reply_message_sent;
  MmParameterDefinitionReplyMessage mm_parameter_definition_reply_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mm_parameter_definition_reply_message(mm_parameter_definition_reply_message_sent, 0)
  :: pattern == 1 -> fill_mm_parameter_definition_reply_message(mm_parameter_definition_reply_message_sent, 32)
  :: pattern == 2 -> fill_mm_parameter_definition_reply_message(mm_parameter_definition_reply_message_sent, 255)
  :: else -> ramp_mm_parameter_definition_reply_message(mm_parameter_definition_reply_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mm_parameter_definition_reply_message(mm_parameter_definition_reply_message_sent);
    assert(at == 13);
    at = 0;
    decode_mm_parameter_definition_reply_message(mm_parameter_definition_reply_message_got);
    assert(at == 13);
    equal_mm_parameter_definition_reply_message(mm_parameter_definition_reply_message_got, mm_parameter_definition_reply_message_sent)
  }
}

/* Active Qp Self Replenishment Set Limit Reply Message: encoded, read back, and compared */
proctype check_active_qp_self_replenishment_set_limit_reply_message() {
  ActiveQpSelfReplenishmentSetLimitReplyMessage active_qp_self_replenishment_set_limit_reply_message_sent;
  ActiveQpSelfReplenishmentSetLimitReplyMessage active_qp_self_replenishment_set_limit_reply_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_active_qp_self_replenishment_set_limit_reply_message(active_qp_self_replenishment_set_limit_reply_message_sent, 0)
  :: pattern == 1 -> fill_active_qp_self_replenishment_set_limit_reply_message(active_qp_self_replenishment_set_limit_reply_message_sent, 32)
  :: pattern == 2 -> fill_active_qp_self_replenishment_set_limit_reply_message(active_qp_self_replenishment_set_limit_reply_message_sent, 255)
  :: else -> ramp_active_qp_self_replenishment_set_limit_reply_message(active_qp_self_replenishment_set_limit_reply_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_active_qp_self_replenishment_set_limit_reply_message(active_qp_self_replenishment_set_limit_reply_message_sent);
    assert(at == 30);
    at = 0;
    decode_active_qp_self_replenishment_set_limit_reply_message(active_qp_self_replenishment_set_limit_reply_message_got);
    assert(at == 30);
    equal_active_qp_self_replenishment_set_limit_reply_message(active_qp_self_replenishment_set_limit_reply_message_got, active_qp_self_replenishment_set_limit_reply_message_sent)
  }
}

/* Underlying Purge Reply Message: encoded, read back, and compared */
proctype check_underlying_purge_reply_message() {
  UnderlyingPurgeReplyMessage underlying_purge_reply_message_sent;
  UnderlyingPurgeReplyMessage underlying_purge_reply_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_purge_reply_message(underlying_purge_reply_message_sent, 0)
  :: pattern == 1 -> fill_underlying_purge_reply_message(underlying_purge_reply_message_sent, 32)
  :: pattern == 2 -> fill_underlying_purge_reply_message(underlying_purge_reply_message_sent, 255)
  :: else -> ramp_underlying_purge_reply_message(underlying_purge_reply_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_purge_reply_message(underlying_purge_reply_message_sent);
    assert(at == 29);
    at = 0;
    decode_underlying_purge_reply_message(underlying_purge_reply_message_got);
    assert(at == 29);
    equal_underlying_purge_reply_message(underlying_purge_reply_message_got, underlying_purge_reply_message_sent)
  }
}

/* Market Reentry Reply Message: encoded, read back, and compared */
proctype check_market_reentry_reply_message() {
  MarketReentryReplyMessage market_reentry_reply_message_sent;
  MarketReentryReplyMessage market_reentry_reply_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_reentry_reply_message(market_reentry_reply_message_sent, 0)
  :: pattern == 1 -> fill_market_reentry_reply_message(market_reentry_reply_message_sent, 32)
  :: pattern == 2 -> fill_market_reentry_reply_message(market_reentry_reply_message_sent, 255)
  :: else -> ramp_market_reentry_reply_message(market_reentry_reply_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_reentry_reply_message(market_reentry_reply_message_sent);
    assert(at == 21);
    at = 0;
    decode_market_reentry_reply_message(market_reentry_reply_message_got);
    assert(at == 21);
    equal_market_reentry_reply_message(market_reentry_reply_message_got, market_reentry_reply_message_sent)
  }
}

/* Active Qp Self Replenishment Request Reentry Reply Message: encoded, read back, and compared */
proctype check_active_qp_self_replenishment_request_reentry_reply_message() {
  ActiveQpSelfReplenishmentRequestReentryReplyMessage active_qp_self_replenishment_request_reentry_reply_message_sent;
  ActiveQpSelfReplenishmentRequestReentryReplyMessage active_qp_self_replenishment_request_reentry_reply_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_active_qp_self_replenishment_request_reentry_reply_message(active_qp_self_replenishment_request_reentry_reply_message_sent, 0)
  :: pattern == 1 -> fill_active_qp_self_replenishment_request_reentry_reply_message(active_qp_self_replenishment_request_reentry_reply_message_sent, 32)
  :: pattern == 2 -> fill_active_qp_self_replenishment_request_reentry_reply_message(active_qp_self_replenishment_request_reentry_reply_message_sent, 255)
  :: else -> ramp_active_qp_self_replenishment_request_reentry_reply_message(active_qp_self_replenishment_request_reentry_reply_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_active_qp_self_replenishment_request_reentry_reply_message(active_qp_self_replenishment_request_reentry_reply_message_sent);
    assert(at == 38);
    at = 0;
    decode_active_qp_self_replenishment_request_reentry_reply_message(active_qp_self_replenishment_request_reentry_reply_message_got);
    assert(at == 38);
    equal_active_qp_self_replenishment_request_reentry_reply_message(active_qp_self_replenishment_request_reentry_reply_message_got, active_qp_self_replenishment_request_reentry_reply_message_sent)
  }
}

/* Instrument Purge Notification Message: encoded, read back, and compared */
proctype check_instrument_purge_notification_message() {
  InstrumentPurgeNotificationMessage instrument_purge_notification_message_sent;
  InstrumentPurgeNotificationMessage instrument_purge_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_purge_notification_message(instrument_purge_notification_message_sent, 0)
  :: pattern == 1 -> fill_instrument_purge_notification_message(instrument_purge_notification_message_sent, 32)
  :: pattern == 2 -> fill_instrument_purge_notification_message(instrument_purge_notification_message_sent, 255)
  :: else -> ramp_instrument_purge_notification_message(instrument_purge_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_purge_notification_message(instrument_purge_notification_message_sent);
    assert(at == 49);
    at = 0;
    decode_instrument_purge_notification_message(instrument_purge_notification_message_got);
    assert(at == 49);
    equal_instrument_purge_notification_message(instrument_purge_notification_message_got, instrument_purge_notification_message_sent)
  }
}

/* Underlying Purge Notification Message: encoded, read back, and compared */
proctype check_underlying_purge_notification_message() {
  UnderlyingPurgeNotificationMessage underlying_purge_notification_message_sent;
  UnderlyingPurgeNotificationMessage underlying_purge_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_purge_notification_message(underlying_purge_notification_message_sent, 0)
  :: pattern == 1 -> fill_underlying_purge_notification_message(underlying_purge_notification_message_sent, 32)
  :: pattern == 2 -> fill_underlying_purge_notification_message(underlying_purge_notification_message_sent, 255)
  :: else -> ramp_underlying_purge_notification_message(underlying_purge_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_purge_notification_message(underlying_purge_notification_message_sent);
    assert(at == 42);
    at = 0;
    decode_underlying_purge_notification_message(underlying_purge_notification_message_got);
    assert(at == 42);
    equal_underlying_purge_notification_message(underlying_purge_notification_message_got, underlying_purge_notification_message_sent)
  }
}

/* Market Reentry Notification Message: encoded, read back, and compared */
proctype check_market_reentry_notification_message() {
  MarketReentryNotificationMessage market_reentry_notification_message_sent;
  MarketReentryNotificationMessage market_reentry_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_reentry_notification_message(market_reentry_notification_message_sent, 0)
  :: pattern == 1 -> fill_market_reentry_notification_message(market_reentry_notification_message_sent, 32)
  :: pattern == 2 -> fill_market_reentry_notification_message(market_reentry_notification_message_sent, 255)
  :: else -> ramp_market_reentry_notification_message(market_reentry_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_reentry_notification_message(market_reentry_notification_message_sent);
    assert(at == 42);
    at = 0;
    decode_market_reentry_notification_message(market_reentry_notification_message_got);
    assert(at == 42);
    equal_market_reentry_notification_message(market_reentry_notification_message_got, market_reentry_notification_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_msar_accept_message()
  :: run check_msar_reject_message()
  :: run check_complex_msar_accept_message()
  :: run check_complex_msar_reject_message()
  :: run check_underlying_permission_notification_message()
  :: run check_mm_parameter_definition_notification_message()
  :: run check_active_qp_self_replenishment_parameter_definition_notification_message()
  :: run check_system_event_message()
  :: run check_simple_instrument_directory_message()
  :: run check_simple_instrument_trading_action_message()
  :: run check_complex_instrument_trading_action_message()
  :: run check_simple_quote_execution_notification_message()
  :: run check_complex_quote_execution_notification_message()
  :: run check_complex_quote_leg_execution_notification_message()
  :: run check_simple_msar_notification_message()
  :: run check_complex_msar_leg_notification_message()
  :: run check_complex_msar_notification_message()
  :: run check_opening_rotation_quote_spread_multiplier_notification_message()
  :: run check_notification_subscription_reply_message()
  :: run check_add_complex_instrument_reply_message()
  :: run check_mm_parameter_definition_reply_message()
  :: run check_active_qp_self_replenishment_set_limit_reply_message()
  :: run check_underlying_purge_reply_message()
  :: run check_market_reentry_reply_message()
  :: run check_active_qp_self_replenishment_request_reentry_reply_message()
  :: run check_instrument_purge_notification_message()
  :: run check_underlying_purge_notification_message()
  :: run check_market_reentry_notification_message()
  fi
}
