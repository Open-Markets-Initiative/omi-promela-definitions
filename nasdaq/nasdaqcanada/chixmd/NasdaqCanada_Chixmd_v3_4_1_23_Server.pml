/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) CHIXMD Market Data
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
 *   - a field filling what is left of what holds it
 *   - the dispatch that chooses a message by its type
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 76

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Server Packet Header: 1 bytes ------------------------------------------- */

/* SoupTcp Packet Header sent by the server */
typedef ServerPacketHeader {
  byte server_packet_type
};

/* every byte of Server Packet Header set to one value */
inline fill_server_packet_header(server_packet_header_record, server_packet_header_value) {
  server_packet_header_record.server_packet_type = server_packet_header_value;
  skip
}

/* each byte of Server Packet Header set to where it lies, so a field read out of place says so */
inline ramp_server_packet_header(server_packet_header_record, server_packet_header_base) {
  server_packet_header_record.server_packet_type = (server_packet_header_base + 0 + 1) % 256;
  skip
}

/* Server Packet Header to the wire, 1 bytes from where the cursor stands */
inline encode_server_packet_header(server_packet_header_record) {
  wire[at] = server_packet_header_record.server_packet_type; at = at + 1;
  skip
}

/* Server Packet Header off the wire, 1 bytes from where the cursor stands */
inline decode_server_packet_header(server_packet_header_record) {
  server_packet_header_record.server_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Server Packet Header is what was written, byte for byte */
inline equal_server_packet_header(server_packet_header_read, server_packet_header_written) {
  assert(server_packet_header_read.server_packet_type == server_packet_header_written.server_packet_type);
  skip
}

/* ---- Login Accepted Packet: 31 bytes ----------------------------------------- */

/* The SoupTcp server sends a Login Accepted Packet in response to receiving a valid Login Request  from the client. */
typedef LoginAcceptedPacket {
  byte accepted_session[10];
  byte accepted_sequence_number[10];
  byte comma;
  byte messages_total[10]
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
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_record.comma = login_accepted_packet_value;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.messages_total[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
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
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = (login_accepted_packet_base + 10 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_record.comma = (login_accepted_packet_base + 20 + 1) % 256;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.messages_total[login_accepted_packet_at] = (login_accepted_packet_base + 21 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet to the wire, 31 bytes from where the cursor stands */
inline encode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> wire[at] = login_accepted_packet_record.accepted_session[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> wire[at] = login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  wire[at] = login_accepted_packet_record.comma; at = at + 1;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> wire[at] = login_accepted_packet_record.messages_total[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet off the wire, 31 bytes from where the cursor stands */
inline decode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_session[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_record.comma = wire[at]; at = at + 1;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.messages_total[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
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
  :: login_accepted_packet_at < 10 -> assert(login_accepted_packet_read.accepted_sequence_number[login_accepted_packet_at] == login_accepted_packet_written.accepted_sequence_number[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  assert(login_accepted_packet_read.comma == login_accepted_packet_written.comma);
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> assert(login_accepted_packet_read.messages_total[login_accepted_packet_at] == login_accepted_packet_written.messages_total[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Rejected Packet: 1 bytes ------------------------------------------ */

/* The SoupTcp server sends this packet in response to an invalid Login Request Packet from the client. */
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

/* ---- Sequenced Message Header: 9 bytes --------------------------------------- */

/* Time and type carried ahead of every sequenced Itch message */
typedef SequencedMessageHeader {
  byte timestamp[8];
  byte message_type
};

int sequenced_message_header_at;

/* every byte of Sequenced Message Header set to one value */
inline fill_sequenced_message_header(sequenced_message_header_record, sequenced_message_header_value) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = sequenced_message_header_value; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.message_type = sequenced_message_header_value;
  skip
}

/* each byte of Sequenced Message Header set to where it lies, so a field read out of place says so */
inline ramp_sequenced_message_header(sequenced_message_header_record, sequenced_message_header_base) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = (sequenced_message_header_base + 0 + sequenced_message_header_at + 1) % 256; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.message_type = (sequenced_message_header_base + 8 + 1) % 256;
  skip
}

/* Sequenced Message Header to the wire, 9 bytes from where the cursor stands */
inline encode_sequenced_message_header(sequenced_message_header_record) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> wire[at] = sequenced_message_header_record.timestamp[sequenced_message_header_at]; at = at + 1; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  wire[at] = sequenced_message_header_record.message_type; at = at + 1;
  skip
}

/* Sequenced Message Header off the wire, 9 bytes from where the cursor stands */
inline decode_sequenced_message_header(sequenced_message_header_record) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = wire[at]; at = at + 1; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Sequenced Message Header is what was written, byte for byte */
inline equal_sequenced_message_header(sequenced_message_header_read, sequenced_message_header_written) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> assert(sequenced_message_header_read.timestamp[sequenced_message_header_at] == sequenced_message_header_written.timestamp[sequenced_message_header_at]); sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  assert(sequenced_message_header_read.message_type == sequenced_message_header_written.message_type);
  skip
}

/* ---- Add Order Message: 39 bytes --------------------------------------------- */

/* An Add Order Message indicates that CXC or CX2 has accepted a visible order into the book. It includes a day-unique Order Reference key assigned to the order. The issuing of an Add Order Message is not necessarily always for a new order (see Modification of Existing Orders). Not applicable to CXD. */
typedef AddOrderMessage {
  byte order_reference[9];
  byte buy_sell_indicator;
  byte shares[6];
  byte stock[10];
  byte price[10];
  byte broker[3]
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 9 -> add_order_message_record.order_reference[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.buy_sell_indicator = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.shares[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> add_order_message_record.stock[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> add_order_message_record.broker[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 9 -> add_order_message_record.order_reference[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.buy_sell_indicator = (add_order_message_base + 9 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.shares[add_order_message_at] = (add_order_message_base + 10 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> add_order_message_record.stock[add_order_message_at] = (add_order_message_base + 16 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 26 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> add_order_message_record.broker[add_order_message_at] = (add_order_message_base + 36 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message to the wire, 39 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 9 -> wire[at] = add_order_message_record.order_reference[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.buy_sell_indicator; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> wire[at] = add_order_message_record.shares[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> wire[at] = add_order_message_record.stock[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> wire[at] = add_order_message_record.broker[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message off the wire, 39 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 9 -> add_order_message_record.order_reference[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.shares[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> add_order_message_record.stock[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> add_order_message_record.broker[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 9 -> assert(add_order_message_read.order_reference[add_order_message_at] == add_order_message_written.order_reference[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.buy_sell_indicator == add_order_message_written.buy_sell_indicator);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> assert(add_order_message_read.shares[add_order_message_at] == add_order_message_written.shares[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> assert(add_order_message_read.stock[add_order_message_at] == add_order_message_written.stock[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> assert(add_order_message_read.broker[add_order_message_at] == add_order_message_written.broker[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Form Add Order Message: 52 bytes ----------------------------------- */

/* An Add Order Message indicates that CXC or CX2 has accepted a visible order into the book. It includes a day-unique Order Reference key assigned to the order. The issuing of an Add Order Message is not necessarily always for a new order (see Modification of Existing Orders). Not applicable to CXD. Long form messages are used when either the price or size is larger than the standard messages can permit. */
typedef LongFormAddOrderMessage {
  byte order_reference[9];
  byte buy_sell_indicator;
  byte long_shares[10];
  byte stock[10];
  byte long_price[19];
  byte broker[3]
};

int long_form_add_order_message_at;

/* every byte of Long Form Add Order Message set to one value */
inline fill_long_form_add_order_message(long_form_add_order_message_record, long_form_add_order_message_value) {
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 9 -> long_form_add_order_message_record.order_reference[long_form_add_order_message_at] = long_form_add_order_message_value; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_record.buy_sell_indicator = long_form_add_order_message_value;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 10 -> long_form_add_order_message_record.long_shares[long_form_add_order_message_at] = long_form_add_order_message_value; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 10 -> long_form_add_order_message_record.stock[long_form_add_order_message_at] = long_form_add_order_message_value; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 19 -> long_form_add_order_message_record.long_price[long_form_add_order_message_at] = long_form_add_order_message_value; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 3 -> long_form_add_order_message_record.broker[long_form_add_order_message_at] = long_form_add_order_message_value; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Form Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_long_form_add_order_message(long_form_add_order_message_record, long_form_add_order_message_base) {
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 9 -> long_form_add_order_message_record.order_reference[long_form_add_order_message_at] = (long_form_add_order_message_base + 0 + long_form_add_order_message_at + 1) % 256; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_record.buy_sell_indicator = (long_form_add_order_message_base + 9 + 1) % 256;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 10 -> long_form_add_order_message_record.long_shares[long_form_add_order_message_at] = (long_form_add_order_message_base + 10 + long_form_add_order_message_at + 1) % 256; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 10 -> long_form_add_order_message_record.stock[long_form_add_order_message_at] = (long_form_add_order_message_base + 20 + long_form_add_order_message_at + 1) % 256; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 19 -> long_form_add_order_message_record.long_price[long_form_add_order_message_at] = (long_form_add_order_message_base + 30 + long_form_add_order_message_at + 1) % 256; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 3 -> long_form_add_order_message_record.broker[long_form_add_order_message_at] = (long_form_add_order_message_base + 49 + long_form_add_order_message_at + 1) % 256; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Form Add Order Message to the wire, 52 bytes from where the cursor stands */
inline encode_long_form_add_order_message(long_form_add_order_message_record) {
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 9 -> wire[at] = long_form_add_order_message_record.order_reference[long_form_add_order_message_at]; at = at + 1; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = long_form_add_order_message_record.buy_sell_indicator; at = at + 1;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 10 -> wire[at] = long_form_add_order_message_record.long_shares[long_form_add_order_message_at]; at = at + 1; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 10 -> wire[at] = long_form_add_order_message_record.stock[long_form_add_order_message_at]; at = at + 1; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 19 -> wire[at] = long_form_add_order_message_record.long_price[long_form_add_order_message_at]; at = at + 1; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 3 -> wire[at] = long_form_add_order_message_record.broker[long_form_add_order_message_at]; at = at + 1; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Form Add Order Message off the wire, 52 bytes from where the cursor stands */
inline decode_long_form_add_order_message(long_form_add_order_message_record) {
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 9 -> long_form_add_order_message_record.order_reference[long_form_add_order_message_at] = wire[at]; at = at + 1; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 10 -> long_form_add_order_message_record.long_shares[long_form_add_order_message_at] = wire[at]; at = at + 1; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 10 -> long_form_add_order_message_record.stock[long_form_add_order_message_at] = wire[at]; at = at + 1; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 19 -> long_form_add_order_message_record.long_price[long_form_add_order_message_at] = wire[at]; at = at + 1; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 3 -> long_form_add_order_message_record.broker[long_form_add_order_message_at] = wire[at]; at = at + 1; long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Form Add Order Message is what was written, byte for byte */
inline equal_long_form_add_order_message(long_form_add_order_message_read, long_form_add_order_message_written) {
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 9 -> assert(long_form_add_order_message_read.order_reference[long_form_add_order_message_at] == long_form_add_order_message_written.order_reference[long_form_add_order_message_at]); long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  assert(long_form_add_order_message_read.buy_sell_indicator == long_form_add_order_message_written.buy_sell_indicator);
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 10 -> assert(long_form_add_order_message_read.long_shares[long_form_add_order_message_at] == long_form_add_order_message_written.long_shares[long_form_add_order_message_at]); long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 10 -> assert(long_form_add_order_message_read.stock[long_form_add_order_message_at] == long_form_add_order_message_written.stock[long_form_add_order_message_at]); long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 19 -> assert(long_form_add_order_message_read.long_price[long_form_add_order_message_at] == long_form_add_order_message_written.long_price[long_form_add_order_message_at]); long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  long_form_add_order_message_at = 0;
  do
  :: long_form_add_order_message_at < 3 -> assert(long_form_add_order_message_read.broker[long_form_add_order_message_at] == long_form_add_order_message_written.broker[long_form_add_order_message_at]); long_form_add_order_message_at = long_form_add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Execution Message: 40 bytes --------------------------------------- */

/* An Order Execution Message is sent whenever an order on the book is executed in whole or in part. Not applicable to CXD. */
typedef OrderExecutionMessage {
  byte order_reference[9];
  byte executed_shares[6];
  byte trade_reference[9];
  byte contra_order_reference[9];
  byte trade_attribute;
  byte broker[3];
  byte contra_broker[3]
};

int order_execution_message_at;

/* every byte of Order Execution Message set to one value */
inline fill_order_execution_message(order_execution_message_record, order_execution_message_value) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> order_execution_message_record.order_reference[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 6 -> order_execution_message_record.executed_shares[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> order_execution_message_record.trade_reference[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> order_execution_message_record.contra_order_reference[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.trade_attribute = order_execution_message_value;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> order_execution_message_record.broker[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> order_execution_message_record.contra_broker[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Execution Message set to where it lies, so a field read out of place says so */
inline ramp_order_execution_message(order_execution_message_record, order_execution_message_base) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> order_execution_message_record.order_reference[order_execution_message_at] = (order_execution_message_base + 0 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 6 -> order_execution_message_record.executed_shares[order_execution_message_at] = (order_execution_message_base + 9 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> order_execution_message_record.trade_reference[order_execution_message_at] = (order_execution_message_base + 15 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> order_execution_message_record.contra_order_reference[order_execution_message_at] = (order_execution_message_base + 24 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.trade_attribute = (order_execution_message_base + 33 + 1) % 256;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> order_execution_message_record.broker[order_execution_message_at] = (order_execution_message_base + 34 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> order_execution_message_record.contra_broker[order_execution_message_at] = (order_execution_message_base + 37 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution Message to the wire, 40 bytes from where the cursor stands */
inline encode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> wire[at] = order_execution_message_record.order_reference[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 6 -> wire[at] = order_execution_message_record.executed_shares[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> wire[at] = order_execution_message_record.trade_reference[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> wire[at] = order_execution_message_record.contra_order_reference[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.trade_attribute; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> wire[at] = order_execution_message_record.broker[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> wire[at] = order_execution_message_record.contra_broker[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution Message off the wire, 40 bytes from where the cursor stands */
inline decode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> order_execution_message_record.order_reference[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 6 -> order_execution_message_record.executed_shares[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> order_execution_message_record.trade_reference[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> order_execution_message_record.contra_order_reference[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.trade_attribute = wire[at]; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> order_execution_message_record.broker[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> order_execution_message_record.contra_broker[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Execution Message is what was written, byte for byte */
inline equal_order_execution_message(order_execution_message_read, order_execution_message_written) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> assert(order_execution_message_read.order_reference[order_execution_message_at] == order_execution_message_written.order_reference[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 6 -> assert(order_execution_message_read.executed_shares[order_execution_message_at] == order_execution_message_written.executed_shares[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> assert(order_execution_message_read.trade_reference[order_execution_message_at] == order_execution_message_written.trade_reference[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 9 -> assert(order_execution_message_read.contra_order_reference[order_execution_message_at] == order_execution_message_written.contra_order_reference[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.trade_attribute == order_execution_message_written.trade_attribute);
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> assert(order_execution_message_read.broker[order_execution_message_at] == order_execution_message_written.broker[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 3 -> assert(order_execution_message_read.contra_broker[order_execution_message_at] == order_execution_message_written.contra_broker[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Form Order Execution Message: 44 bytes ----------------------------- */

/* An Order Execution Message is sent whenever an order on the book is executed in whole or in part. Not applicable to CXD. Long form messages are used when either the price or size is larger than the standard messages can permit. */
typedef LongFormOrderExecutionMessage {
  byte order_reference[9];
  byte long_executed_shares[10];
  byte trade_reference[9];
  byte contra_order_reference[9];
  byte trade_attribute;
  byte broker[3];
  byte contra_broker[3]
};

int long_form_order_execution_message_at;

/* every byte of Long Form Order Execution Message set to one value */
inline fill_long_form_order_execution_message(long_form_order_execution_message_record, long_form_order_execution_message_value) {
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> long_form_order_execution_message_record.order_reference[long_form_order_execution_message_at] = long_form_order_execution_message_value; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 10 -> long_form_order_execution_message_record.long_executed_shares[long_form_order_execution_message_at] = long_form_order_execution_message_value; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> long_form_order_execution_message_record.trade_reference[long_form_order_execution_message_at] = long_form_order_execution_message_value; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> long_form_order_execution_message_record.contra_order_reference[long_form_order_execution_message_at] = long_form_order_execution_message_value; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_record.trade_attribute = long_form_order_execution_message_value;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 3 -> long_form_order_execution_message_record.broker[long_form_order_execution_message_at] = long_form_order_execution_message_value; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 3 -> long_form_order_execution_message_record.contra_broker[long_form_order_execution_message_at] = long_form_order_execution_message_value; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Form Order Execution Message set to where it lies, so a field read out of place says so */
inline ramp_long_form_order_execution_message(long_form_order_execution_message_record, long_form_order_execution_message_base) {
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> long_form_order_execution_message_record.order_reference[long_form_order_execution_message_at] = (long_form_order_execution_message_base + 0 + long_form_order_execution_message_at + 1) % 256; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 10 -> long_form_order_execution_message_record.long_executed_shares[long_form_order_execution_message_at] = (long_form_order_execution_message_base + 9 + long_form_order_execution_message_at + 1) % 256; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> long_form_order_execution_message_record.trade_reference[long_form_order_execution_message_at] = (long_form_order_execution_message_base + 19 + long_form_order_execution_message_at + 1) % 256; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> long_form_order_execution_message_record.contra_order_reference[long_form_order_execution_message_at] = (long_form_order_execution_message_base + 28 + long_form_order_execution_message_at + 1) % 256; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_record.trade_attribute = (long_form_order_execution_message_base + 37 + 1) % 256;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 3 -> long_form_order_execution_message_record.broker[long_form_order_execution_message_at] = (long_form_order_execution_message_base + 38 + long_form_order_execution_message_at + 1) % 256; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 3 -> long_form_order_execution_message_record.contra_broker[long_form_order_execution_message_at] = (long_form_order_execution_message_base + 41 + long_form_order_execution_message_at + 1) % 256; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Form Order Execution Message to the wire, 44 bytes from where the cursor stands */
inline encode_long_form_order_execution_message(long_form_order_execution_message_record) {
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> wire[at] = long_form_order_execution_message_record.order_reference[long_form_order_execution_message_at]; at = at + 1; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 10 -> wire[at] = long_form_order_execution_message_record.long_executed_shares[long_form_order_execution_message_at]; at = at + 1; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> wire[at] = long_form_order_execution_message_record.trade_reference[long_form_order_execution_message_at]; at = at + 1; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> wire[at] = long_form_order_execution_message_record.contra_order_reference[long_form_order_execution_message_at]; at = at + 1; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = long_form_order_execution_message_record.trade_attribute; at = at + 1;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 3 -> wire[at] = long_form_order_execution_message_record.broker[long_form_order_execution_message_at]; at = at + 1; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 3 -> wire[at] = long_form_order_execution_message_record.contra_broker[long_form_order_execution_message_at]; at = at + 1; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Form Order Execution Message off the wire, 44 bytes from where the cursor stands */
inline decode_long_form_order_execution_message(long_form_order_execution_message_record) {
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> long_form_order_execution_message_record.order_reference[long_form_order_execution_message_at] = wire[at]; at = at + 1; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 10 -> long_form_order_execution_message_record.long_executed_shares[long_form_order_execution_message_at] = wire[at]; at = at + 1; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> long_form_order_execution_message_record.trade_reference[long_form_order_execution_message_at] = wire[at]; at = at + 1; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> long_form_order_execution_message_record.contra_order_reference[long_form_order_execution_message_at] = wire[at]; at = at + 1; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_record.trade_attribute = wire[at]; at = at + 1;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 3 -> long_form_order_execution_message_record.broker[long_form_order_execution_message_at] = wire[at]; at = at + 1; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 3 -> long_form_order_execution_message_record.contra_broker[long_form_order_execution_message_at] = wire[at]; at = at + 1; long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Form Order Execution Message is what was written, byte for byte */
inline equal_long_form_order_execution_message(long_form_order_execution_message_read, long_form_order_execution_message_written) {
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> assert(long_form_order_execution_message_read.order_reference[long_form_order_execution_message_at] == long_form_order_execution_message_written.order_reference[long_form_order_execution_message_at]); long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 10 -> assert(long_form_order_execution_message_read.long_executed_shares[long_form_order_execution_message_at] == long_form_order_execution_message_written.long_executed_shares[long_form_order_execution_message_at]); long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> assert(long_form_order_execution_message_read.trade_reference[long_form_order_execution_message_at] == long_form_order_execution_message_written.trade_reference[long_form_order_execution_message_at]); long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 9 -> assert(long_form_order_execution_message_read.contra_order_reference[long_form_order_execution_message_at] == long_form_order_execution_message_written.contra_order_reference[long_form_order_execution_message_at]); long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  assert(long_form_order_execution_message_read.trade_attribute == long_form_order_execution_message_written.trade_attribute);
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 3 -> assert(long_form_order_execution_message_read.broker[long_form_order_execution_message_at] == long_form_order_execution_message_written.broker[long_form_order_execution_message_at]); long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  long_form_order_execution_message_at = 0;
  do
  :: long_form_order_execution_message_at < 3 -> assert(long_form_order_execution_message_read.contra_broker[long_form_order_execution_message_at] == long_form_order_execution_message_written.contra_broker[long_form_order_execution_message_at]); long_form_order_execution_message_at = long_form_order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Message: 15 bytes ------------------------------------------ */

/* An Order Cancel Message is sent whenever an order on the book is fully canceled, its quantity revised down or when a pegged order is re-priced. Not applicable to CXD. */
typedef OrderCancelMessage {
  byte order_reference[9];
  byte canceled_shares[6]
};

int order_cancel_message_at;

/* every byte of Order Cancel Message set to one value */
inline fill_order_cancel_message(order_cancel_message_record, order_cancel_message_value) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 9 -> order_cancel_message_record.order_reference[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> order_cancel_message_record.canceled_shares[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_message(order_cancel_message_record, order_cancel_message_base) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 9 -> order_cancel_message_record.order_reference[order_cancel_message_at] = (order_cancel_message_base + 0 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> order_cancel_message_record.canceled_shares[order_cancel_message_at] = (order_cancel_message_base + 9 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message to the wire, 15 bytes from where the cursor stands */
inline encode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 9 -> wire[at] = order_cancel_message_record.order_reference[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> wire[at] = order_cancel_message_record.canceled_shares[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message off the wire, 15 bytes from where the cursor stands */
inline decode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 9 -> order_cancel_message_record.order_reference[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> order_cancel_message_record.canceled_shares[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Message is what was written, byte for byte */
inline equal_order_cancel_message(order_cancel_message_read, order_cancel_message_written) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 9 -> assert(order_cancel_message_read.order_reference[order_cancel_message_at] == order_cancel_message_written.order_reference[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> assert(order_cancel_message_read.canceled_shares[order_cancel_message_at] == order_cancel_message_written.canceled_shares[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Form Order Cancel Message: 19 bytes -------------------------------- */

/* An Order Cancel Message is sent whenever an order on the book is fully canceled, its quantity revised down or when a pegged order is re-priced. Not applicable to CXD. Long form messages are used when either the price or size is larger than the standard messages can permit. */
typedef LongFormOrderCancelMessage {
  byte order_reference[9];
  byte long_canceled_shares[10]
};

int long_form_order_cancel_message_at;

/* every byte of Long Form Order Cancel Message set to one value */
inline fill_long_form_order_cancel_message(long_form_order_cancel_message_record, long_form_order_cancel_message_value) {
  long_form_order_cancel_message_at = 0;
  do
  :: long_form_order_cancel_message_at < 9 -> long_form_order_cancel_message_record.order_reference[long_form_order_cancel_message_at] = long_form_order_cancel_message_value; long_form_order_cancel_message_at = long_form_order_cancel_message_at + 1
  :: else -> break
  od;
  long_form_order_cancel_message_at = 0;
  do
  :: long_form_order_cancel_message_at < 10 -> long_form_order_cancel_message_record.long_canceled_shares[long_form_order_cancel_message_at] = long_form_order_cancel_message_value; long_form_order_cancel_message_at = long_form_order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Form Order Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_long_form_order_cancel_message(long_form_order_cancel_message_record, long_form_order_cancel_message_base) {
  long_form_order_cancel_message_at = 0;
  do
  :: long_form_order_cancel_message_at < 9 -> long_form_order_cancel_message_record.order_reference[long_form_order_cancel_message_at] = (long_form_order_cancel_message_base + 0 + long_form_order_cancel_message_at + 1) % 256; long_form_order_cancel_message_at = long_form_order_cancel_message_at + 1
  :: else -> break
  od;
  long_form_order_cancel_message_at = 0;
  do
  :: long_form_order_cancel_message_at < 10 -> long_form_order_cancel_message_record.long_canceled_shares[long_form_order_cancel_message_at] = (long_form_order_cancel_message_base + 9 + long_form_order_cancel_message_at + 1) % 256; long_form_order_cancel_message_at = long_form_order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Form Order Cancel Message to the wire, 19 bytes from where the cursor stands */
inline encode_long_form_order_cancel_message(long_form_order_cancel_message_record) {
  long_form_order_cancel_message_at = 0;
  do
  :: long_form_order_cancel_message_at < 9 -> wire[at] = long_form_order_cancel_message_record.order_reference[long_form_order_cancel_message_at]; at = at + 1; long_form_order_cancel_message_at = long_form_order_cancel_message_at + 1
  :: else -> break
  od;
  long_form_order_cancel_message_at = 0;
  do
  :: long_form_order_cancel_message_at < 10 -> wire[at] = long_form_order_cancel_message_record.long_canceled_shares[long_form_order_cancel_message_at]; at = at + 1; long_form_order_cancel_message_at = long_form_order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Form Order Cancel Message off the wire, 19 bytes from where the cursor stands */
inline decode_long_form_order_cancel_message(long_form_order_cancel_message_record) {
  long_form_order_cancel_message_at = 0;
  do
  :: long_form_order_cancel_message_at < 9 -> long_form_order_cancel_message_record.order_reference[long_form_order_cancel_message_at] = wire[at]; at = at + 1; long_form_order_cancel_message_at = long_form_order_cancel_message_at + 1
  :: else -> break
  od;
  long_form_order_cancel_message_at = 0;
  do
  :: long_form_order_cancel_message_at < 10 -> long_form_order_cancel_message_record.long_canceled_shares[long_form_order_cancel_message_at] = wire[at]; at = at + 1; long_form_order_cancel_message_at = long_form_order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Form Order Cancel Message is what was written, byte for byte */
inline equal_long_form_order_cancel_message(long_form_order_cancel_message_read, long_form_order_cancel_message_written) {
  long_form_order_cancel_message_at = 0;
  do
  :: long_form_order_cancel_message_at < 9 -> assert(long_form_order_cancel_message_read.order_reference[long_form_order_cancel_message_at] == long_form_order_cancel_message_written.order_reference[long_form_order_cancel_message_at]); long_form_order_cancel_message_at = long_form_order_cancel_message_at + 1
  :: else -> break
  od;
  long_form_order_cancel_message_at = 0;
  do
  :: long_form_order_cancel_message_at < 10 -> assert(long_form_order_cancel_message_read.long_canceled_shares[long_form_order_cancel_message_at] == long_form_order_cancel_message_written.long_canceled_shares[long_form_order_cancel_message_at]); long_form_order_cancel_message_at = long_form_order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 63 bytes ------------------------------------------------- */

/* A Trade Message is sent when a trade occurs against order quantity not visible on the book (i.e. a fully or partially hidden order). They do not affect the book. The Order Reference is always 0 and the Buy/Sell indicator B. */
typedef TradeMessage {
  byte order_reference[9];
  byte buy_sell_indicator;
  byte shares[6];
  byte stock[10];
  byte price[10];
  byte trade_reference[9];
  byte contra_order_reference[9];
  byte broker[3];
  byte contra_broker[3];
  byte trade_attribute;
  byte cross_type;
  byte settlement_terms
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.order_reference[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.buy_sell_indicator = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.shares[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> trade_message_record.stock[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.trade_reference[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.contra_order_reference[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.broker[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.contra_broker[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_attribute = trade_message_value;
  trade_message_record.cross_type = trade_message_value;
  trade_message_record.settlement_terms = trade_message_value;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.order_reference[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.buy_sell_indicator = (trade_message_base + 9 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.shares[trade_message_at] = (trade_message_base + 10 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> trade_message_record.stock[trade_message_at] = (trade_message_base + 16 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> trade_message_record.price[trade_message_at] = (trade_message_base + 26 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.trade_reference[trade_message_at] = (trade_message_base + 36 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.contra_order_reference[trade_message_at] = (trade_message_base + 45 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.broker[trade_message_at] = (trade_message_base + 54 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.contra_broker[trade_message_at] = (trade_message_base + 57 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_attribute = (trade_message_base + 60 + 1) % 256;
  trade_message_record.cross_type = (trade_message_base + 61 + 1) % 256;
  trade_message_record.settlement_terms = (trade_message_base + 62 + 1) % 256;
  skip
}

/* Trade Message to the wire, 63 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> wire[at] = trade_message_record.order_reference[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.buy_sell_indicator; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> wire[at] = trade_message_record.shares[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> wire[at] = trade_message_record.stock[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> wire[at] = trade_message_record.trade_reference[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> wire[at] = trade_message_record.contra_order_reference[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> wire[at] = trade_message_record.broker[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> wire[at] = trade_message_record.contra_broker[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.trade_attribute; at = at + 1;
  wire[at] = trade_message_record.cross_type; at = at + 1;
  wire[at] = trade_message_record.settlement_terms; at = at + 1;
  skip
}

/* Trade Message off the wire, 63 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.order_reference[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.shares[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> trade_message_record.stock[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.trade_reference[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> trade_message_record.contra_order_reference[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.broker[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.contra_broker[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_attribute = wire[at]; at = at + 1;
  trade_message_record.cross_type = wire[at]; at = at + 1;
  trade_message_record.settlement_terms = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> assert(trade_message_read.order_reference[trade_message_at] == trade_message_written.order_reference[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.buy_sell_indicator == trade_message_written.buy_sell_indicator);
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> assert(trade_message_read.shares[trade_message_at] == trade_message_written.shares[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> assert(trade_message_read.stock[trade_message_at] == trade_message_written.stock[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> assert(trade_message_read.trade_reference[trade_message_at] == trade_message_written.trade_reference[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 9 -> assert(trade_message_read.contra_order_reference[trade_message_at] == trade_message_written.contra_order_reference[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> assert(trade_message_read.broker[trade_message_at] == trade_message_written.broker[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> assert(trade_message_read.contra_broker[trade_message_at] == trade_message_written.contra_broker[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.trade_attribute == trade_message_written.trade_attribute);
  assert(trade_message_read.cross_type == trade_message_written.cross_type);
  assert(trade_message_read.settlement_terms == trade_message_written.settlement_terms);
  skip
}

/* ---- Long Form Trade Message: 76 bytes --------------------------------------- */

/* A Trade Message is sent when a trade occurs against order quantity not visible on the book (i.e. a fully or partially hidden order). They do not affect the book. The Order Reference is always 0 and the Buy/Sell indicator B. Long form messages are used when either the price or size is larger than the standard messages can permit. */
typedef LongFormTradeMessage {
  byte order_reference[9];
  byte buy_sell_indicator;
  byte long_shares[10];
  byte stock[10];
  byte long_price[19];
  byte trade_reference[9];
  byte contra_order_reference[9];
  byte broker[3];
  byte contra_broker[3];
  byte trade_attribute;
  byte cross_type;
  byte settlement_terms
};

int long_form_trade_message_at;

/* every byte of Long Form Trade Message set to one value */
inline fill_long_form_trade_message(long_form_trade_message_record, long_form_trade_message_value) {
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> long_form_trade_message_record.order_reference[long_form_trade_message_at] = long_form_trade_message_value; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_record.buy_sell_indicator = long_form_trade_message_value;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 10 -> long_form_trade_message_record.long_shares[long_form_trade_message_at] = long_form_trade_message_value; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 10 -> long_form_trade_message_record.stock[long_form_trade_message_at] = long_form_trade_message_value; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 19 -> long_form_trade_message_record.long_price[long_form_trade_message_at] = long_form_trade_message_value; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> long_form_trade_message_record.trade_reference[long_form_trade_message_at] = long_form_trade_message_value; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> long_form_trade_message_record.contra_order_reference[long_form_trade_message_at] = long_form_trade_message_value; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 3 -> long_form_trade_message_record.broker[long_form_trade_message_at] = long_form_trade_message_value; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 3 -> long_form_trade_message_record.contra_broker[long_form_trade_message_at] = long_form_trade_message_value; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_record.trade_attribute = long_form_trade_message_value;
  long_form_trade_message_record.cross_type = long_form_trade_message_value;
  long_form_trade_message_record.settlement_terms = long_form_trade_message_value;
  skip
}

/* each byte of Long Form Trade Message set to where it lies, so a field read out of place says so */
inline ramp_long_form_trade_message(long_form_trade_message_record, long_form_trade_message_base) {
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> long_form_trade_message_record.order_reference[long_form_trade_message_at] = (long_form_trade_message_base + 0 + long_form_trade_message_at + 1) % 256; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_record.buy_sell_indicator = (long_form_trade_message_base + 9 + 1) % 256;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 10 -> long_form_trade_message_record.long_shares[long_form_trade_message_at] = (long_form_trade_message_base + 10 + long_form_trade_message_at + 1) % 256; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 10 -> long_form_trade_message_record.stock[long_form_trade_message_at] = (long_form_trade_message_base + 20 + long_form_trade_message_at + 1) % 256; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 19 -> long_form_trade_message_record.long_price[long_form_trade_message_at] = (long_form_trade_message_base + 30 + long_form_trade_message_at + 1) % 256; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> long_form_trade_message_record.trade_reference[long_form_trade_message_at] = (long_form_trade_message_base + 49 + long_form_trade_message_at + 1) % 256; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> long_form_trade_message_record.contra_order_reference[long_form_trade_message_at] = (long_form_trade_message_base + 58 + long_form_trade_message_at + 1) % 256; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 3 -> long_form_trade_message_record.broker[long_form_trade_message_at] = (long_form_trade_message_base + 67 + long_form_trade_message_at + 1) % 256; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 3 -> long_form_trade_message_record.contra_broker[long_form_trade_message_at] = (long_form_trade_message_base + 70 + long_form_trade_message_at + 1) % 256; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_record.trade_attribute = (long_form_trade_message_base + 73 + 1) % 256;
  long_form_trade_message_record.cross_type = (long_form_trade_message_base + 74 + 1) % 256;
  long_form_trade_message_record.settlement_terms = (long_form_trade_message_base + 75 + 1) % 256;
  skip
}

/* Long Form Trade Message to the wire, 76 bytes from where the cursor stands */
inline encode_long_form_trade_message(long_form_trade_message_record) {
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> wire[at] = long_form_trade_message_record.order_reference[long_form_trade_message_at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = long_form_trade_message_record.buy_sell_indicator; at = at + 1;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 10 -> wire[at] = long_form_trade_message_record.long_shares[long_form_trade_message_at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 10 -> wire[at] = long_form_trade_message_record.stock[long_form_trade_message_at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 19 -> wire[at] = long_form_trade_message_record.long_price[long_form_trade_message_at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> wire[at] = long_form_trade_message_record.trade_reference[long_form_trade_message_at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> wire[at] = long_form_trade_message_record.contra_order_reference[long_form_trade_message_at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 3 -> wire[at] = long_form_trade_message_record.broker[long_form_trade_message_at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 3 -> wire[at] = long_form_trade_message_record.contra_broker[long_form_trade_message_at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = long_form_trade_message_record.trade_attribute; at = at + 1;
  wire[at] = long_form_trade_message_record.cross_type; at = at + 1;
  wire[at] = long_form_trade_message_record.settlement_terms; at = at + 1;
  skip
}

/* Long Form Trade Message off the wire, 76 bytes from where the cursor stands */
inline decode_long_form_trade_message(long_form_trade_message_record) {
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> long_form_trade_message_record.order_reference[long_form_trade_message_at] = wire[at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 10 -> long_form_trade_message_record.long_shares[long_form_trade_message_at] = wire[at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 10 -> long_form_trade_message_record.stock[long_form_trade_message_at] = wire[at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 19 -> long_form_trade_message_record.long_price[long_form_trade_message_at] = wire[at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> long_form_trade_message_record.trade_reference[long_form_trade_message_at] = wire[at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> long_form_trade_message_record.contra_order_reference[long_form_trade_message_at] = wire[at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 3 -> long_form_trade_message_record.broker[long_form_trade_message_at] = wire[at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 3 -> long_form_trade_message_record.contra_broker[long_form_trade_message_at] = wire[at]; at = at + 1; long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_record.trade_attribute = wire[at]; at = at + 1;
  long_form_trade_message_record.cross_type = wire[at]; at = at + 1;
  long_form_trade_message_record.settlement_terms = wire[at]; at = at + 1;
  skip
}

/* what was read of Long Form Trade Message is what was written, byte for byte */
inline equal_long_form_trade_message(long_form_trade_message_read, long_form_trade_message_written) {
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> assert(long_form_trade_message_read.order_reference[long_form_trade_message_at] == long_form_trade_message_written.order_reference[long_form_trade_message_at]); long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  assert(long_form_trade_message_read.buy_sell_indicator == long_form_trade_message_written.buy_sell_indicator);
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 10 -> assert(long_form_trade_message_read.long_shares[long_form_trade_message_at] == long_form_trade_message_written.long_shares[long_form_trade_message_at]); long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 10 -> assert(long_form_trade_message_read.stock[long_form_trade_message_at] == long_form_trade_message_written.stock[long_form_trade_message_at]); long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 19 -> assert(long_form_trade_message_read.long_price[long_form_trade_message_at] == long_form_trade_message_written.long_price[long_form_trade_message_at]); long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> assert(long_form_trade_message_read.trade_reference[long_form_trade_message_at] == long_form_trade_message_written.trade_reference[long_form_trade_message_at]); long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 9 -> assert(long_form_trade_message_read.contra_order_reference[long_form_trade_message_at] == long_form_trade_message_written.contra_order_reference[long_form_trade_message_at]); long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 3 -> assert(long_form_trade_message_read.broker[long_form_trade_message_at] == long_form_trade_message_written.broker[long_form_trade_message_at]); long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  long_form_trade_message_at = 0;
  do
  :: long_form_trade_message_at < 3 -> assert(long_form_trade_message_read.contra_broker[long_form_trade_message_at] == long_form_trade_message_written.contra_broker[long_form_trade_message_at]); long_form_trade_message_at = long_form_trade_message_at + 1
  :: else -> break
  od;
  assert(long_form_trade_message_read.trade_attribute == long_form_trade_message_written.trade_attribute);
  assert(long_form_trade_message_read.cross_type == long_form_trade_message_written.cross_type);
  assert(long_form_trade_message_read.settlement_terms == long_form_trade_message_written.settlement_terms);
  skip
}

/* ---- Broken Trade Message: 9 bytes ------------------------------------------- */

/* A Broken Trade message is sent whenever an execution is broken. A Broken Trade is final; once a trade is broken it cannot be reinstated. */
typedef BrokenTradeMessage {
  byte trade_reference[9]
};

int broken_trade_message_at;

/* every byte of Broken Trade Message set to one value */
inline fill_broken_trade_message(broken_trade_message_record, broken_trade_message_value) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 9 -> broken_trade_message_record.trade_reference[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Broken Trade Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_message(broken_trade_message_record, broken_trade_message_base) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 9 -> broken_trade_message_record.trade_reference[broken_trade_message_at] = (broken_trade_message_base + 0 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message to the wire, 9 bytes from where the cursor stands */
inline encode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 9 -> wire[at] = broken_trade_message_record.trade_reference[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message off the wire, 9 bytes from where the cursor stands */
inline decode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 9 -> broken_trade_message_record.trade_reference[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Broken Trade Message is what was written, byte for byte */
inline equal_broken_trade_message(broken_trade_message_read, broken_trade_message_written) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 9 -> assert(broken_trade_message_read.trade_reference[broken_trade_message_at] == broken_trade_message_written.trade_reference[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 1 bytes ------------------------------------------- */

/* The system event message type is used to indicate a market state event. */
typedef SystemEventMessage {
  byte event_code
};

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_record.event_code = (system_event_message_base + 0 + 1) % 256;
  skip
}

/* System Event Message to the wire, 1 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 1 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Stock Status Message: 21 bytes ------------------------------------------ */

/* This message indicates the current trading status of a stock. At the start of day, the feed will send out a stock status message for each of the symbols trading on CXC, CX2 and CXD. Subsequently, stock status messages will be sent when a stock is halted or is released for trading. */
typedef StockStatusMessage {
  byte stock[10];
  byte trading_state;
  byte reserved_1;
  byte listing_market;
  byte board_lot_size[4];
  byte currency[3];
  byte gef_eligible
};

int stock_status_message_at;

/* every byte of Stock Status Message set to one value */
inline fill_stock_status_message(stock_status_message_record, stock_status_message_value) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> stock_status_message_record.stock[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_record.trading_state = stock_status_message_value;
  stock_status_message_record.reserved_1 = stock_status_message_value;
  stock_status_message_record.listing_market = stock_status_message_value;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> stock_status_message_record.board_lot_size[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 3 -> stock_status_message_record.currency[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_record.gef_eligible = stock_status_message_value;
  skip
}

/* each byte of Stock Status Message set to where it lies, so a field read out of place says so */
inline ramp_stock_status_message(stock_status_message_record, stock_status_message_base) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> stock_status_message_record.stock[stock_status_message_at] = (stock_status_message_base + 0 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_record.trading_state = (stock_status_message_base + 10 + 1) % 256;
  stock_status_message_record.reserved_1 = (stock_status_message_base + 11 + 1) % 256;
  stock_status_message_record.listing_market = (stock_status_message_base + 12 + 1) % 256;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> stock_status_message_record.board_lot_size[stock_status_message_at] = (stock_status_message_base + 13 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 3 -> stock_status_message_record.currency[stock_status_message_at] = (stock_status_message_base + 17 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_record.gef_eligible = (stock_status_message_base + 20 + 1) % 256;
  skip
}

/* Stock Status Message to the wire, 21 bytes from where the cursor stands */
inline encode_stock_status_message(stock_status_message_record) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> wire[at] = stock_status_message_record.stock[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_status_message_record.trading_state; at = at + 1;
  wire[at] = stock_status_message_record.reserved_1; at = at + 1;
  wire[at] = stock_status_message_record.listing_market; at = at + 1;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> wire[at] = stock_status_message_record.board_lot_size[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 3 -> wire[at] = stock_status_message_record.currency[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_status_message_record.gef_eligible; at = at + 1;
  skip
}

/* Stock Status Message off the wire, 21 bytes from where the cursor stands */
inline decode_stock_status_message(stock_status_message_record) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> stock_status_message_record.stock[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_record.trading_state = wire[at]; at = at + 1;
  stock_status_message_record.reserved_1 = wire[at]; at = at + 1;
  stock_status_message_record.listing_market = wire[at]; at = at + 1;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> stock_status_message_record.board_lot_size[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 3 -> stock_status_message_record.currency[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_record.gef_eligible = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock Status Message is what was written, byte for byte */
inline equal_stock_status_message(stock_status_message_read, stock_status_message_written) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 10 -> assert(stock_status_message_read.stock[stock_status_message_at] == stock_status_message_written.stock[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  assert(stock_status_message_read.trading_state == stock_status_message_written.trading_state);
  assert(stock_status_message_read.reserved_1 == stock_status_message_written.reserved_1);
  assert(stock_status_message_read.listing_market == stock_status_message_written.listing_market);
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> assert(stock_status_message_read.board_lot_size[stock_status_message_at] == stock_status_message_written.board_lot_size[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 3 -> assert(stock_status_message_read.currency[stock_status_message_at] == stock_status_message_written.currency[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  assert(stock_status_message_read.gef_eligible == stock_status_message_written.gef_eligible);
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
    assert(at == 1);
    at = 0;
    decode_server_packet_header(server_packet_header_got);
    assert(at == 1);
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
    assert(at == 31);
    at = 0;
    decode_login_accepted_packet(login_accepted_packet_got);
    assert(at == 31);
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

/* Sequenced Message Header: encoded, read back, and compared */
proctype check_sequenced_message_header() {
  SequencedMessageHeader sequenced_message_header_sent;
  SequencedMessageHeader sequenced_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequenced_message_header(sequenced_message_header_sent, 0)
  :: pattern == 1 -> fill_sequenced_message_header(sequenced_message_header_sent, 32)
  :: pattern == 2 -> fill_sequenced_message_header(sequenced_message_header_sent, 255)
  :: else -> ramp_sequenced_message_header(sequenced_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequenced_message_header(sequenced_message_header_sent);
    assert(at == 9);
    at = 0;
    decode_sequenced_message_header(sequenced_message_header_got);
    assert(at == 9);
    equal_sequenced_message_header(sequenced_message_header_got, sequenced_message_header_sent)
  }
}

/* Add Order Message: encoded, read back, and compared */
proctype check_add_order_message() {
  AddOrderMessage add_order_message_sent;
  AddOrderMessage add_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message(add_order_message_sent, 0)
  :: pattern == 1 -> fill_add_order_message(add_order_message_sent, 32)
  :: pattern == 2 -> fill_add_order_message(add_order_message_sent, 255)
  :: else -> ramp_add_order_message(add_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message(add_order_message_sent);
    assert(at == 39);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 39);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Long Form Add Order Message: encoded, read back, and compared */
proctype check_long_form_add_order_message() {
  LongFormAddOrderMessage long_form_add_order_message_sent;
  LongFormAddOrderMessage long_form_add_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_form_add_order_message(long_form_add_order_message_sent, 0)
  :: pattern == 1 -> fill_long_form_add_order_message(long_form_add_order_message_sent, 32)
  :: pattern == 2 -> fill_long_form_add_order_message(long_form_add_order_message_sent, 255)
  :: else -> ramp_long_form_add_order_message(long_form_add_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_form_add_order_message(long_form_add_order_message_sent);
    assert(at == 52);
    at = 0;
    decode_long_form_add_order_message(long_form_add_order_message_got);
    assert(at == 52);
    equal_long_form_add_order_message(long_form_add_order_message_got, long_form_add_order_message_sent)
  }
}

/* Order Execution Message: encoded, read back, and compared */
proctype check_order_execution_message() {
  OrderExecutionMessage order_execution_message_sent;
  OrderExecutionMessage order_execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_execution_message(order_execution_message_sent, 0)
  :: pattern == 1 -> fill_order_execution_message(order_execution_message_sent, 32)
  :: pattern == 2 -> fill_order_execution_message(order_execution_message_sent, 255)
  :: else -> ramp_order_execution_message(order_execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_execution_message(order_execution_message_sent);
    assert(at == 40);
    at = 0;
    decode_order_execution_message(order_execution_message_got);
    assert(at == 40);
    equal_order_execution_message(order_execution_message_got, order_execution_message_sent)
  }
}

/* Long Form Order Execution Message: encoded, read back, and compared */
proctype check_long_form_order_execution_message() {
  LongFormOrderExecutionMessage long_form_order_execution_message_sent;
  LongFormOrderExecutionMessage long_form_order_execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_form_order_execution_message(long_form_order_execution_message_sent, 0)
  :: pattern == 1 -> fill_long_form_order_execution_message(long_form_order_execution_message_sent, 32)
  :: pattern == 2 -> fill_long_form_order_execution_message(long_form_order_execution_message_sent, 255)
  :: else -> ramp_long_form_order_execution_message(long_form_order_execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_form_order_execution_message(long_form_order_execution_message_sent);
    assert(at == 44);
    at = 0;
    decode_long_form_order_execution_message(long_form_order_execution_message_got);
    assert(at == 44);
    equal_long_form_order_execution_message(long_form_order_execution_message_got, long_form_order_execution_message_sent)
  }
}

/* Order Cancel Message: encoded, read back, and compared */
proctype check_order_cancel_message() {
  OrderCancelMessage order_cancel_message_sent;
  OrderCancelMessage order_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_message(order_cancel_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_message(order_cancel_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_message(order_cancel_message_sent, 255)
  :: else -> ramp_order_cancel_message(order_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_message(order_cancel_message_sent);
    assert(at == 15);
    at = 0;
    decode_order_cancel_message(order_cancel_message_got);
    assert(at == 15);
    equal_order_cancel_message(order_cancel_message_got, order_cancel_message_sent)
  }
}

/* Long Form Order Cancel Message: encoded, read back, and compared */
proctype check_long_form_order_cancel_message() {
  LongFormOrderCancelMessage long_form_order_cancel_message_sent;
  LongFormOrderCancelMessage long_form_order_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_form_order_cancel_message(long_form_order_cancel_message_sent, 0)
  :: pattern == 1 -> fill_long_form_order_cancel_message(long_form_order_cancel_message_sent, 32)
  :: pattern == 2 -> fill_long_form_order_cancel_message(long_form_order_cancel_message_sent, 255)
  :: else -> ramp_long_form_order_cancel_message(long_form_order_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_form_order_cancel_message(long_form_order_cancel_message_sent);
    assert(at == 19);
    at = 0;
    decode_long_form_order_cancel_message(long_form_order_cancel_message_got);
    assert(at == 19);
    equal_long_form_order_cancel_message(long_form_order_cancel_message_got, long_form_order_cancel_message_sent)
  }
}

/* Trade Message: encoded, read back, and compared */
proctype check_trade_message() {
  TradeMessage trade_message_sent;
  TradeMessage trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message(trade_message_sent, 0)
  :: pattern == 1 -> fill_trade_message(trade_message_sent, 32)
  :: pattern == 2 -> fill_trade_message(trade_message_sent, 255)
  :: else -> ramp_trade_message(trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message(trade_message_sent);
    assert(at == 63);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 63);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Long Form Trade Message: encoded, read back, and compared */
proctype check_long_form_trade_message() {
  LongFormTradeMessage long_form_trade_message_sent;
  LongFormTradeMessage long_form_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_form_trade_message(long_form_trade_message_sent, 0)
  :: pattern == 1 -> fill_long_form_trade_message(long_form_trade_message_sent, 32)
  :: pattern == 2 -> fill_long_form_trade_message(long_form_trade_message_sent, 255)
  :: else -> ramp_long_form_trade_message(long_form_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_form_trade_message(long_form_trade_message_sent);
    assert(at == 76);
    at = 0;
    decode_long_form_trade_message(long_form_trade_message_got);
    assert(at == 76);
    equal_long_form_trade_message(long_form_trade_message_got, long_form_trade_message_sent)
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
    assert(at == 9);
    at = 0;
    decode_broken_trade_message(broken_trade_message_got);
    assert(at == 9);
    equal_broken_trade_message(broken_trade_message_got, broken_trade_message_sent)
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
    assert(at == 1);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 1);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Stock Status Message: encoded, read back, and compared */
proctype check_stock_status_message() {
  StockStatusMessage stock_status_message_sent;
  StockStatusMessage stock_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_status_message(stock_status_message_sent, 0)
  :: pattern == 1 -> fill_stock_status_message(stock_status_message_sent, 32)
  :: pattern == 2 -> fill_stock_status_message(stock_status_message_sent, 255)
  :: else -> ramp_stock_status_message(stock_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_status_message(stock_status_message_sent);
    assert(at == 21);
    at = 0;
    decode_stock_status_message(stock_status_message_got);
    assert(at == 21);
    equal_stock_status_message(stock_status_message_got, stock_status_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_sequenced_message_header()
  :: run check_add_order_message()
  :: run check_long_form_add_order_message()
  :: run check_order_execution_message()
  :: run check_long_form_order_execution_message()
  :: run check_order_cancel_message()
  :: run check_long_form_order_cancel_message()
  :: run check_trade_message()
  :: run check_long_form_trade_message()
  :: run check_broken_trade_message()
  :: run check_system_event_message()
  :: run check_stock_status_message()
  fi
}
