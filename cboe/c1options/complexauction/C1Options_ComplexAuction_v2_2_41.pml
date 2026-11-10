/*
 * Chicago Board Options Exchange Complex Auction
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
 *   - the dispatch that chooses a message by its type
 *   - a run filling what frames it
 *   - a run counted by a field
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

/* ---- Time Reference Message: 16 bytes ---------------------------------------- */

/* C1 Options Only. The Time Reference message is used to provide a midnight reference point for recipients of the feed. It is sent whenever the system starts up and when the system crosses a midnight boundary. All subsequent Time messages for the same unit will use the last Midnight Reference until another Time Reference message is received for that unit. The Time Reference message includes the Trade Date, so most other sequenced messages will not include that information. Time Reference messages will be included in a spin response. */
typedef TimeReferenceMessage {
  byte midnight_reference[4];
  byte time[4];
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
  :: time_reference_message_at < 4 -> time_reference_message_record.time[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
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
  :: time_reference_message_at < 4 -> time_reference_message_record.time[time_reference_message_at] = (time_reference_message_base + 4 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
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
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.time[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
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
  :: time_reference_message_at < 4 -> time_reference_message_record.time[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
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
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.time[time_reference_message_at] == time_reference_message_written.time[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
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

/* A Time message is immediately generated and sent when there is a PITCH event for a given clock second. If there is no PITCH event for a given clock second, then no Time message is sent for that second. All subsequent time offset fields for the same unit will use the new Time value as the base until another Time message is received for the same unit. On C1 only, the Time message will also include the Epoch Time field, which is the current time represented as the number of whole seconds since the Epoch (midnight January 1, 1970). */
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

/* ---- Symbol Mapping Message: 36 bytes ---------------------------------------- */

/* A Symbol Mapping message is used to map the 6 character simple instrument multicast feed symbol field to an OSI symbol and Underlying. These messages are not sequenced (sequence = 0) and are sent continuously through the day at variable rates as bandwidth allows. */
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

/* ---- Auction Notification Message: 45 bytes ---------------------------------- */

/* Auction Notification messages are used to disseminate order details of a complex auction. Auctions will be available for a defined period of time known as the exposure period. */
typedef AuctionNotificationMessage {
  byte time_offset[4];
  byte complex_instrument_id_short[6];
  byte auction_id[8];
  byte auction_notification_auction_type;
  byte side;
  byte price[8];
  byte quantity[4];
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
  :: auction_notification_message_at < 6 -> auction_notification_message_record.complex_instrument_id_short[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.auction_id[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.auction_notification_auction_type = auction_notification_message_value;
  auction_notification_message_record.side = auction_notification_message_value;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.price[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.quantity[auction_notification_message_at] = auction_notification_message_value; auction_notification_message_at = auction_notification_message_at + 1
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
  :: auction_notification_message_at < 6 -> auction_notification_message_record.complex_instrument_id_short[auction_notification_message_at] = (auction_notification_message_base + 4 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.auction_id[auction_notification_message_at] = (auction_notification_message_base + 10 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.auction_notification_auction_type = (auction_notification_message_base + 18 + 1) % 256;
  auction_notification_message_record.side = (auction_notification_message_base + 19 + 1) % 256;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.price[auction_notification_message_at] = (auction_notification_message_base + 20 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.quantity[auction_notification_message_at] = (auction_notification_message_base + 28 + auction_notification_message_at + 1) % 256; auction_notification_message_at = auction_notification_message_at + 1
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
  :: auction_notification_message_at < 6 -> wire[at] = auction_notification_message_record.complex_instrument_id_short[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> wire[at] = auction_notification_message_record.auction_id[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_notification_message_record.auction_notification_auction_type; at = at + 1;
  wire[at] = auction_notification_message_record.side; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> wire[at] = auction_notification_message_record.price[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> wire[at] = auction_notification_message_record.quantity[auction_notification_message_at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
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
  :: auction_notification_message_at < 6 -> auction_notification_message_record.complex_instrument_id_short[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.auction_id[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_record.auction_notification_auction_type = wire[at]; at = at + 1;
  auction_notification_message_record.side = wire[at]; at = at + 1;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> auction_notification_message_record.price[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> auction_notification_message_record.quantity[auction_notification_message_at] = wire[at]; at = at + 1; auction_notification_message_at = auction_notification_message_at + 1
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
  :: auction_notification_message_at < 6 -> assert(auction_notification_message_read.complex_instrument_id_short[auction_notification_message_at] == auction_notification_message_written.complex_instrument_id_short[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> assert(auction_notification_message_read.auction_id[auction_notification_message_at] == auction_notification_message_written.auction_id[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  assert(auction_notification_message_read.auction_notification_auction_type == auction_notification_message_written.auction_notification_auction_type);
  assert(auction_notification_message_read.side == auction_notification_message_written.side);
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 8 -> assert(auction_notification_message_read.price[auction_notification_message_at] == auction_notification_message_written.price[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
  :: else -> break
  od;
  auction_notification_message_at = 0;
  do
  :: auction_notification_message_at < 4 -> assert(auction_notification_message_read.quantity[auction_notification_message_at] == auction_notification_message_written.quantity[auction_notification_message_at]); auction_notification_message_at = auction_notification_message_at + 1
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

/* Auction Cancel messages are used to disseminate the cancellation of an earlier Auction Notification message as a result of a user cancellation of the original complex auction, a user modification request to change the complex auction price or increase the original complex auction quantity, a fading of the NBBO or to cancel any remaining complex auction quantity from the original Auction Notification following the complex auction termination. A user request to modify the complex auction price or to increase the original complex auction quantity will result in a cancellation of the complex auction followed by a new Auction Notification message. Auction Cancel messages will not be issued for complex auction quantity decrements. */
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

/* Auction Trade messages are used to disseminate executions resulting from a complex auction. */
typedef AuctionTradeMessage {
  byte time_offset[4];
  byte auction_id[8];
  byte execution_id[8];
  byte price[8];
  byte quantity[4]
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
  :: auction_trade_message_at < 8 -> auction_trade_message_record.price[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.quantity[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
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
  :: auction_trade_message_at < 8 -> auction_trade_message_record.price[auction_trade_message_at] = (auction_trade_message_base + 20 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.quantity[auction_trade_message_at] = (auction_trade_message_base + 28 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
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
  :: auction_trade_message_at < 8 -> wire[at] = auction_trade_message_record.price[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.quantity[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
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
  :: auction_trade_message_at < 8 -> auction_trade_message_record.price[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.quantity[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
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
  :: auction_trade_message_at < 8 -> assert(auction_trade_message_read.price[auction_trade_message_at] == auction_trade_message_written.price[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> assert(auction_trade_message_read.quantity[auction_trade_message_at] == auction_trade_message_written.quantity[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Options Auction Update Message: 62 bytes -------------------------------- */

/* Options Auction Update messages are used to disseminate price and size information during the Opening and Re-Opening (halt) process for complex instruments. The Options Auction Update messages are sent every five seconds during an opening period. Refer to the Cboe Options Complex Book Process specification for more information. */
typedef OptionsAuctionUpdateMessage {
  byte time_offset[4];
  byte complex_instrument_id_long[8];
  byte options_auction_update_auction_type;
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
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.complex_instrument_id_long[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.options_auction_update_auction_type = options_auction_update_message_value;
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
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.complex_instrument_id_long[options_auction_update_message_at] = (options_auction_update_message_base + 4 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.options_auction_update_auction_type = (options_auction_update_message_base + 12 + 1) % 256;
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
  :: options_auction_update_message_at < 8 -> wire[at] = options_auction_update_message_record.complex_instrument_id_long[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = options_auction_update_message_record.options_auction_update_auction_type; at = at + 1;
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
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.complex_instrument_id_long[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.options_auction_update_auction_type = wire[at]; at = at + 1;
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
  :: options_auction_update_message_at < 8 -> assert(options_auction_update_message_read.complex_instrument_id_long[options_auction_update_message_at] == options_auction_update_message_written.complex_instrument_id_long[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  assert(options_auction_update_message_read.options_auction_update_auction_type == options_auction_update_message_written.options_auction_update_auction_type);
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

/* Auction Summary messages are used to disseminate the results of the Opening and Re-Opening process of a complex instrument. An Opening or Re-Opening Auction Summary message for each complex instrument is sent at the conclusion of the Opening or Re-Opening process and represents the Cboe opening price. Refer to the Cboe Options Complex Book Process specification for more information. */
typedef AuctionSummaryMessage {
  byte time_offset[4];
  byte complex_instrument_id_long[8];
  byte auction_summary_auction_type;
  byte price[8];
  byte quantity[4]
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
  :: auction_summary_message_at < 8 -> auction_summary_message_record.complex_instrument_id_long[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_summary_auction_type = auction_summary_message_value;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.quantity[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 8 -> auction_summary_message_record.complex_instrument_id_long[auction_summary_message_at] = (auction_summary_message_base + 4 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_summary_auction_type = (auction_summary_message_base + 12 + 1) % 256;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price[auction_summary_message_at] = (auction_summary_message_base + 13 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.quantity[auction_summary_message_at] = (auction_summary_message_base + 21 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.complex_instrument_id_long[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_summary_message_record.auction_summary_auction_type; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.price[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.quantity[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 8 -> auction_summary_message_record.complex_instrument_id_long[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_summary_auction_type = wire[at]; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.quantity[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.complex_instrument_id_long[auction_summary_message_at] == auction_summary_message_written.complex_instrument_id_long[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  assert(auction_summary_message_read.auction_summary_auction_type == auction_summary_message_written.auction_summary_auction_type);
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.price[auction_summary_message_at] == auction_summary_message_written.price[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.quantity[auction_summary_message_at] == auction_summary_message_written.quantity[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Session Message: 4 bytes ----------------------------------------- */

/* The End of Session message is sent for each unit when the unit shuts down. No more auction messages will be delivered for this unit, but heartbeats from the unit may be received. */
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_time_reference_message()
  :: run check_time_message()
  :: run check_symbol_mapping_message()
  :: run check_auction_notification_message()
  :: run check_auction_cancel_message()
  :: run check_auction_trade_message()
  :: run check_options_auction_update_message()
  :: run check_auction_summary_message()
  :: run check_end_of_session_message()
  fi
}
