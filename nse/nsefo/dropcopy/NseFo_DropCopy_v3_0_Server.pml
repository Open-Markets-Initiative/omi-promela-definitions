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
 *   - a field filling what is left of what holds it
 *   - a Composite rule
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 128

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

/* ---- Response Message Header: 2 bytes ---------------------------------------- */

/* RESPONSE_MESSAGE_HEADER, present once per packet however many messages are packed behind it */
typedef ResponseMessageHeader {
  byte environment_type;
  byte compression_indicator
};

/* every byte of Response Message Header set to one value */
inline fill_response_message_header(response_message_header_record, response_message_header_value) {
  response_message_header_record.environment_type = response_message_header_value;
  response_message_header_record.compression_indicator = response_message_header_value;
  skip
}

/* each byte of Response Message Header set to where it lies, so a field read out of place says so */
inline ramp_response_message_header(response_message_header_record, response_message_header_base) {
  response_message_header_record.environment_type = (response_message_header_base + 0 + 1) % 256;
  response_message_header_record.compression_indicator = (response_message_header_base + 1 + 1) % 256;
  skip
}

/* Response Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_response_message_header(response_message_header_record) {
  wire[at] = response_message_header_record.environment_type; at = at + 1;
  wire[at] = response_message_header_record.compression_indicator; at = at + 1;
  skip
}

/* Response Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_response_message_header(response_message_header_record) {
  response_message_header_record.environment_type = wire[at]; at = at + 1;
  response_message_header_record.compression_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Response Message Header is what was written, byte for byte */
inline equal_response_message_header(response_message_header_read, response_message_header_written) {
  assert(response_message_header_read.environment_type == response_message_header_written.environment_type);
  assert(response_message_header_read.compression_indicator == response_message_header_written.compression_indicator);
  skip
}

/* ---- Message Header: 14 bytes ------------------------------------------------ */

/* MESSAGE_HEADER */
typedef MessageHeader {
  byte transaction_code[2];
  byte error_code[2];
  byte sequence_number[8];
  byte message_length[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.sequence_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.sequence_number[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 12 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 14 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.transaction_code[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.error_code[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.sequence_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 14 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.sequence_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.transaction_code[message_header_at] == message_header_written.transaction_code[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.error_code[message_header_at] == message_header_written.error_code[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.sequence_number[message_header_at] == message_header_written.sequence_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ip Details Partition Wise: 26 bytes ------------------------------------- */

/* IP_DETAILS_PARTITION_WISE */
typedef IpDetailsPartitionWise {
  byte ip_address[16];
  byte port[4];
  byte partition_id[6]
};

int ip_details_partition_wise_at;

/* every byte of Ip Details Partition Wise set to one value */
inline fill_ip_details_partition_wise(ip_details_partition_wise_record, ip_details_partition_wise_value) {
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 16 -> ip_details_partition_wise_record.ip_address[ip_details_partition_wise_at] = ip_details_partition_wise_value; ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 4 -> ip_details_partition_wise_record.port[ip_details_partition_wise_at] = ip_details_partition_wise_value; ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 6 -> ip_details_partition_wise_record.partition_id[ip_details_partition_wise_at] = ip_details_partition_wise_value; ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ip Details Partition Wise set to where it lies, so a field read out of place says so */
inline ramp_ip_details_partition_wise(ip_details_partition_wise_record, ip_details_partition_wise_base) {
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 16 -> ip_details_partition_wise_record.ip_address[ip_details_partition_wise_at] = (ip_details_partition_wise_base + 0 + ip_details_partition_wise_at + 1) % 256; ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 4 -> ip_details_partition_wise_record.port[ip_details_partition_wise_at] = (ip_details_partition_wise_base + 16 + ip_details_partition_wise_at + 1) % 256; ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 6 -> ip_details_partition_wise_record.partition_id[ip_details_partition_wise_at] = (ip_details_partition_wise_base + 20 + ip_details_partition_wise_at + 1) % 256; ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  skip
}

/* Ip Details Partition Wise to the wire, 26 bytes from where the cursor stands */
inline encode_ip_details_partition_wise(ip_details_partition_wise_record) {
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 16 -> wire[at] = ip_details_partition_wise_record.ip_address[ip_details_partition_wise_at]; at = at + 1; ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 4 -> wire[at] = ip_details_partition_wise_record.port[ip_details_partition_wise_at]; at = at + 1; ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 6 -> wire[at] = ip_details_partition_wise_record.partition_id[ip_details_partition_wise_at]; at = at + 1; ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  skip
}

/* Ip Details Partition Wise off the wire, 26 bytes from where the cursor stands */
inline decode_ip_details_partition_wise(ip_details_partition_wise_record) {
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 16 -> ip_details_partition_wise_record.ip_address[ip_details_partition_wise_at] = wire[at]; at = at + 1; ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 4 -> ip_details_partition_wise_record.port[ip_details_partition_wise_at] = wire[at]; at = at + 1; ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 6 -> ip_details_partition_wise_record.partition_id[ip_details_partition_wise_at] = wire[at]; at = at + 1; ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ip Details Partition Wise is what was written, byte for byte */
inline equal_ip_details_partition_wise(ip_details_partition_wise_read, ip_details_partition_wise_written) {
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 16 -> assert(ip_details_partition_wise_read.ip_address[ip_details_partition_wise_at] == ip_details_partition_wise_written.ip_address[ip_details_partition_wise_at]); ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 4 -> assert(ip_details_partition_wise_read.port[ip_details_partition_wise_at] == ip_details_partition_wise_written.port[ip_details_partition_wise_at]); ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  ip_details_partition_wise_at = 0;
  do
  :: ip_details_partition_wise_at < 6 -> assert(ip_details_partition_wise_read.partition_id[ip_details_partition_wise_at] == ip_details_partition_wise_written.partition_id[ip_details_partition_wise_at]); ip_details_partition_wise_at = ip_details_partition_wise_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Gr Response Message: 98 bytes ------------------------------------------- */

/* Returns the addresses of every partition the member must connect to, together with the session key and the cryptographic material for those connections */
typedef GrResponseMessage {
  byte message_indicator[2];
  byte partition_count[2];
  IpDetailsPartitionWise ip_details_partit_c9vwhp;
  byte session_key[8];
  byte cryptographic_key[32];
  byte static_cryptographic_iv[8];
  byte dynamic_cryptographic_iv[8];
  byte cryptographic_additional_key[12]
};

int gr_response_message_at;

/* every byte of Gr Response Message set to one value */
inline fill_gr_response_message(gr_response_message_record, gr_response_message_value) {
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 2 -> gr_response_message_record.message_indicator[gr_response_message_at] = gr_response_message_value; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 2 -> gr_response_message_record.partition_count[gr_response_message_at] = gr_response_message_value; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  fill_ip_details_partition_wise(gr_response_message_record.ip_details_partit_c9vwhp, gr_response_message_value);
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> gr_response_message_record.session_key[gr_response_message_at] = gr_response_message_value; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 32 -> gr_response_message_record.cryptographic_key[gr_response_message_at] = gr_response_message_value; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> gr_response_message_record.static_cryptographic_iv[gr_response_message_at] = gr_response_message_value; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> gr_response_message_record.dynamic_cryptographic_iv[gr_response_message_at] = gr_response_message_value; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 12 -> gr_response_message_record.cryptographic_additional_key[gr_response_message_at] = gr_response_message_value; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Gr Response Message set to where it lies, so a field read out of place says so */
inline ramp_gr_response_message(gr_response_message_record, gr_response_message_base) {
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 2 -> gr_response_message_record.message_indicator[gr_response_message_at] = (gr_response_message_base + 0 + gr_response_message_at + 1) % 256; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 2 -> gr_response_message_record.partition_count[gr_response_message_at] = (gr_response_message_base + 2 + gr_response_message_at + 1) % 256; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  ramp_ip_details_partition_wise(gr_response_message_record.ip_details_partit_c9vwhp, gr_response_message_base + 4);
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> gr_response_message_record.session_key[gr_response_message_at] = (gr_response_message_base + 30 + gr_response_message_at + 1) % 256; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 32 -> gr_response_message_record.cryptographic_key[gr_response_message_at] = (gr_response_message_base + 38 + gr_response_message_at + 1) % 256; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> gr_response_message_record.static_cryptographic_iv[gr_response_message_at] = (gr_response_message_base + 70 + gr_response_message_at + 1) % 256; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> gr_response_message_record.dynamic_cryptographic_iv[gr_response_message_at] = (gr_response_message_base + 78 + gr_response_message_at + 1) % 256; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 12 -> gr_response_message_record.cryptographic_additional_key[gr_response_message_at] = (gr_response_message_base + 86 + gr_response_message_at + 1) % 256; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gr Response Message to the wire, 98 bytes from where the cursor stands */
inline encode_gr_response_message(gr_response_message_record) {
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 2 -> wire[at] = gr_response_message_record.message_indicator[gr_response_message_at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 2 -> wire[at] = gr_response_message_record.partition_count[gr_response_message_at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  encode_ip_details_partition_wise(gr_response_message_record.ip_details_partit_c9vwhp);
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> wire[at] = gr_response_message_record.session_key[gr_response_message_at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 32 -> wire[at] = gr_response_message_record.cryptographic_key[gr_response_message_at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> wire[at] = gr_response_message_record.static_cryptographic_iv[gr_response_message_at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> wire[at] = gr_response_message_record.dynamic_cryptographic_iv[gr_response_message_at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 12 -> wire[at] = gr_response_message_record.cryptographic_additional_key[gr_response_message_at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gr Response Message off the wire, 98 bytes from where the cursor stands */
inline decode_gr_response_message(gr_response_message_record) {
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 2 -> gr_response_message_record.message_indicator[gr_response_message_at] = wire[at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 2 -> gr_response_message_record.partition_count[gr_response_message_at] = wire[at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  decode_ip_details_partition_wise(gr_response_message_record.ip_details_partit_c9vwhp);
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> gr_response_message_record.session_key[gr_response_message_at] = wire[at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 32 -> gr_response_message_record.cryptographic_key[gr_response_message_at] = wire[at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> gr_response_message_record.static_cryptographic_iv[gr_response_message_at] = wire[at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> gr_response_message_record.dynamic_cryptographic_iv[gr_response_message_at] = wire[at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 12 -> gr_response_message_record.cryptographic_additional_key[gr_response_message_at] = wire[at]; at = at + 1; gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Gr Response Message is what was written, byte for byte */
inline equal_gr_response_message(gr_response_message_read, gr_response_message_written) {
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 2 -> assert(gr_response_message_read.message_indicator[gr_response_message_at] == gr_response_message_written.message_indicator[gr_response_message_at]); gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 2 -> assert(gr_response_message_read.partition_count[gr_response_message_at] == gr_response_message_written.partition_count[gr_response_message_at]); gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  equal_ip_details_partition_wise(gr_response_message_read.ip_details_partit_c9vwhp, gr_response_message_written.ip_details_partit_c9vwhp);
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> assert(gr_response_message_read.session_key[gr_response_message_at] == gr_response_message_written.session_key[gr_response_message_at]); gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 32 -> assert(gr_response_message_read.cryptographic_key[gr_response_message_at] == gr_response_message_written.cryptographic_key[gr_response_message_at]); gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> assert(gr_response_message_read.static_cryptographic_iv[gr_response_message_at] == gr_response_message_written.static_cryptographic_iv[gr_response_message_at]); gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 8 -> assert(gr_response_message_read.dynamic_cryptographic_iv[gr_response_message_at] == gr_response_message_written.dynamic_cryptographic_iv[gr_response_message_at]); gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  gr_response_message_at = 0;
  do
  :: gr_response_message_at < 12 -> assert(gr_response_message_read.cryptographic_additional_key[gr_response_message_at] == gr_response_message_written.cryptographic_additional_key[gr_response_message_at]); gr_response_message_at = gr_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Dc Signon Out Message: 12 bytes ----------------------------------------- */

/* Confirms the logon, or terminates the connection when Error Code is set */
typedef DcSignonOutMessage {
  byte user_id[4];
  byte partition_id[6];
  byte concurrent_login_id[2]
};

int dc_signon_out_message_at;

/* every byte of Dc Signon Out Message set to one value */
inline fill_dc_signon_out_message(dc_signon_out_message_record, dc_signon_out_message_value) {
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 4 -> dc_signon_out_message_record.user_id[dc_signon_out_message_at] = dc_signon_out_message_value; dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 6 -> dc_signon_out_message_record.partition_id[dc_signon_out_message_at] = dc_signon_out_message_value; dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 2 -> dc_signon_out_message_record.concurrent_login_id[dc_signon_out_message_at] = dc_signon_out_message_value; dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dc Signon Out Message set to where it lies, so a field read out of place says so */
inline ramp_dc_signon_out_message(dc_signon_out_message_record, dc_signon_out_message_base) {
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 4 -> dc_signon_out_message_record.user_id[dc_signon_out_message_at] = (dc_signon_out_message_base + 0 + dc_signon_out_message_at + 1) % 256; dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 6 -> dc_signon_out_message_record.partition_id[dc_signon_out_message_at] = (dc_signon_out_message_base + 4 + dc_signon_out_message_at + 1) % 256; dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 2 -> dc_signon_out_message_record.concurrent_login_id[dc_signon_out_message_at] = (dc_signon_out_message_base + 10 + dc_signon_out_message_at + 1) % 256; dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Signon Out Message to the wire, 12 bytes from where the cursor stands */
inline encode_dc_signon_out_message(dc_signon_out_message_record) {
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 4 -> wire[at] = dc_signon_out_message_record.user_id[dc_signon_out_message_at]; at = at + 1; dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 6 -> wire[at] = dc_signon_out_message_record.partition_id[dc_signon_out_message_at]; at = at + 1; dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 2 -> wire[at] = dc_signon_out_message_record.concurrent_login_id[dc_signon_out_message_at]; at = at + 1; dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Signon Out Message off the wire, 12 bytes from where the cursor stands */
inline decode_dc_signon_out_message(dc_signon_out_message_record) {
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 4 -> dc_signon_out_message_record.user_id[dc_signon_out_message_at] = wire[at]; at = at + 1; dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 6 -> dc_signon_out_message_record.partition_id[dc_signon_out_message_at] = wire[at]; at = at + 1; dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 2 -> dc_signon_out_message_record.concurrent_login_id[dc_signon_out_message_at] = wire[at]; at = at + 1; dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dc Signon Out Message is what was written, byte for byte */
inline equal_dc_signon_out_message(dc_signon_out_message_read, dc_signon_out_message_written) {
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 4 -> assert(dc_signon_out_message_read.user_id[dc_signon_out_message_at] == dc_signon_out_message_written.user_id[dc_signon_out_message_at]); dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 6 -> assert(dc_signon_out_message_read.partition_id[dc_signon_out_message_at] == dc_signon_out_message_written.partition_id[dc_signon_out_message_at]); dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  dc_signon_out_message_at = 0;
  do
  :: dc_signon_out_message_at < 2 -> assert(dc_signon_out_message_read.concurrent_login_id[dc_signon_out_message_at] == dc_signon_out_message_written.concurrent_login_id[dc_signon_out_message_at]); dc_signon_out_message_at = dc_signon_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Dc Sign Off Message: 12 bytes ------------------------------------------- */

/* Signs the user off the partition */
typedef DcSignOffMessage {
  byte user_id[4];
  byte partition_id[6];
  byte concurrent_login_id[2]
};

int dc_sign_off_message_at;

/* every byte of Dc Sign Off Message set to one value */
inline fill_dc_sign_off_message(dc_sign_off_message_record, dc_sign_off_message_value) {
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 4 -> dc_sign_off_message_record.user_id[dc_sign_off_message_at] = dc_sign_off_message_value; dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 6 -> dc_sign_off_message_record.partition_id[dc_sign_off_message_at] = dc_sign_off_message_value; dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 2 -> dc_sign_off_message_record.concurrent_login_id[dc_sign_off_message_at] = dc_sign_off_message_value; dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dc Sign Off Message set to where it lies, so a field read out of place says so */
inline ramp_dc_sign_off_message(dc_sign_off_message_record, dc_sign_off_message_base) {
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 4 -> dc_sign_off_message_record.user_id[dc_sign_off_message_at] = (dc_sign_off_message_base + 0 + dc_sign_off_message_at + 1) % 256; dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 6 -> dc_sign_off_message_record.partition_id[dc_sign_off_message_at] = (dc_sign_off_message_base + 4 + dc_sign_off_message_at + 1) % 256; dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 2 -> dc_sign_off_message_record.concurrent_login_id[dc_sign_off_message_at] = (dc_sign_off_message_base + 10 + dc_sign_off_message_at + 1) % 256; dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Sign Off Message to the wire, 12 bytes from where the cursor stands */
inline encode_dc_sign_off_message(dc_sign_off_message_record) {
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 4 -> wire[at] = dc_sign_off_message_record.user_id[dc_sign_off_message_at]; at = at + 1; dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 6 -> wire[at] = dc_sign_off_message_record.partition_id[dc_sign_off_message_at]; at = at + 1; dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 2 -> wire[at] = dc_sign_off_message_record.concurrent_login_id[dc_sign_off_message_at]; at = at + 1; dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Sign Off Message off the wire, 12 bytes from where the cursor stands */
inline decode_dc_sign_off_message(dc_sign_off_message_record) {
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 4 -> dc_sign_off_message_record.user_id[dc_sign_off_message_at] = wire[at]; at = at + 1; dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 6 -> dc_sign_off_message_record.partition_id[dc_sign_off_message_at] = wire[at]; at = at + 1; dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 2 -> dc_sign_off_message_record.concurrent_login_id[dc_sign_off_message_at] = wire[at]; at = at + 1; dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dc Sign Off Message is what was written, byte for byte */
inline equal_dc_sign_off_message(dc_sign_off_message_read, dc_sign_off_message_written) {
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 4 -> assert(dc_sign_off_message_read.user_id[dc_sign_off_message_at] == dc_sign_off_message_written.user_id[dc_sign_off_message_at]); dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 6 -> assert(dc_sign_off_message_read.partition_id[dc_sign_off_message_at] == dc_sign_off_message_written.partition_id[dc_sign_off_message_at]); dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  dc_sign_off_message_at = 0;
  do
  :: dc_sign_off_message_at < 2 -> assert(dc_sign_off_message_read.concurrent_login_id[dc_sign_off_message_at] == dc_sign_off_message_written.concurrent_login_id[dc_sign_off_message_at]); dc_sign_off_message_at = dc_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Dc Error Response Trade Message: 128 bytes ------------------------------ */

/* Rejects a trade only request, the reason given in the Error Code of the Message Header */
typedef DcErrorResponseTradeMessage {
  byte error_message[128]
};

int dc_error_response_trade_message_at;

/* every byte of Dc Error Response Trade Message set to one value */
inline fill_dc_error_response_trade_message(dc_error_response_trade_message_record, dc_error_response_trade_message_value) {
  dc_error_response_trade_message_at = 0;
  do
  :: dc_error_response_trade_message_at < 128 -> dc_error_response_trade_message_record.error_message[dc_error_response_trade_message_at] = dc_error_response_trade_message_value; dc_error_response_trade_message_at = dc_error_response_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dc Error Response Trade Message set to where it lies, so a field read out of place says so */
inline ramp_dc_error_response_trade_message(dc_error_response_trade_message_record, dc_error_response_trade_message_base) {
  dc_error_response_trade_message_at = 0;
  do
  :: dc_error_response_trade_message_at < 128 -> dc_error_response_trade_message_record.error_message[dc_error_response_trade_message_at] = (dc_error_response_trade_message_base + 0 + dc_error_response_trade_message_at + 1) % 256; dc_error_response_trade_message_at = dc_error_response_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Error Response Trade Message to the wire, 128 bytes from where the cursor stands */
inline encode_dc_error_response_trade_message(dc_error_response_trade_message_record) {
  dc_error_response_trade_message_at = 0;
  do
  :: dc_error_response_trade_message_at < 128 -> wire[at] = dc_error_response_trade_message_record.error_message[dc_error_response_trade_message_at]; at = at + 1; dc_error_response_trade_message_at = dc_error_response_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Error Response Trade Message off the wire, 128 bytes from where the cursor stands */
inline decode_dc_error_response_trade_message(dc_error_response_trade_message_record) {
  dc_error_response_trade_message_at = 0;
  do
  :: dc_error_response_trade_message_at < 128 -> dc_error_response_trade_message_record.error_message[dc_error_response_trade_message_at] = wire[at]; at = at + 1; dc_error_response_trade_message_at = dc_error_response_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dc Error Response Trade Message is what was written, byte for byte */
inline equal_dc_error_response_trade_message(dc_error_response_trade_message_read, dc_error_response_trade_message_written) {
  dc_error_response_trade_message_at = 0;
  do
  :: dc_error_response_trade_message_at < 128 -> assert(dc_error_response_trade_message_read.error_message[dc_error_response_trade_message_at] == dc_error_response_trade_message_written.error_message[dc_error_response_trade_message_at]); dc_error_response_trade_message_at = dc_error_response_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Dc Error Response Order Message: 128 bytes ------------------------------ */

/* Rejects an order and trade request, the reason given in the Error Code of the Message Header */
typedef DcErrorResponseOrderMessage {
  byte error_message[128]
};

int dc_error_response_order_message_at;

/* every byte of Dc Error Response Order Message set to one value */
inline fill_dc_error_response_order_message(dc_error_response_order_message_record, dc_error_response_order_message_value) {
  dc_error_response_order_message_at = 0;
  do
  :: dc_error_response_order_message_at < 128 -> dc_error_response_order_message_record.error_message[dc_error_response_order_message_at] = dc_error_response_order_message_value; dc_error_response_order_message_at = dc_error_response_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dc Error Response Order Message set to where it lies, so a field read out of place says so */
inline ramp_dc_error_response_order_message(dc_error_response_order_message_record, dc_error_response_order_message_base) {
  dc_error_response_order_message_at = 0;
  do
  :: dc_error_response_order_message_at < 128 -> dc_error_response_order_message_record.error_message[dc_error_response_order_message_at] = (dc_error_response_order_message_base + 0 + dc_error_response_order_message_at + 1) % 256; dc_error_response_order_message_at = dc_error_response_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Error Response Order Message to the wire, 128 bytes from where the cursor stands */
inline encode_dc_error_response_order_message(dc_error_response_order_message_record) {
  dc_error_response_order_message_at = 0;
  do
  :: dc_error_response_order_message_at < 128 -> wire[at] = dc_error_response_order_message_record.error_message[dc_error_response_order_message_at]; at = at + 1; dc_error_response_order_message_at = dc_error_response_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dc Error Response Order Message off the wire, 128 bytes from where the cursor stands */
inline decode_dc_error_response_order_message(dc_error_response_order_message_record) {
  dc_error_response_order_message_at = 0;
  do
  :: dc_error_response_order_message_at < 128 -> dc_error_response_order_message_record.error_message[dc_error_response_order_message_at] = wire[at]; at = at + 1; dc_error_response_order_message_at = dc_error_response_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dc Error Response Order Message is what was written, byte for byte */
inline equal_dc_error_response_order_message(dc_error_response_order_message_read, dc_error_response_order_message_written) {
  dc_error_response_order_message_at = 0;
  do
  :: dc_error_response_order_message_at < 128 -> assert(dc_error_response_order_message_read.error_message[dc_error_response_order_message_at] == dc_error_response_order_message_written.error_message[dc_error_response_order_message_at]); dc_error_response_order_message_at = dc_error_response_order_message_at + 1
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

/* Response Message Header: encoded, read back, and compared */
proctype check_response_message_header() {
  ResponseMessageHeader response_message_header_sent;
  ResponseMessageHeader response_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_response_message_header(response_message_header_sent, 0)
  :: pattern == 1 -> fill_response_message_header(response_message_header_sent, 32)
  :: pattern == 2 -> fill_response_message_header(response_message_header_sent, 255)
  :: else -> ramp_response_message_header(response_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_response_message_header(response_message_header_sent);
    assert(at == 2);
    at = 0;
    decode_response_message_header(response_message_header_got);
    assert(at == 2);
    equal_response_message_header(response_message_header_got, response_message_header_sent)
  }
}

/* Message Header: encoded, read back, and compared */
proctype check_message_header() {
  MessageHeader message_header_sent;
  MessageHeader message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_header(message_header_sent, 0)
  :: pattern == 1 -> fill_message_header(message_header_sent, 32)
  :: pattern == 2 -> fill_message_header(message_header_sent, 255)
  :: else -> ramp_message_header(message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_header(message_header_sent);
    assert(at == 14);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 14);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Ip Details Partition Wise: encoded, read back, and compared */
proctype check_ip_details_partition_wise() {
  IpDetailsPartitionWise ip_details_partition_wise_sent;
  IpDetailsPartitionWise ip_details_partition_wise_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ip_details_partition_wise(ip_details_partition_wise_sent, 0)
  :: pattern == 1 -> fill_ip_details_partition_wise(ip_details_partition_wise_sent, 32)
  :: pattern == 2 -> fill_ip_details_partition_wise(ip_details_partition_wise_sent, 255)
  :: else -> ramp_ip_details_partition_wise(ip_details_partition_wise_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ip_details_partition_wise(ip_details_partition_wise_sent);
    assert(at == 26);
    at = 0;
    decode_ip_details_partition_wise(ip_details_partition_wise_got);
    assert(at == 26);
    equal_ip_details_partition_wise(ip_details_partition_wise_got, ip_details_partition_wise_sent)
  }
}

/* Gr Response Message: encoded, read back, and compared */
proctype check_gr_response_message() {
  GrResponseMessage gr_response_message_sent;
  GrResponseMessage gr_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_gr_response_message(gr_response_message_sent, 0)
  :: pattern == 1 -> fill_gr_response_message(gr_response_message_sent, 32)
  :: pattern == 2 -> fill_gr_response_message(gr_response_message_sent, 255)
  :: else -> ramp_gr_response_message(gr_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_gr_response_message(gr_response_message_sent);
    assert(at == 98);
    at = 0;
    decode_gr_response_message(gr_response_message_got);
    assert(at == 98);
    equal_gr_response_message(gr_response_message_got, gr_response_message_sent)
  }
}

/* Dc Signon Out Message: encoded, read back, and compared */
proctype check_dc_signon_out_message() {
  DcSignonOutMessage dc_signon_out_message_sent;
  DcSignonOutMessage dc_signon_out_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_signon_out_message(dc_signon_out_message_sent, 0)
  :: pattern == 1 -> fill_dc_signon_out_message(dc_signon_out_message_sent, 32)
  :: pattern == 2 -> fill_dc_signon_out_message(dc_signon_out_message_sent, 255)
  :: else -> ramp_dc_signon_out_message(dc_signon_out_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_signon_out_message(dc_signon_out_message_sent);
    assert(at == 12);
    at = 0;
    decode_dc_signon_out_message(dc_signon_out_message_got);
    assert(at == 12);
    equal_dc_signon_out_message(dc_signon_out_message_got, dc_signon_out_message_sent)
  }
}

/* Dc Sign Off Message: encoded, read back, and compared */
proctype check_dc_sign_off_message() {
  DcSignOffMessage dc_sign_off_message_sent;
  DcSignOffMessage dc_sign_off_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_sign_off_message(dc_sign_off_message_sent, 0)
  :: pattern == 1 -> fill_dc_sign_off_message(dc_sign_off_message_sent, 32)
  :: pattern == 2 -> fill_dc_sign_off_message(dc_sign_off_message_sent, 255)
  :: else -> ramp_dc_sign_off_message(dc_sign_off_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_sign_off_message(dc_sign_off_message_sent);
    assert(at == 12);
    at = 0;
    decode_dc_sign_off_message(dc_sign_off_message_got);
    assert(at == 12);
    equal_dc_sign_off_message(dc_sign_off_message_got, dc_sign_off_message_sent)
  }
}

/* Dc Error Response Trade Message: encoded, read back, and compared */
proctype check_dc_error_response_trade_message() {
  DcErrorResponseTradeMessage dc_error_response_trade_message_sent;
  DcErrorResponseTradeMessage dc_error_response_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_error_response_trade_message(dc_error_response_trade_message_sent, 0)
  :: pattern == 1 -> fill_dc_error_response_trade_message(dc_error_response_trade_message_sent, 32)
  :: pattern == 2 -> fill_dc_error_response_trade_message(dc_error_response_trade_message_sent, 255)
  :: else -> ramp_dc_error_response_trade_message(dc_error_response_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_error_response_trade_message(dc_error_response_trade_message_sent);
    assert(at == 128);
    at = 0;
    decode_dc_error_response_trade_message(dc_error_response_trade_message_got);
    assert(at == 128);
    equal_dc_error_response_trade_message(dc_error_response_trade_message_got, dc_error_response_trade_message_sent)
  }
}

/* Dc Error Response Order Message: encoded, read back, and compared */
proctype check_dc_error_response_order_message() {
  DcErrorResponseOrderMessage dc_error_response_order_message_sent;
  DcErrorResponseOrderMessage dc_error_response_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dc_error_response_order_message(dc_error_response_order_message_sent, 0)
  :: pattern == 1 -> fill_dc_error_response_order_message(dc_error_response_order_message_sent, 32)
  :: pattern == 2 -> fill_dc_error_response_order_message(dc_error_response_order_message_sent, 255)
  :: else -> ramp_dc_error_response_order_message(dc_error_response_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dc_error_response_order_message(dc_error_response_order_message_sent);
    assert(at == 128);
    at = 0;
    decode_dc_error_response_order_message(dc_error_response_order_message_got);
    assert(at == 128);
    equal_dc_error_response_order_message(dc_error_response_order_message_got, dc_error_response_order_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_response_message_header()
  :: run check_message_header()
  :: run check_ip_details_partition_wise()
  :: run check_gr_response_message()
  :: run check_dc_signon_out_message()
  :: run check_dc_sign_off_message()
  :: run check_dc_error_response_trade_message()
  :: run check_dc_error_response_order_message()
  fi
}
