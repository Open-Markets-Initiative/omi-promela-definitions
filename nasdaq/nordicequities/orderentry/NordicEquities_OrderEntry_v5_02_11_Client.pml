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
#define WIRE 46

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

/* ---- Login Request Packet: 46 bytes ------------------------------------------ */

/* The SoupBinTCP client must send a Login Request Packet immediately upon establishing a new TCP/IP socket connection to the server */
typedef LoginRequestPacket {
  byte username[6];
  byte password[10];
  byte requested_session[10];
  byte requested_sequence_number[20]
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
  skip
}

/* Login Request Packet to the wire, 46 bytes from where the cursor stands */
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
  skip
}

/* Login Request Packet off the wire, 46 bytes from where the cursor stands */
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

/* ---- Target Strategy: 1 bytes ------------------------------------------------ */

/* Target Strategy */
typedef TargetStrategy {
  byte target_strategy_value
};

/* every byte of Target Strategy set to one value */
inline fill_target_strategy(target_strategy_record, target_strategy_value_) {
  target_strategy_record.target_strategy_value = target_strategy_value_;
  skip
}

/* each byte of Target Strategy set to where it lies, so a field read out of place says so */
inline ramp_target_strategy(target_strategy_record, target_strategy_base) {
  target_strategy_record.target_strategy_value = (target_strategy_base + 0 + 1) % 256;
  skip
}

/* Target Strategy to the wire, 1 bytes from where the cursor stands */
inline encode_target_strategy(target_strategy_record) {
  wire[at] = target_strategy_record.target_strategy_value; at = at + 1;
  skip
}

/* Target Strategy off the wire, 1 bytes from where the cursor stands */
inline decode_target_strategy(target_strategy_record) {
  target_strategy_record.target_strategy_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Target Strategy is what was written, byte for byte */
inline equal_target_strategy(target_strategy_read, target_strategy_written) {
  assert(target_strategy_read.target_strategy_value == target_strategy_written.target_strategy_value);
  skip
}

/* ---- Min Rate: 2 bytes ------------------------------------------------------- */

/* Min Rate */
typedef MinRate {
  byte min_rate_value[2]
};

int min_rate_at;

/* every byte of Min Rate set to one value */
inline fill_min_rate(min_rate_record, min_rate_value_) {
  min_rate_at = 0;
  do
  :: min_rate_at < 2 -> min_rate_record.min_rate_value[min_rate_at] = min_rate_value_; min_rate_at = min_rate_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Min Rate set to where it lies, so a field read out of place says so */
inline ramp_min_rate(min_rate_record, min_rate_base) {
  min_rate_at = 0;
  do
  :: min_rate_at < 2 -> min_rate_record.min_rate_value[min_rate_at] = (min_rate_base + 0 + min_rate_at + 1) % 256; min_rate_at = min_rate_at + 1
  :: else -> break
  od;
  skip
}

/* Min Rate to the wire, 2 bytes from where the cursor stands */
inline encode_min_rate(min_rate_record) {
  min_rate_at = 0;
  do
  :: min_rate_at < 2 -> wire[at] = min_rate_record.min_rate_value[min_rate_at]; at = at + 1; min_rate_at = min_rate_at + 1
  :: else -> break
  od;
  skip
}

/* Min Rate off the wire, 2 bytes from where the cursor stands */
inline decode_min_rate(min_rate_record) {
  min_rate_at = 0;
  do
  :: min_rate_at < 2 -> min_rate_record.min_rate_value[min_rate_at] = wire[at]; at = at + 1; min_rate_at = min_rate_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Min Rate is what was written, byte for byte */
inline equal_min_rate(min_rate_read, min_rate_written) {
  min_rate_at = 0;
  do
  :: min_rate_at < 2 -> assert(min_rate_read.min_rate_value[min_rate_at] == min_rate_written.min_rate_value[min_rate_at]); min_rate_at = min_rate_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Max Rate: 2 bytes ------------------------------------------------------- */

/* Max Rate */
typedef MaxRate {
  byte max_rate_value[2]
};

int max_rate_at;

/* every byte of Max Rate set to one value */
inline fill_max_rate(max_rate_record, max_rate_value_) {
  max_rate_at = 0;
  do
  :: max_rate_at < 2 -> max_rate_record.max_rate_value[max_rate_at] = max_rate_value_; max_rate_at = max_rate_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Max Rate set to where it lies, so a field read out of place says so */
inline ramp_max_rate(max_rate_record, max_rate_base) {
  max_rate_at = 0;
  do
  :: max_rate_at < 2 -> max_rate_record.max_rate_value[max_rate_at] = (max_rate_base + 0 + max_rate_at + 1) % 256; max_rate_at = max_rate_at + 1
  :: else -> break
  od;
  skip
}

/* Max Rate to the wire, 2 bytes from where the cursor stands */
inline encode_max_rate(max_rate_record) {
  max_rate_at = 0;
  do
  :: max_rate_at < 2 -> wire[at] = max_rate_record.max_rate_value[max_rate_at]; at = at + 1; max_rate_at = max_rate_at + 1
  :: else -> break
  od;
  skip
}

/* Max Rate off the wire, 2 bytes from where the cursor stands */
inline decode_max_rate(max_rate_record) {
  max_rate_at = 0;
  do
  :: max_rate_at < 2 -> max_rate_record.max_rate_value[max_rate_at] = wire[at]; at = at + 1; max_rate_at = max_rate_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Max Rate is what was written, byte for byte */
inline equal_max_rate(max_rate_read, max_rate_written) {
  max_rate_at = 0;
  do
  :: max_rate_at < 2 -> assert(max_rate_read.max_rate_value[max_rate_at] == max_rate_written.max_rate_value[max_rate_at]); max_rate_at = max_rate_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Conditional Type: 1 bytes ----------------------------------------------- */

/* Conditional Type */
typedef ConditionalType {
  byte conditional_type_value
};

/* every byte of Conditional Type set to one value */
inline fill_conditional_type(conditional_type_record, conditional_type_value_) {
  conditional_type_record.conditional_type_value = conditional_type_value_;
  skip
}

/* each byte of Conditional Type set to where it lies, so a field read out of place says so */
inline ramp_conditional_type(conditional_type_record, conditional_type_base) {
  conditional_type_record.conditional_type_value = (conditional_type_base + 0 + 1) % 256;
  skip
}

/* Conditional Type to the wire, 1 bytes from where the cursor stands */
inline encode_conditional_type(conditional_type_record) {
  wire[at] = conditional_type_record.conditional_type_value; at = at + 1;
  skip
}

/* Conditional Type off the wire, 1 bytes from where the cursor stands */
inline decode_conditional_type(conditional_type_record) {
  conditional_type_record.conditional_type_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Conditional Type is what was written, byte for byte */
inline equal_conditional_type(conditional_type_read, conditional_type_written) {
  assert(conditional_type_read.conditional_type_value == conditional_type_written.conditional_type_value);
  skip
}

/* ---- Firm Up Id: 4 bytes ----------------------------------------------------- */

/* Firm-Up ID */
typedef FirmUpId {
  byte firm_up_id_value[4]
};

int firm_up_id_at;

/* every byte of Firm Up Id set to one value */
inline fill_firm_up_id(firm_up_id_record, firm_up_id_value_) {
  firm_up_id_at = 0;
  do
  :: firm_up_id_at < 4 -> firm_up_id_record.firm_up_id_value[firm_up_id_at] = firm_up_id_value_; firm_up_id_at = firm_up_id_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Firm Up Id set to where it lies, so a field read out of place says so */
inline ramp_firm_up_id(firm_up_id_record, firm_up_id_base) {
  firm_up_id_at = 0;
  do
  :: firm_up_id_at < 4 -> firm_up_id_record.firm_up_id_value[firm_up_id_at] = (firm_up_id_base + 0 + firm_up_id_at + 1) % 256; firm_up_id_at = firm_up_id_at + 1
  :: else -> break
  od;
  skip
}

/* Firm Up Id to the wire, 4 bytes from where the cursor stands */
inline encode_firm_up_id(firm_up_id_record) {
  firm_up_id_at = 0;
  do
  :: firm_up_id_at < 4 -> wire[at] = firm_up_id_record.firm_up_id_value[firm_up_id_at]; at = at + 1; firm_up_id_at = firm_up_id_at + 1
  :: else -> break
  od;
  skip
}

/* Firm Up Id off the wire, 4 bytes from where the cursor stands */
inline decode_firm_up_id(firm_up_id_record) {
  firm_up_id_at = 0;
  do
  :: firm_up_id_at < 4 -> firm_up_id_record.firm_up_id_value[firm_up_id_at] = wire[at]; at = at + 1; firm_up_id_at = firm_up_id_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Firm Up Id is what was written, byte for byte */
inline equal_firm_up_id(firm_up_id_read, firm_up_id_written) {
  firm_up_id_at = 0;
  do
  :: firm_up_id_at < 4 -> assert(firm_up_id_read.firm_up_id_value[firm_up_id_at] == firm_up_id_written.firm_up_id_value[firm_up_id_at]); firm_up_id_at = firm_up_id_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order Message: 14 bytes ------------------------------------------ */

/* Requests that an order be cancelled or reduced */
typedef CancelOrderMessage {
  byte user_ref_num[4];
  byte quantity[4];
  byte user[6]
};

int cancel_order_message_at;

/* every byte of Cancel Order Message set to one value */
inline fill_cancel_order_message(cancel_order_message_record, cancel_order_message_value) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.user_ref_num[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.quantity[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 6 -> cancel_order_message_record.user[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_message(cancel_order_message_record, cancel_order_message_base) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.user_ref_num[cancel_order_message_at] = (cancel_order_message_base + 0 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.quantity[cancel_order_message_at] = (cancel_order_message_base + 4 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 6 -> cancel_order_message_record.user[cancel_order_message_at] = (cancel_order_message_base + 8 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message to the wire, 14 bytes from where the cursor stands */
inline encode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> wire[at] = cancel_order_message_record.user_ref_num[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> wire[at] = cancel_order_message_record.quantity[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 6 -> wire[at] = cancel_order_message_record.user[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message off the wire, 14 bytes from where the cursor stands */
inline decode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.user_ref_num[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.quantity[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 6 -> cancel_order_message_record.user[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Message is what was written, byte for byte */
inline equal_cancel_order_message(cancel_order_message_read, cancel_order_message_written) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> assert(cancel_order_message_read.user_ref_num[cancel_order_message_at] == cancel_order_message_written.user_ref_num[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> assert(cancel_order_message_read.quantity[cancel_order_message_at] == cancel_order_message_written.quantity[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 6 -> assert(cancel_order_message_read.user[cancel_order_message_at] == cancel_order_message_written.user[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mmi Notification Request Message: 20 bytes ------------------------------ */

/* Requests a market making instruction notification */
typedef MmiNotificationRequestMessage {
  byte user_ref_num[4];
  byte order_book[4];
  byte instruction;
  byte add_or_remove;
  Firm firm;
  byte user[6]
};

int mmi_notification_request_message_at;

/* every byte of Mmi Notification Request Message set to one value */
inline fill_mmi_notification_request_message(mmi_notification_request_message_record, mmi_notification_request_message_value) {
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 4 -> mmi_notification_request_message_record.user_ref_num[mmi_notification_request_message_at] = mmi_notification_request_message_value; mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 4 -> mmi_notification_request_message_record.order_book[mmi_notification_request_message_at] = mmi_notification_request_message_value; mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  mmi_notification_request_message_record.instruction = mmi_notification_request_message_value;
  mmi_notification_request_message_record.add_or_remove = mmi_notification_request_message_value;
  fill_firm(mmi_notification_request_message_record.firm, mmi_notification_request_message_value);
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 6 -> mmi_notification_request_message_record.user[mmi_notification_request_message_at] = mmi_notification_request_message_value; mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mmi Notification Request Message set to where it lies, so a field read out of place says so */
inline ramp_mmi_notification_request_message(mmi_notification_request_message_record, mmi_notification_request_message_base) {
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 4 -> mmi_notification_request_message_record.user_ref_num[mmi_notification_request_message_at] = (mmi_notification_request_message_base + 0 + mmi_notification_request_message_at + 1) % 256; mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 4 -> mmi_notification_request_message_record.order_book[mmi_notification_request_message_at] = (mmi_notification_request_message_base + 4 + mmi_notification_request_message_at + 1) % 256; mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  mmi_notification_request_message_record.instruction = (mmi_notification_request_message_base + 8 + 1) % 256;
  mmi_notification_request_message_record.add_or_remove = (mmi_notification_request_message_base + 9 + 1) % 256;
  ramp_firm(mmi_notification_request_message_record.firm, mmi_notification_request_message_base + 10);
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 6 -> mmi_notification_request_message_record.user[mmi_notification_request_message_at] = (mmi_notification_request_message_base + 14 + mmi_notification_request_message_at + 1) % 256; mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mmi Notification Request Message to the wire, 20 bytes from where the cursor stands */
inline encode_mmi_notification_request_message(mmi_notification_request_message_record) {
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 4 -> wire[at] = mmi_notification_request_message_record.user_ref_num[mmi_notification_request_message_at]; at = at + 1; mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 4 -> wire[at] = mmi_notification_request_message_record.order_book[mmi_notification_request_message_at]; at = at + 1; mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  wire[at] = mmi_notification_request_message_record.instruction; at = at + 1;
  wire[at] = mmi_notification_request_message_record.add_or_remove; at = at + 1;
  encode_firm(mmi_notification_request_message_record.firm);
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 6 -> wire[at] = mmi_notification_request_message_record.user[mmi_notification_request_message_at]; at = at + 1; mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mmi Notification Request Message off the wire, 20 bytes from where the cursor stands */
inline decode_mmi_notification_request_message(mmi_notification_request_message_record) {
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 4 -> mmi_notification_request_message_record.user_ref_num[mmi_notification_request_message_at] = wire[at]; at = at + 1; mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 4 -> mmi_notification_request_message_record.order_book[mmi_notification_request_message_at] = wire[at]; at = at + 1; mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  mmi_notification_request_message_record.instruction = wire[at]; at = at + 1;
  mmi_notification_request_message_record.add_or_remove = wire[at]; at = at + 1;
  decode_firm(mmi_notification_request_message_record.firm);
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 6 -> mmi_notification_request_message_record.user[mmi_notification_request_message_at] = wire[at]; at = at + 1; mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mmi Notification Request Message is what was written, byte for byte */
inline equal_mmi_notification_request_message(mmi_notification_request_message_read, mmi_notification_request_message_written) {
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 4 -> assert(mmi_notification_request_message_read.user_ref_num[mmi_notification_request_message_at] == mmi_notification_request_message_written.user_ref_num[mmi_notification_request_message_at]); mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 4 -> assert(mmi_notification_request_message_read.order_book[mmi_notification_request_message_at] == mmi_notification_request_message_written.order_book[mmi_notification_request_message_at]); mmi_notification_request_message_at = mmi_notification_request_message_at + 1
  :: else -> break
  od;
  assert(mmi_notification_request_message_read.instruction == mmi_notification_request_message_written.instruction);
  assert(mmi_notification_request_message_read.add_or_remove == mmi_notification_request_message_written.add_or_remove);
  equal_firm(mmi_notification_request_message_read.firm, mmi_notification_request_message_written.firm);
  mmi_notification_request_message_at = 0;
  do
  :: mmi_notification_request_message_at < 6 -> assert(mmi_notification_request_message_read.user[mmi_notification_request_message_at] == mmi_notification_request_message_written.user[mmi_notification_request_message_at]); mmi_notification_request_message_at = mmi_notification_request_message_at + 1
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
    assert(at == 46);
    at = 0;
    decode_login_request_packet(login_request_packet_got);
    assert(at == 46);
    equal_login_request_packet(login_request_packet_got, login_request_packet_sent)
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

/* Target Strategy: encoded, read back, and compared */
proctype check_target_strategy() {
  TargetStrategy target_strategy_sent;
  TargetStrategy target_strategy_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_target_strategy(target_strategy_sent, 0)
  :: pattern == 1 -> fill_target_strategy(target_strategy_sent, 32)
  :: pattern == 2 -> fill_target_strategy(target_strategy_sent, 255)
  :: else -> ramp_target_strategy(target_strategy_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_target_strategy(target_strategy_sent);
    assert(at == 1);
    at = 0;
    decode_target_strategy(target_strategy_got);
    assert(at == 1);
    equal_target_strategy(target_strategy_got, target_strategy_sent)
  }
}

/* Min Rate: encoded, read back, and compared */
proctype check_min_rate() {
  MinRate min_rate_sent;
  MinRate min_rate_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_min_rate(min_rate_sent, 0)
  :: pattern == 1 -> fill_min_rate(min_rate_sent, 32)
  :: pattern == 2 -> fill_min_rate(min_rate_sent, 255)
  :: else -> ramp_min_rate(min_rate_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_min_rate(min_rate_sent);
    assert(at == 2);
    at = 0;
    decode_min_rate(min_rate_got);
    assert(at == 2);
    equal_min_rate(min_rate_got, min_rate_sent)
  }
}

/* Max Rate: encoded, read back, and compared */
proctype check_max_rate() {
  MaxRate max_rate_sent;
  MaxRate max_rate_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_max_rate(max_rate_sent, 0)
  :: pattern == 1 -> fill_max_rate(max_rate_sent, 32)
  :: pattern == 2 -> fill_max_rate(max_rate_sent, 255)
  :: else -> ramp_max_rate(max_rate_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_max_rate(max_rate_sent);
    assert(at == 2);
    at = 0;
    decode_max_rate(max_rate_got);
    assert(at == 2);
    equal_max_rate(max_rate_got, max_rate_sent)
  }
}

/* Conditional Type: encoded, read back, and compared */
proctype check_conditional_type() {
  ConditionalType conditional_type_sent;
  ConditionalType conditional_type_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_conditional_type(conditional_type_sent, 0)
  :: pattern == 1 -> fill_conditional_type(conditional_type_sent, 32)
  :: pattern == 2 -> fill_conditional_type(conditional_type_sent, 255)
  :: else -> ramp_conditional_type(conditional_type_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_conditional_type(conditional_type_sent);
    assert(at == 1);
    at = 0;
    decode_conditional_type(conditional_type_got);
    assert(at == 1);
    equal_conditional_type(conditional_type_got, conditional_type_sent)
  }
}

/* Firm Up Id: encoded, read back, and compared */
proctype check_firm_up_id() {
  FirmUpId firm_up_id_sent;
  FirmUpId firm_up_id_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_firm_up_id(firm_up_id_sent, 0)
  :: pattern == 1 -> fill_firm_up_id(firm_up_id_sent, 32)
  :: pattern == 2 -> fill_firm_up_id(firm_up_id_sent, 255)
  :: else -> ramp_firm_up_id(firm_up_id_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_firm_up_id(firm_up_id_sent);
    assert(at == 4);
    at = 0;
    decode_firm_up_id(firm_up_id_got);
    assert(at == 4);
    equal_firm_up_id(firm_up_id_got, firm_up_id_sent)
  }
}

/* Cancel Order Message: encoded, read back, and compared */
proctype check_cancel_order_message() {
  CancelOrderMessage cancel_order_message_sent;
  CancelOrderMessage cancel_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_message(cancel_order_message_sent, 0)
  :: pattern == 1 -> fill_cancel_order_message(cancel_order_message_sent, 32)
  :: pattern == 2 -> fill_cancel_order_message(cancel_order_message_sent, 255)
  :: else -> ramp_cancel_order_message(cancel_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_message(cancel_order_message_sent);
    assert(at == 14);
    at = 0;
    decode_cancel_order_message(cancel_order_message_got);
    assert(at == 14);
    equal_cancel_order_message(cancel_order_message_got, cancel_order_message_sent)
  }
}

/* Mmi Notification Request Message: encoded, read back, and compared */
proctype check_mmi_notification_request_message() {
  MmiNotificationRequestMessage mmi_notification_request_message_sent;
  MmiNotificationRequestMessage mmi_notification_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mmi_notification_request_message(mmi_notification_request_message_sent, 0)
  :: pattern == 1 -> fill_mmi_notification_request_message(mmi_notification_request_message_sent, 32)
  :: pattern == 2 -> fill_mmi_notification_request_message(mmi_notification_request_message_sent, 255)
  :: else -> ramp_mmi_notification_request_message(mmi_notification_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mmi_notification_request_message(mmi_notification_request_message_sent);
    assert(at == 20);
    at = 0;
    decode_mmi_notification_request_message(mmi_notification_request_message_got);
    assert(at == 20);
    equal_mmi_notification_request_message(mmi_notification_request_message_got, mmi_notification_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_client_packet_header()
  :: run check_login_request_packet()
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
  :: run check_target_strategy()
  :: run check_min_rate()
  :: run check_max_rate()
  :: run check_conditional_type()
  :: run check_firm_up_id()
  :: run check_cancel_order_message()
  :: run check_mmi_notification_request_message()
  fi
}
