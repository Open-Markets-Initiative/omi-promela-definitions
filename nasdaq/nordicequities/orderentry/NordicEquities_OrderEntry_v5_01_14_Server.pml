/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Nordic Ouch 5 Order Entry
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
#define WIRE 30

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Server Packet Header: 3 bytes ------------------------------------------- */

/* Packet header of a packet sent by the server */
typedef ServerPacketHeader {
  byte packet_length[2];
  byte server_packet_type
};

int server_packet_header_at;

/* every byte of Server Packet Header set to one value */
inline fill_server_packet_header(server_packet_header_record, server_packet_header_value) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> server_packet_header_record.packet_length[server_packet_header_at] = server_packet_header_value; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  server_packet_header_record.server_packet_type = server_packet_header_value;
  skip
}

/* each byte of Server Packet Header set to where it lies, so a field read out of place says so */
inline ramp_server_packet_header(server_packet_header_record, server_packet_header_base) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> server_packet_header_record.packet_length[server_packet_header_at] = (server_packet_header_base + 0 + server_packet_header_at + 1) % 256; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  server_packet_header_record.server_packet_type = (server_packet_header_base + 2 + 1) % 256;
  skip
}

/* Server Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_server_packet_header(server_packet_header_record) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> wire[at] = server_packet_header_record.packet_length[server_packet_header_at]; at = at + 1; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = server_packet_header_record.server_packet_type; at = at + 1;
  skip
}

/* Server Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_server_packet_header(server_packet_header_record) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> server_packet_header_record.packet_length[server_packet_header_at] = wire[at]; at = at + 1; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  server_packet_header_record.server_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Server Packet Header is what was written, byte for byte */
inline equal_server_packet_header(server_packet_header_read, server_packet_header_written) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> assert(server_packet_header_read.packet_length[server_packet_header_at] == server_packet_header_written.packet_length[server_packet_header_at]); server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  assert(server_packet_header_read.server_packet_type == server_packet_header_written.server_packet_type);
  skip
}

/* ---- Login Accepted Packet: 30 bytes ----------------------------------------- */

/* The SoupBinTCP server sends a Login Accepted Packet in response to receiving a valid Login Request from the client */
typedef LoginAcceptedPacket {
  byte accepted_session[10];
  byte accepted_sequence_number[20]
};

int login_accepted_packet_at;

/* every byte of Login Accepted Packet set to one value */
inline fill_login_accepted_packet(login_accepted_packet_record, login_accepted_packet_value) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_session[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Accepted Packet set to where it lies, so a field read out of place says so */
inline ramp_login_accepted_packet(login_accepted_packet_record, login_accepted_packet_base) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_session[login_accepted_packet_at] = (login_accepted_packet_base + 0 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = (login_accepted_packet_base + 10 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet to the wire, 30 bytes from where the cursor stands */
inline encode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> wire[at] = login_accepted_packet_record.accepted_session[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> wire[at] = login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet off the wire, 30 bytes from where the cursor stands */
inline decode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_session[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Accepted Packet is what was written, byte for byte */
inline equal_login_accepted_packet(login_accepted_packet_read, login_accepted_packet_written) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> assert(login_accepted_packet_read.accepted_session[login_accepted_packet_at] == login_accepted_packet_written.accepted_session[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> assert(login_accepted_packet_read.accepted_sequence_number[login_accepted_packet_at] == login_accepted_packet_written.accepted_sequence_number[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Rejected Packet: 1 bytes ------------------------------------------ */

/* The SoupBinTCP server sends this packet in response to an invalid Login Request Packet from the client */
typedef LoginRejectedPacket {
  byte reject_reason_code
};

/* every byte of Login Rejected Packet set to one value */
inline fill_login_rejected_packet(login_rejected_packet_record, login_rejected_packet_value) {
  login_rejected_packet_record.reject_reason_code = login_rejected_packet_value;
  skip
}

/* each byte of Login Rejected Packet set to where it lies, so a field read out of place says so */
inline ramp_login_rejected_packet(login_rejected_packet_record, login_rejected_packet_base) {
  login_rejected_packet_record.reject_reason_code = (login_rejected_packet_base + 0 + 1) % 256;
  skip
}

/* Login Rejected Packet to the wire, 1 bytes from where the cursor stands */
inline encode_login_rejected_packet(login_rejected_packet_record) {
  wire[at] = login_rejected_packet_record.reject_reason_code; at = at + 1;
  skip
}

/* Login Rejected Packet off the wire, 1 bytes from where the cursor stands */
inline decode_login_rejected_packet(login_rejected_packet_record) {
  login_rejected_packet_record.reject_reason_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Rejected Packet is what was written, byte for byte */
inline equal_login_rejected_packet(login_rejected_packet_read, login_rejected_packet_written) {
  assert(login_rejected_packet_read.reject_reason_code == login_rejected_packet_written.reject_reason_code);
  skip
}

/* ---- System Event Message: 9 bytes ------------------------------------------- */

/* Signals an event affecting the entire Nasdaq Nordic system */
typedef SystemEventMessage {
  byte timestamp[8];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 8 + 1) % 256;
  skip
}

/* System Event Message to the wire, 9 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 9 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Clearing Account: 12 bytes ---------------------------------------------- */

/* Clearing Account */
typedef ClearingAccount {
  byte clearing_account_value[12]
};

int clearing_account_at;

/* every byte of Clearing Account set to one value */
inline fill_clearing_account(clearing_account_record, clearing_account_value_) {
  clearing_account_at = 0;
  do
  :: clearing_account_at < 12 -> clearing_account_record.clearing_account_value[clearing_account_at] = clearing_account_value_; clearing_account_at = clearing_account_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Clearing Account set to where it lies, so a field read out of place says so */
inline ramp_clearing_account(clearing_account_record, clearing_account_base) {
  clearing_account_at = 0;
  do
  :: clearing_account_at < 12 -> clearing_account_record.clearing_account_value[clearing_account_at] = (clearing_account_base + 0 + clearing_account_at + 1) % 256; clearing_account_at = clearing_account_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Account to the wire, 12 bytes from where the cursor stands */
inline encode_clearing_account(clearing_account_record) {
  clearing_account_at = 0;
  do
  :: clearing_account_at < 12 -> wire[at] = clearing_account_record.clearing_account_value[clearing_account_at]; at = at + 1; clearing_account_at = clearing_account_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Account off the wire, 12 bytes from where the cursor stands */
inline decode_clearing_account(clearing_account_record) {
  clearing_account_at = 0;
  do
  :: clearing_account_at < 12 -> clearing_account_record.clearing_account_value[clearing_account_at] = wire[at]; at = at + 1; clearing_account_at = clearing_account_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Clearing Account is what was written, byte for byte */
inline equal_clearing_account(clearing_account_read, clearing_account_written) {
  clearing_account_at = 0;
  do
  :: clearing_account_at < 12 -> assert(clearing_account_read.clearing_account_value[clearing_account_at] == clearing_account_written.clearing_account_value[clearing_account_at]); clearing_account_at = clearing_account_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Clearing Account Type: 1 bytes ------------------------------------------ */

/* Clearing Account Type */
typedef ClearingAccountType {
  byte clearing_account_type_value
};

/* every byte of Clearing Account Type set to one value */
inline fill_clearing_account_type(clearing_account_type_record, clearing_account_type_value_) {
  clearing_account_type_record.clearing_account_type_value = clearing_account_type_value_;
  skip
}

/* each byte of Clearing Account Type set to where it lies, so a field read out of place says so */
inline ramp_clearing_account_type(clearing_account_type_record, clearing_account_type_base) {
  clearing_account_type_record.clearing_account_type_value = (clearing_account_type_base + 0 + 1) % 256;
  skip
}

/* Clearing Account Type to the wire, 1 bytes from where the cursor stands */
inline encode_clearing_account_type(clearing_account_type_record) {
  wire[at] = clearing_account_type_record.clearing_account_type_value; at = at + 1;
  skip
}

/* Clearing Account Type off the wire, 1 bytes from where the cursor stands */
inline decode_clearing_account_type(clearing_account_type_record) {
  clearing_account_type_record.clearing_account_type_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Clearing Account Type is what was written, byte for byte */
inline equal_clearing_account_type(clearing_account_type_read, clearing_account_type_written) {
  assert(clearing_account_type_read.clearing_account_type_value == clearing_account_type_written.clearing_account_type_value);
  skip
}

/* ---- Clearing Firm: 4 bytes -------------------------------------------------- */

/* Clearing Firm */
typedef ClearingFirm {
  byte clearing_firm_value[4]
};

int clearing_firm_at;

/* every byte of Clearing Firm set to one value */
inline fill_clearing_firm(clearing_firm_record, clearing_firm_value_) {
  clearing_firm_at = 0;
  do
  :: clearing_firm_at < 4 -> clearing_firm_record.clearing_firm_value[clearing_firm_at] = clearing_firm_value_; clearing_firm_at = clearing_firm_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Clearing Firm set to where it lies, so a field read out of place says so */
inline ramp_clearing_firm(clearing_firm_record, clearing_firm_base) {
  clearing_firm_at = 0;
  do
  :: clearing_firm_at < 4 -> clearing_firm_record.clearing_firm_value[clearing_firm_at] = (clearing_firm_base + 0 + clearing_firm_at + 1) % 256; clearing_firm_at = clearing_firm_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Firm to the wire, 4 bytes from where the cursor stands */
inline encode_clearing_firm(clearing_firm_record) {
  clearing_firm_at = 0;
  do
  :: clearing_firm_at < 4 -> wire[at] = clearing_firm_record.clearing_firm_value[clearing_firm_at]; at = at + 1; clearing_firm_at = clearing_firm_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Firm off the wire, 4 bytes from where the cursor stands */
inline decode_clearing_firm(clearing_firm_record) {
  clearing_firm_at = 0;
  do
  :: clearing_firm_at < 4 -> clearing_firm_record.clearing_firm_value[clearing_firm_at] = wire[at]; at = at + 1; clearing_firm_at = clearing_firm_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Clearing Firm is what was written, byte for byte */
inline equal_clearing_firm(clearing_firm_read, clearing_firm_written) {
  clearing_firm_at = 0;
  do
  :: clearing_firm_at < 4 -> assert(clearing_firm_read.clearing_firm_value[clearing_firm_at] == clearing_firm_written.clearing_firm_value[clearing_firm_at]); clearing_firm_at = clearing_firm_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Client Reference: 15 bytes ---------------------------------------------- */

/* Client Reference */
typedef ClientReference {
  byte client_reference_value[15]
};

int client_reference_at;

/* every byte of Client Reference set to one value */
inline fill_client_reference(client_reference_record, client_reference_value_) {
  client_reference_at = 0;
  do
  :: client_reference_at < 15 -> client_reference_record.client_reference_value[client_reference_at] = client_reference_value_; client_reference_at = client_reference_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Client Reference set to where it lies, so a field read out of place says so */
inline ramp_client_reference(client_reference_record, client_reference_base) {
  client_reference_at = 0;
  do
  :: client_reference_at < 15 -> client_reference_record.client_reference_value[client_reference_at] = (client_reference_base + 0 + client_reference_at + 1) % 256; client_reference_at = client_reference_at + 1
  :: else -> break
  od;
  skip
}

/* Client Reference to the wire, 15 bytes from where the cursor stands */
inline encode_client_reference(client_reference_record) {
  client_reference_at = 0;
  do
  :: client_reference_at < 15 -> wire[at] = client_reference_record.client_reference_value[client_reference_at]; at = at + 1; client_reference_at = client_reference_at + 1
  :: else -> break
  od;
  skip
}

/* Client Reference off the wire, 15 bytes from where the cursor stands */
inline decode_client_reference(client_reference_record) {
  client_reference_at = 0;
  do
  :: client_reference_at < 15 -> client_reference_record.client_reference_value[client_reference_at] = wire[at]; at = at + 1; client_reference_at = client_reference_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Client Reference is what was written, byte for byte */
inline equal_client_reference(client_reference_read, client_reference_written) {
  client_reference_at = 0;
  do
  :: client_reference_at < 15 -> assert(client_reference_read.client_reference_value[client_reference_at] == client_reference_written.client_reference_value[client_reference_at]); client_reference_at = client_reference_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cross Type: 1 bytes ----------------------------------------------------- */

/* Cross Type */
typedef CrossType {
  byte cross_type_value
};

/* every byte of Cross Type set to one value */
inline fill_cross_type(cross_type_record, cross_type_value_) {
  cross_type_record.cross_type_value = cross_type_value_;
  skip
}

/* each byte of Cross Type set to where it lies, so a field read out of place says so */
inline ramp_cross_type(cross_type_record, cross_type_base) {
  cross_type_record.cross_type_value = (cross_type_base + 0 + 1) % 256;
  skip
}

/* Cross Type to the wire, 1 bytes from where the cursor stands */
inline encode_cross_type(cross_type_record) {
  wire[at] = cross_type_record.cross_type_value; at = at + 1;
  skip
}

/* Cross Type off the wire, 1 bytes from where the cursor stands */
inline decode_cross_type(cross_type_record) {
  cross_type_record.cross_type_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Cross Type is what was written, byte for byte */
inline equal_cross_type(cross_type_read, cross_type_written) {
  assert(cross_type_read.cross_type_value == cross_type_written.cross_type_value);
  skip
}

/* ---- Dea Indicator: 1 bytes -------------------------------------------------- */

/* DEA Indicator */
typedef DeaIndicator {
  byte dea_indicator_value
};

/* every byte of Dea Indicator set to one value */
inline fill_dea_indicator(dea_indicator_record, dea_indicator_value_) {
  dea_indicator_record.dea_indicator_value = dea_indicator_value_;
  skip
}

/* each byte of Dea Indicator set to where it lies, so a field read out of place says so */
inline ramp_dea_indicator(dea_indicator_record, dea_indicator_base) {
  dea_indicator_record.dea_indicator_value = (dea_indicator_base + 0 + 1) % 256;
  skip
}

/* Dea Indicator to the wire, 1 bytes from where the cursor stands */
inline encode_dea_indicator(dea_indicator_record) {
  wire[at] = dea_indicator_record.dea_indicator_value; at = at + 1;
  skip
}

/* Dea Indicator off the wire, 1 bytes from where the cursor stands */
inline decode_dea_indicator(dea_indicator_record) {
  dea_indicator_record.dea_indicator_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Dea Indicator is what was written, byte for byte */
inline equal_dea_indicator(dea_indicator_read, dea_indicator_written) {
  assert(dea_indicator_read.dea_indicator_value == dea_indicator_written.dea_indicator_value);
  skip
}

/* ---- Display: 1 bytes -------------------------------------------------------- */

/* Display */
typedef Display {
  byte display_value
};

/* every byte of Display set to one value */
inline fill_display(display_record, display_value_) {
  display_record.display_value = display_value_;
  skip
}

/* each byte of Display set to where it lies, so a field read out of place says so */
inline ramp_display(display_record, display_base) {
  display_record.display_value = (display_base + 0 + 1) % 256;
  skip
}

/* Display to the wire, 1 bytes from where the cursor stands */
inline encode_display(display_record) {
  wire[at] = display_record.display_value; at = at + 1;
  skip
}

/* Display off the wire, 1 bytes from where the cursor stands */
inline decode_display(display_record) {
  display_record.display_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Display is what was written, byte for byte */
inline equal_display(display_read, display_written) {
  assert(display_read.display_value == display_written.display_value);
  skip
}

/* ---- Display Price: 4 bytes -------------------------------------------------- */

/* Display Price */
typedef DisplayPrice {
  byte display_price_value[4]
};

int display_price_at;

/* every byte of Display Price set to one value */
inline fill_display_price(display_price_record, display_price_value_) {
  display_price_at = 0;
  do
  :: display_price_at < 4 -> display_price_record.display_price_value[display_price_at] = display_price_value_; display_price_at = display_price_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Display Price set to where it lies, so a field read out of place says so */
inline ramp_display_price(display_price_record, display_price_base) {
  display_price_at = 0;
  do
  :: display_price_at < 4 -> display_price_record.display_price_value[display_price_at] = (display_price_base + 0 + display_price_at + 1) % 256; display_price_at = display_price_at + 1
  :: else -> break
  od;
  skip
}

/* Display Price to the wire, 4 bytes from where the cursor stands */
inline encode_display_price(display_price_record) {
  display_price_at = 0;
  do
  :: display_price_at < 4 -> wire[at] = display_price_record.display_price_value[display_price_at]; at = at + 1; display_price_at = display_price_at + 1
  :: else -> break
  od;
  skip
}

/* Display Price off the wire, 4 bytes from where the cursor stands */
inline decode_display_price(display_price_record) {
  display_price_at = 0;
  do
  :: display_price_at < 4 -> display_price_record.display_price_value[display_price_at] = wire[at]; at = at + 1; display_price_at = display_price_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Display Price is what was written, byte for byte */
inline equal_display_price(display_price_read, display_price_written) {
  display_price_at = 0;
  do
  :: display_price_at < 4 -> assert(display_price_read.display_price_value[display_price_at] == display_price_written.display_price_value[display_price_at]); display_price_at = display_price_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Display Quantity: 4 bytes ----------------------------------------------- */

/* Display Quantity */
typedef DisplayQuantity {
  byte display_quantity_value[4]
};

int display_quantity_at;

/* every byte of Display Quantity set to one value */
inline fill_display_quantity(display_quantity_record, display_quantity_value_) {
  display_quantity_at = 0;
  do
  :: display_quantity_at < 4 -> display_quantity_record.display_quantity_value[display_quantity_at] = display_quantity_value_; display_quantity_at = display_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Display Quantity set to where it lies, so a field read out of place says so */
inline ramp_display_quantity(display_quantity_record, display_quantity_base) {
  display_quantity_at = 0;
  do
  :: display_quantity_at < 4 -> display_quantity_record.display_quantity_value[display_quantity_at] = (display_quantity_base + 0 + display_quantity_at + 1) % 256; display_quantity_at = display_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* Display Quantity to the wire, 4 bytes from where the cursor stands */
inline encode_display_quantity(display_quantity_record) {
  display_quantity_at = 0;
  do
  :: display_quantity_at < 4 -> wire[at] = display_quantity_record.display_quantity_value[display_quantity_at]; at = at + 1; display_quantity_at = display_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* Display Quantity off the wire, 4 bytes from where the cursor stands */
inline decode_display_quantity(display_quantity_record) {
  display_quantity_at = 0;
  do
  :: display_quantity_at < 4 -> display_quantity_record.display_quantity_value[display_quantity_at] = wire[at]; at = at + 1; display_quantity_at = display_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Display Quantity is what was written, byte for byte */
inline equal_display_quantity(display_quantity_read, display_quantity_written) {
  display_quantity_at = 0;
  do
  :: display_quantity_at < 4 -> assert(display_quantity_read.display_quantity_value[display_quantity_at] == display_quantity_written.display_quantity_value[display_quantity_at]); display_quantity_at = display_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Expire Time: 2 bytes ---------------------------------------------------- */

/* Expire Time */
typedef ExpireTime {
  byte expire_time_value[2]
};

int expire_time_at;

/* every byte of Expire Time set to one value */
inline fill_expire_time(expire_time_record, expire_time_value_) {
  expire_time_at = 0;
  do
  :: expire_time_at < 2 -> expire_time_record.expire_time_value[expire_time_at] = expire_time_value_; expire_time_at = expire_time_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Expire Time set to where it lies, so a field read out of place says so */
inline ramp_expire_time(expire_time_record, expire_time_base) {
  expire_time_at = 0;
  do
  :: expire_time_at < 2 -> expire_time_record.expire_time_value[expire_time_at] = (expire_time_base + 0 + expire_time_at + 1) % 256; expire_time_at = expire_time_at + 1
  :: else -> break
  od;
  skip
}

/* Expire Time to the wire, 2 bytes from where the cursor stands */
inline encode_expire_time(expire_time_record) {
  expire_time_at = 0;
  do
  :: expire_time_at < 2 -> wire[at] = expire_time_record.expire_time_value[expire_time_at]; at = at + 1; expire_time_at = expire_time_at + 1
  :: else -> break
  od;
  skip
}

/* Expire Time off the wire, 2 bytes from where the cursor stands */
inline decode_expire_time(expire_time_record) {
  expire_time_at = 0;
  do
  :: expire_time_at < 2 -> expire_time_record.expire_time_value[expire_time_at] = wire[at]; at = at + 1; expire_time_at = expire_time_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Expire Time is what was written, byte for byte */
inline equal_expire_time(expire_time_read, expire_time_written) {
  expire_time_at = 0;
  do
  :: expire_time_at < 2 -> assert(expire_time_read.expire_time_value[expire_time_at] == expire_time_written.expire_time_value[expire_time_at]); expire_time_at = expire_time_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Firm: 4 bytes ----------------------------------------------------------- */

/* Firm */
typedef Firm {
  byte firm_value[4]
};

int firm_at;

/* every byte of Firm set to one value */
inline fill_firm(firm_record, firm_value_) {
  firm_at = 0;
  do
  :: firm_at < 4 -> firm_record.firm_value[firm_at] = firm_value_; firm_at = firm_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Firm set to where it lies, so a field read out of place says so */
inline ramp_firm(firm_record, firm_base) {
  firm_at = 0;
  do
  :: firm_at < 4 -> firm_record.firm_value[firm_at] = (firm_base + 0 + firm_at + 1) % 256; firm_at = firm_at + 1
  :: else -> break
  od;
  skip
}

/* Firm to the wire, 4 bytes from where the cursor stands */
inline encode_firm(firm_record) {
  firm_at = 0;
  do
  :: firm_at < 4 -> wire[at] = firm_record.firm_value[firm_at]; at = at + 1; firm_at = firm_at + 1
  :: else -> break
  od;
  skip
}

/* Firm off the wire, 4 bytes from where the cursor stands */
inline decode_firm(firm_record) {
  firm_at = 0;
  do
  :: firm_at < 4 -> firm_record.firm_value[firm_at] = wire[at]; at = at + 1; firm_at = firm_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Firm is what was written, byte for byte */
inline equal_firm(firm_read, firm_written) {
  firm_at = 0;
  do
  :: firm_at < 4 -> assert(firm_read.firm_value[firm_at] == firm_written.firm_value[firm_at]); firm_at = firm_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Liquidity Provision Indicator: 1 bytes ---------------------------------- */

/* Liquidity Provision Indicator */
typedef LiquidityProvisionIndicator {
  byte liquidity_provision_indicator_value
};

/* every byte of Liquidity Provision Indicator set to one value */
inline fill_liquidity_provision_indicator(liquidity_provision_indicator_record, liquidity_provision_indicator_value_) {
  liquidity_provision_indicator_record.liquidity_provision_indicator_value = liquidity_provision_indicator_value_;
  skip
}

/* each byte of Liquidity Provision Indicator set to where it lies, so a field read out of place says so */
inline ramp_liquidity_provision_indicator(liquidity_provision_indicator_record, liquidity_provision_indicator_base) {
  liquidity_provision_indicator_record.liquidity_provision_indicator_value = (liquidity_provision_indicator_base + 0 + 1) % 256;
  skip
}

/* Liquidity Provision Indicator to the wire, 1 bytes from where the cursor stands */
inline encode_liquidity_provision_indicator(liquidity_provision_indicator_record) {
  wire[at] = liquidity_provision_indicator_record.liquidity_provision_indicator_value; at = at + 1;
  skip
}

/* Liquidity Provision Indicator off the wire, 1 bytes from where the cursor stands */
inline decode_liquidity_provision_indicator(liquidity_provision_indicator_record) {
  liquidity_provision_indicator_record.liquidity_provision_indicator_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Liquidity Provision Indicator is what was written, byte for byte */
inline equal_liquidity_provision_indicator(liquidity_provision_indicator_read, liquidity_provision_indicator_written) {
  assert(liquidity_provision_indicator_read.liquidity_provision_indicator_value == liquidity_provision_indicator_written.liquidity_provision_indicator_value);
  skip
}

/* ---- Max Floor: 4 bytes ------------------------------------------------------ */

/* Max Floor */
typedef MaxFloor {
  byte max_floor_value[4]
};

int max_floor_at;

/* every byte of Max Floor set to one value */
inline fill_max_floor(max_floor_record, max_floor_value_) {
  max_floor_at = 0;
  do
  :: max_floor_at < 4 -> max_floor_record.max_floor_value[max_floor_at] = max_floor_value_; max_floor_at = max_floor_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Max Floor set to where it lies, so a field read out of place says so */
inline ramp_max_floor(max_floor_record, max_floor_base) {
  max_floor_at = 0;
  do
  :: max_floor_at < 4 -> max_floor_record.max_floor_value[max_floor_at] = (max_floor_base + 0 + max_floor_at + 1) % 256; max_floor_at = max_floor_at + 1
  :: else -> break
  od;
  skip
}

/* Max Floor to the wire, 4 bytes from where the cursor stands */
inline encode_max_floor(max_floor_record) {
  max_floor_at = 0;
  do
  :: max_floor_at < 4 -> wire[at] = max_floor_record.max_floor_value[max_floor_at]; at = at + 1; max_floor_at = max_floor_at + 1
  :: else -> break
  od;
  skip
}

/* Max Floor off the wire, 4 bytes from where the cursor stands */
inline decode_max_floor(max_floor_record) {
  max_floor_at = 0;
  do
  :: max_floor_at < 4 -> max_floor_record.max_floor_value[max_floor_at] = wire[at]; at = at + 1; max_floor_at = max_floor_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Max Floor is what was written, byte for byte */
inline equal_max_floor(max_floor_read, max_floor_written) {
  max_floor_at = 0;
  do
  :: max_floor_at < 4 -> assert(max_floor_read.max_floor_value[max_floor_at] == max_floor_written.max_floor_value[max_floor_at]); max_floor_at = max_floor_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Minimum Quantity: 4 bytes ----------------------------------------------- */

/* Minimum Quantity */
typedef MinimumQuantity {
  byte minimum_quantity_value[4]
};

int minimum_quantity_at;

/* every byte of Minimum Quantity set to one value */
inline fill_minimum_quantity(minimum_quantity_record, minimum_quantity_value_) {
  minimum_quantity_at = 0;
  do
  :: minimum_quantity_at < 4 -> minimum_quantity_record.minimum_quantity_value[minimum_quantity_at] = minimum_quantity_value_; minimum_quantity_at = minimum_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Minimum Quantity set to where it lies, so a field read out of place says so */
inline ramp_minimum_quantity(minimum_quantity_record, minimum_quantity_base) {
  minimum_quantity_at = 0;
  do
  :: minimum_quantity_at < 4 -> minimum_quantity_record.minimum_quantity_value[minimum_quantity_at] = (minimum_quantity_base + 0 + minimum_quantity_at + 1) % 256; minimum_quantity_at = minimum_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* Minimum Quantity to the wire, 4 bytes from where the cursor stands */
inline encode_minimum_quantity(minimum_quantity_record) {
  minimum_quantity_at = 0;
  do
  :: minimum_quantity_at < 4 -> wire[at] = minimum_quantity_record.minimum_quantity_value[minimum_quantity_at]; at = at + 1; minimum_quantity_at = minimum_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* Minimum Quantity off the wire, 4 bytes from where the cursor stands */
inline decode_minimum_quantity(minimum_quantity_record) {
  minimum_quantity_at = 0;
  do
  :: minimum_quantity_at < 4 -> minimum_quantity_record.minimum_quantity_value[minimum_quantity_at] = wire[at]; at = at + 1; minimum_quantity_at = minimum_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Minimum Quantity is what was written, byte for byte */
inline equal_minimum_quantity(minimum_quantity_read, minimum_quantity_written) {
  minimum_quantity_at = 0;
  do
  :: minimum_quantity_at < 4 -> assert(minimum_quantity_read.minimum_quantity_value[minimum_quantity_at] == minimum_quantity_written.minimum_quantity_value[minimum_quantity_at]); minimum_quantity_at = minimum_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Reference: 10 bytes ----------------------------------------------- */

/* Order Reference */
typedef OrderReference {
  byte order_reference_value[10]
};

int order_reference_at;

/* every byte of Order Reference set to one value */
inline fill_order_reference(order_reference_record, order_reference_value_) {
  order_reference_at = 0;
  do
  :: order_reference_at < 10 -> order_reference_record.order_reference_value[order_reference_at] = order_reference_value_; order_reference_at = order_reference_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Reference set to where it lies, so a field read out of place says so */
inline ramp_order_reference(order_reference_record, order_reference_base) {
  order_reference_at = 0;
  do
  :: order_reference_at < 10 -> order_reference_record.order_reference_value[order_reference_at] = (order_reference_base + 0 + order_reference_at + 1) % 256; order_reference_at = order_reference_at + 1
  :: else -> break
  od;
  skip
}

/* Order Reference to the wire, 10 bytes from where the cursor stands */
inline encode_order_reference(order_reference_record) {
  order_reference_at = 0;
  do
  :: order_reference_at < 10 -> wire[at] = order_reference_record.order_reference_value[order_reference_at]; at = at + 1; order_reference_at = order_reference_at + 1
  :: else -> break
  od;
  skip
}

/* Order Reference off the wire, 10 bytes from where the cursor stands */
inline decode_order_reference(order_reference_record) {
  order_reference_at = 0;
  do
  :: order_reference_at < 10 -> order_reference_record.order_reference_value[order_reference_at] = wire[at]; at = at + 1; order_reference_at = order_reference_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Reference is what was written, byte for byte */
inline equal_order_reference(order_reference_read, order_reference_written) {
  order_reference_at = 0;
  do
  :: order_reference_at < 10 -> assert(order_reference_read.order_reference_value[order_reference_at] == order_reference_written.order_reference_value[order_reference_at]); order_reference_at = order_reference_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Original Order Entry Date: 4 bytes -------------------------------------- */

/* Original Order Entry Date */
typedef OriginalOrderEntryDate {
  byte original_order_entry_date_value[4]
};

int original_order_entry_date_at;

/* every byte of Original Order Entry Date set to one value */
inline fill_original_order_entry_date(original_order_entry_date_record, original_order_entry_date_value_) {
  original_order_entry_date_at = 0;
  do
  :: original_order_entry_date_at < 4 -> original_order_entry_date_record.original_order_entry_date_value[original_order_entry_date_at] = original_order_entry_date_value_; original_order_entry_date_at = original_order_entry_date_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Original Order Entry Date set to where it lies, so a field read out of place says so */
inline ramp_original_order_entry_date(original_order_entry_date_record, original_order_entry_date_base) {
  original_order_entry_date_at = 0;
  do
  :: original_order_entry_date_at < 4 -> original_order_entry_date_record.original_order_entry_date_value[original_order_entry_date_at] = (original_order_entry_date_base + 0 + original_order_entry_date_at + 1) % 256; original_order_entry_date_at = original_order_entry_date_at + 1
  :: else -> break
  od;
  skip
}

/* Original Order Entry Date to the wire, 4 bytes from where the cursor stands */
inline encode_original_order_entry_date(original_order_entry_date_record) {
  original_order_entry_date_at = 0;
  do
  :: original_order_entry_date_at < 4 -> wire[at] = original_order_entry_date_record.original_order_entry_date_value[original_order_entry_date_at]; at = at + 1; original_order_entry_date_at = original_order_entry_date_at + 1
  :: else -> break
  od;
  skip
}

/* Original Order Entry Date off the wire, 4 bytes from where the cursor stands */
inline decode_original_order_entry_date(original_order_entry_date_record) {
  original_order_entry_date_at = 0;
  do
  :: original_order_entry_date_at < 4 -> original_order_entry_date_record.original_order_entry_date_value[original_order_entry_date_at] = wire[at]; at = at + 1; original_order_entry_date_at = original_order_entry_date_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Original Order Entry Date is what was written, byte for byte */
inline equal_original_order_entry_date(original_order_entry_date_read, original_order_entry_date_written) {
  original_order_entry_date_at = 0;
  do
  :: original_order_entry_date_at < 4 -> assert(original_order_entry_date_read.original_order_entry_date_value[original_order_entry_date_at] == original_order_entry_date_written.original_order_entry_date_value[original_order_entry_date_at]); original_order_entry_date_at = original_order_entry_date_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Original Order Reference Number: 8 bytes -------------------------------- */

/* Original Order Reference Number */
typedef OriginalOrderReferenceNumber {
  byte original_order_reference_number_value[8]
};

int original_order_reference_number_at;

/* every byte of Original Order Reference Number set to one value */
inline fill_original_order_reference_number(original_order_reference_number_record, original_order_reference_number_value_) {
  original_order_reference_number_at = 0;
  do
  :: original_order_reference_number_at < 8 -> original_order_reference_number_record.original_order_reference_number_value[original_order_reference_number_at] = original_order_reference_number_value_; original_order_reference_number_at = original_order_reference_number_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Original Order Reference Number set to where it lies, so a field read out of place says so */
inline ramp_original_order_reference_number(original_order_reference_number_record, original_order_reference_number_base) {
  original_order_reference_number_at = 0;
  do
  :: original_order_reference_number_at < 8 -> original_order_reference_number_record.original_order_reference_number_value[original_order_reference_number_at] = (original_order_reference_number_base + 0 + original_order_reference_number_at + 1) % 256; original_order_reference_number_at = original_order_reference_number_at + 1
  :: else -> break
  od;
  skip
}

/* Original Order Reference Number to the wire, 8 bytes from where the cursor stands */
inline encode_original_order_reference_number(original_order_reference_number_record) {
  original_order_reference_number_at = 0;
  do
  :: original_order_reference_number_at < 8 -> wire[at] = original_order_reference_number_record.original_order_reference_number_value[original_order_reference_number_at]; at = at + 1; original_order_reference_number_at = original_order_reference_number_at + 1
  :: else -> break
  od;
  skip
}

/* Original Order Reference Number off the wire, 8 bytes from where the cursor stands */
inline decode_original_order_reference_number(original_order_reference_number_record) {
  original_order_reference_number_at = 0;
  do
  :: original_order_reference_number_at < 8 -> original_order_reference_number_record.original_order_reference_number_value[original_order_reference_number_at] = wire[at]; at = at + 1; original_order_reference_number_at = original_order_reference_number_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Original Order Reference Number is what was written, byte for byte */
inline equal_original_order_reference_number(original_order_reference_number_read, original_order_reference_number_written) {
  original_order_reference_number_at = 0;
  do
  :: original_order_reference_number_at < 8 -> assert(original_order_reference_number_read.original_order_reference_number_value[original_order_reference_number_at] == original_order_reference_number_written.original_order_reference_number_value[original_order_reference_number_at]); original_order_reference_number_at = original_order_reference_number_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Peg Difference: 4 bytes ------------------------------------------------- */

/* Peg Difference */
typedef PegDifference {
  byte peg_difference_value[4]
};

int peg_difference_at;

/* every byte of Peg Difference set to one value */
inline fill_peg_difference(peg_difference_record, peg_difference_value_) {
  peg_difference_at = 0;
  do
  :: peg_difference_at < 4 -> peg_difference_record.peg_difference_value[peg_difference_at] = peg_difference_value_; peg_difference_at = peg_difference_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Peg Difference set to where it lies, so a field read out of place says so */
inline ramp_peg_difference(peg_difference_record, peg_difference_base) {
  peg_difference_at = 0;
  do
  :: peg_difference_at < 4 -> peg_difference_record.peg_difference_value[peg_difference_at] = (peg_difference_base + 0 + peg_difference_at + 1) % 256; peg_difference_at = peg_difference_at + 1
  :: else -> break
  od;
  skip
}

/* Peg Difference to the wire, 4 bytes from where the cursor stands */
inline encode_peg_difference(peg_difference_record) {
  peg_difference_at = 0;
  do
  :: peg_difference_at < 4 -> wire[at] = peg_difference_record.peg_difference_value[peg_difference_at]; at = at + 1; peg_difference_at = peg_difference_at + 1
  :: else -> break
  od;
  skip
}

/* Peg Difference off the wire, 4 bytes from where the cursor stands */
inline decode_peg_difference(peg_difference_record) {
  peg_difference_at = 0;
  do
  :: peg_difference_at < 4 -> peg_difference_record.peg_difference_value[peg_difference_at] = wire[at]; at = at + 1; peg_difference_at = peg_difference_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Peg Difference is what was written, byte for byte */
inline equal_peg_difference(peg_difference_read, peg_difference_written) {
  peg_difference_at = 0;
  do
  :: peg_difference_at < 4 -> assert(peg_difference_read.peg_difference_value[peg_difference_at] == peg_difference_written.peg_difference_value[peg_difference_at]); peg_difference_at = peg_difference_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Peg Type: 1 bytes ------------------------------------------------------- */

/* Peg Type */
typedef PegType {
  byte peg_type_value
};

/* every byte of Peg Type set to one value */
inline fill_peg_type(peg_type_record, peg_type_value_) {
  peg_type_record.peg_type_value = peg_type_value_;
  skip
}

/* each byte of Peg Type set to where it lies, so a field read out of place says so */
inline ramp_peg_type(peg_type_record, peg_type_base) {
  peg_type_record.peg_type_value = (peg_type_base + 0 + 1) % 256;
  skip
}

/* Peg Type to the wire, 1 bytes from where the cursor stands */
inline encode_peg_type(peg_type_record) {
  wire[at] = peg_type_record.peg_type_value; at = at + 1;
  skip
}

/* Peg Type off the wire, 1 bytes from where the cursor stands */
inline decode_peg_type(peg_type_record) {
  peg_type_record.peg_type_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Peg Type is what was written, byte for byte */
inline equal_peg_type(peg_type_read, peg_type_written) {
  assert(peg_type_read.peg_type_value == peg_type_written.peg_type_value);
  skip
}

/* ---- Random Reserve: 4 bytes ------------------------------------------------- */

/* Random Reserve */
typedef RandomReserve {
  byte random_reserve_value[4]
};

int random_reserve_at;

/* every byte of Random Reserve set to one value */
inline fill_random_reserve(random_reserve_record, random_reserve_value_) {
  random_reserve_at = 0;
  do
  :: random_reserve_at < 4 -> random_reserve_record.random_reserve_value[random_reserve_at] = random_reserve_value_; random_reserve_at = random_reserve_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Random Reserve set to where it lies, so a field read out of place says so */
inline ramp_random_reserve(random_reserve_record, random_reserve_base) {
  random_reserve_at = 0;
  do
  :: random_reserve_at < 4 -> random_reserve_record.random_reserve_value[random_reserve_at] = (random_reserve_base + 0 + random_reserve_at + 1) % 256; random_reserve_at = random_reserve_at + 1
  :: else -> break
  od;
  skip
}

/* Random Reserve to the wire, 4 bytes from where the cursor stands */
inline encode_random_reserve(random_reserve_record) {
  random_reserve_at = 0;
  do
  :: random_reserve_at < 4 -> wire[at] = random_reserve_record.random_reserve_value[random_reserve_at]; at = at + 1; random_reserve_at = random_reserve_at + 1
  :: else -> break
  od;
  skip
}

/* Random Reserve off the wire, 4 bytes from where the cursor stands */
inline decode_random_reserve(random_reserve_record) {
  random_reserve_at = 0;
  do
  :: random_reserve_at < 4 -> random_reserve_record.random_reserve_value[random_reserve_at] = wire[at]; at = at + 1; random_reserve_at = random_reserve_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Random Reserve is what was written, byte for byte */
inline equal_random_reserve(random_reserve_read, random_reserve_written) {
  random_reserve_at = 0;
  do
  :: random_reserve_at < 4 -> assert(random_reserve_read.random_reserve_value[random_reserve_at] == random_reserve_written.random_reserve_value[random_reserve_at]); random_reserve_at = random_reserve_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Secondary Order Reference Number: 8 bytes ------------------------------- */

/* Secondary Order Reference Number */
typedef SecondaryOrderReferenceNumber {
  byte secondary_order_reference_number_value[8]
};

int secondary_order_reference_number_at;

/* every byte of Secondary Order Reference Number set to one value */
inline fill_secondary_order_reference_number(secondary_order_reference_number_record, secondary_order_reference_number_value_) {
  secondary_order_reference_number_at = 0;
  do
  :: secondary_order_reference_number_at < 8 -> secondary_order_reference_number_record.secondary_order_reference_number_value[secondary_order_reference_number_at] = secondary_order_reference_number_value_; secondary_order_reference_number_at = secondary_order_reference_number_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Secondary Order Reference Number set to where it lies, so a field read out of place says so */
inline ramp_secondary_order_reference_number(secondary_order_reference_number_record, secondary_order_reference_number_base) {
  secondary_order_reference_number_at = 0;
  do
  :: secondary_order_reference_number_at < 8 -> secondary_order_reference_number_record.secondary_order_reference_number_value[secondary_order_reference_number_at] = (secondary_order_reference_number_base + 0 + secondary_order_reference_number_at + 1) % 256; secondary_order_reference_number_at = secondary_order_reference_number_at + 1
  :: else -> break
  od;
  skip
}

/* Secondary Order Reference Number to the wire, 8 bytes from where the cursor stands */
inline encode_secondary_order_reference_number(secondary_order_reference_number_record) {
  secondary_order_reference_number_at = 0;
  do
  :: secondary_order_reference_number_at < 8 -> wire[at] = secondary_order_reference_number_record.secondary_order_reference_number_value[secondary_order_reference_number_at]; at = at + 1; secondary_order_reference_number_at = secondary_order_reference_number_at + 1
  :: else -> break
  od;
  skip
}

/* Secondary Order Reference Number off the wire, 8 bytes from where the cursor stands */
inline decode_secondary_order_reference_number(secondary_order_reference_number_record) {
  secondary_order_reference_number_at = 0;
  do
  :: secondary_order_reference_number_at < 8 -> secondary_order_reference_number_record.secondary_order_reference_number_value[secondary_order_reference_number_at] = wire[at]; at = at + 1; secondary_order_reference_number_at = secondary_order_reference_number_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Secondary Order Reference Number is what was written, byte for byte */
inline equal_secondary_order_reference_number(secondary_order_reference_number_read, secondary_order_reference_number_written) {
  secondary_order_reference_number_at = 0;
  do
  :: secondary_order_reference_number_at < 8 -> assert(secondary_order_reference_number_read.secondary_order_reference_number_value[secondary_order_reference_number_at] == secondary_order_reference_number_written.secondary_order_reference_number_value[secondary_order_reference_number_at]); secondary_order_reference_number_at = secondary_order_reference_number_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stp Action: 1 bytes ----------------------------------------------------- */

/* STP Action */
typedef StpAction {
  byte stp_action_value
};

/* every byte of Stp Action set to one value */
inline fill_stp_action(stp_action_record, stp_action_value_) {
  stp_action_record.stp_action_value = stp_action_value_;
  skip
}

/* each byte of Stp Action set to where it lies, so a field read out of place says so */
inline ramp_stp_action(stp_action_record, stp_action_base) {
  stp_action_record.stp_action_value = (stp_action_base + 0 + 1) % 256;
  skip
}

/* Stp Action to the wire, 1 bytes from where the cursor stands */
inline encode_stp_action(stp_action_record) {
  wire[at] = stp_action_record.stp_action_value; at = at + 1;
  skip
}

/* Stp Action off the wire, 1 bytes from where the cursor stands */
inline decode_stp_action(stp_action_record) {
  stp_action_record.stp_action_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Stp Action is what was written, byte for byte */
inline equal_stp_action(stp_action_read, stp_action_written) {
  assert(stp_action_read.stp_action_value == stp_action_written.stp_action_value);
  skip
}

/* ---- Stp Level: 1 bytes ------------------------------------------------------ */

/* STP Level */
typedef StpLevel {
  byte stp_level_value
};

/* every byte of Stp Level set to one value */
inline fill_stp_level(stp_level_record, stp_level_value_) {
  stp_level_record.stp_level_value = stp_level_value_;
  skip
}

/* each byte of Stp Level set to where it lies, so a field read out of place says so */
inline ramp_stp_level(stp_level_record, stp_level_base) {
  stp_level_record.stp_level_value = (stp_level_base + 0 + 1) % 256;
  skip
}

/* Stp Level to the wire, 1 bytes from where the cursor stands */
inline encode_stp_level(stp_level_record) {
  wire[at] = stp_level_record.stp_level_value; at = at + 1;
  skip
}

/* Stp Level off the wire, 1 bytes from where the cursor stands */
inline decode_stp_level(stp_level_record) {
  stp_level_record.stp_level_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Stp Level is what was written, byte for byte */
inline equal_stp_level(stp_level_read, stp_level_written) {
  assert(stp_level_read.stp_level_value == stp_level_written.stp_level_value);
  skip
}

/* ---- Stp Trader Group: 2 bytes ----------------------------------------------- */

/* STP Trader Group */
typedef StpTraderGroup {
  byte stp_trader_group_value[2]
};

int stp_trader_group_at;

/* every byte of Stp Trader Group set to one value */
inline fill_stp_trader_group(stp_trader_group_record, stp_trader_group_value_) {
  stp_trader_group_at = 0;
  do
  :: stp_trader_group_at < 2 -> stp_trader_group_record.stp_trader_group_value[stp_trader_group_at] = stp_trader_group_value_; stp_trader_group_at = stp_trader_group_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stp Trader Group set to where it lies, so a field read out of place says so */
inline ramp_stp_trader_group(stp_trader_group_record, stp_trader_group_base) {
  stp_trader_group_at = 0;
  do
  :: stp_trader_group_at < 2 -> stp_trader_group_record.stp_trader_group_value[stp_trader_group_at] = (stp_trader_group_base + 0 + stp_trader_group_at + 1) % 256; stp_trader_group_at = stp_trader_group_at + 1
  :: else -> break
  od;
  skip
}

/* Stp Trader Group to the wire, 2 bytes from where the cursor stands */
inline encode_stp_trader_group(stp_trader_group_record) {
  stp_trader_group_at = 0;
  do
  :: stp_trader_group_at < 2 -> wire[at] = stp_trader_group_record.stp_trader_group_value[stp_trader_group_at]; at = at + 1; stp_trader_group_at = stp_trader_group_at + 1
  :: else -> break
  od;
  skip
}

/* Stp Trader Group off the wire, 2 bytes from where the cursor stands */
inline decode_stp_trader_group(stp_trader_group_record) {
  stp_trader_group_at = 0;
  do
  :: stp_trader_group_at < 2 -> stp_trader_group_record.stp_trader_group_value[stp_trader_group_at] = wire[at]; at = at + 1; stp_trader_group_at = stp_trader_group_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stp Trader Group is what was written, byte for byte */
inline equal_stp_trader_group(stp_trader_group_read, stp_trader_group_written) {
  stp_trader_group_at = 0;
  do
  :: stp_trader_group_at < 2 -> assert(stp_trader_group_read.stp_trader_group_value[stp_trader_group_at] == stp_trader_group_written.stp_trader_group_value[stp_trader_group_at]); stp_trader_group_at = stp_trader_group_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Time In Force: 1 bytes -------------------------------------------------- */

/* Time in Force */
typedef TimeInForce {
  byte time_in_force_value
};

/* every byte of Time In Force set to one value */
inline fill_time_in_force(time_in_force_record, time_in_force_value_) {
  time_in_force_record.time_in_force_value = time_in_force_value_;
  skip
}

/* each byte of Time In Force set to where it lies, so a field read out of place says so */
inline ramp_time_in_force(time_in_force_record, time_in_force_base) {
  time_in_force_record.time_in_force_value = (time_in_force_base + 0 + 1) % 256;
  skip
}

/* Time In Force to the wire, 1 bytes from where the cursor stands */
inline encode_time_in_force(time_in_force_record) {
  wire[at] = time_in_force_record.time_in_force_value; at = at + 1;
  skip
}

/* Time In Force off the wire, 1 bytes from where the cursor stands */
inline decode_time_in_force(time_in_force_record) {
  time_in_force_record.time_in_force_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Time In Force is what was written, byte for byte */
inline equal_time_in_force(time_in_force_read, time_in_force_written) {
  assert(time_in_force_read.time_in_force_value == time_in_force_written.time_in_force_value);
  skip
}

/* ---- Trading At Closing Price: 1 bytes --------------------------------------- */

/* Trading at Closing price */
typedef TradingAtClosingPrice {
  byte trading_at_closing_price_value
};

/* every byte of Trading At Closing Price set to one value */
inline fill_trading_at_closing_price(trading_at_closing_price_record, trading_at_closing_price_value_) {
  trading_at_closing_price_record.trading_at_closing_price_value = trading_at_closing_price_value_;
  skip
}

/* each byte of Trading At Closing Price set to where it lies, so a field read out of place says so */
inline ramp_trading_at_closing_price(trading_at_closing_price_record, trading_at_closing_price_base) {
  trading_at_closing_price_record.trading_at_closing_price_value = (trading_at_closing_price_base + 0 + 1) % 256;
  skip
}

/* Trading At Closing Price to the wire, 1 bytes from where the cursor stands */
inline encode_trading_at_closing_price(trading_at_closing_price_record) {
  wire[at] = trading_at_closing_price_record.trading_at_closing_price_value; at = at + 1;
  skip
}

/* Trading At Closing Price off the wire, 1 bytes from where the cursor stands */
inline decode_trading_at_closing_price(trading_at_closing_price_record) {
  trading_at_closing_price_record.trading_at_closing_price_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading At Closing Price is what was written, byte for byte */
inline equal_trading_at_closing_price(trading_at_closing_price_read, trading_at_closing_price_written) {
  assert(trading_at_closing_price_read.trading_at_closing_price_value == trading_at_closing_price_written.trading_at_closing_price_value);
  skip
}

/* ---- Order Condition: 1 bytes ------------------------------------------------ */

/* Order Condition */
typedef OrderCondition {
  byte order_condition_value
};

/* every byte of Order Condition set to one value */
inline fill_order_condition(order_condition_record, order_condition_value_) {
  order_condition_record.order_condition_value = order_condition_value_;
  skip
}

/* each byte of Order Condition set to where it lies, so a field read out of place says so */
inline ramp_order_condition(order_condition_record, order_condition_base) {
  order_condition_record.order_condition_value = (order_condition_base + 0 + 1) % 256;
  skip
}

/* Order Condition to the wire, 1 bytes from where the cursor stands */
inline encode_order_condition(order_condition_record) {
  wire[at] = order_condition_record.order_condition_value; at = at + 1;
  skip
}

/* Order Condition off the wire, 1 bytes from where the cursor stands */
inline decode_order_condition(order_condition_record) {
  order_condition_record.order_condition_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Condition is what was written, byte for byte */
inline equal_order_condition(order_condition_read, order_condition_written) {
  assert(order_condition_read.order_condition_value == order_condition_written.order_condition_value);
  skip
}

/* ---- Cumulative Quantity: 4 bytes -------------------------------------------- */

/* Cumulative Quantity */
typedef CumulativeQuantity {
  byte cumulative_quantity_value[4]
};

int cumulative_quantity_at;

/* every byte of Cumulative Quantity set to one value */
inline fill_cumulative_quantity(cumulative_quantity_record, cumulative_quantity_value_) {
  cumulative_quantity_at = 0;
  do
  :: cumulative_quantity_at < 4 -> cumulative_quantity_record.cumulative_quantity_value[cumulative_quantity_at] = cumulative_quantity_value_; cumulative_quantity_at = cumulative_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cumulative Quantity set to where it lies, so a field read out of place says so */
inline ramp_cumulative_quantity(cumulative_quantity_record, cumulative_quantity_base) {
  cumulative_quantity_at = 0;
  do
  :: cumulative_quantity_at < 4 -> cumulative_quantity_record.cumulative_quantity_value[cumulative_quantity_at] = (cumulative_quantity_base + 0 + cumulative_quantity_at + 1) % 256; cumulative_quantity_at = cumulative_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* Cumulative Quantity to the wire, 4 bytes from where the cursor stands */
inline encode_cumulative_quantity(cumulative_quantity_record) {
  cumulative_quantity_at = 0;
  do
  :: cumulative_quantity_at < 4 -> wire[at] = cumulative_quantity_record.cumulative_quantity_value[cumulative_quantity_at]; at = at + 1; cumulative_quantity_at = cumulative_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* Cumulative Quantity off the wire, 4 bytes from where the cursor stands */
inline decode_cumulative_quantity(cumulative_quantity_record) {
  cumulative_quantity_at = 0;
  do
  :: cumulative_quantity_at < 4 -> cumulative_quantity_record.cumulative_quantity_value[cumulative_quantity_at] = wire[at]; at = at + 1; cumulative_quantity_at = cumulative_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cumulative Quantity is what was written, byte for byte */
inline equal_cumulative_quantity(cumulative_quantity_read, cumulative_quantity_written) {
  cumulative_quantity_at = 0;
  do
  :: cumulative_quantity_at < 4 -> assert(cumulative_quantity_read.cumulative_quantity_value[cumulative_quantity_at] == cumulative_quantity_written.cumulative_quantity_value[cumulative_quantity_at]); cumulative_quantity_at = cumulative_quantity_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Customer Order Capacity: 1 bytes ---------------------------------------- */

/* Customer Order Capacity */
typedef CustomerOrderCapacity {
  byte customer_order_capacity_value
};

/* every byte of Customer Order Capacity set to one value */
inline fill_customer_order_capacity(customer_order_capacity_record, customer_order_capacity_value_) {
  customer_order_capacity_record.customer_order_capacity_value = customer_order_capacity_value_;
  skip
}

/* each byte of Customer Order Capacity set to where it lies, so a field read out of place says so */
inline ramp_customer_order_capacity(customer_order_capacity_record, customer_order_capacity_base) {
  customer_order_capacity_record.customer_order_capacity_value = (customer_order_capacity_base + 0 + 1) % 256;
  skip
}

/* Customer Order Capacity to the wire, 1 bytes from where the cursor stands */
inline encode_customer_order_capacity(customer_order_capacity_record) {
  wire[at] = customer_order_capacity_record.customer_order_capacity_value; at = at + 1;
  skip
}

/* Customer Order Capacity off the wire, 1 bytes from where the cursor stands */
inline decode_customer_order_capacity(customer_order_capacity_record) {
  customer_order_capacity_record.customer_order_capacity_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Customer Order Capacity is what was written, byte for byte */
inline equal_customer_order_capacity(customer_order_capacity_read, customer_order_capacity_written) {
  assert(customer_order_capacity_read.customer_order_capacity_value == customer_order_capacity_written.customer_order_capacity_value);
  skip
}

/* ---- Cancelled Order Message: 17 bytes --------------------------------------- */

/* An order has been reduced or cancelled */
typedef CancelledOrderMessage {
  byte timestamp[8];
  byte user_ref_num[4];
  byte decrement_quantity[4];
  byte cancel_reason
};

int cancelled_order_message_at;

/* every byte of Cancelled Order Message set to one value */
inline fill_cancelled_order_message(cancelled_order_message_record, cancelled_order_message_value) {
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> cancelled_order_message_record.timestamp[cancelled_order_message_at] = cancelled_order_message_value; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 4 -> cancelled_order_message_record.user_ref_num[cancelled_order_message_at] = cancelled_order_message_value; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 4 -> cancelled_order_message_record.decrement_quantity[cancelled_order_message_at] = cancelled_order_message_value; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.cancel_reason = cancelled_order_message_value;
  skip
}

/* each byte of Cancelled Order Message set to where it lies, so a field read out of place says so */
inline ramp_cancelled_order_message(cancelled_order_message_record, cancelled_order_message_base) {
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> cancelled_order_message_record.timestamp[cancelled_order_message_at] = (cancelled_order_message_base + 0 + cancelled_order_message_at + 1) % 256; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 4 -> cancelled_order_message_record.user_ref_num[cancelled_order_message_at] = (cancelled_order_message_base + 8 + cancelled_order_message_at + 1) % 256; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 4 -> cancelled_order_message_record.decrement_quantity[cancelled_order_message_at] = (cancelled_order_message_base + 12 + cancelled_order_message_at + 1) % 256; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.cancel_reason = (cancelled_order_message_base + 16 + 1) % 256;
  skip
}

/* Cancelled Order Message to the wire, 17 bytes from where the cursor stands */
inline encode_cancelled_order_message(cancelled_order_message_record) {
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> wire[at] = cancelled_order_message_record.timestamp[cancelled_order_message_at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 4 -> wire[at] = cancelled_order_message_record.user_ref_num[cancelled_order_message_at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 4 -> wire[at] = cancelled_order_message_record.decrement_quantity[cancelled_order_message_at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  wire[at] = cancelled_order_message_record.cancel_reason; at = at + 1;
  skip
}

/* Cancelled Order Message off the wire, 17 bytes from where the cursor stands */
inline decode_cancelled_order_message(cancelled_order_message_record) {
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> cancelled_order_message_record.timestamp[cancelled_order_message_at] = wire[at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 4 -> cancelled_order_message_record.user_ref_num[cancelled_order_message_at] = wire[at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 4 -> cancelled_order_message_record.decrement_quantity[cancelled_order_message_at] = wire[at]; at = at + 1; cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Cancelled Order Message is what was written, byte for byte */
inline equal_cancelled_order_message(cancelled_order_message_read, cancelled_order_message_written) {
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 8 -> assert(cancelled_order_message_read.timestamp[cancelled_order_message_at] == cancelled_order_message_written.timestamp[cancelled_order_message_at]); cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 4 -> assert(cancelled_order_message_read.user_ref_num[cancelled_order_message_at] == cancelled_order_message_written.user_ref_num[cancelled_order_message_at]); cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  cancelled_order_message_at = 0;
  do
  :: cancelled_order_message_at < 4 -> assert(cancelled_order_message_read.decrement_quantity[cancelled_order_message_at] == cancelled_order_message_written.decrement_quantity[cancelled_order_message_at]); cancelled_order_message_at = cancelled_order_message_at + 1
  :: else -> break
  od;
  assert(cancelled_order_message_read.cancel_reason == cancelled_order_message_written.cancel_reason);
  skip
}

/* ---- Cancel Pending Message: 13 bytes ---------------------------------------- */

/* A cancel request cannot be applied immediately */
typedef CancelPendingMessage {
  byte timestamp[8];
  byte user_ref_num[4];
  byte cancel_pending_reason
};

int cancel_pending_message_at;

/* every byte of Cancel Pending Message set to one value */
inline fill_cancel_pending_message(cancel_pending_message_record, cancel_pending_message_value) {
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 8 -> cancel_pending_message_record.timestamp[cancel_pending_message_at] = cancel_pending_message_value; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 4 -> cancel_pending_message_record.user_ref_num[cancel_pending_message_at] = cancel_pending_message_value; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  cancel_pending_message_record.cancel_pending_reason = cancel_pending_message_value;
  skip
}

/* each byte of Cancel Pending Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_pending_message(cancel_pending_message_record, cancel_pending_message_base) {
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 8 -> cancel_pending_message_record.timestamp[cancel_pending_message_at] = (cancel_pending_message_base + 0 + cancel_pending_message_at + 1) % 256; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 4 -> cancel_pending_message_record.user_ref_num[cancel_pending_message_at] = (cancel_pending_message_base + 8 + cancel_pending_message_at + 1) % 256; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  cancel_pending_message_record.cancel_pending_reason = (cancel_pending_message_base + 12 + 1) % 256;
  skip
}

/* Cancel Pending Message to the wire, 13 bytes from where the cursor stands */
inline encode_cancel_pending_message(cancel_pending_message_record) {
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 8 -> wire[at] = cancel_pending_message_record.timestamp[cancel_pending_message_at]; at = at + 1; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 4 -> wire[at] = cancel_pending_message_record.user_ref_num[cancel_pending_message_at]; at = at + 1; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_pending_message_record.cancel_pending_reason; at = at + 1;
  skip
}

/* Cancel Pending Message off the wire, 13 bytes from where the cursor stands */
inline decode_cancel_pending_message(cancel_pending_message_record) {
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 8 -> cancel_pending_message_record.timestamp[cancel_pending_message_at] = wire[at]; at = at + 1; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 4 -> cancel_pending_message_record.user_ref_num[cancel_pending_message_at] = wire[at]; at = at + 1; cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  cancel_pending_message_record.cancel_pending_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Cancel Pending Message is what was written, byte for byte */
inline equal_cancel_pending_message(cancel_pending_message_read, cancel_pending_message_written) {
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 8 -> assert(cancel_pending_message_read.timestamp[cancel_pending_message_at] == cancel_pending_message_written.timestamp[cancel_pending_message_at]); cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  cancel_pending_message_at = 0;
  do
  :: cancel_pending_message_at < 4 -> assert(cancel_pending_message_read.user_ref_num[cancel_pending_message_at] == cancel_pending_message_written.user_ref_num[cancel_pending_message_at]); cancel_pending_message_at = cancel_pending_message_at + 1
  :: else -> break
  od;
  assert(cancel_pending_message_read.cancel_pending_reason == cancel_pending_message_written.cancel_pending_reason);
  skip
}

/* ---- Replace Pending Message: 17 bytes --------------------------------------- */

/* A replace request cannot be applied immediately */
typedef ReplacePendingMessage {
  byte timestamp[8];
  byte orig_user_ref_num[4];
  byte user_ref_num[4];
  byte replace_pending_reason
};

int replace_pending_message_at;

/* every byte of Replace Pending Message set to one value */
inline fill_replace_pending_message(replace_pending_message_record, replace_pending_message_value) {
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 8 -> replace_pending_message_record.timestamp[replace_pending_message_at] = replace_pending_message_value; replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 4 -> replace_pending_message_record.orig_user_ref_num[replace_pending_message_at] = replace_pending_message_value; replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 4 -> replace_pending_message_record.user_ref_num[replace_pending_message_at] = replace_pending_message_value; replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  replace_pending_message_record.replace_pending_reason = replace_pending_message_value;
  skip
}

/* each byte of Replace Pending Message set to where it lies, so a field read out of place says so */
inline ramp_replace_pending_message(replace_pending_message_record, replace_pending_message_base) {
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 8 -> replace_pending_message_record.timestamp[replace_pending_message_at] = (replace_pending_message_base + 0 + replace_pending_message_at + 1) % 256; replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 4 -> replace_pending_message_record.orig_user_ref_num[replace_pending_message_at] = (replace_pending_message_base + 8 + replace_pending_message_at + 1) % 256; replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 4 -> replace_pending_message_record.user_ref_num[replace_pending_message_at] = (replace_pending_message_base + 12 + replace_pending_message_at + 1) % 256; replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  replace_pending_message_record.replace_pending_reason = (replace_pending_message_base + 16 + 1) % 256;
  skip
}

/* Replace Pending Message to the wire, 17 bytes from where the cursor stands */
inline encode_replace_pending_message(replace_pending_message_record) {
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 8 -> wire[at] = replace_pending_message_record.timestamp[replace_pending_message_at]; at = at + 1; replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 4 -> wire[at] = replace_pending_message_record.orig_user_ref_num[replace_pending_message_at]; at = at + 1; replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 4 -> wire[at] = replace_pending_message_record.user_ref_num[replace_pending_message_at]; at = at + 1; replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  wire[at] = replace_pending_message_record.replace_pending_reason; at = at + 1;
  skip
}

/* Replace Pending Message off the wire, 17 bytes from where the cursor stands */
inline decode_replace_pending_message(replace_pending_message_record) {
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 8 -> replace_pending_message_record.timestamp[replace_pending_message_at] = wire[at]; at = at + 1; replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 4 -> replace_pending_message_record.orig_user_ref_num[replace_pending_message_at] = wire[at]; at = at + 1; replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 4 -> replace_pending_message_record.user_ref_num[replace_pending_message_at] = wire[at]; at = at + 1; replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  replace_pending_message_record.replace_pending_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Replace Pending Message is what was written, byte for byte */
inline equal_replace_pending_message(replace_pending_message_read, replace_pending_message_written) {
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 8 -> assert(replace_pending_message_read.timestamp[replace_pending_message_at] == replace_pending_message_written.timestamp[replace_pending_message_at]); replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 4 -> assert(replace_pending_message_read.orig_user_ref_num[replace_pending_message_at] == replace_pending_message_written.orig_user_ref_num[replace_pending_message_at]); replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  replace_pending_message_at = 0;
  do
  :: replace_pending_message_at < 4 -> assert(replace_pending_message_read.user_ref_num[replace_pending_message_at] == replace_pending_message_written.user_ref_num[replace_pending_message_at]); replace_pending_message_at = replace_pending_message_at + 1
  :: else -> break
  od;
  assert(replace_pending_message_read.replace_pending_reason == replace_pending_message_written.replace_pending_reason);
  skip
}

/* ---- Broken Trade Message: 20 bytes ------------------------------------------ */

/* An execution has been broken and cannot be reinstated */
typedef BrokenTradeMessage {
  byte timestamp[8];
  byte user_ref_num[4];
  byte match_number[4];
  byte broken_trade_reason;
  byte trading_mode;
  byte transaction_category;
  byte transaction_type_algo_indicator
};

int broken_trade_message_at;

/* every byte of Broken Trade Message set to one value */
inline fill_broken_trade_message(broken_trade_message_record, broken_trade_message_value) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.timestamp[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.user_ref_num[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.match_number[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.broken_trade_reason = broken_trade_message_value;
  broken_trade_message_record.trading_mode = broken_trade_message_value;
  broken_trade_message_record.transaction_category = broken_trade_message_value;
  broken_trade_message_record.transaction_type_algo_indicator = broken_trade_message_value;
  skip
}

/* each byte of Broken Trade Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_message(broken_trade_message_record, broken_trade_message_base) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.timestamp[broken_trade_message_at] = (broken_trade_message_base + 0 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.user_ref_num[broken_trade_message_at] = (broken_trade_message_base + 8 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.match_number[broken_trade_message_at] = (broken_trade_message_base + 12 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.broken_trade_reason = (broken_trade_message_base + 16 + 1) % 256;
  broken_trade_message_record.trading_mode = (broken_trade_message_base + 17 + 1) % 256;
  broken_trade_message_record.transaction_category = (broken_trade_message_base + 18 + 1) % 256;
  broken_trade_message_record.transaction_type_algo_indicator = (broken_trade_message_base + 19 + 1) % 256;
  skip
}

/* Broken Trade Message to the wire, 20 bytes from where the cursor stands */
inline encode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.timestamp[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> wire[at] = broken_trade_message_record.user_ref_num[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> wire[at] = broken_trade_message_record.match_number[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = broken_trade_message_record.broken_trade_reason; at = at + 1;
  wire[at] = broken_trade_message_record.trading_mode; at = at + 1;
  wire[at] = broken_trade_message_record.transaction_category; at = at + 1;
  wire[at] = broken_trade_message_record.transaction_type_algo_indicator; at = at + 1;
  skip
}

/* Broken Trade Message off the wire, 20 bytes from where the cursor stands */
inline decode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.timestamp[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.user_ref_num[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.match_number[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.broken_trade_reason = wire[at]; at = at + 1;
  broken_trade_message_record.trading_mode = wire[at]; at = at + 1;
  broken_trade_message_record.transaction_category = wire[at]; at = at + 1;
  broken_trade_message_record.transaction_type_algo_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Broken Trade Message is what was written, byte for byte */
inline equal_broken_trade_message(broken_trade_message_read, broken_trade_message_written) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.timestamp[broken_trade_message_at] == broken_trade_message_written.timestamp[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> assert(broken_trade_message_read.user_ref_num[broken_trade_message_at] == broken_trade_message_written.user_ref_num[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> assert(broken_trade_message_read.match_number[broken_trade_message_at] == broken_trade_message_written.match_number[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  assert(broken_trade_message_read.broken_trade_reason == broken_trade_message_written.broken_trade_reason);
  assert(broken_trade_message_read.trading_mode == broken_trade_message_written.trading_mode);
  assert(broken_trade_message_read.transaction_category == broken_trade_message_written.transaction_category);
  assert(broken_trade_message_read.transaction_type_algo_indicator == broken_trade_message_written.transaction_type_algo_indicator);
  skip
}

/* ---- Rejected Order Message: 14 bytes ---------------------------------------- */

/* An order has been rejected */
typedef RejectedOrderMessage {
  byte timestamp[8];
  byte user_ref_num[4];
  byte rejected_order_reason[2]
};

int rejected_order_message_at;

/* every byte of Rejected Order Message set to one value */
inline fill_rejected_order_message(rejected_order_message_record, rejected_order_message_value) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 8 -> rejected_order_message_record.timestamp[rejected_order_message_at] = rejected_order_message_value; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 4 -> rejected_order_message_record.user_ref_num[rejected_order_message_at] = rejected_order_message_value; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 2 -> rejected_order_message_record.rejected_order_reason[rejected_order_message_at] = rejected_order_message_value; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Rejected Order Message set to where it lies, so a field read out of place says so */
inline ramp_rejected_order_message(rejected_order_message_record, rejected_order_message_base) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 8 -> rejected_order_message_record.timestamp[rejected_order_message_at] = (rejected_order_message_base + 0 + rejected_order_message_at + 1) % 256; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 4 -> rejected_order_message_record.user_ref_num[rejected_order_message_at] = (rejected_order_message_base + 8 + rejected_order_message_at + 1) % 256; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 2 -> rejected_order_message_record.rejected_order_reason[rejected_order_message_at] = (rejected_order_message_base + 12 + rejected_order_message_at + 1) % 256; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Rejected Order Message to the wire, 14 bytes from where the cursor stands */
inline encode_rejected_order_message(rejected_order_message_record) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 8 -> wire[at] = rejected_order_message_record.timestamp[rejected_order_message_at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 4 -> wire[at] = rejected_order_message_record.user_ref_num[rejected_order_message_at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 2 -> wire[at] = rejected_order_message_record.rejected_order_reason[rejected_order_message_at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Rejected Order Message off the wire, 14 bytes from where the cursor stands */
inline decode_rejected_order_message(rejected_order_message_record) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 8 -> rejected_order_message_record.timestamp[rejected_order_message_at] = wire[at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 4 -> rejected_order_message_record.user_ref_num[rejected_order_message_at] = wire[at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 2 -> rejected_order_message_record.rejected_order_reason[rejected_order_message_at] = wire[at]; at = at + 1; rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Rejected Order Message is what was written, byte for byte */
inline equal_rejected_order_message(rejected_order_message_read, rejected_order_message_written) {
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 8 -> assert(rejected_order_message_read.timestamp[rejected_order_message_at] == rejected_order_message_written.timestamp[rejected_order_message_at]); rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 4 -> assert(rejected_order_message_read.user_ref_num[rejected_order_message_at] == rejected_order_message_written.user_ref_num[rejected_order_message_at]); rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  rejected_order_message_at = 0;
  do
  :: rejected_order_message_at < 2 -> assert(rejected_order_message_read.rejected_order_reason[rejected_order_message_at] == rejected_order_message_written.rejected_order_reason[rejected_order_message_at]); rejected_order_message_at = rejected_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Rejected Message: 14 bytes --------------------------------------- */

/* A cancel request has been rejected */
typedef CancelRejectedMessage {
  byte timestamp[8];
  byte user_ref_num[4];
  byte cancel_rejected_reason[2]
};

int cancel_rejected_message_at;

/* every byte of Cancel Rejected Message set to one value */
inline fill_cancel_rejected_message(cancel_rejected_message_record, cancel_rejected_message_value) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> cancel_rejected_message_record.timestamp[cancel_rejected_message_at] = cancel_rejected_message_value; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> cancel_rejected_message_record.user_ref_num[cancel_rejected_message_at] = cancel_rejected_message_value; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 2 -> cancel_rejected_message_record.cancel_rejected_reason[cancel_rejected_message_at] = cancel_rejected_message_value; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_rejected_message(cancel_rejected_message_record, cancel_rejected_message_base) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> cancel_rejected_message_record.timestamp[cancel_rejected_message_at] = (cancel_rejected_message_base + 0 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> cancel_rejected_message_record.user_ref_num[cancel_rejected_message_at] = (cancel_rejected_message_base + 8 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 2 -> cancel_rejected_message_record.cancel_rejected_reason[cancel_rejected_message_at] = (cancel_rejected_message_base + 12 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Rejected Message to the wire, 14 bytes from where the cursor stands */
inline encode_cancel_rejected_message(cancel_rejected_message_record) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> wire[at] = cancel_rejected_message_record.timestamp[cancel_rejected_message_at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> wire[at] = cancel_rejected_message_record.user_ref_num[cancel_rejected_message_at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 2 -> wire[at] = cancel_rejected_message_record.cancel_rejected_reason[cancel_rejected_message_at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Rejected Message off the wire, 14 bytes from where the cursor stands */
inline decode_cancel_rejected_message(cancel_rejected_message_record) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> cancel_rejected_message_record.timestamp[cancel_rejected_message_at] = wire[at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> cancel_rejected_message_record.user_ref_num[cancel_rejected_message_at] = wire[at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 2 -> cancel_rejected_message_record.cancel_rejected_reason[cancel_rejected_message_at] = wire[at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Rejected Message is what was written, byte for byte */
inline equal_cancel_rejected_message(cancel_rejected_message_read, cancel_rejected_message_written) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> assert(cancel_rejected_message_read.timestamp[cancel_rejected_message_at] == cancel_rejected_message_written.timestamp[cancel_rejected_message_at]); cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 4 -> assert(cancel_rejected_message_read.user_ref_num[cancel_rejected_message_at] == cancel_rejected_message_written.user_ref_num[cancel_rejected_message_at]); cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 2 -> assert(cancel_rejected_message_read.cancel_rejected_reason[cancel_rejected_message_at] == cancel_rejected_message_written.cancel_rejected_reason[cancel_rejected_message_at]); cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mmo Refresh Request Message: 17 bytes ----------------------------------- */

/* Requests a market maker order refresh */
typedef MmoRefreshRequestMessage {
  byte timestamp[8];
  Firm firm;
  byte order_book[4];
  byte mmo_refresh_reason
};

int mmo_refresh_request_message_at;

/* every byte of Mmo Refresh Request Message set to one value */
inline fill_mmo_refresh_request_message(mmo_refresh_request_message_record, mmo_refresh_request_message_value) {
  mmo_refresh_request_message_at = 0;
  do
  :: mmo_refresh_request_message_at < 8 -> mmo_refresh_request_message_record.timestamp[mmo_refresh_request_message_at] = mmo_refresh_request_message_value; mmo_refresh_request_message_at = mmo_refresh_request_message_at + 1
  :: else -> break
  od;
  fill_firm(mmo_refresh_request_message_record.firm, mmo_refresh_request_message_value);
  mmo_refresh_request_message_at = 0;
  do
  :: mmo_refresh_request_message_at < 4 -> mmo_refresh_request_message_record.order_book[mmo_refresh_request_message_at] = mmo_refresh_request_message_value; mmo_refresh_request_message_at = mmo_refresh_request_message_at + 1
  :: else -> break
  od;
  mmo_refresh_request_message_record.mmo_refresh_reason = mmo_refresh_request_message_value;
  skip
}

/* each byte of Mmo Refresh Request Message set to where it lies, so a field read out of place says so */
inline ramp_mmo_refresh_request_message(mmo_refresh_request_message_record, mmo_refresh_request_message_base) {
  mmo_refresh_request_message_at = 0;
  do
  :: mmo_refresh_request_message_at < 8 -> mmo_refresh_request_message_record.timestamp[mmo_refresh_request_message_at] = (mmo_refresh_request_message_base + 0 + mmo_refresh_request_message_at + 1) % 256; mmo_refresh_request_message_at = mmo_refresh_request_message_at + 1
  :: else -> break
  od;
  ramp_firm(mmo_refresh_request_message_record.firm, mmo_refresh_request_message_base + 8);
  mmo_refresh_request_message_at = 0;
  do
  :: mmo_refresh_request_message_at < 4 -> mmo_refresh_request_message_record.order_book[mmo_refresh_request_message_at] = (mmo_refresh_request_message_base + 12 + mmo_refresh_request_message_at + 1) % 256; mmo_refresh_request_message_at = mmo_refresh_request_message_at + 1
  :: else -> break
  od;
  mmo_refresh_request_message_record.mmo_refresh_reason = (mmo_refresh_request_message_base + 16 + 1) % 256;
  skip
}

/* Mmo Refresh Request Message to the wire, 17 bytes from where the cursor stands */
inline encode_mmo_refresh_request_message(mmo_refresh_request_message_record) {
  mmo_refresh_request_message_at = 0;
  do
  :: mmo_refresh_request_message_at < 8 -> wire[at] = mmo_refresh_request_message_record.timestamp[mmo_refresh_request_message_at]; at = at + 1; mmo_refresh_request_message_at = mmo_refresh_request_message_at + 1
  :: else -> break
  od;
  encode_firm(mmo_refresh_request_message_record.firm);
  mmo_refresh_request_message_at = 0;
  do
  :: mmo_refresh_request_message_at < 4 -> wire[at] = mmo_refresh_request_message_record.order_book[mmo_refresh_request_message_at]; at = at + 1; mmo_refresh_request_message_at = mmo_refresh_request_message_at + 1
  :: else -> break
  od;
  wire[at] = mmo_refresh_request_message_record.mmo_refresh_reason; at = at + 1;
  skip
}

/* Mmo Refresh Request Message off the wire, 17 bytes from where the cursor stands */
inline decode_mmo_refresh_request_message(mmo_refresh_request_message_record) {
  mmo_refresh_request_message_at = 0;
  do
  :: mmo_refresh_request_message_at < 8 -> mmo_refresh_request_message_record.timestamp[mmo_refresh_request_message_at] = wire[at]; at = at + 1; mmo_refresh_request_message_at = mmo_refresh_request_message_at + 1
  :: else -> break
  od;
  decode_firm(mmo_refresh_request_message_record.firm);
  mmo_refresh_request_message_at = 0;
  do
  :: mmo_refresh_request_message_at < 4 -> mmo_refresh_request_message_record.order_book[mmo_refresh_request_message_at] = wire[at]; at = at + 1; mmo_refresh_request_message_at = mmo_refresh_request_message_at + 1
  :: else -> break
  od;
  mmo_refresh_request_message_record.mmo_refresh_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Mmo Refresh Request Message is what was written, byte for byte */
inline equal_mmo_refresh_request_message(mmo_refresh_request_message_read, mmo_refresh_request_message_written) {
  mmo_refresh_request_message_at = 0;
  do
  :: mmo_refresh_request_message_at < 8 -> assert(mmo_refresh_request_message_read.timestamp[mmo_refresh_request_message_at] == mmo_refresh_request_message_written.timestamp[mmo_refresh_request_message_at]); mmo_refresh_request_message_at = mmo_refresh_request_message_at + 1
  :: else -> break
  od;
  equal_firm(mmo_refresh_request_message_read.firm, mmo_refresh_request_message_written.firm);
  mmo_refresh_request_message_at = 0;
  do
  :: mmo_refresh_request_message_at < 4 -> assert(mmo_refresh_request_message_read.order_book[mmo_refresh_request_message_at] == mmo_refresh_request_message_written.order_book[mmo_refresh_request_message_at]); mmo_refresh_request_message_at = mmo_refresh_request_message_at + 1
  :: else -> break
  od;
  assert(mmo_refresh_request_message_read.mmo_refresh_reason == mmo_refresh_request_message_written.mmo_refresh_reason);
  skip
}

/* ---- Account Query Response Message: 12 bytes -------------------------------- */

/* Indicates the next available UserRefNum */
typedef AccountQueryResponseMessage {
  byte timestamp[8];
  byte next_user_ref_num[4]
};

int account_query_response_message_at;

/* every byte of Account Query Response Message set to one value */
inline fill_account_query_response_message(account_query_response_message_record, account_query_response_message_value) {
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 8 -> account_query_response_message_record.timestamp[account_query_response_message_at] = account_query_response_message_value; account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 4 -> account_query_response_message_record.next_user_ref_num[account_query_response_message_at] = account_query_response_message_value; account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Account Query Response Message set to where it lies, so a field read out of place says so */
inline ramp_account_query_response_message(account_query_response_message_record, account_query_response_message_base) {
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 8 -> account_query_response_message_record.timestamp[account_query_response_message_at] = (account_query_response_message_base + 0 + account_query_response_message_at + 1) % 256; account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 4 -> account_query_response_message_record.next_user_ref_num[account_query_response_message_at] = (account_query_response_message_base + 8 + account_query_response_message_at + 1) % 256; account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Account Query Response Message to the wire, 12 bytes from where the cursor stands */
inline encode_account_query_response_message(account_query_response_message_record) {
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 8 -> wire[at] = account_query_response_message_record.timestamp[account_query_response_message_at]; at = at + 1; account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 4 -> wire[at] = account_query_response_message_record.next_user_ref_num[account_query_response_message_at]; at = at + 1; account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Account Query Response Message off the wire, 12 bytes from where the cursor stands */
inline decode_account_query_response_message(account_query_response_message_record) {
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 8 -> account_query_response_message_record.timestamp[account_query_response_message_at] = wire[at]; at = at + 1; account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 4 -> account_query_response_message_record.next_user_ref_num[account_query_response_message_at] = wire[at]; at = at + 1; account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Account Query Response Message is what was written, byte for byte */
inline equal_account_query_response_message(account_query_response_message_read, account_query_response_message_written) {
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 8 -> assert(account_query_response_message_read.timestamp[account_query_response_message_at] == account_query_response_message_written.timestamp[account_query_response_message_at]); account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 4 -> assert(account_query_response_message_read.next_user_ref_num[account_query_response_message_at] == account_query_response_message_written.next_user_ref_num[account_query_response_message_at]); account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Gtc Cancelled Message: 22 bytes ----------------------------------------- */

/* A Gtc order could not be restated in the morning */
typedef GtcCancelledMessage {
  byte timestamp[8];
  OriginalOrderEntryDate original_order_entry_date;
  OriginalOrderReferenceNumber original_order_reference_number;
  byte reason[2]
};

int gtc_cancelled_message_at;

/* every byte of Gtc Cancelled Message set to one value */
inline fill_gtc_cancelled_message(gtc_cancelled_message_record, gtc_cancelled_message_value) {
  gtc_cancelled_message_at = 0;
  do
  :: gtc_cancelled_message_at < 8 -> gtc_cancelled_message_record.timestamp[gtc_cancelled_message_at] = gtc_cancelled_message_value; gtc_cancelled_message_at = gtc_cancelled_message_at + 1
  :: else -> break
  od;
  fill_original_order_entry_date(gtc_cancelled_message_record.original_order_entry_date, gtc_cancelled_message_value);
  fill_original_order_reference_number(gtc_cancelled_message_record.original_order_reference_number, gtc_cancelled_message_value);
  gtc_cancelled_message_at = 0;
  do
  :: gtc_cancelled_message_at < 2 -> gtc_cancelled_message_record.reason[gtc_cancelled_message_at] = gtc_cancelled_message_value; gtc_cancelled_message_at = gtc_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Gtc Cancelled Message set to where it lies, so a field read out of place says so */
inline ramp_gtc_cancelled_message(gtc_cancelled_message_record, gtc_cancelled_message_base) {
  gtc_cancelled_message_at = 0;
  do
  :: gtc_cancelled_message_at < 8 -> gtc_cancelled_message_record.timestamp[gtc_cancelled_message_at] = (gtc_cancelled_message_base + 0 + gtc_cancelled_message_at + 1) % 256; gtc_cancelled_message_at = gtc_cancelled_message_at + 1
  :: else -> break
  od;
  ramp_original_order_entry_date(gtc_cancelled_message_record.original_order_entry_date, gtc_cancelled_message_base + 8);
  ramp_original_order_reference_number(gtc_cancelled_message_record.original_order_reference_number, gtc_cancelled_message_base + 12);
  gtc_cancelled_message_at = 0;
  do
  :: gtc_cancelled_message_at < 2 -> gtc_cancelled_message_record.reason[gtc_cancelled_message_at] = (gtc_cancelled_message_base + 20 + gtc_cancelled_message_at + 1) % 256; gtc_cancelled_message_at = gtc_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gtc Cancelled Message to the wire, 22 bytes from where the cursor stands */
inline encode_gtc_cancelled_message(gtc_cancelled_message_record) {
  gtc_cancelled_message_at = 0;
  do
  :: gtc_cancelled_message_at < 8 -> wire[at] = gtc_cancelled_message_record.timestamp[gtc_cancelled_message_at]; at = at + 1; gtc_cancelled_message_at = gtc_cancelled_message_at + 1
  :: else -> break
  od;
  encode_original_order_entry_date(gtc_cancelled_message_record.original_order_entry_date);
  encode_original_order_reference_number(gtc_cancelled_message_record.original_order_reference_number);
  gtc_cancelled_message_at = 0;
  do
  :: gtc_cancelled_message_at < 2 -> wire[at] = gtc_cancelled_message_record.reason[gtc_cancelled_message_at]; at = at + 1; gtc_cancelled_message_at = gtc_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gtc Cancelled Message off the wire, 22 bytes from where the cursor stands */
inline decode_gtc_cancelled_message(gtc_cancelled_message_record) {
  gtc_cancelled_message_at = 0;
  do
  :: gtc_cancelled_message_at < 8 -> gtc_cancelled_message_record.timestamp[gtc_cancelled_message_at] = wire[at]; at = at + 1; gtc_cancelled_message_at = gtc_cancelled_message_at + 1
  :: else -> break
  od;
  decode_original_order_entry_date(gtc_cancelled_message_record.original_order_entry_date);
  decode_original_order_reference_number(gtc_cancelled_message_record.original_order_reference_number);
  gtc_cancelled_message_at = 0;
  do
  :: gtc_cancelled_message_at < 2 -> gtc_cancelled_message_record.reason[gtc_cancelled_message_at] = wire[at]; at = at + 1; gtc_cancelled_message_at = gtc_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Gtc Cancelled Message is what was written, byte for byte */
inline equal_gtc_cancelled_message(gtc_cancelled_message_read, gtc_cancelled_message_written) {
  gtc_cancelled_message_at = 0;
  do
  :: gtc_cancelled_message_at < 8 -> assert(gtc_cancelled_message_read.timestamp[gtc_cancelled_message_at] == gtc_cancelled_message_written.timestamp[gtc_cancelled_message_at]); gtc_cancelled_message_at = gtc_cancelled_message_at + 1
  :: else -> break
  od;
  equal_original_order_entry_date(gtc_cancelled_message_read.original_order_entry_date, gtc_cancelled_message_written.original_order_entry_date);
  equal_original_order_reference_number(gtc_cancelled_message_read.original_order_reference_number, gtc_cancelled_message_written.original_order_reference_number);
  gtc_cancelled_message_at = 0;
  do
  :: gtc_cancelled_message_at < 2 -> assert(gtc_cancelled_message_read.reason[gtc_cancelled_message_at] == gtc_cancelled_message_written.reason[gtc_cancelled_message_at]); gtc_cancelled_message_at = gtc_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Response To Mmi Notification Message: 29 bytes -------------------------- */

/* Response to a market making instruction notification */
typedef ResponseToMmiNotificationMessage {
  byte timestamp[8];
  byte user_ref_num[4];
  byte order_book[4];
  byte instruction;
  byte add_or_remove;
  Firm firm;
  byte user[6];
  byte instruction_status
};

int response_to_mmi_notification_message_at;

/* every byte of Response To Mmi Notification Message set to one value */
inline fill_response_to_mmi_notification_message(response_to_mmi_notification_message_record, response_to_mmi_notification_message_value) {
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 8 -> response_to_mmi_notification_message_record.timestamp[response_to_mmi_notification_message_at] = response_to_mmi_notification_message_value; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 4 -> response_to_mmi_notification_message_record.user_ref_num[response_to_mmi_notification_message_at] = response_to_mmi_notification_message_value; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 4 -> response_to_mmi_notification_message_record.order_book[response_to_mmi_notification_message_at] = response_to_mmi_notification_message_value; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_record.instruction = response_to_mmi_notification_message_value;
  response_to_mmi_notification_message_record.add_or_remove = response_to_mmi_notification_message_value;
  fill_firm(response_to_mmi_notification_message_record.firm, response_to_mmi_notification_message_value);
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 6 -> response_to_mmi_notification_message_record.user[response_to_mmi_notification_message_at] = response_to_mmi_notification_message_value; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_record.instruction_status = response_to_mmi_notification_message_value;
  skip
}

/* each byte of Response To Mmi Notification Message set to where it lies, so a field read out of place says so */
inline ramp_response_to_mmi_notification_message(response_to_mmi_notification_message_record, response_to_mmi_notification_message_base) {
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 8 -> response_to_mmi_notification_message_record.timestamp[response_to_mmi_notification_message_at] = (response_to_mmi_notification_message_base + 0 + response_to_mmi_notification_message_at + 1) % 256; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 4 -> response_to_mmi_notification_message_record.user_ref_num[response_to_mmi_notification_message_at] = (response_to_mmi_notification_message_base + 8 + response_to_mmi_notification_message_at + 1) % 256; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 4 -> response_to_mmi_notification_message_record.order_book[response_to_mmi_notification_message_at] = (response_to_mmi_notification_message_base + 12 + response_to_mmi_notification_message_at + 1) % 256; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_record.instruction = (response_to_mmi_notification_message_base + 16 + 1) % 256;
  response_to_mmi_notification_message_record.add_or_remove = (response_to_mmi_notification_message_base + 17 + 1) % 256;
  ramp_firm(response_to_mmi_notification_message_record.firm, response_to_mmi_notification_message_base + 18);
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 6 -> response_to_mmi_notification_message_record.user[response_to_mmi_notification_message_at] = (response_to_mmi_notification_message_base + 22 + response_to_mmi_notification_message_at + 1) % 256; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_record.instruction_status = (response_to_mmi_notification_message_base + 28 + 1) % 256;
  skip
}

/* Response To Mmi Notification Message to the wire, 29 bytes from where the cursor stands */
inline encode_response_to_mmi_notification_message(response_to_mmi_notification_message_record) {
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 8 -> wire[at] = response_to_mmi_notification_message_record.timestamp[response_to_mmi_notification_message_at]; at = at + 1; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 4 -> wire[at] = response_to_mmi_notification_message_record.user_ref_num[response_to_mmi_notification_message_at]; at = at + 1; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 4 -> wire[at] = response_to_mmi_notification_message_record.order_book[response_to_mmi_notification_message_at]; at = at + 1; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = response_to_mmi_notification_message_record.instruction; at = at + 1;
  wire[at] = response_to_mmi_notification_message_record.add_or_remove; at = at + 1;
  encode_firm(response_to_mmi_notification_message_record.firm);
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 6 -> wire[at] = response_to_mmi_notification_message_record.user[response_to_mmi_notification_message_at]; at = at + 1; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = response_to_mmi_notification_message_record.instruction_status; at = at + 1;
  skip
}

/* Response To Mmi Notification Message off the wire, 29 bytes from where the cursor stands */
inline decode_response_to_mmi_notification_message(response_to_mmi_notification_message_record) {
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 8 -> response_to_mmi_notification_message_record.timestamp[response_to_mmi_notification_message_at] = wire[at]; at = at + 1; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 4 -> response_to_mmi_notification_message_record.user_ref_num[response_to_mmi_notification_message_at] = wire[at]; at = at + 1; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 4 -> response_to_mmi_notification_message_record.order_book[response_to_mmi_notification_message_at] = wire[at]; at = at + 1; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_record.instruction = wire[at]; at = at + 1;
  response_to_mmi_notification_message_record.add_or_remove = wire[at]; at = at + 1;
  decode_firm(response_to_mmi_notification_message_record.firm);
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 6 -> response_to_mmi_notification_message_record.user[response_to_mmi_notification_message_at] = wire[at]; at = at + 1; response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_record.instruction_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Response To Mmi Notification Message is what was written, byte for byte */
inline equal_response_to_mmi_notification_message(response_to_mmi_notification_message_read, response_to_mmi_notification_message_written) {
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 8 -> assert(response_to_mmi_notification_message_read.timestamp[response_to_mmi_notification_message_at] == response_to_mmi_notification_message_written.timestamp[response_to_mmi_notification_message_at]); response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 4 -> assert(response_to_mmi_notification_message_read.user_ref_num[response_to_mmi_notification_message_at] == response_to_mmi_notification_message_written.user_ref_num[response_to_mmi_notification_message_at]); response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 4 -> assert(response_to_mmi_notification_message_read.order_book[response_to_mmi_notification_message_at] == response_to_mmi_notification_message_written.order_book[response_to_mmi_notification_message_at]); response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  assert(response_to_mmi_notification_message_read.instruction == response_to_mmi_notification_message_written.instruction);
  assert(response_to_mmi_notification_message_read.add_or_remove == response_to_mmi_notification_message_written.add_or_remove);
  equal_firm(response_to_mmi_notification_message_read.firm, response_to_mmi_notification_message_written.firm);
  response_to_mmi_notification_message_at = 0;
  do
  :: response_to_mmi_notification_message_at < 6 -> assert(response_to_mmi_notification_message_read.user[response_to_mmi_notification_message_at] == response_to_mmi_notification_message_written.user[response_to_mmi_notification_message_at]); response_to_mmi_notification_message_at = response_to_mmi_notification_message_at + 1
  :: else -> break
  od;
  assert(response_to_mmi_notification_message_read.instruction_status == response_to_mmi_notification_message_written.instruction_status);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Server Packet Header: encoded, read back, and compared */
proctype check_server_packet_header() {
  ServerPacketHeader server_packet_header_sent;
  ServerPacketHeader server_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_server_packet_header(server_packet_header_sent, 0)
  :: pattern == 1 -> fill_server_packet_header(server_packet_header_sent, 32)
  :: pattern == 2 -> fill_server_packet_header(server_packet_header_sent, 255)
  :: else -> ramp_server_packet_header(server_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_server_packet_header(server_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_server_packet_header(server_packet_header_got);
    assert(at == 3);
    equal_server_packet_header(server_packet_header_got, server_packet_header_sent)
  }
}

/* Login Accepted Packet: encoded, read back, and compared */
proctype check_login_accepted_packet() {
  LoginAcceptedPacket login_accepted_packet_sent;
  LoginAcceptedPacket login_accepted_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_accepted_packet(login_accepted_packet_sent, 0)
  :: pattern == 1 -> fill_login_accepted_packet(login_accepted_packet_sent, 32)
  :: pattern == 2 -> fill_login_accepted_packet(login_accepted_packet_sent, 255)
  :: else -> ramp_login_accepted_packet(login_accepted_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_accepted_packet(login_accepted_packet_sent);
    assert(at == 30);
    at = 0;
    decode_login_accepted_packet(login_accepted_packet_got);
    assert(at == 30);
    equal_login_accepted_packet(login_accepted_packet_got, login_accepted_packet_sent)
  }
}

/* Login Rejected Packet: encoded, read back, and compared */
proctype check_login_rejected_packet() {
  LoginRejectedPacket login_rejected_packet_sent;
  LoginRejectedPacket login_rejected_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_rejected_packet(login_rejected_packet_sent, 0)
  :: pattern == 1 -> fill_login_rejected_packet(login_rejected_packet_sent, 32)
  :: pattern == 2 -> fill_login_rejected_packet(login_rejected_packet_sent, 255)
  :: else -> ramp_login_rejected_packet(login_rejected_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_rejected_packet(login_rejected_packet_sent);
    assert(at == 1);
    at = 0;
    decode_login_rejected_packet(login_rejected_packet_got);
    assert(at == 1);
    equal_login_rejected_packet(login_rejected_packet_got, login_rejected_packet_sent)
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
    assert(at == 9);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 9);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Clearing Account: encoded, read back, and compared */
proctype check_clearing_account() {
  ClearingAccount clearing_account_sent;
  ClearingAccount clearing_account_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clearing_account(clearing_account_sent, 0)
  :: pattern == 1 -> fill_clearing_account(clearing_account_sent, 32)
  :: pattern == 2 -> fill_clearing_account(clearing_account_sent, 255)
  :: else -> ramp_clearing_account(clearing_account_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clearing_account(clearing_account_sent);
    assert(at == 12);
    at = 0;
    decode_clearing_account(clearing_account_got);
    assert(at == 12);
    equal_clearing_account(clearing_account_got, clearing_account_sent)
  }
}

/* Clearing Account Type: encoded, read back, and compared */
proctype check_clearing_account_type() {
  ClearingAccountType clearing_account_type_sent;
  ClearingAccountType clearing_account_type_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clearing_account_type(clearing_account_type_sent, 0)
  :: pattern == 1 -> fill_clearing_account_type(clearing_account_type_sent, 32)
  :: pattern == 2 -> fill_clearing_account_type(clearing_account_type_sent, 255)
  :: else -> ramp_clearing_account_type(clearing_account_type_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clearing_account_type(clearing_account_type_sent);
    assert(at == 1);
    at = 0;
    decode_clearing_account_type(clearing_account_type_got);
    assert(at == 1);
    equal_clearing_account_type(clearing_account_type_got, clearing_account_type_sent)
  }
}

/* Clearing Firm: encoded, read back, and compared */
proctype check_clearing_firm() {
  ClearingFirm clearing_firm_sent;
  ClearingFirm clearing_firm_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clearing_firm(clearing_firm_sent, 0)
  :: pattern == 1 -> fill_clearing_firm(clearing_firm_sent, 32)
  :: pattern == 2 -> fill_clearing_firm(clearing_firm_sent, 255)
  :: else -> ramp_clearing_firm(clearing_firm_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clearing_firm(clearing_firm_sent);
    assert(at == 4);
    at = 0;
    decode_clearing_firm(clearing_firm_got);
    assert(at == 4);
    equal_clearing_firm(clearing_firm_got, clearing_firm_sent)
  }
}

/* Client Reference: encoded, read back, and compared */
proctype check_client_reference() {
  ClientReference client_reference_sent;
  ClientReference client_reference_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_client_reference(client_reference_sent, 0)
  :: pattern == 1 -> fill_client_reference(client_reference_sent, 32)
  :: pattern == 2 -> fill_client_reference(client_reference_sent, 255)
  :: else -> ramp_client_reference(client_reference_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_client_reference(client_reference_sent);
    assert(at == 15);
    at = 0;
    decode_client_reference(client_reference_got);
    assert(at == 15);
    equal_client_reference(client_reference_got, client_reference_sent)
  }
}

/* Cross Type: encoded, read back, and compared */
proctype check_cross_type() {
  CrossType cross_type_sent;
  CrossType cross_type_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cross_type(cross_type_sent, 0)
  :: pattern == 1 -> fill_cross_type(cross_type_sent, 32)
  :: pattern == 2 -> fill_cross_type(cross_type_sent, 255)
  :: else -> ramp_cross_type(cross_type_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cross_type(cross_type_sent);
    assert(at == 1);
    at = 0;
    decode_cross_type(cross_type_got);
    assert(at == 1);
    equal_cross_type(cross_type_got, cross_type_sent)
  }
}

/* Dea Indicator: encoded, read back, and compared */
proctype check_dea_indicator() {
  DeaIndicator dea_indicator_sent;
  DeaIndicator dea_indicator_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dea_indicator(dea_indicator_sent, 0)
  :: pattern == 1 -> fill_dea_indicator(dea_indicator_sent, 32)
  :: pattern == 2 -> fill_dea_indicator(dea_indicator_sent, 255)
  :: else -> ramp_dea_indicator(dea_indicator_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dea_indicator(dea_indicator_sent);
    assert(at == 1);
    at = 0;
    decode_dea_indicator(dea_indicator_got);
    assert(at == 1);
    equal_dea_indicator(dea_indicator_got, dea_indicator_sent)
  }
}

/* Display: encoded, read back, and compared */
proctype check_display() {
  Display display_sent;
  Display display_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_display(display_sent, 0)
  :: pattern == 1 -> fill_display(display_sent, 32)
  :: pattern == 2 -> fill_display(display_sent, 255)
  :: else -> ramp_display(display_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_display(display_sent);
    assert(at == 1);
    at = 0;
    decode_display(display_got);
    assert(at == 1);
    equal_display(display_got, display_sent)
  }
}

/* Display Price: encoded, read back, and compared */
proctype check_display_price() {
  DisplayPrice display_price_sent;
  DisplayPrice display_price_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_display_price(display_price_sent, 0)
  :: pattern == 1 -> fill_display_price(display_price_sent, 32)
  :: pattern == 2 -> fill_display_price(display_price_sent, 255)
  :: else -> ramp_display_price(display_price_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_display_price(display_price_sent);
    assert(at == 4);
    at = 0;
    decode_display_price(display_price_got);
    assert(at == 4);
    equal_display_price(display_price_got, display_price_sent)
  }
}

/* Display Quantity: encoded, read back, and compared */
proctype check_display_quantity() {
  DisplayQuantity display_quantity_sent;
  DisplayQuantity display_quantity_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_display_quantity(display_quantity_sent, 0)
  :: pattern == 1 -> fill_display_quantity(display_quantity_sent, 32)
  :: pattern == 2 -> fill_display_quantity(display_quantity_sent, 255)
  :: else -> ramp_display_quantity(display_quantity_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_display_quantity(display_quantity_sent);
    assert(at == 4);
    at = 0;
    decode_display_quantity(display_quantity_got);
    assert(at == 4);
    equal_display_quantity(display_quantity_got, display_quantity_sent)
  }
}

/* Expire Time: encoded, read back, and compared */
proctype check_expire_time() {
  ExpireTime expire_time_sent;
  ExpireTime expire_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expire_time(expire_time_sent, 0)
  :: pattern == 1 -> fill_expire_time(expire_time_sent, 32)
  :: pattern == 2 -> fill_expire_time(expire_time_sent, 255)
  :: else -> ramp_expire_time(expire_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expire_time(expire_time_sent);
    assert(at == 2);
    at = 0;
    decode_expire_time(expire_time_got);
    assert(at == 2);
    equal_expire_time(expire_time_got, expire_time_sent)
  }
}

/* Firm: encoded, read back, and compared */
proctype check_firm() {
  Firm firm_sent;
  Firm firm_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_firm(firm_sent, 0)
  :: pattern == 1 -> fill_firm(firm_sent, 32)
  :: pattern == 2 -> fill_firm(firm_sent, 255)
  :: else -> ramp_firm(firm_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_firm(firm_sent);
    assert(at == 4);
    at = 0;
    decode_firm(firm_got);
    assert(at == 4);
    equal_firm(firm_got, firm_sent)
  }
}

/* Liquidity Provision Indicator: encoded, read back, and compared */
proctype check_liquidity_provision_indicator() {
  LiquidityProvisionIndicator liquidity_provision_indicator_sent;
  LiquidityProvisionIndicator liquidity_provision_indicator_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_liquidity_provision_indicator(liquidity_provision_indicator_sent, 0)
  :: pattern == 1 -> fill_liquidity_provision_indicator(liquidity_provision_indicator_sent, 32)
  :: pattern == 2 -> fill_liquidity_provision_indicator(liquidity_provision_indicator_sent, 255)
  :: else -> ramp_liquidity_provision_indicator(liquidity_provision_indicator_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_liquidity_provision_indicator(liquidity_provision_indicator_sent);
    assert(at == 1);
    at = 0;
    decode_liquidity_provision_indicator(liquidity_provision_indicator_got);
    assert(at == 1);
    equal_liquidity_provision_indicator(liquidity_provision_indicator_got, liquidity_provision_indicator_sent)
  }
}

/* Max Floor: encoded, read back, and compared */
proctype check_max_floor() {
  MaxFloor max_floor_sent;
  MaxFloor max_floor_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_max_floor(max_floor_sent, 0)
  :: pattern == 1 -> fill_max_floor(max_floor_sent, 32)
  :: pattern == 2 -> fill_max_floor(max_floor_sent, 255)
  :: else -> ramp_max_floor(max_floor_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_max_floor(max_floor_sent);
    assert(at == 4);
    at = 0;
    decode_max_floor(max_floor_got);
    assert(at == 4);
    equal_max_floor(max_floor_got, max_floor_sent)
  }
}

/* Minimum Quantity: encoded, read back, and compared */
proctype check_minimum_quantity() {
  MinimumQuantity minimum_quantity_sent;
  MinimumQuantity minimum_quantity_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_minimum_quantity(minimum_quantity_sent, 0)
  :: pattern == 1 -> fill_minimum_quantity(minimum_quantity_sent, 32)
  :: pattern == 2 -> fill_minimum_quantity(minimum_quantity_sent, 255)
  :: else -> ramp_minimum_quantity(minimum_quantity_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_minimum_quantity(minimum_quantity_sent);
    assert(at == 4);
    at = 0;
    decode_minimum_quantity(minimum_quantity_got);
    assert(at == 4);
    equal_minimum_quantity(minimum_quantity_got, minimum_quantity_sent)
  }
}

/* Order Reference: encoded, read back, and compared */
proctype check_order_reference() {
  OrderReference order_reference_sent;
  OrderReference order_reference_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_reference(order_reference_sent, 0)
  :: pattern == 1 -> fill_order_reference(order_reference_sent, 32)
  :: pattern == 2 -> fill_order_reference(order_reference_sent, 255)
  :: else -> ramp_order_reference(order_reference_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_reference(order_reference_sent);
    assert(at == 10);
    at = 0;
    decode_order_reference(order_reference_got);
    assert(at == 10);
    equal_order_reference(order_reference_got, order_reference_sent)
  }
}

/* Original Order Entry Date: encoded, read back, and compared */
proctype check_original_order_entry_date() {
  OriginalOrderEntryDate original_order_entry_date_sent;
  OriginalOrderEntryDate original_order_entry_date_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_original_order_entry_date(original_order_entry_date_sent, 0)
  :: pattern == 1 -> fill_original_order_entry_date(original_order_entry_date_sent, 32)
  :: pattern == 2 -> fill_original_order_entry_date(original_order_entry_date_sent, 255)
  :: else -> ramp_original_order_entry_date(original_order_entry_date_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_original_order_entry_date(original_order_entry_date_sent);
    assert(at == 4);
    at = 0;
    decode_original_order_entry_date(original_order_entry_date_got);
    assert(at == 4);
    equal_original_order_entry_date(original_order_entry_date_got, original_order_entry_date_sent)
  }
}

/* Original Order Reference Number: encoded, read back, and compared */
proctype check_original_order_reference_number() {
  OriginalOrderReferenceNumber original_order_reference_number_sent;
  OriginalOrderReferenceNumber original_order_reference_number_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_original_order_reference_number(original_order_reference_number_sent, 0)
  :: pattern == 1 -> fill_original_order_reference_number(original_order_reference_number_sent, 32)
  :: pattern == 2 -> fill_original_order_reference_number(original_order_reference_number_sent, 255)
  :: else -> ramp_original_order_reference_number(original_order_reference_number_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_original_order_reference_number(original_order_reference_number_sent);
    assert(at == 8);
    at = 0;
    decode_original_order_reference_number(original_order_reference_number_got);
    assert(at == 8);
    equal_original_order_reference_number(original_order_reference_number_got, original_order_reference_number_sent)
  }
}

/* Peg Difference: encoded, read back, and compared */
proctype check_peg_difference() {
  PegDifference peg_difference_sent;
  PegDifference peg_difference_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_peg_difference(peg_difference_sent, 0)
  :: pattern == 1 -> fill_peg_difference(peg_difference_sent, 32)
  :: pattern == 2 -> fill_peg_difference(peg_difference_sent, 255)
  :: else -> ramp_peg_difference(peg_difference_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_peg_difference(peg_difference_sent);
    assert(at == 4);
    at = 0;
    decode_peg_difference(peg_difference_got);
    assert(at == 4);
    equal_peg_difference(peg_difference_got, peg_difference_sent)
  }
}

/* Peg Type: encoded, read back, and compared */
proctype check_peg_type() {
  PegType peg_type_sent;
  PegType peg_type_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_peg_type(peg_type_sent, 0)
  :: pattern == 1 -> fill_peg_type(peg_type_sent, 32)
  :: pattern == 2 -> fill_peg_type(peg_type_sent, 255)
  :: else -> ramp_peg_type(peg_type_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_peg_type(peg_type_sent);
    assert(at == 1);
    at = 0;
    decode_peg_type(peg_type_got);
    assert(at == 1);
    equal_peg_type(peg_type_got, peg_type_sent)
  }
}

/* Random Reserve: encoded, read back, and compared */
proctype check_random_reserve() {
  RandomReserve random_reserve_sent;
  RandomReserve random_reserve_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_random_reserve(random_reserve_sent, 0)
  :: pattern == 1 -> fill_random_reserve(random_reserve_sent, 32)
  :: pattern == 2 -> fill_random_reserve(random_reserve_sent, 255)
  :: else -> ramp_random_reserve(random_reserve_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_random_reserve(random_reserve_sent);
    assert(at == 4);
    at = 0;
    decode_random_reserve(random_reserve_got);
    assert(at == 4);
    equal_random_reserve(random_reserve_got, random_reserve_sent)
  }
}

/* Secondary Order Reference Number: encoded, read back, and compared */
proctype check_secondary_order_reference_number() {
  SecondaryOrderReferenceNumber secondary_order_reference_number_sent;
  SecondaryOrderReferenceNumber secondary_order_reference_number_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_secondary_order_reference_number(secondary_order_reference_number_sent, 0)
  :: pattern == 1 -> fill_secondary_order_reference_number(secondary_order_reference_number_sent, 32)
  :: pattern == 2 -> fill_secondary_order_reference_number(secondary_order_reference_number_sent, 255)
  :: else -> ramp_secondary_order_reference_number(secondary_order_reference_number_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_secondary_order_reference_number(secondary_order_reference_number_sent);
    assert(at == 8);
    at = 0;
    decode_secondary_order_reference_number(secondary_order_reference_number_got);
    assert(at == 8);
    equal_secondary_order_reference_number(secondary_order_reference_number_got, secondary_order_reference_number_sent)
  }
}

/* Stp Action: encoded, read back, and compared */
proctype check_stp_action() {
  StpAction stp_action_sent;
  StpAction stp_action_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stp_action(stp_action_sent, 0)
  :: pattern == 1 -> fill_stp_action(stp_action_sent, 32)
  :: pattern == 2 -> fill_stp_action(stp_action_sent, 255)
  :: else -> ramp_stp_action(stp_action_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stp_action(stp_action_sent);
    assert(at == 1);
    at = 0;
    decode_stp_action(stp_action_got);
    assert(at == 1);
    equal_stp_action(stp_action_got, stp_action_sent)
  }
}

/* Stp Level: encoded, read back, and compared */
proctype check_stp_level() {
  StpLevel stp_level_sent;
  StpLevel stp_level_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stp_level(stp_level_sent, 0)
  :: pattern == 1 -> fill_stp_level(stp_level_sent, 32)
  :: pattern == 2 -> fill_stp_level(stp_level_sent, 255)
  :: else -> ramp_stp_level(stp_level_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stp_level(stp_level_sent);
    assert(at == 1);
    at = 0;
    decode_stp_level(stp_level_got);
    assert(at == 1);
    equal_stp_level(stp_level_got, stp_level_sent)
  }
}

/* Stp Trader Group: encoded, read back, and compared */
proctype check_stp_trader_group() {
  StpTraderGroup stp_trader_group_sent;
  StpTraderGroup stp_trader_group_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stp_trader_group(stp_trader_group_sent, 0)
  :: pattern == 1 -> fill_stp_trader_group(stp_trader_group_sent, 32)
  :: pattern == 2 -> fill_stp_trader_group(stp_trader_group_sent, 255)
  :: else -> ramp_stp_trader_group(stp_trader_group_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stp_trader_group(stp_trader_group_sent);
    assert(at == 2);
    at = 0;
    decode_stp_trader_group(stp_trader_group_got);
    assert(at == 2);
    equal_stp_trader_group(stp_trader_group_got, stp_trader_group_sent)
  }
}

/* Time In Force: encoded, read back, and compared */
proctype check_time_in_force() {
  TimeInForce time_in_force_sent;
  TimeInForce time_in_force_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time_in_force(time_in_force_sent, 0)
  :: pattern == 1 -> fill_time_in_force(time_in_force_sent, 32)
  :: pattern == 2 -> fill_time_in_force(time_in_force_sent, 255)
  :: else -> ramp_time_in_force(time_in_force_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time_in_force(time_in_force_sent);
    assert(at == 1);
    at = 0;
    decode_time_in_force(time_in_force_got);
    assert(at == 1);
    equal_time_in_force(time_in_force_got, time_in_force_sent)
  }
}

/* Trading At Closing Price: encoded, read back, and compared */
proctype check_trading_at_closing_price() {
  TradingAtClosingPrice trading_at_closing_price_sent;
  TradingAtClosingPrice trading_at_closing_price_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_at_closing_price(trading_at_closing_price_sent, 0)
  :: pattern == 1 -> fill_trading_at_closing_price(trading_at_closing_price_sent, 32)
  :: pattern == 2 -> fill_trading_at_closing_price(trading_at_closing_price_sent, 255)
  :: else -> ramp_trading_at_closing_price(trading_at_closing_price_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_at_closing_price(trading_at_closing_price_sent);
    assert(at == 1);
    at = 0;
    decode_trading_at_closing_price(trading_at_closing_price_got);
    assert(at == 1);
    equal_trading_at_closing_price(trading_at_closing_price_got, trading_at_closing_price_sent)
  }
}

/* Order Condition: encoded, read back, and compared */
proctype check_order_condition() {
  OrderCondition order_condition_sent;
  OrderCondition order_condition_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_condition(order_condition_sent, 0)
  :: pattern == 1 -> fill_order_condition(order_condition_sent, 32)
  :: pattern == 2 -> fill_order_condition(order_condition_sent, 255)
  :: else -> ramp_order_condition(order_condition_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_condition(order_condition_sent);
    assert(at == 1);
    at = 0;
    decode_order_condition(order_condition_got);
    assert(at == 1);
    equal_order_condition(order_condition_got, order_condition_sent)
  }
}

/* Cumulative Quantity: encoded, read back, and compared */
proctype check_cumulative_quantity() {
  CumulativeQuantity cumulative_quantity_sent;
  CumulativeQuantity cumulative_quantity_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cumulative_quantity(cumulative_quantity_sent, 0)
  :: pattern == 1 -> fill_cumulative_quantity(cumulative_quantity_sent, 32)
  :: pattern == 2 -> fill_cumulative_quantity(cumulative_quantity_sent, 255)
  :: else -> ramp_cumulative_quantity(cumulative_quantity_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cumulative_quantity(cumulative_quantity_sent);
    assert(at == 4);
    at = 0;
    decode_cumulative_quantity(cumulative_quantity_got);
    assert(at == 4);
    equal_cumulative_quantity(cumulative_quantity_got, cumulative_quantity_sent)
  }
}

/* Customer Order Capacity: encoded, read back, and compared */
proctype check_customer_order_capacity() {
  CustomerOrderCapacity customer_order_capacity_sent;
  CustomerOrderCapacity customer_order_capacity_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_customer_order_capacity(customer_order_capacity_sent, 0)
  :: pattern == 1 -> fill_customer_order_capacity(customer_order_capacity_sent, 32)
  :: pattern == 2 -> fill_customer_order_capacity(customer_order_capacity_sent, 255)
  :: else -> ramp_customer_order_capacity(customer_order_capacity_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_customer_order_capacity(customer_order_capacity_sent);
    assert(at == 1);
    at = 0;
    decode_customer_order_capacity(customer_order_capacity_got);
    assert(at == 1);
    equal_customer_order_capacity(customer_order_capacity_got, customer_order_capacity_sent)
  }
}

/* Cancelled Order Message: encoded, read back, and compared */
proctype check_cancelled_order_message() {
  CancelledOrderMessage cancelled_order_message_sent;
  CancelledOrderMessage cancelled_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancelled_order_message(cancelled_order_message_sent, 0)
  :: pattern == 1 -> fill_cancelled_order_message(cancelled_order_message_sent, 32)
  :: pattern == 2 -> fill_cancelled_order_message(cancelled_order_message_sent, 255)
  :: else -> ramp_cancelled_order_message(cancelled_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancelled_order_message(cancelled_order_message_sent);
    assert(at == 17);
    at = 0;
    decode_cancelled_order_message(cancelled_order_message_got);
    assert(at == 17);
    equal_cancelled_order_message(cancelled_order_message_got, cancelled_order_message_sent)
  }
}

/* Cancel Pending Message: encoded, read back, and compared */
proctype check_cancel_pending_message() {
  CancelPendingMessage cancel_pending_message_sent;
  CancelPendingMessage cancel_pending_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_pending_message(cancel_pending_message_sent, 0)
  :: pattern == 1 -> fill_cancel_pending_message(cancel_pending_message_sent, 32)
  :: pattern == 2 -> fill_cancel_pending_message(cancel_pending_message_sent, 255)
  :: else -> ramp_cancel_pending_message(cancel_pending_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_pending_message(cancel_pending_message_sent);
    assert(at == 13);
    at = 0;
    decode_cancel_pending_message(cancel_pending_message_got);
    assert(at == 13);
    equal_cancel_pending_message(cancel_pending_message_got, cancel_pending_message_sent)
  }
}

/* Replace Pending Message: encoded, read back, and compared */
proctype check_replace_pending_message() {
  ReplacePendingMessage replace_pending_message_sent;
  ReplacePendingMessage replace_pending_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replace_pending_message(replace_pending_message_sent, 0)
  :: pattern == 1 -> fill_replace_pending_message(replace_pending_message_sent, 32)
  :: pattern == 2 -> fill_replace_pending_message(replace_pending_message_sent, 255)
  :: else -> ramp_replace_pending_message(replace_pending_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replace_pending_message(replace_pending_message_sent);
    assert(at == 17);
    at = 0;
    decode_replace_pending_message(replace_pending_message_got);
    assert(at == 17);
    equal_replace_pending_message(replace_pending_message_got, replace_pending_message_sent)
  }
}

/* Broken Trade Message: encoded, read back, and compared */
proctype check_broken_trade_message() {
  BrokenTradeMessage broken_trade_message_sent;
  BrokenTradeMessage broken_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_broken_trade_message(broken_trade_message_sent, 0)
  :: pattern == 1 -> fill_broken_trade_message(broken_trade_message_sent, 32)
  :: pattern == 2 -> fill_broken_trade_message(broken_trade_message_sent, 255)
  :: else -> ramp_broken_trade_message(broken_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_broken_trade_message(broken_trade_message_sent);
    assert(at == 20);
    at = 0;
    decode_broken_trade_message(broken_trade_message_got);
    assert(at == 20);
    equal_broken_trade_message(broken_trade_message_got, broken_trade_message_sent)
  }
}

/* Rejected Order Message: encoded, read back, and compared */
proctype check_rejected_order_message() {
  RejectedOrderMessage rejected_order_message_sent;
  RejectedOrderMessage rejected_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rejected_order_message(rejected_order_message_sent, 0)
  :: pattern == 1 -> fill_rejected_order_message(rejected_order_message_sent, 32)
  :: pattern == 2 -> fill_rejected_order_message(rejected_order_message_sent, 255)
  :: else -> ramp_rejected_order_message(rejected_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rejected_order_message(rejected_order_message_sent);
    assert(at == 14);
    at = 0;
    decode_rejected_order_message(rejected_order_message_got);
    assert(at == 14);
    equal_rejected_order_message(rejected_order_message_got, rejected_order_message_sent)
  }
}

/* Cancel Rejected Message: encoded, read back, and compared */
proctype check_cancel_rejected_message() {
  CancelRejectedMessage cancel_rejected_message_sent;
  CancelRejectedMessage cancel_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_rejected_message(cancel_rejected_message_sent, 0)
  :: pattern == 1 -> fill_cancel_rejected_message(cancel_rejected_message_sent, 32)
  :: pattern == 2 -> fill_cancel_rejected_message(cancel_rejected_message_sent, 255)
  :: else -> ramp_cancel_rejected_message(cancel_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_rejected_message(cancel_rejected_message_sent);
    assert(at == 14);
    at = 0;
    decode_cancel_rejected_message(cancel_rejected_message_got);
    assert(at == 14);
    equal_cancel_rejected_message(cancel_rejected_message_got, cancel_rejected_message_sent)
  }
}

/* Mmo Refresh Request Message: encoded, read back, and compared */
proctype check_mmo_refresh_request_message() {
  MmoRefreshRequestMessage mmo_refresh_request_message_sent;
  MmoRefreshRequestMessage mmo_refresh_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mmo_refresh_request_message(mmo_refresh_request_message_sent, 0)
  :: pattern == 1 -> fill_mmo_refresh_request_message(mmo_refresh_request_message_sent, 32)
  :: pattern == 2 -> fill_mmo_refresh_request_message(mmo_refresh_request_message_sent, 255)
  :: else -> ramp_mmo_refresh_request_message(mmo_refresh_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mmo_refresh_request_message(mmo_refresh_request_message_sent);
    assert(at == 17);
    at = 0;
    decode_mmo_refresh_request_message(mmo_refresh_request_message_got);
    assert(at == 17);
    equal_mmo_refresh_request_message(mmo_refresh_request_message_got, mmo_refresh_request_message_sent)
  }
}

/* Account Query Response Message: encoded, read back, and compared */
proctype check_account_query_response_message() {
  AccountQueryResponseMessage account_query_response_message_sent;
  AccountQueryResponseMessage account_query_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_account_query_response_message(account_query_response_message_sent, 0)
  :: pattern == 1 -> fill_account_query_response_message(account_query_response_message_sent, 32)
  :: pattern == 2 -> fill_account_query_response_message(account_query_response_message_sent, 255)
  :: else -> ramp_account_query_response_message(account_query_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_account_query_response_message(account_query_response_message_sent);
    assert(at == 12);
    at = 0;
    decode_account_query_response_message(account_query_response_message_got);
    assert(at == 12);
    equal_account_query_response_message(account_query_response_message_got, account_query_response_message_sent)
  }
}

/* Gtc Cancelled Message: encoded, read back, and compared */
proctype check_gtc_cancelled_message() {
  GtcCancelledMessage gtc_cancelled_message_sent;
  GtcCancelledMessage gtc_cancelled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_gtc_cancelled_message(gtc_cancelled_message_sent, 0)
  :: pattern == 1 -> fill_gtc_cancelled_message(gtc_cancelled_message_sent, 32)
  :: pattern == 2 -> fill_gtc_cancelled_message(gtc_cancelled_message_sent, 255)
  :: else -> ramp_gtc_cancelled_message(gtc_cancelled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_gtc_cancelled_message(gtc_cancelled_message_sent);
    assert(at == 22);
    at = 0;
    decode_gtc_cancelled_message(gtc_cancelled_message_got);
    assert(at == 22);
    equal_gtc_cancelled_message(gtc_cancelled_message_got, gtc_cancelled_message_sent)
  }
}

/* Response To Mmi Notification Message: encoded, read back, and compared */
proctype check_response_to_mmi_notification_message() {
  ResponseToMmiNotificationMessage response_to_mmi_notification_message_sent;
  ResponseToMmiNotificationMessage response_to_mmi_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_response_to_mmi_notification_message(response_to_mmi_notification_message_sent, 0)
  :: pattern == 1 -> fill_response_to_mmi_notification_message(response_to_mmi_notification_message_sent, 32)
  :: pattern == 2 -> fill_response_to_mmi_notification_message(response_to_mmi_notification_message_sent, 255)
  :: else -> ramp_response_to_mmi_notification_message(response_to_mmi_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_response_to_mmi_notification_message(response_to_mmi_notification_message_sent);
    assert(at == 29);
    at = 0;
    decode_response_to_mmi_notification_message(response_to_mmi_notification_message_got);
    assert(at == 29);
    equal_response_to_mmi_notification_message(response_to_mmi_notification_message_got, response_to_mmi_notification_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_system_event_message()
  :: run check_clearing_account()
  :: run check_clearing_account_type()
  :: run check_clearing_firm()
  :: run check_client_reference()
  :: run check_cross_type()
  :: run check_dea_indicator()
  :: run check_display()
  :: run check_display_price()
  :: run check_display_quantity()
  :: run check_expire_time()
  :: run check_firm()
  :: run check_liquidity_provision_indicator()
  :: run check_max_floor()
  :: run check_minimum_quantity()
  :: run check_order_reference()
  :: run check_original_order_entry_date()
  :: run check_original_order_reference_number()
  :: run check_peg_difference()
  :: run check_peg_type()
  :: run check_random_reserve()
  :: run check_secondary_order_reference_number()
  :: run check_stp_action()
  :: run check_stp_level()
  :: run check_stp_trader_group()
  :: run check_time_in_force()
  :: run check_trading_at_closing_price()
  :: run check_order_condition()
  :: run check_cumulative_quantity()
  :: run check_customer_order_capacity()
  :: run check_cancelled_order_message()
  :: run check_cancel_pending_message()
  :: run check_replace_pending_message()
  :: run check_broken_trade_message()
  :: run check_rejected_order_message()
  :: run check_cancel_rejected_message()
  :: run check_mmo_refresh_request_message()
  :: run check_account_query_response_message()
  :: run check_gtc_cancelled_message()
  :: run check_response_to_mmi_notification_message()
  fi
}
