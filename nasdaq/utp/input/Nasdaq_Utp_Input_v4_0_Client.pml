/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) 
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
 *   - the dispatch that chooses a message by its type
 *   - a run counted by a field
 *   - a field of no fixed width
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 107

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Client Tcp Packet Header: 3 bytes --------------------------------------- */

/* Packet header of a packet sent by the client */
typedef ClientTcpPacketHeader {
  byte packet_length[2];
  byte client_packet_type
};

int client_tcp_packet_header_at;

/* every byte of Client Tcp Packet Header set to one value */
inline fill_client_tcp_packet_header(client_tcp_packet_header_record, client_tcp_packet_header_value) {
  client_tcp_packet_header_at = 0;
  do
  :: client_tcp_packet_header_at < 2 -> client_tcp_packet_header_record.packet_length[client_tcp_packet_header_at] = client_tcp_packet_header_value; client_tcp_packet_header_at = client_tcp_packet_header_at + 1
  :: else -> break
  od;
  client_tcp_packet_header_record.client_packet_type = client_tcp_packet_header_value;
  skip
}

/* each byte of Client Tcp Packet Header set to where it lies, so a field read out of place says so */
inline ramp_client_tcp_packet_header(client_tcp_packet_header_record, client_tcp_packet_header_base) {
  client_tcp_packet_header_at = 0;
  do
  :: client_tcp_packet_header_at < 2 -> client_tcp_packet_header_record.packet_length[client_tcp_packet_header_at] = (client_tcp_packet_header_base + 0 + client_tcp_packet_header_at + 1) % 256; client_tcp_packet_header_at = client_tcp_packet_header_at + 1
  :: else -> break
  od;
  client_tcp_packet_header_record.client_packet_type = (client_tcp_packet_header_base + 2 + 1) % 256;
  skip
}

/* Client Tcp Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_client_tcp_packet_header(client_tcp_packet_header_record) {
  client_tcp_packet_header_at = 0;
  do
  :: client_tcp_packet_header_at < 2 -> wire[at] = client_tcp_packet_header_record.packet_length[client_tcp_packet_header_at]; at = at + 1; client_tcp_packet_header_at = client_tcp_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = client_tcp_packet_header_record.client_packet_type; at = at + 1;
  skip
}

/* Client Tcp Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_client_tcp_packet_header(client_tcp_packet_header_record) {
  client_tcp_packet_header_at = 0;
  do
  :: client_tcp_packet_header_at < 2 -> client_tcp_packet_header_record.packet_length[client_tcp_packet_header_at] = wire[at]; at = at + 1; client_tcp_packet_header_at = client_tcp_packet_header_at + 1
  :: else -> break
  od;
  client_tcp_packet_header_record.client_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Client Tcp Packet Header is what was written, byte for byte */
inline equal_client_tcp_packet_header(client_tcp_packet_header_read, client_tcp_packet_header_written) {
  client_tcp_packet_header_at = 0;
  do
  :: client_tcp_packet_header_at < 2 -> assert(client_tcp_packet_header_read.packet_length[client_tcp_packet_header_at] == client_tcp_packet_header_written.packet_length[client_tcp_packet_header_at]); client_tcp_packet_header_at = client_tcp_packet_header_at + 1
  :: else -> break
  od;
  assert(client_tcp_packet_header_read.client_packet_type == client_tcp_packet_header_written.client_packet_type);
  skip
}

/* ---- Message Header: 2 bytes ------------------------------------------------- */

/* UTP Participant Input message header — fixed Version + Message Category prefix common to inbound and return messages */
typedef MessageHeader {
  byte version;
  byte message_category
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.version = message_header_value;
  message_header_record.message_category = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.version = (message_header_base + 0 + 1) % 256;
  message_header_record.message_category = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.version; at = at + 1;
  wire[at] = message_header_record.message_category; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.version = wire[at]; at = at + 1;
  message_header_record.message_category = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.version == message_header_written.version);
  assert(message_header_read.message_category == message_header_written.message_category);
  skip
}

/* ---- Protected Exchange Quote Message Short Form Message: 41 bytes ----------- */

/* Short-format Exchange Quotation Message (QQ). Transmits Bid and Ask price and size from an Exchange to the SIP. */
typedef ProtectedExchangeQuoteMessageShortFormMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte symbol_short[5];
  byte bid_short[2];
  byte bid_size_short[2];
  byte ask_short[2];
  byte ask_size_short[2];
  byte cond;
  byte rii
};

int protected_exchange_quote_message_short_form_message_at;

/* every byte of Protected Exchange Quote Message Short Form Message set to one value */
inline fill_protected_exchange_quote_message_short_form_message(protected_exchange_quote_message_short_form_message_record, protected_exchange_quote_message_short_form_message_value) {
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.orig[protected_exchange_quote_message_short_form_message_at] = protected_exchange_quote_message_short_form_message_value; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> protected_exchange_quote_message_short_form_message_record.timestamp_1[protected_exchange_quote_message_short_form_message_at] = protected_exchange_quote_message_short_form_message_value; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> protected_exchange_quote_message_short_form_message_record.feed_sequence[protected_exchange_quote_message_short_form_message_at] = protected_exchange_quote_message_short_form_message_value; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> protected_exchange_quote_message_short_form_message_record.part_token[protected_exchange_quote_message_short_form_message_at] = protected_exchange_quote_message_short_form_message_value; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 5 -> protected_exchange_quote_message_short_form_message_record.symbol_short[protected_exchange_quote_message_short_form_message_at] = protected_exchange_quote_message_short_form_message_value; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.bid_short[protected_exchange_quote_message_short_form_message_at] = protected_exchange_quote_message_short_form_message_value; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.bid_size_short[protected_exchange_quote_message_short_form_message_at] = protected_exchange_quote_message_short_form_message_value; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.ask_short[protected_exchange_quote_message_short_form_message_at] = protected_exchange_quote_message_short_form_message_value; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.ask_size_short[protected_exchange_quote_message_short_form_message_at] = protected_exchange_quote_message_short_form_message_value; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_record.cond = protected_exchange_quote_message_short_form_message_value;
  protected_exchange_quote_message_short_form_message_record.rii = protected_exchange_quote_message_short_form_message_value;
  skip
}

/* each byte of Protected Exchange Quote Message Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_protected_exchange_quote_message_short_form_message(protected_exchange_quote_message_short_form_message_record, protected_exchange_quote_message_short_form_message_base) {
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.orig[protected_exchange_quote_message_short_form_message_at] = (protected_exchange_quote_message_short_form_message_base + 0 + protected_exchange_quote_message_short_form_message_at + 1) % 256; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> protected_exchange_quote_message_short_form_message_record.timestamp_1[protected_exchange_quote_message_short_form_message_at] = (protected_exchange_quote_message_short_form_message_base + 2 + protected_exchange_quote_message_short_form_message_at + 1) % 256; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> protected_exchange_quote_message_short_form_message_record.feed_sequence[protected_exchange_quote_message_short_form_message_at] = (protected_exchange_quote_message_short_form_message_base + 10 + protected_exchange_quote_message_short_form_message_at + 1) % 256; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> protected_exchange_quote_message_short_form_message_record.part_token[protected_exchange_quote_message_short_form_message_at] = (protected_exchange_quote_message_short_form_message_base + 18 + protected_exchange_quote_message_short_form_message_at + 1) % 256; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 5 -> protected_exchange_quote_message_short_form_message_record.symbol_short[protected_exchange_quote_message_short_form_message_at] = (protected_exchange_quote_message_short_form_message_base + 26 + protected_exchange_quote_message_short_form_message_at + 1) % 256; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.bid_short[protected_exchange_quote_message_short_form_message_at] = (protected_exchange_quote_message_short_form_message_base + 31 + protected_exchange_quote_message_short_form_message_at + 1) % 256; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.bid_size_short[protected_exchange_quote_message_short_form_message_at] = (protected_exchange_quote_message_short_form_message_base + 33 + protected_exchange_quote_message_short_form_message_at + 1) % 256; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.ask_short[protected_exchange_quote_message_short_form_message_at] = (protected_exchange_quote_message_short_form_message_base + 35 + protected_exchange_quote_message_short_form_message_at + 1) % 256; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.ask_size_short[protected_exchange_quote_message_short_form_message_at] = (protected_exchange_quote_message_short_form_message_base + 37 + protected_exchange_quote_message_short_form_message_at + 1) % 256; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_record.cond = (protected_exchange_quote_message_short_form_message_base + 39 + 1) % 256;
  protected_exchange_quote_message_short_form_message_record.rii = (protected_exchange_quote_message_short_form_message_base + 40 + 1) % 256;
  skip
}

/* Protected Exchange Quote Message Short Form Message to the wire, 41 bytes from where the cursor stands */
inline encode_protected_exchange_quote_message_short_form_message(protected_exchange_quote_message_short_form_message_record) {
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> wire[at] = protected_exchange_quote_message_short_form_message_record.orig[protected_exchange_quote_message_short_form_message_at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> wire[at] = protected_exchange_quote_message_short_form_message_record.timestamp_1[protected_exchange_quote_message_short_form_message_at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> wire[at] = protected_exchange_quote_message_short_form_message_record.feed_sequence[protected_exchange_quote_message_short_form_message_at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> wire[at] = protected_exchange_quote_message_short_form_message_record.part_token[protected_exchange_quote_message_short_form_message_at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 5 -> wire[at] = protected_exchange_quote_message_short_form_message_record.symbol_short[protected_exchange_quote_message_short_form_message_at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> wire[at] = protected_exchange_quote_message_short_form_message_record.bid_short[protected_exchange_quote_message_short_form_message_at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> wire[at] = protected_exchange_quote_message_short_form_message_record.bid_size_short[protected_exchange_quote_message_short_form_message_at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> wire[at] = protected_exchange_quote_message_short_form_message_record.ask_short[protected_exchange_quote_message_short_form_message_at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> wire[at] = protected_exchange_quote_message_short_form_message_record.ask_size_short[protected_exchange_quote_message_short_form_message_at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = protected_exchange_quote_message_short_form_message_record.cond; at = at + 1;
  wire[at] = protected_exchange_quote_message_short_form_message_record.rii; at = at + 1;
  skip
}

/* Protected Exchange Quote Message Short Form Message off the wire, 41 bytes from where the cursor stands */
inline decode_protected_exchange_quote_message_short_form_message(protected_exchange_quote_message_short_form_message_record) {
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.orig[protected_exchange_quote_message_short_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> protected_exchange_quote_message_short_form_message_record.timestamp_1[protected_exchange_quote_message_short_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> protected_exchange_quote_message_short_form_message_record.feed_sequence[protected_exchange_quote_message_short_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> protected_exchange_quote_message_short_form_message_record.part_token[protected_exchange_quote_message_short_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 5 -> protected_exchange_quote_message_short_form_message_record.symbol_short[protected_exchange_quote_message_short_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.bid_short[protected_exchange_quote_message_short_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.bid_size_short[protected_exchange_quote_message_short_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.ask_short[protected_exchange_quote_message_short_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> protected_exchange_quote_message_short_form_message_record.ask_size_short[protected_exchange_quote_message_short_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_record.cond = wire[at]; at = at + 1;
  protected_exchange_quote_message_short_form_message_record.rii = wire[at]; at = at + 1;
  skip
}

/* what was read of Protected Exchange Quote Message Short Form Message is what was written, byte for byte */
inline equal_protected_exchange_quote_message_short_form_message(protected_exchange_quote_message_short_form_message_read, protected_exchange_quote_message_short_form_message_written) {
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> assert(protected_exchange_quote_message_short_form_message_read.orig[protected_exchange_quote_message_short_form_message_at] == protected_exchange_quote_message_short_form_message_written.orig[protected_exchange_quote_message_short_form_message_at]); protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> assert(protected_exchange_quote_message_short_form_message_read.timestamp_1[protected_exchange_quote_message_short_form_message_at] == protected_exchange_quote_message_short_form_message_written.timestamp_1[protected_exchange_quote_message_short_form_message_at]); protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> assert(protected_exchange_quote_message_short_form_message_read.feed_sequence[protected_exchange_quote_message_short_form_message_at] == protected_exchange_quote_message_short_form_message_written.feed_sequence[protected_exchange_quote_message_short_form_message_at]); protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 8 -> assert(protected_exchange_quote_message_short_form_message_read.part_token[protected_exchange_quote_message_short_form_message_at] == protected_exchange_quote_message_short_form_message_written.part_token[protected_exchange_quote_message_short_form_message_at]); protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 5 -> assert(protected_exchange_quote_message_short_form_message_read.symbol_short[protected_exchange_quote_message_short_form_message_at] == protected_exchange_quote_message_short_form_message_written.symbol_short[protected_exchange_quote_message_short_form_message_at]); protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> assert(protected_exchange_quote_message_short_form_message_read.bid_short[protected_exchange_quote_message_short_form_message_at] == protected_exchange_quote_message_short_form_message_written.bid_short[protected_exchange_quote_message_short_form_message_at]); protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> assert(protected_exchange_quote_message_short_form_message_read.bid_size_short[protected_exchange_quote_message_short_form_message_at] == protected_exchange_quote_message_short_form_message_written.bid_size_short[protected_exchange_quote_message_short_form_message_at]); protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> assert(protected_exchange_quote_message_short_form_message_read.ask_short[protected_exchange_quote_message_short_form_message_at] == protected_exchange_quote_message_short_form_message_written.ask_short[protected_exchange_quote_message_short_form_message_at]); protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_short_form_message_at = 0;
  do
  :: protected_exchange_quote_message_short_form_message_at < 2 -> assert(protected_exchange_quote_message_short_form_message_read.ask_size_short[protected_exchange_quote_message_short_form_message_at] == protected_exchange_quote_message_short_form_message_written.ask_size_short[protected_exchange_quote_message_short_form_message_at]); protected_exchange_quote_message_short_form_message_at = protected_exchange_quote_message_short_form_message_at + 1
  :: else -> break
  od;
  assert(protected_exchange_quote_message_short_form_message_read.cond == protected_exchange_quote_message_short_form_message_written.cond);
  assert(protected_exchange_quote_message_short_form_message_read.rii == protected_exchange_quote_message_short_form_message_written.rii);
  skip
}

/* ---- Protected Exchange Quote Message Long Form Message: 63 bytes ------------ */

/* Long-format Exchange Quotation Message (QL). */
typedef ProtectedExchangeQuoteMessageLongFormMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte symbol_long[11];
  byte bid_long[8];
  byte bid_size_long[4];
  byte ask_long[8];
  byte ask_size_long[4];
  byte cond;
  byte rii
};

int protected_exchange_quote_message_long_form_message_at;

/* every byte of Protected Exchange Quote Message Long Form Message set to one value */
inline fill_protected_exchange_quote_message_long_form_message(protected_exchange_quote_message_long_form_message_record, protected_exchange_quote_message_long_form_message_value) {
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 2 -> protected_exchange_quote_message_long_form_message_record.orig[protected_exchange_quote_message_long_form_message_at] = protected_exchange_quote_message_long_form_message_value; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.timestamp_1[protected_exchange_quote_message_long_form_message_at] = protected_exchange_quote_message_long_form_message_value; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.feed_sequence[protected_exchange_quote_message_long_form_message_at] = protected_exchange_quote_message_long_form_message_value; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.part_token[protected_exchange_quote_message_long_form_message_at] = protected_exchange_quote_message_long_form_message_value; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 11 -> protected_exchange_quote_message_long_form_message_record.symbol_long[protected_exchange_quote_message_long_form_message_at] = protected_exchange_quote_message_long_form_message_value; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.bid_long[protected_exchange_quote_message_long_form_message_at] = protected_exchange_quote_message_long_form_message_value; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 4 -> protected_exchange_quote_message_long_form_message_record.bid_size_long[protected_exchange_quote_message_long_form_message_at] = protected_exchange_quote_message_long_form_message_value; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.ask_long[protected_exchange_quote_message_long_form_message_at] = protected_exchange_quote_message_long_form_message_value; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 4 -> protected_exchange_quote_message_long_form_message_record.ask_size_long[protected_exchange_quote_message_long_form_message_at] = protected_exchange_quote_message_long_form_message_value; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_record.cond = protected_exchange_quote_message_long_form_message_value;
  protected_exchange_quote_message_long_form_message_record.rii = protected_exchange_quote_message_long_form_message_value;
  skip
}

/* each byte of Protected Exchange Quote Message Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_protected_exchange_quote_message_long_form_message(protected_exchange_quote_message_long_form_message_record, protected_exchange_quote_message_long_form_message_base) {
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 2 -> protected_exchange_quote_message_long_form_message_record.orig[protected_exchange_quote_message_long_form_message_at] = (protected_exchange_quote_message_long_form_message_base + 0 + protected_exchange_quote_message_long_form_message_at + 1) % 256; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.timestamp_1[protected_exchange_quote_message_long_form_message_at] = (protected_exchange_quote_message_long_form_message_base + 2 + protected_exchange_quote_message_long_form_message_at + 1) % 256; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.feed_sequence[protected_exchange_quote_message_long_form_message_at] = (protected_exchange_quote_message_long_form_message_base + 10 + protected_exchange_quote_message_long_form_message_at + 1) % 256; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.part_token[protected_exchange_quote_message_long_form_message_at] = (protected_exchange_quote_message_long_form_message_base + 18 + protected_exchange_quote_message_long_form_message_at + 1) % 256; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 11 -> protected_exchange_quote_message_long_form_message_record.symbol_long[protected_exchange_quote_message_long_form_message_at] = (protected_exchange_quote_message_long_form_message_base + 26 + protected_exchange_quote_message_long_form_message_at + 1) % 256; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.bid_long[protected_exchange_quote_message_long_form_message_at] = (protected_exchange_quote_message_long_form_message_base + 37 + protected_exchange_quote_message_long_form_message_at + 1) % 256; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 4 -> protected_exchange_quote_message_long_form_message_record.bid_size_long[protected_exchange_quote_message_long_form_message_at] = (protected_exchange_quote_message_long_form_message_base + 45 + protected_exchange_quote_message_long_form_message_at + 1) % 256; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.ask_long[protected_exchange_quote_message_long_form_message_at] = (protected_exchange_quote_message_long_form_message_base + 49 + protected_exchange_quote_message_long_form_message_at + 1) % 256; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 4 -> protected_exchange_quote_message_long_form_message_record.ask_size_long[protected_exchange_quote_message_long_form_message_at] = (protected_exchange_quote_message_long_form_message_base + 57 + protected_exchange_quote_message_long_form_message_at + 1) % 256; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_record.cond = (protected_exchange_quote_message_long_form_message_base + 61 + 1) % 256;
  protected_exchange_quote_message_long_form_message_record.rii = (protected_exchange_quote_message_long_form_message_base + 62 + 1) % 256;
  skip
}

/* Protected Exchange Quote Message Long Form Message to the wire, 63 bytes from where the cursor stands */
inline encode_protected_exchange_quote_message_long_form_message(protected_exchange_quote_message_long_form_message_record) {
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 2 -> wire[at] = protected_exchange_quote_message_long_form_message_record.orig[protected_exchange_quote_message_long_form_message_at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> wire[at] = protected_exchange_quote_message_long_form_message_record.timestamp_1[protected_exchange_quote_message_long_form_message_at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> wire[at] = protected_exchange_quote_message_long_form_message_record.feed_sequence[protected_exchange_quote_message_long_form_message_at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> wire[at] = protected_exchange_quote_message_long_form_message_record.part_token[protected_exchange_quote_message_long_form_message_at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 11 -> wire[at] = protected_exchange_quote_message_long_form_message_record.symbol_long[protected_exchange_quote_message_long_form_message_at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> wire[at] = protected_exchange_quote_message_long_form_message_record.bid_long[protected_exchange_quote_message_long_form_message_at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 4 -> wire[at] = protected_exchange_quote_message_long_form_message_record.bid_size_long[protected_exchange_quote_message_long_form_message_at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> wire[at] = protected_exchange_quote_message_long_form_message_record.ask_long[protected_exchange_quote_message_long_form_message_at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 4 -> wire[at] = protected_exchange_quote_message_long_form_message_record.ask_size_long[protected_exchange_quote_message_long_form_message_at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = protected_exchange_quote_message_long_form_message_record.cond; at = at + 1;
  wire[at] = protected_exchange_quote_message_long_form_message_record.rii; at = at + 1;
  skip
}

/* Protected Exchange Quote Message Long Form Message off the wire, 63 bytes from where the cursor stands */
inline decode_protected_exchange_quote_message_long_form_message(protected_exchange_quote_message_long_form_message_record) {
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 2 -> protected_exchange_quote_message_long_form_message_record.orig[protected_exchange_quote_message_long_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.timestamp_1[protected_exchange_quote_message_long_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.feed_sequence[protected_exchange_quote_message_long_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.part_token[protected_exchange_quote_message_long_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 11 -> protected_exchange_quote_message_long_form_message_record.symbol_long[protected_exchange_quote_message_long_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.bid_long[protected_exchange_quote_message_long_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 4 -> protected_exchange_quote_message_long_form_message_record.bid_size_long[protected_exchange_quote_message_long_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> protected_exchange_quote_message_long_form_message_record.ask_long[protected_exchange_quote_message_long_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 4 -> protected_exchange_quote_message_long_form_message_record.ask_size_long[protected_exchange_quote_message_long_form_message_at] = wire[at]; at = at + 1; protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_record.cond = wire[at]; at = at + 1;
  protected_exchange_quote_message_long_form_message_record.rii = wire[at]; at = at + 1;
  skip
}

/* what was read of Protected Exchange Quote Message Long Form Message is what was written, byte for byte */
inline equal_protected_exchange_quote_message_long_form_message(protected_exchange_quote_message_long_form_message_read, protected_exchange_quote_message_long_form_message_written) {
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 2 -> assert(protected_exchange_quote_message_long_form_message_read.orig[protected_exchange_quote_message_long_form_message_at] == protected_exchange_quote_message_long_form_message_written.orig[protected_exchange_quote_message_long_form_message_at]); protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> assert(protected_exchange_quote_message_long_form_message_read.timestamp_1[protected_exchange_quote_message_long_form_message_at] == protected_exchange_quote_message_long_form_message_written.timestamp_1[protected_exchange_quote_message_long_form_message_at]); protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> assert(protected_exchange_quote_message_long_form_message_read.feed_sequence[protected_exchange_quote_message_long_form_message_at] == protected_exchange_quote_message_long_form_message_written.feed_sequence[protected_exchange_quote_message_long_form_message_at]); protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> assert(protected_exchange_quote_message_long_form_message_read.part_token[protected_exchange_quote_message_long_form_message_at] == protected_exchange_quote_message_long_form_message_written.part_token[protected_exchange_quote_message_long_form_message_at]); protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 11 -> assert(protected_exchange_quote_message_long_form_message_read.symbol_long[protected_exchange_quote_message_long_form_message_at] == protected_exchange_quote_message_long_form_message_written.symbol_long[protected_exchange_quote_message_long_form_message_at]); protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> assert(protected_exchange_quote_message_long_form_message_read.bid_long[protected_exchange_quote_message_long_form_message_at] == protected_exchange_quote_message_long_form_message_written.bid_long[protected_exchange_quote_message_long_form_message_at]); protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 4 -> assert(protected_exchange_quote_message_long_form_message_read.bid_size_long[protected_exchange_quote_message_long_form_message_at] == protected_exchange_quote_message_long_form_message_written.bid_size_long[protected_exchange_quote_message_long_form_message_at]); protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 8 -> assert(protected_exchange_quote_message_long_form_message_read.ask_long[protected_exchange_quote_message_long_form_message_at] == protected_exchange_quote_message_long_form_message_written.ask_long[protected_exchange_quote_message_long_form_message_at]); protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  protected_exchange_quote_message_long_form_message_at = 0;
  do
  :: protected_exchange_quote_message_long_form_message_at < 4 -> assert(protected_exchange_quote_message_long_form_message_read.ask_size_long[protected_exchange_quote_message_long_form_message_at] == protected_exchange_quote_message_long_form_message_written.ask_size_long[protected_exchange_quote_message_long_form_message_at]); protected_exchange_quote_message_long_form_message_at = protected_exchange_quote_message_long_form_message_at + 1
  :: else -> break
  od;
  assert(protected_exchange_quote_message_long_form_message_read.cond == protected_exchange_quote_message_long_form_message_written.cond);
  assert(protected_exchange_quote_message_long_form_message_read.rii == protected_exchange_quote_message_long_form_message_written.rii);
  skip
}

/* ---- Finra Protected Quote Message With Bbo Info Message: 107 bytes ---------- */

/* FINRA BBO Quote Message w BBO Info (QG). */
typedef FinraProtectedQuoteMessageWithBboInfoMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte bid_long[8];
  byte bid_size_long[4];
  byte ask_long[8];
  byte ask_size_long[4];
  byte cond;
  byte mpid[4];
  byte bbo_bid[8];
  byte bbo_bid_size[4];
  byte bbo_bid_mpid[4];
  byte bbo_ask[8];
  byte bbo_ask_size[4];
  byte bbo_ask_mpid[4];
  byte bbo_cond
};

int finra_protected_quote_message_with_bbo_info_message_at;

/* every byte of Finra Protected Quote Message With Bbo Info Message set to one value */
inline fill_finra_protected_quote_message_with_bbo_info_message(finra_protected_quote_message_with_bbo_info_message_record, finra_protected_quote_message_with_bbo_info_message_value) {
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 2 -> finra_protected_quote_message_with_bbo_info_message_record.orig[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.timestamp_1[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.feed_sequence[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.part_token[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.timestamp_2[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 11 -> finra_protected_quote_message_with_bbo_info_message_record.symbol_long[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.bid_long[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bid_size_long[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.ask_long[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.ask_size_long[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_record.cond = finra_protected_quote_message_with_bbo_info_message_value;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.mpid[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_bid[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_bid_size[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_bid_mpid[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_ask[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_ask_size[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_ask_mpid[finra_protected_quote_message_with_bbo_info_message_at] = finra_protected_quote_message_with_bbo_info_message_value; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_record.bbo_cond = finra_protected_quote_message_with_bbo_info_message_value;
  skip
}

/* each byte of Finra Protected Quote Message With Bbo Info Message set to where it lies, so a field read out of place says so */
inline ramp_finra_protected_quote_message_with_bbo_info_message(finra_protected_quote_message_with_bbo_info_message_record, finra_protected_quote_message_with_bbo_info_message_base) {
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 2 -> finra_protected_quote_message_with_bbo_info_message_record.orig[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 0 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.timestamp_1[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 2 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.feed_sequence[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 10 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.part_token[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 18 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.timestamp_2[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 26 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 11 -> finra_protected_quote_message_with_bbo_info_message_record.symbol_long[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 34 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.bid_long[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 45 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bid_size_long[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 53 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.ask_long[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 57 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.ask_size_long[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 65 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_record.cond = (finra_protected_quote_message_with_bbo_info_message_base + 69 + 1) % 256;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.mpid[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 70 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_bid[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 74 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_bid_size[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 82 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_bid_mpid[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 86 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_ask[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 90 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_ask_size[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 98 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_ask_mpid[finra_protected_quote_message_with_bbo_info_message_at] = (finra_protected_quote_message_with_bbo_info_message_base + 102 + finra_protected_quote_message_with_bbo_info_message_at + 1) % 256; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_record.bbo_cond = (finra_protected_quote_message_with_bbo_info_message_base + 106 + 1) % 256;
  skip
}

/* Finra Protected Quote Message With Bbo Info Message to the wire, 107 bytes from where the cursor stands */
inline encode_finra_protected_quote_message_with_bbo_info_message(finra_protected_quote_message_with_bbo_info_message_record) {
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 2 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.orig[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.timestamp_1[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.feed_sequence[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.part_token[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.timestamp_2[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 11 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.symbol_long[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.bid_long[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.bid_size_long[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.ask_long[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.ask_size_long[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  wire[at] = finra_protected_quote_message_with_bbo_info_message_record.cond; at = at + 1;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.mpid[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.bbo_bid[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.bbo_bid_size[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.bbo_bid_mpid[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.bbo_ask[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.bbo_ask_size[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> wire[at] = finra_protected_quote_message_with_bbo_info_message_record.bbo_ask_mpid[finra_protected_quote_message_with_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  wire[at] = finra_protected_quote_message_with_bbo_info_message_record.bbo_cond; at = at + 1;
  skip
}

/* Finra Protected Quote Message With Bbo Info Message off the wire, 107 bytes from where the cursor stands */
inline decode_finra_protected_quote_message_with_bbo_info_message(finra_protected_quote_message_with_bbo_info_message_record) {
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 2 -> finra_protected_quote_message_with_bbo_info_message_record.orig[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.timestamp_1[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.feed_sequence[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.part_token[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.timestamp_2[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 11 -> finra_protected_quote_message_with_bbo_info_message_record.symbol_long[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.bid_long[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bid_size_long[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.ask_long[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.ask_size_long[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_record.cond = wire[at]; at = at + 1;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.mpid[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_bid[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_bid_size[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_bid_mpid[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_ask[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_ask_size[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> finra_protected_quote_message_with_bbo_info_message_record.bbo_ask_mpid[finra_protected_quote_message_with_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_record.bbo_cond = wire[at]; at = at + 1;
  skip
}

/* what was read of Finra Protected Quote Message With Bbo Info Message is what was written, byte for byte */
inline equal_finra_protected_quote_message_with_bbo_info_message(finra_protected_quote_message_with_bbo_info_message_read, finra_protected_quote_message_with_bbo_info_message_written) {
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 2 -> assert(finra_protected_quote_message_with_bbo_info_message_read.orig[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.orig[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_with_bbo_info_message_read.timestamp_1[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.timestamp_1[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_with_bbo_info_message_read.feed_sequence[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.feed_sequence[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_with_bbo_info_message_read.part_token[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.part_token[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_with_bbo_info_message_read.timestamp_2[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.timestamp_2[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 11 -> assert(finra_protected_quote_message_with_bbo_info_message_read.symbol_long[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.symbol_long[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_with_bbo_info_message_read.bid_long[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.bid_long[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> assert(finra_protected_quote_message_with_bbo_info_message_read.bid_size_long[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.bid_size_long[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_with_bbo_info_message_read.ask_long[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.ask_long[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> assert(finra_protected_quote_message_with_bbo_info_message_read.ask_size_long[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.ask_size_long[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  assert(finra_protected_quote_message_with_bbo_info_message_read.cond == finra_protected_quote_message_with_bbo_info_message_written.cond);
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> assert(finra_protected_quote_message_with_bbo_info_message_read.mpid[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.mpid[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_with_bbo_info_message_read.bbo_bid[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.bbo_bid[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> assert(finra_protected_quote_message_with_bbo_info_message_read.bbo_bid_size[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.bbo_bid_size[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> assert(finra_protected_quote_message_with_bbo_info_message_read.bbo_bid_mpid[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.bbo_bid_mpid[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_with_bbo_info_message_read.bbo_ask[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.bbo_ask[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> assert(finra_protected_quote_message_with_bbo_info_message_read.bbo_ask_size[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.bbo_ask_size[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_with_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_with_bbo_info_message_at < 4 -> assert(finra_protected_quote_message_with_bbo_info_message_read.bbo_ask_mpid[finra_protected_quote_message_with_bbo_info_message_at] == finra_protected_quote_message_with_bbo_info_message_written.bbo_ask_mpid[finra_protected_quote_message_with_bbo_info_message_at]); finra_protected_quote_message_with_bbo_info_message_at = finra_protected_quote_message_with_bbo_info_message_at + 1
  :: else -> break
  od;
  assert(finra_protected_quote_message_with_bbo_info_message_read.bbo_cond == finra_protected_quote_message_with_bbo_info_message_written.bbo_cond);
  skip
}

/* ---- Finra Protected Quote Message Without Bbo Info Message: 75 bytes -------- */

/* FINRA BBO Quote Message without BBO Info (QF). */
typedef FinraProtectedQuoteMessageWithoutBboInfoMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte bid_long[8];
  byte bid_size_long[4];
  byte ask_long[8];
  byte ask_size_long[4];
  byte cond;
  byte mpid[4];
  byte bbo_indicator
};

int finra_protected_quote_message_without_bbo_info_message_at;

/* every byte of Finra Protected Quote Message Without Bbo Info Message set to one value */
inline fill_finra_protected_quote_message_without_bbo_info_message(finra_protected_quote_message_without_bbo_info_message_record, finra_protected_quote_message_without_bbo_info_message_value) {
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 2 -> finra_protected_quote_message_without_bbo_info_message_record.orig[finra_protected_quote_message_without_bbo_info_message_at] = finra_protected_quote_message_without_bbo_info_message_value; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.timestamp_1[finra_protected_quote_message_without_bbo_info_message_at] = finra_protected_quote_message_without_bbo_info_message_value; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.feed_sequence[finra_protected_quote_message_without_bbo_info_message_at] = finra_protected_quote_message_without_bbo_info_message_value; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.part_token[finra_protected_quote_message_without_bbo_info_message_at] = finra_protected_quote_message_without_bbo_info_message_value; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.timestamp_2[finra_protected_quote_message_without_bbo_info_message_at] = finra_protected_quote_message_without_bbo_info_message_value; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 11 -> finra_protected_quote_message_without_bbo_info_message_record.symbol_long[finra_protected_quote_message_without_bbo_info_message_at] = finra_protected_quote_message_without_bbo_info_message_value; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.bid_long[finra_protected_quote_message_without_bbo_info_message_at] = finra_protected_quote_message_without_bbo_info_message_value; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> finra_protected_quote_message_without_bbo_info_message_record.bid_size_long[finra_protected_quote_message_without_bbo_info_message_at] = finra_protected_quote_message_without_bbo_info_message_value; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.ask_long[finra_protected_quote_message_without_bbo_info_message_at] = finra_protected_quote_message_without_bbo_info_message_value; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> finra_protected_quote_message_without_bbo_info_message_record.ask_size_long[finra_protected_quote_message_without_bbo_info_message_at] = finra_protected_quote_message_without_bbo_info_message_value; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_record.cond = finra_protected_quote_message_without_bbo_info_message_value;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> finra_protected_quote_message_without_bbo_info_message_record.mpid[finra_protected_quote_message_without_bbo_info_message_at] = finra_protected_quote_message_without_bbo_info_message_value; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_record.bbo_indicator = finra_protected_quote_message_without_bbo_info_message_value;
  skip
}

/* each byte of Finra Protected Quote Message Without Bbo Info Message set to where it lies, so a field read out of place says so */
inline ramp_finra_protected_quote_message_without_bbo_info_message(finra_protected_quote_message_without_bbo_info_message_record, finra_protected_quote_message_without_bbo_info_message_base) {
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 2 -> finra_protected_quote_message_without_bbo_info_message_record.orig[finra_protected_quote_message_without_bbo_info_message_at] = (finra_protected_quote_message_without_bbo_info_message_base + 0 + finra_protected_quote_message_without_bbo_info_message_at + 1) % 256; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.timestamp_1[finra_protected_quote_message_without_bbo_info_message_at] = (finra_protected_quote_message_without_bbo_info_message_base + 2 + finra_protected_quote_message_without_bbo_info_message_at + 1) % 256; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.feed_sequence[finra_protected_quote_message_without_bbo_info_message_at] = (finra_protected_quote_message_without_bbo_info_message_base + 10 + finra_protected_quote_message_without_bbo_info_message_at + 1) % 256; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.part_token[finra_protected_quote_message_without_bbo_info_message_at] = (finra_protected_quote_message_without_bbo_info_message_base + 18 + finra_protected_quote_message_without_bbo_info_message_at + 1) % 256; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.timestamp_2[finra_protected_quote_message_without_bbo_info_message_at] = (finra_protected_quote_message_without_bbo_info_message_base + 26 + finra_protected_quote_message_without_bbo_info_message_at + 1) % 256; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 11 -> finra_protected_quote_message_without_bbo_info_message_record.symbol_long[finra_protected_quote_message_without_bbo_info_message_at] = (finra_protected_quote_message_without_bbo_info_message_base + 34 + finra_protected_quote_message_without_bbo_info_message_at + 1) % 256; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.bid_long[finra_protected_quote_message_without_bbo_info_message_at] = (finra_protected_quote_message_without_bbo_info_message_base + 45 + finra_protected_quote_message_without_bbo_info_message_at + 1) % 256; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> finra_protected_quote_message_without_bbo_info_message_record.bid_size_long[finra_protected_quote_message_without_bbo_info_message_at] = (finra_protected_quote_message_without_bbo_info_message_base + 53 + finra_protected_quote_message_without_bbo_info_message_at + 1) % 256; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.ask_long[finra_protected_quote_message_without_bbo_info_message_at] = (finra_protected_quote_message_without_bbo_info_message_base + 57 + finra_protected_quote_message_without_bbo_info_message_at + 1) % 256; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> finra_protected_quote_message_without_bbo_info_message_record.ask_size_long[finra_protected_quote_message_without_bbo_info_message_at] = (finra_protected_quote_message_without_bbo_info_message_base + 65 + finra_protected_quote_message_without_bbo_info_message_at + 1) % 256; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_record.cond = (finra_protected_quote_message_without_bbo_info_message_base + 69 + 1) % 256;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> finra_protected_quote_message_without_bbo_info_message_record.mpid[finra_protected_quote_message_without_bbo_info_message_at] = (finra_protected_quote_message_without_bbo_info_message_base + 70 + finra_protected_quote_message_without_bbo_info_message_at + 1) % 256; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_record.bbo_indicator = (finra_protected_quote_message_without_bbo_info_message_base + 74 + 1) % 256;
  skip
}

/* Finra Protected Quote Message Without Bbo Info Message to the wire, 75 bytes from where the cursor stands */
inline encode_finra_protected_quote_message_without_bbo_info_message(finra_protected_quote_message_without_bbo_info_message_record) {
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 2 -> wire[at] = finra_protected_quote_message_without_bbo_info_message_record.orig[finra_protected_quote_message_without_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_without_bbo_info_message_record.timestamp_1[finra_protected_quote_message_without_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_without_bbo_info_message_record.feed_sequence[finra_protected_quote_message_without_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_without_bbo_info_message_record.part_token[finra_protected_quote_message_without_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_without_bbo_info_message_record.timestamp_2[finra_protected_quote_message_without_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 11 -> wire[at] = finra_protected_quote_message_without_bbo_info_message_record.symbol_long[finra_protected_quote_message_without_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_without_bbo_info_message_record.bid_long[finra_protected_quote_message_without_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> wire[at] = finra_protected_quote_message_without_bbo_info_message_record.bid_size_long[finra_protected_quote_message_without_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> wire[at] = finra_protected_quote_message_without_bbo_info_message_record.ask_long[finra_protected_quote_message_without_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> wire[at] = finra_protected_quote_message_without_bbo_info_message_record.ask_size_long[finra_protected_quote_message_without_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  wire[at] = finra_protected_quote_message_without_bbo_info_message_record.cond; at = at + 1;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> wire[at] = finra_protected_quote_message_without_bbo_info_message_record.mpid[finra_protected_quote_message_without_bbo_info_message_at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  wire[at] = finra_protected_quote_message_without_bbo_info_message_record.bbo_indicator; at = at + 1;
  skip
}

/* Finra Protected Quote Message Without Bbo Info Message off the wire, 75 bytes from where the cursor stands */
inline decode_finra_protected_quote_message_without_bbo_info_message(finra_protected_quote_message_without_bbo_info_message_record) {
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 2 -> finra_protected_quote_message_without_bbo_info_message_record.orig[finra_protected_quote_message_without_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.timestamp_1[finra_protected_quote_message_without_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.feed_sequence[finra_protected_quote_message_without_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.part_token[finra_protected_quote_message_without_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.timestamp_2[finra_protected_quote_message_without_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 11 -> finra_protected_quote_message_without_bbo_info_message_record.symbol_long[finra_protected_quote_message_without_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.bid_long[finra_protected_quote_message_without_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> finra_protected_quote_message_without_bbo_info_message_record.bid_size_long[finra_protected_quote_message_without_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> finra_protected_quote_message_without_bbo_info_message_record.ask_long[finra_protected_quote_message_without_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> finra_protected_quote_message_without_bbo_info_message_record.ask_size_long[finra_protected_quote_message_without_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_record.cond = wire[at]; at = at + 1;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> finra_protected_quote_message_without_bbo_info_message_record.mpid[finra_protected_quote_message_without_bbo_info_message_at] = wire[at]; at = at + 1; finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_record.bbo_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Finra Protected Quote Message Without Bbo Info Message is what was written, byte for byte */
inline equal_finra_protected_quote_message_without_bbo_info_message(finra_protected_quote_message_without_bbo_info_message_read, finra_protected_quote_message_without_bbo_info_message_written) {
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 2 -> assert(finra_protected_quote_message_without_bbo_info_message_read.orig[finra_protected_quote_message_without_bbo_info_message_at] == finra_protected_quote_message_without_bbo_info_message_written.orig[finra_protected_quote_message_without_bbo_info_message_at]); finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_without_bbo_info_message_read.timestamp_1[finra_protected_quote_message_without_bbo_info_message_at] == finra_protected_quote_message_without_bbo_info_message_written.timestamp_1[finra_protected_quote_message_without_bbo_info_message_at]); finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_without_bbo_info_message_read.feed_sequence[finra_protected_quote_message_without_bbo_info_message_at] == finra_protected_quote_message_without_bbo_info_message_written.feed_sequence[finra_protected_quote_message_without_bbo_info_message_at]); finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_without_bbo_info_message_read.part_token[finra_protected_quote_message_without_bbo_info_message_at] == finra_protected_quote_message_without_bbo_info_message_written.part_token[finra_protected_quote_message_without_bbo_info_message_at]); finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_without_bbo_info_message_read.timestamp_2[finra_protected_quote_message_without_bbo_info_message_at] == finra_protected_quote_message_without_bbo_info_message_written.timestamp_2[finra_protected_quote_message_without_bbo_info_message_at]); finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 11 -> assert(finra_protected_quote_message_without_bbo_info_message_read.symbol_long[finra_protected_quote_message_without_bbo_info_message_at] == finra_protected_quote_message_without_bbo_info_message_written.symbol_long[finra_protected_quote_message_without_bbo_info_message_at]); finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_without_bbo_info_message_read.bid_long[finra_protected_quote_message_without_bbo_info_message_at] == finra_protected_quote_message_without_bbo_info_message_written.bid_long[finra_protected_quote_message_without_bbo_info_message_at]); finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> assert(finra_protected_quote_message_without_bbo_info_message_read.bid_size_long[finra_protected_quote_message_without_bbo_info_message_at] == finra_protected_quote_message_without_bbo_info_message_written.bid_size_long[finra_protected_quote_message_without_bbo_info_message_at]); finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 8 -> assert(finra_protected_quote_message_without_bbo_info_message_read.ask_long[finra_protected_quote_message_without_bbo_info_message_at] == finra_protected_quote_message_without_bbo_info_message_written.ask_long[finra_protected_quote_message_without_bbo_info_message_at]); finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> assert(finra_protected_quote_message_without_bbo_info_message_read.ask_size_long[finra_protected_quote_message_without_bbo_info_message_at] == finra_protected_quote_message_without_bbo_info_message_written.ask_size_long[finra_protected_quote_message_without_bbo_info_message_at]); finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  assert(finra_protected_quote_message_without_bbo_info_message_read.cond == finra_protected_quote_message_without_bbo_info_message_written.cond);
  finra_protected_quote_message_without_bbo_info_message_at = 0;
  do
  :: finra_protected_quote_message_without_bbo_info_message_at < 4 -> assert(finra_protected_quote_message_without_bbo_info_message_read.mpid[finra_protected_quote_message_without_bbo_info_message_at] == finra_protected_quote_message_without_bbo_info_message_written.mpid[finra_protected_quote_message_without_bbo_info_message_at]); finra_protected_quote_message_without_bbo_info_message_at = finra_protected_quote_message_without_bbo_info_message_at + 1
  :: else -> break
  od;
  assert(finra_protected_quote_message_without_bbo_info_message_read.bbo_indicator == finra_protected_quote_message_without_bbo_info_message_written.bbo_indicator);
  skip
}

/* ---- Regular Trade Report Message: 69 bytes ---------------------------------- */

/* Regular Trade Report Message (TE). Carries whole-share last sale reports from an Exchange to the SIP. */
typedef RegularTradeReportMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte trade_id[4];
  byte tt_exempt;
  byte trcond[4];
  byte ssday[2];
  byte side;
  byte price[8];
  byte volume[4]
};

int regular_trade_report_message_at;

/* every byte of Regular Trade Report Message set to one value */
inline fill_regular_trade_report_message(regular_trade_report_message_record, regular_trade_report_message_value) {
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 2 -> regular_trade_report_message_record.orig[regular_trade_report_message_at] = regular_trade_report_message_value; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.timestamp_1[regular_trade_report_message_at] = regular_trade_report_message_value; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.feed_sequence[regular_trade_report_message_at] = regular_trade_report_message_value; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.part_token[regular_trade_report_message_at] = regular_trade_report_message_value; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.timestamp_2[regular_trade_report_message_at] = regular_trade_report_message_value; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 11 -> regular_trade_report_message_record.symbol_long[regular_trade_report_message_at] = regular_trade_report_message_value; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> regular_trade_report_message_record.trade_id[regular_trade_report_message_at] = regular_trade_report_message_value; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_record.tt_exempt = regular_trade_report_message_value;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> regular_trade_report_message_record.trcond[regular_trade_report_message_at] = regular_trade_report_message_value; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 2 -> regular_trade_report_message_record.ssday[regular_trade_report_message_at] = regular_trade_report_message_value; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_record.side = regular_trade_report_message_value;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.price[regular_trade_report_message_at] = regular_trade_report_message_value; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> regular_trade_report_message_record.volume[regular_trade_report_message_at] = regular_trade_report_message_value; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Regular Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_regular_trade_report_message(regular_trade_report_message_record, regular_trade_report_message_base) {
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 2 -> regular_trade_report_message_record.orig[regular_trade_report_message_at] = (regular_trade_report_message_base + 0 + regular_trade_report_message_at + 1) % 256; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.timestamp_1[regular_trade_report_message_at] = (regular_trade_report_message_base + 2 + regular_trade_report_message_at + 1) % 256; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.feed_sequence[regular_trade_report_message_at] = (regular_trade_report_message_base + 10 + regular_trade_report_message_at + 1) % 256; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.part_token[regular_trade_report_message_at] = (regular_trade_report_message_base + 18 + regular_trade_report_message_at + 1) % 256; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.timestamp_2[regular_trade_report_message_at] = (regular_trade_report_message_base + 26 + regular_trade_report_message_at + 1) % 256; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 11 -> regular_trade_report_message_record.symbol_long[regular_trade_report_message_at] = (regular_trade_report_message_base + 34 + regular_trade_report_message_at + 1) % 256; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> regular_trade_report_message_record.trade_id[regular_trade_report_message_at] = (regular_trade_report_message_base + 45 + regular_trade_report_message_at + 1) % 256; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_record.tt_exempt = (regular_trade_report_message_base + 49 + 1) % 256;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> regular_trade_report_message_record.trcond[regular_trade_report_message_at] = (regular_trade_report_message_base + 50 + regular_trade_report_message_at + 1) % 256; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 2 -> regular_trade_report_message_record.ssday[regular_trade_report_message_at] = (regular_trade_report_message_base + 54 + regular_trade_report_message_at + 1) % 256; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_record.side = (regular_trade_report_message_base + 56 + 1) % 256;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.price[regular_trade_report_message_at] = (regular_trade_report_message_base + 57 + regular_trade_report_message_at + 1) % 256; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> regular_trade_report_message_record.volume[regular_trade_report_message_at] = (regular_trade_report_message_base + 65 + regular_trade_report_message_at + 1) % 256; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Regular Trade Report Message to the wire, 69 bytes from where the cursor stands */
inline encode_regular_trade_report_message(regular_trade_report_message_record) {
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 2 -> wire[at] = regular_trade_report_message_record.orig[regular_trade_report_message_at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> wire[at] = regular_trade_report_message_record.timestamp_1[regular_trade_report_message_at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> wire[at] = regular_trade_report_message_record.feed_sequence[regular_trade_report_message_at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> wire[at] = regular_trade_report_message_record.part_token[regular_trade_report_message_at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> wire[at] = regular_trade_report_message_record.timestamp_2[regular_trade_report_message_at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 11 -> wire[at] = regular_trade_report_message_record.symbol_long[regular_trade_report_message_at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> wire[at] = regular_trade_report_message_record.trade_id[regular_trade_report_message_at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = regular_trade_report_message_record.tt_exempt; at = at + 1;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> wire[at] = regular_trade_report_message_record.trcond[regular_trade_report_message_at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 2 -> wire[at] = regular_trade_report_message_record.ssday[regular_trade_report_message_at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = regular_trade_report_message_record.side; at = at + 1;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> wire[at] = regular_trade_report_message_record.price[regular_trade_report_message_at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> wire[at] = regular_trade_report_message_record.volume[regular_trade_report_message_at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Regular Trade Report Message off the wire, 69 bytes from where the cursor stands */
inline decode_regular_trade_report_message(regular_trade_report_message_record) {
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 2 -> regular_trade_report_message_record.orig[regular_trade_report_message_at] = wire[at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.timestamp_1[regular_trade_report_message_at] = wire[at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.feed_sequence[regular_trade_report_message_at] = wire[at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.part_token[regular_trade_report_message_at] = wire[at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.timestamp_2[regular_trade_report_message_at] = wire[at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 11 -> regular_trade_report_message_record.symbol_long[regular_trade_report_message_at] = wire[at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> regular_trade_report_message_record.trade_id[regular_trade_report_message_at] = wire[at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_record.tt_exempt = wire[at]; at = at + 1;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> regular_trade_report_message_record.trcond[regular_trade_report_message_at] = wire[at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 2 -> regular_trade_report_message_record.ssday[regular_trade_report_message_at] = wire[at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_record.side = wire[at]; at = at + 1;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> regular_trade_report_message_record.price[regular_trade_report_message_at] = wire[at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> regular_trade_report_message_record.volume[regular_trade_report_message_at] = wire[at]; at = at + 1; regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Regular Trade Report Message is what was written, byte for byte */
inline equal_regular_trade_report_message(regular_trade_report_message_read, regular_trade_report_message_written) {
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 2 -> assert(regular_trade_report_message_read.orig[regular_trade_report_message_at] == regular_trade_report_message_written.orig[regular_trade_report_message_at]); regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> assert(regular_trade_report_message_read.timestamp_1[regular_trade_report_message_at] == regular_trade_report_message_written.timestamp_1[regular_trade_report_message_at]); regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> assert(regular_trade_report_message_read.feed_sequence[regular_trade_report_message_at] == regular_trade_report_message_written.feed_sequence[regular_trade_report_message_at]); regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> assert(regular_trade_report_message_read.part_token[regular_trade_report_message_at] == regular_trade_report_message_written.part_token[regular_trade_report_message_at]); regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> assert(regular_trade_report_message_read.timestamp_2[regular_trade_report_message_at] == regular_trade_report_message_written.timestamp_2[regular_trade_report_message_at]); regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 11 -> assert(regular_trade_report_message_read.symbol_long[regular_trade_report_message_at] == regular_trade_report_message_written.symbol_long[regular_trade_report_message_at]); regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> assert(regular_trade_report_message_read.trade_id[regular_trade_report_message_at] == regular_trade_report_message_written.trade_id[regular_trade_report_message_at]); regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  assert(regular_trade_report_message_read.tt_exempt == regular_trade_report_message_written.tt_exempt);
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> assert(regular_trade_report_message_read.trcond[regular_trade_report_message_at] == regular_trade_report_message_written.trcond[regular_trade_report_message_at]); regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 2 -> assert(regular_trade_report_message_read.ssday[regular_trade_report_message_at] == regular_trade_report_message_written.ssday[regular_trade_report_message_at]); regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  assert(regular_trade_report_message_read.side == regular_trade_report_message_written.side);
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 8 -> assert(regular_trade_report_message_read.price[regular_trade_report_message_at] == regular_trade_report_message_written.price[regular_trade_report_message_at]); regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  regular_trade_report_message_at = 0;
  do
  :: regular_trade_report_message_at < 4 -> assert(regular_trade_report_message_read.volume[regular_trade_report_message_at] == regular_trade_report_message_written.volume[regular_trade_report_message_at]); regular_trade_report_message_at = regular_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel Error Message: 70 bytes ------------------------------------ */

/* Trade Cancel/Error Message (TI). Cancels or errors a previously delivered trade. */
typedef TradeCancelErrorMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte cancel_type;
  byte orig_trade_id[4];
  byte orig_tt_exempt;
  byte orig_trcond[4];
  byte orig_ssday[2];
  byte orig_side;
  byte orig_price[8];
  byte orig_volume[4]
};

int trade_cancel_error_message_at;

/* every byte of Trade Cancel Error Message set to one value */
inline fill_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_value) {
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> trade_cancel_error_message_record.orig[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.timestamp_1[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.feed_sequence[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.part_token[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.timestamp_2[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> trade_cancel_error_message_record.symbol_long[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.cancel_type = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.orig_trade_id[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.orig_tt_exempt = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.orig_trcond[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> trade_cancel_error_message_record.orig_ssday[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.orig_side = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.orig_price[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.orig_volume[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_base) {
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> trade_cancel_error_message_record.orig[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 0 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.timestamp_1[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 2 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.feed_sequence[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 10 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.part_token[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 18 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.timestamp_2[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 26 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> trade_cancel_error_message_record.symbol_long[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 34 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.cancel_type = (trade_cancel_error_message_base + 45 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.orig_trade_id[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 46 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.orig_tt_exempt = (trade_cancel_error_message_base + 50 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.orig_trcond[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 51 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> trade_cancel_error_message_record.orig_ssday[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 55 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.orig_side = (trade_cancel_error_message_base + 57 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.orig_price[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 58 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.orig_volume[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 66 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Error Message to the wire, 70 bytes from where the cursor stands */
inline encode_trade_cancel_error_message(trade_cancel_error_message_record) {
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> wire[at] = trade_cancel_error_message_record.orig[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.timestamp_1[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.feed_sequence[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.part_token[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.timestamp_2[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> wire[at] = trade_cancel_error_message_record.symbol_long[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_error_message_record.cancel_type; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> wire[at] = trade_cancel_error_message_record.orig_trade_id[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_error_message_record.orig_tt_exempt; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> wire[at] = trade_cancel_error_message_record.orig_trcond[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> wire[at] = trade_cancel_error_message_record.orig_ssday[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_error_message_record.orig_side; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.orig_price[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> wire[at] = trade_cancel_error_message_record.orig_volume[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Error Message off the wire, 70 bytes from where the cursor stands */
inline decode_trade_cancel_error_message(trade_cancel_error_message_record) {
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> trade_cancel_error_message_record.orig[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.timestamp_1[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.feed_sequence[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.part_token[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.timestamp_2[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> trade_cancel_error_message_record.symbol_long[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.cancel_type = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.orig_trade_id[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.orig_tt_exempt = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.orig_trcond[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> trade_cancel_error_message_record.orig_ssday[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.orig_side = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.orig_price[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.orig_volume[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel Error Message is what was written, byte for byte */
inline equal_trade_cancel_error_message(trade_cancel_error_message_read, trade_cancel_error_message_written) {
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> assert(trade_cancel_error_message_read.orig[trade_cancel_error_message_at] == trade_cancel_error_message_written.orig[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.timestamp_1[trade_cancel_error_message_at] == trade_cancel_error_message_written.timestamp_1[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.feed_sequence[trade_cancel_error_message_at] == trade_cancel_error_message_written.feed_sequence[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.part_token[trade_cancel_error_message_at] == trade_cancel_error_message_written.part_token[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.timestamp_2[trade_cancel_error_message_at] == trade_cancel_error_message_written.timestamp_2[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 11 -> assert(trade_cancel_error_message_read.symbol_long[trade_cancel_error_message_at] == trade_cancel_error_message_written.symbol_long[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_error_message_read.cancel_type == trade_cancel_error_message_written.cancel_type);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> assert(trade_cancel_error_message_read.orig_trade_id[trade_cancel_error_message_at] == trade_cancel_error_message_written.orig_trade_id[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_error_message_read.orig_tt_exempt == trade_cancel_error_message_written.orig_tt_exempt);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> assert(trade_cancel_error_message_read.orig_trcond[trade_cancel_error_message_at] == trade_cancel_error_message_written.orig_trcond[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> assert(trade_cancel_error_message_read.orig_ssday[trade_cancel_error_message_at] == trade_cancel_error_message_written.orig_ssday[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_error_message_read.orig_side == trade_cancel_error_message_written.orig_side);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.orig_price[trade_cancel_error_message_at] == trade_cancel_error_message_written.orig_price[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> assert(trade_cancel_error_message_read.orig_volume[trade_cancel_error_message_at] == trade_cancel_error_message_written.orig_volume[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Correction Message: 92 bytes -------------------------------------- */

/* Trade Correction Message (TJ). Corrects a previously delivered trade with new values. */
typedef TradeCorrectionMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte trade_id[4];
  byte orig_trade_id[4];
  byte orig_tt_exempt;
  byte orig_trcond[4];
  byte orig_ssday[2];
  byte side;
  byte orig_price[8];
  byte orig_volume[4];
  byte new_tt_exempt;
  byte new_trcond[4];
  byte new_ssday[2];
  byte new_price[8];
  byte new_volume[4]
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.orig[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp_1[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.feed_sequence[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.part_token[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp_2[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.symbol_long[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.trade_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.orig_trade_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.orig_tt_exempt = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.orig_trcond[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.orig_ssday[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.side = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.orig_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.orig_volume[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.new_tt_exempt = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.new_trcond[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.new_ssday[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.new_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.new_volume[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.orig[trade_correction_message_at] = (trade_correction_message_base + 0 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp_1[trade_correction_message_at] = (trade_correction_message_base + 2 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.feed_sequence[trade_correction_message_at] = (trade_correction_message_base + 10 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.part_token[trade_correction_message_at] = (trade_correction_message_base + 18 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp_2[trade_correction_message_at] = (trade_correction_message_base + 26 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.symbol_long[trade_correction_message_at] = (trade_correction_message_base + 34 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.trade_id[trade_correction_message_at] = (trade_correction_message_base + 45 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.orig_trade_id[trade_correction_message_at] = (trade_correction_message_base + 49 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.orig_tt_exempt = (trade_correction_message_base + 53 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.orig_trcond[trade_correction_message_at] = (trade_correction_message_base + 54 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.orig_ssday[trade_correction_message_at] = (trade_correction_message_base + 58 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.side = (trade_correction_message_base + 60 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.orig_price[trade_correction_message_at] = (trade_correction_message_base + 61 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.orig_volume[trade_correction_message_at] = (trade_correction_message_base + 69 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.new_tt_exempt = (trade_correction_message_base + 73 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.new_trcond[trade_correction_message_at] = (trade_correction_message_base + 74 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.new_ssday[trade_correction_message_at] = (trade_correction_message_base + 78 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.new_price[trade_correction_message_at] = (trade_correction_message_base + 80 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.new_volume[trade_correction_message_at] = (trade_correction_message_base + 88 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message to the wire, 92 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> wire[at] = trade_correction_message_record.orig[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.timestamp_1[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.feed_sequence[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.part_token[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.timestamp_2[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> wire[at] = trade_correction_message_record.symbol_long[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.trade_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.orig_trade_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.orig_tt_exempt; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.orig_trcond[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> wire[at] = trade_correction_message_record.orig_ssday[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.side; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.orig_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.orig_volume[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.new_tt_exempt; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.new_trcond[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> wire[at] = trade_correction_message_record.new_ssday[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.new_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.new_volume[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message off the wire, 92 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.orig[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp_1[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.feed_sequence[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.part_token[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.timestamp_2[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> trade_correction_message_record.symbol_long[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.trade_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.orig_trade_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.orig_tt_exempt = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.orig_trcond[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.orig_ssday[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.side = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.orig_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.orig_volume[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.new_tt_exempt = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.new_trcond[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.new_ssday[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.new_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.new_volume[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> assert(trade_correction_message_read.orig[trade_correction_message_at] == trade_correction_message_written.orig[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.timestamp_1[trade_correction_message_at] == trade_correction_message_written.timestamp_1[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.feed_sequence[trade_correction_message_at] == trade_correction_message_written.feed_sequence[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.part_token[trade_correction_message_at] == trade_correction_message_written.part_token[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.timestamp_2[trade_correction_message_at] == trade_correction_message_written.timestamp_2[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 11 -> assert(trade_correction_message_read.symbol_long[trade_correction_message_at] == trade_correction_message_written.symbol_long[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.trade_id[trade_correction_message_at] == trade_correction_message_written.trade_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.orig_trade_id[trade_correction_message_at] == trade_correction_message_written.orig_trade_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.orig_tt_exempt == trade_correction_message_written.orig_tt_exempt);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.orig_trcond[trade_correction_message_at] == trade_correction_message_written.orig_trcond[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> assert(trade_correction_message_read.orig_ssday[trade_correction_message_at] == trade_correction_message_written.orig_ssday[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.side == trade_correction_message_written.side);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.orig_price[trade_correction_message_at] == trade_correction_message_written.orig_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.orig_volume[trade_correction_message_at] == trade_correction_message_written.orig_volume[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.new_tt_exempt == trade_correction_message_written.new_tt_exempt);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.new_trcond[trade_correction_message_at] == trade_correction_message_written.new_trcond[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> assert(trade_correction_message_read.new_ssday[trade_correction_message_at] == trade_correction_message_written.new_ssday[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.new_price[trade_correction_message_at] == trade_correction_message_written.new_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.new_volume[trade_correction_message_at] == trade_correction_message_written.new_volume[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- As Of Trade Report Message: 70 bytes ------------------------------------ */

/* As/Of Trade Report Message (TH). Reports a trade from a prior session date. */
typedef AsOfTradeReportMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte symbol_long[11];
  byte trade_id[4];
  byte tt_exempt;
  byte trcond[4];
  byte ssday[2];
  byte side;
  byte price[8];
  byte volume[4];
  byte trade_time[8];
  byte reversal
};

int as_of_trade_report_message_at;

/* every byte of As Of Trade Report Message set to one value */
inline fill_as_of_trade_report_message(as_of_trade_report_message_record, as_of_trade_report_message_value) {
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 2 -> as_of_trade_report_message_record.orig[as_of_trade_report_message_at] = as_of_trade_report_message_value; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.timestamp_1[as_of_trade_report_message_at] = as_of_trade_report_message_value; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.feed_sequence[as_of_trade_report_message_at] = as_of_trade_report_message_value; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.part_token[as_of_trade_report_message_at] = as_of_trade_report_message_value; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 11 -> as_of_trade_report_message_record.symbol_long[as_of_trade_report_message_at] = as_of_trade_report_message_value; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> as_of_trade_report_message_record.trade_id[as_of_trade_report_message_at] = as_of_trade_report_message_value; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_record.tt_exempt = as_of_trade_report_message_value;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> as_of_trade_report_message_record.trcond[as_of_trade_report_message_at] = as_of_trade_report_message_value; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 2 -> as_of_trade_report_message_record.ssday[as_of_trade_report_message_at] = as_of_trade_report_message_value; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_record.side = as_of_trade_report_message_value;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.price[as_of_trade_report_message_at] = as_of_trade_report_message_value; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> as_of_trade_report_message_record.volume[as_of_trade_report_message_at] = as_of_trade_report_message_value; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.trade_time[as_of_trade_report_message_at] = as_of_trade_report_message_value; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_record.reversal = as_of_trade_report_message_value;
  skip
}

/* each byte of As Of Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_as_of_trade_report_message(as_of_trade_report_message_record, as_of_trade_report_message_base) {
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 2 -> as_of_trade_report_message_record.orig[as_of_trade_report_message_at] = (as_of_trade_report_message_base + 0 + as_of_trade_report_message_at + 1) % 256; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.timestamp_1[as_of_trade_report_message_at] = (as_of_trade_report_message_base + 2 + as_of_trade_report_message_at + 1) % 256; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.feed_sequence[as_of_trade_report_message_at] = (as_of_trade_report_message_base + 10 + as_of_trade_report_message_at + 1) % 256; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.part_token[as_of_trade_report_message_at] = (as_of_trade_report_message_base + 18 + as_of_trade_report_message_at + 1) % 256; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 11 -> as_of_trade_report_message_record.symbol_long[as_of_trade_report_message_at] = (as_of_trade_report_message_base + 26 + as_of_trade_report_message_at + 1) % 256; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> as_of_trade_report_message_record.trade_id[as_of_trade_report_message_at] = (as_of_trade_report_message_base + 37 + as_of_trade_report_message_at + 1) % 256; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_record.tt_exempt = (as_of_trade_report_message_base + 41 + 1) % 256;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> as_of_trade_report_message_record.trcond[as_of_trade_report_message_at] = (as_of_trade_report_message_base + 42 + as_of_trade_report_message_at + 1) % 256; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 2 -> as_of_trade_report_message_record.ssday[as_of_trade_report_message_at] = (as_of_trade_report_message_base + 46 + as_of_trade_report_message_at + 1) % 256; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_record.side = (as_of_trade_report_message_base + 48 + 1) % 256;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.price[as_of_trade_report_message_at] = (as_of_trade_report_message_base + 49 + as_of_trade_report_message_at + 1) % 256; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> as_of_trade_report_message_record.volume[as_of_trade_report_message_at] = (as_of_trade_report_message_base + 57 + as_of_trade_report_message_at + 1) % 256; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.trade_time[as_of_trade_report_message_at] = (as_of_trade_report_message_base + 61 + as_of_trade_report_message_at + 1) % 256; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_record.reversal = (as_of_trade_report_message_base + 69 + 1) % 256;
  skip
}

/* As Of Trade Report Message to the wire, 70 bytes from where the cursor stands */
inline encode_as_of_trade_report_message(as_of_trade_report_message_record) {
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 2 -> wire[at] = as_of_trade_report_message_record.orig[as_of_trade_report_message_at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> wire[at] = as_of_trade_report_message_record.timestamp_1[as_of_trade_report_message_at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> wire[at] = as_of_trade_report_message_record.feed_sequence[as_of_trade_report_message_at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> wire[at] = as_of_trade_report_message_record.part_token[as_of_trade_report_message_at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 11 -> wire[at] = as_of_trade_report_message_record.symbol_long[as_of_trade_report_message_at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> wire[at] = as_of_trade_report_message_record.trade_id[as_of_trade_report_message_at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = as_of_trade_report_message_record.tt_exempt; at = at + 1;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> wire[at] = as_of_trade_report_message_record.trcond[as_of_trade_report_message_at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 2 -> wire[at] = as_of_trade_report_message_record.ssday[as_of_trade_report_message_at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = as_of_trade_report_message_record.side; at = at + 1;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> wire[at] = as_of_trade_report_message_record.price[as_of_trade_report_message_at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> wire[at] = as_of_trade_report_message_record.volume[as_of_trade_report_message_at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> wire[at] = as_of_trade_report_message_record.trade_time[as_of_trade_report_message_at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = as_of_trade_report_message_record.reversal; at = at + 1;
  skip
}

/* As Of Trade Report Message off the wire, 70 bytes from where the cursor stands */
inline decode_as_of_trade_report_message(as_of_trade_report_message_record) {
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 2 -> as_of_trade_report_message_record.orig[as_of_trade_report_message_at] = wire[at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.timestamp_1[as_of_trade_report_message_at] = wire[at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.feed_sequence[as_of_trade_report_message_at] = wire[at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.part_token[as_of_trade_report_message_at] = wire[at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 11 -> as_of_trade_report_message_record.symbol_long[as_of_trade_report_message_at] = wire[at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> as_of_trade_report_message_record.trade_id[as_of_trade_report_message_at] = wire[at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_record.tt_exempt = wire[at]; at = at + 1;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> as_of_trade_report_message_record.trcond[as_of_trade_report_message_at] = wire[at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 2 -> as_of_trade_report_message_record.ssday[as_of_trade_report_message_at] = wire[at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_record.side = wire[at]; at = at + 1;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.price[as_of_trade_report_message_at] = wire[at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> as_of_trade_report_message_record.volume[as_of_trade_report_message_at] = wire[at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> as_of_trade_report_message_record.trade_time[as_of_trade_report_message_at] = wire[at]; at = at + 1; as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_record.reversal = wire[at]; at = at + 1;
  skip
}

/* what was read of As Of Trade Report Message is what was written, byte for byte */
inline equal_as_of_trade_report_message(as_of_trade_report_message_read, as_of_trade_report_message_written) {
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 2 -> assert(as_of_trade_report_message_read.orig[as_of_trade_report_message_at] == as_of_trade_report_message_written.orig[as_of_trade_report_message_at]); as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> assert(as_of_trade_report_message_read.timestamp_1[as_of_trade_report_message_at] == as_of_trade_report_message_written.timestamp_1[as_of_trade_report_message_at]); as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> assert(as_of_trade_report_message_read.feed_sequence[as_of_trade_report_message_at] == as_of_trade_report_message_written.feed_sequence[as_of_trade_report_message_at]); as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> assert(as_of_trade_report_message_read.part_token[as_of_trade_report_message_at] == as_of_trade_report_message_written.part_token[as_of_trade_report_message_at]); as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 11 -> assert(as_of_trade_report_message_read.symbol_long[as_of_trade_report_message_at] == as_of_trade_report_message_written.symbol_long[as_of_trade_report_message_at]); as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> assert(as_of_trade_report_message_read.trade_id[as_of_trade_report_message_at] == as_of_trade_report_message_written.trade_id[as_of_trade_report_message_at]); as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  assert(as_of_trade_report_message_read.tt_exempt == as_of_trade_report_message_written.tt_exempt);
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> assert(as_of_trade_report_message_read.trcond[as_of_trade_report_message_at] == as_of_trade_report_message_written.trcond[as_of_trade_report_message_at]); as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 2 -> assert(as_of_trade_report_message_read.ssday[as_of_trade_report_message_at] == as_of_trade_report_message_written.ssday[as_of_trade_report_message_at]); as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  assert(as_of_trade_report_message_read.side == as_of_trade_report_message_written.side);
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> assert(as_of_trade_report_message_read.price[as_of_trade_report_message_at] == as_of_trade_report_message_written.price[as_of_trade_report_message_at]); as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 4 -> assert(as_of_trade_report_message_read.volume[as_of_trade_report_message_at] == as_of_trade_report_message_written.volume[as_of_trade_report_message_at]); as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  as_of_trade_report_message_at = 0;
  do
  :: as_of_trade_report_message_at < 8 -> assert(as_of_trade_report_message_read.trade_time[as_of_trade_report_message_at] == as_of_trade_report_message_written.trade_time[as_of_trade_report_message_at]); as_of_trade_report_message_at = as_of_trade_report_message_at + 1
  :: else -> break
  od;
  assert(as_of_trade_report_message_read.reversal == as_of_trade_report_message_written.reversal);
  skip
}

/* ---- Fractional Regular Trade Report Message: 73 bytes ----------------------- */

/* Fractional Regular Trade Report Message (TK). Last sale report with implied 6-decimal fractional volume. */
typedef FractionalRegularTradeReportMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte trade_id[4];
  byte tt_exempt;
  byte trcond[4];
  byte ssday[2];
  byte side;
  byte price[8];
  byte volume_fractional[8]
};

int fractional_regular_trade_report_message_at;

/* every byte of Fractional Regular Trade Report Message set to one value */
inline fill_fractional_regular_trade_report_message(fractional_regular_trade_report_message_record, fractional_regular_trade_report_message_value) {
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 2 -> fractional_regular_trade_report_message_record.orig[fractional_regular_trade_report_message_at] = fractional_regular_trade_report_message_value; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.timestamp_1[fractional_regular_trade_report_message_at] = fractional_regular_trade_report_message_value; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.feed_sequence[fractional_regular_trade_report_message_at] = fractional_regular_trade_report_message_value; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.part_token[fractional_regular_trade_report_message_at] = fractional_regular_trade_report_message_value; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.timestamp_2[fractional_regular_trade_report_message_at] = fractional_regular_trade_report_message_value; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 11 -> fractional_regular_trade_report_message_record.symbol_long[fractional_regular_trade_report_message_at] = fractional_regular_trade_report_message_value; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 4 -> fractional_regular_trade_report_message_record.trade_id[fractional_regular_trade_report_message_at] = fractional_regular_trade_report_message_value; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_record.tt_exempt = fractional_regular_trade_report_message_value;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 4 -> fractional_regular_trade_report_message_record.trcond[fractional_regular_trade_report_message_at] = fractional_regular_trade_report_message_value; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 2 -> fractional_regular_trade_report_message_record.ssday[fractional_regular_trade_report_message_at] = fractional_regular_trade_report_message_value; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_record.side = fractional_regular_trade_report_message_value;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.price[fractional_regular_trade_report_message_at] = fractional_regular_trade_report_message_value; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.volume_fractional[fractional_regular_trade_report_message_at] = fractional_regular_trade_report_message_value; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Fractional Regular Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_regular_trade_report_message(fractional_regular_trade_report_message_record, fractional_regular_trade_report_message_base) {
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 2 -> fractional_regular_trade_report_message_record.orig[fractional_regular_trade_report_message_at] = (fractional_regular_trade_report_message_base + 0 + fractional_regular_trade_report_message_at + 1) % 256; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.timestamp_1[fractional_regular_trade_report_message_at] = (fractional_regular_trade_report_message_base + 2 + fractional_regular_trade_report_message_at + 1) % 256; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.feed_sequence[fractional_regular_trade_report_message_at] = (fractional_regular_trade_report_message_base + 10 + fractional_regular_trade_report_message_at + 1) % 256; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.part_token[fractional_regular_trade_report_message_at] = (fractional_regular_trade_report_message_base + 18 + fractional_regular_trade_report_message_at + 1) % 256; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.timestamp_2[fractional_regular_trade_report_message_at] = (fractional_regular_trade_report_message_base + 26 + fractional_regular_trade_report_message_at + 1) % 256; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 11 -> fractional_regular_trade_report_message_record.symbol_long[fractional_regular_trade_report_message_at] = (fractional_regular_trade_report_message_base + 34 + fractional_regular_trade_report_message_at + 1) % 256; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 4 -> fractional_regular_trade_report_message_record.trade_id[fractional_regular_trade_report_message_at] = (fractional_regular_trade_report_message_base + 45 + fractional_regular_trade_report_message_at + 1) % 256; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_record.tt_exempt = (fractional_regular_trade_report_message_base + 49 + 1) % 256;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 4 -> fractional_regular_trade_report_message_record.trcond[fractional_regular_trade_report_message_at] = (fractional_regular_trade_report_message_base + 50 + fractional_regular_trade_report_message_at + 1) % 256; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 2 -> fractional_regular_trade_report_message_record.ssday[fractional_regular_trade_report_message_at] = (fractional_regular_trade_report_message_base + 54 + fractional_regular_trade_report_message_at + 1) % 256; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_record.side = (fractional_regular_trade_report_message_base + 56 + 1) % 256;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.price[fractional_regular_trade_report_message_at] = (fractional_regular_trade_report_message_base + 57 + fractional_regular_trade_report_message_at + 1) % 256; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.volume_fractional[fractional_regular_trade_report_message_at] = (fractional_regular_trade_report_message_base + 65 + fractional_regular_trade_report_message_at + 1) % 256; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Regular Trade Report Message to the wire, 73 bytes from where the cursor stands */
inline encode_fractional_regular_trade_report_message(fractional_regular_trade_report_message_record) {
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 2 -> wire[at] = fractional_regular_trade_report_message_record.orig[fractional_regular_trade_report_message_at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> wire[at] = fractional_regular_trade_report_message_record.timestamp_1[fractional_regular_trade_report_message_at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> wire[at] = fractional_regular_trade_report_message_record.feed_sequence[fractional_regular_trade_report_message_at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> wire[at] = fractional_regular_trade_report_message_record.part_token[fractional_regular_trade_report_message_at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> wire[at] = fractional_regular_trade_report_message_record.timestamp_2[fractional_regular_trade_report_message_at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 11 -> wire[at] = fractional_regular_trade_report_message_record.symbol_long[fractional_regular_trade_report_message_at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 4 -> wire[at] = fractional_regular_trade_report_message_record.trade_id[fractional_regular_trade_report_message_at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_regular_trade_report_message_record.tt_exempt; at = at + 1;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 4 -> wire[at] = fractional_regular_trade_report_message_record.trcond[fractional_regular_trade_report_message_at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 2 -> wire[at] = fractional_regular_trade_report_message_record.ssday[fractional_regular_trade_report_message_at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_regular_trade_report_message_record.side; at = at + 1;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> wire[at] = fractional_regular_trade_report_message_record.price[fractional_regular_trade_report_message_at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> wire[at] = fractional_regular_trade_report_message_record.volume_fractional[fractional_regular_trade_report_message_at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Regular Trade Report Message off the wire, 73 bytes from where the cursor stands */
inline decode_fractional_regular_trade_report_message(fractional_regular_trade_report_message_record) {
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 2 -> fractional_regular_trade_report_message_record.orig[fractional_regular_trade_report_message_at] = wire[at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.timestamp_1[fractional_regular_trade_report_message_at] = wire[at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.feed_sequence[fractional_regular_trade_report_message_at] = wire[at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.part_token[fractional_regular_trade_report_message_at] = wire[at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.timestamp_2[fractional_regular_trade_report_message_at] = wire[at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 11 -> fractional_regular_trade_report_message_record.symbol_long[fractional_regular_trade_report_message_at] = wire[at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 4 -> fractional_regular_trade_report_message_record.trade_id[fractional_regular_trade_report_message_at] = wire[at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_record.tt_exempt = wire[at]; at = at + 1;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 4 -> fractional_regular_trade_report_message_record.trcond[fractional_regular_trade_report_message_at] = wire[at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 2 -> fractional_regular_trade_report_message_record.ssday[fractional_regular_trade_report_message_at] = wire[at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_record.side = wire[at]; at = at + 1;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.price[fractional_regular_trade_report_message_at] = wire[at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> fractional_regular_trade_report_message_record.volume_fractional[fractional_regular_trade_report_message_at] = wire[at]; at = at + 1; fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Fractional Regular Trade Report Message is what was written, byte for byte */
inline equal_fractional_regular_trade_report_message(fractional_regular_trade_report_message_read, fractional_regular_trade_report_message_written) {
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 2 -> assert(fractional_regular_trade_report_message_read.orig[fractional_regular_trade_report_message_at] == fractional_regular_trade_report_message_written.orig[fractional_regular_trade_report_message_at]); fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> assert(fractional_regular_trade_report_message_read.timestamp_1[fractional_regular_trade_report_message_at] == fractional_regular_trade_report_message_written.timestamp_1[fractional_regular_trade_report_message_at]); fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> assert(fractional_regular_trade_report_message_read.feed_sequence[fractional_regular_trade_report_message_at] == fractional_regular_trade_report_message_written.feed_sequence[fractional_regular_trade_report_message_at]); fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> assert(fractional_regular_trade_report_message_read.part_token[fractional_regular_trade_report_message_at] == fractional_regular_trade_report_message_written.part_token[fractional_regular_trade_report_message_at]); fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> assert(fractional_regular_trade_report_message_read.timestamp_2[fractional_regular_trade_report_message_at] == fractional_regular_trade_report_message_written.timestamp_2[fractional_regular_trade_report_message_at]); fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 11 -> assert(fractional_regular_trade_report_message_read.symbol_long[fractional_regular_trade_report_message_at] == fractional_regular_trade_report_message_written.symbol_long[fractional_regular_trade_report_message_at]); fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 4 -> assert(fractional_regular_trade_report_message_read.trade_id[fractional_regular_trade_report_message_at] == fractional_regular_trade_report_message_written.trade_id[fractional_regular_trade_report_message_at]); fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  assert(fractional_regular_trade_report_message_read.tt_exempt == fractional_regular_trade_report_message_written.tt_exempt);
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 4 -> assert(fractional_regular_trade_report_message_read.trcond[fractional_regular_trade_report_message_at] == fractional_regular_trade_report_message_written.trcond[fractional_regular_trade_report_message_at]); fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 2 -> assert(fractional_regular_trade_report_message_read.ssday[fractional_regular_trade_report_message_at] == fractional_regular_trade_report_message_written.ssday[fractional_regular_trade_report_message_at]); fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  assert(fractional_regular_trade_report_message_read.side == fractional_regular_trade_report_message_written.side);
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> assert(fractional_regular_trade_report_message_read.price[fractional_regular_trade_report_message_at] == fractional_regular_trade_report_message_written.price[fractional_regular_trade_report_message_at]); fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_regular_trade_report_message_at = 0;
  do
  :: fractional_regular_trade_report_message_at < 8 -> assert(fractional_regular_trade_report_message_read.volume_fractional[fractional_regular_trade_report_message_at] == fractional_regular_trade_report_message_written.volume_fractional[fractional_regular_trade_report_message_at]); fractional_regular_trade_report_message_at = fractional_regular_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Fractional Trade Cancel Error Message: 74 bytes ------------------------- */

/* Fractional Trade Cancel/Error Message (TO). */
typedef FractionalTradeCancelErrorMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte cancel_type;
  byte orig_trade_id[4];
  byte orig_tt_exempt;
  byte orig_trcond[4];
  byte orig_ssday[2];
  byte orig_side;
  byte orig_price[8];
  byte orig_volume_fractional[8]
};

int fractional_trade_cancel_error_message_at;

/* every byte of Fractional Trade Cancel Error Message set to one value */
inline fill_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_record, fractional_trade_cancel_error_message_value) {
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> fractional_trade_cancel_error_message_record.orig[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.timestamp_1[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.feed_sequence[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.part_token[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.timestamp_2[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> fractional_trade_cancel_error_message_record.symbol_long[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.cancel_type = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> fractional_trade_cancel_error_message_record.orig_trade_id[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.orig_tt_exempt = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> fractional_trade_cancel_error_message_record.orig_trcond[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> fractional_trade_cancel_error_message_record.orig_ssday[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.orig_side = fractional_trade_cancel_error_message_value;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.orig_price[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.orig_volume_fractional[fractional_trade_cancel_error_message_at] = fractional_trade_cancel_error_message_value; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Fractional Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_record, fractional_trade_cancel_error_message_base) {
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> fractional_trade_cancel_error_message_record.orig[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 0 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.timestamp_1[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 2 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.feed_sequence[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 10 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.part_token[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 18 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.timestamp_2[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 26 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> fractional_trade_cancel_error_message_record.symbol_long[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 34 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.cancel_type = (fractional_trade_cancel_error_message_base + 45 + 1) % 256;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> fractional_trade_cancel_error_message_record.orig_trade_id[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 46 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.orig_tt_exempt = (fractional_trade_cancel_error_message_base + 50 + 1) % 256;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> fractional_trade_cancel_error_message_record.orig_trcond[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 51 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> fractional_trade_cancel_error_message_record.orig_ssday[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 55 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.orig_side = (fractional_trade_cancel_error_message_base + 57 + 1) % 256;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.orig_price[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 58 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.orig_volume_fractional[fractional_trade_cancel_error_message_at] = (fractional_trade_cancel_error_message_base + 66 + fractional_trade_cancel_error_message_at + 1) % 256; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Trade Cancel Error Message to the wire, 74 bytes from where the cursor stands */
inline encode_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_record) {
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> wire[at] = fractional_trade_cancel_error_message_record.orig[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.timestamp_1[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.feed_sequence[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.part_token[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.timestamp_2[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> wire[at] = fractional_trade_cancel_error_message_record.symbol_long[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_cancel_error_message_record.cancel_type; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> wire[at] = fractional_trade_cancel_error_message_record.orig_trade_id[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_cancel_error_message_record.orig_tt_exempt; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> wire[at] = fractional_trade_cancel_error_message_record.orig_trcond[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> wire[at] = fractional_trade_cancel_error_message_record.orig_ssday[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_cancel_error_message_record.orig_side; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.orig_price[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> wire[at] = fractional_trade_cancel_error_message_record.orig_volume_fractional[fractional_trade_cancel_error_message_at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Trade Cancel Error Message off the wire, 74 bytes from where the cursor stands */
inline decode_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_record) {
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> fractional_trade_cancel_error_message_record.orig[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.timestamp_1[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.feed_sequence[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.part_token[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.timestamp_2[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> fractional_trade_cancel_error_message_record.symbol_long[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.cancel_type = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> fractional_trade_cancel_error_message_record.orig_trade_id[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.orig_tt_exempt = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> fractional_trade_cancel_error_message_record.orig_trcond[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> fractional_trade_cancel_error_message_record.orig_ssday[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_record.orig_side = wire[at]; at = at + 1;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.orig_price[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> fractional_trade_cancel_error_message_record.orig_volume_fractional[fractional_trade_cancel_error_message_at] = wire[at]; at = at + 1; fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Fractional Trade Cancel Error Message is what was written, byte for byte */
inline equal_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_read, fractional_trade_cancel_error_message_written) {
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> assert(fractional_trade_cancel_error_message_read.orig[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.orig[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.timestamp_1[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.timestamp_1[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.feed_sequence[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.feed_sequence[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.part_token[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.part_token[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.timestamp_2[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.timestamp_2[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 11 -> assert(fractional_trade_cancel_error_message_read.symbol_long[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.symbol_long[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_cancel_error_message_read.cancel_type == fractional_trade_cancel_error_message_written.cancel_type);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> assert(fractional_trade_cancel_error_message_read.orig_trade_id[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.orig_trade_id[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_cancel_error_message_read.orig_tt_exempt == fractional_trade_cancel_error_message_written.orig_tt_exempt);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 4 -> assert(fractional_trade_cancel_error_message_read.orig_trcond[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.orig_trcond[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 2 -> assert(fractional_trade_cancel_error_message_read.orig_ssday[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.orig_ssday[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_cancel_error_message_read.orig_side == fractional_trade_cancel_error_message_written.orig_side);
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.orig_price[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.orig_price[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fractional_trade_cancel_error_message_at = 0;
  do
  :: fractional_trade_cancel_error_message_at < 8 -> assert(fractional_trade_cancel_error_message_read.orig_volume_fractional[fractional_trade_cancel_error_message_at] == fractional_trade_cancel_error_message_written.orig_volume_fractional[fractional_trade_cancel_error_message_at]); fractional_trade_cancel_error_message_at = fractional_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Fractional Trade Correction Message: 100 bytes -------------------------- */

/* Fractional Trade Correction Message (TP). */
typedef FractionalTradeCorrectionMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte timestamp_2[8];
  byte symbol_long[11];
  byte trade_id[4];
  byte orig_trade_id[4];
  byte orig_tt_exempt;
  byte orig_trcond[4];
  byte orig_ssday[2];
  byte side;
  byte orig_price[8];
  byte orig_volume_fractional[8];
  byte new_tt_exempt;
  byte new_trcond[4];
  byte new_ssday[2];
  byte new_price[8];
  byte new_volume_fractional[8]
};

int fractional_trade_correction_message_at;

/* every byte of Fractional Trade Correction Message set to one value */
inline fill_fractional_trade_correction_message(fractional_trade_correction_message_record, fractional_trade_correction_message_value) {
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.orig[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.timestamp_1[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.feed_sequence[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.part_token[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.timestamp_2[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> fractional_trade_correction_message_record.symbol_long[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.trade_id[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.orig_trade_id[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.orig_tt_exempt = fractional_trade_correction_message_value;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.orig_trcond[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.orig_ssday[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.side = fractional_trade_correction_message_value;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.orig_price[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.orig_volume_fractional[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.new_tt_exempt = fractional_trade_correction_message_value;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.new_trcond[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.new_ssday[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.new_price[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.new_volume_fractional[fractional_trade_correction_message_at] = fractional_trade_correction_message_value; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Fractional Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_trade_correction_message(fractional_trade_correction_message_record, fractional_trade_correction_message_base) {
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.orig[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 0 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.timestamp_1[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 2 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.feed_sequence[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 10 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.part_token[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 18 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.timestamp_2[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 26 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> fractional_trade_correction_message_record.symbol_long[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 34 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.trade_id[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 45 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.orig_trade_id[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 49 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.orig_tt_exempt = (fractional_trade_correction_message_base + 53 + 1) % 256;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.orig_trcond[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 54 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.orig_ssday[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 58 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.side = (fractional_trade_correction_message_base + 60 + 1) % 256;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.orig_price[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 61 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.orig_volume_fractional[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 69 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.new_tt_exempt = (fractional_trade_correction_message_base + 77 + 1) % 256;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.new_trcond[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 78 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.new_ssday[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 82 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.new_price[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 84 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.new_volume_fractional[fractional_trade_correction_message_at] = (fractional_trade_correction_message_base + 92 + fractional_trade_correction_message_at + 1) % 256; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Trade Correction Message to the wire, 100 bytes from where the cursor stands */
inline encode_fractional_trade_correction_message(fractional_trade_correction_message_record) {
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> wire[at] = fractional_trade_correction_message_record.orig[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.timestamp_1[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.feed_sequence[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.part_token[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.timestamp_2[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> wire[at] = fractional_trade_correction_message_record.symbol_long[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> wire[at] = fractional_trade_correction_message_record.trade_id[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> wire[at] = fractional_trade_correction_message_record.orig_trade_id[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_correction_message_record.orig_tt_exempt; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> wire[at] = fractional_trade_correction_message_record.orig_trcond[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> wire[at] = fractional_trade_correction_message_record.orig_ssday[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_correction_message_record.side; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.orig_price[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.orig_volume_fractional[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_trade_correction_message_record.new_tt_exempt; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> wire[at] = fractional_trade_correction_message_record.new_trcond[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> wire[at] = fractional_trade_correction_message_record.new_ssday[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.new_price[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> wire[at] = fractional_trade_correction_message_record.new_volume_fractional[fractional_trade_correction_message_at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional Trade Correction Message off the wire, 100 bytes from where the cursor stands */
inline decode_fractional_trade_correction_message(fractional_trade_correction_message_record) {
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.orig[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.timestamp_1[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.feed_sequence[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.part_token[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.timestamp_2[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> fractional_trade_correction_message_record.symbol_long[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.trade_id[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.orig_trade_id[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.orig_tt_exempt = wire[at]; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.orig_trcond[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.orig_ssday[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.side = wire[at]; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.orig_price[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.orig_volume_fractional[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_record.new_tt_exempt = wire[at]; at = at + 1;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> fractional_trade_correction_message_record.new_trcond[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> fractional_trade_correction_message_record.new_ssday[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.new_price[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> fractional_trade_correction_message_record.new_volume_fractional[fractional_trade_correction_message_at] = wire[at]; at = at + 1; fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Fractional Trade Correction Message is what was written, byte for byte */
inline equal_fractional_trade_correction_message(fractional_trade_correction_message_read, fractional_trade_correction_message_written) {
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> assert(fractional_trade_correction_message_read.orig[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.orig[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.timestamp_1[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.timestamp_1[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.feed_sequence[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.feed_sequence[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.part_token[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.part_token[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.timestamp_2[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.timestamp_2[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 11 -> assert(fractional_trade_correction_message_read.symbol_long[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.symbol_long[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> assert(fractional_trade_correction_message_read.trade_id[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.trade_id[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> assert(fractional_trade_correction_message_read.orig_trade_id[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.orig_trade_id[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_correction_message_read.orig_tt_exempt == fractional_trade_correction_message_written.orig_tt_exempt);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> assert(fractional_trade_correction_message_read.orig_trcond[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.orig_trcond[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> assert(fractional_trade_correction_message_read.orig_ssday[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.orig_ssday[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_correction_message_read.side == fractional_trade_correction_message_written.side);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.orig_price[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.orig_price[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.orig_volume_fractional[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.orig_volume_fractional[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(fractional_trade_correction_message_read.new_tt_exempt == fractional_trade_correction_message_written.new_tt_exempt);
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 4 -> assert(fractional_trade_correction_message_read.new_trcond[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.new_trcond[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 2 -> assert(fractional_trade_correction_message_read.new_ssday[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.new_ssday[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.new_price[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.new_price[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  fractional_trade_correction_message_at = 0;
  do
  :: fractional_trade_correction_message_at < 8 -> assert(fractional_trade_correction_message_read.new_volume_fractional[fractional_trade_correction_message_at] == fractional_trade_correction_message_written.new_volume_fractional[fractional_trade_correction_message_at]); fractional_trade_correction_message_at = fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Fractional As Of Trade Report Message: 74 bytes ------------------------- */

/* Fractional As/Of Trade Report Message (TQ). */
typedef FractionalAsOfTradeReportMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte symbol_long[11];
  byte trade_id[4];
  byte tt_exempt;
  byte trcond[4];
  byte ssday[2];
  byte side;
  byte price[8];
  byte volume_fractional[8];
  byte trade_time[8];
  byte reversal
};

int fractional_as_of_trade_report_message_at;

/* every byte of Fractional As Of Trade Report Message set to one value */
inline fill_fractional_as_of_trade_report_message(fractional_as_of_trade_report_message_record, fractional_as_of_trade_report_message_value) {
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 2 -> fractional_as_of_trade_report_message_record.orig[fractional_as_of_trade_report_message_at] = fractional_as_of_trade_report_message_value; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.timestamp_1[fractional_as_of_trade_report_message_at] = fractional_as_of_trade_report_message_value; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.feed_sequence[fractional_as_of_trade_report_message_at] = fractional_as_of_trade_report_message_value; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.part_token[fractional_as_of_trade_report_message_at] = fractional_as_of_trade_report_message_value; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 11 -> fractional_as_of_trade_report_message_record.symbol_long[fractional_as_of_trade_report_message_at] = fractional_as_of_trade_report_message_value; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 4 -> fractional_as_of_trade_report_message_record.trade_id[fractional_as_of_trade_report_message_at] = fractional_as_of_trade_report_message_value; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_record.tt_exempt = fractional_as_of_trade_report_message_value;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 4 -> fractional_as_of_trade_report_message_record.trcond[fractional_as_of_trade_report_message_at] = fractional_as_of_trade_report_message_value; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 2 -> fractional_as_of_trade_report_message_record.ssday[fractional_as_of_trade_report_message_at] = fractional_as_of_trade_report_message_value; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_record.side = fractional_as_of_trade_report_message_value;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.price[fractional_as_of_trade_report_message_at] = fractional_as_of_trade_report_message_value; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.volume_fractional[fractional_as_of_trade_report_message_at] = fractional_as_of_trade_report_message_value; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.trade_time[fractional_as_of_trade_report_message_at] = fractional_as_of_trade_report_message_value; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_record.reversal = fractional_as_of_trade_report_message_value;
  skip
}

/* each byte of Fractional As Of Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_as_of_trade_report_message(fractional_as_of_trade_report_message_record, fractional_as_of_trade_report_message_base) {
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 2 -> fractional_as_of_trade_report_message_record.orig[fractional_as_of_trade_report_message_at] = (fractional_as_of_trade_report_message_base + 0 + fractional_as_of_trade_report_message_at + 1) % 256; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.timestamp_1[fractional_as_of_trade_report_message_at] = (fractional_as_of_trade_report_message_base + 2 + fractional_as_of_trade_report_message_at + 1) % 256; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.feed_sequence[fractional_as_of_trade_report_message_at] = (fractional_as_of_trade_report_message_base + 10 + fractional_as_of_trade_report_message_at + 1) % 256; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.part_token[fractional_as_of_trade_report_message_at] = (fractional_as_of_trade_report_message_base + 18 + fractional_as_of_trade_report_message_at + 1) % 256; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 11 -> fractional_as_of_trade_report_message_record.symbol_long[fractional_as_of_trade_report_message_at] = (fractional_as_of_trade_report_message_base + 26 + fractional_as_of_trade_report_message_at + 1) % 256; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 4 -> fractional_as_of_trade_report_message_record.trade_id[fractional_as_of_trade_report_message_at] = (fractional_as_of_trade_report_message_base + 37 + fractional_as_of_trade_report_message_at + 1) % 256; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_record.tt_exempt = (fractional_as_of_trade_report_message_base + 41 + 1) % 256;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 4 -> fractional_as_of_trade_report_message_record.trcond[fractional_as_of_trade_report_message_at] = (fractional_as_of_trade_report_message_base + 42 + fractional_as_of_trade_report_message_at + 1) % 256; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 2 -> fractional_as_of_trade_report_message_record.ssday[fractional_as_of_trade_report_message_at] = (fractional_as_of_trade_report_message_base + 46 + fractional_as_of_trade_report_message_at + 1) % 256; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_record.side = (fractional_as_of_trade_report_message_base + 48 + 1) % 256;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.price[fractional_as_of_trade_report_message_at] = (fractional_as_of_trade_report_message_base + 49 + fractional_as_of_trade_report_message_at + 1) % 256; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.volume_fractional[fractional_as_of_trade_report_message_at] = (fractional_as_of_trade_report_message_base + 57 + fractional_as_of_trade_report_message_at + 1) % 256; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.trade_time[fractional_as_of_trade_report_message_at] = (fractional_as_of_trade_report_message_base + 65 + fractional_as_of_trade_report_message_at + 1) % 256; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_record.reversal = (fractional_as_of_trade_report_message_base + 73 + 1) % 256;
  skip
}

/* Fractional As Of Trade Report Message to the wire, 74 bytes from where the cursor stands */
inline encode_fractional_as_of_trade_report_message(fractional_as_of_trade_report_message_record) {
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 2 -> wire[at] = fractional_as_of_trade_report_message_record.orig[fractional_as_of_trade_report_message_at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> wire[at] = fractional_as_of_trade_report_message_record.timestamp_1[fractional_as_of_trade_report_message_at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> wire[at] = fractional_as_of_trade_report_message_record.feed_sequence[fractional_as_of_trade_report_message_at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> wire[at] = fractional_as_of_trade_report_message_record.part_token[fractional_as_of_trade_report_message_at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 11 -> wire[at] = fractional_as_of_trade_report_message_record.symbol_long[fractional_as_of_trade_report_message_at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 4 -> wire[at] = fractional_as_of_trade_report_message_record.trade_id[fractional_as_of_trade_report_message_at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_as_of_trade_report_message_record.tt_exempt; at = at + 1;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 4 -> wire[at] = fractional_as_of_trade_report_message_record.trcond[fractional_as_of_trade_report_message_at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 2 -> wire[at] = fractional_as_of_trade_report_message_record.ssday[fractional_as_of_trade_report_message_at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_as_of_trade_report_message_record.side; at = at + 1;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> wire[at] = fractional_as_of_trade_report_message_record.price[fractional_as_of_trade_report_message_at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> wire[at] = fractional_as_of_trade_report_message_record.volume_fractional[fractional_as_of_trade_report_message_at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> wire[at] = fractional_as_of_trade_report_message_record.trade_time[fractional_as_of_trade_report_message_at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_as_of_trade_report_message_record.reversal; at = at + 1;
  skip
}

/* Fractional As Of Trade Report Message off the wire, 74 bytes from where the cursor stands */
inline decode_fractional_as_of_trade_report_message(fractional_as_of_trade_report_message_record) {
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 2 -> fractional_as_of_trade_report_message_record.orig[fractional_as_of_trade_report_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.timestamp_1[fractional_as_of_trade_report_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.feed_sequence[fractional_as_of_trade_report_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.part_token[fractional_as_of_trade_report_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 11 -> fractional_as_of_trade_report_message_record.symbol_long[fractional_as_of_trade_report_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 4 -> fractional_as_of_trade_report_message_record.trade_id[fractional_as_of_trade_report_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_record.tt_exempt = wire[at]; at = at + 1;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 4 -> fractional_as_of_trade_report_message_record.trcond[fractional_as_of_trade_report_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 2 -> fractional_as_of_trade_report_message_record.ssday[fractional_as_of_trade_report_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_record.side = wire[at]; at = at + 1;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.price[fractional_as_of_trade_report_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.volume_fractional[fractional_as_of_trade_report_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> fractional_as_of_trade_report_message_record.trade_time[fractional_as_of_trade_report_message_at] = wire[at]; at = at + 1; fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_record.reversal = wire[at]; at = at + 1;
  skip
}

/* what was read of Fractional As Of Trade Report Message is what was written, byte for byte */
inline equal_fractional_as_of_trade_report_message(fractional_as_of_trade_report_message_read, fractional_as_of_trade_report_message_written) {
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 2 -> assert(fractional_as_of_trade_report_message_read.orig[fractional_as_of_trade_report_message_at] == fractional_as_of_trade_report_message_written.orig[fractional_as_of_trade_report_message_at]); fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> assert(fractional_as_of_trade_report_message_read.timestamp_1[fractional_as_of_trade_report_message_at] == fractional_as_of_trade_report_message_written.timestamp_1[fractional_as_of_trade_report_message_at]); fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> assert(fractional_as_of_trade_report_message_read.feed_sequence[fractional_as_of_trade_report_message_at] == fractional_as_of_trade_report_message_written.feed_sequence[fractional_as_of_trade_report_message_at]); fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> assert(fractional_as_of_trade_report_message_read.part_token[fractional_as_of_trade_report_message_at] == fractional_as_of_trade_report_message_written.part_token[fractional_as_of_trade_report_message_at]); fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 11 -> assert(fractional_as_of_trade_report_message_read.symbol_long[fractional_as_of_trade_report_message_at] == fractional_as_of_trade_report_message_written.symbol_long[fractional_as_of_trade_report_message_at]); fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 4 -> assert(fractional_as_of_trade_report_message_read.trade_id[fractional_as_of_trade_report_message_at] == fractional_as_of_trade_report_message_written.trade_id[fractional_as_of_trade_report_message_at]); fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  assert(fractional_as_of_trade_report_message_read.tt_exempt == fractional_as_of_trade_report_message_written.tt_exempt);
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 4 -> assert(fractional_as_of_trade_report_message_read.trcond[fractional_as_of_trade_report_message_at] == fractional_as_of_trade_report_message_written.trcond[fractional_as_of_trade_report_message_at]); fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 2 -> assert(fractional_as_of_trade_report_message_read.ssday[fractional_as_of_trade_report_message_at] == fractional_as_of_trade_report_message_written.ssday[fractional_as_of_trade_report_message_at]); fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  assert(fractional_as_of_trade_report_message_read.side == fractional_as_of_trade_report_message_written.side);
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> assert(fractional_as_of_trade_report_message_read.price[fractional_as_of_trade_report_message_at] == fractional_as_of_trade_report_message_written.price[fractional_as_of_trade_report_message_at]); fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> assert(fractional_as_of_trade_report_message_read.volume_fractional[fractional_as_of_trade_report_message_at] == fractional_as_of_trade_report_message_written.volume_fractional[fractional_as_of_trade_report_message_at]); fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  fractional_as_of_trade_report_message_at = 0;
  do
  :: fractional_as_of_trade_report_message_at < 8 -> assert(fractional_as_of_trade_report_message_read.trade_time[fractional_as_of_trade_report_message_at] == fractional_as_of_trade_report_message_written.trade_time[fractional_as_of_trade_report_message_at]); fractional_as_of_trade_report_message_at = fractional_as_of_trade_report_message_at + 1
  :: else -> break
  od;
  assert(fractional_as_of_trade_report_message_read.reversal == fractional_as_of_trade_report_message_written.reversal);
  skip
}

/* ---- Trading Action Message: 56 bytes ---------------------------------------- */

/* Trading Action Message (AO). Listing market notifies SIP of halts and other trading state events. */
typedef TradingActionMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte symbol_long[11];
  byte action;
  byte action_sequence[4];
  byte action_time[8];
  byte reason[6]
};

int trading_action_message_at;

/* every byte of Trading Action Message set to one value */
inline fill_trading_action_message(trading_action_message_record, trading_action_message_value) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 2 -> trading_action_message_record.orig[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.timestamp_1[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.feed_sequence[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.part_token[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 11 -> trading_action_message_record.symbol_long[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.action = trading_action_message_value;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.action_sequence[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.action_time[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> trading_action_message_record.reason[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_trading_action_message(trading_action_message_record, trading_action_message_base) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 2 -> trading_action_message_record.orig[trading_action_message_at] = (trading_action_message_base + 0 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.timestamp_1[trading_action_message_at] = (trading_action_message_base + 2 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.feed_sequence[trading_action_message_at] = (trading_action_message_base + 10 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.part_token[trading_action_message_at] = (trading_action_message_base + 18 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 11 -> trading_action_message_record.symbol_long[trading_action_message_at] = (trading_action_message_base + 26 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.action = (trading_action_message_base + 37 + 1) % 256;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.action_sequence[trading_action_message_at] = (trading_action_message_base + 38 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.action_time[trading_action_message_at] = (trading_action_message_base + 42 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> trading_action_message_record.reason[trading_action_message_at] = (trading_action_message_base + 50 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Action Message to the wire, 56 bytes from where the cursor stands */
inline encode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 2 -> wire[at] = trading_action_message_record.orig[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> wire[at] = trading_action_message_record.timestamp_1[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> wire[at] = trading_action_message_record.feed_sequence[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> wire[at] = trading_action_message_record.part_token[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 11 -> wire[at] = trading_action_message_record.symbol_long[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_action_message_record.action; at = at + 1;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> wire[at] = trading_action_message_record.action_sequence[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> wire[at] = trading_action_message_record.action_time[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> wire[at] = trading_action_message_record.reason[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Action Message off the wire, 56 bytes from where the cursor stands */
inline decode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 2 -> trading_action_message_record.orig[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.timestamp_1[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.feed_sequence[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.part_token[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 11 -> trading_action_message_record.symbol_long[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.action = wire[at]; at = at + 1;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.action_sequence[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.action_time[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> trading_action_message_record.reason[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Action Message is what was written, byte for byte */
inline equal_trading_action_message(trading_action_message_read, trading_action_message_written) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 2 -> assert(trading_action_message_read.orig[trading_action_message_at] == trading_action_message_written.orig[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> assert(trading_action_message_read.timestamp_1[trading_action_message_at] == trading_action_message_written.timestamp_1[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> assert(trading_action_message_read.feed_sequence[trading_action_message_at] == trading_action_message_written.feed_sequence[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> assert(trading_action_message_read.part_token[trading_action_message_at] == trading_action_message_written.part_token[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 11 -> assert(trading_action_message_read.symbol_long[trading_action_message_at] == trading_action_message_written.symbol_long[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  assert(trading_action_message_read.action == trading_action_message_written.action);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> assert(trading_action_message_read.action_sequence[trading_action_message_at] == trading_action_message_written.action_sequence[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> assert(trading_action_message_read.action_time[trading_action_message_at] == trading_action_message_written.action_time[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> assert(trading_action_message_read.reason[trading_action_message_at] == trading_action_message_written.reason[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Center Trading Action Message: 46 bytes -------------------------- */

/* Market Center Trading Action Message (AJ). Participant-specific trading halt on the participant's own market only. */
typedef MarketCenterTradingActionMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte symbol_long[11];
  byte action;
  byte action_time[8]
};

int market_center_trading_action_message_at;

/* every byte of Market Center Trading Action Message set to one value */
inline fill_market_center_trading_action_message(market_center_trading_action_message_record, market_center_trading_action_message_value) {
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 2 -> market_center_trading_action_message_record.orig[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.timestamp_1[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.feed_sequence[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.part_token[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> market_center_trading_action_message_record.symbol_long[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.action = market_center_trading_action_message_value;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.action_time[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Center Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_market_center_trading_action_message(market_center_trading_action_message_record, market_center_trading_action_message_base) {
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 2 -> market_center_trading_action_message_record.orig[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 0 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.timestamp_1[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 2 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.feed_sequence[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 10 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.part_token[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 18 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> market_center_trading_action_message_record.symbol_long[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 26 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.action = (market_center_trading_action_message_base + 37 + 1) % 256;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.action_time[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 38 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Center Trading Action Message to the wire, 46 bytes from where the cursor stands */
inline encode_market_center_trading_action_message(market_center_trading_action_message_record) {
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 2 -> wire[at] = market_center_trading_action_message_record.orig[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> wire[at] = market_center_trading_action_message_record.timestamp_1[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> wire[at] = market_center_trading_action_message_record.feed_sequence[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> wire[at] = market_center_trading_action_message_record.part_token[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> wire[at] = market_center_trading_action_message_record.symbol_long[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = market_center_trading_action_message_record.action; at = at + 1;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> wire[at] = market_center_trading_action_message_record.action_time[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Center Trading Action Message off the wire, 46 bytes from where the cursor stands */
inline decode_market_center_trading_action_message(market_center_trading_action_message_record) {
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 2 -> market_center_trading_action_message_record.orig[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.timestamp_1[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.feed_sequence[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.part_token[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> market_center_trading_action_message_record.symbol_long[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.action = wire[at]; at = at + 1;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.action_time[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Center Trading Action Message is what was written, byte for byte */
inline equal_market_center_trading_action_message(market_center_trading_action_message_read, market_center_trading_action_message_written) {
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 2 -> assert(market_center_trading_action_message_read.orig[market_center_trading_action_message_at] == market_center_trading_action_message_written.orig[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> assert(market_center_trading_action_message_read.timestamp_1[market_center_trading_action_message_at] == market_center_trading_action_message_written.timestamp_1[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> assert(market_center_trading_action_message_read.feed_sequence[market_center_trading_action_message_at] == market_center_trading_action_message_written.feed_sequence[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> assert(market_center_trading_action_message_read.part_token[market_center_trading_action_message_at] == market_center_trading_action_message_written.part_token[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> assert(market_center_trading_action_message_read.symbol_long[market_center_trading_action_message_at] == market_center_trading_action_message_written.symbol_long[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  assert(market_center_trading_action_message_read.action == market_center_trading_action_message_written.action);
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> assert(market_center_trading_action_message_read.action_time[market_center_trading_action_message_at] == market_center_trading_action_message_written.action_time[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Center Mass Trading Action Message: 57 bytes --------------------- */

/* Market Center Mass Trading Action Message (AU). Applies action across a range of securities. No acknowledgement is returned. */
typedef MarketCenterMassTradingActionMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte first_security[11];
  byte last_security[11];
  byte action;
  byte action_time[8]
};

int market_center_mass_trading_action_message_at;

/* every byte of Market Center Mass Trading Action Message set to one value */
inline fill_market_center_mass_trading_action_message(market_center_mass_trading_action_message_record, market_center_mass_trading_action_message_value) {
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 2 -> market_center_mass_trading_action_message_record.orig[market_center_mass_trading_action_message_at] = market_center_mass_trading_action_message_value; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> market_center_mass_trading_action_message_record.timestamp_1[market_center_mass_trading_action_message_at] = market_center_mass_trading_action_message_value; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> market_center_mass_trading_action_message_record.feed_sequence[market_center_mass_trading_action_message_at] = market_center_mass_trading_action_message_value; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> market_center_mass_trading_action_message_record.part_token[market_center_mass_trading_action_message_at] = market_center_mass_trading_action_message_value; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 11 -> market_center_mass_trading_action_message_record.first_security[market_center_mass_trading_action_message_at] = market_center_mass_trading_action_message_value; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 11 -> market_center_mass_trading_action_message_record.last_security[market_center_mass_trading_action_message_at] = market_center_mass_trading_action_message_value; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_record.action = market_center_mass_trading_action_message_value;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> market_center_mass_trading_action_message_record.action_time[market_center_mass_trading_action_message_at] = market_center_mass_trading_action_message_value; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Center Mass Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_market_center_mass_trading_action_message(market_center_mass_trading_action_message_record, market_center_mass_trading_action_message_base) {
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 2 -> market_center_mass_trading_action_message_record.orig[market_center_mass_trading_action_message_at] = (market_center_mass_trading_action_message_base + 0 + market_center_mass_trading_action_message_at + 1) % 256; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> market_center_mass_trading_action_message_record.timestamp_1[market_center_mass_trading_action_message_at] = (market_center_mass_trading_action_message_base + 2 + market_center_mass_trading_action_message_at + 1) % 256; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> market_center_mass_trading_action_message_record.feed_sequence[market_center_mass_trading_action_message_at] = (market_center_mass_trading_action_message_base + 10 + market_center_mass_trading_action_message_at + 1) % 256; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> market_center_mass_trading_action_message_record.part_token[market_center_mass_trading_action_message_at] = (market_center_mass_trading_action_message_base + 18 + market_center_mass_trading_action_message_at + 1) % 256; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 11 -> market_center_mass_trading_action_message_record.first_security[market_center_mass_trading_action_message_at] = (market_center_mass_trading_action_message_base + 26 + market_center_mass_trading_action_message_at + 1) % 256; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 11 -> market_center_mass_trading_action_message_record.last_security[market_center_mass_trading_action_message_at] = (market_center_mass_trading_action_message_base + 37 + market_center_mass_trading_action_message_at + 1) % 256; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_record.action = (market_center_mass_trading_action_message_base + 48 + 1) % 256;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> market_center_mass_trading_action_message_record.action_time[market_center_mass_trading_action_message_at] = (market_center_mass_trading_action_message_base + 49 + market_center_mass_trading_action_message_at + 1) % 256; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Center Mass Trading Action Message to the wire, 57 bytes from where the cursor stands */
inline encode_market_center_mass_trading_action_message(market_center_mass_trading_action_message_record) {
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 2 -> wire[at] = market_center_mass_trading_action_message_record.orig[market_center_mass_trading_action_message_at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> wire[at] = market_center_mass_trading_action_message_record.timestamp_1[market_center_mass_trading_action_message_at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> wire[at] = market_center_mass_trading_action_message_record.feed_sequence[market_center_mass_trading_action_message_at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> wire[at] = market_center_mass_trading_action_message_record.part_token[market_center_mass_trading_action_message_at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 11 -> wire[at] = market_center_mass_trading_action_message_record.first_security[market_center_mass_trading_action_message_at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 11 -> wire[at] = market_center_mass_trading_action_message_record.last_security[market_center_mass_trading_action_message_at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = market_center_mass_trading_action_message_record.action; at = at + 1;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> wire[at] = market_center_mass_trading_action_message_record.action_time[market_center_mass_trading_action_message_at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Center Mass Trading Action Message off the wire, 57 bytes from where the cursor stands */
inline decode_market_center_mass_trading_action_message(market_center_mass_trading_action_message_record) {
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 2 -> market_center_mass_trading_action_message_record.orig[market_center_mass_trading_action_message_at] = wire[at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> market_center_mass_trading_action_message_record.timestamp_1[market_center_mass_trading_action_message_at] = wire[at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> market_center_mass_trading_action_message_record.feed_sequence[market_center_mass_trading_action_message_at] = wire[at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> market_center_mass_trading_action_message_record.part_token[market_center_mass_trading_action_message_at] = wire[at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 11 -> market_center_mass_trading_action_message_record.first_security[market_center_mass_trading_action_message_at] = wire[at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 11 -> market_center_mass_trading_action_message_record.last_security[market_center_mass_trading_action_message_at] = wire[at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_record.action = wire[at]; at = at + 1;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> market_center_mass_trading_action_message_record.action_time[market_center_mass_trading_action_message_at] = wire[at]; at = at + 1; market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Center Mass Trading Action Message is what was written, byte for byte */
inline equal_market_center_mass_trading_action_message(market_center_mass_trading_action_message_read, market_center_mass_trading_action_message_written) {
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 2 -> assert(market_center_mass_trading_action_message_read.orig[market_center_mass_trading_action_message_at] == market_center_mass_trading_action_message_written.orig[market_center_mass_trading_action_message_at]); market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> assert(market_center_mass_trading_action_message_read.timestamp_1[market_center_mass_trading_action_message_at] == market_center_mass_trading_action_message_written.timestamp_1[market_center_mass_trading_action_message_at]); market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> assert(market_center_mass_trading_action_message_read.feed_sequence[market_center_mass_trading_action_message_at] == market_center_mass_trading_action_message_written.feed_sequence[market_center_mass_trading_action_message_at]); market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> assert(market_center_mass_trading_action_message_read.part_token[market_center_mass_trading_action_message_at] == market_center_mass_trading_action_message_written.part_token[market_center_mass_trading_action_message_at]); market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 11 -> assert(market_center_mass_trading_action_message_read.first_security[market_center_mass_trading_action_message_at] == market_center_mass_trading_action_message_written.first_security[market_center_mass_trading_action_message_at]); market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 11 -> assert(market_center_mass_trading_action_message_read.last_security[market_center_mass_trading_action_message_at] == market_center_mass_trading_action_message_written.last_security[market_center_mass_trading_action_message_at]); market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  assert(market_center_mass_trading_action_message_read.action == market_center_mass_trading_action_message_written.action);
  market_center_mass_trading_action_message_at = 0;
  do
  :: market_center_mass_trading_action_message_at < 8 -> assert(market_center_mass_trading_action_message_read.action_time[market_center_mass_trading_action_message_at] == market_center_mass_trading_action_message_written.action_time[market_center_mass_trading_action_message_at]); market_center_mass_trading_action_message_at = market_center_mass_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reg Sho Short Sale Price Test Restricted Indicator Message: 38 bytes ---- */

/* Reg SHO Short Sale Price Test Restricted Indicator Message (AV). Notifies that a security has breached the short sale price test threshold. */
typedef RegShoShortSalePriceTestRestrictedIndicatorMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte symbol_long[11];
  byte action
};

int reg_sho_short_sale_price_test_restricted_indicator_message_at;

/* every byte of Reg Sho Short Sale Price Test Restricted Indicator Message set to one value */
inline fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record, reg_sho_short_sale_price_test_restricted_indicator_message_value) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.orig[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.feed_sequence[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.part_token[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.symbol_long[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.action = reg_sho_short_sale_price_test_restricted_indicator_message_value;
  skip
}

/* each byte of Reg Sho Short Sale Price Test Restricted Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record, reg_sho_short_sale_price_test_restricted_indicator_message_base) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.orig[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 0 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 2 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.feed_sequence[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 10 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.part_token[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 18 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.symbol_long[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 26 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.action = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 37 + 1) % 256;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message to the wire, 38 bytes from where the cursor stands */
inline encode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.orig[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.feed_sequence[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.part_token[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.symbol_long[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.action; at = at + 1;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message off the wire, 38 bytes from where the cursor stands */
inline decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.orig[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.feed_sequence[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.part_token[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.symbol_long[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.action = wire[at]; at = at + 1;
  skip
}

/* what was read of Reg Sho Short Sale Price Test Restricted Indicator Message is what was written, byte for byte */
inline equal_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_read, reg_sho_short_sale_price_test_restricted_indicator_message_written) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.orig[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.orig[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.feed_sequence[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.feed_sequence[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.part_token[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.part_token[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.symbol_long[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.symbol_long[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.action == reg_sho_short_sale_price_test_restricted_indicator_message_written.action);
  skip
}

/* ---- Opening Reference Midpoint Price Message: 45 bytes ---------------------- */

/* Opening Reference Midpoint Price Message (AM). Listing market provides midpoint reference price for LULD calculations. */
typedef OpeningReferenceMidpointPriceMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte symbol_long[11];
  byte price[8]
};

int opening_reference_midpoint_price_message_at;

/* every byte of Opening Reference Midpoint Price Message set to one value */
inline fill_opening_reference_midpoint_price_message(opening_reference_midpoint_price_message_record, opening_reference_midpoint_price_message_value) {
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 2 -> opening_reference_midpoint_price_message_record.orig[opening_reference_midpoint_price_message_at] = opening_reference_midpoint_price_message_value; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> opening_reference_midpoint_price_message_record.timestamp_1[opening_reference_midpoint_price_message_at] = opening_reference_midpoint_price_message_value; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> opening_reference_midpoint_price_message_record.feed_sequence[opening_reference_midpoint_price_message_at] = opening_reference_midpoint_price_message_value; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> opening_reference_midpoint_price_message_record.part_token[opening_reference_midpoint_price_message_at] = opening_reference_midpoint_price_message_value; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 11 -> opening_reference_midpoint_price_message_record.symbol_long[opening_reference_midpoint_price_message_at] = opening_reference_midpoint_price_message_value; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> opening_reference_midpoint_price_message_record.price[opening_reference_midpoint_price_message_at] = opening_reference_midpoint_price_message_value; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Opening Reference Midpoint Price Message set to where it lies, so a field read out of place says so */
inline ramp_opening_reference_midpoint_price_message(opening_reference_midpoint_price_message_record, opening_reference_midpoint_price_message_base) {
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 2 -> opening_reference_midpoint_price_message_record.orig[opening_reference_midpoint_price_message_at] = (opening_reference_midpoint_price_message_base + 0 + opening_reference_midpoint_price_message_at + 1) % 256; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> opening_reference_midpoint_price_message_record.timestamp_1[opening_reference_midpoint_price_message_at] = (opening_reference_midpoint_price_message_base + 2 + opening_reference_midpoint_price_message_at + 1) % 256; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> opening_reference_midpoint_price_message_record.feed_sequence[opening_reference_midpoint_price_message_at] = (opening_reference_midpoint_price_message_base + 10 + opening_reference_midpoint_price_message_at + 1) % 256; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> opening_reference_midpoint_price_message_record.part_token[opening_reference_midpoint_price_message_at] = (opening_reference_midpoint_price_message_base + 18 + opening_reference_midpoint_price_message_at + 1) % 256; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 11 -> opening_reference_midpoint_price_message_record.symbol_long[opening_reference_midpoint_price_message_at] = (opening_reference_midpoint_price_message_base + 26 + opening_reference_midpoint_price_message_at + 1) % 256; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> opening_reference_midpoint_price_message_record.price[opening_reference_midpoint_price_message_at] = (opening_reference_midpoint_price_message_base + 37 + opening_reference_midpoint_price_message_at + 1) % 256; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Reference Midpoint Price Message to the wire, 45 bytes from where the cursor stands */
inline encode_opening_reference_midpoint_price_message(opening_reference_midpoint_price_message_record) {
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 2 -> wire[at] = opening_reference_midpoint_price_message_record.orig[opening_reference_midpoint_price_message_at]; at = at + 1; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> wire[at] = opening_reference_midpoint_price_message_record.timestamp_1[opening_reference_midpoint_price_message_at]; at = at + 1; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> wire[at] = opening_reference_midpoint_price_message_record.feed_sequence[opening_reference_midpoint_price_message_at]; at = at + 1; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> wire[at] = opening_reference_midpoint_price_message_record.part_token[opening_reference_midpoint_price_message_at]; at = at + 1; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 11 -> wire[at] = opening_reference_midpoint_price_message_record.symbol_long[opening_reference_midpoint_price_message_at]; at = at + 1; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> wire[at] = opening_reference_midpoint_price_message_record.price[opening_reference_midpoint_price_message_at]; at = at + 1; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Reference Midpoint Price Message off the wire, 45 bytes from where the cursor stands */
inline decode_opening_reference_midpoint_price_message(opening_reference_midpoint_price_message_record) {
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 2 -> opening_reference_midpoint_price_message_record.orig[opening_reference_midpoint_price_message_at] = wire[at]; at = at + 1; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> opening_reference_midpoint_price_message_record.timestamp_1[opening_reference_midpoint_price_message_at] = wire[at]; at = at + 1; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> opening_reference_midpoint_price_message_record.feed_sequence[opening_reference_midpoint_price_message_at] = wire[at]; at = at + 1; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> opening_reference_midpoint_price_message_record.part_token[opening_reference_midpoint_price_message_at] = wire[at]; at = at + 1; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 11 -> opening_reference_midpoint_price_message_record.symbol_long[opening_reference_midpoint_price_message_at] = wire[at]; at = at + 1; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> opening_reference_midpoint_price_message_record.price[opening_reference_midpoint_price_message_at] = wire[at]; at = at + 1; opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Opening Reference Midpoint Price Message is what was written, byte for byte */
inline equal_opening_reference_midpoint_price_message(opening_reference_midpoint_price_message_read, opening_reference_midpoint_price_message_written) {
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 2 -> assert(opening_reference_midpoint_price_message_read.orig[opening_reference_midpoint_price_message_at] == opening_reference_midpoint_price_message_written.orig[opening_reference_midpoint_price_message_at]); opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> assert(opening_reference_midpoint_price_message_read.timestamp_1[opening_reference_midpoint_price_message_at] == opening_reference_midpoint_price_message_written.timestamp_1[opening_reference_midpoint_price_message_at]); opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> assert(opening_reference_midpoint_price_message_read.feed_sequence[opening_reference_midpoint_price_message_at] == opening_reference_midpoint_price_message_written.feed_sequence[opening_reference_midpoint_price_message_at]); opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> assert(opening_reference_midpoint_price_message_read.part_token[opening_reference_midpoint_price_message_at] == opening_reference_midpoint_price_message_written.part_token[opening_reference_midpoint_price_message_at]); opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 11 -> assert(opening_reference_midpoint_price_message_read.symbol_long[opening_reference_midpoint_price_message_at] == opening_reference_midpoint_price_message_written.symbol_long[opening_reference_midpoint_price_message_at]); opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  opening_reference_midpoint_price_message_at = 0;
  do
  :: opening_reference_midpoint_price_message_at < 8 -> assert(opening_reference_midpoint_price_message_read.price[opening_reference_midpoint_price_message_at] == opening_reference_midpoint_price_message_written.price[opening_reference_midpoint_price_message_at]); opening_reference_midpoint_price_message_at = opening_reference_midpoint_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- T 1 Adjusted Closing Price Message: 45 bytes ---------------------------- */

/* T1 Adjusted Closing Price Message (AN). Listing market provides closing price for LULD calculations. */
typedef T1AdjustedClosingPriceMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte symbol_long[11];
  byte price[8]
};

int t1_adjusted_closing_price_message_at;

/* every byte of T 1 Adjusted Closing Price Message set to one value */
inline fill_t1_adjusted_closing_price_message(t1_adjusted_closing_price_message_record, t1_adjusted_closing_price_message_value) {
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 2 -> t1_adjusted_closing_price_message_record.orig[t1_adjusted_closing_price_message_at] = t1_adjusted_closing_price_message_value; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> t1_adjusted_closing_price_message_record.timestamp_1[t1_adjusted_closing_price_message_at] = t1_adjusted_closing_price_message_value; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> t1_adjusted_closing_price_message_record.feed_sequence[t1_adjusted_closing_price_message_at] = t1_adjusted_closing_price_message_value; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> t1_adjusted_closing_price_message_record.part_token[t1_adjusted_closing_price_message_at] = t1_adjusted_closing_price_message_value; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 11 -> t1_adjusted_closing_price_message_record.symbol_long[t1_adjusted_closing_price_message_at] = t1_adjusted_closing_price_message_value; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> t1_adjusted_closing_price_message_record.price[t1_adjusted_closing_price_message_at] = t1_adjusted_closing_price_message_value; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of T 1 Adjusted Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_t1_adjusted_closing_price_message(t1_adjusted_closing_price_message_record, t1_adjusted_closing_price_message_base) {
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 2 -> t1_adjusted_closing_price_message_record.orig[t1_adjusted_closing_price_message_at] = (t1_adjusted_closing_price_message_base + 0 + t1_adjusted_closing_price_message_at + 1) % 256; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> t1_adjusted_closing_price_message_record.timestamp_1[t1_adjusted_closing_price_message_at] = (t1_adjusted_closing_price_message_base + 2 + t1_adjusted_closing_price_message_at + 1) % 256; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> t1_adjusted_closing_price_message_record.feed_sequence[t1_adjusted_closing_price_message_at] = (t1_adjusted_closing_price_message_base + 10 + t1_adjusted_closing_price_message_at + 1) % 256; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> t1_adjusted_closing_price_message_record.part_token[t1_adjusted_closing_price_message_at] = (t1_adjusted_closing_price_message_base + 18 + t1_adjusted_closing_price_message_at + 1) % 256; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 11 -> t1_adjusted_closing_price_message_record.symbol_long[t1_adjusted_closing_price_message_at] = (t1_adjusted_closing_price_message_base + 26 + t1_adjusted_closing_price_message_at + 1) % 256; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> t1_adjusted_closing_price_message_record.price[t1_adjusted_closing_price_message_at] = (t1_adjusted_closing_price_message_base + 37 + t1_adjusted_closing_price_message_at + 1) % 256; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* T 1 Adjusted Closing Price Message to the wire, 45 bytes from where the cursor stands */
inline encode_t1_adjusted_closing_price_message(t1_adjusted_closing_price_message_record) {
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 2 -> wire[at] = t1_adjusted_closing_price_message_record.orig[t1_adjusted_closing_price_message_at]; at = at + 1; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> wire[at] = t1_adjusted_closing_price_message_record.timestamp_1[t1_adjusted_closing_price_message_at]; at = at + 1; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> wire[at] = t1_adjusted_closing_price_message_record.feed_sequence[t1_adjusted_closing_price_message_at]; at = at + 1; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> wire[at] = t1_adjusted_closing_price_message_record.part_token[t1_adjusted_closing_price_message_at]; at = at + 1; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 11 -> wire[at] = t1_adjusted_closing_price_message_record.symbol_long[t1_adjusted_closing_price_message_at]; at = at + 1; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> wire[at] = t1_adjusted_closing_price_message_record.price[t1_adjusted_closing_price_message_at]; at = at + 1; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* T 1 Adjusted Closing Price Message off the wire, 45 bytes from where the cursor stands */
inline decode_t1_adjusted_closing_price_message(t1_adjusted_closing_price_message_record) {
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 2 -> t1_adjusted_closing_price_message_record.orig[t1_adjusted_closing_price_message_at] = wire[at]; at = at + 1; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> t1_adjusted_closing_price_message_record.timestamp_1[t1_adjusted_closing_price_message_at] = wire[at]; at = at + 1; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> t1_adjusted_closing_price_message_record.feed_sequence[t1_adjusted_closing_price_message_at] = wire[at]; at = at + 1; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> t1_adjusted_closing_price_message_record.part_token[t1_adjusted_closing_price_message_at] = wire[at]; at = at + 1; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 11 -> t1_adjusted_closing_price_message_record.symbol_long[t1_adjusted_closing_price_message_at] = wire[at]; at = at + 1; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> t1_adjusted_closing_price_message_record.price[t1_adjusted_closing_price_message_at] = wire[at]; at = at + 1; t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of T 1 Adjusted Closing Price Message is what was written, byte for byte */
inline equal_t1_adjusted_closing_price_message(t1_adjusted_closing_price_message_read, t1_adjusted_closing_price_message_written) {
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 2 -> assert(t1_adjusted_closing_price_message_read.orig[t1_adjusted_closing_price_message_at] == t1_adjusted_closing_price_message_written.orig[t1_adjusted_closing_price_message_at]); t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> assert(t1_adjusted_closing_price_message_read.timestamp_1[t1_adjusted_closing_price_message_at] == t1_adjusted_closing_price_message_written.timestamp_1[t1_adjusted_closing_price_message_at]); t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> assert(t1_adjusted_closing_price_message_read.feed_sequence[t1_adjusted_closing_price_message_at] == t1_adjusted_closing_price_message_written.feed_sequence[t1_adjusted_closing_price_message_at]); t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> assert(t1_adjusted_closing_price_message_read.part_token[t1_adjusted_closing_price_message_at] == t1_adjusted_closing_price_message_written.part_token[t1_adjusted_closing_price_message_at]); t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 11 -> assert(t1_adjusted_closing_price_message_read.symbol_long[t1_adjusted_closing_price_message_at] == t1_adjusted_closing_price_message_written.symbol_long[t1_adjusted_closing_price_message_at]); t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  t1_adjusted_closing_price_message_at = 0;
  do
  :: t1_adjusted_closing_price_message_at < 8 -> assert(t1_adjusted_closing_price_message_read.price[t1_adjusted_closing_price_message_at] == t1_adjusted_closing_price_message_written.price[t1_adjusted_closing_price_message_at]); t1_adjusted_closing_price_message_at = t1_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Open Message: 26 bytes ------------------------------------------- */

/* Market Open Message (AX). Indicates participant quotes should be marked as opened. */
typedef MarketOpenMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8]
};

int market_open_message_at;

/* every byte of Market Open Message set to one value */
inline fill_market_open_message(market_open_message_record, market_open_message_value) {
  market_open_message_at = 0;
  do
  :: market_open_message_at < 2 -> market_open_message_record.orig[market_open_message_at] = market_open_message_value; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.timestamp_1[market_open_message_at] = market_open_message_value; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.feed_sequence[market_open_message_at] = market_open_message_value; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.part_token[market_open_message_at] = market_open_message_value; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Open Message set to where it lies, so a field read out of place says so */
inline ramp_market_open_message(market_open_message_record, market_open_message_base) {
  market_open_message_at = 0;
  do
  :: market_open_message_at < 2 -> market_open_message_record.orig[market_open_message_at] = (market_open_message_base + 0 + market_open_message_at + 1) % 256; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.timestamp_1[market_open_message_at] = (market_open_message_base + 2 + market_open_message_at + 1) % 256; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.feed_sequence[market_open_message_at] = (market_open_message_base + 10 + market_open_message_at + 1) % 256; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.part_token[market_open_message_at] = (market_open_message_base + 18 + market_open_message_at + 1) % 256; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Open Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_open_message(market_open_message_record) {
  market_open_message_at = 0;
  do
  :: market_open_message_at < 2 -> wire[at] = market_open_message_record.orig[market_open_message_at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> wire[at] = market_open_message_record.timestamp_1[market_open_message_at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> wire[at] = market_open_message_record.feed_sequence[market_open_message_at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> wire[at] = market_open_message_record.part_token[market_open_message_at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Open Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_open_message(market_open_message_record) {
  market_open_message_at = 0;
  do
  :: market_open_message_at < 2 -> market_open_message_record.orig[market_open_message_at] = wire[at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.timestamp_1[market_open_message_at] = wire[at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.feed_sequence[market_open_message_at] = wire[at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.part_token[market_open_message_at] = wire[at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Open Message is what was written, byte for byte */
inline equal_market_open_message(market_open_message_read, market_open_message_written) {
  market_open_message_at = 0;
  do
  :: market_open_message_at < 2 -> assert(market_open_message_read.orig[market_open_message_at] == market_open_message_written.orig[market_open_message_at]); market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> assert(market_open_message_read.timestamp_1[market_open_message_at] == market_open_message_written.timestamp_1[market_open_message_at]); market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> assert(market_open_message_read.feed_sequence[market_open_message_at] == market_open_message_written.feed_sequence[market_open_message_at]); market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> assert(market_open_message_read.part_token[market_open_message_at] == market_open_message_written.part_token[market_open_message_at]); market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Closed Message: 26 bytes ----------------------------------------- */

/* Market Closed Message (AY). Indicates the trading session is ready to close. */
typedef MarketClosedMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8]
};

int market_closed_message_at;

/* every byte of Market Closed Message set to one value */
inline fill_market_closed_message(market_closed_message_record, market_closed_message_value) {
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 2 -> market_closed_message_record.orig[market_closed_message_at] = market_closed_message_value; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> market_closed_message_record.timestamp_1[market_closed_message_at] = market_closed_message_value; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> market_closed_message_record.feed_sequence[market_closed_message_at] = market_closed_message_value; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> market_closed_message_record.part_token[market_closed_message_at] = market_closed_message_value; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Closed Message set to where it lies, so a field read out of place says so */
inline ramp_market_closed_message(market_closed_message_record, market_closed_message_base) {
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 2 -> market_closed_message_record.orig[market_closed_message_at] = (market_closed_message_base + 0 + market_closed_message_at + 1) % 256; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> market_closed_message_record.timestamp_1[market_closed_message_at] = (market_closed_message_base + 2 + market_closed_message_at + 1) % 256; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> market_closed_message_record.feed_sequence[market_closed_message_at] = (market_closed_message_base + 10 + market_closed_message_at + 1) % 256; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> market_closed_message_record.part_token[market_closed_message_at] = (market_closed_message_base + 18 + market_closed_message_at + 1) % 256; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Closed Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_closed_message(market_closed_message_record) {
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 2 -> wire[at] = market_closed_message_record.orig[market_closed_message_at]; at = at + 1; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> wire[at] = market_closed_message_record.timestamp_1[market_closed_message_at]; at = at + 1; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> wire[at] = market_closed_message_record.feed_sequence[market_closed_message_at]; at = at + 1; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> wire[at] = market_closed_message_record.part_token[market_closed_message_at]; at = at + 1; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Closed Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_closed_message(market_closed_message_record) {
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 2 -> market_closed_message_record.orig[market_closed_message_at] = wire[at]; at = at + 1; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> market_closed_message_record.timestamp_1[market_closed_message_at] = wire[at]; at = at + 1; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> market_closed_message_record.feed_sequence[market_closed_message_at] = wire[at]; at = at + 1; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> market_closed_message_record.part_token[market_closed_message_at] = wire[at]; at = at + 1; market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Closed Message is what was written, byte for byte */
inline equal_market_closed_message(market_closed_message_read, market_closed_message_written) {
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 2 -> assert(market_closed_message_read.orig[market_closed_message_at] == market_closed_message_written.orig[market_closed_message_at]); market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> assert(market_closed_message_read.timestamp_1[market_closed_message_at] == market_closed_message_written.timestamp_1[market_closed_message_at]); market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> assert(market_closed_message_read.feed_sequence[market_closed_message_at] == market_closed_message_written.feed_sequence[market_closed_message_at]); market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  market_closed_message_at = 0;
  do
  :: market_closed_message_at < 8 -> assert(market_closed_message_read.part_token[market_closed_message_at] == market_closed_message_written.part_token[market_closed_message_at]); market_closed_message_at = market_closed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Collar Message: 66 bytes ---------------------------------------- */

/* Auction Collar Message (AE). Listing market provides new Price Protection Limits used during LULD trading pauses (and during extended operational hours). */
typedef AuctionCollarMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte symbol_long[11];
  byte action_sequence[4];
  byte collar_reference_price[8];
  byte collar_up_price[8];
  byte collar_down_price[8];
  byte collar_extension
};

int auction_collar_message_at;

/* every byte of Auction Collar Message set to one value */
inline fill_auction_collar_message(auction_collar_message_record, auction_collar_message_value) {
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 2 -> auction_collar_message_record.orig[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.timestamp_1[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.feed_sequence[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.part_token[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> auction_collar_message_record.symbol_long[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> auction_collar_message_record.action_sequence[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_reference_price[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_up_price[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_down_price[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_record.collar_extension = auction_collar_message_value;
  skip
}

/* each byte of Auction Collar Message set to where it lies, so a field read out of place says so */
inline ramp_auction_collar_message(auction_collar_message_record, auction_collar_message_base) {
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 2 -> auction_collar_message_record.orig[auction_collar_message_at] = (auction_collar_message_base + 0 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.timestamp_1[auction_collar_message_at] = (auction_collar_message_base + 2 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.feed_sequence[auction_collar_message_at] = (auction_collar_message_base + 10 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.part_token[auction_collar_message_at] = (auction_collar_message_base + 18 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> auction_collar_message_record.symbol_long[auction_collar_message_at] = (auction_collar_message_base + 26 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> auction_collar_message_record.action_sequence[auction_collar_message_at] = (auction_collar_message_base + 37 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_reference_price[auction_collar_message_at] = (auction_collar_message_base + 41 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_up_price[auction_collar_message_at] = (auction_collar_message_base + 49 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_down_price[auction_collar_message_at] = (auction_collar_message_base + 57 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_record.collar_extension = (auction_collar_message_base + 65 + 1) % 256;
  skip
}

/* Auction Collar Message to the wire, 66 bytes from where the cursor stands */
inline encode_auction_collar_message(auction_collar_message_record) {
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 2 -> wire[at] = auction_collar_message_record.orig[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.timestamp_1[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.feed_sequence[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.part_token[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> wire[at] = auction_collar_message_record.symbol_long[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> wire[at] = auction_collar_message_record.action_sequence[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.collar_reference_price[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.collar_up_price[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.collar_down_price[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_collar_message_record.collar_extension; at = at + 1;
  skip
}

/* Auction Collar Message off the wire, 66 bytes from where the cursor stands */
inline decode_auction_collar_message(auction_collar_message_record) {
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 2 -> auction_collar_message_record.orig[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.timestamp_1[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.feed_sequence[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.part_token[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> auction_collar_message_record.symbol_long[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> auction_collar_message_record.action_sequence[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_reference_price[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_up_price[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_down_price[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_record.collar_extension = wire[at]; at = at + 1;
  skip
}

/* what was read of Auction Collar Message is what was written, byte for byte */
inline equal_auction_collar_message(auction_collar_message_read, auction_collar_message_written) {
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 2 -> assert(auction_collar_message_read.orig[auction_collar_message_at] == auction_collar_message_written.orig[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.timestamp_1[auction_collar_message_at] == auction_collar_message_written.timestamp_1[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.feed_sequence[auction_collar_message_at] == auction_collar_message_written.feed_sequence[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.part_token[auction_collar_message_at] == auction_collar_message_written.part_token[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> assert(auction_collar_message_read.symbol_long[auction_collar_message_at] == auction_collar_message_written.symbol_long[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> assert(auction_collar_message_read.action_sequence[auction_collar_message_at] == auction_collar_message_written.action_sequence[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.collar_reference_price[auction_collar_message_at] == auction_collar_message_written.collar_reference_price[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.collar_up_price[auction_collar_message_at] == auction_collar_message_written.collar_up_price[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.collar_down_price[auction_collar_message_at] == auction_collar_message_written.collar_down_price[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  assert(auction_collar_message_read.collar_extension == auction_collar_message_written.collar_extension);
  skip
}

/* ---- Sequence Inquiry Message: 26 bytes -------------------------------------- */

/* Sequence Inquiry Message (CC). Participant requests current expected sequence number from SIP. */
typedef SequenceInquiryMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8]
};

int sequence_inquiry_message_at;

/* every byte of Sequence Inquiry Message set to one value */
inline fill_sequence_inquiry_message(sequence_inquiry_message_record, sequence_inquiry_message_value) {
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 2 -> sequence_inquiry_message_record.orig[sequence_inquiry_message_at] = sequence_inquiry_message_value; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> sequence_inquiry_message_record.timestamp_1[sequence_inquiry_message_at] = sequence_inquiry_message_value; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> sequence_inquiry_message_record.feed_sequence[sequence_inquiry_message_at] = sequence_inquiry_message_value; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> sequence_inquiry_message_record.part_token[sequence_inquiry_message_at] = sequence_inquiry_message_value; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Inquiry Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_inquiry_message(sequence_inquiry_message_record, sequence_inquiry_message_base) {
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 2 -> sequence_inquiry_message_record.orig[sequence_inquiry_message_at] = (sequence_inquiry_message_base + 0 + sequence_inquiry_message_at + 1) % 256; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> sequence_inquiry_message_record.timestamp_1[sequence_inquiry_message_at] = (sequence_inquiry_message_base + 2 + sequence_inquiry_message_at + 1) % 256; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> sequence_inquiry_message_record.feed_sequence[sequence_inquiry_message_at] = (sequence_inquiry_message_base + 10 + sequence_inquiry_message_at + 1) % 256; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> sequence_inquiry_message_record.part_token[sequence_inquiry_message_at] = (sequence_inquiry_message_base + 18 + sequence_inquiry_message_at + 1) % 256; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Inquiry Message to the wire, 26 bytes from where the cursor stands */
inline encode_sequence_inquiry_message(sequence_inquiry_message_record) {
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 2 -> wire[at] = sequence_inquiry_message_record.orig[sequence_inquiry_message_at]; at = at + 1; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> wire[at] = sequence_inquiry_message_record.timestamp_1[sequence_inquiry_message_at]; at = at + 1; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> wire[at] = sequence_inquiry_message_record.feed_sequence[sequence_inquiry_message_at]; at = at + 1; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> wire[at] = sequence_inquiry_message_record.part_token[sequence_inquiry_message_at]; at = at + 1; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Inquiry Message off the wire, 26 bytes from where the cursor stands */
inline decode_sequence_inquiry_message(sequence_inquiry_message_record) {
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 2 -> sequence_inquiry_message_record.orig[sequence_inquiry_message_at] = wire[at]; at = at + 1; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> sequence_inquiry_message_record.timestamp_1[sequence_inquiry_message_at] = wire[at]; at = at + 1; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> sequence_inquiry_message_record.feed_sequence[sequence_inquiry_message_at] = wire[at]; at = at + 1; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> sequence_inquiry_message_record.part_token[sequence_inquiry_message_at] = wire[at]; at = at + 1; sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Inquiry Message is what was written, byte for byte */
inline equal_sequence_inquiry_message(sequence_inquiry_message_read, sequence_inquiry_message_written) {
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 2 -> assert(sequence_inquiry_message_read.orig[sequence_inquiry_message_at] == sequence_inquiry_message_written.orig[sequence_inquiry_message_at]); sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> assert(sequence_inquiry_message_read.timestamp_1[sequence_inquiry_message_at] == sequence_inquiry_message_written.timestamp_1[sequence_inquiry_message_at]); sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> assert(sequence_inquiry_message_read.feed_sequence[sequence_inquiry_message_at] == sequence_inquiry_message_written.feed_sequence[sequence_inquiry_message_at]); sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_message_at = 0;
  do
  :: sequence_inquiry_message_at < 8 -> assert(sequence_inquiry_message_read.part_token[sequence_inquiry_message_at] == sequence_inquiry_message_written.part_token[sequence_inquiry_message_at]); sequence_inquiry_message_at = sequence_inquiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol State Inquiry Message: 37 bytes ---------------------------------- */

/* Symbol State Inquiry Message (CS). Participant requests current per-symbol state from SIP. */
typedef SymbolStateInquiryMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte symbol_long[11]
};

int symbol_state_inquiry_message_at;

/* every byte of Symbol State Inquiry Message set to one value */
inline fill_symbol_state_inquiry_message(symbol_state_inquiry_message_record, symbol_state_inquiry_message_value) {
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 2 -> symbol_state_inquiry_message_record.orig[symbol_state_inquiry_message_at] = symbol_state_inquiry_message_value; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> symbol_state_inquiry_message_record.timestamp_1[symbol_state_inquiry_message_at] = symbol_state_inquiry_message_value; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> symbol_state_inquiry_message_record.feed_sequence[symbol_state_inquiry_message_at] = symbol_state_inquiry_message_value; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> symbol_state_inquiry_message_record.part_token[symbol_state_inquiry_message_at] = symbol_state_inquiry_message_value; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 11 -> symbol_state_inquiry_message_record.symbol_long[symbol_state_inquiry_message_at] = symbol_state_inquiry_message_value; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol State Inquiry Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_state_inquiry_message(symbol_state_inquiry_message_record, symbol_state_inquiry_message_base) {
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 2 -> symbol_state_inquiry_message_record.orig[symbol_state_inquiry_message_at] = (symbol_state_inquiry_message_base + 0 + symbol_state_inquiry_message_at + 1) % 256; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> symbol_state_inquiry_message_record.timestamp_1[symbol_state_inquiry_message_at] = (symbol_state_inquiry_message_base + 2 + symbol_state_inquiry_message_at + 1) % 256; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> symbol_state_inquiry_message_record.feed_sequence[symbol_state_inquiry_message_at] = (symbol_state_inquiry_message_base + 10 + symbol_state_inquiry_message_at + 1) % 256; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> symbol_state_inquiry_message_record.part_token[symbol_state_inquiry_message_at] = (symbol_state_inquiry_message_base + 18 + symbol_state_inquiry_message_at + 1) % 256; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 11 -> symbol_state_inquiry_message_record.symbol_long[symbol_state_inquiry_message_at] = (symbol_state_inquiry_message_base + 26 + symbol_state_inquiry_message_at + 1) % 256; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol State Inquiry Message to the wire, 37 bytes from where the cursor stands */
inline encode_symbol_state_inquiry_message(symbol_state_inquiry_message_record) {
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 2 -> wire[at] = symbol_state_inquiry_message_record.orig[symbol_state_inquiry_message_at]; at = at + 1; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> wire[at] = symbol_state_inquiry_message_record.timestamp_1[symbol_state_inquiry_message_at]; at = at + 1; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> wire[at] = symbol_state_inquiry_message_record.feed_sequence[symbol_state_inquiry_message_at]; at = at + 1; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> wire[at] = symbol_state_inquiry_message_record.part_token[symbol_state_inquiry_message_at]; at = at + 1; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 11 -> wire[at] = symbol_state_inquiry_message_record.symbol_long[symbol_state_inquiry_message_at]; at = at + 1; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol State Inquiry Message off the wire, 37 bytes from where the cursor stands */
inline decode_symbol_state_inquiry_message(symbol_state_inquiry_message_record) {
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 2 -> symbol_state_inquiry_message_record.orig[symbol_state_inquiry_message_at] = wire[at]; at = at + 1; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> symbol_state_inquiry_message_record.timestamp_1[symbol_state_inquiry_message_at] = wire[at]; at = at + 1; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> symbol_state_inquiry_message_record.feed_sequence[symbol_state_inquiry_message_at] = wire[at]; at = at + 1; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> symbol_state_inquiry_message_record.part_token[symbol_state_inquiry_message_at] = wire[at]; at = at + 1; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 11 -> symbol_state_inquiry_message_record.symbol_long[symbol_state_inquiry_message_at] = wire[at]; at = at + 1; symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol State Inquiry Message is what was written, byte for byte */
inline equal_symbol_state_inquiry_message(symbol_state_inquiry_message_read, symbol_state_inquiry_message_written) {
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 2 -> assert(symbol_state_inquiry_message_read.orig[symbol_state_inquiry_message_at] == symbol_state_inquiry_message_written.orig[symbol_state_inquiry_message_at]); symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> assert(symbol_state_inquiry_message_read.timestamp_1[symbol_state_inquiry_message_at] == symbol_state_inquiry_message_written.timestamp_1[symbol_state_inquiry_message_at]); symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> assert(symbol_state_inquiry_message_read.feed_sequence[symbol_state_inquiry_message_at] == symbol_state_inquiry_message_written.feed_sequence[symbol_state_inquiry_message_at]); symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 8 -> assert(symbol_state_inquiry_message_read.part_token[symbol_state_inquiry_message_at] == symbol_state_inquiry_message_written.part_token[symbol_state_inquiry_message_at]); symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_message_at = 0;
  do
  :: symbol_state_inquiry_message_at < 11 -> assert(symbol_state_inquiry_message_read.symbol_long[symbol_state_inquiry_message_at] == symbol_state_inquiry_message_written.symbol_long[symbol_state_inquiry_message_at]); symbol_state_inquiry_message_at = symbol_state_inquiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Participant Reporting Message: 26 bytes -------------------------- */

/* End Of Participant Reporting Message (CG). Participant signals it has finished reporting for the session. */
typedef EndOfParticipantReportingMessage {
  byte orig[2];
  byte timestamp_1[8];
  byte feed_sequence[8];
  byte part_token[8]
};

int end_of_participant_reporting_message_at;

/* every byte of End Of Participant Reporting Message set to one value */
inline fill_end_of_participant_reporting_message(end_of_participant_reporting_message_record, end_of_participant_reporting_message_value) {
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 2 -> end_of_participant_reporting_message_record.orig[end_of_participant_reporting_message_at] = end_of_participant_reporting_message_value; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> end_of_participant_reporting_message_record.timestamp_1[end_of_participant_reporting_message_at] = end_of_participant_reporting_message_value; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> end_of_participant_reporting_message_record.feed_sequence[end_of_participant_reporting_message_at] = end_of_participant_reporting_message_value; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> end_of_participant_reporting_message_record.part_token[end_of_participant_reporting_message_at] = end_of_participant_reporting_message_value; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Participant Reporting Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_participant_reporting_message(end_of_participant_reporting_message_record, end_of_participant_reporting_message_base) {
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 2 -> end_of_participant_reporting_message_record.orig[end_of_participant_reporting_message_at] = (end_of_participant_reporting_message_base + 0 + end_of_participant_reporting_message_at + 1) % 256; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> end_of_participant_reporting_message_record.timestamp_1[end_of_participant_reporting_message_at] = (end_of_participant_reporting_message_base + 2 + end_of_participant_reporting_message_at + 1) % 256; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> end_of_participant_reporting_message_record.feed_sequence[end_of_participant_reporting_message_at] = (end_of_participant_reporting_message_base + 10 + end_of_participant_reporting_message_at + 1) % 256; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> end_of_participant_reporting_message_record.part_token[end_of_participant_reporting_message_at] = (end_of_participant_reporting_message_base + 18 + end_of_participant_reporting_message_at + 1) % 256; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Participant Reporting Message to the wire, 26 bytes from where the cursor stands */
inline encode_end_of_participant_reporting_message(end_of_participant_reporting_message_record) {
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 2 -> wire[at] = end_of_participant_reporting_message_record.orig[end_of_participant_reporting_message_at]; at = at + 1; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> wire[at] = end_of_participant_reporting_message_record.timestamp_1[end_of_participant_reporting_message_at]; at = at + 1; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> wire[at] = end_of_participant_reporting_message_record.feed_sequence[end_of_participant_reporting_message_at]; at = at + 1; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> wire[at] = end_of_participant_reporting_message_record.part_token[end_of_participant_reporting_message_at]; at = at + 1; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Participant Reporting Message off the wire, 26 bytes from where the cursor stands */
inline decode_end_of_participant_reporting_message(end_of_participant_reporting_message_record) {
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 2 -> end_of_participant_reporting_message_record.orig[end_of_participant_reporting_message_at] = wire[at]; at = at + 1; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> end_of_participant_reporting_message_record.timestamp_1[end_of_participant_reporting_message_at] = wire[at]; at = at + 1; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> end_of_participant_reporting_message_record.feed_sequence[end_of_participant_reporting_message_at] = wire[at]; at = at + 1; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> end_of_participant_reporting_message_record.part_token[end_of_participant_reporting_message_at] = wire[at]; at = at + 1; end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Participant Reporting Message is what was written, byte for byte */
inline equal_end_of_participant_reporting_message(end_of_participant_reporting_message_read, end_of_participant_reporting_message_written) {
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 2 -> assert(end_of_participant_reporting_message_read.orig[end_of_participant_reporting_message_at] == end_of_participant_reporting_message_written.orig[end_of_participant_reporting_message_at]); end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> assert(end_of_participant_reporting_message_read.timestamp_1[end_of_participant_reporting_message_at] == end_of_participant_reporting_message_written.timestamp_1[end_of_participant_reporting_message_at]); end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> assert(end_of_participant_reporting_message_read.feed_sequence[end_of_participant_reporting_message_at] == end_of_participant_reporting_message_written.feed_sequence[end_of_participant_reporting_message_at]); end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  end_of_participant_reporting_message_at = 0;
  do
  :: end_of_participant_reporting_message_at < 8 -> assert(end_of_participant_reporting_message_read.part_token[end_of_participant_reporting_message_at] == end_of_participant_reporting_message_written.part_token[end_of_participant_reporting_message_at]); end_of_participant_reporting_message_at = end_of_participant_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Return Market Center Trading Action Acknowledgement Message: 30 bytes ---- */

/* Market Center Trading Action Acknowledgement Message (aJ). Acknowledges a Market Center Trading Action (AJ). */
typedef ReturnMarketCenterTradingActionAcknowledgementMessage {
  byte orig[2];
  byte sip_time[8];
  byte symbol_long[11];
  byte action;
  byte action_time[8]
};

int return_market_center_trading_action_acknowledgement_message_at;

/* every byte of Return Market Center Trading Action Acknowledgement Message set to one value */
inline fill_return_market_center_trading_action_acknowledgement_message(return_market_center_trading_action_acknowledgement_message_record, return_market_center_trading_action_acknowledgement_message_value) {
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 2 -> return_market_center_trading_action_acknowledgement_message_record.orig[return_market_center_trading_action_acknowledgement_message_at] = return_market_center_trading_action_acknowledgement_message_value; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 8 -> return_market_center_trading_action_acknowledgement_message_record.sip_time[return_market_center_trading_action_acknowledgement_message_at] = return_market_center_trading_action_acknowledgement_message_value; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 11 -> return_market_center_trading_action_acknowledgement_message_record.symbol_long[return_market_center_trading_action_acknowledgement_message_at] = return_market_center_trading_action_acknowledgement_message_value; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  return_market_center_trading_action_acknowledgement_message_record.action = return_market_center_trading_action_acknowledgement_message_value;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 8 -> return_market_center_trading_action_acknowledgement_message_record.action_time[return_market_center_trading_action_acknowledgement_message_at] = return_market_center_trading_action_acknowledgement_message_value; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Return Market Center Trading Action Acknowledgement Message set to where it lies, so a field read out of place says so */
inline ramp_return_market_center_trading_action_acknowledgement_message(return_market_center_trading_action_acknowledgement_message_record, return_market_center_trading_action_acknowledgement_message_base) {
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 2 -> return_market_center_trading_action_acknowledgement_message_record.orig[return_market_center_trading_action_acknowledgement_message_at] = (return_market_center_trading_action_acknowledgement_message_base + 0 + return_market_center_trading_action_acknowledgement_message_at + 1) % 256; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 8 -> return_market_center_trading_action_acknowledgement_message_record.sip_time[return_market_center_trading_action_acknowledgement_message_at] = (return_market_center_trading_action_acknowledgement_message_base + 2 + return_market_center_trading_action_acknowledgement_message_at + 1) % 256; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 11 -> return_market_center_trading_action_acknowledgement_message_record.symbol_long[return_market_center_trading_action_acknowledgement_message_at] = (return_market_center_trading_action_acknowledgement_message_base + 10 + return_market_center_trading_action_acknowledgement_message_at + 1) % 256; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  return_market_center_trading_action_acknowledgement_message_record.action = (return_market_center_trading_action_acknowledgement_message_base + 21 + 1) % 256;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 8 -> return_market_center_trading_action_acknowledgement_message_record.action_time[return_market_center_trading_action_acknowledgement_message_at] = (return_market_center_trading_action_acknowledgement_message_base + 22 + return_market_center_trading_action_acknowledgement_message_at + 1) % 256; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Return Market Center Trading Action Acknowledgement Message to the wire, 30 bytes from where the cursor stands */
inline encode_return_market_center_trading_action_acknowledgement_message(return_market_center_trading_action_acknowledgement_message_record) {
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 2 -> wire[at] = return_market_center_trading_action_acknowledgement_message_record.orig[return_market_center_trading_action_acknowledgement_message_at]; at = at + 1; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 8 -> wire[at] = return_market_center_trading_action_acknowledgement_message_record.sip_time[return_market_center_trading_action_acknowledgement_message_at]; at = at + 1; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 11 -> wire[at] = return_market_center_trading_action_acknowledgement_message_record.symbol_long[return_market_center_trading_action_acknowledgement_message_at]; at = at + 1; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = return_market_center_trading_action_acknowledgement_message_record.action; at = at + 1;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 8 -> wire[at] = return_market_center_trading_action_acknowledgement_message_record.action_time[return_market_center_trading_action_acknowledgement_message_at]; at = at + 1; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Return Market Center Trading Action Acknowledgement Message off the wire, 30 bytes from where the cursor stands */
inline decode_return_market_center_trading_action_acknowledgement_message(return_market_center_trading_action_acknowledgement_message_record) {
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 2 -> return_market_center_trading_action_acknowledgement_message_record.orig[return_market_center_trading_action_acknowledgement_message_at] = wire[at]; at = at + 1; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 8 -> return_market_center_trading_action_acknowledgement_message_record.sip_time[return_market_center_trading_action_acknowledgement_message_at] = wire[at]; at = at + 1; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 11 -> return_market_center_trading_action_acknowledgement_message_record.symbol_long[return_market_center_trading_action_acknowledgement_message_at] = wire[at]; at = at + 1; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  return_market_center_trading_action_acknowledgement_message_record.action = wire[at]; at = at + 1;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 8 -> return_market_center_trading_action_acknowledgement_message_record.action_time[return_market_center_trading_action_acknowledgement_message_at] = wire[at]; at = at + 1; return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Return Market Center Trading Action Acknowledgement Message is what was written, byte for byte */
inline equal_return_market_center_trading_action_acknowledgement_message(return_market_center_trading_action_acknowledgement_message_read, return_market_center_trading_action_acknowledgement_message_written) {
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 2 -> assert(return_market_center_trading_action_acknowledgement_message_read.orig[return_market_center_trading_action_acknowledgement_message_at] == return_market_center_trading_action_acknowledgement_message_written.orig[return_market_center_trading_action_acknowledgement_message_at]); return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 8 -> assert(return_market_center_trading_action_acknowledgement_message_read.sip_time[return_market_center_trading_action_acknowledgement_message_at] == return_market_center_trading_action_acknowledgement_message_written.sip_time[return_market_center_trading_action_acknowledgement_message_at]); return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 11 -> assert(return_market_center_trading_action_acknowledgement_message_read.symbol_long[return_market_center_trading_action_acknowledgement_message_at] == return_market_center_trading_action_acknowledgement_message_written.symbol_long[return_market_center_trading_action_acknowledgement_message_at]); return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(return_market_center_trading_action_acknowledgement_message_read.action == return_market_center_trading_action_acknowledgement_message_written.action);
  return_market_center_trading_action_acknowledgement_message_at = 0;
  do
  :: return_market_center_trading_action_acknowledgement_message_at < 8 -> assert(return_market_center_trading_action_acknowledgement_message_read.action_time[return_market_center_trading_action_acknowledgement_message_at] == return_market_center_trading_action_acknowledgement_message_written.action_time[return_market_center_trading_action_acknowledgement_message_at]); return_market_center_trading_action_acknowledgement_message_at = return_market_center_trading_action_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Return Market Open Message: 10 bytes ------------------------------------ */

/* Return Market Open Message (aX). SIP confirms market is open. */
typedef ReturnMarketOpenMessage {
  byte orig[2];
  byte sip_time[8]
};

int return_market_open_message_at;

/* every byte of Return Market Open Message set to one value */
inline fill_return_market_open_message(return_market_open_message_record, return_market_open_message_value) {
  return_market_open_message_at = 0;
  do
  :: return_market_open_message_at < 2 -> return_market_open_message_record.orig[return_market_open_message_at] = return_market_open_message_value; return_market_open_message_at = return_market_open_message_at + 1
  :: else -> break
  od;
  return_market_open_message_at = 0;
  do
  :: return_market_open_message_at < 8 -> return_market_open_message_record.sip_time[return_market_open_message_at] = return_market_open_message_value; return_market_open_message_at = return_market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Return Market Open Message set to where it lies, so a field read out of place says so */
inline ramp_return_market_open_message(return_market_open_message_record, return_market_open_message_base) {
  return_market_open_message_at = 0;
  do
  :: return_market_open_message_at < 2 -> return_market_open_message_record.orig[return_market_open_message_at] = (return_market_open_message_base + 0 + return_market_open_message_at + 1) % 256; return_market_open_message_at = return_market_open_message_at + 1
  :: else -> break
  od;
  return_market_open_message_at = 0;
  do
  :: return_market_open_message_at < 8 -> return_market_open_message_record.sip_time[return_market_open_message_at] = (return_market_open_message_base + 2 + return_market_open_message_at + 1) % 256; return_market_open_message_at = return_market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Return Market Open Message to the wire, 10 bytes from where the cursor stands */
inline encode_return_market_open_message(return_market_open_message_record) {
  return_market_open_message_at = 0;
  do
  :: return_market_open_message_at < 2 -> wire[at] = return_market_open_message_record.orig[return_market_open_message_at]; at = at + 1; return_market_open_message_at = return_market_open_message_at + 1
  :: else -> break
  od;
  return_market_open_message_at = 0;
  do
  :: return_market_open_message_at < 8 -> wire[at] = return_market_open_message_record.sip_time[return_market_open_message_at]; at = at + 1; return_market_open_message_at = return_market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Return Market Open Message off the wire, 10 bytes from where the cursor stands */
inline decode_return_market_open_message(return_market_open_message_record) {
  return_market_open_message_at = 0;
  do
  :: return_market_open_message_at < 2 -> return_market_open_message_record.orig[return_market_open_message_at] = wire[at]; at = at + 1; return_market_open_message_at = return_market_open_message_at + 1
  :: else -> break
  od;
  return_market_open_message_at = 0;
  do
  :: return_market_open_message_at < 8 -> return_market_open_message_record.sip_time[return_market_open_message_at] = wire[at]; at = at + 1; return_market_open_message_at = return_market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Return Market Open Message is what was written, byte for byte */
inline equal_return_market_open_message(return_market_open_message_read, return_market_open_message_written) {
  return_market_open_message_at = 0;
  do
  :: return_market_open_message_at < 2 -> assert(return_market_open_message_read.orig[return_market_open_message_at] == return_market_open_message_written.orig[return_market_open_message_at]); return_market_open_message_at = return_market_open_message_at + 1
  :: else -> break
  od;
  return_market_open_message_at = 0;
  do
  :: return_market_open_message_at < 8 -> assert(return_market_open_message_read.sip_time[return_market_open_message_at] == return_market_open_message_written.sip_time[return_market_open_message_at]); return_market_open_message_at = return_market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Return Market Closed Message: 10 bytes ---------------------------------- */

/* Return Market Closed Message (aY). SIP confirms market is closed. */
typedef ReturnMarketClosedMessage {
  byte orig[2];
  byte sip_time[8]
};

int return_market_closed_message_at;

/* every byte of Return Market Closed Message set to one value */
inline fill_return_market_closed_message(return_market_closed_message_record, return_market_closed_message_value) {
  return_market_closed_message_at = 0;
  do
  :: return_market_closed_message_at < 2 -> return_market_closed_message_record.orig[return_market_closed_message_at] = return_market_closed_message_value; return_market_closed_message_at = return_market_closed_message_at + 1
  :: else -> break
  od;
  return_market_closed_message_at = 0;
  do
  :: return_market_closed_message_at < 8 -> return_market_closed_message_record.sip_time[return_market_closed_message_at] = return_market_closed_message_value; return_market_closed_message_at = return_market_closed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Return Market Closed Message set to where it lies, so a field read out of place says so */
inline ramp_return_market_closed_message(return_market_closed_message_record, return_market_closed_message_base) {
  return_market_closed_message_at = 0;
  do
  :: return_market_closed_message_at < 2 -> return_market_closed_message_record.orig[return_market_closed_message_at] = (return_market_closed_message_base + 0 + return_market_closed_message_at + 1) % 256; return_market_closed_message_at = return_market_closed_message_at + 1
  :: else -> break
  od;
  return_market_closed_message_at = 0;
  do
  :: return_market_closed_message_at < 8 -> return_market_closed_message_record.sip_time[return_market_closed_message_at] = (return_market_closed_message_base + 2 + return_market_closed_message_at + 1) % 256; return_market_closed_message_at = return_market_closed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Return Market Closed Message to the wire, 10 bytes from where the cursor stands */
inline encode_return_market_closed_message(return_market_closed_message_record) {
  return_market_closed_message_at = 0;
  do
  :: return_market_closed_message_at < 2 -> wire[at] = return_market_closed_message_record.orig[return_market_closed_message_at]; at = at + 1; return_market_closed_message_at = return_market_closed_message_at + 1
  :: else -> break
  od;
  return_market_closed_message_at = 0;
  do
  :: return_market_closed_message_at < 8 -> wire[at] = return_market_closed_message_record.sip_time[return_market_closed_message_at]; at = at + 1; return_market_closed_message_at = return_market_closed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Return Market Closed Message off the wire, 10 bytes from where the cursor stands */
inline decode_return_market_closed_message(return_market_closed_message_record) {
  return_market_closed_message_at = 0;
  do
  :: return_market_closed_message_at < 2 -> return_market_closed_message_record.orig[return_market_closed_message_at] = wire[at]; at = at + 1; return_market_closed_message_at = return_market_closed_message_at + 1
  :: else -> break
  od;
  return_market_closed_message_at = 0;
  do
  :: return_market_closed_message_at < 8 -> return_market_closed_message_record.sip_time[return_market_closed_message_at] = wire[at]; at = at + 1; return_market_closed_message_at = return_market_closed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Return Market Closed Message is what was written, byte for byte */
inline equal_return_market_closed_message(return_market_closed_message_read, return_market_closed_message_written) {
  return_market_closed_message_at = 0;
  do
  :: return_market_closed_message_at < 2 -> assert(return_market_closed_message_read.orig[return_market_closed_message_at] == return_market_closed_message_written.orig[return_market_closed_message_at]); return_market_closed_message_at = return_market_closed_message_at + 1
  :: else -> break
  od;
  return_market_closed_message_at = 0;
  do
  :: return_market_closed_message_at < 8 -> assert(return_market_closed_message_read.sip_time[return_market_closed_message_at] == return_market_closed_message_written.sip_time[return_market_closed_message_at]); return_market_closed_message_at = return_market_closed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reject Message: 29 bytes ------------------------------------------------ */

/* Reject Message (aR). SIP returns this message when an inbound message is rejected. syntaxViolation 'Y' indicates a syntax error and the port will be disconnected. */
typedef RejectMessage {
  byte orig[2];
  byte sip_time[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte reject_code[2];
  byte syntax_violation
};

int reject_message_at;

/* every byte of Reject Message set to one value */
inline fill_reject_message(reject_message_record, reject_message_value) {
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> reject_message_record.orig[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> reject_message_record.sip_time[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> reject_message_record.feed_sequence[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> reject_message_record.part_token[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> reject_message_record.reject_code[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.syntax_violation = reject_message_value;
  skip
}

/* each byte of Reject Message set to where it lies, so a field read out of place says so */
inline ramp_reject_message(reject_message_record, reject_message_base) {
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> reject_message_record.orig[reject_message_at] = (reject_message_base + 0 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> reject_message_record.sip_time[reject_message_at] = (reject_message_base + 2 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> reject_message_record.feed_sequence[reject_message_at] = (reject_message_base + 10 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> reject_message_record.part_token[reject_message_at] = (reject_message_base + 18 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> reject_message_record.reject_code[reject_message_at] = (reject_message_base + 26 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.syntax_violation = (reject_message_base + 28 + 1) % 256;
  skip
}

/* Reject Message to the wire, 29 bytes from where the cursor stands */
inline encode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> wire[at] = reject_message_record.orig[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> wire[at] = reject_message_record.sip_time[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> wire[at] = reject_message_record.feed_sequence[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> wire[at] = reject_message_record.part_token[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> wire[at] = reject_message_record.reject_code[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  wire[at] = reject_message_record.syntax_violation; at = at + 1;
  skip
}

/* Reject Message off the wire, 29 bytes from where the cursor stands */
inline decode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> reject_message_record.orig[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> reject_message_record.sip_time[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> reject_message_record.feed_sequence[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> reject_message_record.part_token[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> reject_message_record.reject_code[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.syntax_violation = wire[at]; at = at + 1;
  skip
}

/* what was read of Reject Message is what was written, byte for byte */
inline equal_reject_message(reject_message_read, reject_message_written) {
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> assert(reject_message_read.orig[reject_message_at] == reject_message_written.orig[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> assert(reject_message_read.sip_time[reject_message_at] == reject_message_written.sip_time[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> assert(reject_message_read.feed_sequence[reject_message_at] == reject_message_written.feed_sequence[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 8 -> assert(reject_message_read.part_token[reject_message_at] == reject_message_written.part_token[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 2 -> assert(reject_message_read.reject_code[reject_message_at] == reject_message_written.reject_code[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  assert(reject_message_read.syntax_violation == reject_message_written.syntax_violation);
  skip
}

/* ---- Sequence Acknowledgement Message: 26 bytes ------------------------------ */

/* Sequence Acknowledgement Message (aK). SIP positively acknowledges receipt of an inbound message when the port is configured for acknowledgements. */
typedef SequenceAcknowledgementMessage {
  byte orig[2];
  byte sip_time[8];
  byte feed_sequence[8];
  byte part_token[8]
};

int sequence_acknowledgement_message_at;

/* every byte of Sequence Acknowledgement Message set to one value */
inline fill_sequence_acknowledgement_message(sequence_acknowledgement_message_record, sequence_acknowledgement_message_value) {
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 2 -> sequence_acknowledgement_message_record.orig[sequence_acknowledgement_message_at] = sequence_acknowledgement_message_value; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> sequence_acknowledgement_message_record.sip_time[sequence_acknowledgement_message_at] = sequence_acknowledgement_message_value; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> sequence_acknowledgement_message_record.feed_sequence[sequence_acknowledgement_message_at] = sequence_acknowledgement_message_value; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> sequence_acknowledgement_message_record.part_token[sequence_acknowledgement_message_at] = sequence_acknowledgement_message_value; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Acknowledgement Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_acknowledgement_message(sequence_acknowledgement_message_record, sequence_acknowledgement_message_base) {
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 2 -> sequence_acknowledgement_message_record.orig[sequence_acknowledgement_message_at] = (sequence_acknowledgement_message_base + 0 + sequence_acknowledgement_message_at + 1) % 256; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> sequence_acknowledgement_message_record.sip_time[sequence_acknowledgement_message_at] = (sequence_acknowledgement_message_base + 2 + sequence_acknowledgement_message_at + 1) % 256; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> sequence_acknowledgement_message_record.feed_sequence[sequence_acknowledgement_message_at] = (sequence_acknowledgement_message_base + 10 + sequence_acknowledgement_message_at + 1) % 256; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> sequence_acknowledgement_message_record.part_token[sequence_acknowledgement_message_at] = (sequence_acknowledgement_message_base + 18 + sequence_acknowledgement_message_at + 1) % 256; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Acknowledgement Message to the wire, 26 bytes from where the cursor stands */
inline encode_sequence_acknowledgement_message(sequence_acknowledgement_message_record) {
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 2 -> wire[at] = sequence_acknowledgement_message_record.orig[sequence_acknowledgement_message_at]; at = at + 1; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> wire[at] = sequence_acknowledgement_message_record.sip_time[sequence_acknowledgement_message_at]; at = at + 1; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> wire[at] = sequence_acknowledgement_message_record.feed_sequence[sequence_acknowledgement_message_at]; at = at + 1; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> wire[at] = sequence_acknowledgement_message_record.part_token[sequence_acknowledgement_message_at]; at = at + 1; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Acknowledgement Message off the wire, 26 bytes from where the cursor stands */
inline decode_sequence_acknowledgement_message(sequence_acknowledgement_message_record) {
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 2 -> sequence_acknowledgement_message_record.orig[sequence_acknowledgement_message_at] = wire[at]; at = at + 1; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> sequence_acknowledgement_message_record.sip_time[sequence_acknowledgement_message_at] = wire[at]; at = at + 1; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> sequence_acknowledgement_message_record.feed_sequence[sequence_acknowledgement_message_at] = wire[at]; at = at + 1; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> sequence_acknowledgement_message_record.part_token[sequence_acknowledgement_message_at] = wire[at]; at = at + 1; sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Acknowledgement Message is what was written, byte for byte */
inline equal_sequence_acknowledgement_message(sequence_acknowledgement_message_read, sequence_acknowledgement_message_written) {
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 2 -> assert(sequence_acknowledgement_message_read.orig[sequence_acknowledgement_message_at] == sequence_acknowledgement_message_written.orig[sequence_acknowledgement_message_at]); sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> assert(sequence_acknowledgement_message_read.sip_time[sequence_acknowledgement_message_at] == sequence_acknowledgement_message_written.sip_time[sequence_acknowledgement_message_at]); sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> assert(sequence_acknowledgement_message_read.feed_sequence[sequence_acknowledgement_message_at] == sequence_acknowledgement_message_written.feed_sequence[sequence_acknowledgement_message_at]); sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  sequence_acknowledgement_message_at = 0;
  do
  :: sequence_acknowledgement_message_at < 8 -> assert(sequence_acknowledgement_message_read.part_token[sequence_acknowledgement_message_at] == sequence_acknowledgement_message_written.part_token[sequence_acknowledgement_message_at]); sequence_acknowledgement_message_at = sequence_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Participant Input Warning Message: 42 bytes ----------------------------- */

/* Participant Input Warning Message (aW). Sent when an inbound quote message would exceed odd-lot price-level limits. Carries the unprocessed price levels as attachments whose form is selected by olAttachmenType (2=Short, 3=Long, 5=ADF MPID). The attached price levels are not enumerated as Pdf.xml groups in this version — extend in a follow-up release when the loader's value-gated Optional rules are wired through Edits.xml. */
typedef ParticipantInputWarningMessage {
  byte orig[2];
  byte sip_time[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte warning_code[2];
  byte symbol_long[11];
  byte ol_attachmen_type;
  byte ol_attachment_count[2]
};

int participant_input_warning_message_at;

/* every byte of Participant Input Warning Message set to one value */
inline fill_participant_input_warning_message(participant_input_warning_message_record, participant_input_warning_message_value) {
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> participant_input_warning_message_record.orig[participant_input_warning_message_at] = participant_input_warning_message_value; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> participant_input_warning_message_record.sip_time[participant_input_warning_message_at] = participant_input_warning_message_value; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> participant_input_warning_message_record.feed_sequence[participant_input_warning_message_at] = participant_input_warning_message_value; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> participant_input_warning_message_record.part_token[participant_input_warning_message_at] = participant_input_warning_message_value; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> participant_input_warning_message_record.warning_code[participant_input_warning_message_at] = participant_input_warning_message_value; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 11 -> participant_input_warning_message_record.symbol_long[participant_input_warning_message_at] = participant_input_warning_message_value; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_record.ol_attachmen_type = participant_input_warning_message_value;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> participant_input_warning_message_record.ol_attachment_count[participant_input_warning_message_at] = participant_input_warning_message_value; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Participant Input Warning Message set to where it lies, so a field read out of place says so */
inline ramp_participant_input_warning_message(participant_input_warning_message_record, participant_input_warning_message_base) {
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> participant_input_warning_message_record.orig[participant_input_warning_message_at] = (participant_input_warning_message_base + 0 + participant_input_warning_message_at + 1) % 256; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> participant_input_warning_message_record.sip_time[participant_input_warning_message_at] = (participant_input_warning_message_base + 2 + participant_input_warning_message_at + 1) % 256; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> participant_input_warning_message_record.feed_sequence[participant_input_warning_message_at] = (participant_input_warning_message_base + 10 + participant_input_warning_message_at + 1) % 256; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> participant_input_warning_message_record.part_token[participant_input_warning_message_at] = (participant_input_warning_message_base + 18 + participant_input_warning_message_at + 1) % 256; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> participant_input_warning_message_record.warning_code[participant_input_warning_message_at] = (participant_input_warning_message_base + 26 + participant_input_warning_message_at + 1) % 256; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 11 -> participant_input_warning_message_record.symbol_long[participant_input_warning_message_at] = (participant_input_warning_message_base + 28 + participant_input_warning_message_at + 1) % 256; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_record.ol_attachmen_type = (participant_input_warning_message_base + 39 + 1) % 256;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> participant_input_warning_message_record.ol_attachment_count[participant_input_warning_message_at] = (participant_input_warning_message_base + 40 + participant_input_warning_message_at + 1) % 256; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  skip
}

/* Participant Input Warning Message to the wire, 42 bytes from where the cursor stands */
inline encode_participant_input_warning_message(participant_input_warning_message_record) {
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> wire[at] = participant_input_warning_message_record.orig[participant_input_warning_message_at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> wire[at] = participant_input_warning_message_record.sip_time[participant_input_warning_message_at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> wire[at] = participant_input_warning_message_record.feed_sequence[participant_input_warning_message_at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> wire[at] = participant_input_warning_message_record.part_token[participant_input_warning_message_at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> wire[at] = participant_input_warning_message_record.warning_code[participant_input_warning_message_at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 11 -> wire[at] = participant_input_warning_message_record.symbol_long[participant_input_warning_message_at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  wire[at] = participant_input_warning_message_record.ol_attachmen_type; at = at + 1;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> wire[at] = participant_input_warning_message_record.ol_attachment_count[participant_input_warning_message_at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  skip
}

/* Participant Input Warning Message off the wire, 42 bytes from where the cursor stands */
inline decode_participant_input_warning_message(participant_input_warning_message_record) {
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> participant_input_warning_message_record.orig[participant_input_warning_message_at] = wire[at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> participant_input_warning_message_record.sip_time[participant_input_warning_message_at] = wire[at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> participant_input_warning_message_record.feed_sequence[participant_input_warning_message_at] = wire[at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> participant_input_warning_message_record.part_token[participant_input_warning_message_at] = wire[at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> participant_input_warning_message_record.warning_code[participant_input_warning_message_at] = wire[at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 11 -> participant_input_warning_message_record.symbol_long[participant_input_warning_message_at] = wire[at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_record.ol_attachmen_type = wire[at]; at = at + 1;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> participant_input_warning_message_record.ol_attachment_count[participant_input_warning_message_at] = wire[at]; at = at + 1; participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Participant Input Warning Message is what was written, byte for byte */
inline equal_participant_input_warning_message(participant_input_warning_message_read, participant_input_warning_message_written) {
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> assert(participant_input_warning_message_read.orig[participant_input_warning_message_at] == participant_input_warning_message_written.orig[participant_input_warning_message_at]); participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> assert(participant_input_warning_message_read.sip_time[participant_input_warning_message_at] == participant_input_warning_message_written.sip_time[participant_input_warning_message_at]); participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> assert(participant_input_warning_message_read.feed_sequence[participant_input_warning_message_at] == participant_input_warning_message_written.feed_sequence[participant_input_warning_message_at]); participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 8 -> assert(participant_input_warning_message_read.part_token[participant_input_warning_message_at] == participant_input_warning_message_written.part_token[participant_input_warning_message_at]); participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> assert(participant_input_warning_message_read.warning_code[participant_input_warning_message_at] == participant_input_warning_message_written.warning_code[participant_input_warning_message_at]); participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 11 -> assert(participant_input_warning_message_read.symbol_long[participant_input_warning_message_at] == participant_input_warning_message_written.symbol_long[participant_input_warning_message_at]); participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  assert(participant_input_warning_message_read.ol_attachmen_type == participant_input_warning_message_written.ol_attachmen_type);
  participant_input_warning_message_at = 0;
  do
  :: participant_input_warning_message_at < 2 -> assert(participant_input_warning_message_read.ol_attachment_count[participant_input_warning_message_at] == participant_input_warning_message_written.ol_attachment_count[participant_input_warning_message_at]); participant_input_warning_message_at = participant_input_warning_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Day Message: 10 bytes ------------------------------------------ */

/* Start Of Day Message (cE). SIP signals it is open and ready to receive messages from participants. */
typedef StartOfDayMessage {
  byte orig[2];
  byte sip_time[8]
};

int start_of_day_message_at;

/* every byte of Start Of Day Message set to one value */
inline fill_start_of_day_message(start_of_day_message_record, start_of_day_message_value) {
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 2 -> start_of_day_message_record.orig[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.sip_time[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_day_message(start_of_day_message_record, start_of_day_message_base) {
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 2 -> start_of_day_message_record.orig[start_of_day_message_at] = (start_of_day_message_base + 0 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.sip_time[start_of_day_message_at] = (start_of_day_message_base + 2 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message to the wire, 10 bytes from where the cursor stands */
inline encode_start_of_day_message(start_of_day_message_record) {
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 2 -> wire[at] = start_of_day_message_record.orig[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> wire[at] = start_of_day_message_record.sip_time[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message off the wire, 10 bytes from where the cursor stands */
inline decode_start_of_day_message(start_of_day_message_record) {
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 2 -> start_of_day_message_record.orig[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.sip_time[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Day Message is what was written, byte for byte */
inline equal_start_of_day_message(start_of_day_message_read, start_of_day_message_written) {
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 2 -> assert(start_of_day_message_read.orig[start_of_day_message_at] == start_of_day_message_written.orig[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> assert(start_of_day_message_read.sip_time[start_of_day_message_at] == start_of_day_message_written.sip_time[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Day Message: 10 bytes -------------------------------------------- */

/* End Of Day Message (cF). SIP signals it has no further data or control messages for the day and is shutting down. */
typedef EndOfDayMessage {
  byte orig[2];
  byte sip_time[8]
};

int end_of_day_message_at;

/* every byte of End Of Day Message set to one value */
inline fill_end_of_day_message(end_of_day_message_record, end_of_day_message_value) {
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 2 -> end_of_day_message_record.orig[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.sip_time[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_day_message(end_of_day_message_record, end_of_day_message_base) {
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 2 -> end_of_day_message_record.orig[end_of_day_message_at] = (end_of_day_message_base + 0 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.sip_time[end_of_day_message_at] = (end_of_day_message_base + 2 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message to the wire, 10 bytes from where the cursor stands */
inline encode_end_of_day_message(end_of_day_message_record) {
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 2 -> wire[at] = end_of_day_message_record.orig[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> wire[at] = end_of_day_message_record.sip_time[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message off the wire, 10 bytes from where the cursor stands */
inline decode_end_of_day_message(end_of_day_message_record) {
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 2 -> end_of_day_message_record.orig[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.sip_time[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Day Message is what was written, byte for byte */
inline equal_end_of_day_message(end_of_day_message_read, end_of_day_message_written) {
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 2 -> assert(end_of_day_message_read.orig[end_of_day_message_at] == end_of_day_message_written.orig[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> assert(end_of_day_message_read.sip_time[end_of_day_message_at] == end_of_day_message_written.sip_time[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Inquiry Response Message: 27 bytes ----------------------------- */

/* Sequence Inquiry Response Message (cC). Sent unsequenced in response to a CC inquiry. Carries the next expected feedSequence, last partToken received, and the present SIP state. */
typedef SequenceInquiryResponseMessage {
  byte orig[2];
  byte sip_time[8];
  byte feed_sequence[8];
  byte part_token[8];
  byte sip_state
};

int sequence_inquiry_response_message_at;

/* every byte of Sequence Inquiry Response Message set to one value */
inline fill_sequence_inquiry_response_message(sequence_inquiry_response_message_record, sequence_inquiry_response_message_value) {
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 2 -> sequence_inquiry_response_message_record.orig[sequence_inquiry_response_message_at] = sequence_inquiry_response_message_value; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> sequence_inquiry_response_message_record.sip_time[sequence_inquiry_response_message_at] = sequence_inquiry_response_message_value; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> sequence_inquiry_response_message_record.feed_sequence[sequence_inquiry_response_message_at] = sequence_inquiry_response_message_value; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> sequence_inquiry_response_message_record.part_token[sequence_inquiry_response_message_at] = sequence_inquiry_response_message_value; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_record.sip_state = sequence_inquiry_response_message_value;
  skip
}

/* each byte of Sequence Inquiry Response Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_inquiry_response_message(sequence_inquiry_response_message_record, sequence_inquiry_response_message_base) {
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 2 -> sequence_inquiry_response_message_record.orig[sequence_inquiry_response_message_at] = (sequence_inquiry_response_message_base + 0 + sequence_inquiry_response_message_at + 1) % 256; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> sequence_inquiry_response_message_record.sip_time[sequence_inquiry_response_message_at] = (sequence_inquiry_response_message_base + 2 + sequence_inquiry_response_message_at + 1) % 256; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> sequence_inquiry_response_message_record.feed_sequence[sequence_inquiry_response_message_at] = (sequence_inquiry_response_message_base + 10 + sequence_inquiry_response_message_at + 1) % 256; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> sequence_inquiry_response_message_record.part_token[sequence_inquiry_response_message_at] = (sequence_inquiry_response_message_base + 18 + sequence_inquiry_response_message_at + 1) % 256; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_record.sip_state = (sequence_inquiry_response_message_base + 26 + 1) % 256;
  skip
}

/* Sequence Inquiry Response Message to the wire, 27 bytes from where the cursor stands */
inline encode_sequence_inquiry_response_message(sequence_inquiry_response_message_record) {
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 2 -> wire[at] = sequence_inquiry_response_message_record.orig[sequence_inquiry_response_message_at]; at = at + 1; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> wire[at] = sequence_inquiry_response_message_record.sip_time[sequence_inquiry_response_message_at]; at = at + 1; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> wire[at] = sequence_inquiry_response_message_record.feed_sequence[sequence_inquiry_response_message_at]; at = at + 1; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> wire[at] = sequence_inquiry_response_message_record.part_token[sequence_inquiry_response_message_at]; at = at + 1; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  wire[at] = sequence_inquiry_response_message_record.sip_state; at = at + 1;
  skip
}

/* Sequence Inquiry Response Message off the wire, 27 bytes from where the cursor stands */
inline decode_sequence_inquiry_response_message(sequence_inquiry_response_message_record) {
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 2 -> sequence_inquiry_response_message_record.orig[sequence_inquiry_response_message_at] = wire[at]; at = at + 1; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> sequence_inquiry_response_message_record.sip_time[sequence_inquiry_response_message_at] = wire[at]; at = at + 1; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> sequence_inquiry_response_message_record.feed_sequence[sequence_inquiry_response_message_at] = wire[at]; at = at + 1; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> sequence_inquiry_response_message_record.part_token[sequence_inquiry_response_message_at] = wire[at]; at = at + 1; sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_record.sip_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Sequence Inquiry Response Message is what was written, byte for byte */
inline equal_sequence_inquiry_response_message(sequence_inquiry_response_message_read, sequence_inquiry_response_message_written) {
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 2 -> assert(sequence_inquiry_response_message_read.orig[sequence_inquiry_response_message_at] == sequence_inquiry_response_message_written.orig[sequence_inquiry_response_message_at]); sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> assert(sequence_inquiry_response_message_read.sip_time[sequence_inquiry_response_message_at] == sequence_inquiry_response_message_written.sip_time[sequence_inquiry_response_message_at]); sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> assert(sequence_inquiry_response_message_read.feed_sequence[sequence_inquiry_response_message_at] == sequence_inquiry_response_message_written.feed_sequence[sequence_inquiry_response_message_at]); sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  sequence_inquiry_response_message_at = 0;
  do
  :: sequence_inquiry_response_message_at < 8 -> assert(sequence_inquiry_response_message_read.part_token[sequence_inquiry_response_message_at] == sequence_inquiry_response_message_written.part_token[sequence_inquiry_response_message_at]); sequence_inquiry_response_message_at = sequence_inquiry_response_message_at + 1
  :: else -> break
  od;
  assert(sequence_inquiry_response_message_read.sip_state == sequence_inquiry_response_message_written.sip_state);
  skip
}

/* ---- Symbol State Inquiry Response Message: 30 bytes ------------------------- */

/* Symbol State Inquiry Response Message (cS). Sent unsequenced in response to a CS inquiry. Carries next expected tradeId, next actionSequence, and the symbolState. */
typedef SymbolStateInquiryResponseMessage {
  byte orig[2];
  byte sip_time[8];
  byte symbol_long[11];
  byte next_trade_id[4];
  byte next_action_sequence[4];
  byte symbol_state
};

int symbol_state_inquiry_response_message_at;

/* every byte of Symbol State Inquiry Response Message set to one value */
inline fill_symbol_state_inquiry_response_message(symbol_state_inquiry_response_message_record, symbol_state_inquiry_response_message_value) {
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 2 -> symbol_state_inquiry_response_message_record.orig[symbol_state_inquiry_response_message_at] = symbol_state_inquiry_response_message_value; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 8 -> symbol_state_inquiry_response_message_record.sip_time[symbol_state_inquiry_response_message_at] = symbol_state_inquiry_response_message_value; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 11 -> symbol_state_inquiry_response_message_record.symbol_long[symbol_state_inquiry_response_message_at] = symbol_state_inquiry_response_message_value; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 4 -> symbol_state_inquiry_response_message_record.next_trade_id[symbol_state_inquiry_response_message_at] = symbol_state_inquiry_response_message_value; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 4 -> symbol_state_inquiry_response_message_record.next_action_sequence[symbol_state_inquiry_response_message_at] = symbol_state_inquiry_response_message_value; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_record.symbol_state = symbol_state_inquiry_response_message_value;
  skip
}

/* each byte of Symbol State Inquiry Response Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_state_inquiry_response_message(symbol_state_inquiry_response_message_record, symbol_state_inquiry_response_message_base) {
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 2 -> symbol_state_inquiry_response_message_record.orig[symbol_state_inquiry_response_message_at] = (symbol_state_inquiry_response_message_base + 0 + symbol_state_inquiry_response_message_at + 1) % 256; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 8 -> symbol_state_inquiry_response_message_record.sip_time[symbol_state_inquiry_response_message_at] = (symbol_state_inquiry_response_message_base + 2 + symbol_state_inquiry_response_message_at + 1) % 256; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 11 -> symbol_state_inquiry_response_message_record.symbol_long[symbol_state_inquiry_response_message_at] = (symbol_state_inquiry_response_message_base + 10 + symbol_state_inquiry_response_message_at + 1) % 256; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 4 -> symbol_state_inquiry_response_message_record.next_trade_id[symbol_state_inquiry_response_message_at] = (symbol_state_inquiry_response_message_base + 21 + symbol_state_inquiry_response_message_at + 1) % 256; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 4 -> symbol_state_inquiry_response_message_record.next_action_sequence[symbol_state_inquiry_response_message_at] = (symbol_state_inquiry_response_message_base + 25 + symbol_state_inquiry_response_message_at + 1) % 256; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_record.symbol_state = (symbol_state_inquiry_response_message_base + 29 + 1) % 256;
  skip
}

/* Symbol State Inquiry Response Message to the wire, 30 bytes from where the cursor stands */
inline encode_symbol_state_inquiry_response_message(symbol_state_inquiry_response_message_record) {
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 2 -> wire[at] = symbol_state_inquiry_response_message_record.orig[symbol_state_inquiry_response_message_at]; at = at + 1; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 8 -> wire[at] = symbol_state_inquiry_response_message_record.sip_time[symbol_state_inquiry_response_message_at]; at = at + 1; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 11 -> wire[at] = symbol_state_inquiry_response_message_record.symbol_long[symbol_state_inquiry_response_message_at]; at = at + 1; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 4 -> wire[at] = symbol_state_inquiry_response_message_record.next_trade_id[symbol_state_inquiry_response_message_at]; at = at + 1; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 4 -> wire[at] = symbol_state_inquiry_response_message_record.next_action_sequence[symbol_state_inquiry_response_message_at]; at = at + 1; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_state_inquiry_response_message_record.symbol_state; at = at + 1;
  skip
}

/* Symbol State Inquiry Response Message off the wire, 30 bytes from where the cursor stands */
inline decode_symbol_state_inquiry_response_message(symbol_state_inquiry_response_message_record) {
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 2 -> symbol_state_inquiry_response_message_record.orig[symbol_state_inquiry_response_message_at] = wire[at]; at = at + 1; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 8 -> symbol_state_inquiry_response_message_record.sip_time[symbol_state_inquiry_response_message_at] = wire[at]; at = at + 1; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 11 -> symbol_state_inquiry_response_message_record.symbol_long[symbol_state_inquiry_response_message_at] = wire[at]; at = at + 1; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 4 -> symbol_state_inquiry_response_message_record.next_trade_id[symbol_state_inquiry_response_message_at] = wire[at]; at = at + 1; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 4 -> symbol_state_inquiry_response_message_record.next_action_sequence[symbol_state_inquiry_response_message_at] = wire[at]; at = at + 1; symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_record.symbol_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Symbol State Inquiry Response Message is what was written, byte for byte */
inline equal_symbol_state_inquiry_response_message(symbol_state_inquiry_response_message_read, symbol_state_inquiry_response_message_written) {
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 2 -> assert(symbol_state_inquiry_response_message_read.orig[symbol_state_inquiry_response_message_at] == symbol_state_inquiry_response_message_written.orig[symbol_state_inquiry_response_message_at]); symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 8 -> assert(symbol_state_inquiry_response_message_read.sip_time[symbol_state_inquiry_response_message_at] == symbol_state_inquiry_response_message_written.sip_time[symbol_state_inquiry_response_message_at]); symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 11 -> assert(symbol_state_inquiry_response_message_read.symbol_long[symbol_state_inquiry_response_message_at] == symbol_state_inquiry_response_message_written.symbol_long[symbol_state_inquiry_response_message_at]); symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 4 -> assert(symbol_state_inquiry_response_message_read.next_trade_id[symbol_state_inquiry_response_message_at] == symbol_state_inquiry_response_message_written.next_trade_id[symbol_state_inquiry_response_message_at]); symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  symbol_state_inquiry_response_message_at = 0;
  do
  :: symbol_state_inquiry_response_message_at < 4 -> assert(symbol_state_inquiry_response_message_read.next_action_sequence[symbol_state_inquiry_response_message_at] == symbol_state_inquiry_response_message_written.next_action_sequence[symbol_state_inquiry_response_message_at]); symbol_state_inquiry_response_message_at = symbol_state_inquiry_response_message_at + 1
  :: else -> break
  od;
  assert(symbol_state_inquiry_response_message_read.symbol_state == symbol_state_inquiry_response_message_written.symbol_state);
  skip
}

/* ---- Login Request Packet: 46 bytes ------------------------------------------ */

/* SoupBinTCP Login Request Packet sent by the client to begin a session */
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

/* ---- What spin checks -------------------------------------------------------- */

/* Client Tcp Packet Header: encoded, read back, and compared */
proctype check_client_tcp_packet_header() {
  ClientTcpPacketHeader client_tcp_packet_header_sent;
  ClientTcpPacketHeader client_tcp_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_client_tcp_packet_header(client_tcp_packet_header_sent, 0)
  :: pattern == 1 -> fill_client_tcp_packet_header(client_tcp_packet_header_sent, 32)
  :: pattern == 2 -> fill_client_tcp_packet_header(client_tcp_packet_header_sent, 255)
  :: else -> ramp_client_tcp_packet_header(client_tcp_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_client_tcp_packet_header(client_tcp_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_client_tcp_packet_header(client_tcp_packet_header_got);
    assert(at == 3);
    equal_client_tcp_packet_header(client_tcp_packet_header_got, client_tcp_packet_header_sent)
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

/* Protected Exchange Quote Message Short Form Message: encoded, read back, and compared */
proctype check_protected_exchange_quote_message_short_form_message() {
  ProtectedExchangeQuoteMessageShortFormMessage protected_exchange_quote_message_short_form_message_sent;
  ProtectedExchangeQuoteMessageShortFormMessage protected_exchange_quote_message_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_protected_exchange_quote_message_short_form_message(protected_exchange_quote_message_short_form_message_sent, 0)
  :: pattern == 1 -> fill_protected_exchange_quote_message_short_form_message(protected_exchange_quote_message_short_form_message_sent, 32)
  :: pattern == 2 -> fill_protected_exchange_quote_message_short_form_message(protected_exchange_quote_message_short_form_message_sent, 255)
  :: else -> ramp_protected_exchange_quote_message_short_form_message(protected_exchange_quote_message_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_protected_exchange_quote_message_short_form_message(protected_exchange_quote_message_short_form_message_sent);
    assert(at == 41);
    at = 0;
    decode_protected_exchange_quote_message_short_form_message(protected_exchange_quote_message_short_form_message_got);
    assert(at == 41);
    equal_protected_exchange_quote_message_short_form_message(protected_exchange_quote_message_short_form_message_got, protected_exchange_quote_message_short_form_message_sent)
  }
}

/* Protected Exchange Quote Message Long Form Message: encoded, read back, and compared */
proctype check_protected_exchange_quote_message_long_form_message() {
  ProtectedExchangeQuoteMessageLongFormMessage protected_exchange_quote_message_long_form_message_sent;
  ProtectedExchangeQuoteMessageLongFormMessage protected_exchange_quote_message_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_protected_exchange_quote_message_long_form_message(protected_exchange_quote_message_long_form_message_sent, 0)
  :: pattern == 1 -> fill_protected_exchange_quote_message_long_form_message(protected_exchange_quote_message_long_form_message_sent, 32)
  :: pattern == 2 -> fill_protected_exchange_quote_message_long_form_message(protected_exchange_quote_message_long_form_message_sent, 255)
  :: else -> ramp_protected_exchange_quote_message_long_form_message(protected_exchange_quote_message_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_protected_exchange_quote_message_long_form_message(protected_exchange_quote_message_long_form_message_sent);
    assert(at == 63);
    at = 0;
    decode_protected_exchange_quote_message_long_form_message(protected_exchange_quote_message_long_form_message_got);
    assert(at == 63);
    equal_protected_exchange_quote_message_long_form_message(protected_exchange_quote_message_long_form_message_got, protected_exchange_quote_message_long_form_message_sent)
  }
}

/* Finra Protected Quote Message With Bbo Info Message: encoded, read back, and compared */
proctype check_finra_protected_quote_message_with_bbo_info_message() {
  FinraProtectedQuoteMessageWithBboInfoMessage finra_protected_quote_message_with_bbo_info_message_sent;
  FinraProtectedQuoteMessageWithBboInfoMessage finra_protected_quote_message_with_bbo_info_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_finra_protected_quote_message_with_bbo_info_message(finra_protected_quote_message_with_bbo_info_message_sent, 0)
  :: pattern == 1 -> fill_finra_protected_quote_message_with_bbo_info_message(finra_protected_quote_message_with_bbo_info_message_sent, 32)
  :: pattern == 2 -> fill_finra_protected_quote_message_with_bbo_info_message(finra_protected_quote_message_with_bbo_info_message_sent, 255)
  :: else -> ramp_finra_protected_quote_message_with_bbo_info_message(finra_protected_quote_message_with_bbo_info_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_finra_protected_quote_message_with_bbo_info_message(finra_protected_quote_message_with_bbo_info_message_sent);
    assert(at == 107);
    at = 0;
    decode_finra_protected_quote_message_with_bbo_info_message(finra_protected_quote_message_with_bbo_info_message_got);
    assert(at == 107);
    equal_finra_protected_quote_message_with_bbo_info_message(finra_protected_quote_message_with_bbo_info_message_got, finra_protected_quote_message_with_bbo_info_message_sent)
  }
}

/* Finra Protected Quote Message Without Bbo Info Message: encoded, read back, and compared */
proctype check_finra_protected_quote_message_without_bbo_info_message() {
  FinraProtectedQuoteMessageWithoutBboInfoMessage finra_protected_quote_message_without_bbo_info_message_sent;
  FinraProtectedQuoteMessageWithoutBboInfoMessage finra_protected_quote_message_without_bbo_info_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_finra_protected_quote_message_without_bbo_info_message(finra_protected_quote_message_without_bbo_info_message_sent, 0)
  :: pattern == 1 -> fill_finra_protected_quote_message_without_bbo_info_message(finra_protected_quote_message_without_bbo_info_message_sent, 32)
  :: pattern == 2 -> fill_finra_protected_quote_message_without_bbo_info_message(finra_protected_quote_message_without_bbo_info_message_sent, 255)
  :: else -> ramp_finra_protected_quote_message_without_bbo_info_message(finra_protected_quote_message_without_bbo_info_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_finra_protected_quote_message_without_bbo_info_message(finra_protected_quote_message_without_bbo_info_message_sent);
    assert(at == 75);
    at = 0;
    decode_finra_protected_quote_message_without_bbo_info_message(finra_protected_quote_message_without_bbo_info_message_got);
    assert(at == 75);
    equal_finra_protected_quote_message_without_bbo_info_message(finra_protected_quote_message_without_bbo_info_message_got, finra_protected_quote_message_without_bbo_info_message_sent)
  }
}

/* Regular Trade Report Message: encoded, read back, and compared */
proctype check_regular_trade_report_message() {
  RegularTradeReportMessage regular_trade_report_message_sent;
  RegularTradeReportMessage regular_trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_regular_trade_report_message(regular_trade_report_message_sent, 0)
  :: pattern == 1 -> fill_regular_trade_report_message(regular_trade_report_message_sent, 32)
  :: pattern == 2 -> fill_regular_trade_report_message(regular_trade_report_message_sent, 255)
  :: else -> ramp_regular_trade_report_message(regular_trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_regular_trade_report_message(regular_trade_report_message_sent);
    assert(at == 69);
    at = 0;
    decode_regular_trade_report_message(regular_trade_report_message_got);
    assert(at == 69);
    equal_regular_trade_report_message(regular_trade_report_message_got, regular_trade_report_message_sent)
  }
}

/* Trade Cancel Error Message: encoded, read back, and compared */
proctype check_trade_cancel_error_message() {
  TradeCancelErrorMessage trade_cancel_error_message_sent;
  TradeCancelErrorMessage trade_cancel_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 255)
  :: else -> ramp_trade_cancel_error_message(trade_cancel_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_error_message(trade_cancel_error_message_sent);
    assert(at == 70);
    at = 0;
    decode_trade_cancel_error_message(trade_cancel_error_message_got);
    assert(at == 70);
    equal_trade_cancel_error_message(trade_cancel_error_message_got, trade_cancel_error_message_sent)
  }
}

/* Trade Correction Message: encoded, read back, and compared */
proctype check_trade_correction_message() {
  TradeCorrectionMessage trade_correction_message_sent;
  TradeCorrectionMessage trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_correction_message(trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_trade_correction_message(trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_trade_correction_message(trade_correction_message_sent, 255)
  :: else -> ramp_trade_correction_message(trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_correction_message(trade_correction_message_sent);
    assert(at == 92);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 92);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* As Of Trade Report Message: encoded, read back, and compared */
proctype check_as_of_trade_report_message() {
  AsOfTradeReportMessage as_of_trade_report_message_sent;
  AsOfTradeReportMessage as_of_trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_as_of_trade_report_message(as_of_trade_report_message_sent, 0)
  :: pattern == 1 -> fill_as_of_trade_report_message(as_of_trade_report_message_sent, 32)
  :: pattern == 2 -> fill_as_of_trade_report_message(as_of_trade_report_message_sent, 255)
  :: else -> ramp_as_of_trade_report_message(as_of_trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_as_of_trade_report_message(as_of_trade_report_message_sent);
    assert(at == 70);
    at = 0;
    decode_as_of_trade_report_message(as_of_trade_report_message_got);
    assert(at == 70);
    equal_as_of_trade_report_message(as_of_trade_report_message_got, as_of_trade_report_message_sent)
  }
}

/* Fractional Regular Trade Report Message: encoded, read back, and compared */
proctype check_fractional_regular_trade_report_message() {
  FractionalRegularTradeReportMessage fractional_regular_trade_report_message_sent;
  FractionalRegularTradeReportMessage fractional_regular_trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_regular_trade_report_message(fractional_regular_trade_report_message_sent, 0)
  :: pattern == 1 -> fill_fractional_regular_trade_report_message(fractional_regular_trade_report_message_sent, 32)
  :: pattern == 2 -> fill_fractional_regular_trade_report_message(fractional_regular_trade_report_message_sent, 255)
  :: else -> ramp_fractional_regular_trade_report_message(fractional_regular_trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_regular_trade_report_message(fractional_regular_trade_report_message_sent);
    assert(at == 73);
    at = 0;
    decode_fractional_regular_trade_report_message(fractional_regular_trade_report_message_got);
    assert(at == 73);
    equal_fractional_regular_trade_report_message(fractional_regular_trade_report_message_got, fractional_regular_trade_report_message_sent)
  }
}

/* Fractional Trade Cancel Error Message: encoded, read back, and compared */
proctype check_fractional_trade_cancel_error_message() {
  FractionalTradeCancelErrorMessage fractional_trade_cancel_error_message_sent;
  FractionalTradeCancelErrorMessage fractional_trade_cancel_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent, 0)
  :: pattern == 1 -> fill_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent, 32)
  :: pattern == 2 -> fill_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent, 255)
  :: else -> ramp_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_sent);
    assert(at == 74);
    at = 0;
    decode_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_got);
    assert(at == 74);
    equal_fractional_trade_cancel_error_message(fractional_trade_cancel_error_message_got, fractional_trade_cancel_error_message_sent)
  }
}

/* Fractional Trade Correction Message: encoded, read back, and compared */
proctype check_fractional_trade_correction_message() {
  FractionalTradeCorrectionMessage fractional_trade_correction_message_sent;
  FractionalTradeCorrectionMessage fractional_trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_trade_correction_message(fractional_trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_fractional_trade_correction_message(fractional_trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_fractional_trade_correction_message(fractional_trade_correction_message_sent, 255)
  :: else -> ramp_fractional_trade_correction_message(fractional_trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_trade_correction_message(fractional_trade_correction_message_sent);
    assert(at == 100);
    at = 0;
    decode_fractional_trade_correction_message(fractional_trade_correction_message_got);
    assert(at == 100);
    equal_fractional_trade_correction_message(fractional_trade_correction_message_got, fractional_trade_correction_message_sent)
  }
}

/* Fractional As Of Trade Report Message: encoded, read back, and compared */
proctype check_fractional_as_of_trade_report_message() {
  FractionalAsOfTradeReportMessage fractional_as_of_trade_report_message_sent;
  FractionalAsOfTradeReportMessage fractional_as_of_trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_as_of_trade_report_message(fractional_as_of_trade_report_message_sent, 0)
  :: pattern == 1 -> fill_fractional_as_of_trade_report_message(fractional_as_of_trade_report_message_sent, 32)
  :: pattern == 2 -> fill_fractional_as_of_trade_report_message(fractional_as_of_trade_report_message_sent, 255)
  :: else -> ramp_fractional_as_of_trade_report_message(fractional_as_of_trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_as_of_trade_report_message(fractional_as_of_trade_report_message_sent);
    assert(at == 74);
    at = 0;
    decode_fractional_as_of_trade_report_message(fractional_as_of_trade_report_message_got);
    assert(at == 74);
    equal_fractional_as_of_trade_report_message(fractional_as_of_trade_report_message_got, fractional_as_of_trade_report_message_sent)
  }
}

/* Trading Action Message: encoded, read back, and compared */
proctype check_trading_action_message() {
  TradingActionMessage trading_action_message_sent;
  TradingActionMessage trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_action_message(trading_action_message_sent, 0)
  :: pattern == 1 -> fill_trading_action_message(trading_action_message_sent, 32)
  :: pattern == 2 -> fill_trading_action_message(trading_action_message_sent, 255)
  :: else -> ramp_trading_action_message(trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_action_message(trading_action_message_sent);
    assert(at == 56);
    at = 0;
    decode_trading_action_message(trading_action_message_got);
    assert(at == 56);
    equal_trading_action_message(trading_action_message_got, trading_action_message_sent)
  }
}

/* Market Center Trading Action Message: encoded, read back, and compared */
proctype check_market_center_trading_action_message() {
  MarketCenterTradingActionMessage market_center_trading_action_message_sent;
  MarketCenterTradingActionMessage market_center_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_center_trading_action_message(market_center_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_market_center_trading_action_message(market_center_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_market_center_trading_action_message(market_center_trading_action_message_sent, 255)
  :: else -> ramp_market_center_trading_action_message(market_center_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_center_trading_action_message(market_center_trading_action_message_sent);
    assert(at == 46);
    at = 0;
    decode_market_center_trading_action_message(market_center_trading_action_message_got);
    assert(at == 46);
    equal_market_center_trading_action_message(market_center_trading_action_message_got, market_center_trading_action_message_sent)
  }
}

/* Market Center Mass Trading Action Message: encoded, read back, and compared */
proctype check_market_center_mass_trading_action_message() {
  MarketCenterMassTradingActionMessage market_center_mass_trading_action_message_sent;
  MarketCenterMassTradingActionMessage market_center_mass_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_center_mass_trading_action_message(market_center_mass_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_market_center_mass_trading_action_message(market_center_mass_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_market_center_mass_trading_action_message(market_center_mass_trading_action_message_sent, 255)
  :: else -> ramp_market_center_mass_trading_action_message(market_center_mass_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_center_mass_trading_action_message(market_center_mass_trading_action_message_sent);
    assert(at == 57);
    at = 0;
    decode_market_center_mass_trading_action_message(market_center_mass_trading_action_message_got);
    assert(at == 57);
    equal_market_center_mass_trading_action_message(market_center_mass_trading_action_message_got, market_center_mass_trading_action_message_sent)
  }
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message: encoded, read back, and compared */
proctype check_reg_sho_short_sale_price_test_restricted_indicator_message() {
  RegShoShortSalePriceTestRestrictedIndicatorMessage reg_sho_short_sale_price_test_restricted_indicator_message_sent;
  RegShoShortSalePriceTestRestrictedIndicatorMessage reg_sho_short_sale_price_test_restricted_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 0)
  :: pattern == 1 -> fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 32)
  :: pattern == 2 -> fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 255)
  :: else -> ramp_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent);
    assert(at == 38);
    at = 0;
    decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_got);
    assert(at == 38);
    equal_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_got, reg_sho_short_sale_price_test_restricted_indicator_message_sent)
  }
}

/* Opening Reference Midpoint Price Message: encoded, read back, and compared */
proctype check_opening_reference_midpoint_price_message() {
  OpeningReferenceMidpointPriceMessage opening_reference_midpoint_price_message_sent;
  OpeningReferenceMidpointPriceMessage opening_reference_midpoint_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_opening_reference_midpoint_price_message(opening_reference_midpoint_price_message_sent, 0)
  :: pattern == 1 -> fill_opening_reference_midpoint_price_message(opening_reference_midpoint_price_message_sent, 32)
  :: pattern == 2 -> fill_opening_reference_midpoint_price_message(opening_reference_midpoint_price_message_sent, 255)
  :: else -> ramp_opening_reference_midpoint_price_message(opening_reference_midpoint_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_opening_reference_midpoint_price_message(opening_reference_midpoint_price_message_sent);
    assert(at == 45);
    at = 0;
    decode_opening_reference_midpoint_price_message(opening_reference_midpoint_price_message_got);
    assert(at == 45);
    equal_opening_reference_midpoint_price_message(opening_reference_midpoint_price_message_got, opening_reference_midpoint_price_message_sent)
  }
}

/* T 1 Adjusted Closing Price Message: encoded, read back, and compared */
proctype check_t1_adjusted_closing_price_message() {
  T1AdjustedClosingPriceMessage t1_adjusted_closing_price_message_sent;
  T1AdjustedClosingPriceMessage t1_adjusted_closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_t1_adjusted_closing_price_message(t1_adjusted_closing_price_message_sent, 0)
  :: pattern == 1 -> fill_t1_adjusted_closing_price_message(t1_adjusted_closing_price_message_sent, 32)
  :: pattern == 2 -> fill_t1_adjusted_closing_price_message(t1_adjusted_closing_price_message_sent, 255)
  :: else -> ramp_t1_adjusted_closing_price_message(t1_adjusted_closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_t1_adjusted_closing_price_message(t1_adjusted_closing_price_message_sent);
    assert(at == 45);
    at = 0;
    decode_t1_adjusted_closing_price_message(t1_adjusted_closing_price_message_got);
    assert(at == 45);
    equal_t1_adjusted_closing_price_message(t1_adjusted_closing_price_message_got, t1_adjusted_closing_price_message_sent)
  }
}

/* Market Open Message: encoded, read back, and compared */
proctype check_market_open_message() {
  MarketOpenMessage market_open_message_sent;
  MarketOpenMessage market_open_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_open_message(market_open_message_sent, 0)
  :: pattern == 1 -> fill_market_open_message(market_open_message_sent, 32)
  :: pattern == 2 -> fill_market_open_message(market_open_message_sent, 255)
  :: else -> ramp_market_open_message(market_open_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_open_message(market_open_message_sent);
    assert(at == 26);
    at = 0;
    decode_market_open_message(market_open_message_got);
    assert(at == 26);
    equal_market_open_message(market_open_message_got, market_open_message_sent)
  }
}

/* Market Closed Message: encoded, read back, and compared */
proctype check_market_closed_message() {
  MarketClosedMessage market_closed_message_sent;
  MarketClosedMessage market_closed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_closed_message(market_closed_message_sent, 0)
  :: pattern == 1 -> fill_market_closed_message(market_closed_message_sent, 32)
  :: pattern == 2 -> fill_market_closed_message(market_closed_message_sent, 255)
  :: else -> ramp_market_closed_message(market_closed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_closed_message(market_closed_message_sent);
    assert(at == 26);
    at = 0;
    decode_market_closed_message(market_closed_message_got);
    assert(at == 26);
    equal_market_closed_message(market_closed_message_got, market_closed_message_sent)
  }
}

/* Auction Collar Message: encoded, read back, and compared */
proctype check_auction_collar_message() {
  AuctionCollarMessage auction_collar_message_sent;
  AuctionCollarMessage auction_collar_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_collar_message(auction_collar_message_sent, 0)
  :: pattern == 1 -> fill_auction_collar_message(auction_collar_message_sent, 32)
  :: pattern == 2 -> fill_auction_collar_message(auction_collar_message_sent, 255)
  :: else -> ramp_auction_collar_message(auction_collar_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_collar_message(auction_collar_message_sent);
    assert(at == 66);
    at = 0;
    decode_auction_collar_message(auction_collar_message_got);
    assert(at == 66);
    equal_auction_collar_message(auction_collar_message_got, auction_collar_message_sent)
  }
}

/* Sequence Inquiry Message: encoded, read back, and compared */
proctype check_sequence_inquiry_message() {
  SequenceInquiryMessage sequence_inquiry_message_sent;
  SequenceInquiryMessage sequence_inquiry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_inquiry_message(sequence_inquiry_message_sent, 0)
  :: pattern == 1 -> fill_sequence_inquiry_message(sequence_inquiry_message_sent, 32)
  :: pattern == 2 -> fill_sequence_inquiry_message(sequence_inquiry_message_sent, 255)
  :: else -> ramp_sequence_inquiry_message(sequence_inquiry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_inquiry_message(sequence_inquiry_message_sent);
    assert(at == 26);
    at = 0;
    decode_sequence_inquiry_message(sequence_inquiry_message_got);
    assert(at == 26);
    equal_sequence_inquiry_message(sequence_inquiry_message_got, sequence_inquiry_message_sent)
  }
}

/* Symbol State Inquiry Message: encoded, read back, and compared */
proctype check_symbol_state_inquiry_message() {
  SymbolStateInquiryMessage symbol_state_inquiry_message_sent;
  SymbolStateInquiryMessage symbol_state_inquiry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_state_inquiry_message(symbol_state_inquiry_message_sent, 0)
  :: pattern == 1 -> fill_symbol_state_inquiry_message(symbol_state_inquiry_message_sent, 32)
  :: pattern == 2 -> fill_symbol_state_inquiry_message(symbol_state_inquiry_message_sent, 255)
  :: else -> ramp_symbol_state_inquiry_message(symbol_state_inquiry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_state_inquiry_message(symbol_state_inquiry_message_sent);
    assert(at == 37);
    at = 0;
    decode_symbol_state_inquiry_message(symbol_state_inquiry_message_got);
    assert(at == 37);
    equal_symbol_state_inquiry_message(symbol_state_inquiry_message_got, symbol_state_inquiry_message_sent)
  }
}

/* End Of Participant Reporting Message: encoded, read back, and compared */
proctype check_end_of_participant_reporting_message() {
  EndOfParticipantReportingMessage end_of_participant_reporting_message_sent;
  EndOfParticipantReportingMessage end_of_participant_reporting_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_participant_reporting_message(end_of_participant_reporting_message_sent, 0)
  :: pattern == 1 -> fill_end_of_participant_reporting_message(end_of_participant_reporting_message_sent, 32)
  :: pattern == 2 -> fill_end_of_participant_reporting_message(end_of_participant_reporting_message_sent, 255)
  :: else -> ramp_end_of_participant_reporting_message(end_of_participant_reporting_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_participant_reporting_message(end_of_participant_reporting_message_sent);
    assert(at == 26);
    at = 0;
    decode_end_of_participant_reporting_message(end_of_participant_reporting_message_got);
    assert(at == 26);
    equal_end_of_participant_reporting_message(end_of_participant_reporting_message_got, end_of_participant_reporting_message_sent)
  }
}

/* Return Market Center Trading Action Acknowledgement Message: encoded, read back, and compared */
proctype check_return_market_center_trading_action_acknowledgement_message() {
  ReturnMarketCenterTradingActionAcknowledgementMessage return_market_center_trading_action_acknowledgement_message_sent;
  ReturnMarketCenterTradingActionAcknowledgementMessage return_market_center_trading_action_acknowledgement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_return_market_center_trading_action_acknowledgement_message(return_market_center_trading_action_acknowledgement_message_sent, 0)
  :: pattern == 1 -> fill_return_market_center_trading_action_acknowledgement_message(return_market_center_trading_action_acknowledgement_message_sent, 32)
  :: pattern == 2 -> fill_return_market_center_trading_action_acknowledgement_message(return_market_center_trading_action_acknowledgement_message_sent, 255)
  :: else -> ramp_return_market_center_trading_action_acknowledgement_message(return_market_center_trading_action_acknowledgement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_return_market_center_trading_action_acknowledgement_message(return_market_center_trading_action_acknowledgement_message_sent);
    assert(at == 30);
    at = 0;
    decode_return_market_center_trading_action_acknowledgement_message(return_market_center_trading_action_acknowledgement_message_got);
    assert(at == 30);
    equal_return_market_center_trading_action_acknowledgement_message(return_market_center_trading_action_acknowledgement_message_got, return_market_center_trading_action_acknowledgement_message_sent)
  }
}

/* Return Market Open Message: encoded, read back, and compared */
proctype check_return_market_open_message() {
  ReturnMarketOpenMessage return_market_open_message_sent;
  ReturnMarketOpenMessage return_market_open_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_return_market_open_message(return_market_open_message_sent, 0)
  :: pattern == 1 -> fill_return_market_open_message(return_market_open_message_sent, 32)
  :: pattern == 2 -> fill_return_market_open_message(return_market_open_message_sent, 255)
  :: else -> ramp_return_market_open_message(return_market_open_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_return_market_open_message(return_market_open_message_sent);
    assert(at == 10);
    at = 0;
    decode_return_market_open_message(return_market_open_message_got);
    assert(at == 10);
    equal_return_market_open_message(return_market_open_message_got, return_market_open_message_sent)
  }
}

/* Return Market Closed Message: encoded, read back, and compared */
proctype check_return_market_closed_message() {
  ReturnMarketClosedMessage return_market_closed_message_sent;
  ReturnMarketClosedMessage return_market_closed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_return_market_closed_message(return_market_closed_message_sent, 0)
  :: pattern == 1 -> fill_return_market_closed_message(return_market_closed_message_sent, 32)
  :: pattern == 2 -> fill_return_market_closed_message(return_market_closed_message_sent, 255)
  :: else -> ramp_return_market_closed_message(return_market_closed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_return_market_closed_message(return_market_closed_message_sent);
    assert(at == 10);
    at = 0;
    decode_return_market_closed_message(return_market_closed_message_got);
    assert(at == 10);
    equal_return_market_closed_message(return_market_closed_message_got, return_market_closed_message_sent)
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
    assert(at == 29);
    at = 0;
    decode_reject_message(reject_message_got);
    assert(at == 29);
    equal_reject_message(reject_message_got, reject_message_sent)
  }
}

/* Sequence Acknowledgement Message: encoded, read back, and compared */
proctype check_sequence_acknowledgement_message() {
  SequenceAcknowledgementMessage sequence_acknowledgement_message_sent;
  SequenceAcknowledgementMessage sequence_acknowledgement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_acknowledgement_message(sequence_acknowledgement_message_sent, 0)
  :: pattern == 1 -> fill_sequence_acknowledgement_message(sequence_acknowledgement_message_sent, 32)
  :: pattern == 2 -> fill_sequence_acknowledgement_message(sequence_acknowledgement_message_sent, 255)
  :: else -> ramp_sequence_acknowledgement_message(sequence_acknowledgement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_acknowledgement_message(sequence_acknowledgement_message_sent);
    assert(at == 26);
    at = 0;
    decode_sequence_acknowledgement_message(sequence_acknowledgement_message_got);
    assert(at == 26);
    equal_sequence_acknowledgement_message(sequence_acknowledgement_message_got, sequence_acknowledgement_message_sent)
  }
}

/* Participant Input Warning Message: encoded, read back, and compared */
proctype check_participant_input_warning_message() {
  ParticipantInputWarningMessage participant_input_warning_message_sent;
  ParticipantInputWarningMessage participant_input_warning_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_participant_input_warning_message(participant_input_warning_message_sent, 0)
  :: pattern == 1 -> fill_participant_input_warning_message(participant_input_warning_message_sent, 32)
  :: pattern == 2 -> fill_participant_input_warning_message(participant_input_warning_message_sent, 255)
  :: else -> ramp_participant_input_warning_message(participant_input_warning_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_participant_input_warning_message(participant_input_warning_message_sent);
    assert(at == 42);
    at = 0;
    decode_participant_input_warning_message(participant_input_warning_message_got);
    assert(at == 42);
    equal_participant_input_warning_message(participant_input_warning_message_got, participant_input_warning_message_sent)
  }
}

/* Start Of Day Message: encoded, read back, and compared */
proctype check_start_of_day_message() {
  StartOfDayMessage start_of_day_message_sent;
  StartOfDayMessage start_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_day_message(start_of_day_message_sent, 0)
  :: pattern == 1 -> fill_start_of_day_message(start_of_day_message_sent, 32)
  :: pattern == 2 -> fill_start_of_day_message(start_of_day_message_sent, 255)
  :: else -> ramp_start_of_day_message(start_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_day_message(start_of_day_message_sent);
    assert(at == 10);
    at = 0;
    decode_start_of_day_message(start_of_day_message_got);
    assert(at == 10);
    equal_start_of_day_message(start_of_day_message_got, start_of_day_message_sent)
  }
}

/* End Of Day Message: encoded, read back, and compared */
proctype check_end_of_day_message() {
  EndOfDayMessage end_of_day_message_sent;
  EndOfDayMessage end_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_day_message(end_of_day_message_sent, 0)
  :: pattern == 1 -> fill_end_of_day_message(end_of_day_message_sent, 32)
  :: pattern == 2 -> fill_end_of_day_message(end_of_day_message_sent, 255)
  :: else -> ramp_end_of_day_message(end_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_day_message(end_of_day_message_sent);
    assert(at == 10);
    at = 0;
    decode_end_of_day_message(end_of_day_message_got);
    assert(at == 10);
    equal_end_of_day_message(end_of_day_message_got, end_of_day_message_sent)
  }
}

/* Sequence Inquiry Response Message: encoded, read back, and compared */
proctype check_sequence_inquiry_response_message() {
  SequenceInquiryResponseMessage sequence_inquiry_response_message_sent;
  SequenceInquiryResponseMessage sequence_inquiry_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_inquiry_response_message(sequence_inquiry_response_message_sent, 0)
  :: pattern == 1 -> fill_sequence_inquiry_response_message(sequence_inquiry_response_message_sent, 32)
  :: pattern == 2 -> fill_sequence_inquiry_response_message(sequence_inquiry_response_message_sent, 255)
  :: else -> ramp_sequence_inquiry_response_message(sequence_inquiry_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_inquiry_response_message(sequence_inquiry_response_message_sent);
    assert(at == 27);
    at = 0;
    decode_sequence_inquiry_response_message(sequence_inquiry_response_message_got);
    assert(at == 27);
    equal_sequence_inquiry_response_message(sequence_inquiry_response_message_got, sequence_inquiry_response_message_sent)
  }
}

/* Symbol State Inquiry Response Message: encoded, read back, and compared */
proctype check_symbol_state_inquiry_response_message() {
  SymbolStateInquiryResponseMessage symbol_state_inquiry_response_message_sent;
  SymbolStateInquiryResponseMessage symbol_state_inquiry_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_state_inquiry_response_message(symbol_state_inquiry_response_message_sent, 0)
  :: pattern == 1 -> fill_symbol_state_inquiry_response_message(symbol_state_inquiry_response_message_sent, 32)
  :: pattern == 2 -> fill_symbol_state_inquiry_response_message(symbol_state_inquiry_response_message_sent, 255)
  :: else -> ramp_symbol_state_inquiry_response_message(symbol_state_inquiry_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_state_inquiry_response_message(symbol_state_inquiry_response_message_sent);
    assert(at == 30);
    at = 0;
    decode_symbol_state_inquiry_response_message(symbol_state_inquiry_response_message_got);
    assert(at == 30);
    equal_symbol_state_inquiry_response_message(symbol_state_inquiry_response_message_got, symbol_state_inquiry_response_message_sent)
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_client_tcp_packet_header()
  :: run check_message_header()
  :: run check_protected_exchange_quote_message_short_form_message()
  :: run check_protected_exchange_quote_message_long_form_message()
  :: run check_finra_protected_quote_message_with_bbo_info_message()
  :: run check_finra_protected_quote_message_without_bbo_info_message()
  :: run check_regular_trade_report_message()
  :: run check_trade_cancel_error_message()
  :: run check_trade_correction_message()
  :: run check_as_of_trade_report_message()
  :: run check_fractional_regular_trade_report_message()
  :: run check_fractional_trade_cancel_error_message()
  :: run check_fractional_trade_correction_message()
  :: run check_fractional_as_of_trade_report_message()
  :: run check_trading_action_message()
  :: run check_market_center_trading_action_message()
  :: run check_market_center_mass_trading_action_message()
  :: run check_reg_sho_short_sale_price_test_restricted_indicator_message()
  :: run check_opening_reference_midpoint_price_message()
  :: run check_t1_adjusted_closing_price_message()
  :: run check_market_open_message()
  :: run check_market_closed_message()
  :: run check_auction_collar_message()
  :: run check_sequence_inquiry_message()
  :: run check_symbol_state_inquiry_message()
  :: run check_end_of_participant_reporting_message()
  :: run check_return_market_center_trading_action_acknowledgement_message()
  :: run check_return_market_open_message()
  :: run check_return_market_closed_message()
  :: run check_reject_message()
  :: run check_sequence_acknowledgement_message()
  :: run check_participant_input_warning_message()
  :: run check_start_of_day_message()
  :: run check_end_of_day_message()
  :: run check_sequence_inquiry_response_message()
  :: run check_symbol_state_inquiry_response_message()
  :: run check_login_request_packet()
  fi
}
