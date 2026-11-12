/*
 * Osaka Digital Exchange Tcp Proprietary Trading System
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
#define WIRE 44

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

/* ---- Seconds Message: 4 bytes ------------------------------------------------ */

/* Reflects the number of seconds past midnight */
typedef SecondsMessage {
  byte seconds[4]
};

int seconds_message_at;

/* every byte of Seconds Message set to one value */
inline fill_seconds_message(seconds_message_record, seconds_message_value) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> seconds_message_record.seconds[seconds_message_at] = seconds_message_value; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Seconds Message set to where it lies, so a field read out of place says so */
inline ramp_seconds_message(seconds_message_record, seconds_message_base) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> seconds_message_record.seconds[seconds_message_at] = (seconds_message_base + 0 + seconds_message_at + 1) % 256; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Seconds Message to the wire, 4 bytes from where the cursor stands */
inline encode_seconds_message(seconds_message_record) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> wire[at] = seconds_message_record.seconds[seconds_message_at]; at = at + 1; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Seconds Message off the wire, 4 bytes from where the cursor stands */
inline decode_seconds_message(seconds_message_record) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> seconds_message_record.seconds[seconds_message_at] = wire[at]; at = at + 1; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Seconds Message is what was written, byte for byte */
inline equal_seconds_message(seconds_message_read, seconds_message_written) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> assert(seconds_message_read.seconds[seconds_message_at] == seconds_message_written.seconds[seconds_message_at]); seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 9 bytes ------------------------------------------- */

/* System Event Messages signal data feed, system and market events */
typedef SystemEventMessage {
  byte nanoseconds[4];
  byte group[4];
  byte system_event
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.group[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.system_event = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.group[system_event_message_at] = (system_event_message_base + 4 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.system_event = (system_event_message_base + 8 + 1) % 256;
  skip
}

/* System Event Message to the wire, 9 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.nanoseconds[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.group[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.system_event; at = at + 1;
  skip
}

/* System Event Message off the wire, 9 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.group[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.system_event = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.nanoseconds[system_event_message_at] == system_event_message_written.nanoseconds[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.group[system_event_message_at] == system_event_message_written.group[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.system_event == system_event_message_written.system_event);
  skip
}

/* ---- Price Tick Size Message: 16 bytes --------------------------------------- */

/* The Price Tick Size Message is used to communicate tick size information for a given price range */
typedef PriceTickSizeMessage {
  byte nanoseconds[4];
  byte price_tick_size_table_id[4];
  byte price_tick_size[4];
  byte price_start[4]
};

int price_tick_size_message_at;

/* every byte of Price Tick Size Message set to one value */
inline fill_price_tick_size_message(price_tick_size_message_record, price_tick_size_message_value) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.nanoseconds[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_tick_size_table_id[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_tick_size[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_start[price_tick_size_message_at] = price_tick_size_message_value; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Tick Size Message set to where it lies, so a field read out of place says so */
inline ramp_price_tick_size_message(price_tick_size_message_record, price_tick_size_message_base) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.nanoseconds[price_tick_size_message_at] = (price_tick_size_message_base + 0 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_tick_size_table_id[price_tick_size_message_at] = (price_tick_size_message_base + 4 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_tick_size[price_tick_size_message_at] = (price_tick_size_message_base + 8 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_start[price_tick_size_message_at] = (price_tick_size_message_base + 12 + price_tick_size_message_at + 1) % 256; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Tick Size Message to the wire, 16 bytes from where the cursor stands */
inline encode_price_tick_size_message(price_tick_size_message_record) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> wire[at] = price_tick_size_message_record.nanoseconds[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> wire[at] = price_tick_size_message_record.price_tick_size_table_id[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> wire[at] = price_tick_size_message_record.price_tick_size[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> wire[at] = price_tick_size_message_record.price_start[price_tick_size_message_at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Tick Size Message off the wire, 16 bytes from where the cursor stands */
inline decode_price_tick_size_message(price_tick_size_message_record) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.nanoseconds[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_tick_size_table_id[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_tick_size[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> price_tick_size_message_record.price_start[price_tick_size_message_at] = wire[at]; at = at + 1; price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Tick Size Message is what was written, byte for byte */
inline equal_price_tick_size_message(price_tick_size_message_read, price_tick_size_message_written) {
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> assert(price_tick_size_message_read.nanoseconds[price_tick_size_message_at] == price_tick_size_message_written.nanoseconds[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> assert(price_tick_size_message_read.price_tick_size_table_id[price_tick_size_message_at] == price_tick_size_message_written.price_tick_size_table_id[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> assert(price_tick_size_message_read.price_tick_size[price_tick_size_message_at] == price_tick_size_message_written.price_tick_size[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  price_tick_size_message_at = 0;
  do
  :: price_tick_size_message_at < 4 -> assert(price_tick_size_message_read.price_start[price_tick_size_message_at] == price_tick_size_message_written.price_start[price_tick_size_message_at]); price_tick_size_message_at = price_tick_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Orderbook Directory Message: 44 bytes ----------------------------------- */

/* The Orderbook Directory Message is used to disseminate orderbook information for all active orderbooks */
typedef OrderbookDirectoryMessage {
  byte nanoseconds[4];
  byte orderbook_id[4];
  byte orderbook_code[12];
  byte group[4];
  byte round_lot_size[4];
  byte price_tick_size_table_id[4];
  byte price_decimals[4];
  byte upper_price_limit[4];
  byte lower_price_limit[4]
};

int orderbook_directory_message_at;

/* every byte of Orderbook Directory Message set to one value */
inline fill_orderbook_directory_message(orderbook_directory_message_record, orderbook_directory_message_value) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.nanoseconds[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.orderbook_id[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.orderbook_code[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.group[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.round_lot_size[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_tick_size_table_id[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_decimals[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.upper_price_limit[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.lower_price_limit[orderbook_directory_message_at] = orderbook_directory_message_value; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Orderbook Directory Message set to where it lies, so a field read out of place says so */
inline ramp_orderbook_directory_message(orderbook_directory_message_record, orderbook_directory_message_base) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.nanoseconds[orderbook_directory_message_at] = (orderbook_directory_message_base + 0 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.orderbook_id[orderbook_directory_message_at] = (orderbook_directory_message_base + 4 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.orderbook_code[orderbook_directory_message_at] = (orderbook_directory_message_base + 8 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.group[orderbook_directory_message_at] = (orderbook_directory_message_base + 20 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.round_lot_size[orderbook_directory_message_at] = (orderbook_directory_message_base + 24 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_tick_size_table_id[orderbook_directory_message_at] = (orderbook_directory_message_base + 28 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_decimals[orderbook_directory_message_at] = (orderbook_directory_message_base + 32 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.upper_price_limit[orderbook_directory_message_at] = (orderbook_directory_message_base + 36 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.lower_price_limit[orderbook_directory_message_at] = (orderbook_directory_message_base + 40 + orderbook_directory_message_at + 1) % 256; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orderbook Directory Message to the wire, 44 bytes from where the cursor stands */
inline encode_orderbook_directory_message(orderbook_directory_message_record) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.nanoseconds[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.orderbook_id[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> wire[at] = orderbook_directory_message_record.orderbook_code[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.group[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.round_lot_size[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.price_tick_size_table_id[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.price_decimals[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.upper_price_limit[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> wire[at] = orderbook_directory_message_record.lower_price_limit[orderbook_directory_message_at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orderbook Directory Message off the wire, 44 bytes from where the cursor stands */
inline decode_orderbook_directory_message(orderbook_directory_message_record) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.nanoseconds[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.orderbook_id[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> orderbook_directory_message_record.orderbook_code[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.group[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.round_lot_size[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_tick_size_table_id[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.price_decimals[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.upper_price_limit[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> orderbook_directory_message_record.lower_price_limit[orderbook_directory_message_at] = wire[at]; at = at + 1; orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Orderbook Directory Message is what was written, byte for byte */
inline equal_orderbook_directory_message(orderbook_directory_message_read, orderbook_directory_message_written) {
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.nanoseconds[orderbook_directory_message_at] == orderbook_directory_message_written.nanoseconds[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.orderbook_id[orderbook_directory_message_at] == orderbook_directory_message_written.orderbook_id[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 12 -> assert(orderbook_directory_message_read.orderbook_code[orderbook_directory_message_at] == orderbook_directory_message_written.orderbook_code[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.group[orderbook_directory_message_at] == orderbook_directory_message_written.group[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.round_lot_size[orderbook_directory_message_at] == orderbook_directory_message_written.round_lot_size[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.price_tick_size_table_id[orderbook_directory_message_at] == orderbook_directory_message_written.price_tick_size_table_id[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.price_decimals[orderbook_directory_message_at] == orderbook_directory_message_written.price_decimals[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.upper_price_limit[orderbook_directory_message_at] == orderbook_directory_message_written.upper_price_limit[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  orderbook_directory_message_at = 0;
  do
  :: orderbook_directory_message_at < 4 -> assert(orderbook_directory_message_read.lower_price_limit[orderbook_directory_message_at] == orderbook_directory_message_written.lower_price_limit[orderbook_directory_message_at]); orderbook_directory_message_at = orderbook_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading State Message: 13 bytes ----------------------------------------- */

/* The Trading State Message is used to indicate the current trading state of an orderbook */
typedef TradingStateMessage {
  byte nanoseconds[4];
  byte orderbook_id[4];
  byte group[4];
  byte trading_state
};

int trading_state_message_at;

/* every byte of Trading State Message set to one value */
inline fill_trading_state_message(trading_state_message_record, trading_state_message_value) {
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> trading_state_message_record.nanoseconds[trading_state_message_at] = trading_state_message_value; trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> trading_state_message_record.orderbook_id[trading_state_message_at] = trading_state_message_value; trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> trading_state_message_record.group[trading_state_message_at] = trading_state_message_value; trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  trading_state_message_record.trading_state = trading_state_message_value;
  skip
}

/* each byte of Trading State Message set to where it lies, so a field read out of place says so */
inline ramp_trading_state_message(trading_state_message_record, trading_state_message_base) {
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> trading_state_message_record.nanoseconds[trading_state_message_at] = (trading_state_message_base + 0 + trading_state_message_at + 1) % 256; trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> trading_state_message_record.orderbook_id[trading_state_message_at] = (trading_state_message_base + 4 + trading_state_message_at + 1) % 256; trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> trading_state_message_record.group[trading_state_message_at] = (trading_state_message_base + 8 + trading_state_message_at + 1) % 256; trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  trading_state_message_record.trading_state = (trading_state_message_base + 12 + 1) % 256;
  skip
}

/* Trading State Message to the wire, 13 bytes from where the cursor stands */
inline encode_trading_state_message(trading_state_message_record) {
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> wire[at] = trading_state_message_record.nanoseconds[trading_state_message_at]; at = at + 1; trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> wire[at] = trading_state_message_record.orderbook_id[trading_state_message_at]; at = at + 1; trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> wire[at] = trading_state_message_record.group[trading_state_message_at]; at = at + 1; trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_state_message_record.trading_state; at = at + 1;
  skip
}

/* Trading State Message off the wire, 13 bytes from where the cursor stands */
inline decode_trading_state_message(trading_state_message_record) {
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> trading_state_message_record.nanoseconds[trading_state_message_at] = wire[at]; at = at + 1; trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> trading_state_message_record.orderbook_id[trading_state_message_at] = wire[at]; at = at + 1; trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> trading_state_message_record.group[trading_state_message_at] = wire[at]; at = at + 1; trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  trading_state_message_record.trading_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading State Message is what was written, byte for byte */
inline equal_trading_state_message(trading_state_message_read, trading_state_message_written) {
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> assert(trading_state_message_read.nanoseconds[trading_state_message_at] == trading_state_message_written.nanoseconds[trading_state_message_at]); trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> assert(trading_state_message_read.orderbook_id[trading_state_message_at] == trading_state_message_written.orderbook_id[trading_state_message_at]); trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  trading_state_message_at = 0;
  do
  :: trading_state_message_at < 4 -> assert(trading_state_message_read.group[trading_state_message_at] == trading_state_message_written.group[trading_state_message_at]); trading_state_message_at = trading_state_message_at + 1
  :: else -> break
  od;
  assert(trading_state_message_read.trading_state == trading_state_message_written.trading_state);
  skip
}

/* ---- Short Selling Price Restriction State Message: 13 bytes ----------------- */

/* The Short Selling Price Restriction State Message is used to indicate the current short selling price restriction state of an orderbook */
typedef ShortSellingPriceRestrictionStateMessage {
  byte nanoseconds[4];
  byte orderbook_id[4];
  byte group[4];
  byte short_selling_state
};

int short_selling_price_restriction_state_message_at;

/* every byte of Short Selling Price Restriction State Message set to one value */
inline fill_short_selling_price_restriction_state_message(short_selling_price_restriction_state_message_record, short_selling_price_restriction_state_message_value) {
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> short_selling_price_restriction_state_message_record.nanoseconds[short_selling_price_restriction_state_message_at] = short_selling_price_restriction_state_message_value; short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> short_selling_price_restriction_state_message_record.orderbook_id[short_selling_price_restriction_state_message_at] = short_selling_price_restriction_state_message_value; short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> short_selling_price_restriction_state_message_record.group[short_selling_price_restriction_state_message_at] = short_selling_price_restriction_state_message_value; short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  short_selling_price_restriction_state_message_record.short_selling_state = short_selling_price_restriction_state_message_value;
  skip
}

/* each byte of Short Selling Price Restriction State Message set to where it lies, so a field read out of place says so */
inline ramp_short_selling_price_restriction_state_message(short_selling_price_restriction_state_message_record, short_selling_price_restriction_state_message_base) {
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> short_selling_price_restriction_state_message_record.nanoseconds[short_selling_price_restriction_state_message_at] = (short_selling_price_restriction_state_message_base + 0 + short_selling_price_restriction_state_message_at + 1) % 256; short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> short_selling_price_restriction_state_message_record.orderbook_id[short_selling_price_restriction_state_message_at] = (short_selling_price_restriction_state_message_base + 4 + short_selling_price_restriction_state_message_at + 1) % 256; short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> short_selling_price_restriction_state_message_record.group[short_selling_price_restriction_state_message_at] = (short_selling_price_restriction_state_message_base + 8 + short_selling_price_restriction_state_message_at + 1) % 256; short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  short_selling_price_restriction_state_message_record.short_selling_state = (short_selling_price_restriction_state_message_base + 12 + 1) % 256;
  skip
}

/* Short Selling Price Restriction State Message to the wire, 13 bytes from where the cursor stands */
inline encode_short_selling_price_restriction_state_message(short_selling_price_restriction_state_message_record) {
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> wire[at] = short_selling_price_restriction_state_message_record.nanoseconds[short_selling_price_restriction_state_message_at]; at = at + 1; short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> wire[at] = short_selling_price_restriction_state_message_record.orderbook_id[short_selling_price_restriction_state_message_at]; at = at + 1; short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> wire[at] = short_selling_price_restriction_state_message_record.group[short_selling_price_restriction_state_message_at]; at = at + 1; short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  wire[at] = short_selling_price_restriction_state_message_record.short_selling_state; at = at + 1;
  skip
}

/* Short Selling Price Restriction State Message off the wire, 13 bytes from where the cursor stands */
inline decode_short_selling_price_restriction_state_message(short_selling_price_restriction_state_message_record) {
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> short_selling_price_restriction_state_message_record.nanoseconds[short_selling_price_restriction_state_message_at] = wire[at]; at = at + 1; short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> short_selling_price_restriction_state_message_record.orderbook_id[short_selling_price_restriction_state_message_at] = wire[at]; at = at + 1; short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> short_selling_price_restriction_state_message_record.group[short_selling_price_restriction_state_message_at] = wire[at]; at = at + 1; short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  short_selling_price_restriction_state_message_record.short_selling_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Short Selling Price Restriction State Message is what was written, byte for byte */
inline equal_short_selling_price_restriction_state_message(short_selling_price_restriction_state_message_read, short_selling_price_restriction_state_message_written) {
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> assert(short_selling_price_restriction_state_message_read.nanoseconds[short_selling_price_restriction_state_message_at] == short_selling_price_restriction_state_message_written.nanoseconds[short_selling_price_restriction_state_message_at]); short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> assert(short_selling_price_restriction_state_message_read.orderbook_id[short_selling_price_restriction_state_message_at] == short_selling_price_restriction_state_message_written.orderbook_id[short_selling_price_restriction_state_message_at]); short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  short_selling_price_restriction_state_message_at = 0;
  do
  :: short_selling_price_restriction_state_message_at < 4 -> assert(short_selling_price_restriction_state_message_read.group[short_selling_price_restriction_state_message_at] == short_selling_price_restriction_state_message_written.group[short_selling_price_restriction_state_message_at]); short_selling_price_restriction_state_message_at = short_selling_price_restriction_state_message_at + 1
  :: else -> break
  od;
  assert(short_selling_price_restriction_state_message_read.short_selling_state == short_selling_price_restriction_state_message_written.short_selling_state);
  skip
}

/* ---- Order Added Message: 29 bytes ------------------------------------------- */

/* An Order Added Message is generated each time a new order is accepted by the ODX PTS execution system */
typedef OrderAddedMessage {
  byte nanoseconds[4];
  byte order_number[8];
  byte buy_sell_indicator;
  byte quantity[4];
  byte orderbook_id[4];
  byte group[4];
  byte price[4]
};

int order_added_message_at;

/* every byte of Order Added Message set to one value */
inline fill_order_added_message(order_added_message_record, order_added_message_value) {
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.nanoseconds[order_added_message_at] = order_added_message_value; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 8 -> order_added_message_record.order_number[order_added_message_at] = order_added_message_value; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_record.buy_sell_indicator = order_added_message_value;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.quantity[order_added_message_at] = order_added_message_value; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.orderbook_id[order_added_message_at] = order_added_message_value; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.group[order_added_message_at] = order_added_message_value; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.price[order_added_message_at] = order_added_message_value; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Added Message set to where it lies, so a field read out of place says so */
inline ramp_order_added_message(order_added_message_record, order_added_message_base) {
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.nanoseconds[order_added_message_at] = (order_added_message_base + 0 + order_added_message_at + 1) % 256; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 8 -> order_added_message_record.order_number[order_added_message_at] = (order_added_message_base + 4 + order_added_message_at + 1) % 256; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_record.buy_sell_indicator = (order_added_message_base + 12 + 1) % 256;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.quantity[order_added_message_at] = (order_added_message_base + 13 + order_added_message_at + 1) % 256; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.orderbook_id[order_added_message_at] = (order_added_message_base + 17 + order_added_message_at + 1) % 256; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.group[order_added_message_at] = (order_added_message_base + 21 + order_added_message_at + 1) % 256; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.price[order_added_message_at] = (order_added_message_base + 25 + order_added_message_at + 1) % 256; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Added Message to the wire, 29 bytes from where the cursor stands */
inline encode_order_added_message(order_added_message_record) {
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> wire[at] = order_added_message_record.nanoseconds[order_added_message_at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 8 -> wire[at] = order_added_message_record.order_number[order_added_message_at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  wire[at] = order_added_message_record.buy_sell_indicator; at = at + 1;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> wire[at] = order_added_message_record.quantity[order_added_message_at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> wire[at] = order_added_message_record.orderbook_id[order_added_message_at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> wire[at] = order_added_message_record.group[order_added_message_at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> wire[at] = order_added_message_record.price[order_added_message_at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Added Message off the wire, 29 bytes from where the cursor stands */
inline decode_order_added_message(order_added_message_record) {
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.nanoseconds[order_added_message_at] = wire[at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 8 -> order_added_message_record.order_number[order_added_message_at] = wire[at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.quantity[order_added_message_at] = wire[at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.orderbook_id[order_added_message_at] = wire[at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.group[order_added_message_at] = wire[at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.price[order_added_message_at] = wire[at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Added Message is what was written, byte for byte */
inline equal_order_added_message(order_added_message_read, order_added_message_written) {
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> assert(order_added_message_read.nanoseconds[order_added_message_at] == order_added_message_written.nanoseconds[order_added_message_at]); order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 8 -> assert(order_added_message_read.order_number[order_added_message_at] == order_added_message_written.order_number[order_added_message_at]); order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  assert(order_added_message_read.buy_sell_indicator == order_added_message_written.buy_sell_indicator);
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> assert(order_added_message_read.quantity[order_added_message_at] == order_added_message_written.quantity[order_added_message_at]); order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> assert(order_added_message_read.orderbook_id[order_added_message_at] == order_added_message_written.orderbook_id[order_added_message_at]); order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> assert(order_added_message_read.group[order_added_message_at] == order_added_message_written.group[order_added_message_at]); order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> assert(order_added_message_read.price[order_added_message_at] == order_added_message_written.price[order_added_message_at]); order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message: 24 bytes ---------------------------------------- */

/* An Order Executed Message is sent whenever an order on the book is executed in whole or in part */
typedef OrderExecutedMessage {
  byte nanoseconds[4];
  byte order_number[8];
  byte executed_quantity[4];
  byte match_number[8]
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanoseconds[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanoseconds[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_number[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = (order_executed_message_base + 16 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 24 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.nanoseconds[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.match_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 24 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanoseconds[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.nanoseconds[order_executed_message_at] == order_executed_message_written.nanoseconds[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_number[order_executed_message_at] == order_executed_message_written.order_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.match_number[order_executed_message_at] == order_executed_message_written.match_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Deleted Message: 12 bytes ----------------------------------------- */

/* An Order Deleted Message is sent whenever an order on the book is cancelled */
typedef OrderDeletedMessage {
  byte nanoseconds[4];
  byte order_number[8]
};

int order_deleted_message_at;

/* every byte of Order Deleted Message set to one value */
inline fill_order_deleted_message(order_deleted_message_record, order_deleted_message_value) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.nanoseconds[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_number[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Deleted Message set to where it lies, so a field read out of place says so */
inline ramp_order_deleted_message(order_deleted_message_record, order_deleted_message_base) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.nanoseconds[order_deleted_message_at] = (order_deleted_message_base + 0 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_number[order_deleted_message_at] = (order_deleted_message_base + 4 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Deleted Message to the wire, 12 bytes from where the cursor stands */
inline encode_order_deleted_message(order_deleted_message_record) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> wire[at] = order_deleted_message_record.nanoseconds[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> wire[at] = order_deleted_message_record.order_number[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Deleted Message off the wire, 12 bytes from where the cursor stands */
inline decode_order_deleted_message(order_deleted_message_record) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.nanoseconds[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_number[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Deleted Message is what was written, byte for byte */
inline equal_order_deleted_message(order_deleted_message_read, order_deleted_message_written) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> assert(order_deleted_message_read.nanoseconds[order_deleted_message_at] == order_deleted_message_written.nanoseconds[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> assert(order_deleted_message_read.order_number[order_deleted_message_at] == order_deleted_message_written.order_number[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replaced Message: 28 bytes ---------------------------------------- */

/* An Order Replaced Message is sent whenever an order on the book is replaced */
typedef OrderReplacedMessage {
  byte nanoseconds[4];
  byte original_order_number[8];
  byte new_order_number[8];
  byte quantity[4];
  byte price[4]
};

int order_replaced_message_at;

/* every byte of Order Replaced Message set to one value */
inline fill_order_replaced_message(order_replaced_message_record, order_replaced_message_value) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.nanoseconds[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.original_order_number[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.new_order_number[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.quantity[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.price[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replaced Message set to where it lies, so a field read out of place says so */
inline ramp_order_replaced_message(order_replaced_message_record, order_replaced_message_base) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.nanoseconds[order_replaced_message_at] = (order_replaced_message_base + 0 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.original_order_number[order_replaced_message_at] = (order_replaced_message_base + 4 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.new_order_number[order_replaced_message_at] = (order_replaced_message_base + 12 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.quantity[order_replaced_message_at] = (order_replaced_message_base + 20 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.price[order_replaced_message_at] = (order_replaced_message_base + 24 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replaced Message to the wire, 28 bytes from where the cursor stands */
inline encode_order_replaced_message(order_replaced_message_record) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.nanoseconds[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.original_order_number[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.new_order_number[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.quantity[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.price[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replaced Message off the wire, 28 bytes from where the cursor stands */
inline decode_order_replaced_message(order_replaced_message_record) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.nanoseconds[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.original_order_number[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.new_order_number[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.quantity[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.price[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replaced Message is what was written, byte for byte */
inline equal_order_replaced_message(order_replaced_message_read, order_replaced_message_written) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.nanoseconds[order_replaced_message_at] == order_replaced_message_written.nanoseconds[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.original_order_number[order_replaced_message_at] == order_replaced_message_written.original_order_number[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.new_order_number[order_replaced_message_at] == order_replaced_message_written.new_order_number[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.quantity[order_replaced_message_at] == order_replaced_message_written.quantity[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.price[order_replaced_message_at] == order_replaced_message_written.price[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
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

/* Seconds Message: encoded, read back, and compared */
proctype check_seconds_message() {
  SecondsMessage seconds_message_sent;
  SecondsMessage seconds_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_seconds_message(seconds_message_sent, 0)
  :: pattern == 1 -> fill_seconds_message(seconds_message_sent, 32)
  :: pattern == 2 -> fill_seconds_message(seconds_message_sent, 255)
  :: else -> ramp_seconds_message(seconds_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_seconds_message(seconds_message_sent);
    assert(at == 4);
    at = 0;
    decode_seconds_message(seconds_message_got);
    assert(at == 4);
    equal_seconds_message(seconds_message_got, seconds_message_sent)
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

/* Price Tick Size Message: encoded, read back, and compared */
proctype check_price_tick_size_message() {
  PriceTickSizeMessage price_tick_size_message_sent;
  PriceTickSizeMessage price_tick_size_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_tick_size_message(price_tick_size_message_sent, 0)
  :: pattern == 1 -> fill_price_tick_size_message(price_tick_size_message_sent, 32)
  :: pattern == 2 -> fill_price_tick_size_message(price_tick_size_message_sent, 255)
  :: else -> ramp_price_tick_size_message(price_tick_size_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_tick_size_message(price_tick_size_message_sent);
    assert(at == 16);
    at = 0;
    decode_price_tick_size_message(price_tick_size_message_got);
    assert(at == 16);
    equal_price_tick_size_message(price_tick_size_message_got, price_tick_size_message_sent)
  }
}

/* Orderbook Directory Message: encoded, read back, and compared */
proctype check_orderbook_directory_message() {
  OrderbookDirectoryMessage orderbook_directory_message_sent;
  OrderbookDirectoryMessage orderbook_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_orderbook_directory_message(orderbook_directory_message_sent, 0)
  :: pattern == 1 -> fill_orderbook_directory_message(orderbook_directory_message_sent, 32)
  :: pattern == 2 -> fill_orderbook_directory_message(orderbook_directory_message_sent, 255)
  :: else -> ramp_orderbook_directory_message(orderbook_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_orderbook_directory_message(orderbook_directory_message_sent);
    assert(at == 44);
    at = 0;
    decode_orderbook_directory_message(orderbook_directory_message_got);
    assert(at == 44);
    equal_orderbook_directory_message(orderbook_directory_message_got, orderbook_directory_message_sent)
  }
}

/* Trading State Message: encoded, read back, and compared */
proctype check_trading_state_message() {
  TradingStateMessage trading_state_message_sent;
  TradingStateMessage trading_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_state_message(trading_state_message_sent, 0)
  :: pattern == 1 -> fill_trading_state_message(trading_state_message_sent, 32)
  :: pattern == 2 -> fill_trading_state_message(trading_state_message_sent, 255)
  :: else -> ramp_trading_state_message(trading_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_state_message(trading_state_message_sent);
    assert(at == 13);
    at = 0;
    decode_trading_state_message(trading_state_message_got);
    assert(at == 13);
    equal_trading_state_message(trading_state_message_got, trading_state_message_sent)
  }
}

/* Short Selling Price Restriction State Message: encoded, read back, and compared */
proctype check_short_selling_price_restriction_state_message() {
  ShortSellingPriceRestrictionStateMessage short_selling_price_restriction_state_message_sent;
  ShortSellingPriceRestrictionStateMessage short_selling_price_restriction_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_selling_price_restriction_state_message(short_selling_price_restriction_state_message_sent, 0)
  :: pattern == 1 -> fill_short_selling_price_restriction_state_message(short_selling_price_restriction_state_message_sent, 32)
  :: pattern == 2 -> fill_short_selling_price_restriction_state_message(short_selling_price_restriction_state_message_sent, 255)
  :: else -> ramp_short_selling_price_restriction_state_message(short_selling_price_restriction_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_selling_price_restriction_state_message(short_selling_price_restriction_state_message_sent);
    assert(at == 13);
    at = 0;
    decode_short_selling_price_restriction_state_message(short_selling_price_restriction_state_message_got);
    assert(at == 13);
    equal_short_selling_price_restriction_state_message(short_selling_price_restriction_state_message_got, short_selling_price_restriction_state_message_sent)
  }
}

/* Order Added Message: encoded, read back, and compared */
proctype check_order_added_message() {
  OrderAddedMessage order_added_message_sent;
  OrderAddedMessage order_added_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_added_message(order_added_message_sent, 0)
  :: pattern == 1 -> fill_order_added_message(order_added_message_sent, 32)
  :: pattern == 2 -> fill_order_added_message(order_added_message_sent, 255)
  :: else -> ramp_order_added_message(order_added_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_added_message(order_added_message_sent);
    assert(at == 29);
    at = 0;
    decode_order_added_message(order_added_message_got);
    assert(at == 29);
    equal_order_added_message(order_added_message_got, order_added_message_sent)
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
    assert(at == 24);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 24);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Order Deleted Message: encoded, read back, and compared */
proctype check_order_deleted_message() {
  OrderDeletedMessage order_deleted_message_sent;
  OrderDeletedMessage order_deleted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_deleted_message(order_deleted_message_sent, 0)
  :: pattern == 1 -> fill_order_deleted_message(order_deleted_message_sent, 32)
  :: pattern == 2 -> fill_order_deleted_message(order_deleted_message_sent, 255)
  :: else -> ramp_order_deleted_message(order_deleted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_deleted_message(order_deleted_message_sent);
    assert(at == 12);
    at = 0;
    decode_order_deleted_message(order_deleted_message_got);
    assert(at == 12);
    equal_order_deleted_message(order_deleted_message_got, order_deleted_message_sent)
  }
}

/* Order Replaced Message: encoded, read back, and compared */
proctype check_order_replaced_message() {
  OrderReplacedMessage order_replaced_message_sent;
  OrderReplacedMessage order_replaced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replaced_message(order_replaced_message_sent, 0)
  :: pattern == 1 -> fill_order_replaced_message(order_replaced_message_sent, 32)
  :: pattern == 2 -> fill_order_replaced_message(order_replaced_message_sent, 255)
  :: else -> ramp_order_replaced_message(order_replaced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replaced_message(order_replaced_message_sent);
    assert(at == 28);
    at = 0;
    decode_order_replaced_message(order_replaced_message_got);
    assert(at == 28);
    equal_order_replaced_message(order_replaced_message_got, order_replaced_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_seconds_message()
  :: run check_system_event_message()
  :: run check_price_tick_size_message()
  :: run check_orderbook_directory_message()
  :: run check_trading_state_message()
  :: run check_short_selling_price_restriction_state_message()
  :: run check_order_added_message()
  :: run check_order_executed_message()
  :: run check_order_deleted_message()
  :: run check_order_replaced_message()
  fi
}
