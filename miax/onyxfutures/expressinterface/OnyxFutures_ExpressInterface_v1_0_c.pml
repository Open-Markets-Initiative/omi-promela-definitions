/*
 * Miami International Holdings Express Interface
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
 *   - a field read in bits
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 102

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Sesm Packet Header: 3 bytes --------------------------------------------- */

/* SesM packet header */
typedef SesmPacketHeader {
  byte sesm_packet_length[2];
  byte sesm_packet_type
};

int sesm_packet_header_at;

/* every byte of Sesm Packet Header set to one value */
inline fill_sesm_packet_header(sesm_packet_header_record, sesm_packet_header_value) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at] = sesm_packet_header_value; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  sesm_packet_header_record.sesm_packet_type = sesm_packet_header_value;
  skip
}

/* each byte of Sesm Packet Header set to where it lies, so a field read out of place says so */
inline ramp_sesm_packet_header(sesm_packet_header_record, sesm_packet_header_base) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at] = (sesm_packet_header_base + 0 + sesm_packet_header_at + 1) % 256; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  sesm_packet_header_record.sesm_packet_type = (sesm_packet_header_base + 2 + 1) % 256;
  skip
}

/* Sesm Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_sesm_packet_header(sesm_packet_header_record) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> wire[at] = sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at]; at = at + 1; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = sesm_packet_header_record.sesm_packet_type; at = at + 1;
  skip
}

/* Sesm Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_sesm_packet_header(sesm_packet_header_record) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at] = wire[at]; at = at + 1; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  sesm_packet_header_record.sesm_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Sesm Packet Header is what was written, byte for byte */
inline equal_sesm_packet_header(sesm_packet_header_read, sesm_packet_header_written) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> assert(sesm_packet_header_read.sesm_packet_length[sesm_packet_header_at] == sesm_packet_header_written.sesm_packet_length[sesm_packet_header_at]); sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  assert(sesm_packet_header_read.sesm_packet_type == sesm_packet_header_written.sesm_packet_type);
  skip
}

/* ---- New Order Response Message: 56 bytes ------------------------------------ */

/* An acknowledgement for a New Order Request accepted by MIAX Futures Onyx */
typedef NewOrderResponseMessage {
  byte matching_engine[8];
  byte mp_id[5];
  byte client_order_id[20];
  byte instrument_id_binary_u_4[4];
  byte order_id[8];
  byte status;
  byte reserved_10[10]
};

int new_order_response_message_at;

/* every byte of New Order Response Message set to one value */
inline fill_new_order_response_message(new_order_response_message_record, new_order_response_message_value) {
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.matching_engine[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 5 -> new_order_response_message_record.mp_id[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 20 -> new_order_response_message_record.client_order_id[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> new_order_response_message_record.instrument_id_binary_u_4[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.order_id[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_record.status = new_order_response_message_value;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 10 -> new_order_response_message_record.reserved_10[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Response Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_response_message(new_order_response_message_record, new_order_response_message_base) {
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.matching_engine[new_order_response_message_at] = (new_order_response_message_base + 0 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 5 -> new_order_response_message_record.mp_id[new_order_response_message_at] = (new_order_response_message_base + 8 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 20 -> new_order_response_message_record.client_order_id[new_order_response_message_at] = (new_order_response_message_base + 13 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> new_order_response_message_record.instrument_id_binary_u_4[new_order_response_message_at] = (new_order_response_message_base + 33 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.order_id[new_order_response_message_at] = (new_order_response_message_base + 37 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_record.status = (new_order_response_message_base + 45 + 1) % 256;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 10 -> new_order_response_message_record.reserved_10[new_order_response_message_at] = (new_order_response_message_base + 46 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Response Message to the wire, 56 bytes from where the cursor stands */
inline encode_new_order_response_message(new_order_response_message_record) {
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> wire[at] = new_order_response_message_record.matching_engine[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 5 -> wire[at] = new_order_response_message_record.mp_id[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 20 -> wire[at] = new_order_response_message_record.client_order_id[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> wire[at] = new_order_response_message_record.instrument_id_binary_u_4[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> wire[at] = new_order_response_message_record.order_id[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_response_message_record.status; at = at + 1;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 10 -> wire[at] = new_order_response_message_record.reserved_10[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Response Message off the wire, 56 bytes from where the cursor stands */
inline decode_new_order_response_message(new_order_response_message_record) {
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.matching_engine[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 5 -> new_order_response_message_record.mp_id[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 20 -> new_order_response_message_record.client_order_id[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> new_order_response_message_record.instrument_id_binary_u_4[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.order_id[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_record.status = wire[at]; at = at + 1;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 10 -> new_order_response_message_record.reserved_10[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Response Message is what was written, byte for byte */
inline equal_new_order_response_message(new_order_response_message_read, new_order_response_message_written) {
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> assert(new_order_response_message_read.matching_engine[new_order_response_message_at] == new_order_response_message_written.matching_engine[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 5 -> assert(new_order_response_message_read.mp_id[new_order_response_message_at] == new_order_response_message_written.mp_id[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 20 -> assert(new_order_response_message_read.client_order_id[new_order_response_message_at] == new_order_response_message_written.client_order_id[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> assert(new_order_response_message_read.instrument_id_binary_u_4[new_order_response_message_at] == new_order_response_message_written.instrument_id_binary_u_4[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> assert(new_order_response_message_read.order_id[new_order_response_message_at] == new_order_response_message_written.order_id[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  assert(new_order_response_message_read.status == new_order_response_message_written.status);
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 10 -> assert(new_order_response_message_read.reserved_10[new_order_response_message_at] == new_order_response_message_written.reserved_10[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Response: 80 bytes ----------------------------------------- */

/* Acknowledgement for a Modify Order Request accepted by MIAX Futures Onyx */
typedef ModifyOrderResponse {
  byte matching_engine_time[8];
  byte mp_id[5];
  byte client_order_id[20];
  byte original_client_order_id[20];
  byte instrument_id_binary_u_4[4];
  byte order_id[8];
  byte leaves_qty[4];
  byte status;
  byte reserved_10[10]
};

int modify_order_response_at;

/* every byte of Modify Order Response set to one value */
inline fill_modify_order_response(modify_order_response_record, modify_order_response_value) {
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 8 -> modify_order_response_record.matching_engine_time[modify_order_response_at] = modify_order_response_value; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 5 -> modify_order_response_record.mp_id[modify_order_response_at] = modify_order_response_value; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 20 -> modify_order_response_record.client_order_id[modify_order_response_at] = modify_order_response_value; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 20 -> modify_order_response_record.original_client_order_id[modify_order_response_at] = modify_order_response_value; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 4 -> modify_order_response_record.instrument_id_binary_u_4[modify_order_response_at] = modify_order_response_value; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 8 -> modify_order_response_record.order_id[modify_order_response_at] = modify_order_response_value; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 4 -> modify_order_response_record.leaves_qty[modify_order_response_at] = modify_order_response_value; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_record.status = modify_order_response_value;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 10 -> modify_order_response_record.reserved_10[modify_order_response_at] = modify_order_response_value; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order Response set to where it lies, so a field read out of place says so */
inline ramp_modify_order_response(modify_order_response_record, modify_order_response_base) {
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 8 -> modify_order_response_record.matching_engine_time[modify_order_response_at] = (modify_order_response_base + 0 + modify_order_response_at + 1) % 256; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 5 -> modify_order_response_record.mp_id[modify_order_response_at] = (modify_order_response_base + 8 + modify_order_response_at + 1) % 256; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 20 -> modify_order_response_record.client_order_id[modify_order_response_at] = (modify_order_response_base + 13 + modify_order_response_at + 1) % 256; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 20 -> modify_order_response_record.original_client_order_id[modify_order_response_at] = (modify_order_response_base + 33 + modify_order_response_at + 1) % 256; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 4 -> modify_order_response_record.instrument_id_binary_u_4[modify_order_response_at] = (modify_order_response_base + 53 + modify_order_response_at + 1) % 256; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 8 -> modify_order_response_record.order_id[modify_order_response_at] = (modify_order_response_base + 57 + modify_order_response_at + 1) % 256; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 4 -> modify_order_response_record.leaves_qty[modify_order_response_at] = (modify_order_response_base + 65 + modify_order_response_at + 1) % 256; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_record.status = (modify_order_response_base + 69 + 1) % 256;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 10 -> modify_order_response_record.reserved_10[modify_order_response_at] = (modify_order_response_base + 70 + modify_order_response_at + 1) % 256; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Response to the wire, 80 bytes from where the cursor stands */
inline encode_modify_order_response(modify_order_response_record) {
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 8 -> wire[at] = modify_order_response_record.matching_engine_time[modify_order_response_at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 5 -> wire[at] = modify_order_response_record.mp_id[modify_order_response_at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 20 -> wire[at] = modify_order_response_record.client_order_id[modify_order_response_at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 20 -> wire[at] = modify_order_response_record.original_client_order_id[modify_order_response_at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 4 -> wire[at] = modify_order_response_record.instrument_id_binary_u_4[modify_order_response_at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 8 -> wire[at] = modify_order_response_record.order_id[modify_order_response_at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 4 -> wire[at] = modify_order_response_record.leaves_qty[modify_order_response_at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_response_record.status; at = at + 1;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 10 -> wire[at] = modify_order_response_record.reserved_10[modify_order_response_at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Response off the wire, 80 bytes from where the cursor stands */
inline decode_modify_order_response(modify_order_response_record) {
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 8 -> modify_order_response_record.matching_engine_time[modify_order_response_at] = wire[at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 5 -> modify_order_response_record.mp_id[modify_order_response_at] = wire[at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 20 -> modify_order_response_record.client_order_id[modify_order_response_at] = wire[at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 20 -> modify_order_response_record.original_client_order_id[modify_order_response_at] = wire[at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 4 -> modify_order_response_record.instrument_id_binary_u_4[modify_order_response_at] = wire[at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 8 -> modify_order_response_record.order_id[modify_order_response_at] = wire[at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 4 -> modify_order_response_record.leaves_qty[modify_order_response_at] = wire[at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_record.status = wire[at]; at = at + 1;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 10 -> modify_order_response_record.reserved_10[modify_order_response_at] = wire[at]; at = at + 1; modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order Response is what was written, byte for byte */
inline equal_modify_order_response(modify_order_response_read, modify_order_response_written) {
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 8 -> assert(modify_order_response_read.matching_engine_time[modify_order_response_at] == modify_order_response_written.matching_engine_time[modify_order_response_at]); modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 5 -> assert(modify_order_response_read.mp_id[modify_order_response_at] == modify_order_response_written.mp_id[modify_order_response_at]); modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 20 -> assert(modify_order_response_read.client_order_id[modify_order_response_at] == modify_order_response_written.client_order_id[modify_order_response_at]); modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 20 -> assert(modify_order_response_read.original_client_order_id[modify_order_response_at] == modify_order_response_written.original_client_order_id[modify_order_response_at]); modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 4 -> assert(modify_order_response_read.instrument_id_binary_u_4[modify_order_response_at] == modify_order_response_written.instrument_id_binary_u_4[modify_order_response_at]); modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 8 -> assert(modify_order_response_read.order_id[modify_order_response_at] == modify_order_response_written.order_id[modify_order_response_at]); modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 4 -> assert(modify_order_response_read.leaves_qty[modify_order_response_at] == modify_order_response_written.leaves_qty[modify_order_response_at]); modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  assert(modify_order_response_read.status == modify_order_response_written.status);
  modify_order_response_at = 0;
  do
  :: modify_order_response_at < 10 -> assert(modify_order_response_read.reserved_10[modify_order_response_at] == modify_order_response_written.reserved_10[modify_order_response_at]); modify_order_response_at = modify_order_response_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order Response: 66 bytes ----------------------------------------- */

/* provides response to an Order Cancel Request */
typedef CancelOrderResponse {
  byte matching_engine_time[8];
  byte mp_id[5];
  byte client_order_id[20];
  byte original_client_order[20];
  byte instrument_id_binary_u_4[4];
  byte order_id[8];
  byte status
};

int cancel_order_response_at;

/* every byte of Cancel Order Response set to one value */
inline fill_cancel_order_response(cancel_order_response_record, cancel_order_response_value) {
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 8 -> cancel_order_response_record.matching_engine_time[cancel_order_response_at] = cancel_order_response_value; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 5 -> cancel_order_response_record.mp_id[cancel_order_response_at] = cancel_order_response_value; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 20 -> cancel_order_response_record.client_order_id[cancel_order_response_at] = cancel_order_response_value; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 20 -> cancel_order_response_record.original_client_order[cancel_order_response_at] = cancel_order_response_value; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 4 -> cancel_order_response_record.instrument_id_binary_u_4[cancel_order_response_at] = cancel_order_response_value; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 8 -> cancel_order_response_record.order_id[cancel_order_response_at] = cancel_order_response_value; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_record.status = cancel_order_response_value;
  skip
}

/* each byte of Cancel Order Response set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_response(cancel_order_response_record, cancel_order_response_base) {
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 8 -> cancel_order_response_record.matching_engine_time[cancel_order_response_at] = (cancel_order_response_base + 0 + cancel_order_response_at + 1) % 256; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 5 -> cancel_order_response_record.mp_id[cancel_order_response_at] = (cancel_order_response_base + 8 + cancel_order_response_at + 1) % 256; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 20 -> cancel_order_response_record.client_order_id[cancel_order_response_at] = (cancel_order_response_base + 13 + cancel_order_response_at + 1) % 256; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 20 -> cancel_order_response_record.original_client_order[cancel_order_response_at] = (cancel_order_response_base + 33 + cancel_order_response_at + 1) % 256; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 4 -> cancel_order_response_record.instrument_id_binary_u_4[cancel_order_response_at] = (cancel_order_response_base + 53 + cancel_order_response_at + 1) % 256; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 8 -> cancel_order_response_record.order_id[cancel_order_response_at] = (cancel_order_response_base + 57 + cancel_order_response_at + 1) % 256; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_record.status = (cancel_order_response_base + 65 + 1) % 256;
  skip
}

/* Cancel Order Response to the wire, 66 bytes from where the cursor stands */
inline encode_cancel_order_response(cancel_order_response_record) {
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 8 -> wire[at] = cancel_order_response_record.matching_engine_time[cancel_order_response_at]; at = at + 1; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 5 -> wire[at] = cancel_order_response_record.mp_id[cancel_order_response_at]; at = at + 1; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 20 -> wire[at] = cancel_order_response_record.client_order_id[cancel_order_response_at]; at = at + 1; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 20 -> wire[at] = cancel_order_response_record.original_client_order[cancel_order_response_at]; at = at + 1; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 4 -> wire[at] = cancel_order_response_record.instrument_id_binary_u_4[cancel_order_response_at]; at = at + 1; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 8 -> wire[at] = cancel_order_response_record.order_id[cancel_order_response_at]; at = at + 1; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  wire[at] = cancel_order_response_record.status; at = at + 1;
  skip
}

/* Cancel Order Response off the wire, 66 bytes from where the cursor stands */
inline decode_cancel_order_response(cancel_order_response_record) {
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 8 -> cancel_order_response_record.matching_engine_time[cancel_order_response_at] = wire[at]; at = at + 1; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 5 -> cancel_order_response_record.mp_id[cancel_order_response_at] = wire[at]; at = at + 1; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 20 -> cancel_order_response_record.client_order_id[cancel_order_response_at] = wire[at]; at = at + 1; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 20 -> cancel_order_response_record.original_client_order[cancel_order_response_at] = wire[at]; at = at + 1; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 4 -> cancel_order_response_record.instrument_id_binary_u_4[cancel_order_response_at] = wire[at]; at = at + 1; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 8 -> cancel_order_response_record.order_id[cancel_order_response_at] = wire[at]; at = at + 1; cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_record.status = wire[at]; at = at + 1;
  skip
}

/* what was read of Cancel Order Response is what was written, byte for byte */
inline equal_cancel_order_response(cancel_order_response_read, cancel_order_response_written) {
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 8 -> assert(cancel_order_response_read.matching_engine_time[cancel_order_response_at] == cancel_order_response_written.matching_engine_time[cancel_order_response_at]); cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 5 -> assert(cancel_order_response_read.mp_id[cancel_order_response_at] == cancel_order_response_written.mp_id[cancel_order_response_at]); cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 20 -> assert(cancel_order_response_read.client_order_id[cancel_order_response_at] == cancel_order_response_written.client_order_id[cancel_order_response_at]); cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 20 -> assert(cancel_order_response_read.original_client_order[cancel_order_response_at] == cancel_order_response_written.original_client_order[cancel_order_response_at]); cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 4 -> assert(cancel_order_response_read.instrument_id_binary_u_4[cancel_order_response_at] == cancel_order_response_written.instrument_id_binary_u_4[cancel_order_response_at]); cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  cancel_order_response_at = 0;
  do
  :: cancel_order_response_at < 8 -> assert(cancel_order_response_read.order_id[cancel_order_response_at] == cancel_order_response_written.order_id[cancel_order_response_at]); cancel_order_response_at = cancel_order_response_at + 1
  :: else -> break
  od;
  assert(cancel_order_response_read.status == cancel_order_response_written.status);
  skip
}

/* ---- Mass Cancel Response: 44 bytes ------------------------------------------ */

/* used to inform the Firm about the status of their previous Mass Cancel Request */
typedef MassCancelResponse {
  byte matching_engine_time[8];
  byte mp_id[5];
  byte client_order_id[20];
  byte status;
  byte reserved_10[10]
};

int mass_cancel_response_at;

/* every byte of Mass Cancel Response set to one value */
inline fill_mass_cancel_response(mass_cancel_response_record, mass_cancel_response_value) {
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 8 -> mass_cancel_response_record.matching_engine_time[mass_cancel_response_at] = mass_cancel_response_value; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 5 -> mass_cancel_response_record.mp_id[mass_cancel_response_at] = mass_cancel_response_value; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 20 -> mass_cancel_response_record.client_order_id[mass_cancel_response_at] = mass_cancel_response_value; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  mass_cancel_response_record.status = mass_cancel_response_value;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 10 -> mass_cancel_response_record.reserved_10[mass_cancel_response_at] = mass_cancel_response_value; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Response set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_response(mass_cancel_response_record, mass_cancel_response_base) {
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 8 -> mass_cancel_response_record.matching_engine_time[mass_cancel_response_at] = (mass_cancel_response_base + 0 + mass_cancel_response_at + 1) % 256; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 5 -> mass_cancel_response_record.mp_id[mass_cancel_response_at] = (mass_cancel_response_base + 8 + mass_cancel_response_at + 1) % 256; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 20 -> mass_cancel_response_record.client_order_id[mass_cancel_response_at] = (mass_cancel_response_base + 13 + mass_cancel_response_at + 1) % 256; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  mass_cancel_response_record.status = (mass_cancel_response_base + 33 + 1) % 256;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 10 -> mass_cancel_response_record.reserved_10[mass_cancel_response_at] = (mass_cancel_response_base + 34 + mass_cancel_response_at + 1) % 256; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Response to the wire, 44 bytes from where the cursor stands */
inline encode_mass_cancel_response(mass_cancel_response_record) {
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 8 -> wire[at] = mass_cancel_response_record.matching_engine_time[mass_cancel_response_at]; at = at + 1; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 5 -> wire[at] = mass_cancel_response_record.mp_id[mass_cancel_response_at]; at = at + 1; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 20 -> wire[at] = mass_cancel_response_record.client_order_id[mass_cancel_response_at]; at = at + 1; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_response_record.status; at = at + 1;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 10 -> wire[at] = mass_cancel_response_record.reserved_10[mass_cancel_response_at]; at = at + 1; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Response off the wire, 44 bytes from where the cursor stands */
inline decode_mass_cancel_response(mass_cancel_response_record) {
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 8 -> mass_cancel_response_record.matching_engine_time[mass_cancel_response_at] = wire[at]; at = at + 1; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 5 -> mass_cancel_response_record.mp_id[mass_cancel_response_at] = wire[at]; at = at + 1; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 20 -> mass_cancel_response_record.client_order_id[mass_cancel_response_at] = wire[at]; at = at + 1; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  mass_cancel_response_record.status = wire[at]; at = at + 1;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 10 -> mass_cancel_response_record.reserved_10[mass_cancel_response_at] = wire[at]; at = at + 1; mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Response is what was written, byte for byte */
inline equal_mass_cancel_response(mass_cancel_response_read, mass_cancel_response_written) {
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 8 -> assert(mass_cancel_response_read.matching_engine_time[mass_cancel_response_at] == mass_cancel_response_written.matching_engine_time[mass_cancel_response_at]); mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 5 -> assert(mass_cancel_response_read.mp_id[mass_cancel_response_at] == mass_cancel_response_written.mp_id[mass_cancel_response_at]); mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 20 -> assert(mass_cancel_response_read.client_order_id[mass_cancel_response_at] == mass_cancel_response_written.client_order_id[mass_cancel_response_at]); mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  assert(mass_cancel_response_read.status == mass_cancel_response_written.status);
  mass_cancel_response_at = 0;
  do
  :: mass_cancel_response_at < 10 -> assert(mass_cancel_response_read.reserved_10[mass_cancel_response_at] == mass_cancel_response_written.reserved_10[mass_cancel_response_at]); mass_cancel_response_at = mass_cancel_response_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Strategy Creation Response Message: 70 bytes ---------------------------- */

/* response to the Strategy Creation Request */
typedef StrategyCreationResponseMessage {
  byte matching_engine_time[8];
  byte mp_id[5];
  byte client_order_id[20];
  byte instrument_id_string_20[20];
  byte status;
  byte reserved_16[16]
};

int strategy_creation_response_message_at;

/* every byte of Strategy Creation Response Message set to one value */
inline fill_strategy_creation_response_message(strategy_creation_response_message_record, strategy_creation_response_message_value) {
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 8 -> strategy_creation_response_message_record.matching_engine_time[strategy_creation_response_message_at] = strategy_creation_response_message_value; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 5 -> strategy_creation_response_message_record.mp_id[strategy_creation_response_message_at] = strategy_creation_response_message_value; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 20 -> strategy_creation_response_message_record.client_order_id[strategy_creation_response_message_at] = strategy_creation_response_message_value; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 20 -> strategy_creation_response_message_record.instrument_id_string_20[strategy_creation_response_message_at] = strategy_creation_response_message_value; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_record.status = strategy_creation_response_message_value;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 16 -> strategy_creation_response_message_record.reserved_16[strategy_creation_response_message_at] = strategy_creation_response_message_value; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Strategy Creation Response Message set to where it lies, so a field read out of place says so */
inline ramp_strategy_creation_response_message(strategy_creation_response_message_record, strategy_creation_response_message_base) {
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 8 -> strategy_creation_response_message_record.matching_engine_time[strategy_creation_response_message_at] = (strategy_creation_response_message_base + 0 + strategy_creation_response_message_at + 1) % 256; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 5 -> strategy_creation_response_message_record.mp_id[strategy_creation_response_message_at] = (strategy_creation_response_message_base + 8 + strategy_creation_response_message_at + 1) % 256; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 20 -> strategy_creation_response_message_record.client_order_id[strategy_creation_response_message_at] = (strategy_creation_response_message_base + 13 + strategy_creation_response_message_at + 1) % 256; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 20 -> strategy_creation_response_message_record.instrument_id_string_20[strategy_creation_response_message_at] = (strategy_creation_response_message_base + 33 + strategy_creation_response_message_at + 1) % 256; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_record.status = (strategy_creation_response_message_base + 53 + 1) % 256;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 16 -> strategy_creation_response_message_record.reserved_16[strategy_creation_response_message_at] = (strategy_creation_response_message_base + 54 + strategy_creation_response_message_at + 1) % 256; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Strategy Creation Response Message to the wire, 70 bytes from where the cursor stands */
inline encode_strategy_creation_response_message(strategy_creation_response_message_record) {
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 8 -> wire[at] = strategy_creation_response_message_record.matching_engine_time[strategy_creation_response_message_at]; at = at + 1; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 5 -> wire[at] = strategy_creation_response_message_record.mp_id[strategy_creation_response_message_at]; at = at + 1; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 20 -> wire[at] = strategy_creation_response_message_record.client_order_id[strategy_creation_response_message_at]; at = at + 1; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 20 -> wire[at] = strategy_creation_response_message_record.instrument_id_string_20[strategy_creation_response_message_at]; at = at + 1; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  wire[at] = strategy_creation_response_message_record.status; at = at + 1;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 16 -> wire[at] = strategy_creation_response_message_record.reserved_16[strategy_creation_response_message_at]; at = at + 1; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Strategy Creation Response Message off the wire, 70 bytes from where the cursor stands */
inline decode_strategy_creation_response_message(strategy_creation_response_message_record) {
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 8 -> strategy_creation_response_message_record.matching_engine_time[strategy_creation_response_message_at] = wire[at]; at = at + 1; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 5 -> strategy_creation_response_message_record.mp_id[strategy_creation_response_message_at] = wire[at]; at = at + 1; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 20 -> strategy_creation_response_message_record.client_order_id[strategy_creation_response_message_at] = wire[at]; at = at + 1; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 20 -> strategy_creation_response_message_record.instrument_id_string_20[strategy_creation_response_message_at] = wire[at]; at = at + 1; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_record.status = wire[at]; at = at + 1;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 16 -> strategy_creation_response_message_record.reserved_16[strategy_creation_response_message_at] = wire[at]; at = at + 1; strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Strategy Creation Response Message is what was written, byte for byte */
inline equal_strategy_creation_response_message(strategy_creation_response_message_read, strategy_creation_response_message_written) {
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 8 -> assert(strategy_creation_response_message_read.matching_engine_time[strategy_creation_response_message_at] == strategy_creation_response_message_written.matching_engine_time[strategy_creation_response_message_at]); strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 5 -> assert(strategy_creation_response_message_read.mp_id[strategy_creation_response_message_at] == strategy_creation_response_message_written.mp_id[strategy_creation_response_message_at]); strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 20 -> assert(strategy_creation_response_message_read.client_order_id[strategy_creation_response_message_at] == strategy_creation_response_message_written.client_order_id[strategy_creation_response_message_at]); strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 20 -> assert(strategy_creation_response_message_read.instrument_id_string_20[strategy_creation_response_message_at] == strategy_creation_response_message_written.instrument_id_string_20[strategy_creation_response_message_at]); strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  assert(strategy_creation_response_message_read.status == strategy_creation_response_message_written.status);
  strategy_creation_response_message_at = 0;
  do
  :: strategy_creation_response_message_at < 16 -> assert(strategy_creation_response_message_read.reserved_16[strategy_creation_response_message_at] == strategy_creation_response_message_written.reserved_16[strategy_creation_response_message_at]); strategy_creation_response_message_at = strategy_creation_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System State Notification Message: 26 bytes ----------------------------- */

/* published whenever system state events take place */
typedef SystemStateNotificationMessage {
  byte matching_engine_time[8];
  byte version[8];
  byte session_id;
  byte system_status;
  byte reserved_8[8]
};

int system_state_notification_message_at;

/* every byte of System State Notification Message set to one value */
inline fill_system_state_notification_message(system_state_notification_message_record, system_state_notification_message_value) {
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.matching_engine_time[system_state_notification_message_at] = system_state_notification_message_value; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.version[system_state_notification_message_at] = system_state_notification_message_value; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_record.session_id = system_state_notification_message_value;
  system_state_notification_message_record.system_status = system_state_notification_message_value;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.reserved_8[system_state_notification_message_at] = system_state_notification_message_value; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System State Notification Message set to where it lies, so a field read out of place says so */
inline ramp_system_state_notification_message(system_state_notification_message_record, system_state_notification_message_base) {
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.matching_engine_time[system_state_notification_message_at] = (system_state_notification_message_base + 0 + system_state_notification_message_at + 1) % 256; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.version[system_state_notification_message_at] = (system_state_notification_message_base + 8 + system_state_notification_message_at + 1) % 256; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_record.session_id = (system_state_notification_message_base + 16 + 1) % 256;
  system_state_notification_message_record.system_status = (system_state_notification_message_base + 17 + 1) % 256;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.reserved_8[system_state_notification_message_at] = (system_state_notification_message_base + 18 + system_state_notification_message_at + 1) % 256; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* System State Notification Message to the wire, 26 bytes from where the cursor stands */
inline encode_system_state_notification_message(system_state_notification_message_record) {
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> wire[at] = system_state_notification_message_record.matching_engine_time[system_state_notification_message_at]; at = at + 1; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> wire[at] = system_state_notification_message_record.version[system_state_notification_message_at]; at = at + 1; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = system_state_notification_message_record.session_id; at = at + 1;
  wire[at] = system_state_notification_message_record.system_status; at = at + 1;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> wire[at] = system_state_notification_message_record.reserved_8[system_state_notification_message_at]; at = at + 1; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* System State Notification Message off the wire, 26 bytes from where the cursor stands */
inline decode_system_state_notification_message(system_state_notification_message_record) {
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.matching_engine_time[system_state_notification_message_at] = wire[at]; at = at + 1; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.version[system_state_notification_message_at] = wire[at]; at = at + 1; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_record.session_id = wire[at]; at = at + 1;
  system_state_notification_message_record.system_status = wire[at]; at = at + 1;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.reserved_8[system_state_notification_message_at] = wire[at]; at = at + 1; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System State Notification Message is what was written, byte for byte */
inline equal_system_state_notification_message(system_state_notification_message_read, system_state_notification_message_written) {
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> assert(system_state_notification_message_read.matching_engine_time[system_state_notification_message_at] == system_state_notification_message_written.matching_engine_time[system_state_notification_message_at]); system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> assert(system_state_notification_message_read.version[system_state_notification_message_at] == system_state_notification_message_written.version[system_state_notification_message_at]); system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  assert(system_state_notification_message_read.session_id == system_state_notification_message_written.session_id);
  assert(system_state_notification_message_read.system_status == system_state_notification_message_written.system_status);
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> assert(system_state_notification_message_read.reserved_8[system_state_notification_message_at] == system_state_notification_message_written.reserved_8[system_state_notification_message_at]); system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Reduce Size Order Notification: 102 bytes ------------------------ */

/* used when Cancel Order Request is accepted by MIAX Futures Onyx or when unsolicited order cancels or order size reductions are to be notified to firms */
typedef CancelReduceSizeOrderNotification {
  byte matching_engine_time[8];
  byte mp_id[5];
  byte operator_id[18];
  byte operator_location[6];
  byte client_order_id[20];
  byte instrument_id_binary_u_4[4];
  byte order_id[8];
  byte client_send_time[8];
  byte leaves_qty[4];
  byte cancel_reason;
  byte last_price[8];
  byte last_size[4];
  byte reserved_8[8]
};

int cancel_reduce_size_order_notification_at;

/* every byte of Cancel Reduce Size Order Notification set to one value */
inline fill_cancel_reduce_size_order_notification(cancel_reduce_size_order_notification_record, cancel_reduce_size_order_notification_value) {
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.matching_engine_time[cancel_reduce_size_order_notification_at] = cancel_reduce_size_order_notification_value; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 5 -> cancel_reduce_size_order_notification_record.mp_id[cancel_reduce_size_order_notification_at] = cancel_reduce_size_order_notification_value; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 18 -> cancel_reduce_size_order_notification_record.operator_id[cancel_reduce_size_order_notification_at] = cancel_reduce_size_order_notification_value; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 6 -> cancel_reduce_size_order_notification_record.operator_location[cancel_reduce_size_order_notification_at] = cancel_reduce_size_order_notification_value; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 20 -> cancel_reduce_size_order_notification_record.client_order_id[cancel_reduce_size_order_notification_at] = cancel_reduce_size_order_notification_value; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> cancel_reduce_size_order_notification_record.instrument_id_binary_u_4[cancel_reduce_size_order_notification_at] = cancel_reduce_size_order_notification_value; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.order_id[cancel_reduce_size_order_notification_at] = cancel_reduce_size_order_notification_value; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.client_send_time[cancel_reduce_size_order_notification_at] = cancel_reduce_size_order_notification_value; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> cancel_reduce_size_order_notification_record.leaves_qty[cancel_reduce_size_order_notification_at] = cancel_reduce_size_order_notification_value; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_record.cancel_reason = cancel_reduce_size_order_notification_value;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.last_price[cancel_reduce_size_order_notification_at] = cancel_reduce_size_order_notification_value; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> cancel_reduce_size_order_notification_record.last_size[cancel_reduce_size_order_notification_at] = cancel_reduce_size_order_notification_value; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.reserved_8[cancel_reduce_size_order_notification_at] = cancel_reduce_size_order_notification_value; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Reduce Size Order Notification set to where it lies, so a field read out of place says so */
inline ramp_cancel_reduce_size_order_notification(cancel_reduce_size_order_notification_record, cancel_reduce_size_order_notification_base) {
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.matching_engine_time[cancel_reduce_size_order_notification_at] = (cancel_reduce_size_order_notification_base + 0 + cancel_reduce_size_order_notification_at + 1) % 256; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 5 -> cancel_reduce_size_order_notification_record.mp_id[cancel_reduce_size_order_notification_at] = (cancel_reduce_size_order_notification_base + 8 + cancel_reduce_size_order_notification_at + 1) % 256; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 18 -> cancel_reduce_size_order_notification_record.operator_id[cancel_reduce_size_order_notification_at] = (cancel_reduce_size_order_notification_base + 13 + cancel_reduce_size_order_notification_at + 1) % 256; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 6 -> cancel_reduce_size_order_notification_record.operator_location[cancel_reduce_size_order_notification_at] = (cancel_reduce_size_order_notification_base + 31 + cancel_reduce_size_order_notification_at + 1) % 256; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 20 -> cancel_reduce_size_order_notification_record.client_order_id[cancel_reduce_size_order_notification_at] = (cancel_reduce_size_order_notification_base + 37 + cancel_reduce_size_order_notification_at + 1) % 256; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> cancel_reduce_size_order_notification_record.instrument_id_binary_u_4[cancel_reduce_size_order_notification_at] = (cancel_reduce_size_order_notification_base + 57 + cancel_reduce_size_order_notification_at + 1) % 256; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.order_id[cancel_reduce_size_order_notification_at] = (cancel_reduce_size_order_notification_base + 61 + cancel_reduce_size_order_notification_at + 1) % 256; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.client_send_time[cancel_reduce_size_order_notification_at] = (cancel_reduce_size_order_notification_base + 69 + cancel_reduce_size_order_notification_at + 1) % 256; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> cancel_reduce_size_order_notification_record.leaves_qty[cancel_reduce_size_order_notification_at] = (cancel_reduce_size_order_notification_base + 77 + cancel_reduce_size_order_notification_at + 1) % 256; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_record.cancel_reason = (cancel_reduce_size_order_notification_base + 81 + 1) % 256;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.last_price[cancel_reduce_size_order_notification_at] = (cancel_reduce_size_order_notification_base + 82 + cancel_reduce_size_order_notification_at + 1) % 256; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> cancel_reduce_size_order_notification_record.last_size[cancel_reduce_size_order_notification_at] = (cancel_reduce_size_order_notification_base + 90 + cancel_reduce_size_order_notification_at + 1) % 256; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.reserved_8[cancel_reduce_size_order_notification_at] = (cancel_reduce_size_order_notification_base + 94 + cancel_reduce_size_order_notification_at + 1) % 256; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Reduce Size Order Notification to the wire, 102 bytes from where the cursor stands */
inline encode_cancel_reduce_size_order_notification(cancel_reduce_size_order_notification_record) {
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> wire[at] = cancel_reduce_size_order_notification_record.matching_engine_time[cancel_reduce_size_order_notification_at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 5 -> wire[at] = cancel_reduce_size_order_notification_record.mp_id[cancel_reduce_size_order_notification_at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 18 -> wire[at] = cancel_reduce_size_order_notification_record.operator_id[cancel_reduce_size_order_notification_at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 6 -> wire[at] = cancel_reduce_size_order_notification_record.operator_location[cancel_reduce_size_order_notification_at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 20 -> wire[at] = cancel_reduce_size_order_notification_record.client_order_id[cancel_reduce_size_order_notification_at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> wire[at] = cancel_reduce_size_order_notification_record.instrument_id_binary_u_4[cancel_reduce_size_order_notification_at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> wire[at] = cancel_reduce_size_order_notification_record.order_id[cancel_reduce_size_order_notification_at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> wire[at] = cancel_reduce_size_order_notification_record.client_send_time[cancel_reduce_size_order_notification_at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> wire[at] = cancel_reduce_size_order_notification_record.leaves_qty[cancel_reduce_size_order_notification_at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  wire[at] = cancel_reduce_size_order_notification_record.cancel_reason; at = at + 1;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> wire[at] = cancel_reduce_size_order_notification_record.last_price[cancel_reduce_size_order_notification_at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> wire[at] = cancel_reduce_size_order_notification_record.last_size[cancel_reduce_size_order_notification_at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> wire[at] = cancel_reduce_size_order_notification_record.reserved_8[cancel_reduce_size_order_notification_at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Reduce Size Order Notification off the wire, 102 bytes from where the cursor stands */
inline decode_cancel_reduce_size_order_notification(cancel_reduce_size_order_notification_record) {
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.matching_engine_time[cancel_reduce_size_order_notification_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 5 -> cancel_reduce_size_order_notification_record.mp_id[cancel_reduce_size_order_notification_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 18 -> cancel_reduce_size_order_notification_record.operator_id[cancel_reduce_size_order_notification_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 6 -> cancel_reduce_size_order_notification_record.operator_location[cancel_reduce_size_order_notification_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 20 -> cancel_reduce_size_order_notification_record.client_order_id[cancel_reduce_size_order_notification_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> cancel_reduce_size_order_notification_record.instrument_id_binary_u_4[cancel_reduce_size_order_notification_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.order_id[cancel_reduce_size_order_notification_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.client_send_time[cancel_reduce_size_order_notification_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> cancel_reduce_size_order_notification_record.leaves_qty[cancel_reduce_size_order_notification_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_record.cancel_reason = wire[at]; at = at + 1;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.last_price[cancel_reduce_size_order_notification_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> cancel_reduce_size_order_notification_record.last_size[cancel_reduce_size_order_notification_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> cancel_reduce_size_order_notification_record.reserved_8[cancel_reduce_size_order_notification_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Reduce Size Order Notification is what was written, byte for byte */
inline equal_cancel_reduce_size_order_notification(cancel_reduce_size_order_notification_read, cancel_reduce_size_order_notification_written) {
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> assert(cancel_reduce_size_order_notification_read.matching_engine_time[cancel_reduce_size_order_notification_at] == cancel_reduce_size_order_notification_written.matching_engine_time[cancel_reduce_size_order_notification_at]); cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 5 -> assert(cancel_reduce_size_order_notification_read.mp_id[cancel_reduce_size_order_notification_at] == cancel_reduce_size_order_notification_written.mp_id[cancel_reduce_size_order_notification_at]); cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 18 -> assert(cancel_reduce_size_order_notification_read.operator_id[cancel_reduce_size_order_notification_at] == cancel_reduce_size_order_notification_written.operator_id[cancel_reduce_size_order_notification_at]); cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 6 -> assert(cancel_reduce_size_order_notification_read.operator_location[cancel_reduce_size_order_notification_at] == cancel_reduce_size_order_notification_written.operator_location[cancel_reduce_size_order_notification_at]); cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 20 -> assert(cancel_reduce_size_order_notification_read.client_order_id[cancel_reduce_size_order_notification_at] == cancel_reduce_size_order_notification_written.client_order_id[cancel_reduce_size_order_notification_at]); cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> assert(cancel_reduce_size_order_notification_read.instrument_id_binary_u_4[cancel_reduce_size_order_notification_at] == cancel_reduce_size_order_notification_written.instrument_id_binary_u_4[cancel_reduce_size_order_notification_at]); cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> assert(cancel_reduce_size_order_notification_read.order_id[cancel_reduce_size_order_notification_at] == cancel_reduce_size_order_notification_written.order_id[cancel_reduce_size_order_notification_at]); cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> assert(cancel_reduce_size_order_notification_read.client_send_time[cancel_reduce_size_order_notification_at] == cancel_reduce_size_order_notification_written.client_send_time[cancel_reduce_size_order_notification_at]); cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> assert(cancel_reduce_size_order_notification_read.leaves_qty[cancel_reduce_size_order_notification_at] == cancel_reduce_size_order_notification_written.leaves_qty[cancel_reduce_size_order_notification_at]); cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  assert(cancel_reduce_size_order_notification_read.cancel_reason == cancel_reduce_size_order_notification_written.cancel_reason);
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> assert(cancel_reduce_size_order_notification_read.last_price[cancel_reduce_size_order_notification_at] == cancel_reduce_size_order_notification_written.last_price[cancel_reduce_size_order_notification_at]); cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 4 -> assert(cancel_reduce_size_order_notification_read.last_size[cancel_reduce_size_order_notification_at] == cancel_reduce_size_order_notification_written.last_size[cancel_reduce_size_order_notification_at]); cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_at = 0;
  do
  :: cancel_reduce_size_order_notification_at < 8 -> assert(cancel_reduce_size_order_notification_read.reserved_8[cancel_reduce_size_order_notification_at] == cancel_reduce_size_order_notification_written.reserved_8[cancel_reduce_size_order_notification_at]); cancel_reduce_size_order_notification_at = cancel_reduce_size_order_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Status Update Notification: 53 bytes ------------------------------ */

/* used to notify the firms about order status updates */
typedef OrderStatusUpdateNotification {
  byte matching_engine_time[8];
  byte instrument_id_binary_u_4[4];
  byte order_id[8];
  byte update_status;
  byte reserved_32[32]
};

int order_status_update_notification_at;

/* every byte of Order Status Update Notification set to one value */
inline fill_order_status_update_notification(order_status_update_notification_record, order_status_update_notification_value) {
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 8 -> order_status_update_notification_record.matching_engine_time[order_status_update_notification_at] = order_status_update_notification_value; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 4 -> order_status_update_notification_record.instrument_id_binary_u_4[order_status_update_notification_at] = order_status_update_notification_value; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 8 -> order_status_update_notification_record.order_id[order_status_update_notification_at] = order_status_update_notification_value; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  order_status_update_notification_record.update_status = order_status_update_notification_value;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 32 -> order_status_update_notification_record.reserved_32[order_status_update_notification_at] = order_status_update_notification_value; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Status Update Notification set to where it lies, so a field read out of place says so */
inline ramp_order_status_update_notification(order_status_update_notification_record, order_status_update_notification_base) {
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 8 -> order_status_update_notification_record.matching_engine_time[order_status_update_notification_at] = (order_status_update_notification_base + 0 + order_status_update_notification_at + 1) % 256; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 4 -> order_status_update_notification_record.instrument_id_binary_u_4[order_status_update_notification_at] = (order_status_update_notification_base + 8 + order_status_update_notification_at + 1) % 256; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 8 -> order_status_update_notification_record.order_id[order_status_update_notification_at] = (order_status_update_notification_base + 12 + order_status_update_notification_at + 1) % 256; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  order_status_update_notification_record.update_status = (order_status_update_notification_base + 20 + 1) % 256;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 32 -> order_status_update_notification_record.reserved_32[order_status_update_notification_at] = (order_status_update_notification_base + 21 + order_status_update_notification_at + 1) % 256; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Order Status Update Notification to the wire, 53 bytes from where the cursor stands */
inline encode_order_status_update_notification(order_status_update_notification_record) {
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 8 -> wire[at] = order_status_update_notification_record.matching_engine_time[order_status_update_notification_at]; at = at + 1; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 4 -> wire[at] = order_status_update_notification_record.instrument_id_binary_u_4[order_status_update_notification_at]; at = at + 1; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 8 -> wire[at] = order_status_update_notification_record.order_id[order_status_update_notification_at]; at = at + 1; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  wire[at] = order_status_update_notification_record.update_status; at = at + 1;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 32 -> wire[at] = order_status_update_notification_record.reserved_32[order_status_update_notification_at]; at = at + 1; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Order Status Update Notification off the wire, 53 bytes from where the cursor stands */
inline decode_order_status_update_notification(order_status_update_notification_record) {
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 8 -> order_status_update_notification_record.matching_engine_time[order_status_update_notification_at] = wire[at]; at = at + 1; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 4 -> order_status_update_notification_record.instrument_id_binary_u_4[order_status_update_notification_at] = wire[at]; at = at + 1; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 8 -> order_status_update_notification_record.order_id[order_status_update_notification_at] = wire[at]; at = at + 1; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  order_status_update_notification_record.update_status = wire[at]; at = at + 1;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 32 -> order_status_update_notification_record.reserved_32[order_status_update_notification_at] = wire[at]; at = at + 1; order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Status Update Notification is what was written, byte for byte */
inline equal_order_status_update_notification(order_status_update_notification_read, order_status_update_notification_written) {
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 8 -> assert(order_status_update_notification_read.matching_engine_time[order_status_update_notification_at] == order_status_update_notification_written.matching_engine_time[order_status_update_notification_at]); order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 4 -> assert(order_status_update_notification_read.instrument_id_binary_u_4[order_status_update_notification_at] == order_status_update_notification_written.instrument_id_binary_u_4[order_status_update_notification_at]); order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 8 -> assert(order_status_update_notification_read.order_id[order_status_update_notification_at] == order_status_update_notification_written.order_id[order_status_update_notification_at]); order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  assert(order_status_update_notification_read.update_status == order_status_update_notification_written.update_status);
  order_status_update_notification_at = 0;
  do
  :: order_status_update_notification_at < 32 -> assert(order_status_update_notification_read.reserved_32[order_status_update_notification_at] == order_status_update_notification_written.reserved_32[order_status_update_notification_at]); order_status_update_notification_at = order_status_update_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order Request Message: 99 bytes ---------------------------------- */

/* a cancel request for a resting order */
typedef CancelOrderRequestMessage {
  byte client_send_time[8];
  byte mp_id[5];
  byte operator_id[18];
  byte operator_location[6];
  byte order_id[8];
  byte client_order_id[20];
  byte original_client_order_id[20];
  byte instrument_id_binary_u_4[4];
  byte reserved_10[10]
};

int cancel_order_request_message_at;

/* every byte of Cancel Order Request Message set to one value */
inline fill_cancel_order_request_message(cancel_order_request_message_record, cancel_order_request_message_value) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.client_send_time[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 5 -> cancel_order_request_message_record.mp_id[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 18 -> cancel_order_request_message_record.operator_id[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 6 -> cancel_order_request_message_record.operator_location[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.order_id[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> cancel_order_request_message_record.client_order_id[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> cancel_order_request_message_record.original_client_order_id[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> cancel_order_request_message_record.instrument_id_binary_u_4[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 10 -> cancel_order_request_message_record.reserved_10[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Request Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_request_message(cancel_order_request_message_record, cancel_order_request_message_base) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.client_send_time[cancel_order_request_message_at] = (cancel_order_request_message_base + 0 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 5 -> cancel_order_request_message_record.mp_id[cancel_order_request_message_at] = (cancel_order_request_message_base + 8 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 18 -> cancel_order_request_message_record.operator_id[cancel_order_request_message_at] = (cancel_order_request_message_base + 13 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 6 -> cancel_order_request_message_record.operator_location[cancel_order_request_message_at] = (cancel_order_request_message_base + 31 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.order_id[cancel_order_request_message_at] = (cancel_order_request_message_base + 37 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> cancel_order_request_message_record.client_order_id[cancel_order_request_message_at] = (cancel_order_request_message_base + 45 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> cancel_order_request_message_record.original_client_order_id[cancel_order_request_message_at] = (cancel_order_request_message_base + 65 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> cancel_order_request_message_record.instrument_id_binary_u_4[cancel_order_request_message_at] = (cancel_order_request_message_base + 85 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 10 -> cancel_order_request_message_record.reserved_10[cancel_order_request_message_at] = (cancel_order_request_message_base + 89 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Request Message to the wire, 99 bytes from where the cursor stands */
inline encode_cancel_order_request_message(cancel_order_request_message_record) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> wire[at] = cancel_order_request_message_record.client_send_time[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 5 -> wire[at] = cancel_order_request_message_record.mp_id[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 18 -> wire[at] = cancel_order_request_message_record.operator_id[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 6 -> wire[at] = cancel_order_request_message_record.operator_location[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> wire[at] = cancel_order_request_message_record.order_id[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> wire[at] = cancel_order_request_message_record.client_order_id[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> wire[at] = cancel_order_request_message_record.original_client_order_id[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> wire[at] = cancel_order_request_message_record.instrument_id_binary_u_4[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 10 -> wire[at] = cancel_order_request_message_record.reserved_10[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Request Message off the wire, 99 bytes from where the cursor stands */
inline decode_cancel_order_request_message(cancel_order_request_message_record) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.client_send_time[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 5 -> cancel_order_request_message_record.mp_id[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 18 -> cancel_order_request_message_record.operator_id[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 6 -> cancel_order_request_message_record.operator_location[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.order_id[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> cancel_order_request_message_record.client_order_id[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> cancel_order_request_message_record.original_client_order_id[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> cancel_order_request_message_record.instrument_id_binary_u_4[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 10 -> cancel_order_request_message_record.reserved_10[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Request Message is what was written, byte for byte */
inline equal_cancel_order_request_message(cancel_order_request_message_read, cancel_order_request_message_written) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> assert(cancel_order_request_message_read.client_send_time[cancel_order_request_message_at] == cancel_order_request_message_written.client_send_time[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 5 -> assert(cancel_order_request_message_read.mp_id[cancel_order_request_message_at] == cancel_order_request_message_written.mp_id[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 18 -> assert(cancel_order_request_message_read.operator_id[cancel_order_request_message_at] == cancel_order_request_message_written.operator_id[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 6 -> assert(cancel_order_request_message_read.operator_location[cancel_order_request_message_at] == cancel_order_request_message_written.operator_location[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> assert(cancel_order_request_message_read.order_id[cancel_order_request_message_at] == cancel_order_request_message_written.order_id[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> assert(cancel_order_request_message_read.client_order_id[cancel_order_request_message_at] == cancel_order_request_message_written.client_order_id[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> assert(cancel_order_request_message_read.original_client_order_id[cancel_order_request_message_at] == cancel_order_request_message_written.original_client_order_id[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> assert(cancel_order_request_message_read.instrument_id_binary_u_4[cancel_order_request_message_at] == cancel_order_request_message_written.instrument_id_binary_u_4[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 10 -> assert(cancel_order_request_message_read.reserved_10[cancel_order_request_message_at] == cancel_order_request_message_written.reserved_10[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Request: 86 bytes ------------------------------------------- */

/* request the cancellation of all orders based on the requested scope and the provided criteria */
typedef MassCancelRequest {
  byte client_send_time[8];
  byte mp_id[5];
  byte operator_id[18];
  byte operator_location[6];
  byte reserved_10[10];
  byte client_order_id[20];
  byte scope;
  byte action;
  byte product_group_code[6];
  byte product_type;
  byte purge_group;
  byte reserved_9[9]
};

int mass_cancel_request_at;

/* every byte of Mass Cancel Request set to one value */
inline fill_mass_cancel_request(mass_cancel_request_record, mass_cancel_request_value) {
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 8 -> mass_cancel_request_record.client_send_time[mass_cancel_request_at] = mass_cancel_request_value; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 5 -> mass_cancel_request_record.mp_id[mass_cancel_request_at] = mass_cancel_request_value; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 18 -> mass_cancel_request_record.operator_id[mass_cancel_request_at] = mass_cancel_request_value; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 6 -> mass_cancel_request_record.operator_location[mass_cancel_request_at] = mass_cancel_request_value; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 10 -> mass_cancel_request_record.reserved_10[mass_cancel_request_at] = mass_cancel_request_value; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 20 -> mass_cancel_request_record.client_order_id[mass_cancel_request_at] = mass_cancel_request_value; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_record.scope = mass_cancel_request_value;
  mass_cancel_request_record.action = mass_cancel_request_value;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 6 -> mass_cancel_request_record.product_group_code[mass_cancel_request_at] = mass_cancel_request_value; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_record.product_type = mass_cancel_request_value;
  mass_cancel_request_record.purge_group = mass_cancel_request_value;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 9 -> mass_cancel_request_record.reserved_9[mass_cancel_request_at] = mass_cancel_request_value; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Request set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_request(mass_cancel_request_record, mass_cancel_request_base) {
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 8 -> mass_cancel_request_record.client_send_time[mass_cancel_request_at] = (mass_cancel_request_base + 0 + mass_cancel_request_at + 1) % 256; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 5 -> mass_cancel_request_record.mp_id[mass_cancel_request_at] = (mass_cancel_request_base + 8 + mass_cancel_request_at + 1) % 256; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 18 -> mass_cancel_request_record.operator_id[mass_cancel_request_at] = (mass_cancel_request_base + 13 + mass_cancel_request_at + 1) % 256; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 6 -> mass_cancel_request_record.operator_location[mass_cancel_request_at] = (mass_cancel_request_base + 31 + mass_cancel_request_at + 1) % 256; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 10 -> mass_cancel_request_record.reserved_10[mass_cancel_request_at] = (mass_cancel_request_base + 37 + mass_cancel_request_at + 1) % 256; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 20 -> mass_cancel_request_record.client_order_id[mass_cancel_request_at] = (mass_cancel_request_base + 47 + mass_cancel_request_at + 1) % 256; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_record.scope = (mass_cancel_request_base + 67 + 1) % 256;
  mass_cancel_request_record.action = (mass_cancel_request_base + 68 + 1) % 256;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 6 -> mass_cancel_request_record.product_group_code[mass_cancel_request_at] = (mass_cancel_request_base + 69 + mass_cancel_request_at + 1) % 256; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_record.product_type = (mass_cancel_request_base + 75 + 1) % 256;
  mass_cancel_request_record.purge_group = (mass_cancel_request_base + 76 + 1) % 256;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 9 -> mass_cancel_request_record.reserved_9[mass_cancel_request_at] = (mass_cancel_request_base + 77 + mass_cancel_request_at + 1) % 256; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Request to the wire, 86 bytes from where the cursor stands */
inline encode_mass_cancel_request(mass_cancel_request_record) {
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 8 -> wire[at] = mass_cancel_request_record.client_send_time[mass_cancel_request_at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 5 -> wire[at] = mass_cancel_request_record.mp_id[mass_cancel_request_at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 18 -> wire[at] = mass_cancel_request_record.operator_id[mass_cancel_request_at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 6 -> wire[at] = mass_cancel_request_record.operator_location[mass_cancel_request_at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 10 -> wire[at] = mass_cancel_request_record.reserved_10[mass_cancel_request_at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 20 -> wire[at] = mass_cancel_request_record.client_order_id[mass_cancel_request_at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_request_record.scope; at = at + 1;
  wire[at] = mass_cancel_request_record.action; at = at + 1;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 6 -> wire[at] = mass_cancel_request_record.product_group_code[mass_cancel_request_at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_request_record.product_type; at = at + 1;
  wire[at] = mass_cancel_request_record.purge_group; at = at + 1;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 9 -> wire[at] = mass_cancel_request_record.reserved_9[mass_cancel_request_at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Request off the wire, 86 bytes from where the cursor stands */
inline decode_mass_cancel_request(mass_cancel_request_record) {
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 8 -> mass_cancel_request_record.client_send_time[mass_cancel_request_at] = wire[at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 5 -> mass_cancel_request_record.mp_id[mass_cancel_request_at] = wire[at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 18 -> mass_cancel_request_record.operator_id[mass_cancel_request_at] = wire[at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 6 -> mass_cancel_request_record.operator_location[mass_cancel_request_at] = wire[at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 10 -> mass_cancel_request_record.reserved_10[mass_cancel_request_at] = wire[at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 20 -> mass_cancel_request_record.client_order_id[mass_cancel_request_at] = wire[at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_record.scope = wire[at]; at = at + 1;
  mass_cancel_request_record.action = wire[at]; at = at + 1;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 6 -> mass_cancel_request_record.product_group_code[mass_cancel_request_at] = wire[at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_record.product_type = wire[at]; at = at + 1;
  mass_cancel_request_record.purge_group = wire[at]; at = at + 1;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 9 -> mass_cancel_request_record.reserved_9[mass_cancel_request_at] = wire[at]; at = at + 1; mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Request is what was written, byte for byte */
inline equal_mass_cancel_request(mass_cancel_request_read, mass_cancel_request_written) {
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 8 -> assert(mass_cancel_request_read.client_send_time[mass_cancel_request_at] == mass_cancel_request_written.client_send_time[mass_cancel_request_at]); mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 5 -> assert(mass_cancel_request_read.mp_id[mass_cancel_request_at] == mass_cancel_request_written.mp_id[mass_cancel_request_at]); mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 18 -> assert(mass_cancel_request_read.operator_id[mass_cancel_request_at] == mass_cancel_request_written.operator_id[mass_cancel_request_at]); mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 6 -> assert(mass_cancel_request_read.operator_location[mass_cancel_request_at] == mass_cancel_request_written.operator_location[mass_cancel_request_at]); mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 10 -> assert(mass_cancel_request_read.reserved_10[mass_cancel_request_at] == mass_cancel_request_written.reserved_10[mass_cancel_request_at]); mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 20 -> assert(mass_cancel_request_read.client_order_id[mass_cancel_request_at] == mass_cancel_request_written.client_order_id[mass_cancel_request_at]); mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  assert(mass_cancel_request_read.scope == mass_cancel_request_written.scope);
  assert(mass_cancel_request_read.action == mass_cancel_request_written.action);
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 6 -> assert(mass_cancel_request_read.product_group_code[mass_cancel_request_at] == mass_cancel_request_written.product_group_code[mass_cancel_request_at]); mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  assert(mass_cancel_request_read.product_type == mass_cancel_request_written.product_type);
  assert(mass_cancel_request_read.purge_group == mass_cancel_request_written.purge_group);
  mass_cancel_request_at = 0;
  do
  :: mass_cancel_request_at < 9 -> assert(mass_cancel_request_read.reserved_9[mass_cancel_request_at] == mass_cancel_request_written.reserved_9[mass_cancel_request_at]); mass_cancel_request_at = mass_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Request: 35 bytes ------------------------------------------------- */

/* The SesM client must send a Login request packet immediately upon establishing a new TCP/IP socket connection to the server */
typedef LoginRequest {
  byte sesm_version[5];
  byte username[5];
  byte computer_id[8];
  byte application_protocol[8];
  byte requested_session;
  byte requested_sequence_number[8]
};

int login_request_at;

/* every byte of Login Request set to one value */
inline fill_login_request(login_request_record, login_request_value) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.sesm_version[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.username[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.computer_id[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.application_protocol[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_record.requested_session = login_request_value;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.requested_sequence_number[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request set to where it lies, so a field read out of place says so */
inline ramp_login_request(login_request_record, login_request_base) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.sesm_version[login_request_at] = (login_request_base + 0 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.username[login_request_at] = (login_request_base + 5 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.computer_id[login_request_at] = (login_request_base + 10 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.application_protocol[login_request_at] = (login_request_base + 18 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_record.requested_session = (login_request_base + 26 + 1) % 256;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.requested_sequence_number[login_request_at] = (login_request_base + 27 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request to the wire, 35 bytes from where the cursor stands */
inline encode_login_request(login_request_record) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> wire[at] = login_request_record.sesm_version[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> wire[at] = login_request_record.username[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> wire[at] = login_request_record.computer_id[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> wire[at] = login_request_record.application_protocol[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  wire[at] = login_request_record.requested_session; at = at + 1;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> wire[at] = login_request_record.requested_sequence_number[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request off the wire, 35 bytes from where the cursor stands */
inline decode_login_request(login_request_record) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.sesm_version[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.username[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.computer_id[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.application_protocol[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_record.requested_session = wire[at]; at = at + 1;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.requested_sequence_number[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request is what was written, byte for byte */
inline equal_login_request(login_request_read, login_request_written) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> assert(login_request_read.sesm_version[login_request_at] == login_request_written.sesm_version[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> assert(login_request_read.username[login_request_at] == login_request_written.username[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> assert(login_request_read.computer_id[login_request_at] == login_request_written.computer_id[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> assert(login_request_read.application_protocol[login_request_at] == login_request_written.application_protocol[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  assert(login_request_read.requested_session == login_request_written.requested_session);
  login_request_at = 0;
  do
  :: login_request_at < 8 -> assert(login_request_read.requested_sequence_number[login_request_at] == login_request_written.requested_sequence_number[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response: 10 bytes ------------------------------------------------ */

/* The SesM server sends a Login response packet in response a Login request packet from the client */
typedef LoginResponse {
  byte login_status;
  byte session_id;
  byte highest_sequence_number[8]
};

int login_response_at;

/* every byte of Login Response set to one value */
inline fill_login_response(login_response_record, login_response_value) {
  login_response_record.login_status = login_response_value;
  login_response_record.session_id = login_response_value;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = login_response_value; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Response set to where it lies, so a field read out of place says so */
inline ramp_login_response(login_response_record, login_response_base) {
  login_response_record.login_status = (login_response_base + 0 + 1) % 256;
  login_response_record.session_id = (login_response_base + 1 + 1) % 256;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = (login_response_base + 2 + login_response_at + 1) % 256; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response to the wire, 10 bytes from where the cursor stands */
inline encode_login_response(login_response_record) {
  wire[at] = login_response_record.login_status; at = at + 1;
  wire[at] = login_response_record.session_id; at = at + 1;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> wire[at] = login_response_record.highest_sequence_number[login_response_at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response off the wire, 10 bytes from where the cursor stands */
inline decode_login_response(login_response_record) {
  login_response_record.login_status = wire[at]; at = at + 1;
  login_response_record.session_id = wire[at]; at = at + 1;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = wire[at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Response is what was written, byte for byte */
inline equal_login_response(login_response_read, login_response_written) {
  assert(login_response_read.login_status == login_response_written.login_status);
  assert(login_response_read.session_id == login_response_written.session_id);
  login_response_at = 0;
  do
  :: login_response_at < 8 -> assert(login_response_read.highest_sequence_number[login_response_at] == login_response_written.highest_sequence_number[login_response_at]); login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Request: 16 bytes ---------------------------------------- */

/* The SesM server sends a Login response packet in response a Login request packet from the client */
typedef RetransmissionRequest {
  byte start_sequence_number[8];
  byte end_sequence_number[8]
};

int retransmission_request_at;

/* every byte of Retransmission Request set to one value */
inline fill_retransmission_request(retransmission_request_record, retransmission_request_value) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = retransmission_request_value; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = retransmission_request_value; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Request set to where it lies, so a field read out of place says so */
inline ramp_retransmission_request(retransmission_request_record, retransmission_request_base) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = (retransmission_request_base + 0 + retransmission_request_at + 1) % 256; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = (retransmission_request_base + 8 + retransmission_request_at + 1) % 256; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request to the wire, 16 bytes from where the cursor stands */
inline encode_retransmission_request(retransmission_request_record) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> wire[at] = retransmission_request_record.start_sequence_number[retransmission_request_at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> wire[at] = retransmission_request_record.end_sequence_number[retransmission_request_at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request off the wire, 16 bytes from where the cursor stands */
inline decode_retransmission_request(retransmission_request_record) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = wire[at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = wire[at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Request is what was written, byte for byte */
inline equal_retransmission_request(retransmission_request_read, retransmission_request_written) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> assert(retransmission_request_read.start_sequence_number[retransmission_request_at] == retransmission_request_written.start_sequence_number[retransmission_request_at]); retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> assert(retransmission_request_read.end_sequence_number[retransmission_request_at] == retransmission_request_written.end_sequence_number[retransmission_request_at]); retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Sesm Packet Header: encoded, read back, and compared */
proctype check_sesm_packet_header() {
  SesmPacketHeader sesm_packet_header_sent;
  SesmPacketHeader sesm_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sesm_packet_header(sesm_packet_header_sent, 0)
  :: pattern == 1 -> fill_sesm_packet_header(sesm_packet_header_sent, 32)
  :: pattern == 2 -> fill_sesm_packet_header(sesm_packet_header_sent, 255)
  :: else -> ramp_sesm_packet_header(sesm_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sesm_packet_header(sesm_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_sesm_packet_header(sesm_packet_header_got);
    assert(at == 3);
    equal_sesm_packet_header(sesm_packet_header_got, sesm_packet_header_sent)
  }
}

/* New Order Response Message: encoded, read back, and compared */
proctype check_new_order_response_message() {
  NewOrderResponseMessage new_order_response_message_sent;
  NewOrderResponseMessage new_order_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_response_message(new_order_response_message_sent, 0)
  :: pattern == 1 -> fill_new_order_response_message(new_order_response_message_sent, 32)
  :: pattern == 2 -> fill_new_order_response_message(new_order_response_message_sent, 255)
  :: else -> ramp_new_order_response_message(new_order_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_response_message(new_order_response_message_sent);
    assert(at == 56);
    at = 0;
    decode_new_order_response_message(new_order_response_message_got);
    assert(at == 56);
    equal_new_order_response_message(new_order_response_message_got, new_order_response_message_sent)
  }
}

/* Modify Order Response: encoded, read back, and compared */
proctype check_modify_order_response() {
  ModifyOrderResponse modify_order_response_sent;
  ModifyOrderResponse modify_order_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_response(modify_order_response_sent, 0)
  :: pattern == 1 -> fill_modify_order_response(modify_order_response_sent, 32)
  :: pattern == 2 -> fill_modify_order_response(modify_order_response_sent, 255)
  :: else -> ramp_modify_order_response(modify_order_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_response(modify_order_response_sent);
    assert(at == 80);
    at = 0;
    decode_modify_order_response(modify_order_response_got);
    assert(at == 80);
    equal_modify_order_response(modify_order_response_got, modify_order_response_sent)
  }
}

/* Cancel Order Response: encoded, read back, and compared */
proctype check_cancel_order_response() {
  CancelOrderResponse cancel_order_response_sent;
  CancelOrderResponse cancel_order_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_response(cancel_order_response_sent, 0)
  :: pattern == 1 -> fill_cancel_order_response(cancel_order_response_sent, 32)
  :: pattern == 2 -> fill_cancel_order_response(cancel_order_response_sent, 255)
  :: else -> ramp_cancel_order_response(cancel_order_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_response(cancel_order_response_sent);
    assert(at == 66);
    at = 0;
    decode_cancel_order_response(cancel_order_response_got);
    assert(at == 66);
    equal_cancel_order_response(cancel_order_response_got, cancel_order_response_sent)
  }
}

/* Mass Cancel Response: encoded, read back, and compared */
proctype check_mass_cancel_response() {
  MassCancelResponse mass_cancel_response_sent;
  MassCancelResponse mass_cancel_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_response(mass_cancel_response_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_response(mass_cancel_response_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_response(mass_cancel_response_sent, 255)
  :: else -> ramp_mass_cancel_response(mass_cancel_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_response(mass_cancel_response_sent);
    assert(at == 44);
    at = 0;
    decode_mass_cancel_response(mass_cancel_response_got);
    assert(at == 44);
    equal_mass_cancel_response(mass_cancel_response_got, mass_cancel_response_sent)
  }
}

/* Strategy Creation Response Message: encoded, read back, and compared */
proctype check_strategy_creation_response_message() {
  StrategyCreationResponseMessage strategy_creation_response_message_sent;
  StrategyCreationResponseMessage strategy_creation_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_strategy_creation_response_message(strategy_creation_response_message_sent, 0)
  :: pattern == 1 -> fill_strategy_creation_response_message(strategy_creation_response_message_sent, 32)
  :: pattern == 2 -> fill_strategy_creation_response_message(strategy_creation_response_message_sent, 255)
  :: else -> ramp_strategy_creation_response_message(strategy_creation_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_strategy_creation_response_message(strategy_creation_response_message_sent);
    assert(at == 70);
    at = 0;
    decode_strategy_creation_response_message(strategy_creation_response_message_got);
    assert(at == 70);
    equal_strategy_creation_response_message(strategy_creation_response_message_got, strategy_creation_response_message_sent)
  }
}

/* System State Notification Message: encoded, read back, and compared */
proctype check_system_state_notification_message() {
  SystemStateNotificationMessage system_state_notification_message_sent;
  SystemStateNotificationMessage system_state_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_state_notification_message(system_state_notification_message_sent, 0)
  :: pattern == 1 -> fill_system_state_notification_message(system_state_notification_message_sent, 32)
  :: pattern == 2 -> fill_system_state_notification_message(system_state_notification_message_sent, 255)
  :: else -> ramp_system_state_notification_message(system_state_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_state_notification_message(system_state_notification_message_sent);
    assert(at == 26);
    at = 0;
    decode_system_state_notification_message(system_state_notification_message_got);
    assert(at == 26);
    equal_system_state_notification_message(system_state_notification_message_got, system_state_notification_message_sent)
  }
}

/* Cancel Reduce Size Order Notification: encoded, read back, and compared */
proctype check_cancel_reduce_size_order_notification() {
  CancelReduceSizeOrderNotification cancel_reduce_size_order_notification_sent;
  CancelReduceSizeOrderNotification cancel_reduce_size_order_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_reduce_size_order_notification(cancel_reduce_size_order_notification_sent, 0)
  :: pattern == 1 -> fill_cancel_reduce_size_order_notification(cancel_reduce_size_order_notification_sent, 32)
  :: pattern == 2 -> fill_cancel_reduce_size_order_notification(cancel_reduce_size_order_notification_sent, 255)
  :: else -> ramp_cancel_reduce_size_order_notification(cancel_reduce_size_order_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_reduce_size_order_notification(cancel_reduce_size_order_notification_sent);
    assert(at == 102);
    at = 0;
    decode_cancel_reduce_size_order_notification(cancel_reduce_size_order_notification_got);
    assert(at == 102);
    equal_cancel_reduce_size_order_notification(cancel_reduce_size_order_notification_got, cancel_reduce_size_order_notification_sent)
  }
}

/* Order Status Update Notification: encoded, read back, and compared */
proctype check_order_status_update_notification() {
  OrderStatusUpdateNotification order_status_update_notification_sent;
  OrderStatusUpdateNotification order_status_update_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_status_update_notification(order_status_update_notification_sent, 0)
  :: pattern == 1 -> fill_order_status_update_notification(order_status_update_notification_sent, 32)
  :: pattern == 2 -> fill_order_status_update_notification(order_status_update_notification_sent, 255)
  :: else -> ramp_order_status_update_notification(order_status_update_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_status_update_notification(order_status_update_notification_sent);
    assert(at == 53);
    at = 0;
    decode_order_status_update_notification(order_status_update_notification_got);
    assert(at == 53);
    equal_order_status_update_notification(order_status_update_notification_got, order_status_update_notification_sent)
  }
}

/* Cancel Order Request Message: encoded, read back, and compared */
proctype check_cancel_order_request_message() {
  CancelOrderRequestMessage cancel_order_request_message_sent;
  CancelOrderRequestMessage cancel_order_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_request_message(cancel_order_request_message_sent, 0)
  :: pattern == 1 -> fill_cancel_order_request_message(cancel_order_request_message_sent, 32)
  :: pattern == 2 -> fill_cancel_order_request_message(cancel_order_request_message_sent, 255)
  :: else -> ramp_cancel_order_request_message(cancel_order_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_request_message(cancel_order_request_message_sent);
    assert(at == 99);
    at = 0;
    decode_cancel_order_request_message(cancel_order_request_message_got);
    assert(at == 99);
    equal_cancel_order_request_message(cancel_order_request_message_got, cancel_order_request_message_sent)
  }
}

/* Mass Cancel Request: encoded, read back, and compared */
proctype check_mass_cancel_request() {
  MassCancelRequest mass_cancel_request_sent;
  MassCancelRequest mass_cancel_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_request(mass_cancel_request_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_request(mass_cancel_request_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_request(mass_cancel_request_sent, 255)
  :: else -> ramp_mass_cancel_request(mass_cancel_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_request(mass_cancel_request_sent);
    assert(at == 86);
    at = 0;
    decode_mass_cancel_request(mass_cancel_request_got);
    assert(at == 86);
    equal_mass_cancel_request(mass_cancel_request_got, mass_cancel_request_sent)
  }
}

/* Login Request: encoded, read back, and compared */
proctype check_login_request() {
  LoginRequest login_request_sent;
  LoginRequest login_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_request(login_request_sent, 0)
  :: pattern == 1 -> fill_login_request(login_request_sent, 32)
  :: pattern == 2 -> fill_login_request(login_request_sent, 255)
  :: else -> ramp_login_request(login_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_request(login_request_sent);
    assert(at == 35);
    at = 0;
    decode_login_request(login_request_got);
    assert(at == 35);
    equal_login_request(login_request_got, login_request_sent)
  }
}

/* Login Response: encoded, read back, and compared */
proctype check_login_response() {
  LoginResponse login_response_sent;
  LoginResponse login_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_response(login_response_sent, 0)
  :: pattern == 1 -> fill_login_response(login_response_sent, 32)
  :: pattern == 2 -> fill_login_response(login_response_sent, 255)
  :: else -> ramp_login_response(login_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_response(login_response_sent);
    assert(at == 10);
    at = 0;
    decode_login_response(login_response_got);
    assert(at == 10);
    equal_login_response(login_response_got, login_response_sent)
  }
}

/* Retransmission Request: encoded, read back, and compared */
proctype check_retransmission_request() {
  RetransmissionRequest retransmission_request_sent;
  RetransmissionRequest retransmission_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_request(retransmission_request_sent, 0)
  :: pattern == 1 -> fill_retransmission_request(retransmission_request_sent, 32)
  :: pattern == 2 -> fill_retransmission_request(retransmission_request_sent, 255)
  :: else -> ramp_retransmission_request(retransmission_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_request(retransmission_request_sent);
    assert(at == 16);
    at = 0;
    decode_retransmission_request(retransmission_request_got);
    assert(at == 16);
    equal_retransmission_request(retransmission_request_got, retransmission_request_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_sesm_packet_header()
  :: run check_new_order_response_message()
  :: run check_modify_order_response()
  :: run check_cancel_order_response()
  :: run check_mass_cancel_response()
  :: run check_strategy_creation_response_message()
  :: run check_system_state_notification_message()
  :: run check_cancel_reduce_size_order_notification()
  :: run check_order_status_update_notification()
  :: run check_cancel_order_request_message()
  :: run check_mass_cancel_request()
  :: run check_login_request()
  :: run check_login_response()
  :: run check_retransmission_request()
  fi
}
