/*
 * Moscow Exchange TWIME Spectra Order Entry
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
 *   - a field read in bits
 *   - a block whose stated length holds more than its fields
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 32

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Sbe Header: 8 bytes ----------------------------------------------------- */

/* Message body length, message id, message scheme id and message scheme version */
typedef SbeHeader {
  byte block_length[2];
  byte template_id[2];
  byte schema_id[2];
  byte version[2]
};

int sbe_header_at;

/* every byte of Sbe Header set to one value */
inline fill_sbe_header(sbe_header_record, sbe_header_value) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.template_id[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.schema_id[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sbe Header set to where it lies, so a field read out of place says so */
inline ramp_sbe_header(sbe_header_record, sbe_header_base) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = (sbe_header_base + 0 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.template_id[sbe_header_at] = (sbe_header_base + 2 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.schema_id[sbe_header_at] = (sbe_header_base + 4 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = (sbe_header_base + 6 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header to the wire, 8 bytes from where the cursor stands */
inline encode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.block_length[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.template_id[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.schema_id[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.version[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header off the wire, 8 bytes from where the cursor stands */
inline decode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.template_id[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.schema_id[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sbe Header is what was written, byte for byte */
inline equal_sbe_header(sbe_header_read, sbe_header_written) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.block_length[sbe_header_at] == sbe_header_written.block_length[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.template_id[sbe_header_at] == sbe_header_written.template_id[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.schema_id[sbe_header_at] == sbe_header_written.schema_id[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.version[sbe_header_at] == sbe_header_written.version[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Establish Message: 32 bytes --------------------------------------------- */

/* EstablishMessage */
typedef EstablishMessage {
  byte timestamp[8];
  byte keepalive_interval[4];
  byte credentials[20]
};

int establish_message_at;

/* every byte of Establish Message set to one value */
inline fill_establish_message(establish_message_record, establish_message_value) {
  establish_message_at = 0;
  do
  :: establish_message_at < 8 -> establish_message_record.timestamp[establish_message_at] = establish_message_value; establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  establish_message_at = 0;
  do
  :: establish_message_at < 4 -> establish_message_record.keepalive_interval[establish_message_at] = establish_message_value; establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  establish_message_at = 0;
  do
  :: establish_message_at < 20 -> establish_message_record.credentials[establish_message_at] = establish_message_value; establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Establish Message set to where it lies, so a field read out of place says so */
inline ramp_establish_message(establish_message_record, establish_message_base) {
  establish_message_at = 0;
  do
  :: establish_message_at < 8 -> establish_message_record.timestamp[establish_message_at] = (establish_message_base + 0 + establish_message_at + 1) % 256; establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  establish_message_at = 0;
  do
  :: establish_message_at < 4 -> establish_message_record.keepalive_interval[establish_message_at] = (establish_message_base + 8 + establish_message_at + 1) % 256; establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  establish_message_at = 0;
  do
  :: establish_message_at < 20 -> establish_message_record.credentials[establish_message_at] = (establish_message_base + 12 + establish_message_at + 1) % 256; establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  skip
}

/* Establish Message to the wire, 32 bytes from where the cursor stands */
inline encode_establish_message(establish_message_record) {
  establish_message_at = 0;
  do
  :: establish_message_at < 8 -> wire[at] = establish_message_record.timestamp[establish_message_at]; at = at + 1; establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  establish_message_at = 0;
  do
  :: establish_message_at < 4 -> wire[at] = establish_message_record.keepalive_interval[establish_message_at]; at = at + 1; establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  establish_message_at = 0;
  do
  :: establish_message_at < 20 -> wire[at] = establish_message_record.credentials[establish_message_at]; at = at + 1; establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  skip
}

/* Establish Message off the wire, 32 bytes from where the cursor stands */
inline decode_establish_message(establish_message_record) {
  establish_message_at = 0;
  do
  :: establish_message_at < 8 -> establish_message_record.timestamp[establish_message_at] = wire[at]; at = at + 1; establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  establish_message_at = 0;
  do
  :: establish_message_at < 4 -> establish_message_record.keepalive_interval[establish_message_at] = wire[at]; at = at + 1; establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  establish_message_at = 0;
  do
  :: establish_message_at < 20 -> establish_message_record.credentials[establish_message_at] = wire[at]; at = at + 1; establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Establish Message is what was written, byte for byte */
inline equal_establish_message(establish_message_read, establish_message_written) {
  establish_message_at = 0;
  do
  :: establish_message_at < 8 -> assert(establish_message_read.timestamp[establish_message_at] == establish_message_written.timestamp[establish_message_at]); establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  establish_message_at = 0;
  do
  :: establish_message_at < 4 -> assert(establish_message_read.keepalive_interval[establish_message_at] == establish_message_written.keepalive_interval[establish_message_at]); establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  establish_message_at = 0;
  do
  :: establish_message_at < 20 -> assert(establish_message_read.credentials[establish_message_at] == establish_message_written.credentials[establish_message_at]); establish_message_at = establish_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Terminate Message: 1 bytes ---------------------------------------------- */

/* TerminateMessage */
typedef TerminateMessage {
  byte termination_code
};

/* every byte of Terminate Message set to one value */
inline fill_terminate_message(terminate_message_record, terminate_message_value) {
  terminate_message_record.termination_code = terminate_message_value;
  skip
}

/* each byte of Terminate Message set to where it lies, so a field read out of place says so */
inline ramp_terminate_message(terminate_message_record, terminate_message_base) {
  terminate_message_record.termination_code = (terminate_message_base + 0 + 1) % 256;
  skip
}

/* Terminate Message to the wire, 1 bytes from where the cursor stands */
inline encode_terminate_message(terminate_message_record) {
  wire[at] = terminate_message_record.termination_code; at = at + 1;
  skip
}

/* Terminate Message off the wire, 1 bytes from where the cursor stands */
inline decode_terminate_message(terminate_message_record) {
  terminate_message_record.termination_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Terminate Message is what was written, byte for byte */
inline equal_terminate_message(terminate_message_read, terminate_message_written) {
  assert(terminate_message_read.termination_code == terminate_message_written.termination_code);
  skip
}

/* ---- Retransmit Request Message: 20 bytes ------------------------------------ */

/* RetransmitRequestMessage */
typedef RetransmitRequestMessage {
  byte timestamp[8];
  byte from_seq_no[8];
  byte count[4]
};

int retransmit_request_message_at;

/* every byte of Retransmit Request Message set to one value */
inline fill_retransmit_request_message(retransmit_request_message_record, retransmit_request_message_value) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.timestamp[retransmit_request_message_at] = retransmit_request_message_value; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.from_seq_no[retransmit_request_message_at] = retransmit_request_message_value; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> retransmit_request_message_record.count[retransmit_request_message_at] = retransmit_request_message_value; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmit Request Message set to where it lies, so a field read out of place says so */
inline ramp_retransmit_request_message(retransmit_request_message_record, retransmit_request_message_base) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.timestamp[retransmit_request_message_at] = (retransmit_request_message_base + 0 + retransmit_request_message_at + 1) % 256; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.from_seq_no[retransmit_request_message_at] = (retransmit_request_message_base + 8 + retransmit_request_message_at + 1) % 256; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> retransmit_request_message_record.count[retransmit_request_message_at] = (retransmit_request_message_base + 16 + retransmit_request_message_at + 1) % 256; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmit Request Message to the wire, 20 bytes from where the cursor stands */
inline encode_retransmit_request_message(retransmit_request_message_record) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> wire[at] = retransmit_request_message_record.timestamp[retransmit_request_message_at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> wire[at] = retransmit_request_message_record.from_seq_no[retransmit_request_message_at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> wire[at] = retransmit_request_message_record.count[retransmit_request_message_at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmit Request Message off the wire, 20 bytes from where the cursor stands */
inline decode_retransmit_request_message(retransmit_request_message_record) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.timestamp[retransmit_request_message_at] = wire[at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.from_seq_no[retransmit_request_message_at] = wire[at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> retransmit_request_message_record.count[retransmit_request_message_at] = wire[at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmit Request Message is what was written, byte for byte */
inline equal_retransmit_request_message(retransmit_request_message_read, retransmit_request_message_written) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> assert(retransmit_request_message_read.timestamp[retransmit_request_message_at] == retransmit_request_message_written.timestamp[retransmit_request_message_at]); retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> assert(retransmit_request_message_read.from_seq_no[retransmit_request_message_at] == retransmit_request_message_written.from_seq_no[retransmit_request_message_at]); retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 4 -> assert(retransmit_request_message_read.count[retransmit_request_message_at] == retransmit_request_message_written.count[retransmit_request_message_at]); retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Message: 8 bytes ----------------------------------------------- */

/* SequenceMessage */
typedef SequenceMessage {
  byte next_seq_no[8]
};

int sequence_message_at;

/* every byte of Sequence Message set to one value */
inline fill_sequence_message(sequence_message_record, sequence_message_value) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 8 -> sequence_message_record.next_seq_no[sequence_message_at] = sequence_message_value; sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_message(sequence_message_record, sequence_message_base) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 8 -> sequence_message_record.next_seq_no[sequence_message_at] = (sequence_message_base + 0 + sequence_message_at + 1) % 256; sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Message to the wire, 8 bytes from where the cursor stands */
inline encode_sequence_message(sequence_message_record) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 8 -> wire[at] = sequence_message_record.next_seq_no[sequence_message_at]; at = at + 1; sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Message off the wire, 8 bytes from where the cursor stands */
inline decode_sequence_message(sequence_message_record) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 8 -> sequence_message_record.next_seq_no[sequence_message_at] = wire[at]; at = at + 1; sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Message is what was written, byte for byte */
inline equal_sequence_message(sequence_message_read, sequence_message_written) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 8 -> assert(sequence_message_read.next_seq_no[sequence_message_at] == sequence_message_written.next_seq_no[sequence_message_at]); sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Mass Cancel By Bf Limit Request Message: 15 bytes ----------------- */

/* OrderMassCancelByBFLimitRequestMessage */
typedef OrderMassCancelByBfLimitRequestMessage {
  byte cl_ord_id[8];
  byte account[7]
};

int order_mass_cancel_by_bf_limit_request_message_at;

/* every byte of Order Mass Cancel By Bf Limit Request Message set to one value */
inline fill_order_mass_cancel_by_bf_limit_request_message(order_mass_cancel_by_bf_limit_request_message_record, order_mass_cancel_by_bf_limit_request_message_value) {
  order_mass_cancel_by_bf_limit_request_message_at = 0;
  do
  :: order_mass_cancel_by_bf_limit_request_message_at < 8 -> order_mass_cancel_by_bf_limit_request_message_record.cl_ord_id[order_mass_cancel_by_bf_limit_request_message_at] = order_mass_cancel_by_bf_limit_request_message_value; order_mass_cancel_by_bf_limit_request_message_at = order_mass_cancel_by_bf_limit_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_by_bf_limit_request_message_at = 0;
  do
  :: order_mass_cancel_by_bf_limit_request_message_at < 7 -> order_mass_cancel_by_bf_limit_request_message_record.account[order_mass_cancel_by_bf_limit_request_message_at] = order_mass_cancel_by_bf_limit_request_message_value; order_mass_cancel_by_bf_limit_request_message_at = order_mass_cancel_by_bf_limit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Mass Cancel By Bf Limit Request Message set to where it lies, so a field read out of place says so */
inline ramp_order_mass_cancel_by_bf_limit_request_message(order_mass_cancel_by_bf_limit_request_message_record, order_mass_cancel_by_bf_limit_request_message_base) {
  order_mass_cancel_by_bf_limit_request_message_at = 0;
  do
  :: order_mass_cancel_by_bf_limit_request_message_at < 8 -> order_mass_cancel_by_bf_limit_request_message_record.cl_ord_id[order_mass_cancel_by_bf_limit_request_message_at] = (order_mass_cancel_by_bf_limit_request_message_base + 0 + order_mass_cancel_by_bf_limit_request_message_at + 1) % 256; order_mass_cancel_by_bf_limit_request_message_at = order_mass_cancel_by_bf_limit_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_by_bf_limit_request_message_at = 0;
  do
  :: order_mass_cancel_by_bf_limit_request_message_at < 7 -> order_mass_cancel_by_bf_limit_request_message_record.account[order_mass_cancel_by_bf_limit_request_message_at] = (order_mass_cancel_by_bf_limit_request_message_base + 8 + order_mass_cancel_by_bf_limit_request_message_at + 1) % 256; order_mass_cancel_by_bf_limit_request_message_at = order_mass_cancel_by_bf_limit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Cancel By Bf Limit Request Message to the wire, 15 bytes from where the cursor stands */
inline encode_order_mass_cancel_by_bf_limit_request_message(order_mass_cancel_by_bf_limit_request_message_record) {
  order_mass_cancel_by_bf_limit_request_message_at = 0;
  do
  :: order_mass_cancel_by_bf_limit_request_message_at < 8 -> wire[at] = order_mass_cancel_by_bf_limit_request_message_record.cl_ord_id[order_mass_cancel_by_bf_limit_request_message_at]; at = at + 1; order_mass_cancel_by_bf_limit_request_message_at = order_mass_cancel_by_bf_limit_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_by_bf_limit_request_message_at = 0;
  do
  :: order_mass_cancel_by_bf_limit_request_message_at < 7 -> wire[at] = order_mass_cancel_by_bf_limit_request_message_record.account[order_mass_cancel_by_bf_limit_request_message_at]; at = at + 1; order_mass_cancel_by_bf_limit_request_message_at = order_mass_cancel_by_bf_limit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Cancel By Bf Limit Request Message off the wire, 15 bytes from where the cursor stands */
inline decode_order_mass_cancel_by_bf_limit_request_message(order_mass_cancel_by_bf_limit_request_message_record) {
  order_mass_cancel_by_bf_limit_request_message_at = 0;
  do
  :: order_mass_cancel_by_bf_limit_request_message_at < 8 -> order_mass_cancel_by_bf_limit_request_message_record.cl_ord_id[order_mass_cancel_by_bf_limit_request_message_at] = wire[at]; at = at + 1; order_mass_cancel_by_bf_limit_request_message_at = order_mass_cancel_by_bf_limit_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_by_bf_limit_request_message_at = 0;
  do
  :: order_mass_cancel_by_bf_limit_request_message_at < 7 -> order_mass_cancel_by_bf_limit_request_message_record.account[order_mass_cancel_by_bf_limit_request_message_at] = wire[at]; at = at + 1; order_mass_cancel_by_bf_limit_request_message_at = order_mass_cancel_by_bf_limit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Mass Cancel By Bf Limit Request Message is what was written, byte for byte */
inline equal_order_mass_cancel_by_bf_limit_request_message(order_mass_cancel_by_bf_limit_request_message_read, order_mass_cancel_by_bf_limit_request_message_written) {
  order_mass_cancel_by_bf_limit_request_message_at = 0;
  do
  :: order_mass_cancel_by_bf_limit_request_message_at < 8 -> assert(order_mass_cancel_by_bf_limit_request_message_read.cl_ord_id[order_mass_cancel_by_bf_limit_request_message_at] == order_mass_cancel_by_bf_limit_request_message_written.cl_ord_id[order_mass_cancel_by_bf_limit_request_message_at]); order_mass_cancel_by_bf_limit_request_message_at = order_mass_cancel_by_bf_limit_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_by_bf_limit_request_message_at = 0;
  do
  :: order_mass_cancel_by_bf_limit_request_message_at < 7 -> assert(order_mass_cancel_by_bf_limit_request_message_read.account[order_mass_cancel_by_bf_limit_request_message_at] == order_mass_cancel_by_bf_limit_request_message_written.account[order_mass_cancel_by_bf_limit_request_message_at]); order_mass_cancel_by_bf_limit_request_message_at = order_mass_cancel_by_bf_limit_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Sbe Header: encoded, read back, and compared */
proctype check_sbe_header() {
  SbeHeader sbe_header_sent;
  SbeHeader sbe_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sbe_header(sbe_header_sent, 0)
  :: pattern == 1 -> fill_sbe_header(sbe_header_sent, 32)
  :: pattern == 2 -> fill_sbe_header(sbe_header_sent, 255)
  :: else -> ramp_sbe_header(sbe_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sbe_header(sbe_header_sent);
    assert(at == 8);
    at = 0;
    decode_sbe_header(sbe_header_got);
    assert(at == 8);
    equal_sbe_header(sbe_header_got, sbe_header_sent)
  }
}

/* Establish Message: encoded, read back, and compared */
proctype check_establish_message() {
  EstablishMessage establish_message_sent;
  EstablishMessage establish_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_establish_message(establish_message_sent, 0)
  :: pattern == 1 -> fill_establish_message(establish_message_sent, 32)
  :: pattern == 2 -> fill_establish_message(establish_message_sent, 255)
  :: else -> ramp_establish_message(establish_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_establish_message(establish_message_sent);
    assert(at == 32);
    at = 0;
    decode_establish_message(establish_message_got);
    assert(at == 32);
    equal_establish_message(establish_message_got, establish_message_sent)
  }
}

/* Terminate Message: encoded, read back, and compared */
proctype check_terminate_message() {
  TerminateMessage terminate_message_sent;
  TerminateMessage terminate_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_terminate_message(terminate_message_sent, 0)
  :: pattern == 1 -> fill_terminate_message(terminate_message_sent, 32)
  :: pattern == 2 -> fill_terminate_message(terminate_message_sent, 255)
  :: else -> ramp_terminate_message(terminate_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_terminate_message(terminate_message_sent);
    assert(at == 1);
    at = 0;
    decode_terminate_message(terminate_message_got);
    assert(at == 1);
    equal_terminate_message(terminate_message_got, terminate_message_sent)
  }
}

/* Retransmit Request Message: encoded, read back, and compared */
proctype check_retransmit_request_message() {
  RetransmitRequestMessage retransmit_request_message_sent;
  RetransmitRequestMessage retransmit_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmit_request_message(retransmit_request_message_sent, 0)
  :: pattern == 1 -> fill_retransmit_request_message(retransmit_request_message_sent, 32)
  :: pattern == 2 -> fill_retransmit_request_message(retransmit_request_message_sent, 255)
  :: else -> ramp_retransmit_request_message(retransmit_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmit_request_message(retransmit_request_message_sent);
    assert(at == 20);
    at = 0;
    decode_retransmit_request_message(retransmit_request_message_got);
    assert(at == 20);
    equal_retransmit_request_message(retransmit_request_message_got, retransmit_request_message_sent)
  }
}

/* Sequence Message: encoded, read back, and compared */
proctype check_sequence_message() {
  SequenceMessage sequence_message_sent;
  SequenceMessage sequence_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_message(sequence_message_sent, 0)
  :: pattern == 1 -> fill_sequence_message(sequence_message_sent, 32)
  :: pattern == 2 -> fill_sequence_message(sequence_message_sent, 255)
  :: else -> ramp_sequence_message(sequence_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_message(sequence_message_sent);
    assert(at == 8);
    at = 0;
    decode_sequence_message(sequence_message_got);
    assert(at == 8);
    equal_sequence_message(sequence_message_got, sequence_message_sent)
  }
}

/* Order Mass Cancel By Bf Limit Request Message: encoded, read back, and compared */
proctype check_order_mass_cancel_by_bf_limit_request_message() {
  OrderMassCancelByBfLimitRequestMessage order_mass_cancel_by_bf_limit_request_message_sent;
  OrderMassCancelByBfLimitRequestMessage order_mass_cancel_by_bf_limit_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_mass_cancel_by_bf_limit_request_message(order_mass_cancel_by_bf_limit_request_message_sent, 0)
  :: pattern == 1 -> fill_order_mass_cancel_by_bf_limit_request_message(order_mass_cancel_by_bf_limit_request_message_sent, 32)
  :: pattern == 2 -> fill_order_mass_cancel_by_bf_limit_request_message(order_mass_cancel_by_bf_limit_request_message_sent, 255)
  :: else -> ramp_order_mass_cancel_by_bf_limit_request_message(order_mass_cancel_by_bf_limit_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_mass_cancel_by_bf_limit_request_message(order_mass_cancel_by_bf_limit_request_message_sent);
    assert(at == 15);
    at = 0;
    decode_order_mass_cancel_by_bf_limit_request_message(order_mass_cancel_by_bf_limit_request_message_got);
    assert(at == 15);
    equal_order_mass_cancel_by_bf_limit_request_message(order_mass_cancel_by_bf_limit_request_message_got, order_mass_cancel_by_bf_limit_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_sbe_header()
  :: run check_establish_message()
  :: run check_terminate_message()
  :: run check_retransmit_request_message()
  :: run check_sequence_message()
  :: run check_order_mass_cancel_by_bf_limit_request_message()
  fi
}
