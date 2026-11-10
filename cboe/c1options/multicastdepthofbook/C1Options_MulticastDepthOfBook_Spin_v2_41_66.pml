/*
 * Chicago Board Options Exchange Multicast Depth Of Book
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
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 62

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

/* The Spin Request message is used by a user's process to request transmission of a spin of the unit's order book. See Options Specific Symbol Processing for more complete details regarding Sequence specification as well as buffering requirements. */
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

/* The Spin Finished message is sent to indicate that all messages for the spin requested have been sent. A Spin Finished message is only sent if a Spin Request message was not rejected. Upon receipt of a Spin Finished message, any buffered multicast messages should be applied to the member's copy of the book to make it current. */
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

/* The Instrument Definition Request message is used by a user's process to request transmission of this unit's Symbol Mappings and Complex Instrument Definitions. Refer to Options Specific Symbol Processing for more complete details regarding Sequence specification as well as buffering requirements. */
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

/* ---- Time Message: 8 bytes --------------------------------------------------- */

/* A Time message is immediately generated and sent when there is a PITCH event for a given clock second. If there is no PITCH event for a given clock second, then no Time message is sent for that second. All subsequent time offset fields for the same unit will use the new Time value as the base until another Time message is received for the same unit. The Time field is the number of seconds relative to midnight Eastern Time. */
typedef TimeMessage {
  byte time[4];
  byte epoch_time[4]
};

int time_message_at;

/* every byte of Time Message set to one value */
inline fill_time_message(time_message_record, time_message_value) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time[time_message_at] = time_message_value; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.epoch_time[time_message_at] = time_message_value; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Message set to where it lies, so a field read out of place says so */
inline ramp_time_message(time_message_record, time_message_base) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time[time_message_at] = (time_message_base + 0 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.epoch_time[time_message_at] = (time_message_base + 4 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message to the wire, 8 bytes from where the cursor stands */
inline encode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> wire[at] = time_message_record.time[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> wire[at] = time_message_record.epoch_time[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message off the wire, 8 bytes from where the cursor stands */
inline decode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.epoch_time[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Message is what was written, byte for byte */
inline equal_time_message(time_message_read, time_message_written) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> assert(time_message_read.time[time_message_at] == time_message_written.time[time_message_at]); time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> assert(time_message_read.epoch_time[time_message_at] == time_message_written.epoch_time[time_message_at]); time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Unit Clear Message: 4 bytes --------------------------------------------- */

/* The Unit Clear message instructs feed recipients to clear all orders for the Cboe book in the unit specified in the Sequenced Unit Header. This message will be sent at startup each day. It would also be distributed in certain recovery events such as a data center fail-over. */
typedef UnitClearMessage {
  byte time_offset[4]
};

int unit_clear_message_at;

/* every byte of Unit Clear Message set to one value */
inline fill_unit_clear_message(unit_clear_message_record, unit_clear_message_value) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.time_offset[unit_clear_message_at] = unit_clear_message_value; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Unit Clear Message set to where it lies, so a field read out of place says so */
inline ramp_unit_clear_message(unit_clear_message_record, unit_clear_message_base) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.time_offset[unit_clear_message_at] = (unit_clear_message_base + 0 + unit_clear_message_at + 1) % 256; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Clear Message to the wire, 4 bytes from where the cursor stands */
inline encode_unit_clear_message(unit_clear_message_record) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> wire[at] = unit_clear_message_record.time_offset[unit_clear_message_at]; at = at + 1; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Clear Message off the wire, 4 bytes from where the cursor stands */
inline decode_unit_clear_message(unit_clear_message_record) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.time_offset[unit_clear_message_at] = wire[at]; at = at + 1; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Unit Clear Message is what was written, byte for byte */
inline equal_unit_clear_message(unit_clear_message_read, unit_clear_message_written) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> assert(unit_clear_message_read.time_offset[unit_clear_message_at] == unit_clear_message_written.time_offset[unit_clear_message_at]); unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transaction Begin Message: 4 bytes -------------------------------------- */

/* The Transaction Begin message indicates any subsequent messages, up to the accompanying Transaction End message, are all part of the same transaction block. */
typedef TransactionBeginMessage {
  byte time_offset[4]
};

int transaction_begin_message_at;

/* every byte of Transaction Begin Message set to one value */
inline fill_transaction_begin_message(transaction_begin_message_record, transaction_begin_message_value) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> transaction_begin_message_record.time_offset[transaction_begin_message_at] = transaction_begin_message_value; transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transaction Begin Message set to where it lies, so a field read out of place says so */
inline ramp_transaction_begin_message(transaction_begin_message_record, transaction_begin_message_base) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> transaction_begin_message_record.time_offset[transaction_begin_message_at] = (transaction_begin_message_base + 0 + transaction_begin_message_at + 1) % 256; transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Begin Message to the wire, 4 bytes from where the cursor stands */
inline encode_transaction_begin_message(transaction_begin_message_record) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> wire[at] = transaction_begin_message_record.time_offset[transaction_begin_message_at]; at = at + 1; transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Begin Message off the wire, 4 bytes from where the cursor stands */
inline decode_transaction_begin_message(transaction_begin_message_record) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> transaction_begin_message_record.time_offset[transaction_begin_message_at] = wire[at]; at = at + 1; transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transaction Begin Message is what was written, byte for byte */
inline equal_transaction_begin_message(transaction_begin_message_read, transaction_begin_message_written) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> assert(transaction_begin_message_read.time_offset[transaction_begin_message_at] == transaction_begin_message_written.time_offset[transaction_begin_message_at]); transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transaction End Message: 4 bytes ---------------------------------------- */

/* The Transaction End message indicates that a transaction indicated by a previous Transaction Begin message has completed. */
typedef TransactionEndMessage {
  byte time_offset[4]
};

int transaction_end_message_at;

/* every byte of Transaction End Message set to one value */
inline fill_transaction_end_message(transaction_end_message_record, transaction_end_message_value) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> transaction_end_message_record.time_offset[transaction_end_message_at] = transaction_end_message_value; transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transaction End Message set to where it lies, so a field read out of place says so */
inline ramp_transaction_end_message(transaction_end_message_record, transaction_end_message_base) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> transaction_end_message_record.time_offset[transaction_end_message_at] = (transaction_end_message_base + 0 + transaction_end_message_at + 1) % 256; transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction End Message to the wire, 4 bytes from where the cursor stands */
inline encode_transaction_end_message(transaction_end_message_record) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> wire[at] = transaction_end_message_record.time_offset[transaction_end_message_at]; at = at + 1; transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction End Message off the wire, 4 bytes from where the cursor stands */
inline decode_transaction_end_message(transaction_end_message_record) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> transaction_end_message_record.time_offset[transaction_end_message_at] = wire[at]; at = at + 1; transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transaction End Message is what was written, byte for byte */
inline equal_transaction_end_message(transaction_end_message_read, transaction_end_message_written) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> assert(transaction_end_message_read.time_offset[transaction_end_message_at] == transaction_end_message_written.time_offset[transaction_end_message_at]); transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message: 25 bytes ---------------------------------------- */

/* Order Executed messages are sent when a visible order on the Cboe book is executed in whole or in part. The execution will always be at the displayed price of the resting order. */
typedef OrderExecutedMessage {
  byte time_offset[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte execution_id[8];
  byte trade_condition
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_offset[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_condition = order_executed_message_value;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_offset[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = (order_executed_message_base + 16 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_condition = (order_executed_message_base + 24 + 1) % 256;
  skip
}

/* Order Executed Message to the wire, 25 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.time_offset[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.execution_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.trade_condition; at = at + 1;
  skip
}

/* Order Executed Message off the wire, 25 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_offset[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.time_offset[order_executed_message_at] == order_executed_message_written.time_offset[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_id[order_executed_message_at] == order_executed_message_written.order_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.execution_id[order_executed_message_at] == order_executed_message_written.execution_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.trade_condition == order_executed_message_written.trade_condition);
  skip
}

/* ---- Order Executed At Price Size Message: 37 bytes -------------------------- */

/* Order Executed at Price/Size messages are sent when a visible order on the Cboe book is executed in whole or in part at a different price than the limit price on the original Add Order message or the limit order price in the latest Modify Order message referencing the Order Id. */
typedef OrderExecutedAtPriceSizeMessage {
  byte time_offset[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte remaining_quantity[4];
  byte execution_id[8];
  byte price_long[8];
  byte trade_condition
};

int order_executed_at_price_size_message_at;

/* every byte of Order Executed At Price Size Message set to one value */
inline fill_order_executed_at_price_size_message(order_executed_at_price_size_message_record, order_executed_at_price_size_message_value) {
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.time_offset[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.order_id[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.executed_quantity[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.remaining_quantity[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.execution_id[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.price_long[order_executed_at_price_size_message_at] = order_executed_at_price_size_message_value; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_record.trade_condition = order_executed_at_price_size_message_value;
  skip
}

/* each byte of Order Executed At Price Size Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_at_price_size_message(order_executed_at_price_size_message_record, order_executed_at_price_size_message_base) {
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.time_offset[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 0 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.order_id[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 4 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.executed_quantity[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 12 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.remaining_quantity[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 16 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.execution_id[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 20 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.price_long[order_executed_at_price_size_message_at] = (order_executed_at_price_size_message_base + 28 + order_executed_at_price_size_message_at + 1) % 256; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_record.trade_condition = (order_executed_at_price_size_message_base + 36 + 1) % 256;
  skip
}

/* Order Executed At Price Size Message to the wire, 37 bytes from where the cursor stands */
inline encode_order_executed_at_price_size_message(order_executed_at_price_size_message_record) {
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> wire[at] = order_executed_at_price_size_message_record.time_offset[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> wire[at] = order_executed_at_price_size_message_record.order_id[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> wire[at] = order_executed_at_price_size_message_record.executed_quantity[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> wire[at] = order_executed_at_price_size_message_record.remaining_quantity[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> wire[at] = order_executed_at_price_size_message_record.execution_id[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> wire[at] = order_executed_at_price_size_message_record.price_long[order_executed_at_price_size_message_at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_at_price_size_message_record.trade_condition; at = at + 1;
  skip
}

/* Order Executed At Price Size Message off the wire, 37 bytes from where the cursor stands */
inline decode_order_executed_at_price_size_message(order_executed_at_price_size_message_record) {
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.time_offset[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.order_id[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.executed_quantity[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> order_executed_at_price_size_message_record.remaining_quantity[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.execution_id[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> order_executed_at_price_size_message_record.price_long[order_executed_at_price_size_message_at] = wire[at]; at = at + 1; order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Executed At Price Size Message is what was written, byte for byte */
inline equal_order_executed_at_price_size_message(order_executed_at_price_size_message_read, order_executed_at_price_size_message_written) {
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> assert(order_executed_at_price_size_message_read.time_offset[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.time_offset[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> assert(order_executed_at_price_size_message_read.order_id[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.order_id[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> assert(order_executed_at_price_size_message_read.executed_quantity[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.executed_quantity[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 4 -> assert(order_executed_at_price_size_message_read.remaining_quantity[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.remaining_quantity[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> assert(order_executed_at_price_size_message_read.execution_id[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.execution_id[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_at_price_size_message_at = 0;
  do
  :: order_executed_at_price_size_message_at < 8 -> assert(order_executed_at_price_size_message_read.price_long[order_executed_at_price_size_message_at] == order_executed_at_price_size_message_written.price_long[order_executed_at_price_size_message_at]); order_executed_at_price_size_message_at = order_executed_at_price_size_message_at + 1
  :: else -> break
  od;
  assert(order_executed_at_price_size_message_read.trade_condition == order_executed_at_price_size_message_written.trade_condition);
  skip
}

/* ---- Reduce Size Long Message: 16 bytes -------------------------------------- */

/* Reduce Size messages are sent when a visible order on the Cboe book is partially reduced. */
typedef ReduceSizeLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte canceled_quantity_long[4]
};

int reduce_size_long_message_at;

/* every byte of Reduce Size Long Message set to one value */
inline fill_reduce_size_long_message(reduce_size_long_message_record, reduce_size_long_message_value) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.time_offset[reduce_size_long_message_at] = reduce_size_long_message_value; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> reduce_size_long_message_record.order_id[reduce_size_long_message_at] = reduce_size_long_message_value; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.canceled_quantity_long[reduce_size_long_message_at] = reduce_size_long_message_value; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reduce Size Long Message set to where it lies, so a field read out of place says so */
inline ramp_reduce_size_long_message(reduce_size_long_message_record, reduce_size_long_message_base) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.time_offset[reduce_size_long_message_at] = (reduce_size_long_message_base + 0 + reduce_size_long_message_at + 1) % 256; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> reduce_size_long_message_record.order_id[reduce_size_long_message_at] = (reduce_size_long_message_base + 4 + reduce_size_long_message_at + 1) % 256; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.canceled_quantity_long[reduce_size_long_message_at] = (reduce_size_long_message_base + 12 + reduce_size_long_message_at + 1) % 256; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Long Message to the wire, 16 bytes from where the cursor stands */
inline encode_reduce_size_long_message(reduce_size_long_message_record) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> wire[at] = reduce_size_long_message_record.time_offset[reduce_size_long_message_at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> wire[at] = reduce_size_long_message_record.order_id[reduce_size_long_message_at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> wire[at] = reduce_size_long_message_record.canceled_quantity_long[reduce_size_long_message_at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Long Message off the wire, 16 bytes from where the cursor stands */
inline decode_reduce_size_long_message(reduce_size_long_message_record) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.time_offset[reduce_size_long_message_at] = wire[at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> reduce_size_long_message_record.order_id[reduce_size_long_message_at] = wire[at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.canceled_quantity_long[reduce_size_long_message_at] = wire[at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reduce Size Long Message is what was written, byte for byte */
inline equal_reduce_size_long_message(reduce_size_long_message_read, reduce_size_long_message_written) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> assert(reduce_size_long_message_read.time_offset[reduce_size_long_message_at] == reduce_size_long_message_written.time_offset[reduce_size_long_message_at]); reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> assert(reduce_size_long_message_read.order_id[reduce_size_long_message_at] == reduce_size_long_message_written.order_id[reduce_size_long_message_at]); reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> assert(reduce_size_long_message_read.canceled_quantity_long[reduce_size_long_message_at] == reduce_size_long_message_written.canceled_quantity_long[reduce_size_long_message_at]); reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reduce Size Short Message: 14 bytes ------------------------------------- */

/* Reduce Size messages are sent when a visible order on the Cboe book is partially reduced. The Short variant is used when the canceled quantity can be represented by an unsigned 16-bit integer. */
typedef ReduceSizeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte canceled_quantity_short[2]
};

int reduce_size_short_message_at;

/* every byte of Reduce Size Short Message set to one value */
inline fill_reduce_size_short_message(reduce_size_short_message_record, reduce_size_short_message_value) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> reduce_size_short_message_record.time_offset[reduce_size_short_message_at] = reduce_size_short_message_value; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> reduce_size_short_message_record.order_id[reduce_size_short_message_at] = reduce_size_short_message_value; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.canceled_quantity_short[reduce_size_short_message_at] = reduce_size_short_message_value; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reduce Size Short Message set to where it lies, so a field read out of place says so */
inline ramp_reduce_size_short_message(reduce_size_short_message_record, reduce_size_short_message_base) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> reduce_size_short_message_record.time_offset[reduce_size_short_message_at] = (reduce_size_short_message_base + 0 + reduce_size_short_message_at + 1) % 256; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> reduce_size_short_message_record.order_id[reduce_size_short_message_at] = (reduce_size_short_message_base + 4 + reduce_size_short_message_at + 1) % 256; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.canceled_quantity_short[reduce_size_short_message_at] = (reduce_size_short_message_base + 12 + reduce_size_short_message_at + 1) % 256; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Short Message to the wire, 14 bytes from where the cursor stands */
inline encode_reduce_size_short_message(reduce_size_short_message_record) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> wire[at] = reduce_size_short_message_record.time_offset[reduce_size_short_message_at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> wire[at] = reduce_size_short_message_record.order_id[reduce_size_short_message_at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> wire[at] = reduce_size_short_message_record.canceled_quantity_short[reduce_size_short_message_at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Short Message off the wire, 14 bytes from where the cursor stands */
inline decode_reduce_size_short_message(reduce_size_short_message_record) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> reduce_size_short_message_record.time_offset[reduce_size_short_message_at] = wire[at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> reduce_size_short_message_record.order_id[reduce_size_short_message_at] = wire[at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.canceled_quantity_short[reduce_size_short_message_at] = wire[at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reduce Size Short Message is what was written, byte for byte */
inline equal_reduce_size_short_message(reduce_size_short_message_read, reduce_size_short_message_written) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> assert(reduce_size_short_message_read.time_offset[reduce_size_short_message_at] == reduce_size_short_message_written.time_offset[reduce_size_short_message_at]); reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> assert(reduce_size_short_message_read.order_id[reduce_size_short_message_at] == reduce_size_short_message_written.order_id[reduce_size_short_message_at]); reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> assert(reduce_size_short_message_read.canceled_quantity_short[reduce_size_short_message_at] == reduce_size_short_message_written.canceled_quantity_short[reduce_size_short_message_at]); reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Delete Order Message: 12 bytes ------------------------------------------ */

/* The Delete Order message is sent whenever a booked order is cancelled or leaves the order book. */
typedef DeleteOrderMessage {
  byte time_offset[4];
  byte order_id[8]
};

int delete_order_message_at;

/* every byte of Delete Order Message set to one value */
inline fill_delete_order_message(delete_order_message_record, delete_order_message_value) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.time_offset[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Delete Order Message set to where it lies, so a field read out of place says so */
inline ramp_delete_order_message(delete_order_message_record, delete_order_message_base) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.time_offset[delete_order_message_at] = (delete_order_message_base + 0 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = (delete_order_message_base + 4 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message to the wire, 12 bytes from where the cursor stands */
inline encode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.time_offset[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.order_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message off the wire, 12 bytes from where the cursor stands */
inline decode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.time_offset[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Delete Order Message is what was written, byte for byte */
inline equal_delete_order_message(delete_order_message_read, delete_order_message_written) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.time_offset[delete_order_message_at] == delete_order_message_written.time_offset[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.order_id[delete_order_message_at] == delete_order_message_written.order_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Long Message: 40 bytes -------------------------------------------- */

/* The Trade message provides information about executions of non-displayed orders on the Cboe book and routed executions to other trading centers. */
typedef TradeLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_long[4];
  byte symbol[6];
  byte price_long[8];
  byte execution_id[8];
  byte trade_condition
};

int trade_long_message_at;

/* every byte of Trade Long Message set to one value */
inline fill_trade_long_message(trade_long_message_record, trade_long_message_value) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.time_offset[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.order_id[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.side_indicator = trade_long_message_value;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.quantity_long[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> trade_long_message_record.symbol[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.price_long[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.execution_id[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.trade_condition = trade_long_message_value;
  skip
}

/* each byte of Trade Long Message set to where it lies, so a field read out of place says so */
inline ramp_trade_long_message(trade_long_message_record, trade_long_message_base) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.time_offset[trade_long_message_at] = (trade_long_message_base + 0 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.order_id[trade_long_message_at] = (trade_long_message_base + 4 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.side_indicator = (trade_long_message_base + 12 + 1) % 256;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.quantity_long[trade_long_message_at] = (trade_long_message_base + 13 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> trade_long_message_record.symbol[trade_long_message_at] = (trade_long_message_base + 17 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.price_long[trade_long_message_at] = (trade_long_message_base + 23 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.execution_id[trade_long_message_at] = (trade_long_message_base + 31 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.trade_condition = (trade_long_message_base + 39 + 1) % 256;
  skip
}

/* Trade Long Message to the wire, 40 bytes from where the cursor stands */
inline encode_trade_long_message(trade_long_message_record) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> wire[at] = trade_long_message_record.time_offset[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> wire[at] = trade_long_message_record.order_id[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_long_message_record.side_indicator; at = at + 1;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> wire[at] = trade_long_message_record.quantity_long[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> wire[at] = trade_long_message_record.symbol[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> wire[at] = trade_long_message_record.price_long[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> wire[at] = trade_long_message_record.execution_id[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_long_message_record.trade_condition; at = at + 1;
  skip
}

/* Trade Long Message off the wire, 40 bytes from where the cursor stands */
inline decode_trade_long_message(trade_long_message_record) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.time_offset[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.order_id[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.side_indicator = wire[at]; at = at + 1;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.quantity_long[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> trade_long_message_record.symbol[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.price_long[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.execution_id[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Long Message is what was written, byte for byte */
inline equal_trade_long_message(trade_long_message_read, trade_long_message_written) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> assert(trade_long_message_read.time_offset[trade_long_message_at] == trade_long_message_written.time_offset[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> assert(trade_long_message_read.order_id[trade_long_message_at] == trade_long_message_written.order_id[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  assert(trade_long_message_read.side_indicator == trade_long_message_written.side_indicator);
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> assert(trade_long_message_read.quantity_long[trade_long_message_at] == trade_long_message_written.quantity_long[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> assert(trade_long_message_read.symbol[trade_long_message_at] == trade_long_message_written.symbol[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> assert(trade_long_message_read.price_long[trade_long_message_at] == trade_long_message_written.price_long[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> assert(trade_long_message_read.execution_id[trade_long_message_at] == trade_long_message_written.execution_id[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  assert(trade_long_message_read.trade_condition == trade_long_message_written.trade_condition);
  skip
}

/* ---- Trade Short Message: 32 bytes ------------------------------------------- */

/* The Trade message provides information about executions of non-displayed orders on the Cboe book and routed executions to other trading centers. The Short variant is used when the price can be represented by a Binary Short Price and the quantity by an unsigned 16-bit integer. */
typedef TradeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_short[2];
  byte symbol[6];
  byte price_short[2];
  byte execution_id[8];
  byte trade_condition
};

int trade_short_message_at;

/* every byte of Trade Short Message set to one value */
inline fill_trade_short_message(trade_short_message_record, trade_short_message_value) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> trade_short_message_record.time_offset[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.order_id[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.side_indicator = trade_short_message_value;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.quantity_short[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.symbol[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.price_short[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.execution_id[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.trade_condition = trade_short_message_value;
  skip
}

/* each byte of Trade Short Message set to where it lies, so a field read out of place says so */
inline ramp_trade_short_message(trade_short_message_record, trade_short_message_base) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> trade_short_message_record.time_offset[trade_short_message_at] = (trade_short_message_base + 0 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.order_id[trade_short_message_at] = (trade_short_message_base + 4 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.side_indicator = (trade_short_message_base + 12 + 1) % 256;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.quantity_short[trade_short_message_at] = (trade_short_message_base + 13 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.symbol[trade_short_message_at] = (trade_short_message_base + 15 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.price_short[trade_short_message_at] = (trade_short_message_base + 21 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.execution_id[trade_short_message_at] = (trade_short_message_base + 23 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.trade_condition = (trade_short_message_base + 31 + 1) % 256;
  skip
}

/* Trade Short Message to the wire, 32 bytes from where the cursor stands */
inline encode_trade_short_message(trade_short_message_record) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> wire[at] = trade_short_message_record.time_offset[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> wire[at] = trade_short_message_record.order_id[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_short_message_record.side_indicator; at = at + 1;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> wire[at] = trade_short_message_record.quantity_short[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> wire[at] = trade_short_message_record.symbol[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> wire[at] = trade_short_message_record.price_short[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> wire[at] = trade_short_message_record.execution_id[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_short_message_record.trade_condition; at = at + 1;
  skip
}

/* Trade Short Message off the wire, 32 bytes from where the cursor stands */
inline decode_trade_short_message(trade_short_message_record) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> trade_short_message_record.time_offset[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.order_id[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.side_indicator = wire[at]; at = at + 1;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.quantity_short[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.symbol[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.price_short[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.execution_id[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Short Message is what was written, byte for byte */
inline equal_trade_short_message(trade_short_message_read, trade_short_message_written) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> assert(trade_short_message_read.time_offset[trade_short_message_at] == trade_short_message_written.time_offset[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> assert(trade_short_message_read.order_id[trade_short_message_at] == trade_short_message_written.order_id[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  assert(trade_short_message_read.side_indicator == trade_short_message_written.side_indicator);
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> assert(trade_short_message_read.quantity_short[trade_short_message_at] == trade_short_message_written.quantity_short[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> assert(trade_short_message_read.symbol[trade_short_message_at] == trade_short_message_written.symbol[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> assert(trade_short_message_read.price_short[trade_short_message_at] == trade_short_message_written.price_short[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> assert(trade_short_message_read.execution_id[trade_short_message_at] == trade_short_message_written.execution_id[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  assert(trade_short_message_read.trade_condition == trade_short_message_written.trade_condition);
  skip
}

/* ---- Trade Expanded Message: 42 bytes ---------------------------------------- */

/* The Trade message provides information about executions of non-displayed orders on the Cboe book and routed executions to other trading centers. The Expanded variant accommodates larger symbol sizes possible through the ISRA plan. */
typedef TradeExpandedMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_long[4];
  byte expanded_symbol[8];
  byte price_long[8];
  byte execution_id[8];
  byte trade_condition
};

int trade_expanded_message_at;

/* every byte of Trade Expanded Message set to one value */
inline fill_trade_expanded_message(trade_expanded_message_record, trade_expanded_message_value) {
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 4 -> trade_expanded_message_record.time_offset[trade_expanded_message_at] = trade_expanded_message_value; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> trade_expanded_message_record.order_id[trade_expanded_message_at] = trade_expanded_message_value; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_record.side_indicator = trade_expanded_message_value;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 4 -> trade_expanded_message_record.quantity_long[trade_expanded_message_at] = trade_expanded_message_value; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> trade_expanded_message_record.expanded_symbol[trade_expanded_message_at] = trade_expanded_message_value; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> trade_expanded_message_record.price_long[trade_expanded_message_at] = trade_expanded_message_value; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> trade_expanded_message_record.execution_id[trade_expanded_message_at] = trade_expanded_message_value; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_record.trade_condition = trade_expanded_message_value;
  skip
}

/* each byte of Trade Expanded Message set to where it lies, so a field read out of place says so */
inline ramp_trade_expanded_message(trade_expanded_message_record, trade_expanded_message_base) {
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 4 -> trade_expanded_message_record.time_offset[trade_expanded_message_at] = (trade_expanded_message_base + 0 + trade_expanded_message_at + 1) % 256; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> trade_expanded_message_record.order_id[trade_expanded_message_at] = (trade_expanded_message_base + 4 + trade_expanded_message_at + 1) % 256; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_record.side_indicator = (trade_expanded_message_base + 12 + 1) % 256;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 4 -> trade_expanded_message_record.quantity_long[trade_expanded_message_at] = (trade_expanded_message_base + 13 + trade_expanded_message_at + 1) % 256; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> trade_expanded_message_record.expanded_symbol[trade_expanded_message_at] = (trade_expanded_message_base + 17 + trade_expanded_message_at + 1) % 256; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> trade_expanded_message_record.price_long[trade_expanded_message_at] = (trade_expanded_message_base + 25 + trade_expanded_message_at + 1) % 256; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> trade_expanded_message_record.execution_id[trade_expanded_message_at] = (trade_expanded_message_base + 33 + trade_expanded_message_at + 1) % 256; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_record.trade_condition = (trade_expanded_message_base + 41 + 1) % 256;
  skip
}

/* Trade Expanded Message to the wire, 42 bytes from where the cursor stands */
inline encode_trade_expanded_message(trade_expanded_message_record) {
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 4 -> wire[at] = trade_expanded_message_record.time_offset[trade_expanded_message_at]; at = at + 1; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> wire[at] = trade_expanded_message_record.order_id[trade_expanded_message_at]; at = at + 1; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_expanded_message_record.side_indicator; at = at + 1;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 4 -> wire[at] = trade_expanded_message_record.quantity_long[trade_expanded_message_at]; at = at + 1; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> wire[at] = trade_expanded_message_record.expanded_symbol[trade_expanded_message_at]; at = at + 1; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> wire[at] = trade_expanded_message_record.price_long[trade_expanded_message_at]; at = at + 1; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> wire[at] = trade_expanded_message_record.execution_id[trade_expanded_message_at]; at = at + 1; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_expanded_message_record.trade_condition; at = at + 1;
  skip
}

/* Trade Expanded Message off the wire, 42 bytes from where the cursor stands */
inline decode_trade_expanded_message(trade_expanded_message_record) {
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 4 -> trade_expanded_message_record.time_offset[trade_expanded_message_at] = wire[at]; at = at + 1; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> trade_expanded_message_record.order_id[trade_expanded_message_at] = wire[at]; at = at + 1; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_record.side_indicator = wire[at]; at = at + 1;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 4 -> trade_expanded_message_record.quantity_long[trade_expanded_message_at] = wire[at]; at = at + 1; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> trade_expanded_message_record.expanded_symbol[trade_expanded_message_at] = wire[at]; at = at + 1; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> trade_expanded_message_record.price_long[trade_expanded_message_at] = wire[at]; at = at + 1; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> trade_expanded_message_record.execution_id[trade_expanded_message_at] = wire[at]; at = at + 1; trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Expanded Message is what was written, byte for byte */
inline equal_trade_expanded_message(trade_expanded_message_read, trade_expanded_message_written) {
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 4 -> assert(trade_expanded_message_read.time_offset[trade_expanded_message_at] == trade_expanded_message_written.time_offset[trade_expanded_message_at]); trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> assert(trade_expanded_message_read.order_id[trade_expanded_message_at] == trade_expanded_message_written.order_id[trade_expanded_message_at]); trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  assert(trade_expanded_message_read.side_indicator == trade_expanded_message_written.side_indicator);
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 4 -> assert(trade_expanded_message_read.quantity_long[trade_expanded_message_at] == trade_expanded_message_written.quantity_long[trade_expanded_message_at]); trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> assert(trade_expanded_message_read.expanded_symbol[trade_expanded_message_at] == trade_expanded_message_written.expanded_symbol[trade_expanded_message_at]); trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> assert(trade_expanded_message_read.price_long[trade_expanded_message_at] == trade_expanded_message_written.price_long[trade_expanded_message_at]); trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  trade_expanded_message_at = 0;
  do
  :: trade_expanded_message_at < 8 -> assert(trade_expanded_message_read.execution_id[trade_expanded_message_at] == trade_expanded_message_written.execution_id[trade_expanded_message_at]); trade_expanded_message_at = trade_expanded_message_at + 1
  :: else -> break
  od;
  assert(trade_expanded_message_read.trade_condition == trade_expanded_message_written.trade_condition);
  skip
}

/* ---- Trade Break Message: 12 bytes ------------------------------------------- */

/* The Trade Break message is sent whenever an execution on Cboe is broken. Trade breaks are rare, but can occur in the event of an erroneous execution. */
typedef TradeBreakMessage {
  byte time_offset[4];
  byte execution_id[8]
};

int trade_break_message_at;

/* every byte of Trade Break Message set to one value */
inline fill_trade_break_message(trade_break_message_record, trade_break_message_value) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.time_offset[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_trade_break_message(trade_break_message_record, trade_break_message_base) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.time_offset[trade_break_message_at] = (trade_break_message_base + 0 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = (trade_break_message_base + 4 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Break Message to the wire, 12 bytes from where the cursor stands */
inline encode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> wire[at] = trade_break_message_record.time_offset[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.execution_id[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Break Message off the wire, 12 bytes from where the cursor stands */
inline decode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.time_offset[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Break Message is what was written, byte for byte */
inline equal_trade_break_message(trade_break_message_read, trade_break_message_written) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> assert(trade_break_message_read.time_offset[trade_break_message_at] == trade_break_message_written.time_offset[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.execution_id[trade_break_message_at] == trade_break_message_written.execution_id[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Session Message: 4 bytes ----------------------------------------- */

/* The End of Session message is sent for each unit when the unit shuts down for the trading day. This message is used as the signal that processing for the day is complete. */
typedef EndOfSessionMessage {
  byte time_offset[4]
};

int end_of_session_message_at;

/* every byte of End Of Session Message set to one value */
inline fill_end_of_session_message(end_of_session_message_record, end_of_session_message_value) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.time_offset[end_of_session_message_at] = end_of_session_message_value; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Session Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_session_message(end_of_session_message_record, end_of_session_message_base) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.time_offset[end_of_session_message_at] = (end_of_session_message_base + 0 + end_of_session_message_at + 1) % 256; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session Message to the wire, 4 bytes from where the cursor stands */
inline encode_end_of_session_message(end_of_session_message_record) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> wire[at] = end_of_session_message_record.time_offset[end_of_session_message_at]; at = at + 1; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session Message off the wire, 4 bytes from where the cursor stands */
inline decode_end_of_session_message(end_of_session_message_record) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.time_offset[end_of_session_message_at] = wire[at]; at = at + 1; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Session Message is what was written, byte for byte */
inline equal_end_of_session_message(end_of_session_message_read, end_of_session_message_written) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> assert(end_of_session_message_read.time_offset[end_of_session_message_at] == end_of_session_message_written.time_offset[end_of_session_message_at]); end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Mapping Message: 36 bytes ---------------------------------------- */

/* A Symbol Mapping message is used to map the 6 character multicast feed symbol field to an OSI symbol and Underlying. These messages are not sequenced and are sent continuously through the day at variable rates as bandwidth allows. */
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

/* ---- Trading Status Message: 16 bytes ---------------------------------------- */

/* The Trading Status message is used to indicate the current trading status of an options contract. A Trading Status message will be sent whenever a security's trading status changes. The Trading Status field will be used to represent the status of the RTH (9:30 a.m. ET - 4:15 p.m. ET) and Curb sessions. The GTH Trading Status field will be used to represent the status of series that trade during the GTH session. The GTH session runs from 8:15 p.m. to 9:25 a.m. ET for GTH-eligible Products (C1 only). */
typedef TradingStatusMessage {
  byte time_offset[4];
  byte symbol[6];
  byte reserved_2[2];
  byte trading_status;
  byte reserved_1;
  byte gth_trading_status;
  byte second_reserved_1
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_offset[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> trading_status_message_record.reserved_2[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = trading_status_message_value;
  trading_status_message_record.reserved_1 = trading_status_message_value;
  trading_status_message_record.gth_trading_status = trading_status_message_value;
  trading_status_message_record.second_reserved_1 = trading_status_message_value;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_offset[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = (trading_status_message_base + 4 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> trading_status_message_record.reserved_2[trading_status_message_at] = (trading_status_message_base + 10 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = (trading_status_message_base + 12 + 1) % 256;
  trading_status_message_record.reserved_1 = (trading_status_message_base + 13 + 1) % 256;
  trading_status_message_record.gth_trading_status = (trading_status_message_base + 14 + 1) % 256;
  trading_status_message_record.second_reserved_1 = (trading_status_message_base + 15 + 1) % 256;
  skip
}

/* Trading Status Message to the wire, 16 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.time_offset[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> wire[at] = trading_status_message_record.symbol[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> wire[at] = trading_status_message_record.reserved_2[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.trading_status; at = at + 1;
  wire[at] = trading_status_message_record.reserved_1; at = at + 1;
  wire[at] = trading_status_message_record.gth_trading_status; at = at + 1;
  wire[at] = trading_status_message_record.second_reserved_1; at = at + 1;
  skip
}

/* Trading Status Message off the wire, 16 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_offset[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> trading_status_message_record.reserved_2[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = wire[at]; at = at + 1;
  trading_status_message_record.reserved_1 = wire[at]; at = at + 1;
  trading_status_message_record.gth_trading_status = wire[at]; at = at + 1;
  trading_status_message_record.second_reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> assert(trading_status_message_read.time_offset[trading_status_message_at] == trading_status_message_written.time_offset[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> assert(trading_status_message_read.symbol[trading_status_message_at] == trading_status_message_written.symbol[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> assert(trading_status_message_read.reserved_2[trading_status_message_at] == trading_status_message_written.reserved_2[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.trading_status == trading_status_message_written.trading_status);
  assert(trading_status_message_read.reserved_1 == trading_status_message_written.reserved_1);
  assert(trading_status_message_read.gth_trading_status == trading_status_message_written.gth_trading_status);
  assert(trading_status_message_read.second_reserved_1 == trading_status_message_written.second_reserved_1);
  skip
}

/* ---- Width Update Message: 17 bytes ------------------------------------------ */

/* The Width Update message is used to communicate opening quote width multiplier. This message will be sent in the event that the exchange decides to change the quote width multiplier on a per underlying basis. */
typedef WidthUpdateMessage {
  byte time_offset[4];
  byte underlying[8];
  byte width_type;
  byte multiplier[4]
};

int width_update_message_at;

/* every byte of Width Update Message set to one value */
inline fill_width_update_message(width_update_message_record, width_update_message_value) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.time_offset[width_update_message_at] = width_update_message_value; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> width_update_message_record.underlying[width_update_message_at] = width_update_message_value; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_record.width_type = width_update_message_value;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.multiplier[width_update_message_at] = width_update_message_value; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Width Update Message set to where it lies, so a field read out of place says so */
inline ramp_width_update_message(width_update_message_record, width_update_message_base) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.time_offset[width_update_message_at] = (width_update_message_base + 0 + width_update_message_at + 1) % 256; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> width_update_message_record.underlying[width_update_message_at] = (width_update_message_base + 4 + width_update_message_at + 1) % 256; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_record.width_type = (width_update_message_base + 12 + 1) % 256;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.multiplier[width_update_message_at] = (width_update_message_base + 13 + width_update_message_at + 1) % 256; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Width Update Message to the wire, 17 bytes from where the cursor stands */
inline encode_width_update_message(width_update_message_record) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> wire[at] = width_update_message_record.time_offset[width_update_message_at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> wire[at] = width_update_message_record.underlying[width_update_message_at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  wire[at] = width_update_message_record.width_type; at = at + 1;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> wire[at] = width_update_message_record.multiplier[width_update_message_at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Width Update Message off the wire, 17 bytes from where the cursor stands */
inline decode_width_update_message(width_update_message_record) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.time_offset[width_update_message_at] = wire[at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> width_update_message_record.underlying[width_update_message_at] = wire[at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_record.width_type = wire[at]; at = at + 1;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.multiplier[width_update_message_at] = wire[at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Width Update Message is what was written, byte for byte */
inline equal_width_update_message(width_update_message_read, width_update_message_written) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> assert(width_update_message_read.time_offset[width_update_message_at] == width_update_message_written.time_offset[width_update_message_at]); width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> assert(width_update_message_read.underlying[width_update_message_at] == width_update_message_written.underlying[width_update_message_at]); width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  assert(width_update_message_read.width_type == width_update_message_written.width_type);
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> assert(width_update_message_read.multiplier[width_update_message_at] == width_update_message_written.multiplier[width_update_message_at]); width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Options Auction Update Message: 62 bytes -------------------------------- */

/* Options Auction Update messages are used to disseminate price and size information and Composite Market bid and offer prices during Opening and Re-Opening (halt) auctions on the Cboe Options Exchange. */
typedef OptionsAuctionUpdateMessage {
  byte time_offset[4];
  byte expanded_symbol[8];
  byte auction_type;
  byte reference_price[8];
  byte buy_contracts[4];
  byte sell_contracts[4];
  byte indicative_price[8];
  byte auction_only_price[8];
  byte opening_condition;
  byte composite_market_bid_price[8];
  byte composite_market_offer_price[8]
};

int options_auction_update_message_at;

/* every byte of Options Auction Update Message set to one value */
inline fill_options_auction_update_message(options_auction_update_message_record, options_auction_update_message_value) {
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.time_offset[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.expanded_symbol[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.auction_type = options_auction_update_message_value;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.reference_price[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.buy_contracts[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.sell_contracts[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.indicative_price[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.auction_only_price[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.opening_condition = options_auction_update_message_value;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.composite_market_bid_price[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.composite_market_offer_price[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Options Auction Update Message set to where it lies, so a field read out of place says so */
inline ramp_options_auction_update_message(options_auction_update_message_record, options_auction_update_message_base) {
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.time_offset[options_auction_update_message_at] = (options_auction_update_message_base + 0 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.expanded_symbol[options_auction_update_message_at] = (options_auction_update_message_base + 4 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.auction_type = (options_auction_update_message_base + 12 + 1) % 256;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.reference_price[options_auction_update_message_at] = (options_auction_update_message_base + 13 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.buy_contracts[options_auction_update_message_at] = (options_auction_update_message_base + 21 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.sell_contracts[options_auction_update_message_at] = (options_auction_update_message_base + 25 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.indicative_price[options_auction_update_message_at] = (options_auction_update_message_base + 29 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.auction_only_price[options_auction_update_message_at] = (options_auction_update_message_base + 37 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.opening_condition = (options_auction_update_message_base + 45 + 1) % 256;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.composite_market_bid_price[options_auction_update_message_at] = (options_auction_update_message_base + 46 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.composite_market_offer_price[options_auction_update_message_at] = (options_auction_update_message_base + 54 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Auction Update Message to the wire, 62 bytes from where the cursor stands */
inline encode_options_auction_update_message(options_auction_update_message_record) {
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> wire[at] = options_auction_update_message_record.time_offset[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> wire[at] = options_auction_update_message_record.expanded_symbol[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = options_auction_update_message_record.auction_type; at = at + 1;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> wire[at] = options_auction_update_message_record.reference_price[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> wire[at] = options_auction_update_message_record.buy_contracts[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> wire[at] = options_auction_update_message_record.sell_contracts[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> wire[at] = options_auction_update_message_record.indicative_price[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> wire[at] = options_auction_update_message_record.auction_only_price[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = options_auction_update_message_record.opening_condition; at = at + 1;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> wire[at] = options_auction_update_message_record.composite_market_bid_price[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> wire[at] = options_auction_update_message_record.composite_market_offer_price[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Auction Update Message off the wire, 62 bytes from where the cursor stands */
inline decode_options_auction_update_message(options_auction_update_message_record) {
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.time_offset[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.expanded_symbol[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.auction_type = wire[at]; at = at + 1;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.reference_price[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.buy_contracts[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.sell_contracts[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.indicative_price[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.auction_only_price[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.opening_condition = wire[at]; at = at + 1;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.composite_market_bid_price[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.composite_market_offer_price[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Options Auction Update Message is what was written, byte for byte */
inline equal_options_auction_update_message(options_auction_update_message_read, options_auction_update_message_written) {
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> assert(options_auction_update_message_read.time_offset[options_auction_update_message_at] == options_auction_update_message_written.time_offset[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> assert(options_auction_update_message_read.expanded_symbol[options_auction_update_message_at] == options_auction_update_message_written.expanded_symbol[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  assert(options_auction_update_message_read.auction_type == options_auction_update_message_written.auction_type);
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> assert(options_auction_update_message_read.reference_price[options_auction_update_message_at] == options_auction_update_message_written.reference_price[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> assert(options_auction_update_message_read.buy_contracts[options_auction_update_message_at] == options_auction_update_message_written.buy_contracts[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> assert(options_auction_update_message_read.sell_contracts[options_auction_update_message_at] == options_auction_update_message_written.sell_contracts[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> assert(options_auction_update_message_read.indicative_price[options_auction_update_message_at] == options_auction_update_message_written.indicative_price[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> assert(options_auction_update_message_read.auction_only_price[options_auction_update_message_at] == options_auction_update_message_written.auction_only_price[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  assert(options_auction_update_message_read.opening_condition == options_auction_update_message_written.opening_condition);
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> assert(options_auction_update_message_read.composite_market_bid_price[options_auction_update_message_at] == options_auction_update_message_written.composite_market_bid_price[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> assert(options_auction_update_message_read.composite_market_offer_price[options_auction_update_message_at] == options_auction_update_message_written.composite_market_offer_price[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Summary Message: 25 bytes --------------------------------------- */

/* Auction Summary messages are used to disseminate the results of an auction, including Opening and Re-Opening on the Cboe Options Exchange. */
typedef AuctionSummaryMessage {
  byte time_offset[4];
  byte stock_symbol[8];
  byte auction_type;
  byte price_long[8];
  byte contracts[4]
};

int auction_summary_message_at;

/* every byte of Auction Summary Message set to one value */
inline fill_auction_summary_message(auction_summary_message_record, auction_summary_message_value) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.time_offset[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.stock_symbol[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = auction_summary_message_value;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price_long[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.contracts[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Summary Message set to where it lies, so a field read out of place says so */
inline ramp_auction_summary_message(auction_summary_message_record, auction_summary_message_base) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.time_offset[auction_summary_message_at] = (auction_summary_message_base + 0 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.stock_symbol[auction_summary_message_at] = (auction_summary_message_base + 4 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = (auction_summary_message_base + 12 + 1) % 256;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price_long[auction_summary_message_at] = (auction_summary_message_base + 13 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.contracts[auction_summary_message_at] = (auction_summary_message_base + 21 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Summary Message to the wire, 25 bytes from where the cursor stands */
inline encode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.time_offset[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.stock_symbol[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_summary_message_record.auction_type; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.price_long[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.contracts[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Summary Message off the wire, 25 bytes from where the cursor stands */
inline decode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.time_offset[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.stock_symbol[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = wire[at]; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price_long[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.contracts[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Summary Message is what was written, byte for byte */
inline equal_auction_summary_message(auction_summary_message_read, auction_summary_message_written) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.time_offset[auction_summary_message_at] == auction_summary_message_written.time_offset[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.stock_symbol[auction_summary_message_at] == auction_summary_message_written.stock_symbol[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  assert(auction_summary_message_read.auction_type == auction_summary_message_written.auction_type);
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.price_long[auction_summary_message_at] == auction_summary_message_written.price_long[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.contracts[auction_summary_message_at] == auction_summary_message_written.contracts[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Notification Message: 45 bytes ---------------------------------- */

/* C1 and EDGX Options Only. Auction Notification messages are used to disseminate order details of an auction. Auctions will be available for a defined period of time known as the exposure period. */
typedef AuctionNotificationMessage {
  byte time_offset[4];
  byte symbol[6];
  byte auction_id[8];
  byte auction_type;
  byte side;
  byte price_long[8];
  byte contracts[4];
  byte customer_indicator;
  byte participant_id[4];
  byte auction_end_offset[4];
  byte client_id[4]
};

int auction_notification_message_at;

/* every byte of Auction Notification Message set to one value */
inline fill_auction_notification_message(auction_notification_message_record, auction_notification_message_value) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.time_offset[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 6 -> auction_notification_message_record.symbol[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.auction_id[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.auction_type = auction_notification_message_value;
  auction_notification_message_record.side = auction_notification_message_value;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.price_long[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.contracts[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.customer_indicator = auction_notification_message_value;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.participant_id[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.auction_end_offset[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.client_id[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Notification Message set to where it lies, so a field read out of place says so */
inline ramp_auction_notification_message(auction_notification_message_record, auction_notification_message_base) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.time_offset[auction_notification_message_at] = (auction_notification_message_base + 0 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 6 -> auction_notification_message_record.symbol[auction_notification_message_at] = (auction_notification_message_base + 4 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.auction_id[auction_notification_message_at] = (auction_notification_message_base + 10 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.auction_type = (auction_notification_message_base + 18 + 1) % 256;
  auction_notification_message_record.side = (auction_notification_message_base + 19 + 1) % 256;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.price_long[auction_notification_message_at] = (auction_notification_message_base + 20 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.contracts[auction_notification_message_at] = (auction_notification_message_base + 28 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.customer_indicator = (auction_notification_message_base + 32 + 1) % 256;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.participant_id[auction_notification_message_at] = (auction_notification_message_base + 33 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.auction_end_offset[auction_notification_message_at] = (auction_notification_message_base + 37 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.client_id[auction_notification_message_at] = (auction_notification_message_base + 41 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Notification Message to the wire, 45 bytes from where the cursor stands */
inline encode_auction_notification_message(auction_notification_message_record) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.time_offset[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 6 -> wire[at] = auction_notification_message_record.symbol[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> wire[at] = auction_notification_message_record.auction_id[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_notification_message_record.auction_type; at = at + 1;
  wire[at] = auction_notification_message_record.side; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> wire[at] = auction_notification_message_record.price_long[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.contracts[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_notification_message_record.customer_indicator; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.participant_id[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.auction_end_offset[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.client_id[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Notification Message off the wire, 45 bytes from where the cursor stands */
inline decode_auction_notification_message(auction_notification_message_record) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.time_offset[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 6 -> auction_notification_message_record.symbol[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.auction_id[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.auction_type = wire[at]; at = at + 1;
  auction_notification_message_record.side = wire[at]; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.price_long[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.contracts[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.customer_indicator = wire[at]; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.participant_id[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.auction_end_offset[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.client_id[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Notification Message is what was written, byte for byte */
inline equal_auction_notification_message(auction_notification_message_read, auction_notification_message_written) {
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.time_offset[auction_notification_message_at] == auction_notification_message_written.time_offset[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 6 -> assert(auction_notification_message_read.symbol[auction_notification_message_at] == auction_notification_message_written.symbol[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> assert(auction_notification_message_read.auction_id[auction_notification_message_at] == auction_notification_message_written.auction_id[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  assert(auction_notification_message_read.auction_type == auction_notification_message_written.auction_type);
  assert(auction_notification_message_read.side == auction_notification_message_written.side);
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> assert(auction_notification_message_read.price_long[auction_notification_message_at] == auction_notification_message_written.price_long[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.contracts[auction_notification_message_at] == auction_notification_message_written.contracts[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  assert(auction_notification_message_read.customer_indicator == auction_notification_message_written.customer_indicator);
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.participant_id[auction_notification_message_at] == auction_notification_message_written.participant_id[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.auction_end_offset[auction_notification_message_at] == auction_notification_message_written.auction_end_offset[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.client_id[auction_notification_message_at] == auction_notification_message_written.client_id[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Cancel Message: 12 bytes ---------------------------------------- */

/* C1 and EDGX Options Only. Auction Cancel messages are used to disseminate the cancelation of an earlier Auction Notification message. */
typedef AuctionCancelMessage {
  byte time_offset[4];
  byte auction_id[8]
};

int auction_cancel_message_at;

/* every byte of Auction Cancel Message set to one value */
inline fill_auction_cancel_message(auction_cancel_message_record, auction_cancel_message_value) {
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 4 -> auction_cancel_message_record.time_offset[auction_cancel_message_at] = auction_cancel_message_value; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 8 -> auction_cancel_message_record.auction_id[auction_cancel_message_at] = auction_cancel_message_value; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_auction_cancel_message(auction_cancel_message_record, auction_cancel_message_base) {
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 4 -> auction_cancel_message_record.time_offset[auction_cancel_message_at] = (auction_cancel_message_base + 0 + auction_cancel_message_at + 1) % 256; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 8 -> auction_cancel_message_record.auction_id[auction_cancel_message_at] = (auction_cancel_message_base + 4 + auction_cancel_message_at + 1) % 256; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Cancel Message to the wire, 12 bytes from where the cursor stands */
inline encode_auction_cancel_message(auction_cancel_message_record) {
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 4 -> wire[at] = auction_cancel_message_record.time_offset[auction_cancel_message_at]; at = at + 1; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 8 -> wire[at] = auction_cancel_message_record.auction_id[auction_cancel_message_at]; at = at + 1; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Cancel Message off the wire, 12 bytes from where the cursor stands */
inline decode_auction_cancel_message(auction_cancel_message_record) {
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 4 -> auction_cancel_message_record.time_offset[auction_cancel_message_at] = wire[at]; at = at + 1; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 8 -> auction_cancel_message_record.auction_id[auction_cancel_message_at] = wire[at]; at = at + 1; auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Cancel Message is what was written, byte for byte */
inline equal_auction_cancel_message(auction_cancel_message_read, auction_cancel_message_written) {
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 4 -> assert(auction_cancel_message_read.time_offset[auction_cancel_message_at] == auction_cancel_message_written.time_offset[auction_cancel_message_at]); auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  auction_cancel_message_at = 0;
  do
  :: auction_cancel_message_at < 8 -> assert(auction_cancel_message_read.auction_id[auction_cancel_message_at] == auction_cancel_message_written.auction_id[auction_cancel_message_at]); auction_cancel_message_at = auction_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Trade Message: 32 bytes ----------------------------------------- */

/* C1 and EDGX Options Only. Auction Trade messages are used to disseminate executions resulting from an options auction. */
typedef AuctionTradeMessage {
  byte time_offset[4];
  byte auction_id[8];
  byte execution_id[8];
  byte price_long[8];
  byte contracts[4]
};

int auction_trade_message_at;

/* every byte of Auction Trade Message set to one value */
inline fill_auction_trade_message(auction_trade_message_record, auction_trade_message_value) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.time_offset[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.auction_id[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.execution_id[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.price_long[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.contracts[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Trade Message set to where it lies, so a field read out of place says so */
inline ramp_auction_trade_message(auction_trade_message_record, auction_trade_message_base) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.time_offset[auction_trade_message_at] = (auction_trade_message_base + 0 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.auction_id[auction_trade_message_at] = (auction_trade_message_base + 4 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.execution_id[auction_trade_message_at] = (auction_trade_message_base + 12 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.price_long[auction_trade_message_at] = (auction_trade_message_base + 20 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.contracts[auction_trade_message_at] = (auction_trade_message_base + 28 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Trade Message to the wire, 32 bytes from where the cursor stands */
inline encode_auction_trade_message(auction_trade_message_record) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.time_offset[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> wire[at] = auction_trade_message_record.auction_id[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> wire[at] = auction_trade_message_record.execution_id[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> wire[at] = auction_trade_message_record.price_long[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.contracts[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Trade Message off the wire, 32 bytes from where the cursor stands */
inline decode_auction_trade_message(auction_trade_message_record) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.time_offset[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.auction_id[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.execution_id[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.price_long[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.contracts[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Trade Message is what was written, byte for byte */
inline equal_auction_trade_message(auction_trade_message_read, auction_trade_message_written) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> assert(auction_trade_message_read.time_offset[auction_trade_message_at] == auction_trade_message_written.time_offset[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> assert(auction_trade_message_read.auction_id[auction_trade_message_at] == auction_trade_message_written.auction_id[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> assert(auction_trade_message_read.execution_id[auction_trade_message_at] == auction_trade_message_written.execution_id[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> assert(auction_trade_message_read.price_long[auction_trade_message_at] == auction_trade_message_written.price_long[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> assert(auction_trade_message_read.contracts[auction_trade_message_at] == auction_trade_message_written.contracts[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Soq Strike Range Update Message: 40 bytes ------------------------------- */

/* C1 Only. The SOQ Strike Range Update message disseminates the minimum and maximum strike prices of the strike price range used to calculate the Special Opening Quote (SOQ) on a Volatility Settlement date. */
typedef SoqStrikeRangeUpdateMessage {
  byte time_offset[4];
  byte soq_identifier[20];
  byte lower_strike_price[8];
  byte upper_strike_price[8]
};

int soq_strike_range_update_message_at;

/* every byte of Soq Strike Range Update Message set to one value */
inline fill_soq_strike_range_update_message(soq_strike_range_update_message_record, soq_strike_range_update_message_value) {
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 4 -> soq_strike_range_update_message_record.time_offset[soq_strike_range_update_message_at] = soq_strike_range_update_message_value; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 20 -> soq_strike_range_update_message_record.soq_identifier[soq_strike_range_update_message_at] = soq_strike_range_update_message_value; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> soq_strike_range_update_message_record.lower_strike_price[soq_strike_range_update_message_at] = soq_strike_range_update_message_value; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> soq_strike_range_update_message_record.upper_strike_price[soq_strike_range_update_message_at] = soq_strike_range_update_message_value; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Soq Strike Range Update Message set to where it lies, so a field read out of place says so */
inline ramp_soq_strike_range_update_message(soq_strike_range_update_message_record, soq_strike_range_update_message_base) {
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 4 -> soq_strike_range_update_message_record.time_offset[soq_strike_range_update_message_at] = (soq_strike_range_update_message_base + 0 + soq_strike_range_update_message_at + 1) % 256; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 20 -> soq_strike_range_update_message_record.soq_identifier[soq_strike_range_update_message_at] = (soq_strike_range_update_message_base + 4 + soq_strike_range_update_message_at + 1) % 256; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> soq_strike_range_update_message_record.lower_strike_price[soq_strike_range_update_message_at] = (soq_strike_range_update_message_base + 24 + soq_strike_range_update_message_at + 1) % 256; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> soq_strike_range_update_message_record.upper_strike_price[soq_strike_range_update_message_at] = (soq_strike_range_update_message_base + 32 + soq_strike_range_update_message_at + 1) % 256; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Soq Strike Range Update Message to the wire, 40 bytes from where the cursor stands */
inline encode_soq_strike_range_update_message(soq_strike_range_update_message_record) {
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 4 -> wire[at] = soq_strike_range_update_message_record.time_offset[soq_strike_range_update_message_at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 20 -> wire[at] = soq_strike_range_update_message_record.soq_identifier[soq_strike_range_update_message_at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> wire[at] = soq_strike_range_update_message_record.lower_strike_price[soq_strike_range_update_message_at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> wire[at] = soq_strike_range_update_message_record.upper_strike_price[soq_strike_range_update_message_at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Soq Strike Range Update Message off the wire, 40 bytes from where the cursor stands */
inline decode_soq_strike_range_update_message(soq_strike_range_update_message_record) {
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 4 -> soq_strike_range_update_message_record.time_offset[soq_strike_range_update_message_at] = wire[at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 20 -> soq_strike_range_update_message_record.soq_identifier[soq_strike_range_update_message_at] = wire[at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> soq_strike_range_update_message_record.lower_strike_price[soq_strike_range_update_message_at] = wire[at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> soq_strike_range_update_message_record.upper_strike_price[soq_strike_range_update_message_at] = wire[at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Soq Strike Range Update Message is what was written, byte for byte */
inline equal_soq_strike_range_update_message(soq_strike_range_update_message_read, soq_strike_range_update_message_written) {
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 4 -> assert(soq_strike_range_update_message_read.time_offset[soq_strike_range_update_message_at] == soq_strike_range_update_message_written.time_offset[soq_strike_range_update_message_at]); soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 20 -> assert(soq_strike_range_update_message_read.soq_identifier[soq_strike_range_update_message_at] == soq_strike_range_update_message_written.soq_identifier[soq_strike_range_update_message_at]); soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> assert(soq_strike_range_update_message_read.lower_strike_price[soq_strike_range_update_message_at] == soq_strike_range_update_message_written.lower_strike_price[soq_strike_range_update_message_at]); soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> assert(soq_strike_range_update_message_read.upper_strike_price[soq_strike_range_update_message_at] == soq_strike_range_update_message_written.upper_strike_price[soq_strike_range_update_message_at]); soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Constituent Symbol Mapping Message: 56 bytes ---------------------------- */

/* C1 Only. The Constituent Symbol Mapping message is used to communicate which options series are Constituent Series in a Volatility Settlement Special Opening Quote (SOQ). */
typedef ConstituentSymbolMappingMessage {
  byte feed_symbol[6];
  byte osi_symbol[21];
  byte symbol_condition;
  byte underlying[8];
  byte soq_identifier[20]
};

int constituent_symbol_mapping_message_at;

/* every byte of Constituent Symbol Mapping Message set to one value */
inline fill_constituent_symbol_mapping_message(constituent_symbol_mapping_message_record, constituent_symbol_mapping_message_value) {
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 6 -> constituent_symbol_mapping_message_record.feed_symbol[constituent_symbol_mapping_message_at] = constituent_symbol_mapping_message_value; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 21 -> constituent_symbol_mapping_message_record.osi_symbol[constituent_symbol_mapping_message_at] = constituent_symbol_mapping_message_value; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_record.symbol_condition = constituent_symbol_mapping_message_value;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 8 -> constituent_symbol_mapping_message_record.underlying[constituent_symbol_mapping_message_at] = constituent_symbol_mapping_message_value; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 20 -> constituent_symbol_mapping_message_record.soq_identifier[constituent_symbol_mapping_message_at] = constituent_symbol_mapping_message_value; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Constituent Symbol Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_constituent_symbol_mapping_message(constituent_symbol_mapping_message_record, constituent_symbol_mapping_message_base) {
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 6 -> constituent_symbol_mapping_message_record.feed_symbol[constituent_symbol_mapping_message_at] = (constituent_symbol_mapping_message_base + 0 + constituent_symbol_mapping_message_at + 1) % 256; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 21 -> constituent_symbol_mapping_message_record.osi_symbol[constituent_symbol_mapping_message_at] = (constituent_symbol_mapping_message_base + 6 + constituent_symbol_mapping_message_at + 1) % 256; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_record.symbol_condition = (constituent_symbol_mapping_message_base + 27 + 1) % 256;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 8 -> constituent_symbol_mapping_message_record.underlying[constituent_symbol_mapping_message_at] = (constituent_symbol_mapping_message_base + 28 + constituent_symbol_mapping_message_at + 1) % 256; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 20 -> constituent_symbol_mapping_message_record.soq_identifier[constituent_symbol_mapping_message_at] = (constituent_symbol_mapping_message_base + 36 + constituent_symbol_mapping_message_at + 1) % 256; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Constituent Symbol Mapping Message to the wire, 56 bytes from where the cursor stands */
inline encode_constituent_symbol_mapping_message(constituent_symbol_mapping_message_record) {
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 6 -> wire[at] = constituent_symbol_mapping_message_record.feed_symbol[constituent_symbol_mapping_message_at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 21 -> wire[at] = constituent_symbol_mapping_message_record.osi_symbol[constituent_symbol_mapping_message_at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = constituent_symbol_mapping_message_record.symbol_condition; at = at + 1;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 8 -> wire[at] = constituent_symbol_mapping_message_record.underlying[constituent_symbol_mapping_message_at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 20 -> wire[at] = constituent_symbol_mapping_message_record.soq_identifier[constituent_symbol_mapping_message_at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Constituent Symbol Mapping Message off the wire, 56 bytes from where the cursor stands */
inline decode_constituent_symbol_mapping_message(constituent_symbol_mapping_message_record) {
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 6 -> constituent_symbol_mapping_message_record.feed_symbol[constituent_symbol_mapping_message_at] = wire[at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 21 -> constituent_symbol_mapping_message_record.osi_symbol[constituent_symbol_mapping_message_at] = wire[at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_record.symbol_condition = wire[at]; at = at + 1;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 8 -> constituent_symbol_mapping_message_record.underlying[constituent_symbol_mapping_message_at] = wire[at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 20 -> constituent_symbol_mapping_message_record.soq_identifier[constituent_symbol_mapping_message_at] = wire[at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Constituent Symbol Mapping Message is what was written, byte for byte */
inline equal_constituent_symbol_mapping_message(constituent_symbol_mapping_message_read, constituent_symbol_mapping_message_written) {
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 6 -> assert(constituent_symbol_mapping_message_read.feed_symbol[constituent_symbol_mapping_message_at] == constituent_symbol_mapping_message_written.feed_symbol[constituent_symbol_mapping_message_at]); constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 21 -> assert(constituent_symbol_mapping_message_read.osi_symbol[constituent_symbol_mapping_message_at] == constituent_symbol_mapping_message_written.osi_symbol[constituent_symbol_mapping_message_at]); constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  assert(constituent_symbol_mapping_message_read.symbol_condition == constituent_symbol_mapping_message_written.symbol_condition);
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 8 -> assert(constituent_symbol_mapping_message_read.underlying[constituent_symbol_mapping_message_at] == constituent_symbol_mapping_message_written.underlying[constituent_symbol_mapping_message_at]); constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 20 -> assert(constituent_symbol_mapping_message_read.soq_identifier[constituent_symbol_mapping_message_at] == constituent_symbol_mapping_message_written.soq_identifier[constituent_symbol_mapping_message_at]); constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
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

/* Time Message: encoded, read back, and compared */
proctype check_time_message() {
  TimeMessage time_message_sent;
  TimeMessage time_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time_message(time_message_sent, 0)
  :: pattern == 1 -> fill_time_message(time_message_sent, 32)
  :: pattern == 2 -> fill_time_message(time_message_sent, 255)
  :: else -> ramp_time_message(time_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time_message(time_message_sent);
    assert(at == 8);
    at = 0;
    decode_time_message(time_message_got);
    assert(at == 8);
    equal_time_message(time_message_got, time_message_sent)
  }
}

/* Unit Clear Message: encoded, read back, and compared */
proctype check_unit_clear_message() {
  UnitClearMessage unit_clear_message_sent;
  UnitClearMessage unit_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unit_clear_message(unit_clear_message_sent, 0)
  :: pattern == 1 -> fill_unit_clear_message(unit_clear_message_sent, 32)
  :: pattern == 2 -> fill_unit_clear_message(unit_clear_message_sent, 255)
  :: else -> ramp_unit_clear_message(unit_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unit_clear_message(unit_clear_message_sent);
    assert(at == 4);
    at = 0;
    decode_unit_clear_message(unit_clear_message_got);
    assert(at == 4);
    equal_unit_clear_message(unit_clear_message_got, unit_clear_message_sent)
  }
}

/* Transaction Begin Message: encoded, read back, and compared */
proctype check_transaction_begin_message() {
  TransactionBeginMessage transaction_begin_message_sent;
  TransactionBeginMessage transaction_begin_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transaction_begin_message(transaction_begin_message_sent, 0)
  :: pattern == 1 -> fill_transaction_begin_message(transaction_begin_message_sent, 32)
  :: pattern == 2 -> fill_transaction_begin_message(transaction_begin_message_sent, 255)
  :: else -> ramp_transaction_begin_message(transaction_begin_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transaction_begin_message(transaction_begin_message_sent);
    assert(at == 4);
    at = 0;
    decode_transaction_begin_message(transaction_begin_message_got);
    assert(at == 4);
    equal_transaction_begin_message(transaction_begin_message_got, transaction_begin_message_sent)
  }
}

/* Transaction End Message: encoded, read back, and compared */
proctype check_transaction_end_message() {
  TransactionEndMessage transaction_end_message_sent;
  TransactionEndMessage transaction_end_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transaction_end_message(transaction_end_message_sent, 0)
  :: pattern == 1 -> fill_transaction_end_message(transaction_end_message_sent, 32)
  :: pattern == 2 -> fill_transaction_end_message(transaction_end_message_sent, 255)
  :: else -> ramp_transaction_end_message(transaction_end_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transaction_end_message(transaction_end_message_sent);
    assert(at == 4);
    at = 0;
    decode_transaction_end_message(transaction_end_message_got);
    assert(at == 4);
    equal_transaction_end_message(transaction_end_message_got, transaction_end_message_sent)
  }
}

/* Order Executed Message: encoded, read back, and compared */
proctype check_order_executed_message() {
  OrderExecutedMessage order_executed_message_sent;
  OrderExecutedMessage order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_message(order_executed_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_message(order_executed_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_message(order_executed_message_sent, 255)
  :: else -> ramp_order_executed_message(order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_message(order_executed_message_sent);
    assert(at == 25);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 25);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Order Executed At Price Size Message: encoded, read back, and compared */
proctype check_order_executed_at_price_size_message() {
  OrderExecutedAtPriceSizeMessage order_executed_at_price_size_message_sent;
  OrderExecutedAtPriceSizeMessage order_executed_at_price_size_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_at_price_size_message(order_executed_at_price_size_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_at_price_size_message(order_executed_at_price_size_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_at_price_size_message(order_executed_at_price_size_message_sent, 255)
  :: else -> ramp_order_executed_at_price_size_message(order_executed_at_price_size_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_at_price_size_message(order_executed_at_price_size_message_sent);
    assert(at == 37);
    at = 0;
    decode_order_executed_at_price_size_message(order_executed_at_price_size_message_got);
    assert(at == 37);
    equal_order_executed_at_price_size_message(order_executed_at_price_size_message_got, order_executed_at_price_size_message_sent)
  }
}

/* Reduce Size Long Message: encoded, read back, and compared */
proctype check_reduce_size_long_message() {
  ReduceSizeLongMessage reduce_size_long_message_sent;
  ReduceSizeLongMessage reduce_size_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reduce_size_long_message(reduce_size_long_message_sent, 0)
  :: pattern == 1 -> fill_reduce_size_long_message(reduce_size_long_message_sent, 32)
  :: pattern == 2 -> fill_reduce_size_long_message(reduce_size_long_message_sent, 255)
  :: else -> ramp_reduce_size_long_message(reduce_size_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reduce_size_long_message(reduce_size_long_message_sent);
    assert(at == 16);
    at = 0;
    decode_reduce_size_long_message(reduce_size_long_message_got);
    assert(at == 16);
    equal_reduce_size_long_message(reduce_size_long_message_got, reduce_size_long_message_sent)
  }
}

/* Reduce Size Short Message: encoded, read back, and compared */
proctype check_reduce_size_short_message() {
  ReduceSizeShortMessage reduce_size_short_message_sent;
  ReduceSizeShortMessage reduce_size_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reduce_size_short_message(reduce_size_short_message_sent, 0)
  :: pattern == 1 -> fill_reduce_size_short_message(reduce_size_short_message_sent, 32)
  :: pattern == 2 -> fill_reduce_size_short_message(reduce_size_short_message_sent, 255)
  :: else -> ramp_reduce_size_short_message(reduce_size_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reduce_size_short_message(reduce_size_short_message_sent);
    assert(at == 14);
    at = 0;
    decode_reduce_size_short_message(reduce_size_short_message_got);
    assert(at == 14);
    equal_reduce_size_short_message(reduce_size_short_message_got, reduce_size_short_message_sent)
  }
}

/* Delete Order Message: encoded, read back, and compared */
proctype check_delete_order_message() {
  DeleteOrderMessage delete_order_message_sent;
  DeleteOrderMessage delete_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_order_message(delete_order_message_sent, 0)
  :: pattern == 1 -> fill_delete_order_message(delete_order_message_sent, 32)
  :: pattern == 2 -> fill_delete_order_message(delete_order_message_sent, 255)
  :: else -> ramp_delete_order_message(delete_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_order_message(delete_order_message_sent);
    assert(at == 12);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 12);
    equal_delete_order_message(delete_order_message_got, delete_order_message_sent)
  }
}

/* Trade Long Message: encoded, read back, and compared */
proctype check_trade_long_message() {
  TradeLongMessage trade_long_message_sent;
  TradeLongMessage trade_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_long_message(trade_long_message_sent, 0)
  :: pattern == 1 -> fill_trade_long_message(trade_long_message_sent, 32)
  :: pattern == 2 -> fill_trade_long_message(trade_long_message_sent, 255)
  :: else -> ramp_trade_long_message(trade_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_long_message(trade_long_message_sent);
    assert(at == 40);
    at = 0;
    decode_trade_long_message(trade_long_message_got);
    assert(at == 40);
    equal_trade_long_message(trade_long_message_got, trade_long_message_sent)
  }
}

/* Trade Short Message: encoded, read back, and compared */
proctype check_trade_short_message() {
  TradeShortMessage trade_short_message_sent;
  TradeShortMessage trade_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_short_message(trade_short_message_sent, 0)
  :: pattern == 1 -> fill_trade_short_message(trade_short_message_sent, 32)
  :: pattern == 2 -> fill_trade_short_message(trade_short_message_sent, 255)
  :: else -> ramp_trade_short_message(trade_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_short_message(trade_short_message_sent);
    assert(at == 32);
    at = 0;
    decode_trade_short_message(trade_short_message_got);
    assert(at == 32);
    equal_trade_short_message(trade_short_message_got, trade_short_message_sent)
  }
}

/* Trade Expanded Message: encoded, read back, and compared */
proctype check_trade_expanded_message() {
  TradeExpandedMessage trade_expanded_message_sent;
  TradeExpandedMessage trade_expanded_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_expanded_message(trade_expanded_message_sent, 0)
  :: pattern == 1 -> fill_trade_expanded_message(trade_expanded_message_sent, 32)
  :: pattern == 2 -> fill_trade_expanded_message(trade_expanded_message_sent, 255)
  :: else -> ramp_trade_expanded_message(trade_expanded_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_expanded_message(trade_expanded_message_sent);
    assert(at == 42);
    at = 0;
    decode_trade_expanded_message(trade_expanded_message_got);
    assert(at == 42);
    equal_trade_expanded_message(trade_expanded_message_got, trade_expanded_message_sent)
  }
}

/* Trade Break Message: encoded, read back, and compared */
proctype check_trade_break_message() {
  TradeBreakMessage trade_break_message_sent;
  TradeBreakMessage trade_break_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_break_message(trade_break_message_sent, 0)
  :: pattern == 1 -> fill_trade_break_message(trade_break_message_sent, 32)
  :: pattern == 2 -> fill_trade_break_message(trade_break_message_sent, 255)
  :: else -> ramp_trade_break_message(trade_break_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_break_message(trade_break_message_sent);
    assert(at == 12);
    at = 0;
    decode_trade_break_message(trade_break_message_got);
    assert(at == 12);
    equal_trade_break_message(trade_break_message_got, trade_break_message_sent)
  }
}

/* End Of Session Message: encoded, read back, and compared */
proctype check_end_of_session_message() {
  EndOfSessionMessage end_of_session_message_sent;
  EndOfSessionMessage end_of_session_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_session_message(end_of_session_message_sent, 0)
  :: pattern == 1 -> fill_end_of_session_message(end_of_session_message_sent, 32)
  :: pattern == 2 -> fill_end_of_session_message(end_of_session_message_sent, 255)
  :: else -> ramp_end_of_session_message(end_of_session_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_session_message(end_of_session_message_sent);
    assert(at == 4);
    at = 0;
    decode_end_of_session_message(end_of_session_message_got);
    assert(at == 4);
    equal_end_of_session_message(end_of_session_message_got, end_of_session_message_sent)
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
    assert(at == 16);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 16);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
  }
}

/* Width Update Message: encoded, read back, and compared */
proctype check_width_update_message() {
  WidthUpdateMessage width_update_message_sent;
  WidthUpdateMessage width_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_width_update_message(width_update_message_sent, 0)
  :: pattern == 1 -> fill_width_update_message(width_update_message_sent, 32)
  :: pattern == 2 -> fill_width_update_message(width_update_message_sent, 255)
  :: else -> ramp_width_update_message(width_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_width_update_message(width_update_message_sent);
    assert(at == 17);
    at = 0;
    decode_width_update_message(width_update_message_got);
    assert(at == 17);
    equal_width_update_message(width_update_message_got, width_update_message_sent)
  }
}

/* Options Auction Update Message: encoded, read back, and compared */
proctype check_options_auction_update_message() {
  OptionsAuctionUpdateMessage options_auction_update_message_sent;
  OptionsAuctionUpdateMessage options_auction_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_auction_update_message(options_auction_update_message_sent, 0)
  :: pattern == 1 -> fill_options_auction_update_message(options_auction_update_message_sent, 32)
  :: pattern == 2 -> fill_options_auction_update_message(options_auction_update_message_sent, 255)
  :: else -> ramp_options_auction_update_message(options_auction_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_auction_update_message(options_auction_update_message_sent);
    assert(at == 62);
    at = 0;
    decode_options_auction_update_message(options_auction_update_message_got);
    assert(at == 62);
    equal_options_auction_update_message(options_auction_update_message_got, options_auction_update_message_sent)
  }
}

/* Auction Summary Message: encoded, read back, and compared */
proctype check_auction_summary_message() {
  AuctionSummaryMessage auction_summary_message_sent;
  AuctionSummaryMessage auction_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_summary_message(auction_summary_message_sent, 0)
  :: pattern == 1 -> fill_auction_summary_message(auction_summary_message_sent, 32)
  :: pattern == 2 -> fill_auction_summary_message(auction_summary_message_sent, 255)
  :: else -> ramp_auction_summary_message(auction_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_summary_message(auction_summary_message_sent);
    assert(at == 25);
    at = 0;
    decode_auction_summary_message(auction_summary_message_got);
    assert(at == 25);
    equal_auction_summary_message(auction_summary_message_got, auction_summary_message_sent)
  }
}

/* Auction Notification Message: encoded, read back, and compared */
proctype check_auction_notification_message() {
  AuctionNotificationMessage auction_notification_message_sent;
  AuctionNotificationMessage auction_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_notification_message(auction_notification_message_sent, 0)
  :: pattern == 1 -> fill_auction_notification_message(auction_notification_message_sent, 32)
  :: pattern == 2 -> fill_auction_notification_message(auction_notification_message_sent, 255)
  :: else -> ramp_auction_notification_message(auction_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_notification_message(auction_notification_message_sent);
    assert(at == 45);
    at = 0;
    decode_auction_notification_message(auction_notification_message_got);
    assert(at == 45);
    equal_auction_notification_message(auction_notification_message_got, auction_notification_message_sent)
  }
}

/* Auction Cancel Message: encoded, read back, and compared */
proctype check_auction_cancel_message() {
  AuctionCancelMessage auction_cancel_message_sent;
  AuctionCancelMessage auction_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_cancel_message(auction_cancel_message_sent, 0)
  :: pattern == 1 -> fill_auction_cancel_message(auction_cancel_message_sent, 32)
  :: pattern == 2 -> fill_auction_cancel_message(auction_cancel_message_sent, 255)
  :: else -> ramp_auction_cancel_message(auction_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_cancel_message(auction_cancel_message_sent);
    assert(at == 12);
    at = 0;
    decode_auction_cancel_message(auction_cancel_message_got);
    assert(at == 12);
    equal_auction_cancel_message(auction_cancel_message_got, auction_cancel_message_sent)
  }
}

/* Auction Trade Message: encoded, read back, and compared */
proctype check_auction_trade_message() {
  AuctionTradeMessage auction_trade_message_sent;
  AuctionTradeMessage auction_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_trade_message(auction_trade_message_sent, 0)
  :: pattern == 1 -> fill_auction_trade_message(auction_trade_message_sent, 32)
  :: pattern == 2 -> fill_auction_trade_message(auction_trade_message_sent, 255)
  :: else -> ramp_auction_trade_message(auction_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_trade_message(auction_trade_message_sent);
    assert(at == 32);
    at = 0;
    decode_auction_trade_message(auction_trade_message_got);
    assert(at == 32);
    equal_auction_trade_message(auction_trade_message_got, auction_trade_message_sent)
  }
}

/* Soq Strike Range Update Message: encoded, read back, and compared */
proctype check_soq_strike_range_update_message() {
  SoqStrikeRangeUpdateMessage soq_strike_range_update_message_sent;
  SoqStrikeRangeUpdateMessage soq_strike_range_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_soq_strike_range_update_message(soq_strike_range_update_message_sent, 0)
  :: pattern == 1 -> fill_soq_strike_range_update_message(soq_strike_range_update_message_sent, 32)
  :: pattern == 2 -> fill_soq_strike_range_update_message(soq_strike_range_update_message_sent, 255)
  :: else -> ramp_soq_strike_range_update_message(soq_strike_range_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_soq_strike_range_update_message(soq_strike_range_update_message_sent);
    assert(at == 40);
    at = 0;
    decode_soq_strike_range_update_message(soq_strike_range_update_message_got);
    assert(at == 40);
    equal_soq_strike_range_update_message(soq_strike_range_update_message_got, soq_strike_range_update_message_sent)
  }
}

/* Constituent Symbol Mapping Message: encoded, read back, and compared */
proctype check_constituent_symbol_mapping_message() {
  ConstituentSymbolMappingMessage constituent_symbol_mapping_message_sent;
  ConstituentSymbolMappingMessage constituent_symbol_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_constituent_symbol_mapping_message(constituent_symbol_mapping_message_sent, 0)
  :: pattern == 1 -> fill_constituent_symbol_mapping_message(constituent_symbol_mapping_message_sent, 32)
  :: pattern == 2 -> fill_constituent_symbol_mapping_message(constituent_symbol_mapping_message_sent, 255)
  :: else -> ramp_constituent_symbol_mapping_message(constituent_symbol_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_constituent_symbol_mapping_message(constituent_symbol_mapping_message_sent);
    assert(at == 56);
    at = 0;
    decode_constituent_symbol_mapping_message(constituent_symbol_mapping_message_got);
    assert(at == 56);
    equal_constituent_symbol_mapping_message(constituent_symbol_mapping_message_got, constituent_symbol_mapping_message_sent)
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
  :: run check_time_message()
  :: run check_unit_clear_message()
  :: run check_transaction_begin_message()
  :: run check_transaction_end_message()
  :: run check_order_executed_message()
  :: run check_order_executed_at_price_size_message()
  :: run check_reduce_size_long_message()
  :: run check_reduce_size_short_message()
  :: run check_delete_order_message()
  :: run check_trade_long_message()
  :: run check_trade_short_message()
  :: run check_trade_expanded_message()
  :: run check_trade_break_message()
  :: run check_end_of_session_message()
  :: run check_symbol_mapping_message()
  :: run check_trading_status_message()
  :: run check_width_update_message()
  :: run check_options_auction_update_message()
  :: run check_auction_summary_message()
  :: run check_auction_notification_message()
  :: run check_auction_cancel_message()
  :: run check_auction_trade_message()
  :: run check_soq_strike_range_update_message()
  :: run check_constituent_symbol_mapping_message()
  fi
}
