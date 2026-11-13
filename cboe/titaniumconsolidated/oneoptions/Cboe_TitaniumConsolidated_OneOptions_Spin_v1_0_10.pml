/*
 * Chicago Board Options Exchange One Options
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
#define WIRE 36

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

/* The Login message is the first message sent to the Spin Server by a user's process after the connection to the Spin Server is established. Failure to login before sending any other message type will result in the connection being dropped by the Spin Server. The format of the Login message for the Spin Server is identical to that of the GRP. */
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

/* The Login Response message is sent by the Spin Server to a user's process in response to a Login message. The status field is used to reflect an accepted login or the reason the session was not accepted. If login fails, the connection will be dropped after the Login Response message is sent. */
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

/* The Spin Image Available message is sent once per second and indicates through what sequence number a spin is available. */
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

/* The Spin Request message is used by a user's process to request transmission of a spin of the unit's order book. */
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

/* The Spin Response message is sent in response to a user's Spin Request message indicating whether a spin will be sent. */
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

/* The Spin Finished message is sent to indicate that all messages for the spin requested have been sent. A Spin Finished message is only sent if a Spin Request message was not rejected. */
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

/* ---- Instrument Definition Request Message: 4 bytes -------------------------- */

/* The Instrument Definition Request message is used by a user's process to request transmission of this unit's Symbol Mappings. */
typedef InstrumentDefinitionRequestMessage {
  byte sequence[4]
};

int instrument_definition_request_message_at;

/* every byte of Instrument Definition Request Message set to one value */
inline fill_instrument_definition_request_message(instrument_definition_request_message_record, instrument_definition_request_message_value) {
  instrument_definition_request_message_at = 0;
  do
  :: instrument_definition_request_message_at < 4 -> instrument_definition_request_message_record.sequence[instrument_definition_request_message_at] = instrument_definition_request_message_value; instrument_definition_request_message_at = instrument_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Definition Request Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_definition_request_message(instrument_definition_request_message_record, instrument_definition_request_message_base) {
  instrument_definition_request_message_at = 0;
  do
  :: instrument_definition_request_message_at < 4 -> instrument_definition_request_message_record.sequence[instrument_definition_request_message_at] = (instrument_definition_request_message_base + 0 + instrument_definition_request_message_at + 1) % 256; instrument_definition_request_message_at = instrument_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Definition Request Message to the wire, 4 bytes from where the cursor stands */
inline encode_instrument_definition_request_message(instrument_definition_request_message_record) {
  instrument_definition_request_message_at = 0;
  do
  :: instrument_definition_request_message_at < 4 -> wire[at] = instrument_definition_request_message_record.sequence[instrument_definition_request_message_at]; at = at + 1; instrument_definition_request_message_at = instrument_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Definition Request Message off the wire, 4 bytes from where the cursor stands */
inline decode_instrument_definition_request_message(instrument_definition_request_message_record) {
  instrument_definition_request_message_at = 0;
  do
  :: instrument_definition_request_message_at < 4 -> instrument_definition_request_message_record.sequence[instrument_definition_request_message_at] = wire[at]; at = at + 1; instrument_definition_request_message_at = instrument_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Definition Request Message is what was written, byte for byte */
inline equal_instrument_definition_request_message(instrument_definition_request_message_read, instrument_definition_request_message_written) {
  instrument_definition_request_message_at = 0;
  do
  :: instrument_definition_request_message_at < 4 -> assert(instrument_definition_request_message_read.sequence[instrument_definition_request_message_at] == instrument_definition_request_message_written.sequence[instrument_definition_request_message_at]); instrument_definition_request_message_at = instrument_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Definition Response Message: 9 bytes ------------------------- */

/* The Instrument Definition Response message is sent in response to a user's Instrument Definition Request message indicating whether a spin will be sent. */
typedef InstrumentDefinitionResponseMessage {
  byte sequence[4];
  byte instrument_count[4];
  byte instrument_definition_response_status
};

int instrument_definition_response_message_at;

/* every byte of Instrument Definition Response Message set to one value */
inline fill_instrument_definition_response_message(instrument_definition_response_message_record, instrument_definition_response_message_value) {
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> instrument_definition_response_message_record.sequence[instrument_definition_response_message_at] = instrument_definition_response_message_value; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> instrument_definition_response_message_record.instrument_count[instrument_definition_response_message_at] = instrument_definition_response_message_value; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_record.instrument_definition_response_status = instrument_definition_response_message_value;
  skip
}

/* each byte of Instrument Definition Response Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_definition_response_message(instrument_definition_response_message_record, instrument_definition_response_message_base) {
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> instrument_definition_response_message_record.sequence[instrument_definition_response_message_at] = (instrument_definition_response_message_base + 0 + instrument_definition_response_message_at + 1) % 256; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> instrument_definition_response_message_record.instrument_count[instrument_definition_response_message_at] = (instrument_definition_response_message_base + 4 + instrument_definition_response_message_at + 1) % 256; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_record.instrument_definition_response_status = (instrument_definition_response_message_base + 8 + 1) % 256;
  skip
}

/* Instrument Definition Response Message to the wire, 9 bytes from where the cursor stands */
inline encode_instrument_definition_response_message(instrument_definition_response_message_record) {
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> wire[at] = instrument_definition_response_message_record.sequence[instrument_definition_response_message_at]; at = at + 1; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> wire[at] = instrument_definition_response_message_record.instrument_count[instrument_definition_response_message_at]; at = at + 1; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_definition_response_message_record.instrument_definition_response_status; at = at + 1;
  skip
}

/* Instrument Definition Response Message off the wire, 9 bytes from where the cursor stands */
inline decode_instrument_definition_response_message(instrument_definition_response_message_record) {
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> instrument_definition_response_message_record.sequence[instrument_definition_response_message_at] = wire[at]; at = at + 1; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> instrument_definition_response_message_record.instrument_count[instrument_definition_response_message_at] = wire[at]; at = at + 1; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_record.instrument_definition_response_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Instrument Definition Response Message is what was written, byte for byte */
inline equal_instrument_definition_response_message(instrument_definition_response_message_read, instrument_definition_response_message_written) {
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> assert(instrument_definition_response_message_read.sequence[instrument_definition_response_message_at] == instrument_definition_response_message_written.sequence[instrument_definition_response_message_at]); instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> assert(instrument_definition_response_message_read.instrument_count[instrument_definition_response_message_at] == instrument_definition_response_message_written.instrument_count[instrument_definition_response_message_at]); instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  assert(instrument_definition_response_message_read.instrument_definition_response_status == instrument_definition_response_message_written.instrument_definition_response_status);
  skip
}

/* ---- Symbol Mapping Message: 36 bytes ---------------------------------------- */

/* Symbol Mapping messages are sent in response to an Accepted Instrument Definition Request message. */
typedef SymbolMappingMessage {
  byte feed_symbol[6];
  byte osi_symbol[21];
  byte symbol_condition;
  byte underlying[8]
};

int symbol_mapping_message_at;

/* every byte of Symbol Mapping Message set to one value */
inline fill_symbol_mapping_message(symbol_mapping_message_record, symbol_mapping_message_value) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 6 -> symbol_mapping_message_record.feed_symbol[symbol_mapping_message_at] = symbol_mapping_message_value; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 21 -> symbol_mapping_message_record.osi_symbol[symbol_mapping_message_at] = symbol_mapping_message_value; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.symbol_condition = symbol_mapping_message_value;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.underlying[symbol_mapping_message_at] = symbol_mapping_message_value; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_mapping_message(symbol_mapping_message_record, symbol_mapping_message_base) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 6 -> symbol_mapping_message_record.feed_symbol[symbol_mapping_message_at] = (symbol_mapping_message_base + 0 + symbol_mapping_message_at + 1) % 256; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 21 -> symbol_mapping_message_record.osi_symbol[symbol_mapping_message_at] = (symbol_mapping_message_base + 6 + symbol_mapping_message_at + 1) % 256; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.symbol_condition = (symbol_mapping_message_base + 27 + 1) % 256;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.underlying[symbol_mapping_message_at] = (symbol_mapping_message_base + 28 + symbol_mapping_message_at + 1) % 256; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Mapping Message to the wire, 36 bytes from where the cursor stands */
inline encode_symbol_mapping_message(symbol_mapping_message_record) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 6 -> wire[at] = symbol_mapping_message_record.feed_symbol[symbol_mapping_message_at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 21 -> wire[at] = symbol_mapping_message_record.osi_symbol[symbol_mapping_message_at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_mapping_message_record.symbol_condition; at = at + 1;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> wire[at] = symbol_mapping_message_record.underlying[symbol_mapping_message_at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Mapping Message off the wire, 36 bytes from where the cursor stands */
inline decode_symbol_mapping_message(symbol_mapping_message_record) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 6 -> symbol_mapping_message_record.feed_symbol[symbol_mapping_message_at] = wire[at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 21 -> symbol_mapping_message_record.osi_symbol[symbol_mapping_message_at] = wire[at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.symbol_condition = wire[at]; at = at + 1;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.underlying[symbol_mapping_message_at] = wire[at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Mapping Message is what was written, byte for byte */
inline equal_symbol_mapping_message(symbol_mapping_message_read, symbol_mapping_message_written) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 6 -> assert(symbol_mapping_message_read.feed_symbol[symbol_mapping_message_at] == symbol_mapping_message_written.feed_symbol[symbol_mapping_message_at]); symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 21 -> assert(symbol_mapping_message_read.osi_symbol[symbol_mapping_message_at] == symbol_mapping_message_written.osi_symbol[symbol_mapping_message_at]); symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  assert(symbol_mapping_message_read.symbol_condition == symbol_mapping_message_written.symbol_condition);
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> assert(symbol_mapping_message_read.underlying[symbol_mapping_message_at] == symbol_mapping_message_written.underlying[symbol_mapping_message_at]); symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Replay Request Message: 4 bytes ----------------------------------- */

/* The Trade Replay Request message is used by a user's process to request transmission of all Trade and Trade Break messages previously emitted by this unit prior to receiving the user's Trade Replay Request message. */
typedef TradeReplayRequestMessage {
  byte sequence[4]
};

int trade_replay_request_message_at;

/* every byte of Trade Replay Request Message set to one value */
inline fill_trade_replay_request_message(trade_replay_request_message_record, trade_replay_request_message_value) {
  trade_replay_request_message_at = 0;
  do
  :: trade_replay_request_message_at < 4 -> trade_replay_request_message_record.sequence[trade_replay_request_message_at] = trade_replay_request_message_value; trade_replay_request_message_at = trade_replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Replay Request Message set to where it lies, so a field read out of place says so */
inline ramp_trade_replay_request_message(trade_replay_request_message_record, trade_replay_request_message_base) {
  trade_replay_request_message_at = 0;
  do
  :: trade_replay_request_message_at < 4 -> trade_replay_request_message_record.sequence[trade_replay_request_message_at] = (trade_replay_request_message_base + 0 + trade_replay_request_message_at + 1) % 256; trade_replay_request_message_at = trade_replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Replay Request Message to the wire, 4 bytes from where the cursor stands */
inline encode_trade_replay_request_message(trade_replay_request_message_record) {
  trade_replay_request_message_at = 0;
  do
  :: trade_replay_request_message_at < 4 -> wire[at] = trade_replay_request_message_record.sequence[trade_replay_request_message_at]; at = at + 1; trade_replay_request_message_at = trade_replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Replay Request Message off the wire, 4 bytes from where the cursor stands */
inline decode_trade_replay_request_message(trade_replay_request_message_record) {
  trade_replay_request_message_at = 0;
  do
  :: trade_replay_request_message_at < 4 -> trade_replay_request_message_record.sequence[trade_replay_request_message_at] = wire[at]; at = at + 1; trade_replay_request_message_at = trade_replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Replay Request Message is what was written, byte for byte */
inline equal_trade_replay_request_message(trade_replay_request_message_read, trade_replay_request_message_written) {
  trade_replay_request_message_at = 0;
  do
  :: trade_replay_request_message_at < 4 -> assert(trade_replay_request_message_read.sequence[trade_replay_request_message_at] == trade_replay_request_message_written.sequence[trade_replay_request_message_at]); trade_replay_request_message_at = trade_replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Replay Response Message: 13 bytes --------------------------------- */

/* The Trade Replay Response message is sent in response to a user's Trade Replay Request message indicating whether a spin will be sent. */
typedef TradeReplayResponseMessage {
  byte sequence[4];
  byte trade_replay_message_count[8];
  byte trade_replay_response_status
};

int trade_replay_response_message_at;

/* every byte of Trade Replay Response Message set to one value */
inline fill_trade_replay_response_message(trade_replay_response_message_record, trade_replay_response_message_value) {
  trade_replay_response_message_at = 0;
  do
  :: trade_replay_response_message_at < 4 -> trade_replay_response_message_record.sequence[trade_replay_response_message_at] = trade_replay_response_message_value; trade_replay_response_message_at = trade_replay_response_message_at + 1
  :: else -> break
  od;
  trade_replay_response_message_at = 0;
  do
  :: trade_replay_response_message_at < 8 -> trade_replay_response_message_record.trade_replay_message_count[trade_replay_response_message_at] = trade_replay_response_message_value; trade_replay_response_message_at = trade_replay_response_message_at + 1
  :: else -> break
  od;
  trade_replay_response_message_record.trade_replay_response_status = trade_replay_response_message_value;
  skip
}

/* each byte of Trade Replay Response Message set to where it lies, so a field read out of place says so */
inline ramp_trade_replay_response_message(trade_replay_response_message_record, trade_replay_response_message_base) {
  trade_replay_response_message_at = 0;
  do
  :: trade_replay_response_message_at < 4 -> trade_replay_response_message_record.sequence[trade_replay_response_message_at] = (trade_replay_response_message_base + 0 + trade_replay_response_message_at + 1) % 256; trade_replay_response_message_at = trade_replay_response_message_at + 1
  :: else -> break
  od;
  trade_replay_response_message_at = 0;
  do
  :: trade_replay_response_message_at < 8 -> trade_replay_response_message_record.trade_replay_message_count[trade_replay_response_message_at] = (trade_replay_response_message_base + 4 + trade_replay_response_message_at + 1) % 256; trade_replay_response_message_at = trade_replay_response_message_at + 1
  :: else -> break
  od;
  trade_replay_response_message_record.trade_replay_response_status = (trade_replay_response_message_base + 12 + 1) % 256;
  skip
}

/* Trade Replay Response Message to the wire, 13 bytes from where the cursor stands */
inline encode_trade_replay_response_message(trade_replay_response_message_record) {
  trade_replay_response_message_at = 0;
  do
  :: trade_replay_response_message_at < 4 -> wire[at] = trade_replay_response_message_record.sequence[trade_replay_response_message_at]; at = at + 1; trade_replay_response_message_at = trade_replay_response_message_at + 1
  :: else -> break
  od;
  trade_replay_response_message_at = 0;
  do
  :: trade_replay_response_message_at < 8 -> wire[at] = trade_replay_response_message_record.trade_replay_message_count[trade_replay_response_message_at]; at = at + 1; trade_replay_response_message_at = trade_replay_response_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_replay_response_message_record.trade_replay_response_status; at = at + 1;
  skip
}

/* Trade Replay Response Message off the wire, 13 bytes from where the cursor stands */
inline decode_trade_replay_response_message(trade_replay_response_message_record) {
  trade_replay_response_message_at = 0;
  do
  :: trade_replay_response_message_at < 4 -> trade_replay_response_message_record.sequence[trade_replay_response_message_at] = wire[at]; at = at + 1; trade_replay_response_message_at = trade_replay_response_message_at + 1
  :: else -> break
  od;
  trade_replay_response_message_at = 0;
  do
  :: trade_replay_response_message_at < 8 -> trade_replay_response_message_record.trade_replay_message_count[trade_replay_response_message_at] = wire[at]; at = at + 1; trade_replay_response_message_at = trade_replay_response_message_at + 1
  :: else -> break
  od;
  trade_replay_response_message_record.trade_replay_response_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Replay Response Message is what was written, byte for byte */
inline equal_trade_replay_response_message(trade_replay_response_message_read, trade_replay_response_message_written) {
  trade_replay_response_message_at = 0;
  do
  :: trade_replay_response_message_at < 4 -> assert(trade_replay_response_message_read.sequence[trade_replay_response_message_at] == trade_replay_response_message_written.sequence[trade_replay_response_message_at]); trade_replay_response_message_at = trade_replay_response_message_at + 1
  :: else -> break
  od;
  trade_replay_response_message_at = 0;
  do
  :: trade_replay_response_message_at < 8 -> assert(trade_replay_response_message_read.trade_replay_message_count[trade_replay_response_message_at] == trade_replay_response_message_written.trade_replay_message_count[trade_replay_response_message_at]); trade_replay_response_message_at = trade_replay_response_message_at + 1
  :: else -> break
  od;
  assert(trade_replay_response_message_read.trade_replay_response_status == trade_replay_response_message_written.trade_replay_response_status);
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

/* Instrument Definition Request Message: encoded, read back, and compared */
proctype check_instrument_definition_request_message() {
  InstrumentDefinitionRequestMessage instrument_definition_request_message_sent;
  InstrumentDefinitionRequestMessage instrument_definition_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_definition_request_message(instrument_definition_request_message_sent, 0)
  :: pattern == 1 -> fill_instrument_definition_request_message(instrument_definition_request_message_sent, 32)
  :: pattern == 2 -> fill_instrument_definition_request_message(instrument_definition_request_message_sent, 255)
  :: else -> ramp_instrument_definition_request_message(instrument_definition_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_definition_request_message(instrument_definition_request_message_sent);
    assert(at == 4);
    at = 0;
    decode_instrument_definition_request_message(instrument_definition_request_message_got);
    assert(at == 4);
    equal_instrument_definition_request_message(instrument_definition_request_message_got, instrument_definition_request_message_sent)
  }
}

/* Instrument Definition Response Message: encoded, read back, and compared */
proctype check_instrument_definition_response_message() {
  InstrumentDefinitionResponseMessage instrument_definition_response_message_sent;
  InstrumentDefinitionResponseMessage instrument_definition_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_definition_response_message(instrument_definition_response_message_sent, 0)
  :: pattern == 1 -> fill_instrument_definition_response_message(instrument_definition_response_message_sent, 32)
  :: pattern == 2 -> fill_instrument_definition_response_message(instrument_definition_response_message_sent, 255)
  :: else -> ramp_instrument_definition_response_message(instrument_definition_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_definition_response_message(instrument_definition_response_message_sent);
    assert(at == 9);
    at = 0;
    decode_instrument_definition_response_message(instrument_definition_response_message_got);
    assert(at == 9);
    equal_instrument_definition_response_message(instrument_definition_response_message_got, instrument_definition_response_message_sent)
  }
}

/* Symbol Mapping Message: encoded, read back, and compared */
proctype check_symbol_mapping_message() {
  SymbolMappingMessage symbol_mapping_message_sent;
  SymbolMappingMessage symbol_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_mapping_message(symbol_mapping_message_sent, 0)
  :: pattern == 1 -> fill_symbol_mapping_message(symbol_mapping_message_sent, 32)
  :: pattern == 2 -> fill_symbol_mapping_message(symbol_mapping_message_sent, 255)
  :: else -> ramp_symbol_mapping_message(symbol_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_mapping_message(symbol_mapping_message_sent);
    assert(at == 36);
    at = 0;
    decode_symbol_mapping_message(symbol_mapping_message_got);
    assert(at == 36);
    equal_symbol_mapping_message(symbol_mapping_message_got, symbol_mapping_message_sent)
  }
}

/* Trade Replay Request Message: encoded, read back, and compared */
proctype check_trade_replay_request_message() {
  TradeReplayRequestMessage trade_replay_request_message_sent;
  TradeReplayRequestMessage trade_replay_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_replay_request_message(trade_replay_request_message_sent, 0)
  :: pattern == 1 -> fill_trade_replay_request_message(trade_replay_request_message_sent, 32)
  :: pattern == 2 -> fill_trade_replay_request_message(trade_replay_request_message_sent, 255)
  :: else -> ramp_trade_replay_request_message(trade_replay_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_replay_request_message(trade_replay_request_message_sent);
    assert(at == 4);
    at = 0;
    decode_trade_replay_request_message(trade_replay_request_message_got);
    assert(at == 4);
    equal_trade_replay_request_message(trade_replay_request_message_got, trade_replay_request_message_sent)
  }
}

/* Trade Replay Response Message: encoded, read back, and compared */
proctype check_trade_replay_response_message() {
  TradeReplayResponseMessage trade_replay_response_message_sent;
  TradeReplayResponseMessage trade_replay_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_replay_response_message(trade_replay_response_message_sent, 0)
  :: pattern == 1 -> fill_trade_replay_response_message(trade_replay_response_message_sent, 32)
  :: pattern == 2 -> fill_trade_replay_response_message(trade_replay_response_message_sent, 255)
  :: else -> ramp_trade_replay_response_message(trade_replay_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_replay_response_message(trade_replay_response_message_sent);
    assert(at == 13);
    at = 0;
    decode_trade_replay_response_message(trade_replay_response_message_got);
    assert(at == 13);
    equal_trade_replay_response_message(trade_replay_response_message_got, trade_replay_response_message_sent)
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
  :: run check_instrument_definition_request_message()
  :: run check_instrument_definition_response_message()
  :: run check_symbol_mapping_message()
  :: run check_trade_replay_request_message()
  :: run check_trade_replay_response_message()
  fi
}
