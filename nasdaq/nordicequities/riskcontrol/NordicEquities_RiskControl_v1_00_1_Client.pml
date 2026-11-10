/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Nordic Pre-Trade Risk Management
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 109

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

/* ---- Modify Account Settings Message: 19 bytes ------------------------------- */

/* Updates the settings for a given PRM Account */
typedef ModifyAccountSettingsMessage {
  byte user_ref_num[4];
  byte prm_account[6];
  byte repeated_order_generation[4];
  byte trigger_restrict_symbol_on_repeated_order_generation;
  byte in_auction_market_order_prevention;
  byte in_auction_fat_finger_protection;
  byte in_auction_market_order_protection;
  byte block_and_cancel
};

int modify_account_settings_message_at;

/* every byte of Modify Account Settings Message set to one value */
inline fill_modify_account_settings_message(modify_account_settings_message_record, modify_account_settings_message_value) {
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 4 -> modify_account_settings_message_record.user_ref_num[modify_account_settings_message_at] = modify_account_settings_message_value; modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 6 -> modify_account_settings_message_record.prm_account[modify_account_settings_message_at] = modify_account_settings_message_value; modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 4 -> modify_account_settings_message_record.repeated_order_generation[modify_account_settings_message_at] = modify_account_settings_message_value; modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  modify_account_settings_message_record.trigger_restrict_symbol_on_repeated_order_generation = modify_account_settings_message_value;
  modify_account_settings_message_record.in_auction_market_order_prevention = modify_account_settings_message_value;
  modify_account_settings_message_record.in_auction_fat_finger_protection = modify_account_settings_message_value;
  modify_account_settings_message_record.in_auction_market_order_protection = modify_account_settings_message_value;
  modify_account_settings_message_record.block_and_cancel = modify_account_settings_message_value;
  skip
}

/* each byte of Modify Account Settings Message set to where it lies, so a field read out of place says so */
inline ramp_modify_account_settings_message(modify_account_settings_message_record, modify_account_settings_message_base) {
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 4 -> modify_account_settings_message_record.user_ref_num[modify_account_settings_message_at] = (modify_account_settings_message_base + 0 + modify_account_settings_message_at + 1) % 256; modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 6 -> modify_account_settings_message_record.prm_account[modify_account_settings_message_at] = (modify_account_settings_message_base + 4 + modify_account_settings_message_at + 1) % 256; modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 4 -> modify_account_settings_message_record.repeated_order_generation[modify_account_settings_message_at] = (modify_account_settings_message_base + 10 + modify_account_settings_message_at + 1) % 256; modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  modify_account_settings_message_record.trigger_restrict_symbol_on_repeated_order_generation = (modify_account_settings_message_base + 14 + 1) % 256;
  modify_account_settings_message_record.in_auction_market_order_prevention = (modify_account_settings_message_base + 15 + 1) % 256;
  modify_account_settings_message_record.in_auction_fat_finger_protection = (modify_account_settings_message_base + 16 + 1) % 256;
  modify_account_settings_message_record.in_auction_market_order_protection = (modify_account_settings_message_base + 17 + 1) % 256;
  modify_account_settings_message_record.block_and_cancel = (modify_account_settings_message_base + 18 + 1) % 256;
  skip
}

/* Modify Account Settings Message to the wire, 19 bytes from where the cursor stands */
inline encode_modify_account_settings_message(modify_account_settings_message_record) {
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 4 -> wire[at] = modify_account_settings_message_record.user_ref_num[modify_account_settings_message_at]; at = at + 1; modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 6 -> wire[at] = modify_account_settings_message_record.prm_account[modify_account_settings_message_at]; at = at + 1; modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 4 -> wire[at] = modify_account_settings_message_record.repeated_order_generation[modify_account_settings_message_at]; at = at + 1; modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_account_settings_message_record.trigger_restrict_symbol_on_repeated_order_generation; at = at + 1;
  wire[at] = modify_account_settings_message_record.in_auction_market_order_prevention; at = at + 1;
  wire[at] = modify_account_settings_message_record.in_auction_fat_finger_protection; at = at + 1;
  wire[at] = modify_account_settings_message_record.in_auction_market_order_protection; at = at + 1;
  wire[at] = modify_account_settings_message_record.block_and_cancel; at = at + 1;
  skip
}

/* Modify Account Settings Message off the wire, 19 bytes from where the cursor stands */
inline decode_modify_account_settings_message(modify_account_settings_message_record) {
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 4 -> modify_account_settings_message_record.user_ref_num[modify_account_settings_message_at] = wire[at]; at = at + 1; modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 6 -> modify_account_settings_message_record.prm_account[modify_account_settings_message_at] = wire[at]; at = at + 1; modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 4 -> modify_account_settings_message_record.repeated_order_generation[modify_account_settings_message_at] = wire[at]; at = at + 1; modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  modify_account_settings_message_record.trigger_restrict_symbol_on_repeated_order_generation = wire[at]; at = at + 1;
  modify_account_settings_message_record.in_auction_market_order_prevention = wire[at]; at = at + 1;
  modify_account_settings_message_record.in_auction_fat_finger_protection = wire[at]; at = at + 1;
  modify_account_settings_message_record.in_auction_market_order_protection = wire[at]; at = at + 1;
  modify_account_settings_message_record.block_and_cancel = wire[at]; at = at + 1;
  skip
}

/* what was read of Modify Account Settings Message is what was written, byte for byte */
inline equal_modify_account_settings_message(modify_account_settings_message_read, modify_account_settings_message_written) {
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 4 -> assert(modify_account_settings_message_read.user_ref_num[modify_account_settings_message_at] == modify_account_settings_message_written.user_ref_num[modify_account_settings_message_at]); modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 6 -> assert(modify_account_settings_message_read.prm_account[modify_account_settings_message_at] == modify_account_settings_message_written.prm_account[modify_account_settings_message_at]); modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  modify_account_settings_message_at = 0;
  do
  :: modify_account_settings_message_at < 4 -> assert(modify_account_settings_message_read.repeated_order_generation[modify_account_settings_message_at] == modify_account_settings_message_written.repeated_order_generation[modify_account_settings_message_at]); modify_account_settings_message_at = modify_account_settings_message_at + 1
  :: else -> break
  od;
  assert(modify_account_settings_message_read.trigger_restrict_symbol_on_repeated_order_generation == modify_account_settings_message_written.trigger_restrict_symbol_on_repeated_order_generation);
  assert(modify_account_settings_message_read.in_auction_market_order_prevention == modify_account_settings_message_written.in_auction_market_order_prevention);
  assert(modify_account_settings_message_read.in_auction_fat_finger_protection == modify_account_settings_message_written.in_auction_fat_finger_protection);
  assert(modify_account_settings_message_read.in_auction_market_order_protection == modify_account_settings_message_written.in_auction_market_order_protection);
  assert(modify_account_settings_message_read.block_and_cancel == modify_account_settings_message_written.block_and_cancel);
  skip
}

/* ---- Modify Order Book Restriction Message: 15 bytes ------------------------- */

/* Marks an Order Book as restricted or non-restricted for a given PRM Account */
typedef ModifyOrderBookRestrictionMessage {
  byte user_ref_num[4];
  byte prm_account[6];
  byte order_book[4];
  byte state
};

int modify_order_book_restriction_message_at;

/* every byte of Modify Order Book Restriction Message set to one value */
inline fill_modify_order_book_restriction_message(modify_order_book_restriction_message_record, modify_order_book_restriction_message_value) {
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 4 -> modify_order_book_restriction_message_record.user_ref_num[modify_order_book_restriction_message_at] = modify_order_book_restriction_message_value; modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 6 -> modify_order_book_restriction_message_record.prm_account[modify_order_book_restriction_message_at] = modify_order_book_restriction_message_value; modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 4 -> modify_order_book_restriction_message_record.order_book[modify_order_book_restriction_message_at] = modify_order_book_restriction_message_value; modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  modify_order_book_restriction_message_record.state = modify_order_book_restriction_message_value;
  skip
}

/* each byte of Modify Order Book Restriction Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_book_restriction_message(modify_order_book_restriction_message_record, modify_order_book_restriction_message_base) {
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 4 -> modify_order_book_restriction_message_record.user_ref_num[modify_order_book_restriction_message_at] = (modify_order_book_restriction_message_base + 0 + modify_order_book_restriction_message_at + 1) % 256; modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 6 -> modify_order_book_restriction_message_record.prm_account[modify_order_book_restriction_message_at] = (modify_order_book_restriction_message_base + 4 + modify_order_book_restriction_message_at + 1) % 256; modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 4 -> modify_order_book_restriction_message_record.order_book[modify_order_book_restriction_message_at] = (modify_order_book_restriction_message_base + 10 + modify_order_book_restriction_message_at + 1) % 256; modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  modify_order_book_restriction_message_record.state = (modify_order_book_restriction_message_base + 14 + 1) % 256;
  skip
}

/* Modify Order Book Restriction Message to the wire, 15 bytes from where the cursor stands */
inline encode_modify_order_book_restriction_message(modify_order_book_restriction_message_record) {
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 4 -> wire[at] = modify_order_book_restriction_message_record.user_ref_num[modify_order_book_restriction_message_at]; at = at + 1; modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 6 -> wire[at] = modify_order_book_restriction_message_record.prm_account[modify_order_book_restriction_message_at]; at = at + 1; modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 4 -> wire[at] = modify_order_book_restriction_message_record.order_book[modify_order_book_restriction_message_at]; at = at + 1; modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_book_restriction_message_record.state; at = at + 1;
  skip
}

/* Modify Order Book Restriction Message off the wire, 15 bytes from where the cursor stands */
inline decode_modify_order_book_restriction_message(modify_order_book_restriction_message_record) {
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 4 -> modify_order_book_restriction_message_record.user_ref_num[modify_order_book_restriction_message_at] = wire[at]; at = at + 1; modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 6 -> modify_order_book_restriction_message_record.prm_account[modify_order_book_restriction_message_at] = wire[at]; at = at + 1; modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 4 -> modify_order_book_restriction_message_record.order_book[modify_order_book_restriction_message_at] = wire[at]; at = at + 1; modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  modify_order_book_restriction_message_record.state = wire[at]; at = at + 1;
  skip
}

/* what was read of Modify Order Book Restriction Message is what was written, byte for byte */
inline equal_modify_order_book_restriction_message(modify_order_book_restriction_message_read, modify_order_book_restriction_message_written) {
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 4 -> assert(modify_order_book_restriction_message_read.user_ref_num[modify_order_book_restriction_message_at] == modify_order_book_restriction_message_written.user_ref_num[modify_order_book_restriction_message_at]); modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 6 -> assert(modify_order_book_restriction_message_read.prm_account[modify_order_book_restriction_message_at] == modify_order_book_restriction_message_written.prm_account[modify_order_book_restriction_message_at]); modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  modify_order_book_restriction_message_at = 0;
  do
  :: modify_order_book_restriction_message_at < 4 -> assert(modify_order_book_restriction_message_read.order_book[modify_order_book_restriction_message_at] == modify_order_book_restriction_message_written.order_book[modify_order_book_restriction_message_at]); modify_order_book_restriction_message_at = modify_order_book_restriction_message_at + 1
  :: else -> break
  od;
  assert(modify_order_book_restriction_message_read.state == modify_order_book_restriction_message_written.state);
  skip
}

/* ---- Modify Market Segment Restriction Message: 13 bytes --------------------- */

/* Marks a Market Segment as restricted or non-restricted for a given PRM Account */
typedef ModifyMarketSegmentRestrictionMessage {
  byte user_ref_num[4];
  byte prm_account[6];
  byte market_segment[2];
  byte state
};

int modify_market_segment_restriction_message_at;

/* every byte of Modify Market Segment Restriction Message set to one value */
inline fill_modify_market_segment_restriction_message(modify_market_segment_restriction_message_record, modify_market_segment_restriction_message_value) {
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 4 -> modify_market_segment_restriction_message_record.user_ref_num[modify_market_segment_restriction_message_at] = modify_market_segment_restriction_message_value; modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 6 -> modify_market_segment_restriction_message_record.prm_account[modify_market_segment_restriction_message_at] = modify_market_segment_restriction_message_value; modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 2 -> modify_market_segment_restriction_message_record.market_segment[modify_market_segment_restriction_message_at] = modify_market_segment_restriction_message_value; modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  modify_market_segment_restriction_message_record.state = modify_market_segment_restriction_message_value;
  skip
}

/* each byte of Modify Market Segment Restriction Message set to where it lies, so a field read out of place says so */
inline ramp_modify_market_segment_restriction_message(modify_market_segment_restriction_message_record, modify_market_segment_restriction_message_base) {
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 4 -> modify_market_segment_restriction_message_record.user_ref_num[modify_market_segment_restriction_message_at] = (modify_market_segment_restriction_message_base + 0 + modify_market_segment_restriction_message_at + 1) % 256; modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 6 -> modify_market_segment_restriction_message_record.prm_account[modify_market_segment_restriction_message_at] = (modify_market_segment_restriction_message_base + 4 + modify_market_segment_restriction_message_at + 1) % 256; modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 2 -> modify_market_segment_restriction_message_record.market_segment[modify_market_segment_restriction_message_at] = (modify_market_segment_restriction_message_base + 10 + modify_market_segment_restriction_message_at + 1) % 256; modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  modify_market_segment_restriction_message_record.state = (modify_market_segment_restriction_message_base + 12 + 1) % 256;
  skip
}

/* Modify Market Segment Restriction Message to the wire, 13 bytes from where the cursor stands */
inline encode_modify_market_segment_restriction_message(modify_market_segment_restriction_message_record) {
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 4 -> wire[at] = modify_market_segment_restriction_message_record.user_ref_num[modify_market_segment_restriction_message_at]; at = at + 1; modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 6 -> wire[at] = modify_market_segment_restriction_message_record.prm_account[modify_market_segment_restriction_message_at]; at = at + 1; modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 2 -> wire[at] = modify_market_segment_restriction_message_record.market_segment[modify_market_segment_restriction_message_at]; at = at + 1; modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_market_segment_restriction_message_record.state; at = at + 1;
  skip
}

/* Modify Market Segment Restriction Message off the wire, 13 bytes from where the cursor stands */
inline decode_modify_market_segment_restriction_message(modify_market_segment_restriction_message_record) {
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 4 -> modify_market_segment_restriction_message_record.user_ref_num[modify_market_segment_restriction_message_at] = wire[at]; at = at + 1; modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 6 -> modify_market_segment_restriction_message_record.prm_account[modify_market_segment_restriction_message_at] = wire[at]; at = at + 1; modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 2 -> modify_market_segment_restriction_message_record.market_segment[modify_market_segment_restriction_message_at] = wire[at]; at = at + 1; modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  modify_market_segment_restriction_message_record.state = wire[at]; at = at + 1;
  skip
}

/* what was read of Modify Market Segment Restriction Message is what was written, byte for byte */
inline equal_modify_market_segment_restriction_message(modify_market_segment_restriction_message_read, modify_market_segment_restriction_message_written) {
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 4 -> assert(modify_market_segment_restriction_message_read.user_ref_num[modify_market_segment_restriction_message_at] == modify_market_segment_restriction_message_written.user_ref_num[modify_market_segment_restriction_message_at]); modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 6 -> assert(modify_market_segment_restriction_message_read.prm_account[modify_market_segment_restriction_message_at] == modify_market_segment_restriction_message_written.prm_account[modify_market_segment_restriction_message_at]); modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  modify_market_segment_restriction_message_at = 0;
  do
  :: modify_market_segment_restriction_message_at < 2 -> assert(modify_market_segment_restriction_message_read.market_segment[modify_market_segment_restriction_message_at] == modify_market_segment_restriction_message_written.market_segment[modify_market_segment_restriction_message_at]); modify_market_segment_restriction_message_at = modify_market_segment_restriction_message_at + 1
  :: else -> break
  od;
  assert(modify_market_segment_restriction_message_read.state == modify_market_segment_restriction_message_written.state);
  skip
}

/* ---- Modify Limit Settings Message: 109 bytes -------------------------------- */

/* Updates the Limit settings for a given PRM Account and Currency */
typedef ModifyLimitSettingsMessage {
  byte user_ref_num[4];
  byte prm_account[6];
  byte currency[3];
  byte max_quantity[8];
  byte max_value[8];
  byte unused[8];
  byte total_risk_value[8];
  byte trade_buy_value[8];
  byte trade_sell_value[8];
  byte trade_net_value[8];
  byte open_order_buy_value[8];
  byte open_order_sell_value[8];
  byte open_order_net_value[8];
  byte max_quantity_auction[8];
  byte max_value_auction[8]
};

int modify_limit_settings_message_at;

/* every byte of Modify Limit Settings Message set to one value */
inline fill_modify_limit_settings_message(modify_limit_settings_message_record, modify_limit_settings_message_value) {
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 4 -> modify_limit_settings_message_record.user_ref_num[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 6 -> modify_limit_settings_message_record.prm_account[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 3 -> modify_limit_settings_message_record.currency[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.max_quantity[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.max_value[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.unused[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.total_risk_value[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.trade_buy_value[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.trade_sell_value[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.trade_net_value[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.open_order_buy_value[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.open_order_sell_value[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.open_order_net_value[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.max_quantity_auction[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.max_value_auction[modify_limit_settings_message_at] = modify_limit_settings_message_value; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Limit Settings Message set to where it lies, so a field read out of place says so */
inline ramp_modify_limit_settings_message(modify_limit_settings_message_record, modify_limit_settings_message_base) {
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 4 -> modify_limit_settings_message_record.user_ref_num[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 0 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 6 -> modify_limit_settings_message_record.prm_account[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 4 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 3 -> modify_limit_settings_message_record.currency[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 10 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.max_quantity[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 13 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.max_value[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 21 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.unused[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 29 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.total_risk_value[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 37 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.trade_buy_value[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 45 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.trade_sell_value[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 53 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.trade_net_value[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 61 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.open_order_buy_value[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 69 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.open_order_sell_value[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 77 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.open_order_net_value[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 85 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.max_quantity_auction[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 93 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.max_value_auction[modify_limit_settings_message_at] = (modify_limit_settings_message_base + 101 + modify_limit_settings_message_at + 1) % 256; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Limit Settings Message to the wire, 109 bytes from where the cursor stands */
inline encode_modify_limit_settings_message(modify_limit_settings_message_record) {
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 4 -> wire[at] = modify_limit_settings_message_record.user_ref_num[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 6 -> wire[at] = modify_limit_settings_message_record.prm_account[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 3 -> wire[at] = modify_limit_settings_message_record.currency[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> wire[at] = modify_limit_settings_message_record.max_quantity[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> wire[at] = modify_limit_settings_message_record.max_value[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> wire[at] = modify_limit_settings_message_record.unused[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> wire[at] = modify_limit_settings_message_record.total_risk_value[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> wire[at] = modify_limit_settings_message_record.trade_buy_value[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> wire[at] = modify_limit_settings_message_record.trade_sell_value[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> wire[at] = modify_limit_settings_message_record.trade_net_value[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> wire[at] = modify_limit_settings_message_record.open_order_buy_value[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> wire[at] = modify_limit_settings_message_record.open_order_sell_value[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> wire[at] = modify_limit_settings_message_record.open_order_net_value[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> wire[at] = modify_limit_settings_message_record.max_quantity_auction[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> wire[at] = modify_limit_settings_message_record.max_value_auction[modify_limit_settings_message_at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Limit Settings Message off the wire, 109 bytes from where the cursor stands */
inline decode_modify_limit_settings_message(modify_limit_settings_message_record) {
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 4 -> modify_limit_settings_message_record.user_ref_num[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 6 -> modify_limit_settings_message_record.prm_account[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 3 -> modify_limit_settings_message_record.currency[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.max_quantity[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.max_value[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.unused[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.total_risk_value[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.trade_buy_value[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.trade_sell_value[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.trade_net_value[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.open_order_buy_value[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.open_order_sell_value[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.open_order_net_value[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.max_quantity_auction[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> modify_limit_settings_message_record.max_value_auction[modify_limit_settings_message_at] = wire[at]; at = at + 1; modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Limit Settings Message is what was written, byte for byte */
inline equal_modify_limit_settings_message(modify_limit_settings_message_read, modify_limit_settings_message_written) {
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 4 -> assert(modify_limit_settings_message_read.user_ref_num[modify_limit_settings_message_at] == modify_limit_settings_message_written.user_ref_num[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 6 -> assert(modify_limit_settings_message_read.prm_account[modify_limit_settings_message_at] == modify_limit_settings_message_written.prm_account[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 3 -> assert(modify_limit_settings_message_read.currency[modify_limit_settings_message_at] == modify_limit_settings_message_written.currency[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> assert(modify_limit_settings_message_read.max_quantity[modify_limit_settings_message_at] == modify_limit_settings_message_written.max_quantity[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> assert(modify_limit_settings_message_read.max_value[modify_limit_settings_message_at] == modify_limit_settings_message_written.max_value[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> assert(modify_limit_settings_message_read.unused[modify_limit_settings_message_at] == modify_limit_settings_message_written.unused[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> assert(modify_limit_settings_message_read.total_risk_value[modify_limit_settings_message_at] == modify_limit_settings_message_written.total_risk_value[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> assert(modify_limit_settings_message_read.trade_buy_value[modify_limit_settings_message_at] == modify_limit_settings_message_written.trade_buy_value[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> assert(modify_limit_settings_message_read.trade_sell_value[modify_limit_settings_message_at] == modify_limit_settings_message_written.trade_sell_value[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> assert(modify_limit_settings_message_read.trade_net_value[modify_limit_settings_message_at] == modify_limit_settings_message_written.trade_net_value[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> assert(modify_limit_settings_message_read.open_order_buy_value[modify_limit_settings_message_at] == modify_limit_settings_message_written.open_order_buy_value[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> assert(modify_limit_settings_message_read.open_order_sell_value[modify_limit_settings_message_at] == modify_limit_settings_message_written.open_order_sell_value[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> assert(modify_limit_settings_message_read.open_order_net_value[modify_limit_settings_message_at] == modify_limit_settings_message_written.open_order_net_value[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> assert(modify_limit_settings_message_read.max_quantity_auction[modify_limit_settings_message_at] == modify_limit_settings_message_written.max_quantity_auction[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  modify_limit_settings_message_at = 0;
  do
  :: modify_limit_settings_message_at < 8 -> assert(modify_limit_settings_message_read.max_value_auction[modify_limit_settings_message_at] == modify_limit_settings_message_written.max_value_auction[modify_limit_settings_message_at]); modify_limit_settings_message_at = modify_limit_settings_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Account Currency Setting Message: 15 bytes ----------------------- */

/* Updates the settings for a given PRM Account's currency */
typedef ModifyAccountCurrencySettingMessage {
  byte user_ref_num[4];
  byte prm_account[6];
  byte currency[3];
  byte reject_all_flag;
  byte blow_through_protection
};

int modify_account_currency_setting_message_at;

/* every byte of Modify Account Currency Setting Message set to one value */
inline fill_modify_account_currency_setting_message(modify_account_currency_setting_message_record, modify_account_currency_setting_message_value) {
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 4 -> modify_account_currency_setting_message_record.user_ref_num[modify_account_currency_setting_message_at] = modify_account_currency_setting_message_value; modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 6 -> modify_account_currency_setting_message_record.prm_account[modify_account_currency_setting_message_at] = modify_account_currency_setting_message_value; modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 3 -> modify_account_currency_setting_message_record.currency[modify_account_currency_setting_message_at] = modify_account_currency_setting_message_value; modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  modify_account_currency_setting_message_record.reject_all_flag = modify_account_currency_setting_message_value;
  modify_account_currency_setting_message_record.blow_through_protection = modify_account_currency_setting_message_value;
  skip
}

/* each byte of Modify Account Currency Setting Message set to where it lies, so a field read out of place says so */
inline ramp_modify_account_currency_setting_message(modify_account_currency_setting_message_record, modify_account_currency_setting_message_base) {
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 4 -> modify_account_currency_setting_message_record.user_ref_num[modify_account_currency_setting_message_at] = (modify_account_currency_setting_message_base + 0 + modify_account_currency_setting_message_at + 1) % 256; modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 6 -> modify_account_currency_setting_message_record.prm_account[modify_account_currency_setting_message_at] = (modify_account_currency_setting_message_base + 4 + modify_account_currency_setting_message_at + 1) % 256; modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 3 -> modify_account_currency_setting_message_record.currency[modify_account_currency_setting_message_at] = (modify_account_currency_setting_message_base + 10 + modify_account_currency_setting_message_at + 1) % 256; modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  modify_account_currency_setting_message_record.reject_all_flag = (modify_account_currency_setting_message_base + 13 + 1) % 256;
  modify_account_currency_setting_message_record.blow_through_protection = (modify_account_currency_setting_message_base + 14 + 1) % 256;
  skip
}

/* Modify Account Currency Setting Message to the wire, 15 bytes from where the cursor stands */
inline encode_modify_account_currency_setting_message(modify_account_currency_setting_message_record) {
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 4 -> wire[at] = modify_account_currency_setting_message_record.user_ref_num[modify_account_currency_setting_message_at]; at = at + 1; modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 6 -> wire[at] = modify_account_currency_setting_message_record.prm_account[modify_account_currency_setting_message_at]; at = at + 1; modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 3 -> wire[at] = modify_account_currency_setting_message_record.currency[modify_account_currency_setting_message_at]; at = at + 1; modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_account_currency_setting_message_record.reject_all_flag; at = at + 1;
  wire[at] = modify_account_currency_setting_message_record.blow_through_protection; at = at + 1;
  skip
}

/* Modify Account Currency Setting Message off the wire, 15 bytes from where the cursor stands */
inline decode_modify_account_currency_setting_message(modify_account_currency_setting_message_record) {
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 4 -> modify_account_currency_setting_message_record.user_ref_num[modify_account_currency_setting_message_at] = wire[at]; at = at + 1; modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 6 -> modify_account_currency_setting_message_record.prm_account[modify_account_currency_setting_message_at] = wire[at]; at = at + 1; modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 3 -> modify_account_currency_setting_message_record.currency[modify_account_currency_setting_message_at] = wire[at]; at = at + 1; modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  modify_account_currency_setting_message_record.reject_all_flag = wire[at]; at = at + 1;
  modify_account_currency_setting_message_record.blow_through_protection = wire[at]; at = at + 1;
  skip
}

/* what was read of Modify Account Currency Setting Message is what was written, byte for byte */
inline equal_modify_account_currency_setting_message(modify_account_currency_setting_message_read, modify_account_currency_setting_message_written) {
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 4 -> assert(modify_account_currency_setting_message_read.user_ref_num[modify_account_currency_setting_message_at] == modify_account_currency_setting_message_written.user_ref_num[modify_account_currency_setting_message_at]); modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 6 -> assert(modify_account_currency_setting_message_read.prm_account[modify_account_currency_setting_message_at] == modify_account_currency_setting_message_written.prm_account[modify_account_currency_setting_message_at]); modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  modify_account_currency_setting_message_at = 0;
  do
  :: modify_account_currency_setting_message_at < 3 -> assert(modify_account_currency_setting_message_read.currency[modify_account_currency_setting_message_at] == modify_account_currency_setting_message_written.currency[modify_account_currency_setting_message_at]); modify_account_currency_setting_message_at = modify_account_currency_setting_message_at + 1
  :: else -> break
  od;
  assert(modify_account_currency_setting_message_read.reject_all_flag == modify_account_currency_setting_message_written.reject_all_flag);
  assert(modify_account_currency_setting_message_read.blow_through_protection == modify_account_currency_setting_message_written.blow_through_protection);
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

/* Modify Account Settings Message: encoded, read back, and compared */
proctype check_modify_account_settings_message() {
  ModifyAccountSettingsMessage modify_account_settings_message_sent;
  ModifyAccountSettingsMessage modify_account_settings_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_account_settings_message(modify_account_settings_message_sent, 0)
  :: pattern == 1 -> fill_modify_account_settings_message(modify_account_settings_message_sent, 32)
  :: pattern == 2 -> fill_modify_account_settings_message(modify_account_settings_message_sent, 255)
  :: else -> ramp_modify_account_settings_message(modify_account_settings_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_account_settings_message(modify_account_settings_message_sent);
    assert(at == 19);
    at = 0;
    decode_modify_account_settings_message(modify_account_settings_message_got);
    assert(at == 19);
    equal_modify_account_settings_message(modify_account_settings_message_got, modify_account_settings_message_sent)
  }
}

/* Modify Order Book Restriction Message: encoded, read back, and compared */
proctype check_modify_order_book_restriction_message() {
  ModifyOrderBookRestrictionMessage modify_order_book_restriction_message_sent;
  ModifyOrderBookRestrictionMessage modify_order_book_restriction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_book_restriction_message(modify_order_book_restriction_message_sent, 0)
  :: pattern == 1 -> fill_modify_order_book_restriction_message(modify_order_book_restriction_message_sent, 32)
  :: pattern == 2 -> fill_modify_order_book_restriction_message(modify_order_book_restriction_message_sent, 255)
  :: else -> ramp_modify_order_book_restriction_message(modify_order_book_restriction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_book_restriction_message(modify_order_book_restriction_message_sent);
    assert(at == 15);
    at = 0;
    decode_modify_order_book_restriction_message(modify_order_book_restriction_message_got);
    assert(at == 15);
    equal_modify_order_book_restriction_message(modify_order_book_restriction_message_got, modify_order_book_restriction_message_sent)
  }
}

/* Modify Market Segment Restriction Message: encoded, read back, and compared */
proctype check_modify_market_segment_restriction_message() {
  ModifyMarketSegmentRestrictionMessage modify_market_segment_restriction_message_sent;
  ModifyMarketSegmentRestrictionMessage modify_market_segment_restriction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_market_segment_restriction_message(modify_market_segment_restriction_message_sent, 0)
  :: pattern == 1 -> fill_modify_market_segment_restriction_message(modify_market_segment_restriction_message_sent, 32)
  :: pattern == 2 -> fill_modify_market_segment_restriction_message(modify_market_segment_restriction_message_sent, 255)
  :: else -> ramp_modify_market_segment_restriction_message(modify_market_segment_restriction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_market_segment_restriction_message(modify_market_segment_restriction_message_sent);
    assert(at == 13);
    at = 0;
    decode_modify_market_segment_restriction_message(modify_market_segment_restriction_message_got);
    assert(at == 13);
    equal_modify_market_segment_restriction_message(modify_market_segment_restriction_message_got, modify_market_segment_restriction_message_sent)
  }
}

/* Modify Limit Settings Message: encoded, read back, and compared */
proctype check_modify_limit_settings_message() {
  ModifyLimitSettingsMessage modify_limit_settings_message_sent;
  ModifyLimitSettingsMessage modify_limit_settings_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_limit_settings_message(modify_limit_settings_message_sent, 0)
  :: pattern == 1 -> fill_modify_limit_settings_message(modify_limit_settings_message_sent, 32)
  :: pattern == 2 -> fill_modify_limit_settings_message(modify_limit_settings_message_sent, 255)
  :: else -> ramp_modify_limit_settings_message(modify_limit_settings_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_limit_settings_message(modify_limit_settings_message_sent);
    assert(at == 109);
    at = 0;
    decode_modify_limit_settings_message(modify_limit_settings_message_got);
    assert(at == 109);
    equal_modify_limit_settings_message(modify_limit_settings_message_got, modify_limit_settings_message_sent)
  }
}

/* Modify Account Currency Setting Message: encoded, read back, and compared */
proctype check_modify_account_currency_setting_message() {
  ModifyAccountCurrencySettingMessage modify_account_currency_setting_message_sent;
  ModifyAccountCurrencySettingMessage modify_account_currency_setting_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_account_currency_setting_message(modify_account_currency_setting_message_sent, 0)
  :: pattern == 1 -> fill_modify_account_currency_setting_message(modify_account_currency_setting_message_sent, 32)
  :: pattern == 2 -> fill_modify_account_currency_setting_message(modify_account_currency_setting_message_sent, 255)
  :: else -> ramp_modify_account_currency_setting_message(modify_account_currency_setting_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_account_currency_setting_message(modify_account_currency_setting_message_sent);
    assert(at == 15);
    at = 0;
    decode_modify_account_currency_setting_message(modify_account_currency_setting_message_got);
    assert(at == 15);
    equal_modify_account_currency_setting_message(modify_account_currency_setting_message_got, modify_account_currency_setting_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_client_packet_header()
  :: run check_login_request_packet()
  :: run check_modify_account_settings_message()
  :: run check_modify_order_book_restriction_message()
  :: run check_modify_market_segment_restriction_message()
  :: run check_modify_limit_settings_message()
  :: run check_modify_account_currency_setting_message()
  fi
}
