/*
 * TMX Group Quantum Feed Level 1
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
 *   - a length prefix framing what follows
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 84

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Frame Header: 11 bytes -------------------------------------------------- */

/* Xmt Udp Packet Frame Header */
typedef FrameHeader {
  byte start_of_frame;
  byte protocol_name;
  byte protocol_version;
  byte message_length[2];
  byte session_id[4];
  byte ack_required_poss_dup;
  byte num_body
};

int frame_header_at;

/* every byte of Frame Header set to one value */
inline fill_frame_header(frame_header_record, frame_header_value) {
  frame_header_record.start_of_frame = frame_header_value;
  frame_header_record.protocol_name = frame_header_value;
  frame_header_record.protocol_version = frame_header_value;
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> frame_header_record.message_length[frame_header_at] = frame_header_value; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_at = 0;
  do
  :: frame_header_at < 4 -> frame_header_record.session_id[frame_header_at] = frame_header_value; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_record.ack_required_poss_dup = frame_header_value;
  frame_header_record.num_body = frame_header_value;
  skip
}

/* each byte of Frame Header set to where it lies, so a field read out of place says so */
inline ramp_frame_header(frame_header_record, frame_header_base) {
  frame_header_record.start_of_frame = (frame_header_base + 0 + 1) % 256;
  frame_header_record.protocol_name = (frame_header_base + 1 + 1) % 256;
  frame_header_record.protocol_version = (frame_header_base + 2 + 1) % 256;
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> frame_header_record.message_length[frame_header_at] = (frame_header_base + 3 + frame_header_at + 1) % 256; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_at = 0;
  do
  :: frame_header_at < 4 -> frame_header_record.session_id[frame_header_at] = (frame_header_base + 5 + frame_header_at + 1) % 256; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_record.ack_required_poss_dup = (frame_header_base + 9 + 1) % 256;
  frame_header_record.num_body = (frame_header_base + 10 + 1) % 256;
  skip
}

/* Frame Header to the wire, 11 bytes from where the cursor stands */
inline encode_frame_header(frame_header_record) {
  wire[at] = frame_header_record.start_of_frame; at = at + 1;
  wire[at] = frame_header_record.protocol_name; at = at + 1;
  wire[at] = frame_header_record.protocol_version; at = at + 1;
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> wire[at] = frame_header_record.message_length[frame_header_at]; at = at + 1; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_at = 0;
  do
  :: frame_header_at < 4 -> wire[at] = frame_header_record.session_id[frame_header_at]; at = at + 1; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  wire[at] = frame_header_record.ack_required_poss_dup; at = at + 1;
  wire[at] = frame_header_record.num_body; at = at + 1;
  skip
}

/* Frame Header off the wire, 11 bytes from where the cursor stands */
inline decode_frame_header(frame_header_record) {
  frame_header_record.start_of_frame = wire[at]; at = at + 1;
  frame_header_record.protocol_name = wire[at]; at = at + 1;
  frame_header_record.protocol_version = wire[at]; at = at + 1;
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> frame_header_record.message_length[frame_header_at] = wire[at]; at = at + 1; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_at = 0;
  do
  :: frame_header_at < 4 -> frame_header_record.session_id[frame_header_at] = wire[at]; at = at + 1; frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_record.ack_required_poss_dup = wire[at]; at = at + 1;
  frame_header_record.num_body = wire[at]; at = at + 1;
  skip
}

/* what was read of Frame Header is what was written, byte for byte */
inline equal_frame_header(frame_header_read, frame_header_written) {
  assert(frame_header_read.start_of_frame == frame_header_written.start_of_frame);
  assert(frame_header_read.protocol_name == frame_header_written.protocol_name);
  assert(frame_header_read.protocol_version == frame_header_written.protocol_version);
  frame_header_at = 0;
  do
  :: frame_header_at < 2 -> assert(frame_header_read.message_length[frame_header_at] == frame_header_written.message_length[frame_header_at]); frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  frame_header_at = 0;
  do
  :: frame_header_at < 4 -> assert(frame_header_read.session_id[frame_header_at] == frame_header_written.session_id[frame_header_at]); frame_header_at = frame_header_at + 1
  :: else -> break
  od;
  assert(frame_header_read.ack_required_poss_dup == frame_header_written.ack_required_poss_dup);
  assert(frame_header_read.num_body == frame_header_written.num_body);
  skip
}

/* ---- Body Header: 3 bytes ---------------------------------------------------- */

/* Xmt Body Header */
typedef BodyHeader {
  byte msg_length[2];
  byte msg_type
};

int body_header_at;

/* every byte of Body Header set to one value */
inline fill_body_header(body_header_record, body_header_value) {
  body_header_at = 0;
  do
  :: body_header_at < 2 -> body_header_record.msg_length[body_header_at] = body_header_value; body_header_at = body_header_at + 1
  :: else -> break
  od;
  body_header_record.msg_type = body_header_value;
  skip
}

/* each byte of Body Header set to where it lies, so a field read out of place says so */
inline ramp_body_header(body_header_record, body_header_base) {
  body_header_at = 0;
  do
  :: body_header_at < 2 -> body_header_record.msg_length[body_header_at] = (body_header_base + 0 + body_header_at + 1) % 256; body_header_at = body_header_at + 1
  :: else -> break
  od;
  body_header_record.msg_type = (body_header_base + 2 + 1) % 256;
  skip
}

/* Body Header to the wire, 3 bytes from where the cursor stands */
inline encode_body_header(body_header_record) {
  body_header_at = 0;
  do
  :: body_header_at < 2 -> wire[at] = body_header_record.msg_length[body_header_at]; at = at + 1; body_header_at = body_header_at + 1
  :: else -> break
  od;
  wire[at] = body_header_record.msg_type; at = at + 1;
  skip
}

/* Body Header off the wire, 3 bytes from where the cursor stands */
inline decode_body_header(body_header_record) {
  body_header_at = 0;
  do
  :: body_header_at < 2 -> body_header_record.msg_length[body_header_at] = wire[at]; at = at + 1; body_header_at = body_header_at + 1
  :: else -> break
  od;
  body_header_record.msg_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Body Header is what was written, byte for byte */
inline equal_body_header(body_header_read, body_header_written) {
  body_header_at = 0;
  do
  :: body_header_at < 2 -> assert(body_header_read.msg_length[body_header_at] == body_header_written.msg_length[body_header_at]); body_header_at = body_header_at + 1
  :: else -> break
  od;
  assert(body_header_read.msg_type == body_header_written.msg_type);
  skip
}

/* ---- Business Header: 9 bytes ------------------------------------------------ */

/* Xmt Business Header */
typedef BusinessHeader {
  byte msg_version;
  byte source_id;
  byte stream_id[2];
  byte sequence_0;
  byte sequence_1[4]
};

int business_header_at;

/* every byte of Business Header set to one value */
inline fill_business_header(business_header_record, business_header_value) {
  business_header_record.msg_version = business_header_value;
  business_header_record.source_id = business_header_value;
  business_header_at = 0;
  do
  :: business_header_at < 2 -> business_header_record.stream_id[business_header_at] = business_header_value; business_header_at = business_header_at + 1
  :: else -> break
  od;
  business_header_record.sequence_0 = business_header_value;
  business_header_at = 0;
  do
  :: business_header_at < 4 -> business_header_record.sequence_1[business_header_at] = business_header_value; business_header_at = business_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Business Header set to where it lies, so a field read out of place says so */
inline ramp_business_header(business_header_record, business_header_base) {
  business_header_record.msg_version = (business_header_base + 0 + 1) % 256;
  business_header_record.source_id = (business_header_base + 1 + 1) % 256;
  business_header_at = 0;
  do
  :: business_header_at < 2 -> business_header_record.stream_id[business_header_at] = (business_header_base + 2 + business_header_at + 1) % 256; business_header_at = business_header_at + 1
  :: else -> break
  od;
  business_header_record.sequence_0 = (business_header_base + 4 + 1) % 256;
  business_header_at = 0;
  do
  :: business_header_at < 4 -> business_header_record.sequence_1[business_header_at] = (business_header_base + 5 + business_header_at + 1) % 256; business_header_at = business_header_at + 1
  :: else -> break
  od;
  skip
}

/* Business Header to the wire, 9 bytes from where the cursor stands */
inline encode_business_header(business_header_record) {
  wire[at] = business_header_record.msg_version; at = at + 1;
  wire[at] = business_header_record.source_id; at = at + 1;
  business_header_at = 0;
  do
  :: business_header_at < 2 -> wire[at] = business_header_record.stream_id[business_header_at]; at = at + 1; business_header_at = business_header_at + 1
  :: else -> break
  od;
  wire[at] = business_header_record.sequence_0; at = at + 1;
  business_header_at = 0;
  do
  :: business_header_at < 4 -> wire[at] = business_header_record.sequence_1[business_header_at]; at = at + 1; business_header_at = business_header_at + 1
  :: else -> break
  od;
  skip
}

/* Business Header off the wire, 9 bytes from where the cursor stands */
inline decode_business_header(business_header_record) {
  business_header_record.msg_version = wire[at]; at = at + 1;
  business_header_record.source_id = wire[at]; at = at + 1;
  business_header_at = 0;
  do
  :: business_header_at < 2 -> business_header_record.stream_id[business_header_at] = wire[at]; at = at + 1; business_header_at = business_header_at + 1
  :: else -> break
  od;
  business_header_record.sequence_0 = wire[at]; at = at + 1;
  business_header_at = 0;
  do
  :: business_header_at < 4 -> business_header_record.sequence_1[business_header_at] = wire[at]; at = at + 1; business_header_at = business_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Business Header is what was written, byte for byte */
inline equal_business_header(business_header_read, business_header_written) {
  assert(business_header_read.msg_version == business_header_written.msg_version);
  assert(business_header_read.source_id == business_header_written.source_id);
  business_header_at = 0;
  do
  :: business_header_at < 2 -> assert(business_header_read.stream_id[business_header_at] == business_header_written.stream_id[business_header_at]); business_header_at = business_header_at + 1
  :: else -> break
  od;
  assert(business_header_read.sequence_0 == business_header_written.sequence_0);
  business_header_at = 0;
  do
  :: business_header_at < 4 -> assert(business_header_read.sequence_1[business_header_at] == business_header_written.sequence_1[business_header_at]); business_header_at = business_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Status Message: 66 bytes ----------------------------------------- */

typedef SymbolStatusMessage {
  byte symbol[12];
  byte stock_group;
  byte cusip[12];
  byte board_lot[2];
  byte currency;
  byte face_value[8];
  byte last_sale_price[8];
  byte listing_market;
  byte product_type;
  byte buy_maximum_quantity[4];
  byte buy_minimum_quantity[4];
  byte sell_maximum_quantity[4];
  byte sell_minimum_quantity[4];
  byte stock_state[2];
  byte test_symbol;
  byte moc_eligible
};

int symbol_status_message_at;

/* every byte of Symbol Status Message set to one value */
inline fill_symbol_status_message(symbol_status_message_record, symbol_status_message_value) {
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.symbol[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.stock_group = symbol_status_message_value;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.cusip[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.board_lot[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.currency = symbol_status_message_value;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 8 -> symbol_status_message_record.face_value[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 8 -> symbol_status_message_record.last_sale_price[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.listing_market = symbol_status_message_value;
  symbol_status_message_record.product_type = symbol_status_message_value;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.buy_maximum_quantity[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.buy_minimum_quantity[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.sell_maximum_quantity[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.sell_minimum_quantity[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_state[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.test_symbol = symbol_status_message_value;
  symbol_status_message_record.moc_eligible = symbol_status_message_value;
  skip
}

/* each byte of Symbol Status Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_status_message(symbol_status_message_record, symbol_status_message_base) {
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.symbol[symbol_status_message_at] = (symbol_status_message_base + 0 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.stock_group = (symbol_status_message_base + 12 + 1) % 256;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.cusip[symbol_status_message_at] = (symbol_status_message_base + 13 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.board_lot[symbol_status_message_at] = (symbol_status_message_base + 25 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.currency = (symbol_status_message_base + 27 + 1) % 256;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 8 -> symbol_status_message_record.face_value[symbol_status_message_at] = (symbol_status_message_base + 28 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 8 -> symbol_status_message_record.last_sale_price[symbol_status_message_at] = (symbol_status_message_base + 36 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.listing_market = (symbol_status_message_base + 44 + 1) % 256;
  symbol_status_message_record.product_type = (symbol_status_message_base + 45 + 1) % 256;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.buy_maximum_quantity[symbol_status_message_at] = (symbol_status_message_base + 46 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.buy_minimum_quantity[symbol_status_message_at] = (symbol_status_message_base + 50 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.sell_maximum_quantity[symbol_status_message_at] = (symbol_status_message_base + 54 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.sell_minimum_quantity[symbol_status_message_at] = (symbol_status_message_base + 58 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_state[symbol_status_message_at] = (symbol_status_message_base + 62 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.test_symbol = (symbol_status_message_base + 64 + 1) % 256;
  symbol_status_message_record.moc_eligible = (symbol_status_message_base + 65 + 1) % 256;
  skip
}

/* Symbol Status Message to the wire, 66 bytes from where the cursor stands */
inline encode_symbol_status_message(symbol_status_message_record) {
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> wire[at] = symbol_status_message_record.symbol[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_status_message_record.stock_group; at = at + 1;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> wire[at] = symbol_status_message_record.cusip[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> wire[at] = symbol_status_message_record.board_lot[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_status_message_record.currency; at = at + 1;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 8 -> wire[at] = symbol_status_message_record.face_value[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 8 -> wire[at] = symbol_status_message_record.last_sale_price[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_status_message_record.listing_market; at = at + 1;
  wire[at] = symbol_status_message_record.product_type; at = at + 1;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> wire[at] = symbol_status_message_record.buy_maximum_quantity[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> wire[at] = symbol_status_message_record.buy_minimum_quantity[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> wire[at] = symbol_status_message_record.sell_maximum_quantity[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> wire[at] = symbol_status_message_record.sell_minimum_quantity[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> wire[at] = symbol_status_message_record.stock_state[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_status_message_record.test_symbol; at = at + 1;
  wire[at] = symbol_status_message_record.moc_eligible; at = at + 1;
  skip
}

/* Symbol Status Message off the wire, 66 bytes from where the cursor stands */
inline decode_symbol_status_message(symbol_status_message_record) {
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.symbol[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.stock_group = wire[at]; at = at + 1;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.cusip[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.board_lot[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.currency = wire[at]; at = at + 1;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 8 -> symbol_status_message_record.face_value[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 8 -> symbol_status_message_record.last_sale_price[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.listing_market = wire[at]; at = at + 1;
  symbol_status_message_record.product_type = wire[at]; at = at + 1;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.buy_maximum_quantity[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.buy_minimum_quantity[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.sell_maximum_quantity[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.sell_minimum_quantity[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_state[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.test_symbol = wire[at]; at = at + 1;
  symbol_status_message_record.moc_eligible = wire[at]; at = at + 1;
  skip
}

/* what was read of Symbol Status Message is what was written, byte for byte */
inline equal_symbol_status_message(symbol_status_message_read, symbol_status_message_written) {
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> assert(symbol_status_message_read.symbol[symbol_status_message_at] == symbol_status_message_written.symbol[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  assert(symbol_status_message_read.stock_group == symbol_status_message_written.stock_group);
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> assert(symbol_status_message_read.cusip[symbol_status_message_at] == symbol_status_message_written.cusip[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> assert(symbol_status_message_read.board_lot[symbol_status_message_at] == symbol_status_message_written.board_lot[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  assert(symbol_status_message_read.currency == symbol_status_message_written.currency);
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 8 -> assert(symbol_status_message_read.face_value[symbol_status_message_at] == symbol_status_message_written.face_value[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 8 -> assert(symbol_status_message_read.last_sale_price[symbol_status_message_at] == symbol_status_message_written.last_sale_price[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  assert(symbol_status_message_read.listing_market == symbol_status_message_written.listing_market);
  assert(symbol_status_message_read.product_type == symbol_status_message_written.product_type);
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> assert(symbol_status_message_read.buy_maximum_quantity[symbol_status_message_at] == symbol_status_message_written.buy_maximum_quantity[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> assert(symbol_status_message_read.buy_minimum_quantity[symbol_status_message_at] == symbol_status_message_written.buy_minimum_quantity[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> assert(symbol_status_message_read.sell_maximum_quantity[symbol_status_message_at] == symbol_status_message_written.sell_maximum_quantity[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> assert(symbol_status_message_read.sell_minimum_quantity[symbol_status_message_at] == symbol_status_message_written.sell_minimum_quantity[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> assert(symbol_status_message_read.stock_state[symbol_status_message_at] == symbol_status_message_written.stock_state[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  assert(symbol_status_message_read.test_symbol == symbol_status_message_written.test_symbol);
  assert(symbol_status_message_read.moc_eligible == symbol_status_message_written.moc_eligible);
  skip
}

/* ---- Trade Report Message: 65 bytes ------------------------------------------ */

typedef TradeReportMessage {
  byte symbol[12];
  byte price[8];
  byte volume[4];
  byte buy_broker_number[2];
  byte sell_broker_number[2];
  byte bypass;
  byte trade_time_stamp[4];
  byte settlement_terms;
  byte cross_type;
  byte last_sale_price[8];
  byte opening_trade;
  byte listing_market;
  byte product_type;
  byte trade_number[4];
  byte trade_date[4];
  byte is_mid_only;
  byte is_dark;
  byte is_conditional;
  byte trading_system_time_stamp[8]
};

int trade_report_message_at;

/* every byte of Trade Report Message set to one value */
inline fill_trade_report_message(trade_report_message_record, trade_report_message_value) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 12 -> trade_report_message_record.symbol[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.price[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.volume[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.buy_broker_number[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.sell_broker_number[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.bypass = trade_report_message_value;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_time_stamp[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.settlement_terms = trade_report_message_value;
  trade_report_message_record.cross_type = trade_report_message_value;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.last_sale_price[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.opening_trade = trade_report_message_value;
  trade_report_message_record.listing_market = trade_report_message_value;
  trade_report_message_record.product_type = trade_report_message_value;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_number[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_date[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.is_mid_only = trade_report_message_value;
  trade_report_message_record.is_dark = trade_report_message_value;
  trade_report_message_record.is_conditional = trade_report_message_value;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trading_system_time_stamp[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_message(trade_report_message_record, trade_report_message_base) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 12 -> trade_report_message_record.symbol[trade_report_message_at] = (trade_report_message_base + 0 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.price[trade_report_message_at] = (trade_report_message_base + 12 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.volume[trade_report_message_at] = (trade_report_message_base + 20 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.buy_broker_number[trade_report_message_at] = (trade_report_message_base + 24 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.sell_broker_number[trade_report_message_at] = (trade_report_message_base + 26 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.bypass = (trade_report_message_base + 28 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_time_stamp[trade_report_message_at] = (trade_report_message_base + 29 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.settlement_terms = (trade_report_message_base + 33 + 1) % 256;
  trade_report_message_record.cross_type = (trade_report_message_base + 34 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.last_sale_price[trade_report_message_at] = (trade_report_message_base + 35 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.opening_trade = (trade_report_message_base + 43 + 1) % 256;
  trade_report_message_record.listing_market = (trade_report_message_base + 44 + 1) % 256;
  trade_report_message_record.product_type = (trade_report_message_base + 45 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_number[trade_report_message_at] = (trade_report_message_base + 46 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_date[trade_report_message_at] = (trade_report_message_base + 50 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.is_mid_only = (trade_report_message_base + 54 + 1) % 256;
  trade_report_message_record.is_dark = (trade_report_message_base + 55 + 1) % 256;
  trade_report_message_record.is_conditional = (trade_report_message_base + 56 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trading_system_time_stamp[trade_report_message_at] = (trade_report_message_base + 57 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Message to the wire, 65 bytes from where the cursor stands */
inline encode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 12 -> wire[at] = trade_report_message_record.symbol[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.price[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.volume[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> wire[at] = trade_report_message_record.buy_broker_number[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> wire[at] = trade_report_message_record.sell_broker_number[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_record.bypass; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.trade_time_stamp[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_record.settlement_terms; at = at + 1;
  wire[at] = trade_report_message_record.cross_type; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.last_sale_price[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_record.opening_trade; at = at + 1;
  wire[at] = trade_report_message_record.listing_market; at = at + 1;
  wire[at] = trade_report_message_record.product_type; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.trade_number[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.trade_date[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_record.is_mid_only; at = at + 1;
  wire[at] = trade_report_message_record.is_dark; at = at + 1;
  wire[at] = trade_report_message_record.is_conditional; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.trading_system_time_stamp[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Message off the wire, 65 bytes from where the cursor stands */
inline decode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 12 -> trade_report_message_record.symbol[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.price[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.volume[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.buy_broker_number[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.sell_broker_number[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.bypass = wire[at]; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_time_stamp[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.settlement_terms = wire[at]; at = at + 1;
  trade_report_message_record.cross_type = wire[at]; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.last_sale_price[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.opening_trade = wire[at]; at = at + 1;
  trade_report_message_record.listing_market = wire[at]; at = at + 1;
  trade_report_message_record.product_type = wire[at]; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_number[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_date[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.is_mid_only = wire[at]; at = at + 1;
  trade_report_message_record.is_dark = wire[at]; at = at + 1;
  trade_report_message_record.is_conditional = wire[at]; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trading_system_time_stamp[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Report Message is what was written, byte for byte */
inline equal_trade_report_message(trade_report_message_read, trade_report_message_written) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 12 -> assert(trade_report_message_read.symbol[trade_report_message_at] == trade_report_message_written.symbol[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.price[trade_report_message_at] == trade_report_message_written.price[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.volume[trade_report_message_at] == trade_report_message_written.volume[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> assert(trade_report_message_read.buy_broker_number[trade_report_message_at] == trade_report_message_written.buy_broker_number[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> assert(trade_report_message_read.sell_broker_number[trade_report_message_at] == trade_report_message_written.sell_broker_number[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_read.bypass == trade_report_message_written.bypass);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.trade_time_stamp[trade_report_message_at] == trade_report_message_written.trade_time_stamp[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_read.settlement_terms == trade_report_message_written.settlement_terms);
  assert(trade_report_message_read.cross_type == trade_report_message_written.cross_type);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.last_sale_price[trade_report_message_at] == trade_report_message_written.last_sale_price[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_read.opening_trade == trade_report_message_written.opening_trade);
  assert(trade_report_message_read.listing_market == trade_report_message_written.listing_market);
  assert(trade_report_message_read.product_type == trade_report_message_written.product_type);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.trade_number[trade_report_message_at] == trade_report_message_written.trade_number[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.trade_date[trade_report_message_at] == trade_report_message_written.trade_date[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_read.is_mid_only == trade_report_message_written.is_mid_only);
  assert(trade_report_message_read.is_dark == trade_report_message_written.is_dark);
  assert(trade_report_message_read.is_conditional == trade_report_message_written.is_conditional);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.trading_system_time_stamp[trade_report_message_at] == trade_report_message_written.trading_system_time_stamp[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancelled Message: 58 bytes --------------------------------------- */

typedef TradeCancelledMessage {
  byte symbol[12];
  byte volume[4];
  byte price[8];
  byte buy_broker_number[2];
  byte sell_broker_number[2];
  byte trade_time_stamp[4];
  byte last_sale_price[8];
  byte listing_market;
  byte product_type;
  byte trade_number[4];
  byte trade_date[4];
  byte trading_system_time_stamp[8]
};

int trade_cancelled_message_at;

/* every byte of Trade Cancelled Message set to one value */
inline fill_trade_cancelled_message(trade_cancelled_message_record, trade_cancelled_message_value) {
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 12 -> trade_cancelled_message_record.symbol[trade_cancelled_message_at] = trade_cancelled_message_value; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.volume[trade_cancelled_message_at] = trade_cancelled_message_value; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> trade_cancelled_message_record.price[trade_cancelled_message_at] = trade_cancelled_message_value; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 2 -> trade_cancelled_message_record.buy_broker_number[trade_cancelled_message_at] = trade_cancelled_message_value; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 2 -> trade_cancelled_message_record.sell_broker_number[trade_cancelled_message_at] = trade_cancelled_message_value; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.trade_time_stamp[trade_cancelled_message_at] = trade_cancelled_message_value; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> trade_cancelled_message_record.last_sale_price[trade_cancelled_message_at] = trade_cancelled_message_value; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_record.listing_market = trade_cancelled_message_value;
  trade_cancelled_message_record.product_type = trade_cancelled_message_value;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.trade_number[trade_cancelled_message_at] = trade_cancelled_message_value; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.trade_date[trade_cancelled_message_at] = trade_cancelled_message_value; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> trade_cancelled_message_record.trading_system_time_stamp[trade_cancelled_message_at] = trade_cancelled_message_value; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancelled Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancelled_message(trade_cancelled_message_record, trade_cancelled_message_base) {
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 12 -> trade_cancelled_message_record.symbol[trade_cancelled_message_at] = (trade_cancelled_message_base + 0 + trade_cancelled_message_at + 1) % 256; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.volume[trade_cancelled_message_at] = (trade_cancelled_message_base + 12 + trade_cancelled_message_at + 1) % 256; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> trade_cancelled_message_record.price[trade_cancelled_message_at] = (trade_cancelled_message_base + 16 + trade_cancelled_message_at + 1) % 256; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 2 -> trade_cancelled_message_record.buy_broker_number[trade_cancelled_message_at] = (trade_cancelled_message_base + 24 + trade_cancelled_message_at + 1) % 256; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 2 -> trade_cancelled_message_record.sell_broker_number[trade_cancelled_message_at] = (trade_cancelled_message_base + 26 + trade_cancelled_message_at + 1) % 256; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.trade_time_stamp[trade_cancelled_message_at] = (trade_cancelled_message_base + 28 + trade_cancelled_message_at + 1) % 256; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> trade_cancelled_message_record.last_sale_price[trade_cancelled_message_at] = (trade_cancelled_message_base + 32 + trade_cancelled_message_at + 1) % 256; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_record.listing_market = (trade_cancelled_message_base + 40 + 1) % 256;
  trade_cancelled_message_record.product_type = (trade_cancelled_message_base + 41 + 1) % 256;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.trade_number[trade_cancelled_message_at] = (trade_cancelled_message_base + 42 + trade_cancelled_message_at + 1) % 256; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.trade_date[trade_cancelled_message_at] = (trade_cancelled_message_base + 46 + trade_cancelled_message_at + 1) % 256; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> trade_cancelled_message_record.trading_system_time_stamp[trade_cancelled_message_at] = (trade_cancelled_message_base + 50 + trade_cancelled_message_at + 1) % 256; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancelled Message to the wire, 58 bytes from where the cursor stands */
inline encode_trade_cancelled_message(trade_cancelled_message_record) {
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 12 -> wire[at] = trade_cancelled_message_record.symbol[trade_cancelled_message_at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> wire[at] = trade_cancelled_message_record.volume[trade_cancelled_message_at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> wire[at] = trade_cancelled_message_record.price[trade_cancelled_message_at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 2 -> wire[at] = trade_cancelled_message_record.buy_broker_number[trade_cancelled_message_at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 2 -> wire[at] = trade_cancelled_message_record.sell_broker_number[trade_cancelled_message_at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> wire[at] = trade_cancelled_message_record.trade_time_stamp[trade_cancelled_message_at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> wire[at] = trade_cancelled_message_record.last_sale_price[trade_cancelled_message_at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancelled_message_record.listing_market; at = at + 1;
  wire[at] = trade_cancelled_message_record.product_type; at = at + 1;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> wire[at] = trade_cancelled_message_record.trade_number[trade_cancelled_message_at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> wire[at] = trade_cancelled_message_record.trade_date[trade_cancelled_message_at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> wire[at] = trade_cancelled_message_record.trading_system_time_stamp[trade_cancelled_message_at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancelled Message off the wire, 58 bytes from where the cursor stands */
inline decode_trade_cancelled_message(trade_cancelled_message_record) {
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 12 -> trade_cancelled_message_record.symbol[trade_cancelled_message_at] = wire[at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.volume[trade_cancelled_message_at] = wire[at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> trade_cancelled_message_record.price[trade_cancelled_message_at] = wire[at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 2 -> trade_cancelled_message_record.buy_broker_number[trade_cancelled_message_at] = wire[at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 2 -> trade_cancelled_message_record.sell_broker_number[trade_cancelled_message_at] = wire[at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.trade_time_stamp[trade_cancelled_message_at] = wire[at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> trade_cancelled_message_record.last_sale_price[trade_cancelled_message_at] = wire[at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_record.listing_market = wire[at]; at = at + 1;
  trade_cancelled_message_record.product_type = wire[at]; at = at + 1;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.trade_number[trade_cancelled_message_at] = wire[at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.trade_date[trade_cancelled_message_at] = wire[at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> trade_cancelled_message_record.trading_system_time_stamp[trade_cancelled_message_at] = wire[at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancelled Message is what was written, byte for byte */
inline equal_trade_cancelled_message(trade_cancelled_message_read, trade_cancelled_message_written) {
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 12 -> assert(trade_cancelled_message_read.symbol[trade_cancelled_message_at] == trade_cancelled_message_written.symbol[trade_cancelled_message_at]); trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> assert(trade_cancelled_message_read.volume[trade_cancelled_message_at] == trade_cancelled_message_written.volume[trade_cancelled_message_at]); trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> assert(trade_cancelled_message_read.price[trade_cancelled_message_at] == trade_cancelled_message_written.price[trade_cancelled_message_at]); trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 2 -> assert(trade_cancelled_message_read.buy_broker_number[trade_cancelled_message_at] == trade_cancelled_message_written.buy_broker_number[trade_cancelled_message_at]); trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 2 -> assert(trade_cancelled_message_read.sell_broker_number[trade_cancelled_message_at] == trade_cancelled_message_written.sell_broker_number[trade_cancelled_message_at]); trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> assert(trade_cancelled_message_read.trade_time_stamp[trade_cancelled_message_at] == trade_cancelled_message_written.trade_time_stamp[trade_cancelled_message_at]); trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> assert(trade_cancelled_message_read.last_sale_price[trade_cancelled_message_at] == trade_cancelled_message_written.last_sale_price[trade_cancelled_message_at]); trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  assert(trade_cancelled_message_read.listing_market == trade_cancelled_message_written.listing_market);
  assert(trade_cancelled_message_read.product_type == trade_cancelled_message_written.product_type);
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> assert(trade_cancelled_message_read.trade_number[trade_cancelled_message_at] == trade_cancelled_message_written.trade_number[trade_cancelled_message_at]); trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> assert(trade_cancelled_message_read.trade_date[trade_cancelled_message_at] == trade_cancelled_message_written.trade_date[trade_cancelled_message_at]); trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> assert(trade_cancelled_message_read.trading_system_time_stamp[trade_cancelled_message_at] == trade_cancelled_message_written.trading_system_time_stamp[trade_cancelled_message_at]); trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Moc Imbalance Message: 62 bytes ----------------------------------------- */

typedef MocImbalanceMessage {
  byte symbol[12];
  byte imbalance_side;
  byte imbalance_volume[4];
  byte trading_system_time_stamp[8];
  byte imbalance_reference_price[8];
  byte paired_volume[4];
  byte market_order_imbalance_volume[4];
  byte market_order_imbalance_side;
  byte near_indicative_closing_price[8];
  byte far_indicative_closing_price[8];
  byte price_variation[4]
};

int moc_imbalance_message_at;

/* every byte of Moc Imbalance Message set to one value */
inline fill_moc_imbalance_message(moc_imbalance_message_record, moc_imbalance_message_value) {
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 12 -> moc_imbalance_message_record.symbol[moc_imbalance_message_at] = moc_imbalance_message_value; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_record.imbalance_side = moc_imbalance_message_value;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> moc_imbalance_message_record.imbalance_volume[moc_imbalance_message_at] = moc_imbalance_message_value; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> moc_imbalance_message_record.trading_system_time_stamp[moc_imbalance_message_at] = moc_imbalance_message_value; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> moc_imbalance_message_record.imbalance_reference_price[moc_imbalance_message_at] = moc_imbalance_message_value; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> moc_imbalance_message_record.paired_volume[moc_imbalance_message_at] = moc_imbalance_message_value; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> moc_imbalance_message_record.market_order_imbalance_volume[moc_imbalance_message_at] = moc_imbalance_message_value; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_record.market_order_imbalance_side = moc_imbalance_message_value;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> moc_imbalance_message_record.near_indicative_closing_price[moc_imbalance_message_at] = moc_imbalance_message_value; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> moc_imbalance_message_record.far_indicative_closing_price[moc_imbalance_message_at] = moc_imbalance_message_value; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> moc_imbalance_message_record.price_variation[moc_imbalance_message_at] = moc_imbalance_message_value; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Moc Imbalance Message set to where it lies, so a field read out of place says so */
inline ramp_moc_imbalance_message(moc_imbalance_message_record, moc_imbalance_message_base) {
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 12 -> moc_imbalance_message_record.symbol[moc_imbalance_message_at] = (moc_imbalance_message_base + 0 + moc_imbalance_message_at + 1) % 256; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_record.imbalance_side = (moc_imbalance_message_base + 12 + 1) % 256;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> moc_imbalance_message_record.imbalance_volume[moc_imbalance_message_at] = (moc_imbalance_message_base + 13 + moc_imbalance_message_at + 1) % 256; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> moc_imbalance_message_record.trading_system_time_stamp[moc_imbalance_message_at] = (moc_imbalance_message_base + 17 + moc_imbalance_message_at + 1) % 256; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> moc_imbalance_message_record.imbalance_reference_price[moc_imbalance_message_at] = (moc_imbalance_message_base + 25 + moc_imbalance_message_at + 1) % 256; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> moc_imbalance_message_record.paired_volume[moc_imbalance_message_at] = (moc_imbalance_message_base + 33 + moc_imbalance_message_at + 1) % 256; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> moc_imbalance_message_record.market_order_imbalance_volume[moc_imbalance_message_at] = (moc_imbalance_message_base + 37 + moc_imbalance_message_at + 1) % 256; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_record.market_order_imbalance_side = (moc_imbalance_message_base + 41 + 1) % 256;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> moc_imbalance_message_record.near_indicative_closing_price[moc_imbalance_message_at] = (moc_imbalance_message_base + 42 + moc_imbalance_message_at + 1) % 256; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> moc_imbalance_message_record.far_indicative_closing_price[moc_imbalance_message_at] = (moc_imbalance_message_base + 50 + moc_imbalance_message_at + 1) % 256; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> moc_imbalance_message_record.price_variation[moc_imbalance_message_at] = (moc_imbalance_message_base + 58 + moc_imbalance_message_at + 1) % 256; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Moc Imbalance Message to the wire, 62 bytes from where the cursor stands */
inline encode_moc_imbalance_message(moc_imbalance_message_record) {
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 12 -> wire[at] = moc_imbalance_message_record.symbol[moc_imbalance_message_at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = moc_imbalance_message_record.imbalance_side; at = at + 1;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> wire[at] = moc_imbalance_message_record.imbalance_volume[moc_imbalance_message_at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> wire[at] = moc_imbalance_message_record.trading_system_time_stamp[moc_imbalance_message_at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> wire[at] = moc_imbalance_message_record.imbalance_reference_price[moc_imbalance_message_at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> wire[at] = moc_imbalance_message_record.paired_volume[moc_imbalance_message_at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> wire[at] = moc_imbalance_message_record.market_order_imbalance_volume[moc_imbalance_message_at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = moc_imbalance_message_record.market_order_imbalance_side; at = at + 1;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> wire[at] = moc_imbalance_message_record.near_indicative_closing_price[moc_imbalance_message_at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> wire[at] = moc_imbalance_message_record.far_indicative_closing_price[moc_imbalance_message_at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> wire[at] = moc_imbalance_message_record.price_variation[moc_imbalance_message_at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Moc Imbalance Message off the wire, 62 bytes from where the cursor stands */
inline decode_moc_imbalance_message(moc_imbalance_message_record) {
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 12 -> moc_imbalance_message_record.symbol[moc_imbalance_message_at] = wire[at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_record.imbalance_side = wire[at]; at = at + 1;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> moc_imbalance_message_record.imbalance_volume[moc_imbalance_message_at] = wire[at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> moc_imbalance_message_record.trading_system_time_stamp[moc_imbalance_message_at] = wire[at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> moc_imbalance_message_record.imbalance_reference_price[moc_imbalance_message_at] = wire[at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> moc_imbalance_message_record.paired_volume[moc_imbalance_message_at] = wire[at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> moc_imbalance_message_record.market_order_imbalance_volume[moc_imbalance_message_at] = wire[at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_record.market_order_imbalance_side = wire[at]; at = at + 1;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> moc_imbalance_message_record.near_indicative_closing_price[moc_imbalance_message_at] = wire[at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> moc_imbalance_message_record.far_indicative_closing_price[moc_imbalance_message_at] = wire[at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> moc_imbalance_message_record.price_variation[moc_imbalance_message_at] = wire[at]; at = at + 1; moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Moc Imbalance Message is what was written, byte for byte */
inline equal_moc_imbalance_message(moc_imbalance_message_read, moc_imbalance_message_written) {
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 12 -> assert(moc_imbalance_message_read.symbol[moc_imbalance_message_at] == moc_imbalance_message_written.symbol[moc_imbalance_message_at]); moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  assert(moc_imbalance_message_read.imbalance_side == moc_imbalance_message_written.imbalance_side);
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> assert(moc_imbalance_message_read.imbalance_volume[moc_imbalance_message_at] == moc_imbalance_message_written.imbalance_volume[moc_imbalance_message_at]); moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> assert(moc_imbalance_message_read.trading_system_time_stamp[moc_imbalance_message_at] == moc_imbalance_message_written.trading_system_time_stamp[moc_imbalance_message_at]); moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> assert(moc_imbalance_message_read.imbalance_reference_price[moc_imbalance_message_at] == moc_imbalance_message_written.imbalance_reference_price[moc_imbalance_message_at]); moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> assert(moc_imbalance_message_read.paired_volume[moc_imbalance_message_at] == moc_imbalance_message_written.paired_volume[moc_imbalance_message_at]); moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> assert(moc_imbalance_message_read.market_order_imbalance_volume[moc_imbalance_message_at] == moc_imbalance_message_written.market_order_imbalance_volume[moc_imbalance_message_at]); moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  assert(moc_imbalance_message_read.market_order_imbalance_side == moc_imbalance_message_written.market_order_imbalance_side);
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> assert(moc_imbalance_message_read.near_indicative_closing_price[moc_imbalance_message_at] == moc_imbalance_message_written.near_indicative_closing_price[moc_imbalance_message_at]); moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 8 -> assert(moc_imbalance_message_read.far_indicative_closing_price[moc_imbalance_message_at] == moc_imbalance_message_written.far_indicative_closing_price[moc_imbalance_message_at]); moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  moc_imbalance_message_at = 0;
  do
  :: moc_imbalance_message_at < 4 -> assert(moc_imbalance_message_read.price_variation[moc_imbalance_message_at] == moc_imbalance_message_written.price_variation[moc_imbalance_message_at]); moc_imbalance_message_at = moc_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Status Message: 84 bytes ------------------------------------------ */

typedef StockStatusMessage {
  byte symbol[12];
  byte comment[40];
  byte stock_state[2];
  byte trading_system_time_stamp[8];
  byte calculated_closing_price[8];
  byte vwap[8];
  byte resume_trade_time[4];
  byte listing_market;
  byte product_type
};

int stock_status_message_at;

/* every byte of Stock Status Message set to one value */
inline fill_stock_status_message(stock_status_message_record, stock_status_message_value) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 12 -> stock_status_message_record.symbol[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 40 -> stock_status_message_record.comment[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 2 -> stock_status_message_record.stock_state[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.trading_system_time_stamp[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.calculated_closing_price[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.vwap[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> stock_status_message_record.resume_trade_time[stock_status_message_at] = stock_status_message_value; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_record.listing_market = stock_status_message_value;
  stock_status_message_record.product_type = stock_status_message_value;
  skip
}

/* each byte of Stock Status Message set to where it lies, so a field read out of place says so */
inline ramp_stock_status_message(stock_status_message_record, stock_status_message_base) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 12 -> stock_status_message_record.symbol[stock_status_message_at] = (stock_status_message_base + 0 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 40 -> stock_status_message_record.comment[stock_status_message_at] = (stock_status_message_base + 12 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 2 -> stock_status_message_record.stock_state[stock_status_message_at] = (stock_status_message_base + 52 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.trading_system_time_stamp[stock_status_message_at] = (stock_status_message_base + 54 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.calculated_closing_price[stock_status_message_at] = (stock_status_message_base + 62 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.vwap[stock_status_message_at] = (stock_status_message_base + 70 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> stock_status_message_record.resume_trade_time[stock_status_message_at] = (stock_status_message_base + 78 + stock_status_message_at + 1) % 256; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_record.listing_market = (stock_status_message_base + 82 + 1) % 256;
  stock_status_message_record.product_type = (stock_status_message_base + 83 + 1) % 256;
  skip
}

/* Stock Status Message to the wire, 84 bytes from where the cursor stands */
inline encode_stock_status_message(stock_status_message_record) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 12 -> wire[at] = stock_status_message_record.symbol[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 40 -> wire[at] = stock_status_message_record.comment[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 2 -> wire[at] = stock_status_message_record.stock_state[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> wire[at] = stock_status_message_record.trading_system_time_stamp[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> wire[at] = stock_status_message_record.calculated_closing_price[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> wire[at] = stock_status_message_record.vwap[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> wire[at] = stock_status_message_record.resume_trade_time[stock_status_message_at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_status_message_record.listing_market; at = at + 1;
  wire[at] = stock_status_message_record.product_type; at = at + 1;
  skip
}

/* Stock Status Message off the wire, 84 bytes from where the cursor stands */
inline decode_stock_status_message(stock_status_message_record) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 12 -> stock_status_message_record.symbol[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 40 -> stock_status_message_record.comment[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 2 -> stock_status_message_record.stock_state[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.trading_system_time_stamp[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.calculated_closing_price[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> stock_status_message_record.vwap[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> stock_status_message_record.resume_trade_time[stock_status_message_at] = wire[at]; at = at + 1; stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_record.listing_market = wire[at]; at = at + 1;
  stock_status_message_record.product_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock Status Message is what was written, byte for byte */
inline equal_stock_status_message(stock_status_message_read, stock_status_message_written) {
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 12 -> assert(stock_status_message_read.symbol[stock_status_message_at] == stock_status_message_written.symbol[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 40 -> assert(stock_status_message_read.comment[stock_status_message_at] == stock_status_message_written.comment[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 2 -> assert(stock_status_message_read.stock_state[stock_status_message_at] == stock_status_message_written.stock_state[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> assert(stock_status_message_read.trading_system_time_stamp[stock_status_message_at] == stock_status_message_written.trading_system_time_stamp[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> assert(stock_status_message_read.calculated_closing_price[stock_status_message_at] == stock_status_message_written.calculated_closing_price[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 8 -> assert(stock_status_message_read.vwap[stock_status_message_at] == stock_status_message_written.vwap[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  stock_status_message_at = 0;
  do
  :: stock_status_message_at < 4 -> assert(stock_status_message_read.resume_trade_time[stock_status_message_at] == stock_status_message_written.resume_trade_time[stock_status_message_at]); stock_status_message_at = stock_status_message_at + 1
  :: else -> break
  od;
  assert(stock_status_message_read.listing_market == stock_status_message_written.listing_market);
  assert(stock_status_message_read.product_type == stock_status_message_written.product_type);
  skip
}

/* ---- Quote Message: 44 bytes ------------------------------------------------- */

typedef QuoteMessage {
  byte symbol[12];
  byte bid_price[8];
  byte bid_size[4];
  byte ask_price[8];
  byte ask_size[4];
  byte trading_system_time_stamp[8]
};

int quote_message_at;

/* every byte of Quote Message set to one value */
inline fill_quote_message(quote_message_record, quote_message_value) {
  quote_message_at = 0;
  do
  :: quote_message_at < 12 -> quote_message_record.symbol[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.bid_price[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.bid_size[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.ask_price[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.ask_size[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.trading_system_time_stamp[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Message set to where it lies, so a field read out of place says so */
inline ramp_quote_message(quote_message_record, quote_message_base) {
  quote_message_at = 0;
  do
  :: quote_message_at < 12 -> quote_message_record.symbol[quote_message_at] = (quote_message_base + 0 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.bid_price[quote_message_at] = (quote_message_base + 12 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.bid_size[quote_message_at] = (quote_message_base + 20 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.ask_price[quote_message_at] = (quote_message_base + 24 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.ask_size[quote_message_at] = (quote_message_base + 32 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.trading_system_time_stamp[quote_message_at] = (quote_message_base + 36 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Message to the wire, 44 bytes from where the cursor stands */
inline encode_quote_message(quote_message_record) {
  quote_message_at = 0;
  do
  :: quote_message_at < 12 -> wire[at] = quote_message_record.symbol[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> wire[at] = quote_message_record.bid_price[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> wire[at] = quote_message_record.bid_size[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> wire[at] = quote_message_record.ask_price[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> wire[at] = quote_message_record.ask_size[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> wire[at] = quote_message_record.trading_system_time_stamp[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Message off the wire, 44 bytes from where the cursor stands */
inline decode_quote_message(quote_message_record) {
  quote_message_at = 0;
  do
  :: quote_message_at < 12 -> quote_message_record.symbol[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.bid_price[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.bid_size[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.ask_price[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.ask_size[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> quote_message_record.trading_system_time_stamp[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Message is what was written, byte for byte */
inline equal_quote_message(quote_message_read, quote_message_written) {
  quote_message_at = 0;
  do
  :: quote_message_at < 12 -> assert(quote_message_read.symbol[quote_message_at] == quote_message_written.symbol[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> assert(quote_message_read.bid_price[quote_message_at] == quote_message_written.bid_price[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> assert(quote_message_read.bid_size[quote_message_at] == quote_message_written.bid_size[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> assert(quote_message_read.ask_price[quote_message_at] == quote_message_written.ask_price[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> assert(quote_message_read.ask_size[quote_message_at] == quote_message_written.ask_size[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 8 -> assert(quote_message_read.trading_system_time_stamp[quote_message_at] == quote_message_written.trading_system_time_stamp[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Frame Header: encoded, read back, and compared */
proctype check_frame_header() {
  FrameHeader frame_header_sent;
  FrameHeader frame_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_frame_header(frame_header_sent, 0)
  :: pattern == 1 -> fill_frame_header(frame_header_sent, 32)
  :: pattern == 2 -> fill_frame_header(frame_header_sent, 255)
  :: else -> ramp_frame_header(frame_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_frame_header(frame_header_sent);
    assert(at == 11);
    at = 0;
    decode_frame_header(frame_header_got);
    assert(at == 11);
    equal_frame_header(frame_header_got, frame_header_sent)
  }
}

/* Body Header: encoded, read back, and compared */
proctype check_body_header() {
  BodyHeader body_header_sent;
  BodyHeader body_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_body_header(body_header_sent, 0)
  :: pattern == 1 -> fill_body_header(body_header_sent, 32)
  :: pattern == 2 -> fill_body_header(body_header_sent, 255)
  :: else -> ramp_body_header(body_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_body_header(body_header_sent);
    assert(at == 3);
    at = 0;
    decode_body_header(body_header_got);
    assert(at == 3);
    equal_body_header(body_header_got, body_header_sent)
  }
}

/* Business Header: encoded, read back, and compared */
proctype check_business_header() {
  BusinessHeader business_header_sent;
  BusinessHeader business_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_business_header(business_header_sent, 0)
  :: pattern == 1 -> fill_business_header(business_header_sent, 32)
  :: pattern == 2 -> fill_business_header(business_header_sent, 255)
  :: else -> ramp_business_header(business_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_business_header(business_header_sent);
    assert(at == 9);
    at = 0;
    decode_business_header(business_header_got);
    assert(at == 9);
    equal_business_header(business_header_got, business_header_sent)
  }
}

/* Symbol Status Message: encoded, read back, and compared */
proctype check_symbol_status_message() {
  SymbolStatusMessage symbol_status_message_sent;
  SymbolStatusMessage symbol_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_status_message(symbol_status_message_sent, 0)
  :: pattern == 1 -> fill_symbol_status_message(symbol_status_message_sent, 32)
  :: pattern == 2 -> fill_symbol_status_message(symbol_status_message_sent, 255)
  :: else -> ramp_symbol_status_message(symbol_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_status_message(symbol_status_message_sent);
    assert(at == 66);
    at = 0;
    decode_symbol_status_message(symbol_status_message_got);
    assert(at == 66);
    equal_symbol_status_message(symbol_status_message_got, symbol_status_message_sent)
  }
}

/* Trade Report Message: encoded, read back, and compared */
proctype check_trade_report_message() {
  TradeReportMessage trade_report_message_sent;
  TradeReportMessage trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_report_message(trade_report_message_sent, 0)
  :: pattern == 1 -> fill_trade_report_message(trade_report_message_sent, 32)
  :: pattern == 2 -> fill_trade_report_message(trade_report_message_sent, 255)
  :: else -> ramp_trade_report_message(trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_report_message(trade_report_message_sent);
    assert(at == 65);
    at = 0;
    decode_trade_report_message(trade_report_message_got);
    assert(at == 65);
    equal_trade_report_message(trade_report_message_got, trade_report_message_sent)
  }
}

/* Trade Cancelled Message: encoded, read back, and compared */
proctype check_trade_cancelled_message() {
  TradeCancelledMessage trade_cancelled_message_sent;
  TradeCancelledMessage trade_cancelled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancelled_message(trade_cancelled_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancelled_message(trade_cancelled_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancelled_message(trade_cancelled_message_sent, 255)
  :: else -> ramp_trade_cancelled_message(trade_cancelled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancelled_message(trade_cancelled_message_sent);
    assert(at == 58);
    at = 0;
    decode_trade_cancelled_message(trade_cancelled_message_got);
    assert(at == 58);
    equal_trade_cancelled_message(trade_cancelled_message_got, trade_cancelled_message_sent)
  }
}

/* Moc Imbalance Message: encoded, read back, and compared */
proctype check_moc_imbalance_message() {
  MocImbalanceMessage moc_imbalance_message_sent;
  MocImbalanceMessage moc_imbalance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_moc_imbalance_message(moc_imbalance_message_sent, 0)
  :: pattern == 1 -> fill_moc_imbalance_message(moc_imbalance_message_sent, 32)
  :: pattern == 2 -> fill_moc_imbalance_message(moc_imbalance_message_sent, 255)
  :: else -> ramp_moc_imbalance_message(moc_imbalance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_moc_imbalance_message(moc_imbalance_message_sent);
    assert(at == 62);
    at = 0;
    decode_moc_imbalance_message(moc_imbalance_message_got);
    assert(at == 62);
    equal_moc_imbalance_message(moc_imbalance_message_got, moc_imbalance_message_sent)
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
    assert(at == 84);
    at = 0;
    decode_stock_status_message(stock_status_message_got);
    assert(at == 84);
    equal_stock_status_message(stock_status_message_got, stock_status_message_sent)
  }
}

/* Quote Message: encoded, read back, and compared */
proctype check_quote_message() {
  QuoteMessage quote_message_sent;
  QuoteMessage quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_message(quote_message_sent, 0)
  :: pattern == 1 -> fill_quote_message(quote_message_sent, 32)
  :: pattern == 2 -> fill_quote_message(quote_message_sent, 255)
  :: else -> ramp_quote_message(quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_message(quote_message_sent);
    assert(at == 44);
    at = 0;
    decode_quote_message(quote_message_got);
    assert(at == 44);
    equal_quote_message(quote_message_got, quote_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_frame_header()
  :: run check_body_header()
  :: run check_business_header()
  :: run check_symbol_status_message()
  :: run check_trade_report_message()
  :: run check_trade_cancelled_message()
  :: run check_moc_imbalance_message()
  :: run check_stock_status_message()
  :: run check_quote_message()
  fi
}
