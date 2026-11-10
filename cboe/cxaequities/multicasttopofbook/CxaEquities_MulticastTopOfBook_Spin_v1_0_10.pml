/*
 * Chicago Board Options Exchange Multicast Top Of Book
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
 *   - a Reassemble rule
 *   - a run filling what frames it
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 40

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 8 bytes -------------------------------------------------- */

typedef PacketHeader {
  byte length[2];
  byte message_count;
  byte unit;
  byte sequence[4]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = packet_header_value;
  packet_header_record.unit = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = (packet_header_base + 2 + 1) % 256;
  packet_header_record.unit = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 8 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.message_count; at = at + 1;
  wire[at] = packet_header_record.unit; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 8 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = wire[at]; at = at + 1;
  packet_header_record.unit = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.length[packet_header_at] == packet_header_written.length[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.message_count == packet_header_written.message_count);
  assert(packet_header_read.unit == packet_header_written.unit);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence[packet_header_at] == packet_header_written.sequence[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 2 bytes ------------------------------------------------- */

typedef MessageHeader {
  byte message_length;
  byte message_type
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.message_length = message_header_value;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.message_length = (message_header_base + 0 + 1) % 256;
  message_header_record.message_type = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.message_length; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.message_length = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.message_length == message_header_written.message_length);
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Login Message: 20 bytes ------------------------------------------------- */

/* First message sent to the Spin Server by the client process after the connection to the Spin Server is established. Failure to login before sending any other message type will result in the connection being dropped by the Spin Server. Identical format to the GRP Login message. */
typedef LoginMessage {
  byte session_sub_id[4];
  byte username[4];
  byte filler[2];
  byte password[10]
};

int login_message_at;

/* every byte of Login Message set to one value */
inline fill_login_message(login_message_record, login_message_value) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.session_sub_id[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.username[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.filler[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Message set to where it lies, so a field read out of place says so */
inline ramp_login_message(login_message_record, login_message_base) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.session_sub_id[login_message_at] = (login_message_base + 0 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.username[login_message_at] = (login_message_base + 4 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.filler[login_message_at] = (login_message_base + 8 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = (login_message_base + 10 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message to the wire, 20 bytes from where the cursor stands */
inline encode_login_message(login_message_record) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> wire[at] = login_message_record.session_sub_id[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> wire[at] = login_message_record.username[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> wire[at] = login_message_record.filler[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> wire[at] = login_message_record.password[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message off the wire, 20 bytes from where the cursor stands */
inline decode_login_message(login_message_record) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.session_sub_id[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.username[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.filler[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Message is what was written, byte for byte */
inline equal_login_message(login_message_read, login_message_written) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> assert(login_message_read.session_sub_id[login_message_at] == login_message_written.session_sub_id[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> assert(login_message_read.username[login_message_at] == login_message_written.username[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> assert(login_message_read.filler[login_message_at] == login_message_written.filler[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> assert(login_message_read.password[login_message_at] == login_message_written.password[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response Message: 1 bytes ----------------------------------------- */

/* Sent by the Spin Server to the client process in response to a Login message. The Status field reflects an accepted login or the reason the session was not accepted. If login fails, the connection will be dropped after the Login Response message is sent. */
typedef LoginResponseMessage {
  byte login_response_status
};

/* every byte of Login Response Message set to one value */
inline fill_login_response_message(login_response_message_record, login_response_message_value) {
  login_response_message_record.login_response_status = login_response_message_value;
  skip
}

/* each byte of Login Response Message set to where it lies, so a field read out of place says so */
inline ramp_login_response_message(login_response_message_record, login_response_message_base) {
  login_response_message_record.login_response_status = (login_response_message_base + 0 + 1) % 256;
  skip
}

/* Login Response Message to the wire, 1 bytes from where the cursor stands */
inline encode_login_response_message(login_response_message_record) {
  wire[at] = login_response_message_record.login_response_status; at = at + 1;
  skip
}

/* Login Response Message off the wire, 1 bytes from where the cursor stands */
inline decode_login_response_message(login_response_message_record) {
  login_response_message_record.login_response_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Response Message is what was written, byte for byte */
inline equal_login_response_message(login_response_message_read, login_response_message_written) {
  assert(login_response_message_read.login_response_status == login_response_message_written.login_response_status);
  skip
}

/* ---- Spin Image Available Message: 4 bytes ----------------------------------- */

/* Sent once per second by the Spin Server, indicating through what sequence number a spin is available. */
typedef SpinImageAvailableMessage {
  byte sequence[4]
};

int spin_image_available_message_at;

/* every byte of Spin Image Available Message set to one value */
inline fill_spin_image_available_message(spin_image_available_message_record, spin_image_available_message_value) {
  spin_image_available_message_at = 0;
  do
  :: spin_image_available_message_at < 4 -> spin_image_available_message_record.sequence[spin_image_available_message_at] = spin_image_available_message_value; spin_image_available_message_at = spin_image_available_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Spin Image Available Message set to where it lies, so a field read out of place says so */
inline ramp_spin_image_available_message(spin_image_available_message_record, spin_image_available_message_base) {
  spin_image_available_message_at = 0;
  do
  :: spin_image_available_message_at < 4 -> spin_image_available_message_record.sequence[spin_image_available_message_at] = (spin_image_available_message_base + 0 + spin_image_available_message_at + 1) % 256; spin_image_available_message_at = spin_image_available_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Image Available Message to the wire, 4 bytes from where the cursor stands */
inline encode_spin_image_available_message(spin_image_available_message_record) {
  spin_image_available_message_at = 0;
  do
  :: spin_image_available_message_at < 4 -> wire[at] = spin_image_available_message_record.sequence[spin_image_available_message_at]; at = at + 1; spin_image_available_message_at = spin_image_available_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Image Available Message off the wire, 4 bytes from where the cursor stands */
inline decode_spin_image_available_message(spin_image_available_message_record) {
  spin_image_available_message_at = 0;
  do
  :: spin_image_available_message_at < 4 -> spin_image_available_message_record.sequence[spin_image_available_message_at] = wire[at]; at = at + 1; spin_image_available_message_at = spin_image_available_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Spin Image Available Message is what was written, byte for byte */
inline equal_spin_image_available_message(spin_image_available_message_read, spin_image_available_message_written) {
  spin_image_available_message_at = 0;
  do
  :: spin_image_available_message_at < 4 -> assert(spin_image_available_message_read.sequence[spin_image_available_message_at] == spin_image_available_message_written.sequence[spin_image_available_message_at]); spin_image_available_message_at = spin_image_available_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Spin Request Message: 4 bytes ------------------------------------------- */

/* Used by a client's process to request transmission of a spin of the unit's order book. */
typedef SpinRequestMessage {
  byte sequence[4]
};

int spin_request_message_at;

/* every byte of Spin Request Message set to one value */
inline fill_spin_request_message(spin_request_message_record, spin_request_message_value) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> spin_request_message_record.sequence[spin_request_message_at] = spin_request_message_value; spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Spin Request Message set to where it lies, so a field read out of place says so */
inline ramp_spin_request_message(spin_request_message_record, spin_request_message_base) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> spin_request_message_record.sequence[spin_request_message_at] = (spin_request_message_base + 0 + spin_request_message_at + 1) % 256; spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Request Message to the wire, 4 bytes from where the cursor stands */
inline encode_spin_request_message(spin_request_message_record) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> wire[at] = spin_request_message_record.sequence[spin_request_message_at]; at = at + 1; spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Request Message off the wire, 4 bytes from where the cursor stands */
inline decode_spin_request_message(spin_request_message_record) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> spin_request_message_record.sequence[spin_request_message_at] = wire[at]; at = at + 1; spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Spin Request Message is what was written, byte for byte */
inline equal_spin_request_message(spin_request_message_read, spin_request_message_written) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> assert(spin_request_message_read.sequence[spin_request_message_at] == spin_request_message_written.sequence[spin_request_message_at]); spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Spin Response Message: 9 bytes ------------------------------------------ */

/* Sent by the Spin Server in response to a client's Spin Request message indicating whether a spin will be sent. */
typedef SpinResponseMessage {
  byte sequence[4];
  byte order_count[4];
  byte spin_response_status
};

int spin_response_message_at;

/* every byte of Spin Response Message set to one value */
inline fill_spin_response_message(spin_response_message_record, spin_response_message_value) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.sequence[spin_response_message_at] = spin_response_message_value; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.order_count[spin_response_message_at] = spin_response_message_value; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_record.spin_response_status = spin_response_message_value;
  skip
}

/* each byte of Spin Response Message set to where it lies, so a field read out of place says so */
inline ramp_spin_response_message(spin_response_message_record, spin_response_message_base) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.sequence[spin_response_message_at] = (spin_response_message_base + 0 + spin_response_message_at + 1) % 256; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.order_count[spin_response_message_at] = (spin_response_message_base + 4 + spin_response_message_at + 1) % 256; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_record.spin_response_status = (spin_response_message_base + 8 + 1) % 256;
  skip
}

/* Spin Response Message to the wire, 9 bytes from where the cursor stands */
inline encode_spin_response_message(spin_response_message_record) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> wire[at] = spin_response_message_record.sequence[spin_response_message_at]; at = at + 1; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> wire[at] = spin_response_message_record.order_count[spin_response_message_at]; at = at + 1; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  wire[at] = spin_response_message_record.spin_response_status; at = at + 1;
  skip
}

/* Spin Response Message off the wire, 9 bytes from where the cursor stands */
inline decode_spin_response_message(spin_response_message_record) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.sequence[spin_response_message_at] = wire[at]; at = at + 1; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.order_count[spin_response_message_at] = wire[at]; at = at + 1; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_record.spin_response_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Spin Response Message is what was written, byte for byte */
inline equal_spin_response_message(spin_response_message_read, spin_response_message_written) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> assert(spin_response_message_read.sequence[spin_response_message_at] == spin_response_message_written.sequence[spin_response_message_at]); spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> assert(spin_response_message_read.order_count[spin_response_message_at] == spin_response_message_written.order_count[spin_response_message_at]); spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  assert(spin_response_message_read.spin_response_status == spin_response_message_written.spin_response_status);
  skip
}

/* ---- Spin Finished Message: 4 bytes ------------------------------------------ */

/* Sent to indicate that all messages for the spin requested have been sent. A Spin Finished message is only sent if a Spin Request was not rejected. Upon receipt, any buffered multicast messages should be applied to the client's copy of the book to make it current. */
typedef SpinFinishedMessage {
  byte sequence[4]
};

int spin_finished_message_at;

/* every byte of Spin Finished Message set to one value */
inline fill_spin_finished_message(spin_finished_message_record, spin_finished_message_value) {
  spin_finished_message_at = 0;
  do
  :: spin_finished_message_at < 4 -> spin_finished_message_record.sequence[spin_finished_message_at] = spin_finished_message_value; spin_finished_message_at = spin_finished_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Spin Finished Message set to where it lies, so a field read out of place says so */
inline ramp_spin_finished_message(spin_finished_message_record, spin_finished_message_base) {
  spin_finished_message_at = 0;
  do
  :: spin_finished_message_at < 4 -> spin_finished_message_record.sequence[spin_finished_message_at] = (spin_finished_message_base + 0 + spin_finished_message_at + 1) % 256; spin_finished_message_at = spin_finished_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Finished Message to the wire, 4 bytes from where the cursor stands */
inline encode_spin_finished_message(spin_finished_message_record) {
  spin_finished_message_at = 0;
  do
  :: spin_finished_message_at < 4 -> wire[at] = spin_finished_message_record.sequence[spin_finished_message_at]; at = at + 1; spin_finished_message_at = spin_finished_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Finished Message off the wire, 4 bytes from where the cursor stands */
inline decode_spin_finished_message(spin_finished_message_record) {
  spin_finished_message_at = 0;
  do
  :: spin_finished_message_at < 4 -> spin_finished_message_record.sequence[spin_finished_message_at] = wire[at]; at = at + 1; spin_finished_message_at = spin_finished_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Spin Finished Message is what was written, byte for byte */
inline equal_spin_finished_message(spin_finished_message_read, spin_finished_message_written) {
  spin_finished_message_at = 0;
  do
  :: spin_finished_message_at < 4 -> assert(spin_finished_message_read.sequence[spin_finished_message_at] == spin_finished_message_written.sequence[spin_finished_message_at]); spin_finished_message_at = spin_finished_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Message: 20 bytes ---------------------------------------- */

/* Indicates the current trading status of a security. Included in a spin response so the client can populate trading state for each symbol. */
typedef TradingStatusMessage {
  byte timestamp[8];
  byte symbol[6];
  byte trading_status;
  byte market_id_code[4];
  byte reserved_1
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = trading_status_message_value;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.market_id_code[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.reserved_1 = trading_status_message_value;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = (trading_status_message_base + 8 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = (trading_status_message_base + 14 + 1) % 256;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.market_id_code[trading_status_message_at] = (trading_status_message_base + 15 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.reserved_1 = (trading_status_message_base + 19 + 1) % 256;
  skip
}

/* Trading Status Message to the wire, 20 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.timestamp[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> wire[at] = trading_status_message_record.symbol[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.trading_status; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.market_id_code[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.reserved_1; at = at + 1;
  skip
}

/* Trading Status Message off the wire, 20 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = wire[at]; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.market_id_code[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.timestamp[trading_status_message_at] == trading_status_message_written.timestamp[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> assert(trading_status_message_read.symbol[trading_status_message_at] == trading_status_message_written.symbol[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.trading_status == trading_status_message_written.trading_status);
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> assert(trading_status_message_read.market_id_code[trading_status_message_at] == trading_status_message_written.market_id_code[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.reserved_1 == trading_status_message_written.reserved_1);
  skip
}

/* ---- Single Side Update Message: 28 bytes ------------------------------------ */

/* Carries the current inside price and quantity for a single side of a symbol. Included in a spin response so the client can populate the top-of-book state. */
typedef SingleSideUpdateMessage {
  byte timestamp[8];
  byte symbol[6];
  byte side;
  byte price[8];
  byte quantity[4];
  byte reserved_1
};

int single_side_update_message_at;

/* every byte of Single Side Update Message set to one value */
inline fill_single_side_update_message(single_side_update_message_record, single_side_update_message_value) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.timestamp[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 6 -> single_side_update_message_record.symbol[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.side = single_side_update_message_value;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.price[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.quantity[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.reserved_1 = single_side_update_message_value;
  skip
}

/* each byte of Single Side Update Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_update_message(single_side_update_message_record, single_side_update_message_base) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.timestamp[single_side_update_message_at] = (single_side_update_message_base + 0 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 6 -> single_side_update_message_record.symbol[single_side_update_message_at] = (single_side_update_message_base + 8 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.side = (single_side_update_message_base + 14 + 1) % 256;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.price[single_side_update_message_at] = (single_side_update_message_base + 15 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.quantity[single_side_update_message_at] = (single_side_update_message_base + 23 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.reserved_1 = (single_side_update_message_base + 27 + 1) % 256;
  skip
}

/* Single Side Update Message to the wire, 28 bytes from where the cursor stands */
inline encode_single_side_update_message(single_side_update_message_record) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> wire[at] = single_side_update_message_record.timestamp[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 6 -> wire[at] = single_side_update_message_record.symbol[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_update_message_record.side; at = at + 1;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> wire[at] = single_side_update_message_record.price[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> wire[at] = single_side_update_message_record.quantity[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_update_message_record.reserved_1; at = at + 1;
  skip
}

/* Single Side Update Message off the wire, 28 bytes from where the cursor stands */
inline decode_single_side_update_message(single_side_update_message_record) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.timestamp[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 6 -> single_side_update_message_record.symbol[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.side = wire[at]; at = at + 1;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.price[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.quantity[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Single Side Update Message is what was written, byte for byte */
inline equal_single_side_update_message(single_side_update_message_read, single_side_update_message_written) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> assert(single_side_update_message_read.timestamp[single_side_update_message_at] == single_side_update_message_written.timestamp[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 6 -> assert(single_side_update_message_read.symbol[single_side_update_message_at] == single_side_update_message_written.symbol[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  assert(single_side_update_message_read.side == single_side_update_message_written.side);
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> assert(single_side_update_message_read.price[single_side_update_message_at] == single_side_update_message_written.price[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> assert(single_side_update_message_read.quantity[single_side_update_message_at] == single_side_update_message_written.quantity[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  assert(single_side_update_message_read.reserved_1 == single_side_update_message_written.reserved_1);
  skip
}

/* ---- Two Side Update Message: 40 bytes --------------------------------------- */

/* Carries the current inside prices and quantities for both sides of a symbol. Included in a spin response so the client can populate the top-of-book state. */
typedef TwoSideUpdateMessage {
  byte timestamp[8];
  byte symbol[6];
  byte bid_price[8];
  byte bid_quantity[4];
  byte reserved_1;
  byte ask_price[8];
  byte ask_quantity[4];
  byte second_reserved_1
};

int two_side_update_message_at;

/* every byte of Two Side Update Message set to one value */
inline fill_two_side_update_message(two_side_update_message_record, two_side_update_message_value) {
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.timestamp[two_side_update_message_at] = two_side_update_message_value; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 6 -> two_side_update_message_record.symbol[two_side_update_message_at] = two_side_update_message_value; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.bid_price[two_side_update_message_at] = two_side_update_message_value; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> two_side_update_message_record.bid_quantity[two_side_update_message_at] = two_side_update_message_value; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_record.reserved_1 = two_side_update_message_value;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.ask_price[two_side_update_message_at] = two_side_update_message_value; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> two_side_update_message_record.ask_quantity[two_side_update_message_at] = two_side_update_message_value; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_record.second_reserved_1 = two_side_update_message_value;
  skip
}

/* each byte of Two Side Update Message set to where it lies, so a field read out of place says so */
inline ramp_two_side_update_message(two_side_update_message_record, two_side_update_message_base) {
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.timestamp[two_side_update_message_at] = (two_side_update_message_base + 0 + two_side_update_message_at + 1) % 256; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 6 -> two_side_update_message_record.symbol[two_side_update_message_at] = (two_side_update_message_base + 8 + two_side_update_message_at + 1) % 256; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.bid_price[two_side_update_message_at] = (two_side_update_message_base + 14 + two_side_update_message_at + 1) % 256; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> two_side_update_message_record.bid_quantity[two_side_update_message_at] = (two_side_update_message_base + 22 + two_side_update_message_at + 1) % 256; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_record.reserved_1 = (two_side_update_message_base + 26 + 1) % 256;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.ask_price[two_side_update_message_at] = (two_side_update_message_base + 27 + two_side_update_message_at + 1) % 256; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> two_side_update_message_record.ask_quantity[two_side_update_message_at] = (two_side_update_message_base + 35 + two_side_update_message_at + 1) % 256; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_record.second_reserved_1 = (two_side_update_message_base + 39 + 1) % 256;
  skip
}

/* Two Side Update Message to the wire, 40 bytes from where the cursor stands */
inline encode_two_side_update_message(two_side_update_message_record) {
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> wire[at] = two_side_update_message_record.timestamp[two_side_update_message_at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 6 -> wire[at] = two_side_update_message_record.symbol[two_side_update_message_at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> wire[at] = two_side_update_message_record.bid_price[two_side_update_message_at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> wire[at] = two_side_update_message_record.bid_quantity[two_side_update_message_at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  wire[at] = two_side_update_message_record.reserved_1; at = at + 1;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> wire[at] = two_side_update_message_record.ask_price[two_side_update_message_at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> wire[at] = two_side_update_message_record.ask_quantity[two_side_update_message_at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  wire[at] = two_side_update_message_record.second_reserved_1; at = at + 1;
  skip
}

/* Two Side Update Message off the wire, 40 bytes from where the cursor stands */
inline decode_two_side_update_message(two_side_update_message_record) {
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.timestamp[two_side_update_message_at] = wire[at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 6 -> two_side_update_message_record.symbol[two_side_update_message_at] = wire[at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.bid_price[two_side_update_message_at] = wire[at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> two_side_update_message_record.bid_quantity[two_side_update_message_at] = wire[at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_record.reserved_1 = wire[at]; at = at + 1;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> two_side_update_message_record.ask_price[two_side_update_message_at] = wire[at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> two_side_update_message_record.ask_quantity[two_side_update_message_at] = wire[at]; at = at + 1; two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_record.second_reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Two Side Update Message is what was written, byte for byte */
inline equal_two_side_update_message(two_side_update_message_read, two_side_update_message_written) {
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> assert(two_side_update_message_read.timestamp[two_side_update_message_at] == two_side_update_message_written.timestamp[two_side_update_message_at]); two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 6 -> assert(two_side_update_message_read.symbol[two_side_update_message_at] == two_side_update_message_written.symbol[two_side_update_message_at]); two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> assert(two_side_update_message_read.bid_price[two_side_update_message_at] == two_side_update_message_written.bid_price[two_side_update_message_at]); two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> assert(two_side_update_message_read.bid_quantity[two_side_update_message_at] == two_side_update_message_written.bid_quantity[two_side_update_message_at]); two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  assert(two_side_update_message_read.reserved_1 == two_side_update_message_written.reserved_1);
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 8 -> assert(two_side_update_message_read.ask_price[two_side_update_message_at] == two_side_update_message_written.ask_price[two_side_update_message_at]); two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  two_side_update_message_at = 0;
  do
  :: two_side_update_message_at < 4 -> assert(two_side_update_message_read.ask_quantity[two_side_update_message_at] == two_side_update_message_written.ask_quantity[two_side_update_message_at]); two_side_update_message_at = two_side_update_message_at + 1
  :: else -> break
  od;
  assert(two_side_update_message_read.second_reserved_1 == two_side_update_message_written.second_reserved_1);
  skip
}

/* ---- Calculated Value Message: 31 bytes -------------------------------------- */

/* Carries the latest calculated market value for a specified symbol. Included in a spin response so the client can populate the latest index, iNAV, or closing price value. */
typedef CalculatedValueMessage {
  byte timestamp[8];
  byte symbol[6];
  byte value_category;
  byte value[8];
  byte value_timestamp[8]
};

int calculated_value_message_at;

/* every byte of Calculated Value Message set to one value */
inline fill_calculated_value_message(calculated_value_message_record, calculated_value_message_value) {
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.timestamp[calculated_value_message_at] = calculated_value_message_value; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 6 -> calculated_value_message_record.symbol[calculated_value_message_at] = calculated_value_message_value; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_record.value_category = calculated_value_message_value;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.value[calculated_value_message_at] = calculated_value_message_value; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.value_timestamp[calculated_value_message_at] = calculated_value_message_value; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Calculated Value Message set to where it lies, so a field read out of place says so */
inline ramp_calculated_value_message(calculated_value_message_record, calculated_value_message_base) {
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.timestamp[calculated_value_message_at] = (calculated_value_message_base + 0 + calculated_value_message_at + 1) % 256; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 6 -> calculated_value_message_record.symbol[calculated_value_message_at] = (calculated_value_message_base + 8 + calculated_value_message_at + 1) % 256; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_record.value_category = (calculated_value_message_base + 14 + 1) % 256;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.value[calculated_value_message_at] = (calculated_value_message_base + 15 + calculated_value_message_at + 1) % 256; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.value_timestamp[calculated_value_message_at] = (calculated_value_message_base + 23 + calculated_value_message_at + 1) % 256; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Calculated Value Message to the wire, 31 bytes from where the cursor stands */
inline encode_calculated_value_message(calculated_value_message_record) {
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> wire[at] = calculated_value_message_record.timestamp[calculated_value_message_at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 6 -> wire[at] = calculated_value_message_record.symbol[calculated_value_message_at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  wire[at] = calculated_value_message_record.value_category; at = at + 1;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> wire[at] = calculated_value_message_record.value[calculated_value_message_at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> wire[at] = calculated_value_message_record.value_timestamp[calculated_value_message_at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Calculated Value Message off the wire, 31 bytes from where the cursor stands */
inline decode_calculated_value_message(calculated_value_message_record) {
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.timestamp[calculated_value_message_at] = wire[at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 6 -> calculated_value_message_record.symbol[calculated_value_message_at] = wire[at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_record.value_category = wire[at]; at = at + 1;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.value[calculated_value_message_at] = wire[at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> calculated_value_message_record.value_timestamp[calculated_value_message_at] = wire[at]; at = at + 1; calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Calculated Value Message is what was written, byte for byte */
inline equal_calculated_value_message(calculated_value_message_read, calculated_value_message_written) {
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> assert(calculated_value_message_read.timestamp[calculated_value_message_at] == calculated_value_message_written.timestamp[calculated_value_message_at]); calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 6 -> assert(calculated_value_message_read.symbol[calculated_value_message_at] == calculated_value_message_written.symbol[calculated_value_message_at]); calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  assert(calculated_value_message_read.value_category == calculated_value_message_written.value_category);
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> assert(calculated_value_message_read.value[calculated_value_message_at] == calculated_value_message_written.value[calculated_value_message_at]); calculated_value_message_at = calculated_value_message_at + 1
  :: else -> break
  od;
  calculated_value_message_at = 0;
  do
  :: calculated_value_message_at < 8 -> assert(calculated_value_message_read.value_timestamp[calculated_value_message_at] == calculated_value_message_written.value_timestamp[calculated_value_message_at]); calculated_value_message_at = calculated_value_message_at + 1
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
    assert(at == 8);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 8);
    equal_packet_header(packet_header_got, packet_header_sent)
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
    assert(at == 2);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 2);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Login Message: encoded, read back, and compared */
proctype check_login_message() {
  LoginMessage login_message_sent;
  LoginMessage login_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_message(login_message_sent, 0)
  :: pattern == 1 -> fill_login_message(login_message_sent, 32)
  :: pattern == 2 -> fill_login_message(login_message_sent, 255)
  :: else -> ramp_login_message(login_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_message(login_message_sent);
    assert(at == 20);
    at = 0;
    decode_login_message(login_message_got);
    assert(at == 20);
    equal_login_message(login_message_got, login_message_sent)
  }
}

/* Login Response Message: encoded, read back, and compared */
proctype check_login_response_message() {
  LoginResponseMessage login_response_message_sent;
  LoginResponseMessage login_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_response_message(login_response_message_sent, 0)
  :: pattern == 1 -> fill_login_response_message(login_response_message_sent, 32)
  :: pattern == 2 -> fill_login_response_message(login_response_message_sent, 255)
  :: else -> ramp_login_response_message(login_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_response_message(login_response_message_sent);
    assert(at == 1);
    at = 0;
    decode_login_response_message(login_response_message_got);
    assert(at == 1);
    equal_login_response_message(login_response_message_got, login_response_message_sent)
  }
}

/* Spin Image Available Message: encoded, read back, and compared */
proctype check_spin_image_available_message() {
  SpinImageAvailableMessage spin_image_available_message_sent;
  SpinImageAvailableMessage spin_image_available_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spin_image_available_message(spin_image_available_message_sent, 0)
  :: pattern == 1 -> fill_spin_image_available_message(spin_image_available_message_sent, 32)
  :: pattern == 2 -> fill_spin_image_available_message(spin_image_available_message_sent, 255)
  :: else -> ramp_spin_image_available_message(spin_image_available_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spin_image_available_message(spin_image_available_message_sent);
    assert(at == 4);
    at = 0;
    decode_spin_image_available_message(spin_image_available_message_got);
    assert(at == 4);
    equal_spin_image_available_message(spin_image_available_message_got, spin_image_available_message_sent)
  }
}

/* Spin Request Message: encoded, read back, and compared */
proctype check_spin_request_message() {
  SpinRequestMessage spin_request_message_sent;
  SpinRequestMessage spin_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spin_request_message(spin_request_message_sent, 0)
  :: pattern == 1 -> fill_spin_request_message(spin_request_message_sent, 32)
  :: pattern == 2 -> fill_spin_request_message(spin_request_message_sent, 255)
  :: else -> ramp_spin_request_message(spin_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spin_request_message(spin_request_message_sent);
    assert(at == 4);
    at = 0;
    decode_spin_request_message(spin_request_message_got);
    assert(at == 4);
    equal_spin_request_message(spin_request_message_got, spin_request_message_sent)
  }
}

/* Spin Response Message: encoded, read back, and compared */
proctype check_spin_response_message() {
  SpinResponseMessage spin_response_message_sent;
  SpinResponseMessage spin_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spin_response_message(spin_response_message_sent, 0)
  :: pattern == 1 -> fill_spin_response_message(spin_response_message_sent, 32)
  :: pattern == 2 -> fill_spin_response_message(spin_response_message_sent, 255)
  :: else -> ramp_spin_response_message(spin_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spin_response_message(spin_response_message_sent);
    assert(at == 9);
    at = 0;
    decode_spin_response_message(spin_response_message_got);
    assert(at == 9);
    equal_spin_response_message(spin_response_message_got, spin_response_message_sent)
  }
}

/* Spin Finished Message: encoded, read back, and compared */
proctype check_spin_finished_message() {
  SpinFinishedMessage spin_finished_message_sent;
  SpinFinishedMessage spin_finished_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spin_finished_message(spin_finished_message_sent, 0)
  :: pattern == 1 -> fill_spin_finished_message(spin_finished_message_sent, 32)
  :: pattern == 2 -> fill_spin_finished_message(spin_finished_message_sent, 255)
  :: else -> ramp_spin_finished_message(spin_finished_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spin_finished_message(spin_finished_message_sent);
    assert(at == 4);
    at = 0;
    decode_spin_finished_message(spin_finished_message_got);
    assert(at == 4);
    equal_spin_finished_message(spin_finished_message_got, spin_finished_message_sent)
  }
}

/* Trading Status Message: encoded, read back, and compared */
proctype check_trading_status_message() {
  TradingStatusMessage trading_status_message_sent;
  TradingStatusMessage trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_status_message(trading_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_status_message(trading_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_status_message(trading_status_message_sent, 255)
  :: else -> ramp_trading_status_message(trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_status_message(trading_status_message_sent);
    assert(at == 20);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 20);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
  }
}

/* Single Side Update Message: encoded, read back, and compared */
proctype check_single_side_update_message() {
  SingleSideUpdateMessage single_side_update_message_sent;
  SingleSideUpdateMessage single_side_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_update_message(single_side_update_message_sent, 0)
  :: pattern == 1 -> fill_single_side_update_message(single_side_update_message_sent, 32)
  :: pattern == 2 -> fill_single_side_update_message(single_side_update_message_sent, 255)
  :: else -> ramp_single_side_update_message(single_side_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_update_message(single_side_update_message_sent);
    assert(at == 28);
    at = 0;
    decode_single_side_update_message(single_side_update_message_got);
    assert(at == 28);
    equal_single_side_update_message(single_side_update_message_got, single_side_update_message_sent)
  }
}

/* Two Side Update Message: encoded, read back, and compared */
proctype check_two_side_update_message() {
  TwoSideUpdateMessage two_side_update_message_sent;
  TwoSideUpdateMessage two_side_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_two_side_update_message(two_side_update_message_sent, 0)
  :: pattern == 1 -> fill_two_side_update_message(two_side_update_message_sent, 32)
  :: pattern == 2 -> fill_two_side_update_message(two_side_update_message_sent, 255)
  :: else -> ramp_two_side_update_message(two_side_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_two_side_update_message(two_side_update_message_sent);
    assert(at == 40);
    at = 0;
    decode_two_side_update_message(two_side_update_message_got);
    assert(at == 40);
    equal_two_side_update_message(two_side_update_message_got, two_side_update_message_sent)
  }
}

/* Calculated Value Message: encoded, read back, and compared */
proctype check_calculated_value_message() {
  CalculatedValueMessage calculated_value_message_sent;
  CalculatedValueMessage calculated_value_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_calculated_value_message(calculated_value_message_sent, 0)
  :: pattern == 1 -> fill_calculated_value_message(calculated_value_message_sent, 32)
  :: pattern == 2 -> fill_calculated_value_message(calculated_value_message_sent, 255)
  :: else -> ramp_calculated_value_message(calculated_value_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_calculated_value_message(calculated_value_message_sent);
    assert(at == 31);
    at = 0;
    decode_calculated_value_message(calculated_value_message_got);
    assert(at == 31);
    equal_calculated_value_message(calculated_value_message_got, calculated_value_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_login_message()
  :: run check_login_response_message()
  :: run check_spin_image_available_message()
  :: run check_spin_request_message()
  :: run check_spin_response_message()
  :: run check_spin_finished_message()
  :: run check_trading_status_message()
  :: run check_single_side_update_message()
  :: run check_two_side_update_message()
  :: run check_calculated_value_message()
  fi
}
