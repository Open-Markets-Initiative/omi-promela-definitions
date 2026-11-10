/*
 * Chicago Board Options Exchange Futures Multicast Depth Of Book
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 38

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

/* The Login Response message is sent by the Spin Server to a user's process in response to a Login message. */
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

/* The Spin Response message is sent in response to a participant's Spin Request message indicating whether a spin will be sent. */
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

/* The Spin Finished message is sent to indicate that all messages for the spin requested have been sent. A Spin Finished message is only sent if a Spin Request was not rejected. Upon receipt of a Spin Finished message, any buffered multicast messages should be applied to the participant's copy of the book to make it current. */
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

/* ---- Time Reference Message: 16 bytes ---------------------------------------- */

/* The Time Reference message is used to provide a midnight reference point for recipients of the feed. It is sent whenever the system starts up and when the system crosses a midnight boundary. */
typedef TimeReferenceMessage {
  byte midnight_reference[4];
  byte time_reference[4];
  byte time_offset[4];
  byte trade_date[4]
};

int time_reference_message_at;

/* every byte of Time Reference Message set to one value */
inline fill_time_reference_message(time_reference_message_record, time_reference_message_value) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.midnight_reference[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_reference[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_offset[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.trade_date[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Reference Message set to where it lies, so a field read out of place says so */
inline ramp_time_reference_message(time_reference_message_record, time_reference_message_base) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.midnight_reference[time_reference_message_at] = (time_reference_message_base + 0 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_reference[time_reference_message_at] = (time_reference_message_base + 4 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_offset[time_reference_message_at] = (time_reference_message_base + 8 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.trade_date[time_reference_message_at] = (time_reference_message_base + 12 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Reference Message to the wire, 16 bytes from where the cursor stands */
inline encode_time_reference_message(time_reference_message_record) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.midnight_reference[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.time_reference[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.time_offset[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.trade_date[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Reference Message off the wire, 16 bytes from where the cursor stands */
inline decode_time_reference_message(time_reference_message_record) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.midnight_reference[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_reference[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_offset[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.trade_date[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Reference Message is what was written, byte for byte */
inline equal_time_reference_message(time_reference_message_read, time_reference_message_written) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.midnight_reference[time_reference_message_at] == time_reference_message_written.midnight_reference[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.time_reference[time_reference_message_at] == time_reference_message_written.time_reference[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.time_offset[time_reference_message_at] == time_reference_message_written.time_offset[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.trade_date[time_reference_message_at] == time_reference_message_written.trade_date[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Time Message: 8 bytes --------------------------------------------------- */

/* A Time message is immediately generated and sent when there is a PITCH event for a given clock second. */
typedef TimeMessage {
  byte time_reference[4];
  byte epoch_time[4]
};

int time_message_at;

/* every byte of Time Message set to one value */
inline fill_time_message(time_message_record, time_message_value) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time_reference[time_message_at] = time_message_value; time_message_at = time_message_at + 1
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
  :: time_message_at < 4 -> time_message_record.time_reference[time_message_at] = (time_message_base + 0 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
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
  :: time_message_at < 4 -> wire[at] = time_message_record.time_reference[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
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
  :: time_message_at < 4 -> time_message_record.time_reference[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
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
  :: time_message_at < 4 -> assert(time_message_read.time_reference[time_message_at] == time_message_written.time_reference[time_message_at]); time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> assert(time_message_read.epoch_time[time_message_at] == time_message_written.epoch_time[time_message_at]); time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Futures Variance Symbol Mapping Message: 38 bytes ----------------------- */

/* The Futures Variance Symbol Mapping message is used to disseminate symbol reference data for S&P 500 Variance Futures (VA Futures) symbols. */
typedef FuturesVarianceSymbolMappingMessage {
  byte time_offset[4];
  byte unit_timestamp[4];
  byte feed_symbol[6];
  byte futures_symbol[12];
  byte accrued_day_variance[8];
  byte num_final_returns[2];
  byte num_elapsed_returns[2]
};

int futures_variance_symbol_mapping_message_at;

/* every byte of Futures Variance Symbol Mapping Message set to one value */
inline fill_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_record, futures_variance_symbol_mapping_message_value) {
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> futures_variance_symbol_mapping_message_record.time_offset[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> futures_variance_symbol_mapping_message_record.unit_timestamp[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 6 -> futures_variance_symbol_mapping_message_record.feed_symbol[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 12 -> futures_variance_symbol_mapping_message_record.futures_symbol[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 8 -> futures_variance_symbol_mapping_message_record.accrued_day_variance[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> futures_variance_symbol_mapping_message_record.num_final_returns[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> futures_variance_symbol_mapping_message_record.num_elapsed_returns[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Futures Variance Symbol Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_record, futures_variance_symbol_mapping_message_base) {
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> futures_variance_symbol_mapping_message_record.time_offset[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 0 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> futures_variance_symbol_mapping_message_record.unit_timestamp[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 4 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 6 -> futures_variance_symbol_mapping_message_record.feed_symbol[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 8 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 12 -> futures_variance_symbol_mapping_message_record.futures_symbol[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 14 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 8 -> futures_variance_symbol_mapping_message_record.accrued_day_variance[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 26 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> futures_variance_symbol_mapping_message_record.num_final_returns[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 34 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> futures_variance_symbol_mapping_message_record.num_elapsed_returns[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 36 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Futures Variance Symbol Mapping Message to the wire, 38 bytes from where the cursor stands */
inline encode_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_record) {
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> wire[at] = futures_variance_symbol_mapping_message_record.time_offset[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> wire[at] = futures_variance_symbol_mapping_message_record.unit_timestamp[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 6 -> wire[at] = futures_variance_symbol_mapping_message_record.feed_symbol[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 12 -> wire[at] = futures_variance_symbol_mapping_message_record.futures_symbol[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 8 -> wire[at] = futures_variance_symbol_mapping_message_record.accrued_day_variance[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> wire[at] = futures_variance_symbol_mapping_message_record.num_final_returns[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> wire[at] = futures_variance_symbol_mapping_message_record.num_elapsed_returns[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Futures Variance Symbol Mapping Message off the wire, 38 bytes from where the cursor stands */
inline decode_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_record) {
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> futures_variance_symbol_mapping_message_record.time_offset[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> futures_variance_symbol_mapping_message_record.unit_timestamp[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 6 -> futures_variance_symbol_mapping_message_record.feed_symbol[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 12 -> futures_variance_symbol_mapping_message_record.futures_symbol[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 8 -> futures_variance_symbol_mapping_message_record.accrued_day_variance[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> futures_variance_symbol_mapping_message_record.num_final_returns[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> futures_variance_symbol_mapping_message_record.num_elapsed_returns[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Futures Variance Symbol Mapping Message is what was written, byte for byte */
inline equal_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_read, futures_variance_symbol_mapping_message_written) {
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> assert(futures_variance_symbol_mapping_message_read.time_offset[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.time_offset[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> assert(futures_variance_symbol_mapping_message_read.unit_timestamp[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.unit_timestamp[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 6 -> assert(futures_variance_symbol_mapping_message_read.feed_symbol[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.feed_symbol[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 12 -> assert(futures_variance_symbol_mapping_message_read.futures_symbol[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.futures_symbol[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 8 -> assert(futures_variance_symbol_mapping_message_read.accrued_day_variance[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.accrued_day_variance[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> assert(futures_variance_symbol_mapping_message_read.num_final_returns[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.num_final_returns[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> assert(futures_variance_symbol_mapping_message_read.num_elapsed_returns[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.num_elapsed_returns[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Long Message: 31 bytes ---------------------------------------- */

/* An Add Order message represents a newly accepted visible order on the CFE book. */
typedef AddOrderLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_long[4];
  byte symbol[6];
  byte price_long[8]
};

int add_order_long_message_at;

/* every byte of Add Order Long Message set to one value */
inline fill_add_order_long_message(add_order_long_message_record, add_order_long_message_value) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.time_offset[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.order_id[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.side_indicator = add_order_long_message_value;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.quantity_long[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> add_order_long_message_record.symbol[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.price_long[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Long Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_long_message(add_order_long_message_record, add_order_long_message_base) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.time_offset[add_order_long_message_at] = (add_order_long_message_base + 0 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.order_id[add_order_long_message_at] = (add_order_long_message_base + 4 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.side_indicator = (add_order_long_message_base + 12 + 1) % 256;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.quantity_long[add_order_long_message_at] = (add_order_long_message_base + 13 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> add_order_long_message_record.symbol[add_order_long_message_at] = (add_order_long_message_base + 17 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.price_long[add_order_long_message_at] = (add_order_long_message_base + 23 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Message to the wire, 31 bytes from where the cursor stands */
inline encode_add_order_long_message(add_order_long_message_record) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.time_offset[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> wire[at] = add_order_long_message_record.order_id[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_long_message_record.side_indicator; at = at + 1;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.quantity_long[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> wire[at] = add_order_long_message_record.symbol[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> wire[at] = add_order_long_message_record.price_long[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Message off the wire, 31 bytes from where the cursor stands */
inline decode_add_order_long_message(add_order_long_message_record) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.time_offset[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.order_id[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.side_indicator = wire[at]; at = at + 1;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.quantity_long[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> add_order_long_message_record.symbol[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.price_long[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Long Message is what was written, byte for byte */
inline equal_add_order_long_message(add_order_long_message_read, add_order_long_message_written) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.time_offset[add_order_long_message_at] == add_order_long_message_written.time_offset[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> assert(add_order_long_message_read.order_id[add_order_long_message_at] == add_order_long_message_written.order_id[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  assert(add_order_long_message_read.side_indicator == add_order_long_message_written.side_indicator);
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.quantity_long[add_order_long_message_at] == add_order_long_message_written.quantity_long[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> assert(add_order_long_message_read.symbol[add_order_long_message_at] == add_order_long_message_written.symbol[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> assert(add_order_long_message_read.price_long[add_order_long_message_at] == add_order_long_message_written.price_long[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Short Message: 23 bytes --------------------------------------- */

/* An Add Order message represents a newly accepted visible order on the CFE book. */
typedef AddOrderShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_short[2];
  byte symbol[6];
  byte price_short[2]
};

int add_order_short_message_at;

/* every byte of Add Order Short Message set to one value */
inline fill_add_order_short_message(add_order_short_message_record, add_order_short_message_value) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.time_offset[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> add_order_short_message_record.order_id[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.side_indicator = add_order_short_message_value;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.quantity_short[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.price_short[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Short Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_short_message(add_order_short_message_record, add_order_short_message_base) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.time_offset[add_order_short_message_at] = (add_order_short_message_base + 0 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> add_order_short_message_record.order_id[add_order_short_message_at] = (add_order_short_message_base + 4 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.side_indicator = (add_order_short_message_base + 12 + 1) % 256;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.quantity_short[add_order_short_message_at] = (add_order_short_message_base + 13 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol[add_order_short_message_at] = (add_order_short_message_base + 15 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.price_short[add_order_short_message_at] = (add_order_short_message_base + 21 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Message to the wire, 23 bytes from where the cursor stands */
inline encode_add_order_short_message(add_order_short_message_record) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> wire[at] = add_order_short_message_record.time_offset[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> wire[at] = add_order_short_message_record.order_id[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_short_message_record.side_indicator; at = at + 1;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> wire[at] = add_order_short_message_record.quantity_short[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> wire[at] = add_order_short_message_record.symbol[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> wire[at] = add_order_short_message_record.price_short[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Message off the wire, 23 bytes from where the cursor stands */
inline decode_add_order_short_message(add_order_short_message_record) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.time_offset[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> add_order_short_message_record.order_id[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.side_indicator = wire[at]; at = at + 1;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.quantity_short[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.price_short[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Short Message is what was written, byte for byte */
inline equal_add_order_short_message(add_order_short_message_read, add_order_short_message_written) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> assert(add_order_short_message_read.time_offset[add_order_short_message_at] == add_order_short_message_written.time_offset[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> assert(add_order_short_message_read.order_id[add_order_short_message_at] == add_order_short_message_written.order_id[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  assert(add_order_short_message_read.side_indicator == add_order_short_message_written.side_indicator);
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> assert(add_order_short_message_read.quantity_short[add_order_short_message_at] == add_order_short_message_written.quantity_short[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> assert(add_order_short_message_read.symbol[add_order_short_message_at] == add_order_short_message_written.symbol[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> assert(add_order_short_message_read.price_short[add_order_short_message_at] == add_order_short_message_written.price_short[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Message: 16 bytes ---------------------------------------- */

/* The Trading Status message is used to indicate the current trading status of a Futures contract. */
typedef TradingStatusMessage {
  byte time_offset[4];
  byte symbol[6];
  byte reserved_2[2];
  byte trading_status;
  byte reserved_3[3]
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved_3[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved_3[trading_status_message_at] = (trading_status_message_base + 13 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> wire[at] = trading_status_message_record.reserved_3[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved_3[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> assert(trading_status_message_read.reserved_3[trading_status_message_at] == trading_status_message_written.reserved_3[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Settlement Message: 23 bytes -------------------------------------------- */

/* Settlement messages are used to provide information concerning indicative, approved, or corrected daily and final settlement prices for CFE products. */
typedef SettlementMessage {
  byte time_offset[4];
  byte symbol[6];
  byte trade_date[4];
  byte settlement_price[8];
  byte issue
};

int settlement_message_at;

/* every byte of Settlement Message set to one value */
inline fill_settlement_message(settlement_message_record, settlement_message_value) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.time_offset[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> settlement_message_record.symbol[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.trade_date[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> settlement_message_record.settlement_price[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_record.issue = settlement_message_value;
  skip
}

/* each byte of Settlement Message set to where it lies, so a field read out of place says so */
inline ramp_settlement_message(settlement_message_record, settlement_message_base) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.time_offset[settlement_message_at] = (settlement_message_base + 0 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> settlement_message_record.symbol[settlement_message_at] = (settlement_message_base + 4 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.trade_date[settlement_message_at] = (settlement_message_base + 10 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> settlement_message_record.settlement_price[settlement_message_at] = (settlement_message_base + 14 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_record.issue = (settlement_message_base + 22 + 1) % 256;
  skip
}

/* Settlement Message to the wire, 23 bytes from where the cursor stands */
inline encode_settlement_message(settlement_message_record) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> wire[at] = settlement_message_record.time_offset[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> wire[at] = settlement_message_record.symbol[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> wire[at] = settlement_message_record.trade_date[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> wire[at] = settlement_message_record.settlement_price[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  wire[at] = settlement_message_record.issue; at = at + 1;
  skip
}

/* Settlement Message off the wire, 23 bytes from where the cursor stands */
inline decode_settlement_message(settlement_message_record) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.time_offset[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> settlement_message_record.symbol[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.trade_date[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> settlement_message_record.settlement_price[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_record.issue = wire[at]; at = at + 1;
  skip
}

/* what was read of Settlement Message is what was written, byte for byte */
inline equal_settlement_message(settlement_message_read, settlement_message_written) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> assert(settlement_message_read.time_offset[settlement_message_at] == settlement_message_written.time_offset[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> assert(settlement_message_read.symbol[settlement_message_at] == settlement_message_written.symbol[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> assert(settlement_message_read.trade_date[settlement_message_at] == settlement_message_written.trade_date[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> assert(settlement_message_read.settlement_price[settlement_message_at] == settlement_message_written.settlement_price[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  assert(settlement_message_read.issue == settlement_message_written.issue);
  skip
}

/* ---- Price Limits Message: 26 bytes ------------------------------------------ */

/* The Price Limits message is sent out at the start of a session for products subject to price limits per the contract specifications. */
typedef PriceLimitsMessage {
  byte time_offset[4];
  byte symbol[6];
  byte upper_price_limit[8];
  byte lower_price_limit[8]
};

int price_limits_message_at;

/* every byte of Price Limits Message set to one value */
inline fill_price_limits_message(price_limits_message_record, price_limits_message_value) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> price_limits_message_record.time_offset[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 6 -> price_limits_message_record.symbol[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.upper_price_limit[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.lower_price_limit[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Limits Message set to where it lies, so a field read out of place says so */
inline ramp_price_limits_message(price_limits_message_record, price_limits_message_base) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> price_limits_message_record.time_offset[price_limits_message_at] = (price_limits_message_base + 0 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 6 -> price_limits_message_record.symbol[price_limits_message_at] = (price_limits_message_base + 4 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.upper_price_limit[price_limits_message_at] = (price_limits_message_base + 10 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.lower_price_limit[price_limits_message_at] = (price_limits_message_base + 18 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Limits Message to the wire, 26 bytes from where the cursor stands */
inline encode_price_limits_message(price_limits_message_record) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> wire[at] = price_limits_message_record.time_offset[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 6 -> wire[at] = price_limits_message_record.symbol[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> wire[at] = price_limits_message_record.upper_price_limit[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> wire[at] = price_limits_message_record.lower_price_limit[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Limits Message off the wire, 26 bytes from where the cursor stands */
inline decode_price_limits_message(price_limits_message_record) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> price_limits_message_record.time_offset[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 6 -> price_limits_message_record.symbol[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.upper_price_limit[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.lower_price_limit[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Limits Message is what was written, byte for byte */
inline equal_price_limits_message(price_limits_message_read, price_limits_message_written) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> assert(price_limits_message_read.time_offset[price_limits_message_at] == price_limits_message_written.time_offset[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 6 -> assert(price_limits_message_read.symbol[price_limits_message_at] == price_limits_message_written.symbol[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> assert(price_limits_message_read.upper_price_limit[price_limits_message_at] == price_limits_message_written.upper_price_limit[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> assert(price_limits_message_read.lower_price_limit[price_limits_message_at] == price_limits_message_written.lower_price_limit[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
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

/* Time Reference Message: encoded, read back, and compared */
proctype check_time_reference_message() {
  TimeReferenceMessage time_reference_message_sent;
  TimeReferenceMessage time_reference_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time_reference_message(time_reference_message_sent, 0)
  :: pattern == 1 -> fill_time_reference_message(time_reference_message_sent, 32)
  :: pattern == 2 -> fill_time_reference_message(time_reference_message_sent, 255)
  :: else -> ramp_time_reference_message(time_reference_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time_reference_message(time_reference_message_sent);
    assert(at == 16);
    at = 0;
    decode_time_reference_message(time_reference_message_got);
    assert(at == 16);
    equal_time_reference_message(time_reference_message_got, time_reference_message_sent)
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

/* Futures Variance Symbol Mapping Message: encoded, read back, and compared */
proctype check_futures_variance_symbol_mapping_message() {
  FuturesVarianceSymbolMappingMessage futures_variance_symbol_mapping_message_sent;
  FuturesVarianceSymbolMappingMessage futures_variance_symbol_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_sent, 0)
  :: pattern == 1 -> fill_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_sent, 32)
  :: pattern == 2 -> fill_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_sent, 255)
  :: else -> ramp_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_sent);
    assert(at == 38);
    at = 0;
    decode_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_got);
    assert(at == 38);
    equal_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_got, futures_variance_symbol_mapping_message_sent)
  }
}

/* Add Order Long Message: encoded, read back, and compared */
proctype check_add_order_long_message() {
  AddOrderLongMessage add_order_long_message_sent;
  AddOrderLongMessage add_order_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_long_message(add_order_long_message_sent, 0)
  :: pattern == 1 -> fill_add_order_long_message(add_order_long_message_sent, 32)
  :: pattern == 2 -> fill_add_order_long_message(add_order_long_message_sent, 255)
  :: else -> ramp_add_order_long_message(add_order_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_long_message(add_order_long_message_sent);
    assert(at == 31);
    at = 0;
    decode_add_order_long_message(add_order_long_message_got);
    assert(at == 31);
    equal_add_order_long_message(add_order_long_message_got, add_order_long_message_sent)
  }
}

/* Add Order Short Message: encoded, read back, and compared */
proctype check_add_order_short_message() {
  AddOrderShortMessage add_order_short_message_sent;
  AddOrderShortMessage add_order_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_short_message(add_order_short_message_sent, 0)
  :: pattern == 1 -> fill_add_order_short_message(add_order_short_message_sent, 32)
  :: pattern == 2 -> fill_add_order_short_message(add_order_short_message_sent, 255)
  :: else -> ramp_add_order_short_message(add_order_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_short_message(add_order_short_message_sent);
    assert(at == 23);
    at = 0;
    decode_add_order_short_message(add_order_short_message_got);
    assert(at == 23);
    equal_add_order_short_message(add_order_short_message_got, add_order_short_message_sent)
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

/* Settlement Message: encoded, read back, and compared */
proctype check_settlement_message() {
  SettlementMessage settlement_message_sent;
  SettlementMessage settlement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_settlement_message(settlement_message_sent, 0)
  :: pattern == 1 -> fill_settlement_message(settlement_message_sent, 32)
  :: pattern == 2 -> fill_settlement_message(settlement_message_sent, 255)
  :: else -> ramp_settlement_message(settlement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_settlement_message(settlement_message_sent);
    assert(at == 23);
    at = 0;
    decode_settlement_message(settlement_message_got);
    assert(at == 23);
    equal_settlement_message(settlement_message_got, settlement_message_sent)
  }
}

/* Price Limits Message: encoded, read back, and compared */
proctype check_price_limits_message() {
  PriceLimitsMessage price_limits_message_sent;
  PriceLimitsMessage price_limits_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_limits_message(price_limits_message_sent, 0)
  :: pattern == 1 -> fill_price_limits_message(price_limits_message_sent, 32)
  :: pattern == 2 -> fill_price_limits_message(price_limits_message_sent, 255)
  :: else -> ramp_price_limits_message(price_limits_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_limits_message(price_limits_message_sent);
    assert(at == 26);
    at = 0;
    decode_price_limits_message(price_limits_message_got);
    assert(at == 26);
    equal_price_limits_message(price_limits_message_got, price_limits_message_sent)
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
  :: run check_time_reference_message()
  :: run check_time_message()
  :: run check_futures_variance_symbol_mapping_message()
  :: run check_add_order_long_message()
  :: run check_add_order_short_message()
  :: run check_trading_status_message()
  :: run check_settlement_message()
  :: run check_price_limits_message()
  fi
}
