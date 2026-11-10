/*
 * Canadian Securities Exchange CSE2 Multicast Market Data Feed
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 195

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Block Header: 7 bytes --------------------------------------------------- */

/* Prefix of a block of messages, carrying the unique information to identify and route them */
typedef BlockHeader {
  byte block_length[2];
  byte block_number_of_messages;
  byte block_start_sequence[4]
};

int block_header_at;

/* every byte of Block Header set to one value */
inline fill_block_header(block_header_record, block_header_value) {
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_length[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.block_number_of_messages = block_header_value;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_start_sequence[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Block Header set to where it lies, so a field read out of place says so */
inline ramp_block_header(block_header_record, block_header_base) {
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_length[block_header_at] = (block_header_base + 0 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.block_number_of_messages = (block_header_base + 2 + 1) % 256;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_start_sequence[block_header_at] = (block_header_base + 3 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header to the wire, 7 bytes from where the cursor stands */
inline encode_block_header(block_header_record) {
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_length[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.block_number_of_messages; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> wire[at] = block_header_record.block_start_sequence[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header off the wire, 7 bytes from where the cursor stands */
inline decode_block_header(block_header_record) {
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_length[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.block_number_of_messages = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_start_sequence[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Block Header is what was written, byte for byte */
inline equal_block_header(block_header_read, block_header_written) {
  block_header_at = 0;
  do
  :: block_header_at < 2 -> assert(block_header_read.block_length[block_header_at] == block_header_written.block_length[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  assert(block_header_read.block_number_of_messages == block_header_written.block_number_of_messages);
  block_header_at = 0;
  do
  :: block_header_at < 4 -> assert(block_header_read.block_start_sequence[block_header_at] == block_header_written.block_start_sequence[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 2 bytes ------------------------------------------------- */

/* Two byte sub header prefixing every message, carrying its length and its type */
typedef MessageHeader {
  byte sub_length;
  byte message_type
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.sub_length = message_header_value;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.sub_length = (message_header_base + 0 + 1) % 256;
  message_header_record.message_type = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.sub_length; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.sub_length = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.sub_length == message_header_written.sub_length);
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Time Message: 6 bytes --------------------------------------------------- */

/* Anchors the feed clock. Every following message states its own time as nanoseconds elapsed since this message. */
typedef TimeMessage {
  byte second[4];
  byte millisecond[2]
};

int time_message_at;

/* every byte of Time Message set to one value */
inline fill_time_message(time_message_record, time_message_value) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.second[time_message_at] = time_message_value; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 2 -> time_message_record.millisecond[time_message_at] = time_message_value; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Message set to where it lies, so a field read out of place says so */
inline ramp_time_message(time_message_record, time_message_base) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.second[time_message_at] = (time_message_base + 0 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 2 -> time_message_record.millisecond[time_message_at] = (time_message_base + 4 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message to the wire, 6 bytes from where the cursor stands */
inline encode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> wire[at] = time_message_record.second[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 2 -> wire[at] = time_message_record.millisecond[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message off the wire, 6 bytes from where the cursor stands */
inline decode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.second[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 2 -> time_message_record.millisecond[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Message is what was written, byte for byte */
inline equal_time_message(time_message_read, time_message_written) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> assert(time_message_read.second[time_message_at] == time_message_written.second[time_message_at]); time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 2 -> assert(time_message_read.millisecond[time_message_at] == time_message_written.millisecond[time_message_at]); time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 21 bytes ------------------------------------------ */

/* Signals a market or data feed handler event, either for the system as a whole or for one symbol group. */
typedef SystemEventMessage {
  byte time_offset[4];
  byte group[8];
  byte event_code;
  byte exchange_timestamp[8]
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.time_offset[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.group[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.exchange_timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.time_offset[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.group[system_event_message_at] = (system_event_message_base + 4 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 12 + 1) % 256;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.exchange_timestamp[system_event_message_at] = (system_event_message_base + 13 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message to the wire, 21 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.time_offset[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.group[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.exchange_timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message off the wire, 21 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.time_offset[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.group[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.exchange_timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.time_offset[system_event_message_at] == system_event_message_written.time_offset[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.group[system_event_message_at] == system_event_message_written.group[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.exchange_timestamp[system_event_message_at] == system_event_message_written.exchange_timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Directory Message: 195 bytes ------------------------------------- */

/* Static properties of a symbol. Sent for every symbol in the morning, and again during the day if a symbol changes. */
typedef SymbolDirectoryMessage {
  byte time_offset[4];
  byte symbol[12];
  byte cusip[12];
  byte sec_name[15];
  byte currency[3];
  byte stock_group[8];
  byte listing[8];
  byte expiry[8];
  byte lot_size[4];
  byte settlement_term[8];
  byte listing_market;
  byte previous_closing_price[4];
  byte listing_tier;
  byte market_maker_name[20];
  byte market_maker_phone_number[12];
  byte full_sec_name[75]
};

int symbol_directory_message_at;

/* every byte of Symbol Directory Message set to one value */
inline fill_symbol_directory_message(symbol_directory_message_record, symbol_directory_message_value) {
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.time_offset[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.symbol[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.cusip[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 15 -> symbol_directory_message_record.sec_name[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 3 -> symbol_directory_message_record.currency[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.stock_group[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.listing[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.expiry[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.lot_size[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.settlement_term[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_record.listing_market = symbol_directory_message_value;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.previous_closing_price[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_record.listing_tier = symbol_directory_message_value;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 20 -> symbol_directory_message_record.market_maker_name[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.market_maker_phone_number[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 75 -> symbol_directory_message_record.full_sec_name[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Directory Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_directory_message(symbol_directory_message_record, symbol_directory_message_base) {
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.time_offset[symbol_directory_message_at] = (symbol_directory_message_base + 0 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.symbol[symbol_directory_message_at] = (symbol_directory_message_base + 4 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.cusip[symbol_directory_message_at] = (symbol_directory_message_base + 16 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 15 -> symbol_directory_message_record.sec_name[symbol_directory_message_at] = (symbol_directory_message_base + 28 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 3 -> symbol_directory_message_record.currency[symbol_directory_message_at] = (symbol_directory_message_base + 43 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.stock_group[symbol_directory_message_at] = (symbol_directory_message_base + 46 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.listing[symbol_directory_message_at] = (symbol_directory_message_base + 54 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.expiry[symbol_directory_message_at] = (symbol_directory_message_base + 62 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.lot_size[symbol_directory_message_at] = (symbol_directory_message_base + 70 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.settlement_term[symbol_directory_message_at] = (symbol_directory_message_base + 74 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_record.listing_market = (symbol_directory_message_base + 82 + 1) % 256;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.previous_closing_price[symbol_directory_message_at] = (symbol_directory_message_base + 83 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_record.listing_tier = (symbol_directory_message_base + 87 + 1) % 256;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 20 -> symbol_directory_message_record.market_maker_name[symbol_directory_message_at] = (symbol_directory_message_base + 88 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.market_maker_phone_number[symbol_directory_message_at] = (symbol_directory_message_base + 108 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 75 -> symbol_directory_message_record.full_sec_name[symbol_directory_message_at] = (symbol_directory_message_base + 120 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Directory Message to the wire, 195 bytes from where the cursor stands */
inline encode_symbol_directory_message(symbol_directory_message_record) {
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> wire[at] = symbol_directory_message_record.time_offset[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> wire[at] = symbol_directory_message_record.symbol[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> wire[at] = symbol_directory_message_record.cusip[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 15 -> wire[at] = symbol_directory_message_record.sec_name[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 3 -> wire[at] = symbol_directory_message_record.currency[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> wire[at] = symbol_directory_message_record.stock_group[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> wire[at] = symbol_directory_message_record.listing[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> wire[at] = symbol_directory_message_record.expiry[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> wire[at] = symbol_directory_message_record.lot_size[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> wire[at] = symbol_directory_message_record.settlement_term[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_directory_message_record.listing_market; at = at + 1;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> wire[at] = symbol_directory_message_record.previous_closing_price[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_directory_message_record.listing_tier; at = at + 1;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 20 -> wire[at] = symbol_directory_message_record.market_maker_name[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> wire[at] = symbol_directory_message_record.market_maker_phone_number[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 75 -> wire[at] = symbol_directory_message_record.full_sec_name[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Directory Message off the wire, 195 bytes from where the cursor stands */
inline decode_symbol_directory_message(symbol_directory_message_record) {
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.time_offset[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.symbol[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.cusip[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 15 -> symbol_directory_message_record.sec_name[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 3 -> symbol_directory_message_record.currency[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.stock_group[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.listing[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.expiry[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.lot_size[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.settlement_term[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_record.listing_market = wire[at]; at = at + 1;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.previous_closing_price[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_record.listing_tier = wire[at]; at = at + 1;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 20 -> symbol_directory_message_record.market_maker_name[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.market_maker_phone_number[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 75 -> symbol_directory_message_record.full_sec_name[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Directory Message is what was written, byte for byte */
inline equal_symbol_directory_message(symbol_directory_message_read, symbol_directory_message_written) {
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> assert(symbol_directory_message_read.time_offset[symbol_directory_message_at] == symbol_directory_message_written.time_offset[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> assert(symbol_directory_message_read.symbol[symbol_directory_message_at] == symbol_directory_message_written.symbol[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> assert(symbol_directory_message_read.cusip[symbol_directory_message_at] == symbol_directory_message_written.cusip[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 15 -> assert(symbol_directory_message_read.sec_name[symbol_directory_message_at] == symbol_directory_message_written.sec_name[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 3 -> assert(symbol_directory_message_read.currency[symbol_directory_message_at] == symbol_directory_message_written.currency[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> assert(symbol_directory_message_read.stock_group[symbol_directory_message_at] == symbol_directory_message_written.stock_group[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> assert(symbol_directory_message_read.listing[symbol_directory_message_at] == symbol_directory_message_written.listing[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> assert(symbol_directory_message_read.expiry[symbol_directory_message_at] == symbol_directory_message_written.expiry[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> assert(symbol_directory_message_read.lot_size[symbol_directory_message_at] == symbol_directory_message_written.lot_size[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> assert(symbol_directory_message_read.settlement_term[symbol_directory_message_at] == symbol_directory_message_written.settlement_term[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(symbol_directory_message_read.listing_market == symbol_directory_message_written.listing_market);
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> assert(symbol_directory_message_read.previous_closing_price[symbol_directory_message_at] == symbol_directory_message_written.previous_closing_price[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(symbol_directory_message_read.listing_tier == symbol_directory_message_written.listing_tier);
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 20 -> assert(symbol_directory_message_read.market_maker_name[symbol_directory_message_at] == symbol_directory_message_written.market_maker_name[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> assert(symbol_directory_message_read.market_maker_phone_number[symbol_directory_message_at] == symbol_directory_message_written.market_maker_phone_number[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 75 -> assert(symbol_directory_message_read.full_sec_name[symbol_directory_message_at] == symbol_directory_message_written.full_sec_name[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Dynamics Message: 35 bytes --------------------------------------- */

/* Values and rules for a symbol that can be updated intra-day. Sent for every symbol in the morning, and again during the day if a symbol changes. */
typedef SymbolDynamicsMessage {
  byte time_offset[4];
  byte symbol[12];
  byte settlement_term[8];
  byte gmf_setting;
  byte gmf_volume[8];
  byte anonymous_setting;
  byte moc_eligible
};

int symbol_dynamics_message_at;

/* every byte of Symbol Dynamics Message set to one value */
inline fill_symbol_dynamics_message(symbol_dynamics_message_record, symbol_dynamics_message_value) {
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 4 -> symbol_dynamics_message_record.time_offset[symbol_dynamics_message_at] = symbol_dynamics_message_value; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 12 -> symbol_dynamics_message_record.symbol[symbol_dynamics_message_at] = symbol_dynamics_message_value; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 8 -> symbol_dynamics_message_record.settlement_term[symbol_dynamics_message_at] = symbol_dynamics_message_value; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_record.gmf_setting = symbol_dynamics_message_value;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 8 -> symbol_dynamics_message_record.gmf_volume[symbol_dynamics_message_at] = symbol_dynamics_message_value; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_record.anonymous_setting = symbol_dynamics_message_value;
  symbol_dynamics_message_record.moc_eligible = symbol_dynamics_message_value;
  skip
}

/* each byte of Symbol Dynamics Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_dynamics_message(symbol_dynamics_message_record, symbol_dynamics_message_base) {
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 4 -> symbol_dynamics_message_record.time_offset[symbol_dynamics_message_at] = (symbol_dynamics_message_base + 0 + symbol_dynamics_message_at + 1) % 256; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 12 -> symbol_dynamics_message_record.symbol[symbol_dynamics_message_at] = (symbol_dynamics_message_base + 4 + symbol_dynamics_message_at + 1) % 256; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 8 -> symbol_dynamics_message_record.settlement_term[symbol_dynamics_message_at] = (symbol_dynamics_message_base + 16 + symbol_dynamics_message_at + 1) % 256; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_record.gmf_setting = (symbol_dynamics_message_base + 24 + 1) % 256;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 8 -> symbol_dynamics_message_record.gmf_volume[symbol_dynamics_message_at] = (symbol_dynamics_message_base + 25 + symbol_dynamics_message_at + 1) % 256; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_record.anonymous_setting = (symbol_dynamics_message_base + 33 + 1) % 256;
  symbol_dynamics_message_record.moc_eligible = (symbol_dynamics_message_base + 34 + 1) % 256;
  skip
}

/* Symbol Dynamics Message to the wire, 35 bytes from where the cursor stands */
inline encode_symbol_dynamics_message(symbol_dynamics_message_record) {
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 4 -> wire[at] = symbol_dynamics_message_record.time_offset[symbol_dynamics_message_at]; at = at + 1; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 12 -> wire[at] = symbol_dynamics_message_record.symbol[symbol_dynamics_message_at]; at = at + 1; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 8 -> wire[at] = symbol_dynamics_message_record.settlement_term[symbol_dynamics_message_at]; at = at + 1; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_dynamics_message_record.gmf_setting; at = at + 1;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 8 -> wire[at] = symbol_dynamics_message_record.gmf_volume[symbol_dynamics_message_at]; at = at + 1; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_dynamics_message_record.anonymous_setting; at = at + 1;
  wire[at] = symbol_dynamics_message_record.moc_eligible; at = at + 1;
  skip
}

/* Symbol Dynamics Message off the wire, 35 bytes from where the cursor stands */
inline decode_symbol_dynamics_message(symbol_dynamics_message_record) {
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 4 -> symbol_dynamics_message_record.time_offset[symbol_dynamics_message_at] = wire[at]; at = at + 1; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 12 -> symbol_dynamics_message_record.symbol[symbol_dynamics_message_at] = wire[at]; at = at + 1; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 8 -> symbol_dynamics_message_record.settlement_term[symbol_dynamics_message_at] = wire[at]; at = at + 1; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_record.gmf_setting = wire[at]; at = at + 1;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 8 -> symbol_dynamics_message_record.gmf_volume[symbol_dynamics_message_at] = wire[at]; at = at + 1; symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_record.anonymous_setting = wire[at]; at = at + 1;
  symbol_dynamics_message_record.moc_eligible = wire[at]; at = at + 1;
  skip
}

/* what was read of Symbol Dynamics Message is what was written, byte for byte */
inline equal_symbol_dynamics_message(symbol_dynamics_message_read, symbol_dynamics_message_written) {
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 4 -> assert(symbol_dynamics_message_read.time_offset[symbol_dynamics_message_at] == symbol_dynamics_message_written.time_offset[symbol_dynamics_message_at]); symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 12 -> assert(symbol_dynamics_message_read.symbol[symbol_dynamics_message_at] == symbol_dynamics_message_written.symbol[symbol_dynamics_message_at]); symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 8 -> assert(symbol_dynamics_message_read.settlement_term[symbol_dynamics_message_at] == symbol_dynamics_message_written.settlement_term[symbol_dynamics_message_at]); symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  assert(symbol_dynamics_message_read.gmf_setting == symbol_dynamics_message_written.gmf_setting);
  symbol_dynamics_message_at = 0;
  do
  :: symbol_dynamics_message_at < 8 -> assert(symbol_dynamics_message_read.gmf_volume[symbol_dynamics_message_at] == symbol_dynamics_message_written.gmf_volume[symbol_dynamics_message_at]); symbol_dynamics_message_at = symbol_dynamics_message_at + 1
  :: else -> break
  od;
  assert(symbol_dynamics_message_read.anonymous_setting == symbol_dynamics_message_written.anonymous_setting);
  assert(symbol_dynamics_message_read.moc_eligible == symbol_dynamics_message_written.moc_eligible);
  skip
}

/* ---- Trading Action Message: 25 bytes ---------------------------------------- */

/* Current trading state for a symbol. A symbol suspended intra-day with "V" is unsuspended with "N". */
typedef TradingActionMessage {
  byte time_offset[4];
  byte symbol[12];
  byte trading_state;
  byte exchange_timestamp[8]
};

int trading_action_message_at;

/* every byte of Trading Action Message set to one value */
inline fill_trading_action_message(trading_action_message_record, trading_action_message_value) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.time_offset[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 12 -> trading_action_message_record.symbol[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.trading_state = trading_action_message_value;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.exchange_timestamp[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_trading_action_message(trading_action_message_record, trading_action_message_base) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.time_offset[trading_action_message_at] = (trading_action_message_base + 0 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 12 -> trading_action_message_record.symbol[trading_action_message_at] = (trading_action_message_base + 4 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.trading_state = (trading_action_message_base + 16 + 1) % 256;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.exchange_timestamp[trading_action_message_at] = (trading_action_message_base + 17 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Action Message to the wire, 25 bytes from where the cursor stands */
inline encode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> wire[at] = trading_action_message_record.time_offset[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 12 -> wire[at] = trading_action_message_record.symbol[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_action_message_record.trading_state; at = at + 1;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> wire[at] = trading_action_message_record.exchange_timestamp[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Action Message off the wire, 25 bytes from where the cursor stands */
inline decode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.time_offset[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 12 -> trading_action_message_record.symbol[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.trading_state = wire[at]; at = at + 1;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.exchange_timestamp[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Action Message is what was written, byte for byte */
inline equal_trading_action_message(trading_action_message_read, trading_action_message_written) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> assert(trading_action_message_read.time_offset[trading_action_message_at] == trading_action_message_written.time_offset[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 12 -> assert(trading_action_message_read.symbol[trading_action_message_at] == trading_action_message_written.symbol[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  assert(trading_action_message_read.trading_state == trading_action_message_written.trading_state);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> assert(trading_action_message_read.exchange_timestamp[trading_action_message_at] == trading_action_message_written.exchange_timestamp[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Message: 71 bytes --------------------------------------------- */

/* A new order added to the displayed book. */
typedef AddOrderMessage {
  byte time_offset[4];
  byte order_number[18];
  byte order_verb;
  byte quantity[4];
  byte symbol[12];
  byte price[4];
  byte firm_id[3];
  byte settlement_term[8];
  byte odd_lot_flag;
  byte exchange_timestamp[8];
  byte priority_timestamp[8]
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.time_offset[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 18 -> add_order_message_record.order_number[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_verb = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 12 -> add_order_message_record.symbol[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> add_order_message_record.firm_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.settlement_term[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.odd_lot_flag = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.exchange_timestamp[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.priority_timestamp[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.time_offset[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 18 -> add_order_message_record.order_number[add_order_message_at] = (add_order_message_base + 4 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_verb = (add_order_message_base + 22 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = (add_order_message_base + 23 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 12 -> add_order_message_record.symbol[add_order_message_at] = (add_order_message_base + 27 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 39 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> add_order_message_record.firm_id[add_order_message_at] = (add_order_message_base + 43 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.settlement_term[add_order_message_at] = (add_order_message_base + 46 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.odd_lot_flag = (add_order_message_base + 54 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.exchange_timestamp[add_order_message_at] = (add_order_message_base + 55 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.priority_timestamp[add_order_message_at] = (add_order_message_base + 63 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message to the wire, 71 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.time_offset[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 18 -> wire[at] = add_order_message_record.order_number[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.order_verb; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.quantity[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 12 -> wire[at] = add_order_message_record.symbol[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> wire[at] = add_order_message_record.firm_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.settlement_term[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.odd_lot_flag; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.exchange_timestamp[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.priority_timestamp[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message off the wire, 71 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.time_offset[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 18 -> add_order_message_record.order_number[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_verb = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 12 -> add_order_message_record.symbol[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> add_order_message_record.firm_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.settlement_term[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.odd_lot_flag = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.exchange_timestamp[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.priority_timestamp[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.time_offset[add_order_message_at] == add_order_message_written.time_offset[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 18 -> assert(add_order_message_read.order_number[add_order_message_at] == add_order_message_written.order_number[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.order_verb == add_order_message_written.order_verb);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.quantity[add_order_message_at] == add_order_message_written.quantity[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 12 -> assert(add_order_message_read.symbol[add_order_message_at] == add_order_message_written.symbol[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> assert(add_order_message_read.firm_id[add_order_message_at] == add_order_message_written.firm_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.settlement_term[add_order_message_at] == add_order_message_written.settlement_term[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.odd_lot_flag == add_order_message_written.odd_lot_flag);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.exchange_timestamp[add_order_message_at] == add_order_message_written.exchange_timestamp[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.priority_timestamp[add_order_message_at] == add_order_message_written.priority_timestamp[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message: 52 bytes ---------------------------------------- */

/* An order on the book executed in whole or in part at the price it was displayed at. */
typedef OrderExecutedMessage {
  byte time_offset[4];
  byte order_number[18];
  byte executed_quantity[4];
  byte match_number[18];
  byte exchange_timestamp[8]
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_offset[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 18 -> order_executed_message_record.order_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 18 -> order_executed_message_record.match_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.exchange_timestamp[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_offset[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 18 -> order_executed_message_record.order_number[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 22 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 18 -> order_executed_message_record.match_number[order_executed_message_at] = (order_executed_message_base + 26 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.exchange_timestamp[order_executed_message_at] = (order_executed_message_base + 44 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 52 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.time_offset[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 18 -> wire[at] = order_executed_message_record.order_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 18 -> wire[at] = order_executed_message_record.match_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.exchange_timestamp[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 52 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_offset[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 18 -> order_executed_message_record.order_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 18 -> order_executed_message_record.match_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.exchange_timestamp[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.time_offset[order_executed_message_at] == order_executed_message_written.time_offset[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 18 -> assert(order_executed_message_read.order_number[order_executed_message_at] == order_executed_message_written.order_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 18 -> assert(order_executed_message_read.match_number[order_executed_message_at] == order_executed_message_written.match_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.exchange_timestamp[order_executed_message_at] == order_executed_message_written.exchange_timestamp[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed With Price Message: 56 bytes ----------------------------- */

/* An order on the book executed in whole or in part at a price other than the one it was displayed at. */
typedef OrderExecutedWithPriceMessage {
  byte time_offset[4];
  byte order_number[18];
  byte executed_quantity[4];
  byte match_number[18];
  byte execution_price[4];
  byte exchange_timestamp[8]
};

int order_executed_with_price_message_at;

/* every byte of Order Executed With Price Message set to one value */
inline fill_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_value) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.time_offset[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 18 -> order_executed_with_price_message_record.order_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 18 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.exchange_timestamp[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed With Price Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_base) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.time_offset[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 0 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 18 -> order_executed_with_price_message_record.order_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 4 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 22 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 18 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 26 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 44 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.exchange_timestamp[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 48 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message to the wire, 56 bytes from where the cursor stands */
inline encode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.time_offset[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 18 -> wire[at] = order_executed_with_price_message_record.order_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 18 -> wire[at] = order_executed_with_price_message_record.match_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.exchange_timestamp[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message off the wire, 56 bytes from where the cursor stands */
inline decode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.time_offset[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 18 -> order_executed_with_price_message_record.order_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 18 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.exchange_timestamp[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed With Price Message is what was written, byte for byte */
inline equal_order_executed_with_price_message(order_executed_with_price_message_read, order_executed_with_price_message_written) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.time_offset[order_executed_with_price_message_at] == order_executed_with_price_message_written.time_offset[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 18 -> assert(order_executed_with_price_message_read.order_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.order_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.executed_quantity[order_executed_with_price_message_at] == order_executed_with_price_message_written.executed_quantity[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 18 -> assert(order_executed_with_price_message_read.match_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.match_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.execution_price[order_executed_with_price_message_at] == order_executed_with_price_message_written.execution_price[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.exchange_timestamp[order_executed_with_price_message_at] == order_executed_with_price_message_written.exchange_timestamp[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 71 bytes ------------------------------------------------- */

/* A trade that does not change the displayed book, carrying the full attribution and classification of the execution. */
typedef TradeMessage {
  byte time_offset[4];
  byte executed_quantity[4];
  byte symbol[12];
  byte execution_price[4];
  byte match_number[18];
  byte firm_id[3];
  byte contra_firm_id[3];
  byte settlement_term[8];
  byte trade_attribute;
  byte cross_type;
  byte odd_lot_flag;
  byte sets_the_last_price;
  byte exchange_timestamp[8];
  byte opening_trade;
  byte ccp_session_trade;
  byte moc_trade_marker
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.time_offset[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.executed_quantity[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.symbol[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.execution_price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 18 -> trade_message_record.match_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.firm_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.contra_firm_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.settlement_term[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_attribute = trade_message_value;
  trade_message_record.cross_type = trade_message_value;
  trade_message_record.odd_lot_flag = trade_message_value;
  trade_message_record.sets_the_last_price = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.exchange_timestamp[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.opening_trade = trade_message_value;
  trade_message_record.ccp_session_trade = trade_message_value;
  trade_message_record.moc_trade_marker = trade_message_value;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.time_offset[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.executed_quantity[trade_message_at] = (trade_message_base + 4 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.symbol[trade_message_at] = (trade_message_base + 8 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.execution_price[trade_message_at] = (trade_message_base + 20 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 18 -> trade_message_record.match_number[trade_message_at] = (trade_message_base + 24 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.firm_id[trade_message_at] = (trade_message_base + 42 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.contra_firm_id[trade_message_at] = (trade_message_base + 45 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.settlement_term[trade_message_at] = (trade_message_base + 48 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_attribute = (trade_message_base + 56 + 1) % 256;
  trade_message_record.cross_type = (trade_message_base + 57 + 1) % 256;
  trade_message_record.odd_lot_flag = (trade_message_base + 58 + 1) % 256;
  trade_message_record.sets_the_last_price = (trade_message_base + 59 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.exchange_timestamp[trade_message_at] = (trade_message_base + 60 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.opening_trade = (trade_message_base + 68 + 1) % 256;
  trade_message_record.ccp_session_trade = (trade_message_base + 69 + 1) % 256;
  trade_message_record.moc_trade_marker = (trade_message_base + 70 + 1) % 256;
  skip
}

/* Trade Message to the wire, 71 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.time_offset[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.executed_quantity[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> wire[at] = trade_message_record.symbol[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.execution_price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 18 -> wire[at] = trade_message_record.match_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> wire[at] = trade_message_record.firm_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> wire[at] = trade_message_record.contra_firm_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.settlement_term[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.trade_attribute; at = at + 1;
  wire[at] = trade_message_record.cross_type; at = at + 1;
  wire[at] = trade_message_record.odd_lot_flag; at = at + 1;
  wire[at] = trade_message_record.sets_the_last_price; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.exchange_timestamp[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.opening_trade; at = at + 1;
  wire[at] = trade_message_record.ccp_session_trade; at = at + 1;
  wire[at] = trade_message_record.moc_trade_marker; at = at + 1;
  skip
}

/* Trade Message off the wire, 71 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.time_offset[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.executed_quantity[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.symbol[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.execution_price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 18 -> trade_message_record.match_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.firm_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> trade_message_record.contra_firm_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.settlement_term[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_attribute = wire[at]; at = at + 1;
  trade_message_record.cross_type = wire[at]; at = at + 1;
  trade_message_record.odd_lot_flag = wire[at]; at = at + 1;
  trade_message_record.sets_the_last_price = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.exchange_timestamp[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.opening_trade = wire[at]; at = at + 1;
  trade_message_record.ccp_session_trade = wire[at]; at = at + 1;
  trade_message_record.moc_trade_marker = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.time_offset[trade_message_at] == trade_message_written.time_offset[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.executed_quantity[trade_message_at] == trade_message_written.executed_quantity[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> assert(trade_message_read.symbol[trade_message_at] == trade_message_written.symbol[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.execution_price[trade_message_at] == trade_message_written.execution_price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 18 -> assert(trade_message_read.match_number[trade_message_at] == trade_message_written.match_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> assert(trade_message_read.firm_id[trade_message_at] == trade_message_written.firm_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 3 -> assert(trade_message_read.contra_firm_id[trade_message_at] == trade_message_written.contra_firm_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.settlement_term[trade_message_at] == trade_message_written.settlement_term[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.trade_attribute == trade_message_written.trade_attribute);
  assert(trade_message_read.cross_type == trade_message_written.cross_type);
  assert(trade_message_read.odd_lot_flag == trade_message_written.odd_lot_flag);
  assert(trade_message_read.sets_the_last_price == trade_message_written.sets_the_last_price);
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.exchange_timestamp[trade_message_at] == trade_message_written.exchange_timestamp[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.opening_trade == trade_message_written.opening_trade);
  assert(trade_message_read.ccp_session_trade == trade_message_written.ccp_session_trade);
  assert(trade_message_read.moc_trade_marker == trade_message_written.moc_trade_marker);
  skip
}

/* ---- Broken Trade Message: 31 bytes ------------------------------------------ */

/* A previously transmitted execution that has been broken, naming the match number it cancels. */
typedef BrokenTradeMessage {
  byte time_offset[4];
  byte match_number[18];
  byte reason;
  byte exchange_timestamp[8]
};

int broken_trade_message_at;

/* every byte of Broken Trade Message set to one value */
inline fill_broken_trade_message(broken_trade_message_record, broken_trade_message_value) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.time_offset[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 18 -> broken_trade_message_record.match_number[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.reason = broken_trade_message_value;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.exchange_timestamp[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Broken Trade Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_message(broken_trade_message_record, broken_trade_message_base) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.time_offset[broken_trade_message_at] = (broken_trade_message_base + 0 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 18 -> broken_trade_message_record.match_number[broken_trade_message_at] = (broken_trade_message_base + 4 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.reason = (broken_trade_message_base + 22 + 1) % 256;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.exchange_timestamp[broken_trade_message_at] = (broken_trade_message_base + 23 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message to the wire, 31 bytes from where the cursor stands */
inline encode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> wire[at] = broken_trade_message_record.time_offset[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 18 -> wire[at] = broken_trade_message_record.match_number[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = broken_trade_message_record.reason; at = at + 1;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.exchange_timestamp[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message off the wire, 31 bytes from where the cursor stands */
inline decode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.time_offset[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 18 -> broken_trade_message_record.match_number[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_record.reason = wire[at]; at = at + 1;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.exchange_timestamp[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Broken Trade Message is what was written, byte for byte */
inline equal_broken_trade_message(broken_trade_message_read, broken_trade_message_written) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> assert(broken_trade_message_read.time_offset[broken_trade_message_at] == broken_trade_message_written.time_offset[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 18 -> assert(broken_trade_message_read.match_number[broken_trade_message_at] == broken_trade_message_written.match_number[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  assert(broken_trade_message_read.reason == broken_trade_message_written.reason);
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.exchange_timestamp[broken_trade_message_at] == broken_trade_message_written.exchange_timestamp[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Delete Message: 30 bytes ------------------------------------------ */

/* An order cancelled and removed from the displayed book. */
typedef OrderDeleteMessage {
  byte time_offset[4];
  byte order_number[18];
  byte exchange_timestamp[8]
};

int order_delete_message_at;

/* every byte of Order Delete Message set to one value */
inline fill_order_delete_message(order_delete_message_record, order_delete_message_value) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.time_offset[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 18 -> order_delete_message_record.order_number[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.exchange_timestamp[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Delete Message set to where it lies, so a field read out of place says so */
inline ramp_order_delete_message(order_delete_message_record, order_delete_message_base) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.time_offset[order_delete_message_at] = (order_delete_message_base + 0 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 18 -> order_delete_message_record.order_number[order_delete_message_at] = (order_delete_message_base + 4 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.exchange_timestamp[order_delete_message_at] = (order_delete_message_base + 22 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message to the wire, 30 bytes from where the cursor stands */
inline encode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> wire[at] = order_delete_message_record.time_offset[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 18 -> wire[at] = order_delete_message_record.order_number[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.exchange_timestamp[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message off the wire, 30 bytes from where the cursor stands */
inline decode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.time_offset[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 18 -> order_delete_message_record.order_number[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.exchange_timestamp[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Delete Message is what was written, byte for byte */
inline equal_order_delete_message(order_delete_message_read, order_delete_message_written) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> assert(order_delete_message_read.time_offset[order_delete_message_at] == order_delete_message_written.time_offset[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 18 -> assert(order_delete_message_read.order_number[order_delete_message_at] == order_delete_message_written.order_number[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.exchange_timestamp[order_delete_message_at] == order_delete_message_written.exchange_timestamp[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replace Message: 38 bytes ----------------------------------------- */

/* An order on the book replaced with a new quantity and price, keeping its order number. */
typedef OrderReplaceMessage {
  byte time_offset[4];
  byte order_number[18];
  byte quantity[4];
  byte price[4];
  byte exchange_timestamp[8]
};

int order_replace_message_at;

/* every byte of Order Replace Message set to one value */
inline fill_order_replace_message(order_replace_message_record, order_replace_message_value) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.time_offset[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 18 -> order_replace_message_record.order_number[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.quantity[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.exchange_timestamp[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replace Message set to where it lies, so a field read out of place says so */
inline ramp_order_replace_message(order_replace_message_record, order_replace_message_base) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.time_offset[order_replace_message_at] = (order_replace_message_base + 0 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 18 -> order_replace_message_record.order_number[order_replace_message_at] = (order_replace_message_base + 4 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.quantity[order_replace_message_at] = (order_replace_message_base + 22 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = (order_replace_message_base + 26 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.exchange_timestamp[order_replace_message_at] = (order_replace_message_base + 30 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Message to the wire, 38 bytes from where the cursor stands */
inline encode_order_replace_message(order_replace_message_record) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> wire[at] = order_replace_message_record.time_offset[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 18 -> wire[at] = order_replace_message_record.order_number[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> wire[at] = order_replace_message_record.quantity[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> wire[at] = order_replace_message_record.price[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.exchange_timestamp[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Message off the wire, 38 bytes from where the cursor stands */
inline decode_order_replace_message(order_replace_message_record) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.time_offset[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 18 -> order_replace_message_record.order_number[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.quantity[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.exchange_timestamp[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replace Message is what was written, byte for byte */
inline equal_order_replace_message(order_replace_message_read, order_replace_message_written) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> assert(order_replace_message_read.time_offset[order_replace_message_at] == order_replace_message_written.time_offset[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 18 -> assert(order_replace_message_read.order_number[order_replace_message_at] == order_replace_message_written.order_number[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> assert(order_replace_message_read.quantity[order_replace_message_at] == order_replace_message_written.quantity[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> assert(order_replace_message_read.price[order_replace_message_at] == order_replace_message_written.price[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.exchange_timestamp[order_replace_message_at] == order_replace_message_written.exchange_timestamp[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Bid Offer Message: 40 bytes ---------------------------------------- */

/* The best bid and offer for a symbol with the quantity at each. During an auction with an indicative price set, the indicative price overwrites both sides. */
typedef BestBidOfferMessage {
  byte time_offset[4];
  byte symbol[12];
  byte best_bid[4];
  byte best_bid_size[4];
  byte best_offer[4];
  byte best_offer_size[4];
  byte exchange_timestamp[8]
};

int best_bid_offer_message_at;

/* every byte of Best Bid Offer Message set to one value */
inline fill_best_bid_offer_message(best_bid_offer_message_record, best_bid_offer_message_value) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.time_offset[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 12 -> best_bid_offer_message_record.symbol[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.best_bid[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.best_bid_size[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.best_offer[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.best_offer_size[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.exchange_timestamp[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Bid Offer Message set to where it lies, so a field read out of place says so */
inline ramp_best_bid_offer_message(best_bid_offer_message_record, best_bid_offer_message_base) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.time_offset[best_bid_offer_message_at] = (best_bid_offer_message_base + 0 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 12 -> best_bid_offer_message_record.symbol[best_bid_offer_message_at] = (best_bid_offer_message_base + 4 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.best_bid[best_bid_offer_message_at] = (best_bid_offer_message_base + 16 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.best_bid_size[best_bid_offer_message_at] = (best_bid_offer_message_base + 20 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.best_offer[best_bid_offer_message_at] = (best_bid_offer_message_base + 24 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.best_offer_size[best_bid_offer_message_at] = (best_bid_offer_message_base + 28 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.exchange_timestamp[best_bid_offer_message_at] = (best_bid_offer_message_base + 32 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Offer Message to the wire, 40 bytes from where the cursor stands */
inline encode_best_bid_offer_message(best_bid_offer_message_record) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> wire[at] = best_bid_offer_message_record.time_offset[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 12 -> wire[at] = best_bid_offer_message_record.symbol[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> wire[at] = best_bid_offer_message_record.best_bid[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> wire[at] = best_bid_offer_message_record.best_bid_size[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> wire[at] = best_bid_offer_message_record.best_offer[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> wire[at] = best_bid_offer_message_record.best_offer_size[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> wire[at] = best_bid_offer_message_record.exchange_timestamp[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Offer Message off the wire, 40 bytes from where the cursor stands */
inline decode_best_bid_offer_message(best_bid_offer_message_record) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.time_offset[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 12 -> best_bid_offer_message_record.symbol[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.best_bid[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.best_bid_size[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.best_offer[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.best_offer_size[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.exchange_timestamp[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Bid Offer Message is what was written, byte for byte */
inline equal_best_bid_offer_message(best_bid_offer_message_read, best_bid_offer_message_written) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> assert(best_bid_offer_message_read.time_offset[best_bid_offer_message_at] == best_bid_offer_message_written.time_offset[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 12 -> assert(best_bid_offer_message_read.symbol[best_bid_offer_message_at] == best_bid_offer_message_written.symbol[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> assert(best_bid_offer_message_read.best_bid[best_bid_offer_message_at] == best_bid_offer_message_written.best_bid[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> assert(best_bid_offer_message_read.best_bid_size[best_bid_offer_message_at] == best_bid_offer_message_written.best_bid_size[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> assert(best_bid_offer_message_read.best_offer[best_bid_offer_message_at] == best_bid_offer_message_written.best_offer[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> assert(best_bid_offer_message_read.best_offer_size[best_bid_offer_message_at] == best_bid_offer_message_written.best_offer_size[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> assert(best_bid_offer_message_read.exchange_timestamp[best_bid_offer_message_at] == best_bid_offer_message_written.exchange_timestamp[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Closing Price Message: 20 bytes ----------------------------------------- */

/* The closing price for a symbol. */
typedef ClosingPriceMessage {
  byte time_offset[4];
  byte symbol[12];
  byte price[4]
};

int closing_price_message_at;

/* every byte of Closing Price Message set to one value */
inline fill_closing_price_message(closing_price_message_record, closing_price_message_value) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.time_offset[closing_price_message_at] = closing_price_message_value; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 12 -> closing_price_message_record.symbol[closing_price_message_at] = closing_price_message_value; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.price[closing_price_message_at] = closing_price_message_value; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_closing_price_message(closing_price_message_record, closing_price_message_base) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.time_offset[closing_price_message_at] = (closing_price_message_base + 0 + closing_price_message_at + 1) % 256; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 12 -> closing_price_message_record.symbol[closing_price_message_at] = (closing_price_message_base + 4 + closing_price_message_at + 1) % 256; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.price[closing_price_message_at] = (closing_price_message_base + 16 + closing_price_message_at + 1) % 256; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Closing Price Message to the wire, 20 bytes from where the cursor stands */
inline encode_closing_price_message(closing_price_message_record) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> wire[at] = closing_price_message_record.time_offset[closing_price_message_at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 12 -> wire[at] = closing_price_message_record.symbol[closing_price_message_at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> wire[at] = closing_price_message_record.price[closing_price_message_at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Closing Price Message off the wire, 20 bytes from where the cursor stands */
inline decode_closing_price_message(closing_price_message_record) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.time_offset[closing_price_message_at] = wire[at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 12 -> closing_price_message_record.symbol[closing_price_message_at] = wire[at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.price[closing_price_message_at] = wire[at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Closing Price Message is what was written, byte for byte */
inline equal_closing_price_message(closing_price_message_read, closing_price_message_written) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> assert(closing_price_message_read.time_offset[closing_price_message_at] == closing_price_message_written.time_offset[closing_price_message_at]); closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 12 -> assert(closing_price_message_read.symbol[closing_price_message_at] == closing_price_message_written.symbol[closing_price_message_at]); closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> assert(closing_price_message_read.price[closing_price_message_at] == closing_price_message_written.price[closing_price_message_at]); closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- General Message: 132 bytes ---------------------------------------------- */

/* Free text bulletin from the exchange. */
typedef GeneralMessage {
  byte time_offset[4];
  byte message_text[128]
};

int general_message_at;

/* every byte of General Message set to one value */
inline fill_general_message(general_message_record, general_message_value) {
  general_message_at = 0;
  do
  :: general_message_at < 4 -> general_message_record.time_offset[general_message_at] = general_message_value; general_message_at = general_message_at + 1
  :: else -> break
  od;
  general_message_at = 0;
  do
  :: general_message_at < 128 -> general_message_record.message_text[general_message_at] = general_message_value; general_message_at = general_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of General Message set to where it lies, so a field read out of place says so */
inline ramp_general_message(general_message_record, general_message_base) {
  general_message_at = 0;
  do
  :: general_message_at < 4 -> general_message_record.time_offset[general_message_at] = (general_message_base + 0 + general_message_at + 1) % 256; general_message_at = general_message_at + 1
  :: else -> break
  od;
  general_message_at = 0;
  do
  :: general_message_at < 128 -> general_message_record.message_text[general_message_at] = (general_message_base + 4 + general_message_at + 1) % 256; general_message_at = general_message_at + 1
  :: else -> break
  od;
  skip
}

/* General Message to the wire, 132 bytes from where the cursor stands */
inline encode_general_message(general_message_record) {
  general_message_at = 0;
  do
  :: general_message_at < 4 -> wire[at] = general_message_record.time_offset[general_message_at]; at = at + 1; general_message_at = general_message_at + 1
  :: else -> break
  od;
  general_message_at = 0;
  do
  :: general_message_at < 128 -> wire[at] = general_message_record.message_text[general_message_at]; at = at + 1; general_message_at = general_message_at + 1
  :: else -> break
  od;
  skip
}

/* General Message off the wire, 132 bytes from where the cursor stands */
inline decode_general_message(general_message_record) {
  general_message_at = 0;
  do
  :: general_message_at < 4 -> general_message_record.time_offset[general_message_at] = wire[at]; at = at + 1; general_message_at = general_message_at + 1
  :: else -> break
  od;
  general_message_at = 0;
  do
  :: general_message_at < 128 -> general_message_record.message_text[general_message_at] = wire[at]; at = at + 1; general_message_at = general_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of General Message is what was written, byte for byte */
inline equal_general_message(general_message_read, general_message_written) {
  general_message_at = 0;
  do
  :: general_message_at < 4 -> assert(general_message_read.time_offset[general_message_at] == general_message_written.time_offset[general_message_at]); general_message_at = general_message_at + 1
  :: else -> break
  od;
  general_message_at = 0;
  do
  :: general_message_at < 128 -> assert(general_message_read.message_text[general_message_at] == general_message_written.message_text[general_message_at]); general_message_at = general_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Block Header: encoded, read back, and compared */
proctype check_block_header() {
  BlockHeader block_header_sent;
  BlockHeader block_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_block_header(block_header_sent, 0)
  :: pattern == 1 -> fill_block_header(block_header_sent, 32)
  :: pattern == 2 -> fill_block_header(block_header_sent, 255)
  :: else -> ramp_block_header(block_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_block_header(block_header_sent);
    assert(at == 7);
    at = 0;
    decode_block_header(block_header_got);
    assert(at == 7);
    equal_block_header(block_header_got, block_header_sent)
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
    assert(at == 6);
    at = 0;
    decode_time_message(time_message_got);
    assert(at == 6);
    equal_time_message(time_message_got, time_message_sent)
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
    assert(at == 21);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 21);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Symbol Directory Message: encoded, read back, and compared */
proctype check_symbol_directory_message() {
  SymbolDirectoryMessage symbol_directory_message_sent;
  SymbolDirectoryMessage symbol_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_directory_message(symbol_directory_message_sent, 0)
  :: pattern == 1 -> fill_symbol_directory_message(symbol_directory_message_sent, 32)
  :: pattern == 2 -> fill_symbol_directory_message(symbol_directory_message_sent, 255)
  :: else -> ramp_symbol_directory_message(symbol_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_directory_message(symbol_directory_message_sent);
    assert(at == 195);
    at = 0;
    decode_symbol_directory_message(symbol_directory_message_got);
    assert(at == 195);
    equal_symbol_directory_message(symbol_directory_message_got, symbol_directory_message_sent)
  }
}

/* Symbol Dynamics Message: encoded, read back, and compared */
proctype check_symbol_dynamics_message() {
  SymbolDynamicsMessage symbol_dynamics_message_sent;
  SymbolDynamicsMessage symbol_dynamics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_dynamics_message(symbol_dynamics_message_sent, 0)
  :: pattern == 1 -> fill_symbol_dynamics_message(symbol_dynamics_message_sent, 32)
  :: pattern == 2 -> fill_symbol_dynamics_message(symbol_dynamics_message_sent, 255)
  :: else -> ramp_symbol_dynamics_message(symbol_dynamics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_dynamics_message(symbol_dynamics_message_sent);
    assert(at == 35);
    at = 0;
    decode_symbol_dynamics_message(symbol_dynamics_message_got);
    assert(at == 35);
    equal_symbol_dynamics_message(symbol_dynamics_message_got, symbol_dynamics_message_sent)
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
    assert(at == 25);
    at = 0;
    decode_trading_action_message(trading_action_message_got);
    assert(at == 25);
    equal_trading_action_message(trading_action_message_got, trading_action_message_sent)
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
    assert(at == 71);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 71);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
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
    assert(at == 52);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 52);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Order Executed With Price Message: encoded, read back, and compared */
proctype check_order_executed_with_price_message() {
  OrderExecutedWithPriceMessage order_executed_with_price_message_sent;
  OrderExecutedWithPriceMessage order_executed_with_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 255)
  :: else -> ramp_order_executed_with_price_message(order_executed_with_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_with_price_message(order_executed_with_price_message_sent);
    assert(at == 56);
    at = 0;
    decode_order_executed_with_price_message(order_executed_with_price_message_got);
    assert(at == 56);
    equal_order_executed_with_price_message(order_executed_with_price_message_got, order_executed_with_price_message_sent)
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
    assert(at == 71);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 71);
    equal_trade_message(trade_message_got, trade_message_sent)
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
    assert(at == 31);
    at = 0;
    decode_broken_trade_message(broken_trade_message_got);
    assert(at == 31);
    equal_broken_trade_message(broken_trade_message_got, broken_trade_message_sent)
  }
}

/* Order Delete Message: encoded, read back, and compared */
proctype check_order_delete_message() {
  OrderDeleteMessage order_delete_message_sent;
  OrderDeleteMessage order_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_delete_message(order_delete_message_sent, 0)
  :: pattern == 1 -> fill_order_delete_message(order_delete_message_sent, 32)
  :: pattern == 2 -> fill_order_delete_message(order_delete_message_sent, 255)
  :: else -> ramp_order_delete_message(order_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_delete_message(order_delete_message_sent);
    assert(at == 30);
    at = 0;
    decode_order_delete_message(order_delete_message_got);
    assert(at == 30);
    equal_order_delete_message(order_delete_message_got, order_delete_message_sent)
  }
}

/* Order Replace Message: encoded, read back, and compared */
proctype check_order_replace_message() {
  OrderReplaceMessage order_replace_message_sent;
  OrderReplaceMessage order_replace_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replace_message(order_replace_message_sent, 0)
  :: pattern == 1 -> fill_order_replace_message(order_replace_message_sent, 32)
  :: pattern == 2 -> fill_order_replace_message(order_replace_message_sent, 255)
  :: else -> ramp_order_replace_message(order_replace_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replace_message(order_replace_message_sent);
    assert(at == 38);
    at = 0;
    decode_order_replace_message(order_replace_message_got);
    assert(at == 38);
    equal_order_replace_message(order_replace_message_got, order_replace_message_sent)
  }
}

/* Best Bid Offer Message: encoded, read back, and compared */
proctype check_best_bid_offer_message() {
  BestBidOfferMessage best_bid_offer_message_sent;
  BestBidOfferMessage best_bid_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_bid_offer_message(best_bid_offer_message_sent, 0)
  :: pattern == 1 -> fill_best_bid_offer_message(best_bid_offer_message_sent, 32)
  :: pattern == 2 -> fill_best_bid_offer_message(best_bid_offer_message_sent, 255)
  :: else -> ramp_best_bid_offer_message(best_bid_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_bid_offer_message(best_bid_offer_message_sent);
    assert(at == 40);
    at = 0;
    decode_best_bid_offer_message(best_bid_offer_message_got);
    assert(at == 40);
    equal_best_bid_offer_message(best_bid_offer_message_got, best_bid_offer_message_sent)
  }
}

/* Closing Price Message: encoded, read back, and compared */
proctype check_closing_price_message() {
  ClosingPriceMessage closing_price_message_sent;
  ClosingPriceMessage closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_closing_price_message(closing_price_message_sent, 0)
  :: pattern == 1 -> fill_closing_price_message(closing_price_message_sent, 32)
  :: pattern == 2 -> fill_closing_price_message(closing_price_message_sent, 255)
  :: else -> ramp_closing_price_message(closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_closing_price_message(closing_price_message_sent);
    assert(at == 20);
    at = 0;
    decode_closing_price_message(closing_price_message_got);
    assert(at == 20);
    equal_closing_price_message(closing_price_message_got, closing_price_message_sent)
  }
}

/* General Message: encoded, read back, and compared */
proctype check_general_message() {
  GeneralMessage general_message_sent;
  GeneralMessage general_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_general_message(general_message_sent, 0)
  :: pattern == 1 -> fill_general_message(general_message_sent, 32)
  :: pattern == 2 -> fill_general_message(general_message_sent, 255)
  :: else -> ramp_general_message(general_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_general_message(general_message_sent);
    assert(at == 132);
    at = 0;
    decode_general_message(general_message_got);
    assert(at == 132);
    equal_general_message(general_message_got, general_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_block_header()
  :: run check_message_header()
  :: run check_time_message()
  :: run check_system_event_message()
  :: run check_symbol_directory_message()
  :: run check_symbol_dynamics_message()
  :: run check_trading_action_message()
  :: run check_add_order_message()
  :: run check_order_executed_message()
  :: run check_order_executed_with_price_message()
  :: run check_trade_message()
  :: run check_broken_trade_message()
  :: run check_order_delete_message()
  :: run check_order_replace_message()
  :: run check_best_bid_offer_message()
  :: run check_closing_price_message()
  :: run check_general_message()
  fi
}
