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

/* ---- Account Query Response Message: 4 bytes --------------------------------- */

/* Provides the PRM API port's next expected user reference number */
typedef AccountQueryResponseMessage {
  byte user_ref_num[4]
};

int account_query_response_message_at;

/* every byte of Account Query Response Message set to one value */
inline fill_account_query_response_message(account_query_response_message_record, account_query_response_message_value) {
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 4 -> account_query_response_message_record.user_ref_num[account_query_response_message_at] = account_query_response_message_value; account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Account Query Response Message set to where it lies, so a field read out of place says so */
inline ramp_account_query_response_message(account_query_response_message_record, account_query_response_message_base) {
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 4 -> account_query_response_message_record.user_ref_num[account_query_response_message_at] = (account_query_response_message_base + 0 + account_query_response_message_at + 1) % 256; account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Account Query Response Message to the wire, 4 bytes from where the cursor stands */
inline encode_account_query_response_message(account_query_response_message_record) {
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 4 -> wire[at] = account_query_response_message_record.user_ref_num[account_query_response_message_at]; at = at + 1; account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Account Query Response Message off the wire, 4 bytes from where the cursor stands */
inline decode_account_query_response_message(account_query_response_message_record) {
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 4 -> account_query_response_message_record.user_ref_num[account_query_response_message_at] = wire[at]; at = at + 1; account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Account Query Response Message is what was written, byte for byte */
inline equal_account_query_response_message(account_query_response_message_read, account_query_response_message_written) {
  account_query_response_message_at = 0;
  do
  :: account_query_response_message_at < 4 -> assert(account_query_response_message_read.user_ref_num[account_query_response_message_at] == account_query_response_message_written.user_ref_num[account_query_response_message_at]); account_query_response_message_at = account_query_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Account Settings Response Message: 19 bytes ----------------------------- */

/* Indicates that the settings for a given PRM Account have been updated */
typedef AccountSettingsResponseMessage {
  byte user_ref_num[4];
  byte prm_account[6];
  byte repeated_order_generation[4];
  byte trigger_restrict_symbol_on_repeated_order_generation;
  byte in_auction_market_order_prevention;
  byte in_auction_fat_finger_protection;
  byte in_auction_market_order_protection;
  byte block_and_cancel
};

int account_settings_response_message_at;

/* every byte of Account Settings Response Message set to one value */
inline fill_account_settings_response_message(account_settings_response_message_record, account_settings_response_message_value) {
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 4 -> account_settings_response_message_record.user_ref_num[account_settings_response_message_at] = account_settings_response_message_value; account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 6 -> account_settings_response_message_record.prm_account[account_settings_response_message_at] = account_settings_response_message_value; account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 4 -> account_settings_response_message_record.repeated_order_generation[account_settings_response_message_at] = account_settings_response_message_value; account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  account_settings_response_message_record.trigger_restrict_symbol_on_repeated_order_generation = account_settings_response_message_value;
  account_settings_response_message_record.in_auction_market_order_prevention = account_settings_response_message_value;
  account_settings_response_message_record.in_auction_fat_finger_protection = account_settings_response_message_value;
  account_settings_response_message_record.in_auction_market_order_protection = account_settings_response_message_value;
  account_settings_response_message_record.block_and_cancel = account_settings_response_message_value;
  skip
}

/* each byte of Account Settings Response Message set to where it lies, so a field read out of place says so */
inline ramp_account_settings_response_message(account_settings_response_message_record, account_settings_response_message_base) {
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 4 -> account_settings_response_message_record.user_ref_num[account_settings_response_message_at] = (account_settings_response_message_base + 0 + account_settings_response_message_at + 1) % 256; account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 6 -> account_settings_response_message_record.prm_account[account_settings_response_message_at] = (account_settings_response_message_base + 4 + account_settings_response_message_at + 1) % 256; account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 4 -> account_settings_response_message_record.repeated_order_generation[account_settings_response_message_at] = (account_settings_response_message_base + 10 + account_settings_response_message_at + 1) % 256; account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  account_settings_response_message_record.trigger_restrict_symbol_on_repeated_order_generation = (account_settings_response_message_base + 14 + 1) % 256;
  account_settings_response_message_record.in_auction_market_order_prevention = (account_settings_response_message_base + 15 + 1) % 256;
  account_settings_response_message_record.in_auction_fat_finger_protection = (account_settings_response_message_base + 16 + 1) % 256;
  account_settings_response_message_record.in_auction_market_order_protection = (account_settings_response_message_base + 17 + 1) % 256;
  account_settings_response_message_record.block_and_cancel = (account_settings_response_message_base + 18 + 1) % 256;
  skip
}

/* Account Settings Response Message to the wire, 19 bytes from where the cursor stands */
inline encode_account_settings_response_message(account_settings_response_message_record) {
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 4 -> wire[at] = account_settings_response_message_record.user_ref_num[account_settings_response_message_at]; at = at + 1; account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 6 -> wire[at] = account_settings_response_message_record.prm_account[account_settings_response_message_at]; at = at + 1; account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 4 -> wire[at] = account_settings_response_message_record.repeated_order_generation[account_settings_response_message_at]; at = at + 1; account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  wire[at] = account_settings_response_message_record.trigger_restrict_symbol_on_repeated_order_generation; at = at + 1;
  wire[at] = account_settings_response_message_record.in_auction_market_order_prevention; at = at + 1;
  wire[at] = account_settings_response_message_record.in_auction_fat_finger_protection; at = at + 1;
  wire[at] = account_settings_response_message_record.in_auction_market_order_protection; at = at + 1;
  wire[at] = account_settings_response_message_record.block_and_cancel; at = at + 1;
  skip
}

/* Account Settings Response Message off the wire, 19 bytes from where the cursor stands */
inline decode_account_settings_response_message(account_settings_response_message_record) {
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 4 -> account_settings_response_message_record.user_ref_num[account_settings_response_message_at] = wire[at]; at = at + 1; account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 6 -> account_settings_response_message_record.prm_account[account_settings_response_message_at] = wire[at]; at = at + 1; account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 4 -> account_settings_response_message_record.repeated_order_generation[account_settings_response_message_at] = wire[at]; at = at + 1; account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  account_settings_response_message_record.trigger_restrict_symbol_on_repeated_order_generation = wire[at]; at = at + 1;
  account_settings_response_message_record.in_auction_market_order_prevention = wire[at]; at = at + 1;
  account_settings_response_message_record.in_auction_fat_finger_protection = wire[at]; at = at + 1;
  account_settings_response_message_record.in_auction_market_order_protection = wire[at]; at = at + 1;
  account_settings_response_message_record.block_and_cancel = wire[at]; at = at + 1;
  skip
}

/* what was read of Account Settings Response Message is what was written, byte for byte */
inline equal_account_settings_response_message(account_settings_response_message_read, account_settings_response_message_written) {
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 4 -> assert(account_settings_response_message_read.user_ref_num[account_settings_response_message_at] == account_settings_response_message_written.user_ref_num[account_settings_response_message_at]); account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 6 -> assert(account_settings_response_message_read.prm_account[account_settings_response_message_at] == account_settings_response_message_written.prm_account[account_settings_response_message_at]); account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  account_settings_response_message_at = 0;
  do
  :: account_settings_response_message_at < 4 -> assert(account_settings_response_message_read.repeated_order_generation[account_settings_response_message_at] == account_settings_response_message_written.repeated_order_generation[account_settings_response_message_at]); account_settings_response_message_at = account_settings_response_message_at + 1
  :: else -> break
  od;
  assert(account_settings_response_message_read.trigger_restrict_symbol_on_repeated_order_generation == account_settings_response_message_written.trigger_restrict_symbol_on_repeated_order_generation);
  assert(account_settings_response_message_read.in_auction_market_order_prevention == account_settings_response_message_written.in_auction_market_order_prevention);
  assert(account_settings_response_message_read.in_auction_fat_finger_protection == account_settings_response_message_written.in_auction_fat_finger_protection);
  assert(account_settings_response_message_read.in_auction_market_order_protection == account_settings_response_message_written.in_auction_market_order_protection);
  assert(account_settings_response_message_read.block_and_cancel == account_settings_response_message_written.block_and_cancel);
  skip
}

/* ---- Order Book Restriction Response Message: 23 bytes ----------------------- */

/* Indicates that an Order Book has been restricted or non-restricted for a given PRM Account */
typedef OrderBookRestrictionResponseMessage {
  byte user_ref_num[4];
  byte timestamp[8];
  byte prm_account[6];
  byte order_book[4];
  byte state
};

int order_book_restriction_response_message_at;

/* every byte of Order Book Restriction Response Message set to one value */
inline fill_order_book_restriction_response_message(order_book_restriction_response_message_record, order_book_restriction_response_message_value) {
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 4 -> order_book_restriction_response_message_record.user_ref_num[order_book_restriction_response_message_at] = order_book_restriction_response_message_value; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 8 -> order_book_restriction_response_message_record.timestamp[order_book_restriction_response_message_at] = order_book_restriction_response_message_value; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 6 -> order_book_restriction_response_message_record.prm_account[order_book_restriction_response_message_at] = order_book_restriction_response_message_value; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 4 -> order_book_restriction_response_message_record.order_book[order_book_restriction_response_message_at] = order_book_restriction_response_message_value; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_record.state = order_book_restriction_response_message_value;
  skip
}

/* each byte of Order Book Restriction Response Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_restriction_response_message(order_book_restriction_response_message_record, order_book_restriction_response_message_base) {
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 4 -> order_book_restriction_response_message_record.user_ref_num[order_book_restriction_response_message_at] = (order_book_restriction_response_message_base + 0 + order_book_restriction_response_message_at + 1) % 256; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 8 -> order_book_restriction_response_message_record.timestamp[order_book_restriction_response_message_at] = (order_book_restriction_response_message_base + 4 + order_book_restriction_response_message_at + 1) % 256; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 6 -> order_book_restriction_response_message_record.prm_account[order_book_restriction_response_message_at] = (order_book_restriction_response_message_base + 12 + order_book_restriction_response_message_at + 1) % 256; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 4 -> order_book_restriction_response_message_record.order_book[order_book_restriction_response_message_at] = (order_book_restriction_response_message_base + 18 + order_book_restriction_response_message_at + 1) % 256; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_record.state = (order_book_restriction_response_message_base + 22 + 1) % 256;
  skip
}

/* Order Book Restriction Response Message to the wire, 23 bytes from where the cursor stands */
inline encode_order_book_restriction_response_message(order_book_restriction_response_message_record) {
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 4 -> wire[at] = order_book_restriction_response_message_record.user_ref_num[order_book_restriction_response_message_at]; at = at + 1; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 8 -> wire[at] = order_book_restriction_response_message_record.timestamp[order_book_restriction_response_message_at]; at = at + 1; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 6 -> wire[at] = order_book_restriction_response_message_record.prm_account[order_book_restriction_response_message_at]; at = at + 1; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 4 -> wire[at] = order_book_restriction_response_message_record.order_book[order_book_restriction_response_message_at]; at = at + 1; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_restriction_response_message_record.state; at = at + 1;
  skip
}

/* Order Book Restriction Response Message off the wire, 23 bytes from where the cursor stands */
inline decode_order_book_restriction_response_message(order_book_restriction_response_message_record) {
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 4 -> order_book_restriction_response_message_record.user_ref_num[order_book_restriction_response_message_at] = wire[at]; at = at + 1; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 8 -> order_book_restriction_response_message_record.timestamp[order_book_restriction_response_message_at] = wire[at]; at = at + 1; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 6 -> order_book_restriction_response_message_record.prm_account[order_book_restriction_response_message_at] = wire[at]; at = at + 1; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 4 -> order_book_restriction_response_message_record.order_book[order_book_restriction_response_message_at] = wire[at]; at = at + 1; order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_record.state = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Book Restriction Response Message is what was written, byte for byte */
inline equal_order_book_restriction_response_message(order_book_restriction_response_message_read, order_book_restriction_response_message_written) {
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 4 -> assert(order_book_restriction_response_message_read.user_ref_num[order_book_restriction_response_message_at] == order_book_restriction_response_message_written.user_ref_num[order_book_restriction_response_message_at]); order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 8 -> assert(order_book_restriction_response_message_read.timestamp[order_book_restriction_response_message_at] == order_book_restriction_response_message_written.timestamp[order_book_restriction_response_message_at]); order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 6 -> assert(order_book_restriction_response_message_read.prm_account[order_book_restriction_response_message_at] == order_book_restriction_response_message_written.prm_account[order_book_restriction_response_message_at]); order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  order_book_restriction_response_message_at = 0;
  do
  :: order_book_restriction_response_message_at < 4 -> assert(order_book_restriction_response_message_read.order_book[order_book_restriction_response_message_at] == order_book_restriction_response_message_written.order_book[order_book_restriction_response_message_at]); order_book_restriction_response_message_at = order_book_restriction_response_message_at + 1
  :: else -> break
  od;
  assert(order_book_restriction_response_message_read.state == order_book_restriction_response_message_written.state);
  skip
}

/* ---- Market Segment Restriction Response Message: 21 bytes ------------------- */

/* Indicates that a Market Segment has been restricted or non-restricted for a given PRM Account */
typedef MarketSegmentRestrictionResponseMessage {
  byte user_ref_num[4];
  byte timestamp[8];
  byte prm_account[6];
  byte market_segment[2];
  byte state
};

int market_segment_restriction_response_message_at;

/* every byte of Market Segment Restriction Response Message set to one value */
inline fill_market_segment_restriction_response_message(market_segment_restriction_response_message_record, market_segment_restriction_response_message_value) {
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 4 -> market_segment_restriction_response_message_record.user_ref_num[market_segment_restriction_response_message_at] = market_segment_restriction_response_message_value; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 8 -> market_segment_restriction_response_message_record.timestamp[market_segment_restriction_response_message_at] = market_segment_restriction_response_message_value; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 6 -> market_segment_restriction_response_message_record.prm_account[market_segment_restriction_response_message_at] = market_segment_restriction_response_message_value; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 2 -> market_segment_restriction_response_message_record.market_segment[market_segment_restriction_response_message_at] = market_segment_restriction_response_message_value; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_record.state = market_segment_restriction_response_message_value;
  skip
}

/* each byte of Market Segment Restriction Response Message set to where it lies, so a field read out of place says so */
inline ramp_market_segment_restriction_response_message(market_segment_restriction_response_message_record, market_segment_restriction_response_message_base) {
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 4 -> market_segment_restriction_response_message_record.user_ref_num[market_segment_restriction_response_message_at] = (market_segment_restriction_response_message_base + 0 + market_segment_restriction_response_message_at + 1) % 256; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 8 -> market_segment_restriction_response_message_record.timestamp[market_segment_restriction_response_message_at] = (market_segment_restriction_response_message_base + 4 + market_segment_restriction_response_message_at + 1) % 256; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 6 -> market_segment_restriction_response_message_record.prm_account[market_segment_restriction_response_message_at] = (market_segment_restriction_response_message_base + 12 + market_segment_restriction_response_message_at + 1) % 256; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 2 -> market_segment_restriction_response_message_record.market_segment[market_segment_restriction_response_message_at] = (market_segment_restriction_response_message_base + 18 + market_segment_restriction_response_message_at + 1) % 256; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_record.state = (market_segment_restriction_response_message_base + 20 + 1) % 256;
  skip
}

/* Market Segment Restriction Response Message to the wire, 21 bytes from where the cursor stands */
inline encode_market_segment_restriction_response_message(market_segment_restriction_response_message_record) {
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 4 -> wire[at] = market_segment_restriction_response_message_record.user_ref_num[market_segment_restriction_response_message_at]; at = at + 1; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 8 -> wire[at] = market_segment_restriction_response_message_record.timestamp[market_segment_restriction_response_message_at]; at = at + 1; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 6 -> wire[at] = market_segment_restriction_response_message_record.prm_account[market_segment_restriction_response_message_at]; at = at + 1; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 2 -> wire[at] = market_segment_restriction_response_message_record.market_segment[market_segment_restriction_response_message_at]; at = at + 1; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  wire[at] = market_segment_restriction_response_message_record.state; at = at + 1;
  skip
}

/* Market Segment Restriction Response Message off the wire, 21 bytes from where the cursor stands */
inline decode_market_segment_restriction_response_message(market_segment_restriction_response_message_record) {
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 4 -> market_segment_restriction_response_message_record.user_ref_num[market_segment_restriction_response_message_at] = wire[at]; at = at + 1; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 8 -> market_segment_restriction_response_message_record.timestamp[market_segment_restriction_response_message_at] = wire[at]; at = at + 1; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 6 -> market_segment_restriction_response_message_record.prm_account[market_segment_restriction_response_message_at] = wire[at]; at = at + 1; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 2 -> market_segment_restriction_response_message_record.market_segment[market_segment_restriction_response_message_at] = wire[at]; at = at + 1; market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_record.state = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Segment Restriction Response Message is what was written, byte for byte */
inline equal_market_segment_restriction_response_message(market_segment_restriction_response_message_read, market_segment_restriction_response_message_written) {
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 4 -> assert(market_segment_restriction_response_message_read.user_ref_num[market_segment_restriction_response_message_at] == market_segment_restriction_response_message_written.user_ref_num[market_segment_restriction_response_message_at]); market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 8 -> assert(market_segment_restriction_response_message_read.timestamp[market_segment_restriction_response_message_at] == market_segment_restriction_response_message_written.timestamp[market_segment_restriction_response_message_at]); market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 6 -> assert(market_segment_restriction_response_message_read.prm_account[market_segment_restriction_response_message_at] == market_segment_restriction_response_message_written.prm_account[market_segment_restriction_response_message_at]); market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  market_segment_restriction_response_message_at = 0;
  do
  :: market_segment_restriction_response_message_at < 2 -> assert(market_segment_restriction_response_message_read.market_segment[market_segment_restriction_response_message_at] == market_segment_restriction_response_message_written.market_segment[market_segment_restriction_response_message_at]); market_segment_restriction_response_message_at = market_segment_restriction_response_message_at + 1
  :: else -> break
  od;
  assert(market_segment_restriction_response_message_read.state == market_segment_restriction_response_message_written.state);
  skip
}

/* ---- Limit Settings Response Message: 109 bytes ------------------------------ */

/* Indicates that the Limit settings for a given PRM Account and Currency have been updated */
typedef LimitSettingsResponseMessage {
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

int limit_settings_response_message_at;

/* every byte of Limit Settings Response Message set to one value */
inline fill_limit_settings_response_message(limit_settings_response_message_record, limit_settings_response_message_value) {
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 4 -> limit_settings_response_message_record.user_ref_num[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 6 -> limit_settings_response_message_record.prm_account[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 3 -> limit_settings_response_message_record.currency[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.max_quantity[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.max_value[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.unused[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.total_risk_value[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.trade_buy_value[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.trade_sell_value[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.trade_net_value[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.open_order_buy_value[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.open_order_sell_value[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.open_order_net_value[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.max_quantity_auction[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.max_value_auction[limit_settings_response_message_at] = limit_settings_response_message_value; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Limit Settings Response Message set to where it lies, so a field read out of place says so */
inline ramp_limit_settings_response_message(limit_settings_response_message_record, limit_settings_response_message_base) {
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 4 -> limit_settings_response_message_record.user_ref_num[limit_settings_response_message_at] = (limit_settings_response_message_base + 0 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 6 -> limit_settings_response_message_record.prm_account[limit_settings_response_message_at] = (limit_settings_response_message_base + 4 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 3 -> limit_settings_response_message_record.currency[limit_settings_response_message_at] = (limit_settings_response_message_base + 10 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.max_quantity[limit_settings_response_message_at] = (limit_settings_response_message_base + 13 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.max_value[limit_settings_response_message_at] = (limit_settings_response_message_base + 21 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.unused[limit_settings_response_message_at] = (limit_settings_response_message_base + 29 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.total_risk_value[limit_settings_response_message_at] = (limit_settings_response_message_base + 37 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.trade_buy_value[limit_settings_response_message_at] = (limit_settings_response_message_base + 45 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.trade_sell_value[limit_settings_response_message_at] = (limit_settings_response_message_base + 53 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.trade_net_value[limit_settings_response_message_at] = (limit_settings_response_message_base + 61 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.open_order_buy_value[limit_settings_response_message_at] = (limit_settings_response_message_base + 69 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.open_order_sell_value[limit_settings_response_message_at] = (limit_settings_response_message_base + 77 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.open_order_net_value[limit_settings_response_message_at] = (limit_settings_response_message_base + 85 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.max_quantity_auction[limit_settings_response_message_at] = (limit_settings_response_message_base + 93 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.max_value_auction[limit_settings_response_message_at] = (limit_settings_response_message_base + 101 + limit_settings_response_message_at + 1) % 256; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Limit Settings Response Message to the wire, 109 bytes from where the cursor stands */
inline encode_limit_settings_response_message(limit_settings_response_message_record) {
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 4 -> wire[at] = limit_settings_response_message_record.user_ref_num[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 6 -> wire[at] = limit_settings_response_message_record.prm_account[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 3 -> wire[at] = limit_settings_response_message_record.currency[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> wire[at] = limit_settings_response_message_record.max_quantity[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> wire[at] = limit_settings_response_message_record.max_value[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> wire[at] = limit_settings_response_message_record.unused[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> wire[at] = limit_settings_response_message_record.total_risk_value[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> wire[at] = limit_settings_response_message_record.trade_buy_value[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> wire[at] = limit_settings_response_message_record.trade_sell_value[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> wire[at] = limit_settings_response_message_record.trade_net_value[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> wire[at] = limit_settings_response_message_record.open_order_buy_value[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> wire[at] = limit_settings_response_message_record.open_order_sell_value[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> wire[at] = limit_settings_response_message_record.open_order_net_value[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> wire[at] = limit_settings_response_message_record.max_quantity_auction[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> wire[at] = limit_settings_response_message_record.max_value_auction[limit_settings_response_message_at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Limit Settings Response Message off the wire, 109 bytes from where the cursor stands */
inline decode_limit_settings_response_message(limit_settings_response_message_record) {
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 4 -> limit_settings_response_message_record.user_ref_num[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 6 -> limit_settings_response_message_record.prm_account[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 3 -> limit_settings_response_message_record.currency[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.max_quantity[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.max_value[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.unused[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.total_risk_value[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.trade_buy_value[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.trade_sell_value[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.trade_net_value[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.open_order_buy_value[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.open_order_sell_value[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.open_order_net_value[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.max_quantity_auction[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> limit_settings_response_message_record.max_value_auction[limit_settings_response_message_at] = wire[at]; at = at + 1; limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Limit Settings Response Message is what was written, byte for byte */
inline equal_limit_settings_response_message(limit_settings_response_message_read, limit_settings_response_message_written) {
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 4 -> assert(limit_settings_response_message_read.user_ref_num[limit_settings_response_message_at] == limit_settings_response_message_written.user_ref_num[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 6 -> assert(limit_settings_response_message_read.prm_account[limit_settings_response_message_at] == limit_settings_response_message_written.prm_account[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 3 -> assert(limit_settings_response_message_read.currency[limit_settings_response_message_at] == limit_settings_response_message_written.currency[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> assert(limit_settings_response_message_read.max_quantity[limit_settings_response_message_at] == limit_settings_response_message_written.max_quantity[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> assert(limit_settings_response_message_read.max_value[limit_settings_response_message_at] == limit_settings_response_message_written.max_value[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> assert(limit_settings_response_message_read.unused[limit_settings_response_message_at] == limit_settings_response_message_written.unused[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> assert(limit_settings_response_message_read.total_risk_value[limit_settings_response_message_at] == limit_settings_response_message_written.total_risk_value[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> assert(limit_settings_response_message_read.trade_buy_value[limit_settings_response_message_at] == limit_settings_response_message_written.trade_buy_value[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> assert(limit_settings_response_message_read.trade_sell_value[limit_settings_response_message_at] == limit_settings_response_message_written.trade_sell_value[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> assert(limit_settings_response_message_read.trade_net_value[limit_settings_response_message_at] == limit_settings_response_message_written.trade_net_value[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> assert(limit_settings_response_message_read.open_order_buy_value[limit_settings_response_message_at] == limit_settings_response_message_written.open_order_buy_value[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> assert(limit_settings_response_message_read.open_order_sell_value[limit_settings_response_message_at] == limit_settings_response_message_written.open_order_sell_value[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> assert(limit_settings_response_message_read.open_order_net_value[limit_settings_response_message_at] == limit_settings_response_message_written.open_order_net_value[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> assert(limit_settings_response_message_read.max_quantity_auction[limit_settings_response_message_at] == limit_settings_response_message_written.max_quantity_auction[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  limit_settings_response_message_at = 0;
  do
  :: limit_settings_response_message_at < 8 -> assert(limit_settings_response_message_read.max_value_auction[limit_settings_response_message_at] == limit_settings_response_message_written.max_value_auction[limit_settings_response_message_at]); limit_settings_response_message_at = limit_settings_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Account Currency Setting Response Message: 15 bytes --------------------- */

/* Indicates that the settings for a given PRM Account's currency have been updated */
typedef AccountCurrencySettingResponseMessage {
  byte user_ref_num[4];
  byte prm_account[6];
  byte currency[3];
  byte reject_all_flag;
  byte blow_through_protection
};

int account_currency_setting_response_message_at;

/* every byte of Account Currency Setting Response Message set to one value */
inline fill_account_currency_setting_response_message(account_currency_setting_response_message_record, account_currency_setting_response_message_value) {
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 4 -> account_currency_setting_response_message_record.user_ref_num[account_currency_setting_response_message_at] = account_currency_setting_response_message_value; account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 6 -> account_currency_setting_response_message_record.prm_account[account_currency_setting_response_message_at] = account_currency_setting_response_message_value; account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 3 -> account_currency_setting_response_message_record.currency[account_currency_setting_response_message_at] = account_currency_setting_response_message_value; account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  account_currency_setting_response_message_record.reject_all_flag = account_currency_setting_response_message_value;
  account_currency_setting_response_message_record.blow_through_protection = account_currency_setting_response_message_value;
  skip
}

/* each byte of Account Currency Setting Response Message set to where it lies, so a field read out of place says so */
inline ramp_account_currency_setting_response_message(account_currency_setting_response_message_record, account_currency_setting_response_message_base) {
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 4 -> account_currency_setting_response_message_record.user_ref_num[account_currency_setting_response_message_at] = (account_currency_setting_response_message_base + 0 + account_currency_setting_response_message_at + 1) % 256; account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 6 -> account_currency_setting_response_message_record.prm_account[account_currency_setting_response_message_at] = (account_currency_setting_response_message_base + 4 + account_currency_setting_response_message_at + 1) % 256; account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 3 -> account_currency_setting_response_message_record.currency[account_currency_setting_response_message_at] = (account_currency_setting_response_message_base + 10 + account_currency_setting_response_message_at + 1) % 256; account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  account_currency_setting_response_message_record.reject_all_flag = (account_currency_setting_response_message_base + 13 + 1) % 256;
  account_currency_setting_response_message_record.blow_through_protection = (account_currency_setting_response_message_base + 14 + 1) % 256;
  skip
}

/* Account Currency Setting Response Message to the wire, 15 bytes from where the cursor stands */
inline encode_account_currency_setting_response_message(account_currency_setting_response_message_record) {
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 4 -> wire[at] = account_currency_setting_response_message_record.user_ref_num[account_currency_setting_response_message_at]; at = at + 1; account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 6 -> wire[at] = account_currency_setting_response_message_record.prm_account[account_currency_setting_response_message_at]; at = at + 1; account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 3 -> wire[at] = account_currency_setting_response_message_record.currency[account_currency_setting_response_message_at]; at = at + 1; account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  wire[at] = account_currency_setting_response_message_record.reject_all_flag; at = at + 1;
  wire[at] = account_currency_setting_response_message_record.blow_through_protection; at = at + 1;
  skip
}

/* Account Currency Setting Response Message off the wire, 15 bytes from where the cursor stands */
inline decode_account_currency_setting_response_message(account_currency_setting_response_message_record) {
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 4 -> account_currency_setting_response_message_record.user_ref_num[account_currency_setting_response_message_at] = wire[at]; at = at + 1; account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 6 -> account_currency_setting_response_message_record.prm_account[account_currency_setting_response_message_at] = wire[at]; at = at + 1; account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 3 -> account_currency_setting_response_message_record.currency[account_currency_setting_response_message_at] = wire[at]; at = at + 1; account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  account_currency_setting_response_message_record.reject_all_flag = wire[at]; at = at + 1;
  account_currency_setting_response_message_record.blow_through_protection = wire[at]; at = at + 1;
  skip
}

/* what was read of Account Currency Setting Response Message is what was written, byte for byte */
inline equal_account_currency_setting_response_message(account_currency_setting_response_message_read, account_currency_setting_response_message_written) {
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 4 -> assert(account_currency_setting_response_message_read.user_ref_num[account_currency_setting_response_message_at] == account_currency_setting_response_message_written.user_ref_num[account_currency_setting_response_message_at]); account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 6 -> assert(account_currency_setting_response_message_read.prm_account[account_currency_setting_response_message_at] == account_currency_setting_response_message_written.prm_account[account_currency_setting_response_message_at]); account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  account_currency_setting_response_message_at = 0;
  do
  :: account_currency_setting_response_message_at < 3 -> assert(account_currency_setting_response_message_read.currency[account_currency_setting_response_message_at] == account_currency_setting_response_message_written.currency[account_currency_setting_response_message_at]); account_currency_setting_response_message_at = account_currency_setting_response_message_at + 1
  :: else -> break
  od;
  assert(account_currency_setting_response_message_read.reject_all_flag == account_currency_setting_response_message_written.reject_all_flag);
  assert(account_currency_setting_response_message_read.blow_through_protection == account_currency_setting_response_message_written.blow_through_protection);
  skip
}

/* ---- Reject Message: 5 bytes ------------------------------------------------- */

/* Indicates that an inbound message has been rejected */
typedef RejectMessage {
  byte user_ref_num[4];
  byte reason
};

int reject_message_at;

/* every byte of Reject Message set to one value */
inline fill_reject_message(reject_message_record, reject_message_value) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.user_ref_num[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.reason = reject_message_value;
  skip
}

/* each byte of Reject Message set to where it lies, so a field read out of place says so */
inline ramp_reject_message(reject_message_record, reject_message_base) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.user_ref_num[reject_message_at] = (reject_message_base + 0 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.reason = (reject_message_base + 4 + 1) % 256;
  skip
}

/* Reject Message to the wire, 5 bytes from where the cursor stands */
inline encode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> wire[at] = reject_message_record.user_ref_num[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  wire[at] = reject_message_record.reason; at = at + 1;
  skip
}

/* Reject Message off the wire, 5 bytes from where the cursor stands */
inline decode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.user_ref_num[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Reject Message is what was written, byte for byte */
inline equal_reject_message(reject_message_read, reject_message_written) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> assert(reject_message_read.user_ref_num[reject_message_at] == reject_message_written.user_ref_num[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  assert(reject_message_read.reason == reject_message_written.reason);
  skip
}

/* ---- Api Port Rate Breach Message: 8 bytes ----------------------------------- */

/* Indicates that the port's rate limit has been breached */
typedef ApiPortRateBreachMessage {
  byte timestamp[8]
};

int api_port_rate_breach_message_at;

/* every byte of Api Port Rate Breach Message set to one value */
inline fill_api_port_rate_breach_message(api_port_rate_breach_message_record, api_port_rate_breach_message_value) {
  api_port_rate_breach_message_at = 0;
  do
  :: api_port_rate_breach_message_at < 8 -> api_port_rate_breach_message_record.timestamp[api_port_rate_breach_message_at] = api_port_rate_breach_message_value; api_port_rate_breach_message_at = api_port_rate_breach_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Api Port Rate Breach Message set to where it lies, so a field read out of place says so */
inline ramp_api_port_rate_breach_message(api_port_rate_breach_message_record, api_port_rate_breach_message_base) {
  api_port_rate_breach_message_at = 0;
  do
  :: api_port_rate_breach_message_at < 8 -> api_port_rate_breach_message_record.timestamp[api_port_rate_breach_message_at] = (api_port_rate_breach_message_base + 0 + api_port_rate_breach_message_at + 1) % 256; api_port_rate_breach_message_at = api_port_rate_breach_message_at + 1
  :: else -> break
  od;
  skip
}

/* Api Port Rate Breach Message to the wire, 8 bytes from where the cursor stands */
inline encode_api_port_rate_breach_message(api_port_rate_breach_message_record) {
  api_port_rate_breach_message_at = 0;
  do
  :: api_port_rate_breach_message_at < 8 -> wire[at] = api_port_rate_breach_message_record.timestamp[api_port_rate_breach_message_at]; at = at + 1; api_port_rate_breach_message_at = api_port_rate_breach_message_at + 1
  :: else -> break
  od;
  skip
}

/* Api Port Rate Breach Message off the wire, 8 bytes from where the cursor stands */
inline decode_api_port_rate_breach_message(api_port_rate_breach_message_record) {
  api_port_rate_breach_message_at = 0;
  do
  :: api_port_rate_breach_message_at < 8 -> api_port_rate_breach_message_record.timestamp[api_port_rate_breach_message_at] = wire[at]; at = at + 1; api_port_rate_breach_message_at = api_port_rate_breach_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Api Port Rate Breach Message is what was written, byte for byte */
inline equal_api_port_rate_breach_message(api_port_rate_breach_message_read, api_port_rate_breach_message_written) {
  api_port_rate_breach_message_at = 0;
  do
  :: api_port_rate_breach_message_at < 8 -> assert(api_port_rate_breach_message_read.timestamp[api_port_rate_breach_message_at] == api_port_rate_breach_message_written.timestamp[api_port_rate_breach_message_at]); api_port_rate_breach_message_at = api_port_rate_breach_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Account Rate Breach Message: 15 bytes ----------------------------------- */

/* Indicates that a PRM Account's rate limit has been breached */
typedef AccountRateBreachMessage {
  byte timestamp[8];
  byte state;
  byte prm_account[6]
};

int account_rate_breach_message_at;

/* every byte of Account Rate Breach Message set to one value */
inline fill_account_rate_breach_message(account_rate_breach_message_record, account_rate_breach_message_value) {
  account_rate_breach_message_at = 0;
  do
  :: account_rate_breach_message_at < 8 -> account_rate_breach_message_record.timestamp[account_rate_breach_message_at] = account_rate_breach_message_value; account_rate_breach_message_at = account_rate_breach_message_at + 1
  :: else -> break
  od;
  account_rate_breach_message_record.state = account_rate_breach_message_value;
  account_rate_breach_message_at = 0;
  do
  :: account_rate_breach_message_at < 6 -> account_rate_breach_message_record.prm_account[account_rate_breach_message_at] = account_rate_breach_message_value; account_rate_breach_message_at = account_rate_breach_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Account Rate Breach Message set to where it lies, so a field read out of place says so */
inline ramp_account_rate_breach_message(account_rate_breach_message_record, account_rate_breach_message_base) {
  account_rate_breach_message_at = 0;
  do
  :: account_rate_breach_message_at < 8 -> account_rate_breach_message_record.timestamp[account_rate_breach_message_at] = (account_rate_breach_message_base + 0 + account_rate_breach_message_at + 1) % 256; account_rate_breach_message_at = account_rate_breach_message_at + 1
  :: else -> break
  od;
  account_rate_breach_message_record.state = (account_rate_breach_message_base + 8 + 1) % 256;
  account_rate_breach_message_at = 0;
  do
  :: account_rate_breach_message_at < 6 -> account_rate_breach_message_record.prm_account[account_rate_breach_message_at] = (account_rate_breach_message_base + 9 + account_rate_breach_message_at + 1) % 256; account_rate_breach_message_at = account_rate_breach_message_at + 1
  :: else -> break
  od;
  skip
}

/* Account Rate Breach Message to the wire, 15 bytes from where the cursor stands */
inline encode_account_rate_breach_message(account_rate_breach_message_record) {
  account_rate_breach_message_at = 0;
  do
  :: account_rate_breach_message_at < 8 -> wire[at] = account_rate_breach_message_record.timestamp[account_rate_breach_message_at]; at = at + 1; account_rate_breach_message_at = account_rate_breach_message_at + 1
  :: else -> break
  od;
  wire[at] = account_rate_breach_message_record.state; at = at + 1;
  account_rate_breach_message_at = 0;
  do
  :: account_rate_breach_message_at < 6 -> wire[at] = account_rate_breach_message_record.prm_account[account_rate_breach_message_at]; at = at + 1; account_rate_breach_message_at = account_rate_breach_message_at + 1
  :: else -> break
  od;
  skip
}

/* Account Rate Breach Message off the wire, 15 bytes from where the cursor stands */
inline decode_account_rate_breach_message(account_rate_breach_message_record) {
  account_rate_breach_message_at = 0;
  do
  :: account_rate_breach_message_at < 8 -> account_rate_breach_message_record.timestamp[account_rate_breach_message_at] = wire[at]; at = at + 1; account_rate_breach_message_at = account_rate_breach_message_at + 1
  :: else -> break
  od;
  account_rate_breach_message_record.state = wire[at]; at = at + 1;
  account_rate_breach_message_at = 0;
  do
  :: account_rate_breach_message_at < 6 -> account_rate_breach_message_record.prm_account[account_rate_breach_message_at] = wire[at]; at = at + 1; account_rate_breach_message_at = account_rate_breach_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Account Rate Breach Message is what was written, byte for byte */
inline equal_account_rate_breach_message(account_rate_breach_message_read, account_rate_breach_message_written) {
  account_rate_breach_message_at = 0;
  do
  :: account_rate_breach_message_at < 8 -> assert(account_rate_breach_message_read.timestamp[account_rate_breach_message_at] == account_rate_breach_message_written.timestamp[account_rate_breach_message_at]); account_rate_breach_message_at = account_rate_breach_message_at + 1
  :: else -> break
  od;
  assert(account_rate_breach_message_read.state == account_rate_breach_message_written.state);
  account_rate_breach_message_at = 0;
  do
  :: account_rate_breach_message_at < 6 -> assert(account_rate_breach_message_read.prm_account[account_rate_breach_message_at] == account_rate_breach_message_written.prm_account[account_rate_breach_message_at]); account_rate_breach_message_at = account_rate_breach_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Accumulated Values Message: 73 bytes ------------------------------------ */

/* Indicates the current Accumulated Values for a PRM Account and Currency, sent after order or trade updates */
typedef AccumulatedValuesMessage {
  byte prm_account[6];
  byte currency[3];
  byte last_update_time[8];
  byte risk_total_value[8];
  byte trades_buy_value[8];
  byte trades_sell_value[8];
  byte trades_total_value[8];
  byte orders_buy_value[8];
  byte orders_sell_value[8];
  byte orders_total_value[8]
};

int accumulated_values_message_at;

/* every byte of Accumulated Values Message set to one value */
inline fill_accumulated_values_message(accumulated_values_message_record, accumulated_values_message_value) {
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 6 -> accumulated_values_message_record.prm_account[accumulated_values_message_at] = accumulated_values_message_value; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 3 -> accumulated_values_message_record.currency[accumulated_values_message_at] = accumulated_values_message_value; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.last_update_time[accumulated_values_message_at] = accumulated_values_message_value; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.risk_total_value[accumulated_values_message_at] = accumulated_values_message_value; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.trades_buy_value[accumulated_values_message_at] = accumulated_values_message_value; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.trades_sell_value[accumulated_values_message_at] = accumulated_values_message_value; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.trades_total_value[accumulated_values_message_at] = accumulated_values_message_value; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.orders_buy_value[accumulated_values_message_at] = accumulated_values_message_value; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.orders_sell_value[accumulated_values_message_at] = accumulated_values_message_value; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.orders_total_value[accumulated_values_message_at] = accumulated_values_message_value; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Accumulated Values Message set to where it lies, so a field read out of place says so */
inline ramp_accumulated_values_message(accumulated_values_message_record, accumulated_values_message_base) {
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 6 -> accumulated_values_message_record.prm_account[accumulated_values_message_at] = (accumulated_values_message_base + 0 + accumulated_values_message_at + 1) % 256; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 3 -> accumulated_values_message_record.currency[accumulated_values_message_at] = (accumulated_values_message_base + 6 + accumulated_values_message_at + 1) % 256; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.last_update_time[accumulated_values_message_at] = (accumulated_values_message_base + 9 + accumulated_values_message_at + 1) % 256; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.risk_total_value[accumulated_values_message_at] = (accumulated_values_message_base + 17 + accumulated_values_message_at + 1) % 256; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.trades_buy_value[accumulated_values_message_at] = (accumulated_values_message_base + 25 + accumulated_values_message_at + 1) % 256; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.trades_sell_value[accumulated_values_message_at] = (accumulated_values_message_base + 33 + accumulated_values_message_at + 1) % 256; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.trades_total_value[accumulated_values_message_at] = (accumulated_values_message_base + 41 + accumulated_values_message_at + 1) % 256; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.orders_buy_value[accumulated_values_message_at] = (accumulated_values_message_base + 49 + accumulated_values_message_at + 1) % 256; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.orders_sell_value[accumulated_values_message_at] = (accumulated_values_message_base + 57 + accumulated_values_message_at + 1) % 256; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.orders_total_value[accumulated_values_message_at] = (accumulated_values_message_base + 65 + accumulated_values_message_at + 1) % 256; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  skip
}

/* Accumulated Values Message to the wire, 73 bytes from where the cursor stands */
inline encode_accumulated_values_message(accumulated_values_message_record) {
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 6 -> wire[at] = accumulated_values_message_record.prm_account[accumulated_values_message_at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 3 -> wire[at] = accumulated_values_message_record.currency[accumulated_values_message_at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> wire[at] = accumulated_values_message_record.last_update_time[accumulated_values_message_at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> wire[at] = accumulated_values_message_record.risk_total_value[accumulated_values_message_at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> wire[at] = accumulated_values_message_record.trades_buy_value[accumulated_values_message_at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> wire[at] = accumulated_values_message_record.trades_sell_value[accumulated_values_message_at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> wire[at] = accumulated_values_message_record.trades_total_value[accumulated_values_message_at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> wire[at] = accumulated_values_message_record.orders_buy_value[accumulated_values_message_at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> wire[at] = accumulated_values_message_record.orders_sell_value[accumulated_values_message_at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> wire[at] = accumulated_values_message_record.orders_total_value[accumulated_values_message_at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  skip
}

/* Accumulated Values Message off the wire, 73 bytes from where the cursor stands */
inline decode_accumulated_values_message(accumulated_values_message_record) {
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 6 -> accumulated_values_message_record.prm_account[accumulated_values_message_at] = wire[at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 3 -> accumulated_values_message_record.currency[accumulated_values_message_at] = wire[at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.last_update_time[accumulated_values_message_at] = wire[at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.risk_total_value[accumulated_values_message_at] = wire[at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.trades_buy_value[accumulated_values_message_at] = wire[at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.trades_sell_value[accumulated_values_message_at] = wire[at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.trades_total_value[accumulated_values_message_at] = wire[at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.orders_buy_value[accumulated_values_message_at] = wire[at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.orders_sell_value[accumulated_values_message_at] = wire[at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> accumulated_values_message_record.orders_total_value[accumulated_values_message_at] = wire[at]; at = at + 1; accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Accumulated Values Message is what was written, byte for byte */
inline equal_accumulated_values_message(accumulated_values_message_read, accumulated_values_message_written) {
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 6 -> assert(accumulated_values_message_read.prm_account[accumulated_values_message_at] == accumulated_values_message_written.prm_account[accumulated_values_message_at]); accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 3 -> assert(accumulated_values_message_read.currency[accumulated_values_message_at] == accumulated_values_message_written.currency[accumulated_values_message_at]); accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> assert(accumulated_values_message_read.last_update_time[accumulated_values_message_at] == accumulated_values_message_written.last_update_time[accumulated_values_message_at]); accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> assert(accumulated_values_message_read.risk_total_value[accumulated_values_message_at] == accumulated_values_message_written.risk_total_value[accumulated_values_message_at]); accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> assert(accumulated_values_message_read.trades_buy_value[accumulated_values_message_at] == accumulated_values_message_written.trades_buy_value[accumulated_values_message_at]); accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> assert(accumulated_values_message_read.trades_sell_value[accumulated_values_message_at] == accumulated_values_message_written.trades_sell_value[accumulated_values_message_at]); accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> assert(accumulated_values_message_read.trades_total_value[accumulated_values_message_at] == accumulated_values_message_written.trades_total_value[accumulated_values_message_at]); accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> assert(accumulated_values_message_read.orders_buy_value[accumulated_values_message_at] == accumulated_values_message_written.orders_buy_value[accumulated_values_message_at]); accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> assert(accumulated_values_message_read.orders_sell_value[accumulated_values_message_at] == accumulated_values_message_written.orders_sell_value[accumulated_values_message_at]); accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
  accumulated_values_message_at = 0;
  do
  :: accumulated_values_message_at < 8 -> assert(accumulated_values_message_read.orders_total_value[accumulated_values_message_at] == accumulated_values_message_written.orders_total_value[accumulated_values_message_at]); accumulated_values_message_at = accumulated_values_message_at + 1
  :: else -> break
  od;
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
    assert(at == 4);
    at = 0;
    decode_account_query_response_message(account_query_response_message_got);
    assert(at == 4);
    equal_account_query_response_message(account_query_response_message_got, account_query_response_message_sent)
  }
}

/* Account Settings Response Message: encoded, read back, and compared */
proctype check_account_settings_response_message() {
  AccountSettingsResponseMessage account_settings_response_message_sent;
  AccountSettingsResponseMessage account_settings_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_account_settings_response_message(account_settings_response_message_sent, 0)
  :: pattern == 1 -> fill_account_settings_response_message(account_settings_response_message_sent, 32)
  :: pattern == 2 -> fill_account_settings_response_message(account_settings_response_message_sent, 255)
  :: else -> ramp_account_settings_response_message(account_settings_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_account_settings_response_message(account_settings_response_message_sent);
    assert(at == 19);
    at = 0;
    decode_account_settings_response_message(account_settings_response_message_got);
    assert(at == 19);
    equal_account_settings_response_message(account_settings_response_message_got, account_settings_response_message_sent)
  }
}

/* Order Book Restriction Response Message: encoded, read back, and compared */
proctype check_order_book_restriction_response_message() {
  OrderBookRestrictionResponseMessage order_book_restriction_response_message_sent;
  OrderBookRestrictionResponseMessage order_book_restriction_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_restriction_response_message(order_book_restriction_response_message_sent, 0)
  :: pattern == 1 -> fill_order_book_restriction_response_message(order_book_restriction_response_message_sent, 32)
  :: pattern == 2 -> fill_order_book_restriction_response_message(order_book_restriction_response_message_sent, 255)
  :: else -> ramp_order_book_restriction_response_message(order_book_restriction_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_restriction_response_message(order_book_restriction_response_message_sent);
    assert(at == 23);
    at = 0;
    decode_order_book_restriction_response_message(order_book_restriction_response_message_got);
    assert(at == 23);
    equal_order_book_restriction_response_message(order_book_restriction_response_message_got, order_book_restriction_response_message_sent)
  }
}

/* Market Segment Restriction Response Message: encoded, read back, and compared */
proctype check_market_segment_restriction_response_message() {
  MarketSegmentRestrictionResponseMessage market_segment_restriction_response_message_sent;
  MarketSegmentRestrictionResponseMessage market_segment_restriction_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_segment_restriction_response_message(market_segment_restriction_response_message_sent, 0)
  :: pattern == 1 -> fill_market_segment_restriction_response_message(market_segment_restriction_response_message_sent, 32)
  :: pattern == 2 -> fill_market_segment_restriction_response_message(market_segment_restriction_response_message_sent, 255)
  :: else -> ramp_market_segment_restriction_response_message(market_segment_restriction_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_segment_restriction_response_message(market_segment_restriction_response_message_sent);
    assert(at == 21);
    at = 0;
    decode_market_segment_restriction_response_message(market_segment_restriction_response_message_got);
    assert(at == 21);
    equal_market_segment_restriction_response_message(market_segment_restriction_response_message_got, market_segment_restriction_response_message_sent)
  }
}

/* Limit Settings Response Message: encoded, read back, and compared */
proctype check_limit_settings_response_message() {
  LimitSettingsResponseMessage limit_settings_response_message_sent;
  LimitSettingsResponseMessage limit_settings_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_limit_settings_response_message(limit_settings_response_message_sent, 0)
  :: pattern == 1 -> fill_limit_settings_response_message(limit_settings_response_message_sent, 32)
  :: pattern == 2 -> fill_limit_settings_response_message(limit_settings_response_message_sent, 255)
  :: else -> ramp_limit_settings_response_message(limit_settings_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_limit_settings_response_message(limit_settings_response_message_sent);
    assert(at == 109);
    at = 0;
    decode_limit_settings_response_message(limit_settings_response_message_got);
    assert(at == 109);
    equal_limit_settings_response_message(limit_settings_response_message_got, limit_settings_response_message_sent)
  }
}

/* Account Currency Setting Response Message: encoded, read back, and compared */
proctype check_account_currency_setting_response_message() {
  AccountCurrencySettingResponseMessage account_currency_setting_response_message_sent;
  AccountCurrencySettingResponseMessage account_currency_setting_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_account_currency_setting_response_message(account_currency_setting_response_message_sent, 0)
  :: pattern == 1 -> fill_account_currency_setting_response_message(account_currency_setting_response_message_sent, 32)
  :: pattern == 2 -> fill_account_currency_setting_response_message(account_currency_setting_response_message_sent, 255)
  :: else -> ramp_account_currency_setting_response_message(account_currency_setting_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_account_currency_setting_response_message(account_currency_setting_response_message_sent);
    assert(at == 15);
    at = 0;
    decode_account_currency_setting_response_message(account_currency_setting_response_message_got);
    assert(at == 15);
    equal_account_currency_setting_response_message(account_currency_setting_response_message_got, account_currency_setting_response_message_sent)
  }
}

/* Reject Message: encoded, read back, and compared */
proctype check_reject_message() {
  RejectMessage reject_message_sent;
  RejectMessage reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reject_message(reject_message_sent, 0)
  :: pattern == 1 -> fill_reject_message(reject_message_sent, 32)
  :: pattern == 2 -> fill_reject_message(reject_message_sent, 255)
  :: else -> ramp_reject_message(reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reject_message(reject_message_sent);
    assert(at == 5);
    at = 0;
    decode_reject_message(reject_message_got);
    assert(at == 5);
    equal_reject_message(reject_message_got, reject_message_sent)
  }
}

/* Api Port Rate Breach Message: encoded, read back, and compared */
proctype check_api_port_rate_breach_message() {
  ApiPortRateBreachMessage api_port_rate_breach_message_sent;
  ApiPortRateBreachMessage api_port_rate_breach_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_api_port_rate_breach_message(api_port_rate_breach_message_sent, 0)
  :: pattern == 1 -> fill_api_port_rate_breach_message(api_port_rate_breach_message_sent, 32)
  :: pattern == 2 -> fill_api_port_rate_breach_message(api_port_rate_breach_message_sent, 255)
  :: else -> ramp_api_port_rate_breach_message(api_port_rate_breach_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_api_port_rate_breach_message(api_port_rate_breach_message_sent);
    assert(at == 8);
    at = 0;
    decode_api_port_rate_breach_message(api_port_rate_breach_message_got);
    assert(at == 8);
    equal_api_port_rate_breach_message(api_port_rate_breach_message_got, api_port_rate_breach_message_sent)
  }
}

/* Account Rate Breach Message: encoded, read back, and compared */
proctype check_account_rate_breach_message() {
  AccountRateBreachMessage account_rate_breach_message_sent;
  AccountRateBreachMessage account_rate_breach_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_account_rate_breach_message(account_rate_breach_message_sent, 0)
  :: pattern == 1 -> fill_account_rate_breach_message(account_rate_breach_message_sent, 32)
  :: pattern == 2 -> fill_account_rate_breach_message(account_rate_breach_message_sent, 255)
  :: else -> ramp_account_rate_breach_message(account_rate_breach_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_account_rate_breach_message(account_rate_breach_message_sent);
    assert(at == 15);
    at = 0;
    decode_account_rate_breach_message(account_rate_breach_message_got);
    assert(at == 15);
    equal_account_rate_breach_message(account_rate_breach_message_got, account_rate_breach_message_sent)
  }
}

/* Accumulated Values Message: encoded, read back, and compared */
proctype check_accumulated_values_message() {
  AccumulatedValuesMessage accumulated_values_message_sent;
  AccumulatedValuesMessage accumulated_values_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_accumulated_values_message(accumulated_values_message_sent, 0)
  :: pattern == 1 -> fill_accumulated_values_message(accumulated_values_message_sent, 32)
  :: pattern == 2 -> fill_accumulated_values_message(accumulated_values_message_sent, 255)
  :: else -> ramp_accumulated_values_message(accumulated_values_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_accumulated_values_message(accumulated_values_message_sent);
    assert(at == 73);
    at = 0;
    decode_accumulated_values_message(accumulated_values_message_got);
    assert(at == 73);
    equal_accumulated_values_message(accumulated_values_message_got, accumulated_values_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_account_query_response_message()
  :: run check_account_settings_response_message()
  :: run check_order_book_restriction_response_message()
  :: run check_market_segment_restriction_response_message()
  :: run check_limit_settings_response_message()
  :: run check_account_currency_setting_response_message()
  :: run check_reject_message()
  :: run check_api_port_rate_breach_message()
  :: run check_account_rate_breach_message()
  :: run check_accumulated_values_message()
  fi
}
