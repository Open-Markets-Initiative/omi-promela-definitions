/*
 * New York Stock Exchange Open Book
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
 *   - a run counted by a field
 *   - a run filling what frames it
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 36

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* OpenBook Ultra packet header */
typedef PacketHeader {
  byte packet_size[2];
  byte message_type[2];
  byte sequence_number[4];
  byte timestamp[4];
  byte product_id;
  byte retransmission_flag;
  byte message_count;
  byte link_flag
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_size[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_type[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.timestamp[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.product_id = packet_header_value;
  packet_header_record.retransmission_flag = packet_header_value;
  packet_header_record.message_count = packet_header_value;
  packet_header_record.link_flag = packet_header_value;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_size[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_type[packet_header_at] = (packet_header_base + 2 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.timestamp[packet_header_at] = (packet_header_base + 8 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.product_id = (packet_header_base + 12 + 1) % 256;
  packet_header_record.retransmission_flag = (packet_header_base + 13 + 1) % 256;
  packet_header_record.message_count = (packet_header_base + 14 + 1) % 256;
  packet_header_record.link_flag = (packet_header_base + 15 + 1) % 256;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.packet_size[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.message_type[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.timestamp[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.product_id; at = at + 1;
  wire[at] = packet_header_record.retransmission_flag; at = at + 1;
  wire[at] = packet_header_record.message_count; at = at + 1;
  wire[at] = packet_header_record.link_flag; at = at + 1;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_size[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_type[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.timestamp[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.product_id = wire[at]; at = at + 1;
  packet_header_record.retransmission_flag = wire[at]; at = at + 1;
  packet_header_record.message_count = wire[at]; at = at + 1;
  packet_header_record.link_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.packet_size[packet_header_at] == packet_header_written.packet_size[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.message_type[packet_header_at] == packet_header_written.message_type[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence_number[packet_header_at] == packet_header_written.sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.timestamp[packet_header_at] == packet_header_written.timestamp[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.product_id == packet_header_written.product_id);
  assert(packet_header_read.retransmission_flag == packet_header_written.retransmission_flag);
  assert(packet_header_read.message_count == packet_header_written.message_count);
  assert(packet_header_read.link_flag == packet_header_written.link_flag);
  skip
}

/* ---- Sequence Number Reset Message: 4 bytes ---------------------------------- */

/* This message is sent to reset the Packet Sequence Number. */
typedef SequenceNumberResetMessage {
  byte next_seq_number[4]
};

int sequence_number_reset_message_at;

/* every byte of Sequence Number Reset Message set to one value */
inline fill_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_value) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.next_seq_number[sequence_number_reset_message_at] = sequence_number_reset_message_value; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Number Reset Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_base) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.next_seq_number[sequence_number_reset_message_at] = (sequence_number_reset_message_base + 0 + sequence_number_reset_message_at + 1) % 256; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Number Reset Message to the wire, 4 bytes from where the cursor stands */
inline encode_sequence_number_reset_message(sequence_number_reset_message_record) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> wire[at] = sequence_number_reset_message_record.next_seq_number[sequence_number_reset_message_at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Number Reset Message off the wire, 4 bytes from where the cursor stands */
inline decode_sequence_number_reset_message(sequence_number_reset_message_record) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.next_seq_number[sequence_number_reset_message_at] = wire[at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Number Reset Message is what was written, byte for byte */
inline equal_sequence_number_reset_message(sequence_number_reset_message_read, sequence_number_reset_message_written) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> assert(sequence_number_reset_message_read.next_seq_number[sequence_number_reset_message_at] == sequence_number_reset_message_written.next_seq_number[sequence_number_reset_message_at]); sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Unavailable Message: 8 bytes -------------------------------------------- */

/* This message will be sent over the Retransmission multicast channels to inform the clients of unavailability of a range of messages for which they have requested a retransmission. */
typedef UnavailableMessage {
  byte begin_seq_num[4];
  byte end_seq_num[4]
};

int unavailable_message_at;

/* every byte of Unavailable Message set to one value */
inline fill_unavailable_message(unavailable_message_record, unavailable_message_value) {
  unavailable_message_at = 0;
  do
  :: unavailable_message_at < 4 -> unavailable_message_record.begin_seq_num[unavailable_message_at] = unavailable_message_value; unavailable_message_at = unavailable_message_at + 1
  :: else -> break
  od;
  unavailable_message_at = 0;
  do
  :: unavailable_message_at < 4 -> unavailable_message_record.end_seq_num[unavailable_message_at] = unavailable_message_value; unavailable_message_at = unavailable_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Unavailable Message set to where it lies, so a field read out of place says so */
inline ramp_unavailable_message(unavailable_message_record, unavailable_message_base) {
  unavailable_message_at = 0;
  do
  :: unavailable_message_at < 4 -> unavailable_message_record.begin_seq_num[unavailable_message_at] = (unavailable_message_base + 0 + unavailable_message_at + 1) % 256; unavailable_message_at = unavailable_message_at + 1
  :: else -> break
  od;
  unavailable_message_at = 0;
  do
  :: unavailable_message_at < 4 -> unavailable_message_record.end_seq_num[unavailable_message_at] = (unavailable_message_base + 4 + unavailable_message_at + 1) % 256; unavailable_message_at = unavailable_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unavailable Message to the wire, 8 bytes from where the cursor stands */
inline encode_unavailable_message(unavailable_message_record) {
  unavailable_message_at = 0;
  do
  :: unavailable_message_at < 4 -> wire[at] = unavailable_message_record.begin_seq_num[unavailable_message_at]; at = at + 1; unavailable_message_at = unavailable_message_at + 1
  :: else -> break
  od;
  unavailable_message_at = 0;
  do
  :: unavailable_message_at < 4 -> wire[at] = unavailable_message_record.end_seq_num[unavailable_message_at]; at = at + 1; unavailable_message_at = unavailable_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unavailable Message off the wire, 8 bytes from where the cursor stands */
inline decode_unavailable_message(unavailable_message_record) {
  unavailable_message_at = 0;
  do
  :: unavailable_message_at < 4 -> unavailable_message_record.begin_seq_num[unavailable_message_at] = wire[at]; at = at + 1; unavailable_message_at = unavailable_message_at + 1
  :: else -> break
  od;
  unavailable_message_at = 0;
  do
  :: unavailable_message_at < 4 -> unavailable_message_record.end_seq_num[unavailable_message_at] = wire[at]; at = at + 1; unavailable_message_at = unavailable_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Unavailable Message is what was written, byte for byte */
inline equal_unavailable_message(unavailable_message_read, unavailable_message_written) {
  unavailable_message_at = 0;
  do
  :: unavailable_message_at < 4 -> assert(unavailable_message_read.begin_seq_num[unavailable_message_at] == unavailable_message_written.begin_seq_num[unavailable_message_at]); unavailable_message_at = unavailable_message_at + 1
  :: else -> break
  od;
  unavailable_message_at = 0;
  do
  :: unavailable_message_at < 4 -> assert(unavailable_message_read.end_seq_num[unavailable_message_at] == unavailable_message_written.end_seq_num[unavailable_message_at]); unavailable_message_at = unavailable_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Request Response Message: 28 bytes -------------------------------------- */

/* This message will be sent immediately via TCP/IP in response to the client's request for a retransmission, refresh, or Symbol Index information. */
typedef RequestResponseMessage {
  byte source_seq_num[4];
  byte source_id[20];
  byte status;
  byte reject_reason;
  byte filler_2[2]
};

int request_response_message_at;

/* every byte of Request Response Message set to one value */
inline fill_request_response_message(request_response_message_record, request_response_message_value) {
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> request_response_message_record.source_seq_num[request_response_message_at] = request_response_message_value; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 20 -> request_response_message_record.source_id[request_response_message_at] = request_response_message_value; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_record.status = request_response_message_value;
  request_response_message_record.reject_reason = request_response_message_value;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 2 -> request_response_message_record.filler_2[request_response_message_at] = request_response_message_value; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Request Response Message set to where it lies, so a field read out of place says so */
inline ramp_request_response_message(request_response_message_record, request_response_message_base) {
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> request_response_message_record.source_seq_num[request_response_message_at] = (request_response_message_base + 0 + request_response_message_at + 1) % 256; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 20 -> request_response_message_record.source_id[request_response_message_at] = (request_response_message_base + 4 + request_response_message_at + 1) % 256; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_record.status = (request_response_message_base + 24 + 1) % 256;
  request_response_message_record.reject_reason = (request_response_message_base + 25 + 1) % 256;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 2 -> request_response_message_record.filler_2[request_response_message_at] = (request_response_message_base + 26 + request_response_message_at + 1) % 256; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Request Response Message to the wire, 28 bytes from where the cursor stands */
inline encode_request_response_message(request_response_message_record) {
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> wire[at] = request_response_message_record.source_seq_num[request_response_message_at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 20 -> wire[at] = request_response_message_record.source_id[request_response_message_at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  wire[at] = request_response_message_record.status; at = at + 1;
  wire[at] = request_response_message_record.reject_reason; at = at + 1;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 2 -> wire[at] = request_response_message_record.filler_2[request_response_message_at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Request Response Message off the wire, 28 bytes from where the cursor stands */
inline decode_request_response_message(request_response_message_record) {
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> request_response_message_record.source_seq_num[request_response_message_at] = wire[at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 20 -> request_response_message_record.source_id[request_response_message_at] = wire[at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_record.status = wire[at]; at = at + 1;
  request_response_message_record.reject_reason = wire[at]; at = at + 1;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 2 -> request_response_message_record.filler_2[request_response_message_at] = wire[at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Request Response Message is what was written, byte for byte */
inline equal_request_response_message(request_response_message_read, request_response_message_written) {
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> assert(request_response_message_read.source_seq_num[request_response_message_at] == request_response_message_written.source_seq_num[request_response_message_at]); request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 20 -> assert(request_response_message_read.source_id[request_response_message_at] == request_response_message_written.source_id[request_response_message_at]); request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  assert(request_response_message_read.status == request_response_message_written.status);
  assert(request_response_message_read.reject_reason == request_response_message_written.reject_reason);
  request_response_message_at = 0;
  do
  :: request_response_message_at < 2 -> assert(request_response_message_read.filler_2[request_response_message_at] == request_response_message_written.filler_2[request_response_message_at]); request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Request Message: 28 bytes -------------------------------- */

/* This message is sent by clients to request a retransmission of missed packets. */
typedef RetransmissionRequestMessage {
  byte begin_seq_num[4];
  byte end_seq_num[4];
  byte source_id[20]
};

int retransmission_request_message_at;

/* every byte of Retransmission Request Message set to one value */
inline fill_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_value) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.begin_seq_num[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.end_seq_num[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 20 -> retransmission_request_message_record.source_id[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Request Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_base) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.begin_seq_num[retransmission_request_message_at] = (retransmission_request_message_base + 0 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.end_seq_num[retransmission_request_message_at] = (retransmission_request_message_base + 4 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 20 -> retransmission_request_message_record.source_id[retransmission_request_message_at] = (retransmission_request_message_base + 8 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request Message to the wire, 28 bytes from where the cursor stands */
inline encode_retransmission_request_message(retransmission_request_message_record) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> wire[at] = retransmission_request_message_record.begin_seq_num[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> wire[at] = retransmission_request_message_record.end_seq_num[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 20 -> wire[at] = retransmission_request_message_record.source_id[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request Message off the wire, 28 bytes from where the cursor stands */
inline decode_retransmission_request_message(retransmission_request_message_record) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.begin_seq_num[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.end_seq_num[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 20 -> retransmission_request_message_record.source_id[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Request Message is what was written, byte for byte */
inline equal_retransmission_request_message(retransmission_request_message_read, retransmission_request_message_written) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> assert(retransmission_request_message_read.begin_seq_num[retransmission_request_message_at] == retransmission_request_message_written.begin_seq_num[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> assert(retransmission_request_message_read.end_seq_num[retransmission_request_message_at] == retransmission_request_message_written.end_seq_num[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 20 -> assert(retransmission_request_message_read.source_id[retransmission_request_message_at] == retransmission_request_message_written.source_id[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Book Refresh Request Message: 36 bytes ---------------------------------- */

/* This message is sent by clients requesting a full book refresh. */
typedef BookRefreshRequestMessage {
  byte symbol_16[16];
  byte source_id[20]
};

int book_refresh_request_message_at;

/* every byte of Book Refresh Request Message set to one value */
inline fill_book_refresh_request_message(book_refresh_request_message_record, book_refresh_request_message_value) {
  book_refresh_request_message_at = 0;
  do
  :: book_refresh_request_message_at < 16 -> book_refresh_request_message_record.symbol_16[book_refresh_request_message_at] = book_refresh_request_message_value; book_refresh_request_message_at = book_refresh_request_message_at + 1
  :: else -> break
  od;
  book_refresh_request_message_at = 0;
  do
  :: book_refresh_request_message_at < 20 -> book_refresh_request_message_record.source_id[book_refresh_request_message_at] = book_refresh_request_message_value; book_refresh_request_message_at = book_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Book Refresh Request Message set to where it lies, so a field read out of place says so */
inline ramp_book_refresh_request_message(book_refresh_request_message_record, book_refresh_request_message_base) {
  book_refresh_request_message_at = 0;
  do
  :: book_refresh_request_message_at < 16 -> book_refresh_request_message_record.symbol_16[book_refresh_request_message_at] = (book_refresh_request_message_base + 0 + book_refresh_request_message_at + 1) % 256; book_refresh_request_message_at = book_refresh_request_message_at + 1
  :: else -> break
  od;
  book_refresh_request_message_at = 0;
  do
  :: book_refresh_request_message_at < 20 -> book_refresh_request_message_record.source_id[book_refresh_request_message_at] = (book_refresh_request_message_base + 16 + book_refresh_request_message_at + 1) % 256; book_refresh_request_message_at = book_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Book Refresh Request Message to the wire, 36 bytes from where the cursor stands */
inline encode_book_refresh_request_message(book_refresh_request_message_record) {
  book_refresh_request_message_at = 0;
  do
  :: book_refresh_request_message_at < 16 -> wire[at] = book_refresh_request_message_record.symbol_16[book_refresh_request_message_at]; at = at + 1; book_refresh_request_message_at = book_refresh_request_message_at + 1
  :: else -> break
  od;
  book_refresh_request_message_at = 0;
  do
  :: book_refresh_request_message_at < 20 -> wire[at] = book_refresh_request_message_record.source_id[book_refresh_request_message_at]; at = at + 1; book_refresh_request_message_at = book_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Book Refresh Request Message off the wire, 36 bytes from where the cursor stands */
inline decode_book_refresh_request_message(book_refresh_request_message_record) {
  book_refresh_request_message_at = 0;
  do
  :: book_refresh_request_message_at < 16 -> book_refresh_request_message_record.symbol_16[book_refresh_request_message_at] = wire[at]; at = at + 1; book_refresh_request_message_at = book_refresh_request_message_at + 1
  :: else -> break
  od;
  book_refresh_request_message_at = 0;
  do
  :: book_refresh_request_message_at < 20 -> book_refresh_request_message_record.source_id[book_refresh_request_message_at] = wire[at]; at = at + 1; book_refresh_request_message_at = book_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Book Refresh Request Message is what was written, byte for byte */
inline equal_book_refresh_request_message(book_refresh_request_message_read, book_refresh_request_message_written) {
  book_refresh_request_message_at = 0;
  do
  :: book_refresh_request_message_at < 16 -> assert(book_refresh_request_message_read.symbol_16[book_refresh_request_message_at] == book_refresh_request_message_written.symbol_16[book_refresh_request_message_at]); book_refresh_request_message_at = book_refresh_request_message_at + 1
  :: else -> break
  od;
  book_refresh_request_message_at = 0;
  do
  :: book_refresh_request_message_at < 20 -> assert(book_refresh_request_message_read.source_id[book_refresh_request_message_at] == book_refresh_request_message_written.source_id[book_refresh_request_message_at]); book_refresh_request_message_at = book_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Heartbeat Response Message: 20 bytes ------------------------------------ */

/* Clients that remain connected to the Request server intraday must respond within 120 seconds to any heartbeat received with a single message of this type in its own packet. */
typedef HeartbeatResponseMessage {
  byte source_id[20]
};

int heartbeat_response_message_at;

/* every byte of Heartbeat Response Message set to one value */
inline fill_heartbeat_response_message(heartbeat_response_message_record, heartbeat_response_message_value) {
  heartbeat_response_message_at = 0;
  do
  :: heartbeat_response_message_at < 20 -> heartbeat_response_message_record.source_id[heartbeat_response_message_at] = heartbeat_response_message_value; heartbeat_response_message_at = heartbeat_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Response Message set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_response_message(heartbeat_response_message_record, heartbeat_response_message_base) {
  heartbeat_response_message_at = 0;
  do
  :: heartbeat_response_message_at < 20 -> heartbeat_response_message_record.source_id[heartbeat_response_message_at] = (heartbeat_response_message_base + 0 + heartbeat_response_message_at + 1) % 256; heartbeat_response_message_at = heartbeat_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Response Message to the wire, 20 bytes from where the cursor stands */
inline encode_heartbeat_response_message(heartbeat_response_message_record) {
  heartbeat_response_message_at = 0;
  do
  :: heartbeat_response_message_at < 20 -> wire[at] = heartbeat_response_message_record.source_id[heartbeat_response_message_at]; at = at + 1; heartbeat_response_message_at = heartbeat_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Response Message off the wire, 20 bytes from where the cursor stands */
inline decode_heartbeat_response_message(heartbeat_response_message_record) {
  heartbeat_response_message_at = 0;
  do
  :: heartbeat_response_message_at < 20 -> heartbeat_response_message_record.source_id[heartbeat_response_message_at] = wire[at]; at = at + 1; heartbeat_response_message_at = heartbeat_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Response Message is what was written, byte for byte */
inline equal_heartbeat_response_message(heartbeat_response_message_read, heartbeat_response_message_written) {
  heartbeat_response_message_at = 0;
  do
  :: heartbeat_response_message_at < 20 -> assert(heartbeat_response_message_read.source_id[heartbeat_response_message_at] == heartbeat_response_message_written.source_id[heartbeat_response_message_at]); heartbeat_response_message_at = heartbeat_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Extended Book Refresh Request Message: 26 bytes ------------------------- */

/* The Extended Book Refresh Request message allows the client to request a refresh by symbol index as opposed to symbol, and to request a refresh of all symbols in a channel. */
typedef ExtendedBookRefreshRequestMessage {
  byte source_id[20];
  byte symbol_index[4];
  byte msg_type[2]
};

int extended_book_refresh_request_message_at;

/* every byte of Extended Book Refresh Request Message set to one value */
inline fill_extended_book_refresh_request_message(extended_book_refresh_request_message_record, extended_book_refresh_request_message_value) {
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 20 -> extended_book_refresh_request_message_record.source_id[extended_book_refresh_request_message_at] = extended_book_refresh_request_message_value; extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 4 -> extended_book_refresh_request_message_record.symbol_index[extended_book_refresh_request_message_at] = extended_book_refresh_request_message_value; extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 2 -> extended_book_refresh_request_message_record.msg_type[extended_book_refresh_request_message_at] = extended_book_refresh_request_message_value; extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Extended Book Refresh Request Message set to where it lies, so a field read out of place says so */
inline ramp_extended_book_refresh_request_message(extended_book_refresh_request_message_record, extended_book_refresh_request_message_base) {
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 20 -> extended_book_refresh_request_message_record.source_id[extended_book_refresh_request_message_at] = (extended_book_refresh_request_message_base + 0 + extended_book_refresh_request_message_at + 1) % 256; extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 4 -> extended_book_refresh_request_message_record.symbol_index[extended_book_refresh_request_message_at] = (extended_book_refresh_request_message_base + 20 + extended_book_refresh_request_message_at + 1) % 256; extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 2 -> extended_book_refresh_request_message_record.msg_type[extended_book_refresh_request_message_at] = (extended_book_refresh_request_message_base + 24 + extended_book_refresh_request_message_at + 1) % 256; extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Book Refresh Request Message to the wire, 26 bytes from where the cursor stands */
inline encode_extended_book_refresh_request_message(extended_book_refresh_request_message_record) {
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 20 -> wire[at] = extended_book_refresh_request_message_record.source_id[extended_book_refresh_request_message_at]; at = at + 1; extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 4 -> wire[at] = extended_book_refresh_request_message_record.symbol_index[extended_book_refresh_request_message_at]; at = at + 1; extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 2 -> wire[at] = extended_book_refresh_request_message_record.msg_type[extended_book_refresh_request_message_at]; at = at + 1; extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Book Refresh Request Message off the wire, 26 bytes from where the cursor stands */
inline decode_extended_book_refresh_request_message(extended_book_refresh_request_message_record) {
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 20 -> extended_book_refresh_request_message_record.source_id[extended_book_refresh_request_message_at] = wire[at]; at = at + 1; extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 4 -> extended_book_refresh_request_message_record.symbol_index[extended_book_refresh_request_message_at] = wire[at]; at = at + 1; extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 2 -> extended_book_refresh_request_message_record.msg_type[extended_book_refresh_request_message_at] = wire[at]; at = at + 1; extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Extended Book Refresh Request Message is what was written, byte for byte */
inline equal_extended_book_refresh_request_message(extended_book_refresh_request_message_read, extended_book_refresh_request_message_written) {
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 20 -> assert(extended_book_refresh_request_message_read.source_id[extended_book_refresh_request_message_at] == extended_book_refresh_request_message_written.source_id[extended_book_refresh_request_message_at]); extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 4 -> assert(extended_book_refresh_request_message_read.symbol_index[extended_book_refresh_request_message_at] == extended_book_refresh_request_message_written.symbol_index[extended_book_refresh_request_message_at]); extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  extended_book_refresh_request_message_at = 0;
  do
  :: extended_book_refresh_request_message_at < 2 -> assert(extended_book_refresh_request_message_read.msg_type[extended_book_refresh_request_message_at] == extended_book_refresh_request_message_written.msg_type[extended_book_refresh_request_message_at]); extended_book_refresh_request_message_at = extended_book_refresh_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Index Mapping Request Message: 24 bytes -------------------------- */

/* This message is sent by clients requesting a refresh of Symbol Index mapping information only. */
typedef SymbolIndexMappingRequestMessage {
  byte source_id[20];
  byte symbol_index[4]
};

int symbol_index_mapping_request_message_at;

/* every byte of Symbol Index Mapping Request Message set to one value */
inline fill_symbol_index_mapping_request_message(symbol_index_mapping_request_message_record, symbol_index_mapping_request_message_value) {
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 20 -> symbol_index_mapping_request_message_record.source_id[symbol_index_mapping_request_message_at] = symbol_index_mapping_request_message_value; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 4 -> symbol_index_mapping_request_message_record.symbol_index[symbol_index_mapping_request_message_at] = symbol_index_mapping_request_message_value; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Index Mapping Request Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_index_mapping_request_message(symbol_index_mapping_request_message_record, symbol_index_mapping_request_message_base) {
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 20 -> symbol_index_mapping_request_message_record.source_id[symbol_index_mapping_request_message_at] = (symbol_index_mapping_request_message_base + 0 + symbol_index_mapping_request_message_at + 1) % 256; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 4 -> symbol_index_mapping_request_message_record.symbol_index[symbol_index_mapping_request_message_at] = (symbol_index_mapping_request_message_base + 20 + symbol_index_mapping_request_message_at + 1) % 256; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Index Mapping Request Message to the wire, 24 bytes from where the cursor stands */
inline encode_symbol_index_mapping_request_message(symbol_index_mapping_request_message_record) {
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 20 -> wire[at] = symbol_index_mapping_request_message_record.source_id[symbol_index_mapping_request_message_at]; at = at + 1; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 4 -> wire[at] = symbol_index_mapping_request_message_record.symbol_index[symbol_index_mapping_request_message_at]; at = at + 1; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Index Mapping Request Message off the wire, 24 bytes from where the cursor stands */
inline decode_symbol_index_mapping_request_message(symbol_index_mapping_request_message_record) {
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 20 -> symbol_index_mapping_request_message_record.source_id[symbol_index_mapping_request_message_at] = wire[at]; at = at + 1; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 4 -> symbol_index_mapping_request_message_record.symbol_index[symbol_index_mapping_request_message_at] = wire[at]; at = at + 1; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Index Mapping Request Message is what was written, byte for byte */
inline equal_symbol_index_mapping_request_message(symbol_index_mapping_request_message_read, symbol_index_mapping_request_message_written) {
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 20 -> assert(symbol_index_mapping_request_message_read.source_id[symbol_index_mapping_request_message_at] == symbol_index_mapping_request_message_written.source_id[symbol_index_mapping_request_message_at]); symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 4 -> assert(symbol_index_mapping_request_message_read.symbol_index[symbol_index_mapping_request_message_at] == symbol_index_mapping_request_message_written.symbol_index[symbol_index_mapping_request_message_at]); symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
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
    assert(at == 16);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 16);
    equal_packet_header(packet_header_got, packet_header_sent)
  }
}

/* Sequence Number Reset Message: encoded, read back, and compared */
proctype check_sequence_number_reset_message() {
  SequenceNumberResetMessage sequence_number_reset_message_sent;
  SequenceNumberResetMessage sequence_number_reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  :: pattern == 1 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 32)
  :: pattern == 2 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 255)
  :: else -> ramp_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_number_reset_message(sequence_number_reset_message_sent);
    assert(at == 4);
    at = 0;
    decode_sequence_number_reset_message(sequence_number_reset_message_got);
    assert(at == 4);
    equal_sequence_number_reset_message(sequence_number_reset_message_got, sequence_number_reset_message_sent)
  }
}

/* Unavailable Message: encoded, read back, and compared */
proctype check_unavailable_message() {
  UnavailableMessage unavailable_message_sent;
  UnavailableMessage unavailable_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unavailable_message(unavailable_message_sent, 0)
  :: pattern == 1 -> fill_unavailable_message(unavailable_message_sent, 32)
  :: pattern == 2 -> fill_unavailable_message(unavailable_message_sent, 255)
  :: else -> ramp_unavailable_message(unavailable_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unavailable_message(unavailable_message_sent);
    assert(at == 8);
    at = 0;
    decode_unavailable_message(unavailable_message_got);
    assert(at == 8);
    equal_unavailable_message(unavailable_message_got, unavailable_message_sent)
  }
}

/* Request Response Message: encoded, read back, and compared */
proctype check_request_response_message() {
  RequestResponseMessage request_response_message_sent;
  RequestResponseMessage request_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_response_message(request_response_message_sent, 0)
  :: pattern == 1 -> fill_request_response_message(request_response_message_sent, 32)
  :: pattern == 2 -> fill_request_response_message(request_response_message_sent, 255)
  :: else -> ramp_request_response_message(request_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_response_message(request_response_message_sent);
    assert(at == 28);
    at = 0;
    decode_request_response_message(request_response_message_got);
    assert(at == 28);
    equal_request_response_message(request_response_message_got, request_response_message_sent)
  }
}

/* Retransmission Request Message: encoded, read back, and compared */
proctype check_retransmission_request_message() {
  RetransmissionRequestMessage retransmission_request_message_sent;
  RetransmissionRequestMessage retransmission_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_request_message(retransmission_request_message_sent, 0)
  :: pattern == 1 -> fill_retransmission_request_message(retransmission_request_message_sent, 32)
  :: pattern == 2 -> fill_retransmission_request_message(retransmission_request_message_sent, 255)
  :: else -> ramp_retransmission_request_message(retransmission_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_request_message(retransmission_request_message_sent);
    assert(at == 28);
    at = 0;
    decode_retransmission_request_message(retransmission_request_message_got);
    assert(at == 28);
    equal_retransmission_request_message(retransmission_request_message_got, retransmission_request_message_sent)
  }
}

/* Book Refresh Request Message: encoded, read back, and compared */
proctype check_book_refresh_request_message() {
  BookRefreshRequestMessage book_refresh_request_message_sent;
  BookRefreshRequestMessage book_refresh_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_book_refresh_request_message(book_refresh_request_message_sent, 0)
  :: pattern == 1 -> fill_book_refresh_request_message(book_refresh_request_message_sent, 32)
  :: pattern == 2 -> fill_book_refresh_request_message(book_refresh_request_message_sent, 255)
  :: else -> ramp_book_refresh_request_message(book_refresh_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_book_refresh_request_message(book_refresh_request_message_sent);
    assert(at == 36);
    at = 0;
    decode_book_refresh_request_message(book_refresh_request_message_got);
    assert(at == 36);
    equal_book_refresh_request_message(book_refresh_request_message_got, book_refresh_request_message_sent)
  }
}

/* Heartbeat Response Message: encoded, read back, and compared */
proctype check_heartbeat_response_message() {
  HeartbeatResponseMessage heartbeat_response_message_sent;
  HeartbeatResponseMessage heartbeat_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_heartbeat_response_message(heartbeat_response_message_sent, 0)
  :: pattern == 1 -> fill_heartbeat_response_message(heartbeat_response_message_sent, 32)
  :: pattern == 2 -> fill_heartbeat_response_message(heartbeat_response_message_sent, 255)
  :: else -> ramp_heartbeat_response_message(heartbeat_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_heartbeat_response_message(heartbeat_response_message_sent);
    assert(at == 20);
    at = 0;
    decode_heartbeat_response_message(heartbeat_response_message_got);
    assert(at == 20);
    equal_heartbeat_response_message(heartbeat_response_message_got, heartbeat_response_message_sent)
  }
}

/* Extended Book Refresh Request Message: encoded, read back, and compared */
proctype check_extended_book_refresh_request_message() {
  ExtendedBookRefreshRequestMessage extended_book_refresh_request_message_sent;
  ExtendedBookRefreshRequestMessage extended_book_refresh_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_extended_book_refresh_request_message(extended_book_refresh_request_message_sent, 0)
  :: pattern == 1 -> fill_extended_book_refresh_request_message(extended_book_refresh_request_message_sent, 32)
  :: pattern == 2 -> fill_extended_book_refresh_request_message(extended_book_refresh_request_message_sent, 255)
  :: else -> ramp_extended_book_refresh_request_message(extended_book_refresh_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_extended_book_refresh_request_message(extended_book_refresh_request_message_sent);
    assert(at == 26);
    at = 0;
    decode_extended_book_refresh_request_message(extended_book_refresh_request_message_got);
    assert(at == 26);
    equal_extended_book_refresh_request_message(extended_book_refresh_request_message_got, extended_book_refresh_request_message_sent)
  }
}

/* Symbol Index Mapping Request Message: encoded, read back, and compared */
proctype check_symbol_index_mapping_request_message() {
  SymbolIndexMappingRequestMessage symbol_index_mapping_request_message_sent;
  SymbolIndexMappingRequestMessage symbol_index_mapping_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_index_mapping_request_message(symbol_index_mapping_request_message_sent, 0)
  :: pattern == 1 -> fill_symbol_index_mapping_request_message(symbol_index_mapping_request_message_sent, 32)
  :: pattern == 2 -> fill_symbol_index_mapping_request_message(symbol_index_mapping_request_message_sent, 255)
  :: else -> ramp_symbol_index_mapping_request_message(symbol_index_mapping_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_index_mapping_request_message(symbol_index_mapping_request_message_sent);
    assert(at == 24);
    at = 0;
    decode_symbol_index_mapping_request_message(symbol_index_mapping_request_message_got);
    assert(at == 24);
    equal_symbol_index_mapping_request_message(symbol_index_mapping_request_message_got, symbol_index_mapping_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_sequence_number_reset_message()
  :: run check_unavailable_message()
  :: run check_request_response_message()
  :: run check_retransmission_request_message()
  :: run check_book_refresh_request_message()
  :: run check_heartbeat_response_message()
  :: run check_extended_book_refresh_request_message()
  :: run check_symbol_index_mapping_request_message()
  fi
}
