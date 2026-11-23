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
#define WIRE 21

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

/* ---- Establishment Ack Message: 20 bytes ------------------------------------- */

/* EstablishmentAckMessage */
typedef EstablishmentAckMessage {
  byte request_timestamp[8];
  byte keepalive_interval[4];
  byte next_seq_no[8]
};

int establishment_ack_message_at;

/* every byte of Establishment Ack Message set to one value */
inline fill_establishment_ack_message(establishment_ack_message_record, establishment_ack_message_value) {
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 8 -> establishment_ack_message_record.request_timestamp[establishment_ack_message_at] = establishment_ack_message_value; establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 4 -> establishment_ack_message_record.keepalive_interval[establishment_ack_message_at] = establishment_ack_message_value; establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 8 -> establishment_ack_message_record.next_seq_no[establishment_ack_message_at] = establishment_ack_message_value; establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Establishment Ack Message set to where it lies, so a field read out of place says so */
inline ramp_establishment_ack_message(establishment_ack_message_record, establishment_ack_message_base) {
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 8 -> establishment_ack_message_record.request_timestamp[establishment_ack_message_at] = (establishment_ack_message_base + 0 + establishment_ack_message_at + 1) % 256; establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 4 -> establishment_ack_message_record.keepalive_interval[establishment_ack_message_at] = (establishment_ack_message_base + 8 + establishment_ack_message_at + 1) % 256; establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 8 -> establishment_ack_message_record.next_seq_no[establishment_ack_message_at] = (establishment_ack_message_base + 12 + establishment_ack_message_at + 1) % 256; establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Establishment Ack Message to the wire, 20 bytes from where the cursor stands */
inline encode_establishment_ack_message(establishment_ack_message_record) {
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 8 -> wire[at] = establishment_ack_message_record.request_timestamp[establishment_ack_message_at]; at = at + 1; establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 4 -> wire[at] = establishment_ack_message_record.keepalive_interval[establishment_ack_message_at]; at = at + 1; establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 8 -> wire[at] = establishment_ack_message_record.next_seq_no[establishment_ack_message_at]; at = at + 1; establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Establishment Ack Message off the wire, 20 bytes from where the cursor stands */
inline decode_establishment_ack_message(establishment_ack_message_record) {
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 8 -> establishment_ack_message_record.request_timestamp[establishment_ack_message_at] = wire[at]; at = at + 1; establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 4 -> establishment_ack_message_record.keepalive_interval[establishment_ack_message_at] = wire[at]; at = at + 1; establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 8 -> establishment_ack_message_record.next_seq_no[establishment_ack_message_at] = wire[at]; at = at + 1; establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Establishment Ack Message is what was written, byte for byte */
inline equal_establishment_ack_message(establishment_ack_message_read, establishment_ack_message_written) {
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 8 -> assert(establishment_ack_message_read.request_timestamp[establishment_ack_message_at] == establishment_ack_message_written.request_timestamp[establishment_ack_message_at]); establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 4 -> assert(establishment_ack_message_read.keepalive_interval[establishment_ack_message_at] == establishment_ack_message_written.keepalive_interval[establishment_ack_message_at]); establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  establishment_ack_message_at = 0;
  do
  :: establishment_ack_message_at < 8 -> assert(establishment_ack_message_read.next_seq_no[establishment_ack_message_at] == establishment_ack_message_written.next_seq_no[establishment_ack_message_at]); establishment_ack_message_at = establishment_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Establishment Reject Message: 9 bytes ----------------------------------- */

/* EstablishmentRejectMessage */
typedef EstablishmentRejectMessage {
  byte request_timestamp[8];
  byte establishment_reject_code
};

int establishment_reject_message_at;

/* every byte of Establishment Reject Message set to one value */
inline fill_establishment_reject_message(establishment_reject_message_record, establishment_reject_message_value) {
  establishment_reject_message_at = 0;
  do
  :: establishment_reject_message_at < 8 -> establishment_reject_message_record.request_timestamp[establishment_reject_message_at] = establishment_reject_message_value; establishment_reject_message_at = establishment_reject_message_at + 1
  :: else -> break
  od;
  establishment_reject_message_record.establishment_reject_code = establishment_reject_message_value;
  skip
}

/* each byte of Establishment Reject Message set to where it lies, so a field read out of place says so */
inline ramp_establishment_reject_message(establishment_reject_message_record, establishment_reject_message_base) {
  establishment_reject_message_at = 0;
  do
  :: establishment_reject_message_at < 8 -> establishment_reject_message_record.request_timestamp[establishment_reject_message_at] = (establishment_reject_message_base + 0 + establishment_reject_message_at + 1) % 256; establishment_reject_message_at = establishment_reject_message_at + 1
  :: else -> break
  od;
  establishment_reject_message_record.establishment_reject_code = (establishment_reject_message_base + 8 + 1) % 256;
  skip
}

/* Establishment Reject Message to the wire, 9 bytes from where the cursor stands */
inline encode_establishment_reject_message(establishment_reject_message_record) {
  establishment_reject_message_at = 0;
  do
  :: establishment_reject_message_at < 8 -> wire[at] = establishment_reject_message_record.request_timestamp[establishment_reject_message_at]; at = at + 1; establishment_reject_message_at = establishment_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = establishment_reject_message_record.establishment_reject_code; at = at + 1;
  skip
}

/* Establishment Reject Message off the wire, 9 bytes from where the cursor stands */
inline decode_establishment_reject_message(establishment_reject_message_record) {
  establishment_reject_message_at = 0;
  do
  :: establishment_reject_message_at < 8 -> establishment_reject_message_record.request_timestamp[establishment_reject_message_at] = wire[at]; at = at + 1; establishment_reject_message_at = establishment_reject_message_at + 1
  :: else -> break
  od;
  establishment_reject_message_record.establishment_reject_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Establishment Reject Message is what was written, byte for byte */
inline equal_establishment_reject_message(establishment_reject_message_read, establishment_reject_message_written) {
  establishment_reject_message_at = 0;
  do
  :: establishment_reject_message_at < 8 -> assert(establishment_reject_message_read.request_timestamp[establishment_reject_message_at] == establishment_reject_message_written.request_timestamp[establishment_reject_message_at]); establishment_reject_message_at = establishment_reject_message_at + 1
  :: else -> break
  od;
  assert(establishment_reject_message_read.establishment_reject_code == establishment_reject_message_written.establishment_reject_code);
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

/* ---- Retransmission Message: 20 bytes ---------------------------------------- */

/* RetransmissionMessage */
typedef RetransmissionMessage {
  byte next_seq_no[8];
  byte request_timestamp[8];
  byte count[4]
};

int retransmission_message_at;

/* every byte of Retransmission Message set to one value */
inline fill_retransmission_message(retransmission_message_record, retransmission_message_value) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.next_seq_no[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.request_timestamp[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> retransmission_message_record.count[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_message(retransmission_message_record, retransmission_message_base) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.next_seq_no[retransmission_message_at] = (retransmission_message_base + 0 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.request_timestamp[retransmission_message_at] = (retransmission_message_base + 8 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> retransmission_message_record.count[retransmission_message_at] = (retransmission_message_base + 16 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Message to the wire, 20 bytes from where the cursor stands */
inline encode_retransmission_message(retransmission_message_record) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> wire[at] = retransmission_message_record.next_seq_no[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> wire[at] = retransmission_message_record.request_timestamp[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> wire[at] = retransmission_message_record.count[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Message off the wire, 20 bytes from where the cursor stands */
inline decode_retransmission_message(retransmission_message_record) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.next_seq_no[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.request_timestamp[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> retransmission_message_record.count[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Message is what was written, byte for byte */
inline equal_retransmission_message(retransmission_message_read, retransmission_message_written) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> assert(retransmission_message_read.next_seq_no[retransmission_message_at] == retransmission_message_written.next_seq_no[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> assert(retransmission_message_read.request_timestamp[retransmission_message_at] == retransmission_message_written.request_timestamp[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 4 -> assert(retransmission_message_read.count[retransmission_message_at] == retransmission_message_written.count[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
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

/* ---- Flood Reject Message: 16 bytes ------------------------------------------ */

/* FloodRejectMessage */
typedef FloodRejectMessage {
  byte cl_ord_id[8];
  byte queue_size[4];
  byte penalty_remain[4]
};

int flood_reject_message_at;

/* every byte of Flood Reject Message set to one value */
inline fill_flood_reject_message(flood_reject_message_record, flood_reject_message_value) {
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 8 -> flood_reject_message_record.cl_ord_id[flood_reject_message_at] = flood_reject_message_value; flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 4 -> flood_reject_message_record.queue_size[flood_reject_message_at] = flood_reject_message_value; flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 4 -> flood_reject_message_record.penalty_remain[flood_reject_message_at] = flood_reject_message_value; flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Flood Reject Message set to where it lies, so a field read out of place says so */
inline ramp_flood_reject_message(flood_reject_message_record, flood_reject_message_base) {
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 8 -> flood_reject_message_record.cl_ord_id[flood_reject_message_at] = (flood_reject_message_base + 0 + flood_reject_message_at + 1) % 256; flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 4 -> flood_reject_message_record.queue_size[flood_reject_message_at] = (flood_reject_message_base + 8 + flood_reject_message_at + 1) % 256; flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 4 -> flood_reject_message_record.penalty_remain[flood_reject_message_at] = (flood_reject_message_base + 12 + flood_reject_message_at + 1) % 256; flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Flood Reject Message to the wire, 16 bytes from where the cursor stands */
inline encode_flood_reject_message(flood_reject_message_record) {
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 8 -> wire[at] = flood_reject_message_record.cl_ord_id[flood_reject_message_at]; at = at + 1; flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 4 -> wire[at] = flood_reject_message_record.queue_size[flood_reject_message_at]; at = at + 1; flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 4 -> wire[at] = flood_reject_message_record.penalty_remain[flood_reject_message_at]; at = at + 1; flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Flood Reject Message off the wire, 16 bytes from where the cursor stands */
inline decode_flood_reject_message(flood_reject_message_record) {
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 8 -> flood_reject_message_record.cl_ord_id[flood_reject_message_at] = wire[at]; at = at + 1; flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 4 -> flood_reject_message_record.queue_size[flood_reject_message_at] = wire[at]; at = at + 1; flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 4 -> flood_reject_message_record.penalty_remain[flood_reject_message_at] = wire[at]; at = at + 1; flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Flood Reject Message is what was written, byte for byte */
inline equal_flood_reject_message(flood_reject_message_read, flood_reject_message_written) {
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 8 -> assert(flood_reject_message_read.cl_ord_id[flood_reject_message_at] == flood_reject_message_written.cl_ord_id[flood_reject_message_at]); flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 4 -> assert(flood_reject_message_read.queue_size[flood_reject_message_at] == flood_reject_message_written.queue_size[flood_reject_message_at]); flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  flood_reject_message_at = 0;
  do
  :: flood_reject_message_at < 4 -> assert(flood_reject_message_read.penalty_remain[flood_reject_message_at] == flood_reject_message_written.penalty_remain[flood_reject_message_at]); flood_reject_message_at = flood_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Session Reject Message: 13 bytes ---------------------------------------- */

/* SessionRejectMessage */
typedef SessionRejectMessage {
  byte cl_ord_id[8];
  byte ref_tag_id[4];
  byte session_reject_reason
};

int session_reject_message_at;

/* every byte of Session Reject Message set to one value */
inline fill_session_reject_message(session_reject_message_record, session_reject_message_value) {
  session_reject_message_at = 0;
  do
  :: session_reject_message_at < 8 -> session_reject_message_record.cl_ord_id[session_reject_message_at] = session_reject_message_value; session_reject_message_at = session_reject_message_at + 1
  :: else -> break
  od;
  session_reject_message_at = 0;
  do
  :: session_reject_message_at < 4 -> session_reject_message_record.ref_tag_id[session_reject_message_at] = session_reject_message_value; session_reject_message_at = session_reject_message_at + 1
  :: else -> break
  od;
  session_reject_message_record.session_reject_reason = session_reject_message_value;
  skip
}

/* each byte of Session Reject Message set to where it lies, so a field read out of place says so */
inline ramp_session_reject_message(session_reject_message_record, session_reject_message_base) {
  session_reject_message_at = 0;
  do
  :: session_reject_message_at < 8 -> session_reject_message_record.cl_ord_id[session_reject_message_at] = (session_reject_message_base + 0 + session_reject_message_at + 1) % 256; session_reject_message_at = session_reject_message_at + 1
  :: else -> break
  od;
  session_reject_message_at = 0;
  do
  :: session_reject_message_at < 4 -> session_reject_message_record.ref_tag_id[session_reject_message_at] = (session_reject_message_base + 8 + session_reject_message_at + 1) % 256; session_reject_message_at = session_reject_message_at + 1
  :: else -> break
  od;
  session_reject_message_record.session_reject_reason = (session_reject_message_base + 12 + 1) % 256;
  skip
}

/* Session Reject Message to the wire, 13 bytes from where the cursor stands */
inline encode_session_reject_message(session_reject_message_record) {
  session_reject_message_at = 0;
  do
  :: session_reject_message_at < 8 -> wire[at] = session_reject_message_record.cl_ord_id[session_reject_message_at]; at = at + 1; session_reject_message_at = session_reject_message_at + 1
  :: else -> break
  od;
  session_reject_message_at = 0;
  do
  :: session_reject_message_at < 4 -> wire[at] = session_reject_message_record.ref_tag_id[session_reject_message_at]; at = at + 1; session_reject_message_at = session_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = session_reject_message_record.session_reject_reason; at = at + 1;
  skip
}

/* Session Reject Message off the wire, 13 bytes from where the cursor stands */
inline decode_session_reject_message(session_reject_message_record) {
  session_reject_message_at = 0;
  do
  :: session_reject_message_at < 8 -> session_reject_message_record.cl_ord_id[session_reject_message_at] = wire[at]; at = at + 1; session_reject_message_at = session_reject_message_at + 1
  :: else -> break
  od;
  session_reject_message_at = 0;
  do
  :: session_reject_message_at < 4 -> session_reject_message_record.ref_tag_id[session_reject_message_at] = wire[at]; at = at + 1; session_reject_message_at = session_reject_message_at + 1
  :: else -> break
  od;
  session_reject_message_record.session_reject_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Session Reject Message is what was written, byte for byte */
inline equal_session_reject_message(session_reject_message_read, session_reject_message_written) {
  session_reject_message_at = 0;
  do
  :: session_reject_message_at < 8 -> assert(session_reject_message_read.cl_ord_id[session_reject_message_at] == session_reject_message_written.cl_ord_id[session_reject_message_at]); session_reject_message_at = session_reject_message_at + 1
  :: else -> break
  od;
  session_reject_message_at = 0;
  do
  :: session_reject_message_at < 4 -> assert(session_reject_message_read.ref_tag_id[session_reject_message_at] == session_reject_message_written.ref_tag_id[session_reject_message_at]); session_reject_message_at = session_reject_message_at + 1
  :: else -> break
  od;
  assert(session_reject_message_read.session_reject_reason == session_reject_message_written.session_reject_reason);
  skip
}

/* ---- Business Message Reject Message: 20 bytes ------------------------------- */

/* BusinessMessageRejectMessage */
typedef BusinessMessageRejectMessage {
  byte cl_ord_id[8];
  byte timestamp[8];
  byte ord_rej_reason[4]
};

int business_message_reject_message_at;

/* every byte of Business Message Reject Message set to one value */
inline fill_business_message_reject_message(business_message_reject_message_record, business_message_reject_message_value) {
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 8 -> business_message_reject_message_record.cl_ord_id[business_message_reject_message_at] = business_message_reject_message_value; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 8 -> business_message_reject_message_record.timestamp[business_message_reject_message_at] = business_message_reject_message_value; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 4 -> business_message_reject_message_record.ord_rej_reason[business_message_reject_message_at] = business_message_reject_message_value; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Business Message Reject Message set to where it lies, so a field read out of place says so */
inline ramp_business_message_reject_message(business_message_reject_message_record, business_message_reject_message_base) {
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 8 -> business_message_reject_message_record.cl_ord_id[business_message_reject_message_at] = (business_message_reject_message_base + 0 + business_message_reject_message_at + 1) % 256; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 8 -> business_message_reject_message_record.timestamp[business_message_reject_message_at] = (business_message_reject_message_base + 8 + business_message_reject_message_at + 1) % 256; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 4 -> business_message_reject_message_record.ord_rej_reason[business_message_reject_message_at] = (business_message_reject_message_base + 16 + business_message_reject_message_at + 1) % 256; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Business Message Reject Message to the wire, 20 bytes from where the cursor stands */
inline encode_business_message_reject_message(business_message_reject_message_record) {
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 8 -> wire[at] = business_message_reject_message_record.cl_ord_id[business_message_reject_message_at]; at = at + 1; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 8 -> wire[at] = business_message_reject_message_record.timestamp[business_message_reject_message_at]; at = at + 1; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 4 -> wire[at] = business_message_reject_message_record.ord_rej_reason[business_message_reject_message_at]; at = at + 1; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Business Message Reject Message off the wire, 20 bytes from where the cursor stands */
inline decode_business_message_reject_message(business_message_reject_message_record) {
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 8 -> business_message_reject_message_record.cl_ord_id[business_message_reject_message_at] = wire[at]; at = at + 1; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 8 -> business_message_reject_message_record.timestamp[business_message_reject_message_at] = wire[at]; at = at + 1; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 4 -> business_message_reject_message_record.ord_rej_reason[business_message_reject_message_at] = wire[at]; at = at + 1; business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Business Message Reject Message is what was written, byte for byte */
inline equal_business_message_reject_message(business_message_reject_message_read, business_message_reject_message_written) {
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 8 -> assert(business_message_reject_message_read.cl_ord_id[business_message_reject_message_at] == business_message_reject_message_written.cl_ord_id[business_message_reject_message_at]); business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 8 -> assert(business_message_reject_message_read.timestamp[business_message_reject_message_at] == business_message_reject_message_written.timestamp[business_message_reject_message_at]); business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  business_message_reject_message_at = 0;
  do
  :: business_message_reject_message_at < 4 -> assert(business_message_reject_message_read.ord_rej_reason[business_message_reject_message_at] == business_message_reject_message_written.ord_rej_reason[business_message_reject_message_at]); business_message_reject_message_at = business_message_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Mass Cancel Response Message: 20 bytes ---------------------------- */

/* OrderMassCancelResponseMessage */
typedef OrderMassCancelResponseMessage {
  byte cl_ord_id[8];
  byte timestamp[8];
  byte total_affected_orders[4]
};

int order_mass_cancel_response_message_at;

/* every byte of Order Mass Cancel Response Message set to one value */
inline fill_order_mass_cancel_response_message(order_mass_cancel_response_message_record, order_mass_cancel_response_message_value) {
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 8 -> order_mass_cancel_response_message_record.cl_ord_id[order_mass_cancel_response_message_at] = order_mass_cancel_response_message_value; order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 8 -> order_mass_cancel_response_message_record.timestamp[order_mass_cancel_response_message_at] = order_mass_cancel_response_message_value; order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 4 -> order_mass_cancel_response_message_record.total_affected_orders[order_mass_cancel_response_message_at] = order_mass_cancel_response_message_value; order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Mass Cancel Response Message set to where it lies, so a field read out of place says so */
inline ramp_order_mass_cancel_response_message(order_mass_cancel_response_message_record, order_mass_cancel_response_message_base) {
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 8 -> order_mass_cancel_response_message_record.cl_ord_id[order_mass_cancel_response_message_at] = (order_mass_cancel_response_message_base + 0 + order_mass_cancel_response_message_at + 1) % 256; order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 8 -> order_mass_cancel_response_message_record.timestamp[order_mass_cancel_response_message_at] = (order_mass_cancel_response_message_base + 8 + order_mass_cancel_response_message_at + 1) % 256; order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 4 -> order_mass_cancel_response_message_record.total_affected_orders[order_mass_cancel_response_message_at] = (order_mass_cancel_response_message_base + 16 + order_mass_cancel_response_message_at + 1) % 256; order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Cancel Response Message to the wire, 20 bytes from where the cursor stands */
inline encode_order_mass_cancel_response_message(order_mass_cancel_response_message_record) {
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 8 -> wire[at] = order_mass_cancel_response_message_record.cl_ord_id[order_mass_cancel_response_message_at]; at = at + 1; order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 8 -> wire[at] = order_mass_cancel_response_message_record.timestamp[order_mass_cancel_response_message_at]; at = at + 1; order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 4 -> wire[at] = order_mass_cancel_response_message_record.total_affected_orders[order_mass_cancel_response_message_at]; at = at + 1; order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Cancel Response Message off the wire, 20 bytes from where the cursor stands */
inline decode_order_mass_cancel_response_message(order_mass_cancel_response_message_record) {
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 8 -> order_mass_cancel_response_message_record.cl_ord_id[order_mass_cancel_response_message_at] = wire[at]; at = at + 1; order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 8 -> order_mass_cancel_response_message_record.timestamp[order_mass_cancel_response_message_at] = wire[at]; at = at + 1; order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 4 -> order_mass_cancel_response_message_record.total_affected_orders[order_mass_cancel_response_message_at] = wire[at]; at = at + 1; order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Mass Cancel Response Message is what was written, byte for byte */
inline equal_order_mass_cancel_response_message(order_mass_cancel_response_message_read, order_mass_cancel_response_message_written) {
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 8 -> assert(order_mass_cancel_response_message_read.cl_ord_id[order_mass_cancel_response_message_at] == order_mass_cancel_response_message_written.cl_ord_id[order_mass_cancel_response_message_at]); order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 8 -> assert(order_mass_cancel_response_message_read.timestamp[order_mass_cancel_response_message_at] == order_mass_cancel_response_message_written.timestamp[order_mass_cancel_response_message_at]); order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_response_message_at = 0;
  do
  :: order_mass_cancel_response_message_at < 4 -> assert(order_mass_cancel_response_message_read.total_affected_orders[order_mass_cancel_response_message_at] == order_mass_cancel_response_message_written.total_affected_orders[order_mass_cancel_response_message_at]); order_mass_cancel_response_message_at = order_mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Empty Book Message: 12 bytes -------------------------------------------- */

/* EmptyBookMessage */
typedef EmptyBookMessage {
  byte timestamp[8];
  byte trading_session_id[4]
};

int empty_book_message_at;

/* every byte of Empty Book Message set to one value */
inline fill_empty_book_message(empty_book_message_record, empty_book_message_value) {
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 8 -> empty_book_message_record.timestamp[empty_book_message_at] = empty_book_message_value; empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 4 -> empty_book_message_record.trading_session_id[empty_book_message_at] = empty_book_message_value; empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Empty Book Message set to where it lies, so a field read out of place says so */
inline ramp_empty_book_message(empty_book_message_record, empty_book_message_base) {
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 8 -> empty_book_message_record.timestamp[empty_book_message_at] = (empty_book_message_base + 0 + empty_book_message_at + 1) % 256; empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 4 -> empty_book_message_record.trading_session_id[empty_book_message_at] = (empty_book_message_base + 8 + empty_book_message_at + 1) % 256; empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Empty Book Message to the wire, 12 bytes from where the cursor stands */
inline encode_empty_book_message(empty_book_message_record) {
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 8 -> wire[at] = empty_book_message_record.timestamp[empty_book_message_at]; at = at + 1; empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 4 -> wire[at] = empty_book_message_record.trading_session_id[empty_book_message_at]; at = at + 1; empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Empty Book Message off the wire, 12 bytes from where the cursor stands */
inline decode_empty_book_message(empty_book_message_record) {
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 8 -> empty_book_message_record.timestamp[empty_book_message_at] = wire[at]; at = at + 1; empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 4 -> empty_book_message_record.trading_session_id[empty_book_message_at] = wire[at]; at = at + 1; empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Empty Book Message is what was written, byte for byte */
inline equal_empty_book_message(empty_book_message_read, empty_book_message_written) {
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 8 -> assert(empty_book_message_read.timestamp[empty_book_message_at] == empty_book_message_written.timestamp[empty_book_message_at]); empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  empty_book_message_at = 0;
  do
  :: empty_book_message_at < 4 -> assert(empty_book_message_read.trading_session_id[empty_book_message_at] == empty_book_message_written.trading_session_id[empty_book_message_at]); empty_book_message_at = empty_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 21 bytes ------------------------------------------ */

/* SystemEventMessage */
typedef SystemEventMessage {
  byte timestamp[8];
  byte event_id[8];
  byte trading_session_id[4];
  byte trad_ses_event
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.event_id[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.trading_session_id[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.trad_ses_event = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.event_id[system_event_message_at] = (system_event_message_base + 8 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.trading_session_id[system_event_message_at] = (system_event_message_base + 16 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.trad_ses_event = (system_event_message_base + 20 + 1) % 256;
  skip
}

/* System Event Message to the wire, 21 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.event_id[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.trading_session_id[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.trad_ses_event; at = at + 1;
  skip
}

/* System Event Message off the wire, 21 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.event_id[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.trading_session_id[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.trad_ses_event = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.event_id[system_event_message_at] == system_event_message_written.event_id[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.trading_session_id[system_event_message_at] == system_event_message_written.trading_session_id[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.trad_ses_event == system_event_message_written.trad_ses_event);
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

/* Establishment Ack Message: encoded, read back, and compared */
proctype check_establishment_ack_message() {
  EstablishmentAckMessage establishment_ack_message_sent;
  EstablishmentAckMessage establishment_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_establishment_ack_message(establishment_ack_message_sent, 0)
  :: pattern == 1 -> fill_establishment_ack_message(establishment_ack_message_sent, 32)
  :: pattern == 2 -> fill_establishment_ack_message(establishment_ack_message_sent, 255)
  :: else -> ramp_establishment_ack_message(establishment_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_establishment_ack_message(establishment_ack_message_sent);
    assert(at == 20);
    at = 0;
    decode_establishment_ack_message(establishment_ack_message_got);
    assert(at == 20);
    equal_establishment_ack_message(establishment_ack_message_got, establishment_ack_message_sent)
  }
}

/* Establishment Reject Message: encoded, read back, and compared */
proctype check_establishment_reject_message() {
  EstablishmentRejectMessage establishment_reject_message_sent;
  EstablishmentRejectMessage establishment_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_establishment_reject_message(establishment_reject_message_sent, 0)
  :: pattern == 1 -> fill_establishment_reject_message(establishment_reject_message_sent, 32)
  :: pattern == 2 -> fill_establishment_reject_message(establishment_reject_message_sent, 255)
  :: else -> ramp_establishment_reject_message(establishment_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_establishment_reject_message(establishment_reject_message_sent);
    assert(at == 9);
    at = 0;
    decode_establishment_reject_message(establishment_reject_message_got);
    assert(at == 9);
    equal_establishment_reject_message(establishment_reject_message_got, establishment_reject_message_sent)
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

/* Retransmission Message: encoded, read back, and compared */
proctype check_retransmission_message() {
  RetransmissionMessage retransmission_message_sent;
  RetransmissionMessage retransmission_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_message(retransmission_message_sent, 0)
  :: pattern == 1 -> fill_retransmission_message(retransmission_message_sent, 32)
  :: pattern == 2 -> fill_retransmission_message(retransmission_message_sent, 255)
  :: else -> ramp_retransmission_message(retransmission_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_message(retransmission_message_sent);
    assert(at == 20);
    at = 0;
    decode_retransmission_message(retransmission_message_got);
    assert(at == 20);
    equal_retransmission_message(retransmission_message_got, retransmission_message_sent)
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

/* Flood Reject Message: encoded, read back, and compared */
proctype check_flood_reject_message() {
  FloodRejectMessage flood_reject_message_sent;
  FloodRejectMessage flood_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_flood_reject_message(flood_reject_message_sent, 0)
  :: pattern == 1 -> fill_flood_reject_message(flood_reject_message_sent, 32)
  :: pattern == 2 -> fill_flood_reject_message(flood_reject_message_sent, 255)
  :: else -> ramp_flood_reject_message(flood_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_flood_reject_message(flood_reject_message_sent);
    assert(at == 16);
    at = 0;
    decode_flood_reject_message(flood_reject_message_got);
    assert(at == 16);
    equal_flood_reject_message(flood_reject_message_got, flood_reject_message_sent)
  }
}

/* Session Reject Message: encoded, read back, and compared */
proctype check_session_reject_message() {
  SessionRejectMessage session_reject_message_sent;
  SessionRejectMessage session_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_session_reject_message(session_reject_message_sent, 0)
  :: pattern == 1 -> fill_session_reject_message(session_reject_message_sent, 32)
  :: pattern == 2 -> fill_session_reject_message(session_reject_message_sent, 255)
  :: else -> ramp_session_reject_message(session_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_session_reject_message(session_reject_message_sent);
    assert(at == 13);
    at = 0;
    decode_session_reject_message(session_reject_message_got);
    assert(at == 13);
    equal_session_reject_message(session_reject_message_got, session_reject_message_sent)
  }
}

/* Business Message Reject Message: encoded, read back, and compared */
proctype check_business_message_reject_message() {
  BusinessMessageRejectMessage business_message_reject_message_sent;
  BusinessMessageRejectMessage business_message_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_business_message_reject_message(business_message_reject_message_sent, 0)
  :: pattern == 1 -> fill_business_message_reject_message(business_message_reject_message_sent, 32)
  :: pattern == 2 -> fill_business_message_reject_message(business_message_reject_message_sent, 255)
  :: else -> ramp_business_message_reject_message(business_message_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_business_message_reject_message(business_message_reject_message_sent);
    assert(at == 20);
    at = 0;
    decode_business_message_reject_message(business_message_reject_message_got);
    assert(at == 20);
    equal_business_message_reject_message(business_message_reject_message_got, business_message_reject_message_sent)
  }
}

/* Order Mass Cancel Response Message: encoded, read back, and compared */
proctype check_order_mass_cancel_response_message() {
  OrderMassCancelResponseMessage order_mass_cancel_response_message_sent;
  OrderMassCancelResponseMessage order_mass_cancel_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_mass_cancel_response_message(order_mass_cancel_response_message_sent, 0)
  :: pattern == 1 -> fill_order_mass_cancel_response_message(order_mass_cancel_response_message_sent, 32)
  :: pattern == 2 -> fill_order_mass_cancel_response_message(order_mass_cancel_response_message_sent, 255)
  :: else -> ramp_order_mass_cancel_response_message(order_mass_cancel_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_mass_cancel_response_message(order_mass_cancel_response_message_sent);
    assert(at == 20);
    at = 0;
    decode_order_mass_cancel_response_message(order_mass_cancel_response_message_got);
    assert(at == 20);
    equal_order_mass_cancel_response_message(order_mass_cancel_response_message_got, order_mass_cancel_response_message_sent)
  }
}

/* Empty Book Message: encoded, read back, and compared */
proctype check_empty_book_message() {
  EmptyBookMessage empty_book_message_sent;
  EmptyBookMessage empty_book_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_empty_book_message(empty_book_message_sent, 0)
  :: pattern == 1 -> fill_empty_book_message(empty_book_message_sent, 32)
  :: pattern == 2 -> fill_empty_book_message(empty_book_message_sent, 255)
  :: else -> ramp_empty_book_message(empty_book_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_empty_book_message(empty_book_message_sent);
    assert(at == 12);
    at = 0;
    decode_empty_book_message(empty_book_message_got);
    assert(at == 12);
    equal_empty_book_message(empty_book_message_got, empty_book_message_sent)
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
    assert(at == 21);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 21);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_sbe_header()
  :: run check_establishment_ack_message()
  :: run check_establishment_reject_message()
  :: run check_terminate_message()
  :: run check_retransmission_message()
  :: run check_sequence_message()
  :: run check_flood_reject_message()
  :: run check_session_reject_message()
  :: run check_business_message_reject_message()
  :: run check_order_mass_cancel_response_message()
  :: run check_empty_book_message()
  :: run check_system_event_message()
  fi
}
