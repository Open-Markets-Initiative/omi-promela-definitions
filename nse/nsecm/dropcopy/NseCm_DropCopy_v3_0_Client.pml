/*
 * National Stock Exchange of India Ltd Drop Copy
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 24

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 22 bytes ------------------------------------------------- */

/* Drop copy twenty two byte packet header */
typedef PacketHeader {
  byte packet_length[2];
  byte packet_sequence_number[4];
  byte checksum[16]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 16 -> packet_header_record.checksum[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = (packet_header_base + 2 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 16 -> packet_header_record.checksum[packet_header_at] = (packet_header_base + 6 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 22 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.packet_length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.packet_sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 16 -> wire[at] = packet_header_record.checksum[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 22 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 16 -> packet_header_record.checksum[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.packet_length[packet_header_at] == packet_header_written.packet_length[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.packet_sequence_number[packet_header_at] == packet_header_written.packet_sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 16 -> assert(packet_header_read.checksum[packet_header_at] == packet_header_written.checksum[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Request Message Header: 24 bytes ---------------------------------------- */

/* REQUEST_MESSAGE_HEADER */
typedef RequestMessageHeader {
  byte transaction_code[2];
  byte trader_id[4];
  byte request_sequence_number[8];
  byte partition_id[6];
  byte concurrent_login_id[2];
  byte func_indc;
  byte reserve
};

int request_message_header_at;

/* every byte of Request Message Header set to one value */
inline fill_request_message_header(request_message_header_record, request_message_header_value) {
  request_message_header_at = 0;
  do
  :: request_message_header_at < 2 -> request_message_header_record.transaction_code[request_message_header_at] = request_message_header_value; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 4 -> request_message_header_record.trader_id[request_message_header_at] = request_message_header_value; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 8 -> request_message_header_record.request_sequence_number[request_message_header_at] = request_message_header_value; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 6 -> request_message_header_record.partition_id[request_message_header_at] = request_message_header_value; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 2 -> request_message_header_record.concurrent_login_id[request_message_header_at] = request_message_header_value; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_record.func_indc = request_message_header_value;
  request_message_header_record.reserve = request_message_header_value;
  skip
}

/* each byte of Request Message Header set to where it lies, so a field read out of place says so */
inline ramp_request_message_header(request_message_header_record, request_message_header_base) {
  request_message_header_at = 0;
  do
  :: request_message_header_at < 2 -> request_message_header_record.transaction_code[request_message_header_at] = (request_message_header_base + 0 + request_message_header_at + 1) % 256; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 4 -> request_message_header_record.trader_id[request_message_header_at] = (request_message_header_base + 2 + request_message_header_at + 1) % 256; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 8 -> request_message_header_record.request_sequence_number[request_message_header_at] = (request_message_header_base + 6 + request_message_header_at + 1) % 256; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 6 -> request_message_header_record.partition_id[request_message_header_at] = (request_message_header_base + 14 + request_message_header_at + 1) % 256; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 2 -> request_message_header_record.concurrent_login_id[request_message_header_at] = (request_message_header_base + 20 + request_message_header_at + 1) % 256; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_record.func_indc = (request_message_header_base + 22 + 1) % 256;
  request_message_header_record.reserve = (request_message_header_base + 23 + 1) % 256;
  skip
}

/* Request Message Header to the wire, 24 bytes from where the cursor stands */
inline encode_request_message_header(request_message_header_record) {
  request_message_header_at = 0;
  do
  :: request_message_header_at < 2 -> wire[at] = request_message_header_record.transaction_code[request_message_header_at]; at = at + 1; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 4 -> wire[at] = request_message_header_record.trader_id[request_message_header_at]; at = at + 1; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 8 -> wire[at] = request_message_header_record.request_sequence_number[request_message_header_at]; at = at + 1; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 6 -> wire[at] = request_message_header_record.partition_id[request_message_header_at]; at = at + 1; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 2 -> wire[at] = request_message_header_record.concurrent_login_id[request_message_header_at]; at = at + 1; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  wire[at] = request_message_header_record.func_indc; at = at + 1;
  wire[at] = request_message_header_record.reserve; at = at + 1;
  skip
}

/* Request Message Header off the wire, 24 bytes from where the cursor stands */
inline decode_request_message_header(request_message_header_record) {
  request_message_header_at = 0;
  do
  :: request_message_header_at < 2 -> request_message_header_record.transaction_code[request_message_header_at] = wire[at]; at = at + 1; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 4 -> request_message_header_record.trader_id[request_message_header_at] = wire[at]; at = at + 1; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 8 -> request_message_header_record.request_sequence_number[request_message_header_at] = wire[at]; at = at + 1; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 6 -> request_message_header_record.partition_id[request_message_header_at] = wire[at]; at = at + 1; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 2 -> request_message_header_record.concurrent_login_id[request_message_header_at] = wire[at]; at = at + 1; request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_record.func_indc = wire[at]; at = at + 1;
  request_message_header_record.reserve = wire[at]; at = at + 1;
  skip
}

/* what was read of Request Message Header is what was written, byte for byte */
inline equal_request_message_header(request_message_header_read, request_message_header_written) {
  request_message_header_at = 0;
  do
  :: request_message_header_at < 2 -> assert(request_message_header_read.transaction_code[request_message_header_at] == request_message_header_written.transaction_code[request_message_header_at]); request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 4 -> assert(request_message_header_read.trader_id[request_message_header_at] == request_message_header_written.trader_id[request_message_header_at]); request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 8 -> assert(request_message_header_read.request_sequence_number[request_message_header_at] == request_message_header_written.request_sequence_number[request_message_header_at]); request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 6 -> assert(request_message_header_read.partition_id[request_message_header_at] == request_message_header_written.partition_id[request_message_header_at]); request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  request_message_header_at = 0;
  do
  :: request_message_header_at < 2 -> assert(request_message_header_read.concurrent_login_id[request_message_header_at] == request_message_header_written.concurrent_login_id[request_message_header_at]); request_message_header_at = request_message_header_at + 1
  :: else -> break
  od;
  assert(request_message_header_read.func_indc == request_message_header_written.func_indc);
  assert(request_message_header_read.reserve == request_message_header_written.reserve);
  skip
}

/* ---- Dc Signon In Message: 16 bytes ------------------------------------------ */

/* Logs the member on to a partition of the drop copy service */
typedef DcSignonInMessage {
  byte password[8];
  byte session_key[8]
};

int dc_signon_in_message_at;

/* every byte of Dc Signon In Message set to one value */
inline fill_dc_signon_in_message(dc_signon_in_message_record, dc_signon_in_message_value) {
  dc_signon_in_message_at = 0;
  do
  :: dc_signon_in_message_at < 8 -> dc_signon_in_message_record.password[dc_signon_in_message_at] = dc_signon_in_message_value; dc_signon_in_message_at = dc_signon_in_message_at + 1
  :: else -> break
  od;
  dc_signon_in_message_at = 0;
  do
  :: dc_signon_in_message_at < 8 -> dc_signon_in_message_record.session_key[dc_signon_in_message_at] = dc_signon_in_message_value; dc_signon_in_message_at = dc_signon_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dc Signon In Message set to where it lies, so a field read out of place says so */
inline ramp_dc_signon_in_message(dc_signon_in_message_record, dc_signon_in_message_base) {
  dc_signon_in_message_at = 0;
  do
  :: dc_signon_in_message_at < 8 -> dc_signon_in_message_record.password[dc_signon_in_message_at] = (dc_signon_in_message_base + 0 + dc_signon_in_message_at + 1) % 256; dc_signon_in_message_at = dc_signon_in_message_at + 1
  :: else -> break
  od;
  dc_signon_in_message_at = 0;
  do
  :: dc_signon_in_message_at < 8 -> dc_signon_in_message_record.session_key[dc_signon_in_message_at] = (dc_signon_in_message_base + 8 + dc_signon_in_message_at + 1) % 256; dc_signon_in_message_at = dc_signon_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Signon In Message to the wire, 16 bytes from where the cursor stands */
inline encode_dc_signon_in_message(dc_signon_in_message_record) {
  dc_signon_in_message_at = 0;
  do
  :: dc_signon_in_message_at < 8 -> wire[at] = dc_signon_in_message_record.password[dc_signon_in_message_at]; at = at + 1; dc_signon_in_message_at = dc_signon_in_message_at + 1
  :: else -> break
  od;
  dc_signon_in_message_at = 0;
  do
  :: dc_signon_in_message_at < 8 -> wire[at] = dc_signon_in_message_record.session_key[dc_signon_in_message_at]; at = at + 1; dc_signon_in_message_at = dc_signon_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Signon In Message off the wire, 16 bytes from where the cursor stands */
inline decode_dc_signon_in_message(dc_signon_in_message_record) {
  dc_signon_in_message_at = 0;
  do
  :: dc_signon_in_message_at < 8 -> dc_signon_in_message_record.password[dc_signon_in_message_at] = wire[at]; at = at + 1; dc_signon_in_message_at = dc_signon_in_message_at + 1
  :: else -> break
  od;
  dc_signon_in_message_at = 0;
  do
  :: dc_signon_in_message_at < 8 -> dc_signon_in_message_record.session_key[dc_signon_in_message_at] = wire[at]; at = at + 1; dc_signon_in_message_at = dc_signon_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dc Signon In Message is what was written, byte for byte */
inline equal_dc_signon_in_message(dc_signon_in_message_read, dc_signon_in_message_written) {
  dc_signon_in_message_at = 0;
  do
  :: dc_signon_in_message_at < 8 -> assert(dc_signon_in_message_read.password[dc_signon_in_message_at] == dc_signon_in_message_written.password[dc_signon_in_message_at]); dc_signon_in_message_at = dc_signon_in_message_at + 1
  :: else -> break
  od;
  dc_signon_in_message_at = 0;
  do
  :: dc_signon_in_message_at < 8 -> assert(dc_signon_in_message_read.session_key[dc_signon_in_message_at] == dc_signon_in_message_written.session_key[dc_signon_in_message_at]); dc_signon_in_message_at = dc_signon_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Dc Trd Subscription Request Message: 8 bytes ---------------------------- */

/* Subscribes to the trade only drop copy on this partition from the named sequence number */
typedef DcTrdSubscriptionRequestMessage {
  byte sequence_number[8]
};

int dc_trd_subscription_request_message_at;

/* every byte of Dc Trd Subscription Request Message set to one value */
inline fill_dc_trd_subscription_request_message(dc_trd_subscription_request_message_record, dc_trd_subscription_request_message_value) {
  dc_trd_subscription_request_message_at = 0;
  do
  :: dc_trd_subscription_request_message_at < 8 -> dc_trd_subscription_request_message_record.sequence_number[dc_trd_subscription_request_message_at] = dc_trd_subscription_request_message_value; dc_trd_subscription_request_message_at = dc_trd_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dc Trd Subscription Request Message set to where it lies, so a field read out of place says so */
inline ramp_dc_trd_subscription_request_message(dc_trd_subscription_request_message_record, dc_trd_subscription_request_message_base) {
  dc_trd_subscription_request_message_at = 0;
  do
  :: dc_trd_subscription_request_message_at < 8 -> dc_trd_subscription_request_message_record.sequence_number[dc_trd_subscription_request_message_at] = (dc_trd_subscription_request_message_base + 0 + dc_trd_subscription_request_message_at + 1) % 256; dc_trd_subscription_request_message_at = dc_trd_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Trd Subscription Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_dc_trd_subscription_request_message(dc_trd_subscription_request_message_record) {
  dc_trd_subscription_request_message_at = 0;
  do
  :: dc_trd_subscription_request_message_at < 8 -> wire[at] = dc_trd_subscription_request_message_record.sequence_number[dc_trd_subscription_request_message_at]; at = at + 1; dc_trd_subscription_request_message_at = dc_trd_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Trd Subscription Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_dc_trd_subscription_request_message(dc_trd_subscription_request_message_record) {
  dc_trd_subscription_request_message_at = 0;
  do
  :: dc_trd_subscription_request_message_at < 8 -> dc_trd_subscription_request_message_record.sequence_number[dc_trd_subscription_request_message_at] = wire[at]; at = at + 1; dc_trd_subscription_request_message_at = dc_trd_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dc Trd Subscription Request Message is what was written, byte for byte */
inline equal_dc_trd_subscription_request_message(dc_trd_subscription_request_message_read, dc_trd_subscription_request_message_written) {
  dc_trd_subscription_request_message_at = 0;
  do
  :: dc_trd_subscription_request_message_at < 8 -> assert(dc_trd_subscription_request_message_read.sequence_number[dc_trd_subscription_request_message_at] == dc_trd_subscription_request_message_written.sequence_number[dc_trd_subscription_request_message_at]); dc_trd_subscription_request_message_at = dc_trd_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Dc Ont Subscription Request Message: 8 bytes ---------------------------- */

/* Subscribes to the order and trade drop copy on this partition from the named sequence number */
typedef DcOntSubscriptionRequestMessage {
  byte sequence_number[8]
};

int dc_ont_subscription_request_message_at;

/* every byte of Dc Ont Subscription Request Message set to one value */
inline fill_dc_ont_subscription_request_message(dc_ont_subscription_request_message_record, dc_ont_subscription_request_message_value) {
  dc_ont_subscription_request_message_at = 0;
  do
  :: dc_ont_subscription_request_message_at < 8 -> dc_ont_subscription_request_message_record.sequence_number[dc_ont_subscription_request_message_at] = dc_ont_subscription_request_message_value; dc_ont_subscription_request_message_at = dc_ont_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dc Ont Subscription Request Message set to where it lies, so a field read out of place says so */
inline ramp_dc_ont_subscription_request_message(dc_ont_subscription_request_message_record, dc_ont_subscription_request_message_base) {
  dc_ont_subscription_request_message_at = 0;
  do
  :: dc_ont_subscription_request_message_at < 8 -> dc_ont_subscription_request_message_record.sequence_number[dc_ont_subscription_request_message_at] = (dc_ont_subscription_request_message_base + 0 + dc_ont_subscription_request_message_at + 1) % 256; dc_ont_subscription_request_message_at = dc_ont_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Ont Subscription Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_dc_ont_subscription_request_message(dc_ont_subscription_request_message_record) {
  dc_ont_subscription_request_message_at = 0;
  do
  :: dc_ont_subscription_request_message_at < 8 -> wire[at] = dc_ont_subscription_request_message_record.sequence_number[dc_ont_subscription_request_message_at]; at = at + 1; dc_ont_subscription_request_message_at = dc_ont_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Ont Subscription Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_dc_ont_subscription_request_message(dc_ont_subscription_request_message_record) {
  dc_ont_subscription_request_message_at = 0;
  do
  :: dc_ont_subscription_request_message_at < 8 -> dc_ont_subscription_request_message_record.sequence_number[dc_ont_subscription_request_message_at] = wire[at]; at = at + 1; dc_ont_subscription_request_message_at = dc_ont_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dc Ont Subscription Request Message is what was written, byte for byte */
inline equal_dc_ont_subscription_request_message(dc_ont_subscription_request_message_read, dc_ont_subscription_request_message_written) {
  dc_ont_subscription_request_message_at = 0;
  do
  :: dc_ont_subscription_request_message_at < 8 -> assert(dc_ont_subscription_request_message_read.sequence_number[dc_ont_subscription_request_message_at] == dc_ont_subscription_request_message_written.sequence_number[dc_ont_subscription_request_message_at]); dc_ont_subscription_request_message_at = dc_ont_subscription_request_message_at + 1
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
    assert(at == 22);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 22);
    equal_packet_header(packet_header_got, packet_header_sent)
  }
}

/* Request Message Header: encoded, read back, and compared */
proctype check_request_message_header() {
  RequestMessageHeader request_message_header_sent;
  RequestMessageHeader request_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_message_header(request_message_header_sent, 0)
  :: pattern == 1 -> fill_request_message_header(request_message_header_sent, 32)
  :: pattern == 2 -> fill_request_message_header(request_message_header_sent, 255)
  :: else -> ramp_request_message_header(request_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_message_header(request_message_header_sent);
    assert(at == 24);
    at = 0;
    decode_request_message_header(request_message_header_got);
    assert(at == 24);
    equal_request_message_header(request_message_header_got, request_message_header_sent)
  }
}

/* Dc Signon In Message: encoded, read back, and compared */
proctype check_dc_signon_in_message() {
  DcSignonInMessage dc_signon_in_message_sent;
  DcSignonInMessage dc_signon_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_signon_in_message(dc_signon_in_message_sent, 0)
  :: pattern == 1 -> fill_dc_signon_in_message(dc_signon_in_message_sent, 32)
  :: pattern == 2 -> fill_dc_signon_in_message(dc_signon_in_message_sent, 255)
  :: else -> ramp_dc_signon_in_message(dc_signon_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_signon_in_message(dc_signon_in_message_sent);
    assert(at == 16);
    at = 0;
    decode_dc_signon_in_message(dc_signon_in_message_got);
    assert(at == 16);
    equal_dc_signon_in_message(dc_signon_in_message_got, dc_signon_in_message_sent)
  }
}

/* Dc Trd Subscription Request Message: encoded, read back, and compared */
proctype check_dc_trd_subscription_request_message() {
  DcTrdSubscriptionRequestMessage dc_trd_subscription_request_message_sent;
  DcTrdSubscriptionRequestMessage dc_trd_subscription_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_trd_subscription_request_message(dc_trd_subscription_request_message_sent, 0)
  :: pattern == 1 -> fill_dc_trd_subscription_request_message(dc_trd_subscription_request_message_sent, 32)
  :: pattern == 2 -> fill_dc_trd_subscription_request_message(dc_trd_subscription_request_message_sent, 255)
  :: else -> ramp_dc_trd_subscription_request_message(dc_trd_subscription_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_trd_subscription_request_message(dc_trd_subscription_request_message_sent);
    assert(at == 8);
    at = 0;
    decode_dc_trd_subscription_request_message(dc_trd_subscription_request_message_got);
    assert(at == 8);
    equal_dc_trd_subscription_request_message(dc_trd_subscription_request_message_got, dc_trd_subscription_request_message_sent)
  }
}

/* Dc Ont Subscription Request Message: encoded, read back, and compared */
proctype check_dc_ont_subscription_request_message() {
  DcOntSubscriptionRequestMessage dc_ont_subscription_request_message_sent;
  DcOntSubscriptionRequestMessage dc_ont_subscription_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_ont_subscription_request_message(dc_ont_subscription_request_message_sent, 0)
  :: pattern == 1 -> fill_dc_ont_subscription_request_message(dc_ont_subscription_request_message_sent, 32)
  :: pattern == 2 -> fill_dc_ont_subscription_request_message(dc_ont_subscription_request_message_sent, 255)
  :: else -> ramp_dc_ont_subscription_request_message(dc_ont_subscription_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_ont_subscription_request_message(dc_ont_subscription_request_message_sent);
    assert(at == 8);
    at = 0;
    decode_dc_ont_subscription_request_message(dc_ont_subscription_request_message_got);
    assert(at == 8);
    equal_dc_ont_subscription_request_message(dc_ont_subscription_request_message_got, dc_ont_subscription_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_request_message_header()
  :: run check_dc_signon_in_message()
  :: run check_dc_trd_subscription_request_message()
  :: run check_dc_ont_subscription_request_message()
  fi
}
