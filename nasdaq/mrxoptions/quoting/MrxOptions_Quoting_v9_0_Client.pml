/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Specialized Quote Interface
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 74

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Client Packet Header: 3 bytes ------------------------------------------- */

/* Packet header of a packet sent by the client */
typedef ClientPacketHeader {
  byte packet_length[2];
  byte client_packet_type
};

int client_packet_header_at;

/* every byte of Client Packet Header set to one value */
inline fill_client_packet_header(client_packet_header_record, client_packet_header_value) {
  client_packet_header_at = 0;
  do
  :: client_packet_header_at < 2 -> client_packet_header_record.packet_length[client_packet_header_at] = client_packet_header_value; client_packet_header_at = client_packet_header_at + 1
  :: else -> break
  od;
  client_packet_header_record.client_packet_type = client_packet_header_value;
  skip
}

/* each byte of Client Packet Header set to where it lies, so a field read out of place says so */
inline ramp_client_packet_header(client_packet_header_record, client_packet_header_base) {
  client_packet_header_at = 0;
  do
  :: client_packet_header_at < 2 -> client_packet_header_record.packet_length[client_packet_header_at] = (client_packet_header_base + 0 + client_packet_header_at + 1) % 256; client_packet_header_at = client_packet_header_at + 1
  :: else -> break
  od;
  client_packet_header_record.client_packet_type = (client_packet_header_base + 2 + 1) % 256;
  skip
}

/* Client Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_client_packet_header(client_packet_header_record) {
  client_packet_header_at = 0;
  do
  :: client_packet_header_at < 2 -> wire[at] = client_packet_header_record.packet_length[client_packet_header_at]; at = at + 1; client_packet_header_at = client_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = client_packet_header_record.client_packet_type; at = at + 1;
  skip
}

/* Client Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_client_packet_header(client_packet_header_record) {
  client_packet_header_at = 0;
  do
  :: client_packet_header_at < 2 -> client_packet_header_record.packet_length[client_packet_header_at] = wire[at]; at = at + 1; client_packet_header_at = client_packet_header_at + 1
  :: else -> break
  od;
  client_packet_header_record.client_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Client Packet Header is what was written, byte for byte */
inline equal_client_packet_header(client_packet_header_read, client_packet_header_written) {
  client_packet_header_at = 0;
  do
  :: client_packet_header_at < 2 -> assert(client_packet_header_read.packet_length[client_packet_header_at] == client_packet_header_written.packet_length[client_packet_header_at]); client_packet_header_at = client_packet_header_at + 1
  :: else -> break
  od;
  assert(client_packet_header_read.client_packet_type == client_packet_header_written.client_packet_type);
  skip
}

/* ---- Login Request Packet: 51 bytes ------------------------------------------ */

/* The SoupBinTCP client must send a Login Request Packet immediately upon establishing a new TCP/IP socket connection to the server */
typedef LoginRequestPacket {
  byte username[6];
  byte password[10];
  byte requested_session[10];
  byte requested_sequence_number[20];
  byte heartbeat_timeout[5]
};

int login_request_packet_at;

/* every byte of Login Request Packet set to one value */
inline fill_login_request_packet(login_request_packet_record, login_request_packet_value) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> login_request_packet_record.username[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.password[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_session[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 20 -> login_request_packet_record.requested_sequence_number[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 5 -> login_request_packet_record.heartbeat_timeout[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request Packet set to where it lies, so a field read out of place says so */
inline ramp_login_request_packet(login_request_packet_record, login_request_packet_base) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> login_request_packet_record.username[login_request_packet_at] = (login_request_packet_base + 0 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.password[login_request_packet_at] = (login_request_packet_base + 6 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_session[login_request_packet_at] = (login_request_packet_base + 16 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 20 -> login_request_packet_record.requested_sequence_number[login_request_packet_at] = (login_request_packet_base + 26 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 5 -> login_request_packet_record.heartbeat_timeout[login_request_packet_at] = (login_request_packet_base + 46 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Packet to the wire, 51 bytes from where the cursor stands */
inline encode_login_request_packet(login_request_packet_record) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> wire[at] = login_request_packet_record.username[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> wire[at] = login_request_packet_record.password[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> wire[at] = login_request_packet_record.requested_session[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 20 -> wire[at] = login_request_packet_record.requested_sequence_number[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 5 -> wire[at] = login_request_packet_record.heartbeat_timeout[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Packet off the wire, 51 bytes from where the cursor stands */
inline decode_login_request_packet(login_request_packet_record) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> login_request_packet_record.username[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.password[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_session[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 20 -> login_request_packet_record.requested_sequence_number[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 5 -> login_request_packet_record.heartbeat_timeout[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request Packet is what was written, byte for byte */
inline equal_login_request_packet(login_request_packet_read, login_request_packet_written) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> assert(login_request_packet_read.username[login_request_packet_at] == login_request_packet_written.username[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> assert(login_request_packet_read.password[login_request_packet_at] == login_request_packet_written.password[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> assert(login_request_packet_read.requested_session[login_request_packet_at] == login_request_packet_written.requested_session[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 20 -> assert(login_request_packet_read.requested_sequence_number[login_request_packet_at] == login_request_packet_written.requested_sequence_number[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 5 -> assert(login_request_packet_read.heartbeat_timeout[login_request_packet_at] == login_request_packet_written.heartbeat_timeout[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Notification Subscription Request Message: 36 bytes --------------------- */

/* Modifies the set of optional notification types delivered on the current session. */
typedef NotificationSubscriptionRequestMessage {
  byte badge[4];
  byte message_id[8];
  byte subscription[24]
};

int notification_subscription_request_message_at;

/* every byte of Notification Subscription Request Message set to one value */
inline fill_notification_subscription_request_message(notification_subscription_request_message_record, notification_subscription_request_message_value) {
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 4 -> notification_subscription_request_message_record.badge[notification_subscription_request_message_at] = notification_subscription_request_message_value; notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 8 -> notification_subscription_request_message_record.message_id[notification_subscription_request_message_at] = notification_subscription_request_message_value; notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 24 -> notification_subscription_request_message_record.subscription[notification_subscription_request_message_at] = notification_subscription_request_message_value; notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Notification Subscription Request Message set to where it lies, so a field read out of place says so */
inline ramp_notification_subscription_request_message(notification_subscription_request_message_record, notification_subscription_request_message_base) {
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 4 -> notification_subscription_request_message_record.badge[notification_subscription_request_message_at] = (notification_subscription_request_message_base + 0 + notification_subscription_request_message_at + 1) % 256; notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 8 -> notification_subscription_request_message_record.message_id[notification_subscription_request_message_at] = (notification_subscription_request_message_base + 4 + notification_subscription_request_message_at + 1) % 256; notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 24 -> notification_subscription_request_message_record.subscription[notification_subscription_request_message_at] = (notification_subscription_request_message_base + 12 + notification_subscription_request_message_at + 1) % 256; notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Notification Subscription Request Message to the wire, 36 bytes from where the cursor stands */
inline encode_notification_subscription_request_message(notification_subscription_request_message_record) {
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 4 -> wire[at] = notification_subscription_request_message_record.badge[notification_subscription_request_message_at]; at = at + 1; notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 8 -> wire[at] = notification_subscription_request_message_record.message_id[notification_subscription_request_message_at]; at = at + 1; notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 24 -> wire[at] = notification_subscription_request_message_record.subscription[notification_subscription_request_message_at]; at = at + 1; notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Notification Subscription Request Message off the wire, 36 bytes from where the cursor stands */
inline decode_notification_subscription_request_message(notification_subscription_request_message_record) {
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 4 -> notification_subscription_request_message_record.badge[notification_subscription_request_message_at] = wire[at]; at = at + 1; notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 8 -> notification_subscription_request_message_record.message_id[notification_subscription_request_message_at] = wire[at]; at = at + 1; notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 24 -> notification_subscription_request_message_record.subscription[notification_subscription_request_message_at] = wire[at]; at = at + 1; notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Notification Subscription Request Message is what was written, byte for byte */
inline equal_notification_subscription_request_message(notification_subscription_request_message_read, notification_subscription_request_message_written) {
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 4 -> assert(notification_subscription_request_message_read.badge[notification_subscription_request_message_at] == notification_subscription_request_message_written.badge[notification_subscription_request_message_at]); notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 8 -> assert(notification_subscription_request_message_read.message_id[notification_subscription_request_message_at] == notification_subscription_request_message_written.message_id[notification_subscription_request_message_at]); notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  notification_subscription_request_message_at = 0;
  do
  :: notification_subscription_request_message_at < 24 -> assert(notification_subscription_request_message_read.subscription[notification_subscription_request_message_at] == notification_subscription_request_message_written.subscription[notification_subscription_request_message_at]); notification_subscription_request_message_at = notification_subscription_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mm Parameter Definition Request Message: 74 bytes ----------------------- */

/* Sets the Rapid Fire/Curtailment parameters (CumQty, Percentage, Delta, Vega and Interval) per underlying and instrument type. Rejected if the badge is configured for ActiveQP. */
typedef MmParameterDefinitionRequestMessage {
  byte badge[4];
  byte message_id[8];
  byte instrument_type;
  byte underlying[13];
  byte interval[2];
  byte percentage[2];
  byte cum_qty[4];
  byte delta[4];
  byte vega[4];
  byte reserved_32[32]
};

int mm_parameter_definition_request_message_at;

/* every byte of Mm Parameter Definition Request Message set to one value */
inline fill_mm_parameter_definition_request_message(mm_parameter_definition_request_message_record, mm_parameter_definition_request_message_value) {
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> mm_parameter_definition_request_message_record.badge[mm_parameter_definition_request_message_at] = mm_parameter_definition_request_message_value; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 8 -> mm_parameter_definition_request_message_record.message_id[mm_parameter_definition_request_message_at] = mm_parameter_definition_request_message_value; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_record.instrument_type = mm_parameter_definition_request_message_value;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 13 -> mm_parameter_definition_request_message_record.underlying[mm_parameter_definition_request_message_at] = mm_parameter_definition_request_message_value; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 2 -> mm_parameter_definition_request_message_record.interval[mm_parameter_definition_request_message_at] = mm_parameter_definition_request_message_value; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 2 -> mm_parameter_definition_request_message_record.percentage[mm_parameter_definition_request_message_at] = mm_parameter_definition_request_message_value; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> mm_parameter_definition_request_message_record.cum_qty[mm_parameter_definition_request_message_at] = mm_parameter_definition_request_message_value; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> mm_parameter_definition_request_message_record.delta[mm_parameter_definition_request_message_at] = mm_parameter_definition_request_message_value; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> mm_parameter_definition_request_message_record.vega[mm_parameter_definition_request_message_at] = mm_parameter_definition_request_message_value; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 32 -> mm_parameter_definition_request_message_record.reserved_32[mm_parameter_definition_request_message_at] = mm_parameter_definition_request_message_value; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mm Parameter Definition Request Message set to where it lies, so a field read out of place says so */
inline ramp_mm_parameter_definition_request_message(mm_parameter_definition_request_message_record, mm_parameter_definition_request_message_base) {
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> mm_parameter_definition_request_message_record.badge[mm_parameter_definition_request_message_at] = (mm_parameter_definition_request_message_base + 0 + mm_parameter_definition_request_message_at + 1) % 256; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 8 -> mm_parameter_definition_request_message_record.message_id[mm_parameter_definition_request_message_at] = (mm_parameter_definition_request_message_base + 4 + mm_parameter_definition_request_message_at + 1) % 256; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_record.instrument_type = (mm_parameter_definition_request_message_base + 12 + 1) % 256;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 13 -> mm_parameter_definition_request_message_record.underlying[mm_parameter_definition_request_message_at] = (mm_parameter_definition_request_message_base + 13 + mm_parameter_definition_request_message_at + 1) % 256; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 2 -> mm_parameter_definition_request_message_record.interval[mm_parameter_definition_request_message_at] = (mm_parameter_definition_request_message_base + 26 + mm_parameter_definition_request_message_at + 1) % 256; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 2 -> mm_parameter_definition_request_message_record.percentage[mm_parameter_definition_request_message_at] = (mm_parameter_definition_request_message_base + 28 + mm_parameter_definition_request_message_at + 1) % 256; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> mm_parameter_definition_request_message_record.cum_qty[mm_parameter_definition_request_message_at] = (mm_parameter_definition_request_message_base + 30 + mm_parameter_definition_request_message_at + 1) % 256; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> mm_parameter_definition_request_message_record.delta[mm_parameter_definition_request_message_at] = (mm_parameter_definition_request_message_base + 34 + mm_parameter_definition_request_message_at + 1) % 256; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> mm_parameter_definition_request_message_record.vega[mm_parameter_definition_request_message_at] = (mm_parameter_definition_request_message_base + 38 + mm_parameter_definition_request_message_at + 1) % 256; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 32 -> mm_parameter_definition_request_message_record.reserved_32[mm_parameter_definition_request_message_at] = (mm_parameter_definition_request_message_base + 42 + mm_parameter_definition_request_message_at + 1) % 256; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mm Parameter Definition Request Message to the wire, 74 bytes from where the cursor stands */
inline encode_mm_parameter_definition_request_message(mm_parameter_definition_request_message_record) {
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> wire[at] = mm_parameter_definition_request_message_record.badge[mm_parameter_definition_request_message_at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 8 -> wire[at] = mm_parameter_definition_request_message_record.message_id[mm_parameter_definition_request_message_at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  wire[at] = mm_parameter_definition_request_message_record.instrument_type; at = at + 1;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 13 -> wire[at] = mm_parameter_definition_request_message_record.underlying[mm_parameter_definition_request_message_at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 2 -> wire[at] = mm_parameter_definition_request_message_record.interval[mm_parameter_definition_request_message_at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 2 -> wire[at] = mm_parameter_definition_request_message_record.percentage[mm_parameter_definition_request_message_at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> wire[at] = mm_parameter_definition_request_message_record.cum_qty[mm_parameter_definition_request_message_at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> wire[at] = mm_parameter_definition_request_message_record.delta[mm_parameter_definition_request_message_at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> wire[at] = mm_parameter_definition_request_message_record.vega[mm_parameter_definition_request_message_at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 32 -> wire[at] = mm_parameter_definition_request_message_record.reserved_32[mm_parameter_definition_request_message_at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mm Parameter Definition Request Message off the wire, 74 bytes from where the cursor stands */
inline decode_mm_parameter_definition_request_message(mm_parameter_definition_request_message_record) {
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> mm_parameter_definition_request_message_record.badge[mm_parameter_definition_request_message_at] = wire[at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 8 -> mm_parameter_definition_request_message_record.message_id[mm_parameter_definition_request_message_at] = wire[at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_record.instrument_type = wire[at]; at = at + 1;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 13 -> mm_parameter_definition_request_message_record.underlying[mm_parameter_definition_request_message_at] = wire[at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 2 -> mm_parameter_definition_request_message_record.interval[mm_parameter_definition_request_message_at] = wire[at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 2 -> mm_parameter_definition_request_message_record.percentage[mm_parameter_definition_request_message_at] = wire[at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> mm_parameter_definition_request_message_record.cum_qty[mm_parameter_definition_request_message_at] = wire[at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> mm_parameter_definition_request_message_record.delta[mm_parameter_definition_request_message_at] = wire[at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> mm_parameter_definition_request_message_record.vega[mm_parameter_definition_request_message_at] = wire[at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 32 -> mm_parameter_definition_request_message_record.reserved_32[mm_parameter_definition_request_message_at] = wire[at]; at = at + 1; mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mm Parameter Definition Request Message is what was written, byte for byte */
inline equal_mm_parameter_definition_request_message(mm_parameter_definition_request_message_read, mm_parameter_definition_request_message_written) {
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> assert(mm_parameter_definition_request_message_read.badge[mm_parameter_definition_request_message_at] == mm_parameter_definition_request_message_written.badge[mm_parameter_definition_request_message_at]); mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 8 -> assert(mm_parameter_definition_request_message_read.message_id[mm_parameter_definition_request_message_at] == mm_parameter_definition_request_message_written.message_id[mm_parameter_definition_request_message_at]); mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  assert(mm_parameter_definition_request_message_read.instrument_type == mm_parameter_definition_request_message_written.instrument_type);
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 13 -> assert(mm_parameter_definition_request_message_read.underlying[mm_parameter_definition_request_message_at] == mm_parameter_definition_request_message_written.underlying[mm_parameter_definition_request_message_at]); mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 2 -> assert(mm_parameter_definition_request_message_read.interval[mm_parameter_definition_request_message_at] == mm_parameter_definition_request_message_written.interval[mm_parameter_definition_request_message_at]); mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 2 -> assert(mm_parameter_definition_request_message_read.percentage[mm_parameter_definition_request_message_at] == mm_parameter_definition_request_message_written.percentage[mm_parameter_definition_request_message_at]); mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> assert(mm_parameter_definition_request_message_read.cum_qty[mm_parameter_definition_request_message_at] == mm_parameter_definition_request_message_written.cum_qty[mm_parameter_definition_request_message_at]); mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> assert(mm_parameter_definition_request_message_read.delta[mm_parameter_definition_request_message_at] == mm_parameter_definition_request_message_written.delta[mm_parameter_definition_request_message_at]); mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 4 -> assert(mm_parameter_definition_request_message_read.vega[mm_parameter_definition_request_message_at] == mm_parameter_definition_request_message_written.vega[mm_parameter_definition_request_message_at]); mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  mm_parameter_definition_request_message_at = 0;
  do
  :: mm_parameter_definition_request_message_at < 32 -> assert(mm_parameter_definition_request_message_read.reserved_32[mm_parameter_definition_request_message_at] == mm_parameter_definition_request_message_written.reserved_32[mm_parameter_definition_request_message_at]); mm_parameter_definition_request_message_at = mm_parameter_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Active Qp Self Replenishment Set Limit Message: 29 bytes ---------------- */

/* ActiveQP/Self-Replenishment Set Limit Message: sets the contract limit for self-replenishment purge. */
typedef ActiveQpSelfReplenishmentSetLimitMessage {
  byte badge[4];
  byte message_id[8];
  byte underlying_symbol[13];
  byte set_value[4]
};

int active_qp_self_replenishment_set_limit_message_at;

/* every byte of Active Qp Self Replenishment Set Limit Message set to one value */
inline fill_active_qp_self_replenishment_set_limit_message(active_qp_self_replenishment_set_limit_message_record, active_qp_self_replenishment_set_limit_message_value) {
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 4 -> active_qp_self_replenishment_set_limit_message_record.badge[active_qp_self_replenishment_set_limit_message_at] = active_qp_self_replenishment_set_limit_message_value; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 8 -> active_qp_self_replenishment_set_limit_message_record.message_id[active_qp_self_replenishment_set_limit_message_at] = active_qp_self_replenishment_set_limit_message_value; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 13 -> active_qp_self_replenishment_set_limit_message_record.underlying_symbol[active_qp_self_replenishment_set_limit_message_at] = active_qp_self_replenishment_set_limit_message_value; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 4 -> active_qp_self_replenishment_set_limit_message_record.set_value[active_qp_self_replenishment_set_limit_message_at] = active_qp_self_replenishment_set_limit_message_value; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Active Qp Self Replenishment Set Limit Message set to where it lies, so a field read out of place says so */
inline ramp_active_qp_self_replenishment_set_limit_message(active_qp_self_replenishment_set_limit_message_record, active_qp_self_replenishment_set_limit_message_base) {
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 4 -> active_qp_self_replenishment_set_limit_message_record.badge[active_qp_self_replenishment_set_limit_message_at] = (active_qp_self_replenishment_set_limit_message_base + 0 + active_qp_self_replenishment_set_limit_message_at + 1) % 256; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 8 -> active_qp_self_replenishment_set_limit_message_record.message_id[active_qp_self_replenishment_set_limit_message_at] = (active_qp_self_replenishment_set_limit_message_base + 4 + active_qp_self_replenishment_set_limit_message_at + 1) % 256; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 13 -> active_qp_self_replenishment_set_limit_message_record.underlying_symbol[active_qp_self_replenishment_set_limit_message_at] = (active_qp_self_replenishment_set_limit_message_base + 12 + active_qp_self_replenishment_set_limit_message_at + 1) % 256; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 4 -> active_qp_self_replenishment_set_limit_message_record.set_value[active_qp_self_replenishment_set_limit_message_at] = (active_qp_self_replenishment_set_limit_message_base + 25 + active_qp_self_replenishment_set_limit_message_at + 1) % 256; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Qp Self Replenishment Set Limit Message to the wire, 29 bytes from where the cursor stands */
inline encode_active_qp_self_replenishment_set_limit_message(active_qp_self_replenishment_set_limit_message_record) {
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 4 -> wire[at] = active_qp_self_replenishment_set_limit_message_record.badge[active_qp_self_replenishment_set_limit_message_at]; at = at + 1; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 8 -> wire[at] = active_qp_self_replenishment_set_limit_message_record.message_id[active_qp_self_replenishment_set_limit_message_at]; at = at + 1; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 13 -> wire[at] = active_qp_self_replenishment_set_limit_message_record.underlying_symbol[active_qp_self_replenishment_set_limit_message_at]; at = at + 1; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 4 -> wire[at] = active_qp_self_replenishment_set_limit_message_record.set_value[active_qp_self_replenishment_set_limit_message_at]; at = at + 1; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Qp Self Replenishment Set Limit Message off the wire, 29 bytes from where the cursor stands */
inline decode_active_qp_self_replenishment_set_limit_message(active_qp_self_replenishment_set_limit_message_record) {
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 4 -> active_qp_self_replenishment_set_limit_message_record.badge[active_qp_self_replenishment_set_limit_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 8 -> active_qp_self_replenishment_set_limit_message_record.message_id[active_qp_self_replenishment_set_limit_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 13 -> active_qp_self_replenishment_set_limit_message_record.underlying_symbol[active_qp_self_replenishment_set_limit_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 4 -> active_qp_self_replenishment_set_limit_message_record.set_value[active_qp_self_replenishment_set_limit_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Active Qp Self Replenishment Set Limit Message is what was written, byte for byte */
inline equal_active_qp_self_replenishment_set_limit_message(active_qp_self_replenishment_set_limit_message_read, active_qp_self_replenishment_set_limit_message_written) {
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 4 -> assert(active_qp_self_replenishment_set_limit_message_read.badge[active_qp_self_replenishment_set_limit_message_at] == active_qp_self_replenishment_set_limit_message_written.badge[active_qp_self_replenishment_set_limit_message_at]); active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 8 -> assert(active_qp_self_replenishment_set_limit_message_read.message_id[active_qp_self_replenishment_set_limit_message_at] == active_qp_self_replenishment_set_limit_message_written.message_id[active_qp_self_replenishment_set_limit_message_at]); active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 13 -> assert(active_qp_self_replenishment_set_limit_message_read.underlying_symbol[active_qp_self_replenishment_set_limit_message_at] == active_qp_self_replenishment_set_limit_message_written.underlying_symbol[active_qp_self_replenishment_set_limit_message_at]); active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_set_limit_message_at = 0;
  do
  :: active_qp_self_replenishment_set_limit_message_at < 4 -> assert(active_qp_self_replenishment_set_limit_message_read.set_value[active_qp_self_replenishment_set_limit_message_at] == active_qp_self_replenishment_set_limit_message_written.set_value[active_qp_self_replenishment_set_limit_message_at]); active_qp_self_replenishment_set_limit_message_at = active_qp_self_replenishment_set_limit_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Underlying Purge Request Message: 34 bytes ------------------------------ */

/* Underlying Purge Message including SentTimestamp: pulls all quotes for all options contracts of the specified underlying and inhibits new quotes until reentry. */
typedef UnderlyingPurgeRequestMessage {
  byte badge[4];
  byte message_id[8];
  byte sent_timestamp[8];
  byte underlying_symbol[13];
  byte instrument_type
};

int underlying_purge_request_message_at;

/* every byte of Underlying Purge Request Message set to one value */
inline fill_underlying_purge_request_message(underlying_purge_request_message_record, underlying_purge_request_message_value) {
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 4 -> underlying_purge_request_message_record.badge[underlying_purge_request_message_at] = underlying_purge_request_message_value; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 8 -> underlying_purge_request_message_record.message_id[underlying_purge_request_message_at] = underlying_purge_request_message_value; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 8 -> underlying_purge_request_message_record.sent_timestamp[underlying_purge_request_message_at] = underlying_purge_request_message_value; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 13 -> underlying_purge_request_message_record.underlying_symbol[underlying_purge_request_message_at] = underlying_purge_request_message_value; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_record.instrument_type = underlying_purge_request_message_value;
  skip
}

/* each byte of Underlying Purge Request Message set to where it lies, so a field read out of place says so */
inline ramp_underlying_purge_request_message(underlying_purge_request_message_record, underlying_purge_request_message_base) {
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 4 -> underlying_purge_request_message_record.badge[underlying_purge_request_message_at] = (underlying_purge_request_message_base + 0 + underlying_purge_request_message_at + 1) % 256; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 8 -> underlying_purge_request_message_record.message_id[underlying_purge_request_message_at] = (underlying_purge_request_message_base + 4 + underlying_purge_request_message_at + 1) % 256; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 8 -> underlying_purge_request_message_record.sent_timestamp[underlying_purge_request_message_at] = (underlying_purge_request_message_base + 12 + underlying_purge_request_message_at + 1) % 256; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 13 -> underlying_purge_request_message_record.underlying_symbol[underlying_purge_request_message_at] = (underlying_purge_request_message_base + 20 + underlying_purge_request_message_at + 1) % 256; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_record.instrument_type = (underlying_purge_request_message_base + 33 + 1) % 256;
  skip
}

/* Underlying Purge Request Message to the wire, 34 bytes from where the cursor stands */
inline encode_underlying_purge_request_message(underlying_purge_request_message_record) {
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 4 -> wire[at] = underlying_purge_request_message_record.badge[underlying_purge_request_message_at]; at = at + 1; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 8 -> wire[at] = underlying_purge_request_message_record.message_id[underlying_purge_request_message_at]; at = at + 1; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 8 -> wire[at] = underlying_purge_request_message_record.sent_timestamp[underlying_purge_request_message_at]; at = at + 1; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 13 -> wire[at] = underlying_purge_request_message_record.underlying_symbol[underlying_purge_request_message_at]; at = at + 1; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_purge_request_message_record.instrument_type; at = at + 1;
  skip
}

/* Underlying Purge Request Message off the wire, 34 bytes from where the cursor stands */
inline decode_underlying_purge_request_message(underlying_purge_request_message_record) {
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 4 -> underlying_purge_request_message_record.badge[underlying_purge_request_message_at] = wire[at]; at = at + 1; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 8 -> underlying_purge_request_message_record.message_id[underlying_purge_request_message_at] = wire[at]; at = at + 1; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 8 -> underlying_purge_request_message_record.sent_timestamp[underlying_purge_request_message_at] = wire[at]; at = at + 1; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 13 -> underlying_purge_request_message_record.underlying_symbol[underlying_purge_request_message_at] = wire[at]; at = at + 1; underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_record.instrument_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Underlying Purge Request Message is what was written, byte for byte */
inline equal_underlying_purge_request_message(underlying_purge_request_message_read, underlying_purge_request_message_written) {
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 4 -> assert(underlying_purge_request_message_read.badge[underlying_purge_request_message_at] == underlying_purge_request_message_written.badge[underlying_purge_request_message_at]); underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 8 -> assert(underlying_purge_request_message_read.message_id[underlying_purge_request_message_at] == underlying_purge_request_message_written.message_id[underlying_purge_request_message_at]); underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 8 -> assert(underlying_purge_request_message_read.sent_timestamp[underlying_purge_request_message_at] == underlying_purge_request_message_written.sent_timestamp[underlying_purge_request_message_at]); underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  underlying_purge_request_message_at = 0;
  do
  :: underlying_purge_request_message_at < 13 -> assert(underlying_purge_request_message_read.underlying_symbol[underlying_purge_request_message_at] == underlying_purge_request_message_written.underlying_symbol[underlying_purge_request_message_at]); underlying_purge_request_message_at = underlying_purge_request_message_at + 1
  :: else -> break
  od;
  assert(underlying_purge_request_message_read.instrument_type == underlying_purge_request_message_written.instrument_type);
  skip
}

/* ---- Market Reentry Request Message: 26 bytes -------------------------------- */

/* Market Reentry Message: resets risk protection previously triggered by a Rapid Fire/Curtailment event or a user Purge request. */
typedef MarketReentryRequestMessage {
  byte badge[4];
  byte message_id[8];
  byte underlying_symbol[13];
  byte instrument_type
};

int market_reentry_request_message_at;

/* every byte of Market Reentry Request Message set to one value */
inline fill_market_reentry_request_message(market_reentry_request_message_record, market_reentry_request_message_value) {
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 4 -> market_reentry_request_message_record.badge[market_reentry_request_message_at] = market_reentry_request_message_value; market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 8 -> market_reentry_request_message_record.message_id[market_reentry_request_message_at] = market_reentry_request_message_value; market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 13 -> market_reentry_request_message_record.underlying_symbol[market_reentry_request_message_at] = market_reentry_request_message_value; market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  market_reentry_request_message_record.instrument_type = market_reentry_request_message_value;
  skip
}

/* each byte of Market Reentry Request Message set to where it lies, so a field read out of place says so */
inline ramp_market_reentry_request_message(market_reentry_request_message_record, market_reentry_request_message_base) {
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 4 -> market_reentry_request_message_record.badge[market_reentry_request_message_at] = (market_reentry_request_message_base + 0 + market_reentry_request_message_at + 1) % 256; market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 8 -> market_reentry_request_message_record.message_id[market_reentry_request_message_at] = (market_reentry_request_message_base + 4 + market_reentry_request_message_at + 1) % 256; market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 13 -> market_reentry_request_message_record.underlying_symbol[market_reentry_request_message_at] = (market_reentry_request_message_base + 12 + market_reentry_request_message_at + 1) % 256; market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  market_reentry_request_message_record.instrument_type = (market_reentry_request_message_base + 25 + 1) % 256;
  skip
}

/* Market Reentry Request Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_reentry_request_message(market_reentry_request_message_record) {
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 4 -> wire[at] = market_reentry_request_message_record.badge[market_reentry_request_message_at]; at = at + 1; market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 8 -> wire[at] = market_reentry_request_message_record.message_id[market_reentry_request_message_at]; at = at + 1; market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 13 -> wire[at] = market_reentry_request_message_record.underlying_symbol[market_reentry_request_message_at]; at = at + 1; market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  wire[at] = market_reentry_request_message_record.instrument_type; at = at + 1;
  skip
}

/* Market Reentry Request Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_reentry_request_message(market_reentry_request_message_record) {
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 4 -> market_reentry_request_message_record.badge[market_reentry_request_message_at] = wire[at]; at = at + 1; market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 8 -> market_reentry_request_message_record.message_id[market_reentry_request_message_at] = wire[at]; at = at + 1; market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 13 -> market_reentry_request_message_record.underlying_symbol[market_reentry_request_message_at] = wire[at]; at = at + 1; market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  market_reentry_request_message_record.instrument_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Reentry Request Message is what was written, byte for byte */
inline equal_market_reentry_request_message(market_reentry_request_message_read, market_reentry_request_message_written) {
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 4 -> assert(market_reentry_request_message_read.badge[market_reentry_request_message_at] == market_reentry_request_message_written.badge[market_reentry_request_message_at]); market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 8 -> assert(market_reentry_request_message_read.message_id[market_reentry_request_message_at] == market_reentry_request_message_written.message_id[market_reentry_request_message_at]); market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  market_reentry_request_message_at = 0;
  do
  :: market_reentry_request_message_at < 13 -> assert(market_reentry_request_message_read.underlying_symbol[market_reentry_request_message_at] == market_reentry_request_message_written.underlying_symbol[market_reentry_request_message_at]); market_reentry_request_message_at = market_reentry_request_message_at + 1
  :: else -> break
  od;
  assert(market_reentry_request_message_read.instrument_type == market_reentry_request_message_written.instrument_type);
  skip
}

/* ---- Active Qp Self Replenishment Request Reentry Message: 29 bytes ---------- */

/* ActiveQP/Self-Replenishment Request/Reentry Message: partial replenishment (removes a number of contracts from the Active QP counter) or full replenishment/reentry (value 0). */
typedef ActiveQpSelfReplenishmentRequestReentryMessage {
  byte badge[4];
  byte message_id[8];
  byte underlying_symbol[13];
  byte replenishment_value[4]
};

int active_qp_self_replenishment_request_reentry_message_at;

/* every byte of Active Qp Self Replenishment Request Reentry Message set to one value */
inline fill_active_qp_self_replenishment_request_reentry_message(active_qp_self_replenishment_request_reentry_message_record, active_qp_self_replenishment_request_reentry_message_value) {
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 4 -> active_qp_self_replenishment_request_reentry_message_record.badge[active_qp_self_replenishment_request_reentry_message_at] = active_qp_self_replenishment_request_reentry_message_value; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 8 -> active_qp_self_replenishment_request_reentry_message_record.message_id[active_qp_self_replenishment_request_reentry_message_at] = active_qp_self_replenishment_request_reentry_message_value; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 13 -> active_qp_self_replenishment_request_reentry_message_record.underlying_symbol[active_qp_self_replenishment_request_reentry_message_at] = active_qp_self_replenishment_request_reentry_message_value; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 4 -> active_qp_self_replenishment_request_reentry_message_record.replenishment_value[active_qp_self_replenishment_request_reentry_message_at] = active_qp_self_replenishment_request_reentry_message_value; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Active Qp Self Replenishment Request Reentry Message set to where it lies, so a field read out of place says so */
inline ramp_active_qp_self_replenishment_request_reentry_message(active_qp_self_replenishment_request_reentry_message_record, active_qp_self_replenishment_request_reentry_message_base) {
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 4 -> active_qp_self_replenishment_request_reentry_message_record.badge[active_qp_self_replenishment_request_reentry_message_at] = (active_qp_self_replenishment_request_reentry_message_base + 0 + active_qp_self_replenishment_request_reentry_message_at + 1) % 256; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 8 -> active_qp_self_replenishment_request_reentry_message_record.message_id[active_qp_self_replenishment_request_reentry_message_at] = (active_qp_self_replenishment_request_reentry_message_base + 4 + active_qp_self_replenishment_request_reentry_message_at + 1) % 256; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 13 -> active_qp_self_replenishment_request_reentry_message_record.underlying_symbol[active_qp_self_replenishment_request_reentry_message_at] = (active_qp_self_replenishment_request_reentry_message_base + 12 + active_qp_self_replenishment_request_reentry_message_at + 1) % 256; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 4 -> active_qp_self_replenishment_request_reentry_message_record.replenishment_value[active_qp_self_replenishment_request_reentry_message_at] = (active_qp_self_replenishment_request_reentry_message_base + 25 + active_qp_self_replenishment_request_reentry_message_at + 1) % 256; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Qp Self Replenishment Request Reentry Message to the wire, 29 bytes from where the cursor stands */
inline encode_active_qp_self_replenishment_request_reentry_message(active_qp_self_replenishment_request_reentry_message_record) {
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 4 -> wire[at] = active_qp_self_replenishment_request_reentry_message_record.badge[active_qp_self_replenishment_request_reentry_message_at]; at = at + 1; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 8 -> wire[at] = active_qp_self_replenishment_request_reentry_message_record.message_id[active_qp_self_replenishment_request_reentry_message_at]; at = at + 1; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 13 -> wire[at] = active_qp_self_replenishment_request_reentry_message_record.underlying_symbol[active_qp_self_replenishment_request_reentry_message_at]; at = at + 1; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 4 -> wire[at] = active_qp_self_replenishment_request_reentry_message_record.replenishment_value[active_qp_self_replenishment_request_reentry_message_at]; at = at + 1; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Qp Self Replenishment Request Reentry Message off the wire, 29 bytes from where the cursor stands */
inline decode_active_qp_self_replenishment_request_reentry_message(active_qp_self_replenishment_request_reentry_message_record) {
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 4 -> active_qp_self_replenishment_request_reentry_message_record.badge[active_qp_self_replenishment_request_reentry_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 8 -> active_qp_self_replenishment_request_reentry_message_record.message_id[active_qp_self_replenishment_request_reentry_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 13 -> active_qp_self_replenishment_request_reentry_message_record.underlying_symbol[active_qp_self_replenishment_request_reentry_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 4 -> active_qp_self_replenishment_request_reentry_message_record.replenishment_value[active_qp_self_replenishment_request_reentry_message_at] = wire[at]; at = at + 1; active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Active Qp Self Replenishment Request Reentry Message is what was written, byte for byte */
inline equal_active_qp_self_replenishment_request_reentry_message(active_qp_self_replenishment_request_reentry_message_read, active_qp_self_replenishment_request_reentry_message_written) {
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 4 -> assert(active_qp_self_replenishment_request_reentry_message_read.badge[active_qp_self_replenishment_request_reentry_message_at] == active_qp_self_replenishment_request_reentry_message_written.badge[active_qp_self_replenishment_request_reentry_message_at]); active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 8 -> assert(active_qp_self_replenishment_request_reentry_message_read.message_id[active_qp_self_replenishment_request_reentry_message_at] == active_qp_self_replenishment_request_reentry_message_written.message_id[active_qp_self_replenishment_request_reentry_message_at]); active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 13 -> assert(active_qp_self_replenishment_request_reentry_message_read.underlying_symbol[active_qp_self_replenishment_request_reentry_message_at] == active_qp_self_replenishment_request_reentry_message_written.underlying_symbol[active_qp_self_replenishment_request_reentry_message_at]); active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  active_qp_self_replenishment_request_reentry_message_at = 0;
  do
  :: active_qp_self_replenishment_request_reentry_message_at < 4 -> assert(active_qp_self_replenishment_request_reentry_message_read.replenishment_value[active_qp_self_replenishment_request_reentry_message_at] == active_qp_self_replenishment_request_reentry_message_written.replenishment_value[active_qp_self_replenishment_request_reentry_message_at]); active_qp_self_replenishment_request_reentry_message_at = active_qp_self_replenishment_request_reentry_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Msar Request Message: 30 bytes ----------------------------------- */

/* SQF Market Sweep and Auction Response (MSAR) request for a simple instrument. A size of zero cancels a prior auction response for the same instrument/price/side. */
typedef SimpleMsarRequestMessage {
  byte badge[4];
  byte message_id[8];
  byte instrument_id[4];
  byte msar_type;
  byte auction_id[4];
  byte price[4];
  byte side;
  byte contracts[4]
};

int simple_msar_request_message_at;

/* every byte of Simple Msar Request Message set to one value */
inline fill_simple_msar_request_message(simple_msar_request_message_record, simple_msar_request_message_value) {
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.badge[simple_msar_request_message_at] = simple_msar_request_message_value; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 8 -> simple_msar_request_message_record.message_id[simple_msar_request_message_at] = simple_msar_request_message_value; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.instrument_id[simple_msar_request_message_at] = simple_msar_request_message_value; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_record.msar_type = simple_msar_request_message_value;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.auction_id[simple_msar_request_message_at] = simple_msar_request_message_value; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.price[simple_msar_request_message_at] = simple_msar_request_message_value; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_record.side = simple_msar_request_message_value;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.contracts[simple_msar_request_message_at] = simple_msar_request_message_value; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Msar Request Message set to where it lies, so a field read out of place says so */
inline ramp_simple_msar_request_message(simple_msar_request_message_record, simple_msar_request_message_base) {
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.badge[simple_msar_request_message_at] = (simple_msar_request_message_base + 0 + simple_msar_request_message_at + 1) % 256; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 8 -> simple_msar_request_message_record.message_id[simple_msar_request_message_at] = (simple_msar_request_message_base + 4 + simple_msar_request_message_at + 1) % 256; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.instrument_id[simple_msar_request_message_at] = (simple_msar_request_message_base + 12 + simple_msar_request_message_at + 1) % 256; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_record.msar_type = (simple_msar_request_message_base + 16 + 1) % 256;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.auction_id[simple_msar_request_message_at] = (simple_msar_request_message_base + 17 + simple_msar_request_message_at + 1) % 256; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.price[simple_msar_request_message_at] = (simple_msar_request_message_base + 21 + simple_msar_request_message_at + 1) % 256; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_record.side = (simple_msar_request_message_base + 25 + 1) % 256;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.contracts[simple_msar_request_message_at] = (simple_msar_request_message_base + 26 + simple_msar_request_message_at + 1) % 256; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Msar Request Message to the wire, 30 bytes from where the cursor stands */
inline encode_simple_msar_request_message(simple_msar_request_message_record) {
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> wire[at] = simple_msar_request_message_record.badge[simple_msar_request_message_at]; at = at + 1; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 8 -> wire[at] = simple_msar_request_message_record.message_id[simple_msar_request_message_at]; at = at + 1; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> wire[at] = simple_msar_request_message_record.instrument_id[simple_msar_request_message_at]; at = at + 1; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_msar_request_message_record.msar_type; at = at + 1;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> wire[at] = simple_msar_request_message_record.auction_id[simple_msar_request_message_at]; at = at + 1; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> wire[at] = simple_msar_request_message_record.price[simple_msar_request_message_at]; at = at + 1; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_msar_request_message_record.side; at = at + 1;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> wire[at] = simple_msar_request_message_record.contracts[simple_msar_request_message_at]; at = at + 1; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Msar Request Message off the wire, 30 bytes from where the cursor stands */
inline decode_simple_msar_request_message(simple_msar_request_message_record) {
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.badge[simple_msar_request_message_at] = wire[at]; at = at + 1; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 8 -> simple_msar_request_message_record.message_id[simple_msar_request_message_at] = wire[at]; at = at + 1; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.instrument_id[simple_msar_request_message_at] = wire[at]; at = at + 1; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_record.msar_type = wire[at]; at = at + 1;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.auction_id[simple_msar_request_message_at] = wire[at]; at = at + 1; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.price[simple_msar_request_message_at] = wire[at]; at = at + 1; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_record.side = wire[at]; at = at + 1;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> simple_msar_request_message_record.contracts[simple_msar_request_message_at] = wire[at]; at = at + 1; simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Msar Request Message is what was written, byte for byte */
inline equal_simple_msar_request_message(simple_msar_request_message_read, simple_msar_request_message_written) {
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> assert(simple_msar_request_message_read.badge[simple_msar_request_message_at] == simple_msar_request_message_written.badge[simple_msar_request_message_at]); simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 8 -> assert(simple_msar_request_message_read.message_id[simple_msar_request_message_at] == simple_msar_request_message_written.message_id[simple_msar_request_message_at]); simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> assert(simple_msar_request_message_read.instrument_id[simple_msar_request_message_at] == simple_msar_request_message_written.instrument_id[simple_msar_request_message_at]); simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  assert(simple_msar_request_message_read.msar_type == simple_msar_request_message_written.msar_type);
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> assert(simple_msar_request_message_read.auction_id[simple_msar_request_message_at] == simple_msar_request_message_written.auction_id[simple_msar_request_message_at]); simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> assert(simple_msar_request_message_read.price[simple_msar_request_message_at] == simple_msar_request_message_written.price[simple_msar_request_message_at]); simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  assert(simple_msar_request_message_read.side == simple_msar_request_message_written.side);
  simple_msar_request_message_at = 0;
  do
  :: simple_msar_request_message_at < 4 -> assert(simple_msar_request_message_read.contracts[simple_msar_request_message_at] == simple_msar_request_message_written.contracts[simple_msar_request_message_at]); simple_msar_request_message_at = simple_msar_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Msar Request Message: 36 bytes ---------------------------------- */

/* MSAR request for a complex instrument. Price cannot be negative; the Debit/Credit indicator gives the sign. */
typedef ComplexMsarRequestMessage {
  byte badge[4];
  byte message_id[8];
  byte instrument_id[4];
  byte msar_type;
  byte auction_id[4];
  byte price[4];
  byte side;
  byte debit_credit;
  byte contracts[4];
  byte price_protection;
  byte reserved_4[4]
};

int complex_msar_request_message_at;

/* every byte of Complex Msar Request Message set to one value */
inline fill_complex_msar_request_message(complex_msar_request_message_record, complex_msar_request_message_value) {
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.badge[complex_msar_request_message_at] = complex_msar_request_message_value; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 8 -> complex_msar_request_message_record.message_id[complex_msar_request_message_at] = complex_msar_request_message_value; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.instrument_id[complex_msar_request_message_at] = complex_msar_request_message_value; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_record.msar_type = complex_msar_request_message_value;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.auction_id[complex_msar_request_message_at] = complex_msar_request_message_value; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.price[complex_msar_request_message_at] = complex_msar_request_message_value; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_record.side = complex_msar_request_message_value;
  complex_msar_request_message_record.debit_credit = complex_msar_request_message_value;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.contracts[complex_msar_request_message_at] = complex_msar_request_message_value; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_record.price_protection = complex_msar_request_message_value;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.reserved_4[complex_msar_request_message_at] = complex_msar_request_message_value; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Msar Request Message set to where it lies, so a field read out of place says so */
inline ramp_complex_msar_request_message(complex_msar_request_message_record, complex_msar_request_message_base) {
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.badge[complex_msar_request_message_at] = (complex_msar_request_message_base + 0 + complex_msar_request_message_at + 1) % 256; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 8 -> complex_msar_request_message_record.message_id[complex_msar_request_message_at] = (complex_msar_request_message_base + 4 + complex_msar_request_message_at + 1) % 256; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.instrument_id[complex_msar_request_message_at] = (complex_msar_request_message_base + 12 + complex_msar_request_message_at + 1) % 256; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_record.msar_type = (complex_msar_request_message_base + 16 + 1) % 256;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.auction_id[complex_msar_request_message_at] = (complex_msar_request_message_base + 17 + complex_msar_request_message_at + 1) % 256; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.price[complex_msar_request_message_at] = (complex_msar_request_message_base + 21 + complex_msar_request_message_at + 1) % 256; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_record.side = (complex_msar_request_message_base + 25 + 1) % 256;
  complex_msar_request_message_record.debit_credit = (complex_msar_request_message_base + 26 + 1) % 256;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.contracts[complex_msar_request_message_at] = (complex_msar_request_message_base + 27 + complex_msar_request_message_at + 1) % 256; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_record.price_protection = (complex_msar_request_message_base + 31 + 1) % 256;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.reserved_4[complex_msar_request_message_at] = (complex_msar_request_message_base + 32 + complex_msar_request_message_at + 1) % 256; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Msar Request Message to the wire, 36 bytes from where the cursor stands */
inline encode_complex_msar_request_message(complex_msar_request_message_record) {
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> wire[at] = complex_msar_request_message_record.badge[complex_msar_request_message_at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 8 -> wire[at] = complex_msar_request_message_record.message_id[complex_msar_request_message_at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> wire[at] = complex_msar_request_message_record.instrument_id[complex_msar_request_message_at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_request_message_record.msar_type; at = at + 1;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> wire[at] = complex_msar_request_message_record.auction_id[complex_msar_request_message_at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> wire[at] = complex_msar_request_message_record.price[complex_msar_request_message_at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_request_message_record.side; at = at + 1;
  wire[at] = complex_msar_request_message_record.debit_credit; at = at + 1;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> wire[at] = complex_msar_request_message_record.contracts[complex_msar_request_message_at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_msar_request_message_record.price_protection; at = at + 1;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> wire[at] = complex_msar_request_message_record.reserved_4[complex_msar_request_message_at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Msar Request Message off the wire, 36 bytes from where the cursor stands */
inline decode_complex_msar_request_message(complex_msar_request_message_record) {
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.badge[complex_msar_request_message_at] = wire[at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 8 -> complex_msar_request_message_record.message_id[complex_msar_request_message_at] = wire[at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.instrument_id[complex_msar_request_message_at] = wire[at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_record.msar_type = wire[at]; at = at + 1;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.auction_id[complex_msar_request_message_at] = wire[at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.price[complex_msar_request_message_at] = wire[at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_record.side = wire[at]; at = at + 1;
  complex_msar_request_message_record.debit_credit = wire[at]; at = at + 1;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.contracts[complex_msar_request_message_at] = wire[at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_record.price_protection = wire[at]; at = at + 1;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> complex_msar_request_message_record.reserved_4[complex_msar_request_message_at] = wire[at]; at = at + 1; complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Msar Request Message is what was written, byte for byte */
inline equal_complex_msar_request_message(complex_msar_request_message_read, complex_msar_request_message_written) {
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> assert(complex_msar_request_message_read.badge[complex_msar_request_message_at] == complex_msar_request_message_written.badge[complex_msar_request_message_at]); complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 8 -> assert(complex_msar_request_message_read.message_id[complex_msar_request_message_at] == complex_msar_request_message_written.message_id[complex_msar_request_message_at]); complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> assert(complex_msar_request_message_read.instrument_id[complex_msar_request_message_at] == complex_msar_request_message_written.instrument_id[complex_msar_request_message_at]); complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_request_message_read.msar_type == complex_msar_request_message_written.msar_type);
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> assert(complex_msar_request_message_read.auction_id[complex_msar_request_message_at] == complex_msar_request_message_written.auction_id[complex_msar_request_message_at]); complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> assert(complex_msar_request_message_read.price[complex_msar_request_message_at] == complex_msar_request_message_written.price[complex_msar_request_message_at]); complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_request_message_read.side == complex_msar_request_message_written.side);
  assert(complex_msar_request_message_read.debit_credit == complex_msar_request_message_written.debit_credit);
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> assert(complex_msar_request_message_read.contracts[complex_msar_request_message_at] == complex_msar_request_message_written.contracts[complex_msar_request_message_at]); complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  assert(complex_msar_request_message_read.price_protection == complex_msar_request_message_written.price_protection);
  complex_msar_request_message_at = 0;
  do
  :: complex_msar_request_message_at < 4 -> assert(complex_msar_request_message_read.reserved_4[complex_msar_request_message_at] == complex_msar_request_message_written.reserved_4[complex_msar_request_message_at]); complex_msar_request_message_at = complex_msar_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Client Packet Header: encoded, read back, and compared */
proctype check_client_packet_header() {
  ClientPacketHeader client_packet_header_sent;
  ClientPacketHeader client_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_client_packet_header(client_packet_header_sent, 0)
  :: pattern == 1 -> fill_client_packet_header(client_packet_header_sent, 32)
  :: pattern == 2 -> fill_client_packet_header(client_packet_header_sent, 255)
  :: else -> ramp_client_packet_header(client_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_client_packet_header(client_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_client_packet_header(client_packet_header_got);
    assert(at == 3);
    equal_client_packet_header(client_packet_header_got, client_packet_header_sent)
  }
}

/* Login Request Packet: encoded, read back, and compared */
proctype check_login_request_packet() {
  LoginRequestPacket login_request_packet_sent;
  LoginRequestPacket login_request_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_request_packet(login_request_packet_sent, 0)
  :: pattern == 1 -> fill_login_request_packet(login_request_packet_sent, 32)
  :: pattern == 2 -> fill_login_request_packet(login_request_packet_sent, 255)
  :: else -> ramp_login_request_packet(login_request_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_request_packet(login_request_packet_sent);
    assert(at == 51);
    at = 0;
    decode_login_request_packet(login_request_packet_got);
    assert(at == 51);
    equal_login_request_packet(login_request_packet_got, login_request_packet_sent)
  }
}

/* Notification Subscription Request Message: encoded, read back, and compared */
proctype check_notification_subscription_request_message() {
  NotificationSubscriptionRequestMessage notification_subscription_request_message_sent;
  NotificationSubscriptionRequestMessage notification_subscription_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_notification_subscription_request_message(notification_subscription_request_message_sent, 0)
  :: pattern == 1 -> fill_notification_subscription_request_message(notification_subscription_request_message_sent, 32)
  :: pattern == 2 -> fill_notification_subscription_request_message(notification_subscription_request_message_sent, 255)
  :: else -> ramp_notification_subscription_request_message(notification_subscription_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_notification_subscription_request_message(notification_subscription_request_message_sent);
    assert(at == 36);
    at = 0;
    decode_notification_subscription_request_message(notification_subscription_request_message_got);
    assert(at == 36);
    equal_notification_subscription_request_message(notification_subscription_request_message_got, notification_subscription_request_message_sent)
  }
}

/* Mm Parameter Definition Request Message: encoded, read back, and compared */
proctype check_mm_parameter_definition_request_message() {
  MmParameterDefinitionRequestMessage mm_parameter_definition_request_message_sent;
  MmParameterDefinitionRequestMessage mm_parameter_definition_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mm_parameter_definition_request_message(mm_parameter_definition_request_message_sent, 0)
  :: pattern == 1 -> fill_mm_parameter_definition_request_message(mm_parameter_definition_request_message_sent, 32)
  :: pattern == 2 -> fill_mm_parameter_definition_request_message(mm_parameter_definition_request_message_sent, 255)
  :: else -> ramp_mm_parameter_definition_request_message(mm_parameter_definition_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mm_parameter_definition_request_message(mm_parameter_definition_request_message_sent);
    assert(at == 74);
    at = 0;
    decode_mm_parameter_definition_request_message(mm_parameter_definition_request_message_got);
    assert(at == 74);
    equal_mm_parameter_definition_request_message(mm_parameter_definition_request_message_got, mm_parameter_definition_request_message_sent)
  }
}

/* Active Qp Self Replenishment Set Limit Message: encoded, read back, and compared */
proctype check_active_qp_self_replenishment_set_limit_message() {
  ActiveQpSelfReplenishmentSetLimitMessage active_qp_self_replenishment_set_limit_message_sent;
  ActiveQpSelfReplenishmentSetLimitMessage active_qp_self_replenishment_set_limit_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_active_qp_self_replenishment_set_limit_message(active_qp_self_replenishment_set_limit_message_sent, 0)
  :: pattern == 1 -> fill_active_qp_self_replenishment_set_limit_message(active_qp_self_replenishment_set_limit_message_sent, 32)
  :: pattern == 2 -> fill_active_qp_self_replenishment_set_limit_message(active_qp_self_replenishment_set_limit_message_sent, 255)
  :: else -> ramp_active_qp_self_replenishment_set_limit_message(active_qp_self_replenishment_set_limit_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_active_qp_self_replenishment_set_limit_message(active_qp_self_replenishment_set_limit_message_sent);
    assert(at == 29);
    at = 0;
    decode_active_qp_self_replenishment_set_limit_message(active_qp_self_replenishment_set_limit_message_got);
    assert(at == 29);
    equal_active_qp_self_replenishment_set_limit_message(active_qp_self_replenishment_set_limit_message_got, active_qp_self_replenishment_set_limit_message_sent)
  }
}

/* Underlying Purge Request Message: encoded, read back, and compared */
proctype check_underlying_purge_request_message() {
  UnderlyingPurgeRequestMessage underlying_purge_request_message_sent;
  UnderlyingPurgeRequestMessage underlying_purge_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_purge_request_message(underlying_purge_request_message_sent, 0)
  :: pattern == 1 -> fill_underlying_purge_request_message(underlying_purge_request_message_sent, 32)
  :: pattern == 2 -> fill_underlying_purge_request_message(underlying_purge_request_message_sent, 255)
  :: else -> ramp_underlying_purge_request_message(underlying_purge_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_purge_request_message(underlying_purge_request_message_sent);
    assert(at == 34);
    at = 0;
    decode_underlying_purge_request_message(underlying_purge_request_message_got);
    assert(at == 34);
    equal_underlying_purge_request_message(underlying_purge_request_message_got, underlying_purge_request_message_sent)
  }
}

/* Market Reentry Request Message: encoded, read back, and compared */
proctype check_market_reentry_request_message() {
  MarketReentryRequestMessage market_reentry_request_message_sent;
  MarketReentryRequestMessage market_reentry_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_reentry_request_message(market_reentry_request_message_sent, 0)
  :: pattern == 1 -> fill_market_reentry_request_message(market_reentry_request_message_sent, 32)
  :: pattern == 2 -> fill_market_reentry_request_message(market_reentry_request_message_sent, 255)
  :: else -> ramp_market_reentry_request_message(market_reentry_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_reentry_request_message(market_reentry_request_message_sent);
    assert(at == 26);
    at = 0;
    decode_market_reentry_request_message(market_reentry_request_message_got);
    assert(at == 26);
    equal_market_reentry_request_message(market_reentry_request_message_got, market_reentry_request_message_sent)
  }
}

/* Active Qp Self Replenishment Request Reentry Message: encoded, read back, and compared */
proctype check_active_qp_self_replenishment_request_reentry_message() {
  ActiveQpSelfReplenishmentRequestReentryMessage active_qp_self_replenishment_request_reentry_message_sent;
  ActiveQpSelfReplenishmentRequestReentryMessage active_qp_self_replenishment_request_reentry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_active_qp_self_replenishment_request_reentry_message(active_qp_self_replenishment_request_reentry_message_sent, 0)
  :: pattern == 1 -> fill_active_qp_self_replenishment_request_reentry_message(active_qp_self_replenishment_request_reentry_message_sent, 32)
  :: pattern == 2 -> fill_active_qp_self_replenishment_request_reentry_message(active_qp_self_replenishment_request_reentry_message_sent, 255)
  :: else -> ramp_active_qp_self_replenishment_request_reentry_message(active_qp_self_replenishment_request_reentry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_active_qp_self_replenishment_request_reentry_message(active_qp_self_replenishment_request_reentry_message_sent);
    assert(at == 29);
    at = 0;
    decode_active_qp_self_replenishment_request_reentry_message(active_qp_self_replenishment_request_reentry_message_got);
    assert(at == 29);
    equal_active_qp_self_replenishment_request_reentry_message(active_qp_self_replenishment_request_reentry_message_got, active_qp_self_replenishment_request_reentry_message_sent)
  }
}

/* Simple Msar Request Message: encoded, read back, and compared */
proctype check_simple_msar_request_message() {
  SimpleMsarRequestMessage simple_msar_request_message_sent;
  SimpleMsarRequestMessage simple_msar_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_msar_request_message(simple_msar_request_message_sent, 0)
  :: pattern == 1 -> fill_simple_msar_request_message(simple_msar_request_message_sent, 32)
  :: pattern == 2 -> fill_simple_msar_request_message(simple_msar_request_message_sent, 255)
  :: else -> ramp_simple_msar_request_message(simple_msar_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_msar_request_message(simple_msar_request_message_sent);
    assert(at == 30);
    at = 0;
    decode_simple_msar_request_message(simple_msar_request_message_got);
    assert(at == 30);
    equal_simple_msar_request_message(simple_msar_request_message_got, simple_msar_request_message_sent)
  }
}

/* Complex Msar Request Message: encoded, read back, and compared */
proctype check_complex_msar_request_message() {
  ComplexMsarRequestMessage complex_msar_request_message_sent;
  ComplexMsarRequestMessage complex_msar_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_msar_request_message(complex_msar_request_message_sent, 0)
  :: pattern == 1 -> fill_complex_msar_request_message(complex_msar_request_message_sent, 32)
  :: pattern == 2 -> fill_complex_msar_request_message(complex_msar_request_message_sent, 255)
  :: else -> ramp_complex_msar_request_message(complex_msar_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_msar_request_message(complex_msar_request_message_sent);
    assert(at == 36);
    at = 0;
    decode_complex_msar_request_message(complex_msar_request_message_got);
    assert(at == 36);
    equal_complex_msar_request_message(complex_msar_request_message_got, complex_msar_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_client_packet_header()
  :: run check_login_request_packet()
  :: run check_notification_subscription_request_message()
  :: run check_mm_parameter_definition_request_message()
  :: run check_active_qp_self_replenishment_set_limit_message()
  :: run check_underlying_purge_request_message()
  :: run check_market_reentry_request_message()
  :: run check_active_qp_self_replenishment_request_reentry_message()
  :: run check_simple_msar_request_message()
  :: run check_complex_msar_request_message()
  fi
}
