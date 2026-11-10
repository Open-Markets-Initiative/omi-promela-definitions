/*
 * TMX Group Quantum Feed Level 2
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
#define WIRE 74

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

/* ---- Symbol Status Message: 53 bytes ----------------------------------------- */

typedef SymbolStatusMessage {
  byte symbol[12];
  byte stock_group;
  byte listing_market;
  byte product_type;
  byte cusip[12];
  byte board_lot[2];
  byte currency;
  byte face_value[8];
  byte last_sale[8];
  byte min_po_qty[4];
  byte stock_state[2];
  byte test_symbol
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
  symbol_status_message_record.listing_market = symbol_status_message_value;
  symbol_status_message_record.product_type = symbol_status_message_value;
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
  :: symbol_status_message_at < 8 -> symbol_status_message_record.last_sale[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.min_po_qty[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_state[symbol_status_message_at] = symbol_status_message_value; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.test_symbol = symbol_status_message_value;
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
  symbol_status_message_record.listing_market = (symbol_status_message_base + 13 + 1) % 256;
  symbol_status_message_record.product_type = (symbol_status_message_base + 14 + 1) % 256;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.cusip[symbol_status_message_at] = (symbol_status_message_base + 15 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.board_lot[symbol_status_message_at] = (symbol_status_message_base + 27 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.currency = (symbol_status_message_base + 29 + 1) % 256;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 8 -> symbol_status_message_record.face_value[symbol_status_message_at] = (symbol_status_message_base + 30 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 8 -> symbol_status_message_record.last_sale[symbol_status_message_at] = (symbol_status_message_base + 38 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.min_po_qty[symbol_status_message_at] = (symbol_status_message_base + 46 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_state[symbol_status_message_at] = (symbol_status_message_base + 50 + symbol_status_message_at + 1) % 256; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.test_symbol = (symbol_status_message_base + 52 + 1) % 256;
  skip
}

/* Symbol Status Message to the wire, 53 bytes from where the cursor stands */
inline encode_symbol_status_message(symbol_status_message_record) {
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> wire[at] = symbol_status_message_record.symbol[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_status_message_record.stock_group; at = at + 1;
  wire[at] = symbol_status_message_record.listing_market; at = at + 1;
  wire[at] = symbol_status_message_record.product_type; at = at + 1;
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
  :: symbol_status_message_at < 8 -> wire[at] = symbol_status_message_record.last_sale[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> wire[at] = symbol_status_message_record.min_po_qty[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> wire[at] = symbol_status_message_record.stock_state[symbol_status_message_at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_status_message_record.test_symbol; at = at + 1;
  skip
}

/* Symbol Status Message off the wire, 53 bytes from where the cursor stands */
inline decode_symbol_status_message(symbol_status_message_record) {
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 12 -> symbol_status_message_record.symbol[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.stock_group = wire[at]; at = at + 1;
  symbol_status_message_record.listing_market = wire[at]; at = at + 1;
  symbol_status_message_record.product_type = wire[at]; at = at + 1;
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
  :: symbol_status_message_at < 8 -> symbol_status_message_record.last_sale[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> symbol_status_message_record.min_po_qty[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> symbol_status_message_record.stock_state[symbol_status_message_at] = wire[at]; at = at + 1; symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_record.test_symbol = wire[at]; at = at + 1;
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
  assert(symbol_status_message_read.listing_market == symbol_status_message_written.listing_market);
  assert(symbol_status_message_read.product_type == symbol_status_message_written.product_type);
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
  :: symbol_status_message_at < 8 -> assert(symbol_status_message_read.last_sale[symbol_status_message_at] == symbol_status_message_written.last_sale[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 4 -> assert(symbol_status_message_read.min_po_qty[symbol_status_message_at] == symbol_status_message_written.min_po_qty[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  symbol_status_message_at = 0;
  do
  :: symbol_status_message_at < 2 -> assert(symbol_status_message_read.stock_state[symbol_status_message_at] == symbol_status_message_written.stock_state[symbol_status_message_at]); symbol_status_message_at = symbol_status_message_at + 1
  :: else -> break
  od;
  assert(symbol_status_message_read.test_symbol == symbol_status_message_written.test_symbol);
  skip
}

/* ---- Order Book Message: 43 bytes -------------------------------------------- */

typedef OrderBookMessage {
  byte symbol[12];
  byte broker_number[2];
  byte order_side;
  byte order_id[8];
  byte price[8];
  byte volume[4];
  byte priority_time_stamp[8]
};

int order_book_message_at;

/* every byte of Order Book Message set to one value */
inline fill_order_book_message(order_book_message_record, order_book_message_value) {
  order_book_message_at = 0;
  do
  :: order_book_message_at < 12 -> order_book_message_record.symbol[order_book_message_at] = order_book_message_value; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 2 -> order_book_message_record.broker_number[order_book_message_at] = order_book_message_value; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_record.order_side = order_book_message_value;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> order_book_message_record.order_id[order_book_message_at] = order_book_message_value; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> order_book_message_record.price[order_book_message_at] = order_book_message_value; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 4 -> order_book_message_record.volume[order_book_message_at] = order_book_message_value; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> order_book_message_record.priority_time_stamp[order_book_message_at] = order_book_message_value; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Book Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_message(order_book_message_record, order_book_message_base) {
  order_book_message_at = 0;
  do
  :: order_book_message_at < 12 -> order_book_message_record.symbol[order_book_message_at] = (order_book_message_base + 0 + order_book_message_at + 1) % 256; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 2 -> order_book_message_record.broker_number[order_book_message_at] = (order_book_message_base + 12 + order_book_message_at + 1) % 256; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_record.order_side = (order_book_message_base + 14 + 1) % 256;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> order_book_message_record.order_id[order_book_message_at] = (order_book_message_base + 15 + order_book_message_at + 1) % 256; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> order_book_message_record.price[order_book_message_at] = (order_book_message_base + 23 + order_book_message_at + 1) % 256; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 4 -> order_book_message_record.volume[order_book_message_at] = (order_book_message_base + 31 + order_book_message_at + 1) % 256; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> order_book_message_record.priority_time_stamp[order_book_message_at] = (order_book_message_base + 35 + order_book_message_at + 1) % 256; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Message to the wire, 43 bytes from where the cursor stands */
inline encode_order_book_message(order_book_message_record) {
  order_book_message_at = 0;
  do
  :: order_book_message_at < 12 -> wire[at] = order_book_message_record.symbol[order_book_message_at]; at = at + 1; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 2 -> wire[at] = order_book_message_record.broker_number[order_book_message_at]; at = at + 1; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_message_record.order_side; at = at + 1;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> wire[at] = order_book_message_record.order_id[order_book_message_at]; at = at + 1; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> wire[at] = order_book_message_record.price[order_book_message_at]; at = at + 1; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 4 -> wire[at] = order_book_message_record.volume[order_book_message_at]; at = at + 1; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> wire[at] = order_book_message_record.priority_time_stamp[order_book_message_at]; at = at + 1; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Message off the wire, 43 bytes from where the cursor stands */
inline decode_order_book_message(order_book_message_record) {
  order_book_message_at = 0;
  do
  :: order_book_message_at < 12 -> order_book_message_record.symbol[order_book_message_at] = wire[at]; at = at + 1; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 2 -> order_book_message_record.broker_number[order_book_message_at] = wire[at]; at = at + 1; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_record.order_side = wire[at]; at = at + 1;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> order_book_message_record.order_id[order_book_message_at] = wire[at]; at = at + 1; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> order_book_message_record.price[order_book_message_at] = wire[at]; at = at + 1; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 4 -> order_book_message_record.volume[order_book_message_at] = wire[at]; at = at + 1; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> order_book_message_record.priority_time_stamp[order_book_message_at] = wire[at]; at = at + 1; order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Book Message is what was written, byte for byte */
inline equal_order_book_message(order_book_message_read, order_book_message_written) {
  order_book_message_at = 0;
  do
  :: order_book_message_at < 12 -> assert(order_book_message_read.symbol[order_book_message_at] == order_book_message_written.symbol[order_book_message_at]); order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 2 -> assert(order_book_message_read.broker_number[order_book_message_at] == order_book_message_written.broker_number[order_book_message_at]); order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  assert(order_book_message_read.order_side == order_book_message_written.order_side);
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> assert(order_book_message_read.order_id[order_book_message_at] == order_book_message_written.order_id[order_book_message_at]); order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> assert(order_book_message_read.price[order_book_message_at] == order_book_message_written.price[order_book_message_at]); order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 4 -> assert(order_book_message_read.volume[order_book_message_at] == order_book_message_written.volume[order_book_message_at]); order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  order_book_message_at = 0;
  do
  :: order_book_message_at < 8 -> assert(order_book_message_read.priority_time_stamp[order_book_message_at] == order_book_message_written.priority_time_stamp[order_book_message_at]); order_book_message_at = order_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market State Update Message: 10 bytes ----------------------------------- */

typedef MarketStateUpdateMessage {
  byte market_state;
  byte stock_group;
  byte trading_system_time_stamp[8]
};

int market_state_update_message_at;

/* every byte of Market State Update Message set to one value */
inline fill_market_state_update_message(market_state_update_message_record, market_state_update_message_value) {
  market_state_update_message_record.market_state = market_state_update_message_value;
  market_state_update_message_record.stock_group = market_state_update_message_value;
  market_state_update_message_at = 0;
  do
  :: market_state_update_message_at < 8 -> market_state_update_message_record.trading_system_time_stamp[market_state_update_message_at] = market_state_update_message_value; market_state_update_message_at = market_state_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market State Update Message set to where it lies, so a field read out of place says so */
inline ramp_market_state_update_message(market_state_update_message_record, market_state_update_message_base) {
  market_state_update_message_record.market_state = (market_state_update_message_base + 0 + 1) % 256;
  market_state_update_message_record.stock_group = (market_state_update_message_base + 1 + 1) % 256;
  market_state_update_message_at = 0;
  do
  :: market_state_update_message_at < 8 -> market_state_update_message_record.trading_system_time_stamp[market_state_update_message_at] = (market_state_update_message_base + 2 + market_state_update_message_at + 1) % 256; market_state_update_message_at = market_state_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market State Update Message to the wire, 10 bytes from where the cursor stands */
inline encode_market_state_update_message(market_state_update_message_record) {
  wire[at] = market_state_update_message_record.market_state; at = at + 1;
  wire[at] = market_state_update_message_record.stock_group; at = at + 1;
  market_state_update_message_at = 0;
  do
  :: market_state_update_message_at < 8 -> wire[at] = market_state_update_message_record.trading_system_time_stamp[market_state_update_message_at]; at = at + 1; market_state_update_message_at = market_state_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market State Update Message off the wire, 10 bytes from where the cursor stands */
inline decode_market_state_update_message(market_state_update_message_record) {
  market_state_update_message_record.market_state = wire[at]; at = at + 1;
  market_state_update_message_record.stock_group = wire[at]; at = at + 1;
  market_state_update_message_at = 0;
  do
  :: market_state_update_message_at < 8 -> market_state_update_message_record.trading_system_time_stamp[market_state_update_message_at] = wire[at]; at = at + 1; market_state_update_message_at = market_state_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market State Update Message is what was written, byte for byte */
inline equal_market_state_update_message(market_state_update_message_read, market_state_update_message_written) {
  assert(market_state_update_message_read.market_state == market_state_update_message_written.market_state);
  assert(market_state_update_message_read.stock_group == market_state_update_message_written.stock_group);
  market_state_update_message_at = 0;
  do
  :: market_state_update_message_at < 8 -> assert(market_state_update_message_read.trading_system_time_stamp[market_state_update_message_at] == market_state_update_message_written.trading_system_time_stamp[market_state_update_message_at]); market_state_update_message_at = market_state_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Booked Message: 51 bytes ------------------------------------------ */

typedef OrderBookedMessage {
  byte symbol[12];
  byte broker_number[2];
  byte order_side;
  byte order_id[8];
  byte price[8];
  byte volume[4];
  byte priority_time_stamp[8];
  byte trading_system_time_stamp[8]
};

int order_booked_message_at;

/* every byte of Order Booked Message set to one value */
inline fill_order_booked_message(order_booked_message_record, order_booked_message_value) {
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 12 -> order_booked_message_record.symbol[order_booked_message_at] = order_booked_message_value; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 2 -> order_booked_message_record.broker_number[order_booked_message_at] = order_booked_message_value; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_record.order_side = order_booked_message_value;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> order_booked_message_record.order_id[order_booked_message_at] = order_booked_message_value; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> order_booked_message_record.price[order_booked_message_at] = order_booked_message_value; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 4 -> order_booked_message_record.volume[order_booked_message_at] = order_booked_message_value; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> order_booked_message_record.priority_time_stamp[order_booked_message_at] = order_booked_message_value; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> order_booked_message_record.trading_system_time_stamp[order_booked_message_at] = order_booked_message_value; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Booked Message set to where it lies, so a field read out of place says so */
inline ramp_order_booked_message(order_booked_message_record, order_booked_message_base) {
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 12 -> order_booked_message_record.symbol[order_booked_message_at] = (order_booked_message_base + 0 + order_booked_message_at + 1) % 256; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 2 -> order_booked_message_record.broker_number[order_booked_message_at] = (order_booked_message_base + 12 + order_booked_message_at + 1) % 256; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_record.order_side = (order_booked_message_base + 14 + 1) % 256;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> order_booked_message_record.order_id[order_booked_message_at] = (order_booked_message_base + 15 + order_booked_message_at + 1) % 256; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> order_booked_message_record.price[order_booked_message_at] = (order_booked_message_base + 23 + order_booked_message_at + 1) % 256; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 4 -> order_booked_message_record.volume[order_booked_message_at] = (order_booked_message_base + 31 + order_booked_message_at + 1) % 256; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> order_booked_message_record.priority_time_stamp[order_booked_message_at] = (order_booked_message_base + 35 + order_booked_message_at + 1) % 256; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> order_booked_message_record.trading_system_time_stamp[order_booked_message_at] = (order_booked_message_base + 43 + order_booked_message_at + 1) % 256; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Booked Message to the wire, 51 bytes from where the cursor stands */
inline encode_order_booked_message(order_booked_message_record) {
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 12 -> wire[at] = order_booked_message_record.symbol[order_booked_message_at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 2 -> wire[at] = order_booked_message_record.broker_number[order_booked_message_at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  wire[at] = order_booked_message_record.order_side; at = at + 1;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> wire[at] = order_booked_message_record.order_id[order_booked_message_at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> wire[at] = order_booked_message_record.price[order_booked_message_at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 4 -> wire[at] = order_booked_message_record.volume[order_booked_message_at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> wire[at] = order_booked_message_record.priority_time_stamp[order_booked_message_at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> wire[at] = order_booked_message_record.trading_system_time_stamp[order_booked_message_at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Booked Message off the wire, 51 bytes from where the cursor stands */
inline decode_order_booked_message(order_booked_message_record) {
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 12 -> order_booked_message_record.symbol[order_booked_message_at] = wire[at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 2 -> order_booked_message_record.broker_number[order_booked_message_at] = wire[at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_record.order_side = wire[at]; at = at + 1;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> order_booked_message_record.order_id[order_booked_message_at] = wire[at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> order_booked_message_record.price[order_booked_message_at] = wire[at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 4 -> order_booked_message_record.volume[order_booked_message_at] = wire[at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> order_booked_message_record.priority_time_stamp[order_booked_message_at] = wire[at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> order_booked_message_record.trading_system_time_stamp[order_booked_message_at] = wire[at]; at = at + 1; order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Booked Message is what was written, byte for byte */
inline equal_order_booked_message(order_booked_message_read, order_booked_message_written) {
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 12 -> assert(order_booked_message_read.symbol[order_booked_message_at] == order_booked_message_written.symbol[order_booked_message_at]); order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 2 -> assert(order_booked_message_read.broker_number[order_booked_message_at] == order_booked_message_written.broker_number[order_booked_message_at]); order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  assert(order_booked_message_read.order_side == order_booked_message_written.order_side);
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> assert(order_booked_message_read.order_id[order_booked_message_at] == order_booked_message_written.order_id[order_booked_message_at]); order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> assert(order_booked_message_read.price[order_booked_message_at] == order_booked_message_written.price[order_booked_message_at]); order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 4 -> assert(order_booked_message_read.volume[order_booked_message_at] == order_booked_message_written.volume[order_booked_message_at]); order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> assert(order_booked_message_read.priority_time_stamp[order_booked_message_at] == order_booked_message_written.priority_time_stamp[order_booked_message_at]); order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  order_booked_message_at = 0;
  do
  :: order_booked_message_at < 8 -> assert(order_booked_message_read.trading_system_time_stamp[order_booked_message_at] == order_booked_message_written.trading_system_time_stamp[order_booked_message_at]); order_booked_message_at = order_booked_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancelled Message: 31 bytes --------------------------------------- */

typedef OrderCancelledMessage {
  byte symbol[12];
  byte broker_number[2];
  byte order_side;
  byte order_id[8];
  byte trading_system_time_stamp[8]
};

int order_cancelled_message_at;

/* every byte of Order Cancelled Message set to one value */
inline fill_order_cancelled_message(order_cancelled_message_record, order_cancelled_message_value) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 12 -> order_cancelled_message_record.symbol[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 2 -> order_cancelled_message_record.broker_number[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_record.order_side = order_cancelled_message_value;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.order_id[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.trading_system_time_stamp[order_cancelled_message_at] = order_cancelled_message_value; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancelled Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancelled_message(order_cancelled_message_record, order_cancelled_message_base) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 12 -> order_cancelled_message_record.symbol[order_cancelled_message_at] = (order_cancelled_message_base + 0 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 2 -> order_cancelled_message_record.broker_number[order_cancelled_message_at] = (order_cancelled_message_base + 12 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_record.order_side = (order_cancelled_message_base + 14 + 1) % 256;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.order_id[order_cancelled_message_at] = (order_cancelled_message_base + 15 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.trading_system_time_stamp[order_cancelled_message_at] = (order_cancelled_message_base + 23 + order_cancelled_message_at + 1) % 256; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancelled Message to the wire, 31 bytes from where the cursor stands */
inline encode_order_cancelled_message(order_cancelled_message_record) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 12 -> wire[at] = order_cancelled_message_record.symbol[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 2 -> wire[at] = order_cancelled_message_record.broker_number[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancelled_message_record.order_side; at = at + 1;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> wire[at] = order_cancelled_message_record.order_id[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> wire[at] = order_cancelled_message_record.trading_system_time_stamp[order_cancelled_message_at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancelled Message off the wire, 31 bytes from where the cursor stands */
inline decode_order_cancelled_message(order_cancelled_message_record) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 12 -> order_cancelled_message_record.symbol[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 2 -> order_cancelled_message_record.broker_number[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_record.order_side = wire[at]; at = at + 1;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.order_id[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> order_cancelled_message_record.trading_system_time_stamp[order_cancelled_message_at] = wire[at]; at = at + 1; order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancelled Message is what was written, byte for byte */
inline equal_order_cancelled_message(order_cancelled_message_read, order_cancelled_message_written) {
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 12 -> assert(order_cancelled_message_read.symbol[order_cancelled_message_at] == order_cancelled_message_written.symbol[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 2 -> assert(order_cancelled_message_read.broker_number[order_cancelled_message_at] == order_cancelled_message_written.broker_number[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  assert(order_cancelled_message_read.order_side == order_cancelled_message_written.order_side);
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> assert(order_cancelled_message_read.order_id[order_cancelled_message_at] == order_cancelled_message_written.order_id[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  order_cancelled_message_at = 0;
  do
  :: order_cancelled_message_at < 8 -> assert(order_cancelled_message_read.trading_system_time_stamp[order_cancelled_message_at] == order_cancelled_message_written.trading_system_time_stamp[order_cancelled_message_at]); order_cancelled_message_at = order_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Price Time Assigned Message: 51 bytes ----------------------------- */

typedef OrderPriceTimeAssignedMessage {
  byte symbol[12];
  byte broker_number[2];
  byte order_side;
  byte order_id[8];
  byte price[8];
  byte volume[4];
  byte priority_time_stamp[8];
  byte trading_system_time_stamp[8]
};

int order_price_time_assigned_message_at;

/* every byte of Order Price Time Assigned Message set to one value */
inline fill_order_price_time_assigned_message(order_price_time_assigned_message_record, order_price_time_assigned_message_value) {
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 12 -> order_price_time_assigned_message_record.symbol[order_price_time_assigned_message_at] = order_price_time_assigned_message_value; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 2 -> order_price_time_assigned_message_record.broker_number[order_price_time_assigned_message_at] = order_price_time_assigned_message_value; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_record.order_side = order_price_time_assigned_message_value;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> order_price_time_assigned_message_record.order_id[order_price_time_assigned_message_at] = order_price_time_assigned_message_value; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> order_price_time_assigned_message_record.price[order_price_time_assigned_message_at] = order_price_time_assigned_message_value; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 4 -> order_price_time_assigned_message_record.volume[order_price_time_assigned_message_at] = order_price_time_assigned_message_value; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> order_price_time_assigned_message_record.priority_time_stamp[order_price_time_assigned_message_at] = order_price_time_assigned_message_value; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> order_price_time_assigned_message_record.trading_system_time_stamp[order_price_time_assigned_message_at] = order_price_time_assigned_message_value; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Price Time Assigned Message set to where it lies, so a field read out of place says so */
inline ramp_order_price_time_assigned_message(order_price_time_assigned_message_record, order_price_time_assigned_message_base) {
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 12 -> order_price_time_assigned_message_record.symbol[order_price_time_assigned_message_at] = (order_price_time_assigned_message_base + 0 + order_price_time_assigned_message_at + 1) % 256; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 2 -> order_price_time_assigned_message_record.broker_number[order_price_time_assigned_message_at] = (order_price_time_assigned_message_base + 12 + order_price_time_assigned_message_at + 1) % 256; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_record.order_side = (order_price_time_assigned_message_base + 14 + 1) % 256;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> order_price_time_assigned_message_record.order_id[order_price_time_assigned_message_at] = (order_price_time_assigned_message_base + 15 + order_price_time_assigned_message_at + 1) % 256; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> order_price_time_assigned_message_record.price[order_price_time_assigned_message_at] = (order_price_time_assigned_message_base + 23 + order_price_time_assigned_message_at + 1) % 256; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 4 -> order_price_time_assigned_message_record.volume[order_price_time_assigned_message_at] = (order_price_time_assigned_message_base + 31 + order_price_time_assigned_message_at + 1) % 256; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> order_price_time_assigned_message_record.priority_time_stamp[order_price_time_assigned_message_at] = (order_price_time_assigned_message_base + 35 + order_price_time_assigned_message_at + 1) % 256; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> order_price_time_assigned_message_record.trading_system_time_stamp[order_price_time_assigned_message_at] = (order_price_time_assigned_message_base + 43 + order_price_time_assigned_message_at + 1) % 256; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Price Time Assigned Message to the wire, 51 bytes from where the cursor stands */
inline encode_order_price_time_assigned_message(order_price_time_assigned_message_record) {
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 12 -> wire[at] = order_price_time_assigned_message_record.symbol[order_price_time_assigned_message_at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 2 -> wire[at] = order_price_time_assigned_message_record.broker_number[order_price_time_assigned_message_at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  wire[at] = order_price_time_assigned_message_record.order_side; at = at + 1;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> wire[at] = order_price_time_assigned_message_record.order_id[order_price_time_assigned_message_at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> wire[at] = order_price_time_assigned_message_record.price[order_price_time_assigned_message_at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 4 -> wire[at] = order_price_time_assigned_message_record.volume[order_price_time_assigned_message_at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> wire[at] = order_price_time_assigned_message_record.priority_time_stamp[order_price_time_assigned_message_at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> wire[at] = order_price_time_assigned_message_record.trading_system_time_stamp[order_price_time_assigned_message_at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Price Time Assigned Message off the wire, 51 bytes from where the cursor stands */
inline decode_order_price_time_assigned_message(order_price_time_assigned_message_record) {
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 12 -> order_price_time_assigned_message_record.symbol[order_price_time_assigned_message_at] = wire[at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 2 -> order_price_time_assigned_message_record.broker_number[order_price_time_assigned_message_at] = wire[at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_record.order_side = wire[at]; at = at + 1;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> order_price_time_assigned_message_record.order_id[order_price_time_assigned_message_at] = wire[at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> order_price_time_assigned_message_record.price[order_price_time_assigned_message_at] = wire[at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 4 -> order_price_time_assigned_message_record.volume[order_price_time_assigned_message_at] = wire[at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> order_price_time_assigned_message_record.priority_time_stamp[order_price_time_assigned_message_at] = wire[at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> order_price_time_assigned_message_record.trading_system_time_stamp[order_price_time_assigned_message_at] = wire[at]; at = at + 1; order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Price Time Assigned Message is what was written, byte for byte */
inline equal_order_price_time_assigned_message(order_price_time_assigned_message_read, order_price_time_assigned_message_written) {
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 12 -> assert(order_price_time_assigned_message_read.symbol[order_price_time_assigned_message_at] == order_price_time_assigned_message_written.symbol[order_price_time_assigned_message_at]); order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 2 -> assert(order_price_time_assigned_message_read.broker_number[order_price_time_assigned_message_at] == order_price_time_assigned_message_written.broker_number[order_price_time_assigned_message_at]); order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  assert(order_price_time_assigned_message_read.order_side == order_price_time_assigned_message_written.order_side);
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> assert(order_price_time_assigned_message_read.order_id[order_price_time_assigned_message_at] == order_price_time_assigned_message_written.order_id[order_price_time_assigned_message_at]); order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> assert(order_price_time_assigned_message_read.price[order_price_time_assigned_message_at] == order_price_time_assigned_message_written.price[order_price_time_assigned_message_at]); order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 4 -> assert(order_price_time_assigned_message_read.volume[order_price_time_assigned_message_at] == order_price_time_assigned_message_written.volume[order_price_time_assigned_message_at]); order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> assert(order_price_time_assigned_message_read.priority_time_stamp[order_price_time_assigned_message_at] == order_price_time_assigned_message_written.priority_time_stamp[order_price_time_assigned_message_at]); order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  order_price_time_assigned_message_at = 0;
  do
  :: order_price_time_assigned_message_at < 8 -> assert(order_price_time_assigned_message_read.trading_system_time_stamp[order_price_time_assigned_message_at] == order_price_time_assigned_message_written.trading_system_time_stamp[order_price_time_assigned_message_at]); order_price_time_assigned_message_at = order_price_time_assigned_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Status Message: 62 bytes ------------------------------------------ */

typedef StockStatusMessage {
  byte symbol[12];
  byte comment[40];
  byte stock_state[2];
  byte trading_system_time_stamp[8]
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
  skip
}

/* Stock Status Message to the wire, 62 bytes from where the cursor stands */
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
  skip
}

/* Stock Status Message off the wire, 62 bytes from where the cursor stands */
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
  skip
}

/* ---- Trade Report Message: 71 bytes ------------------------------------------ */

typedef TradeReportMessage {
  byte symbol[12];
  byte trade_number[4];
  byte price[8];
  byte volume[4];
  byte buy_broker_number[2];
  byte buy_order_id[8];
  byte buy_display_volume[4];
  byte sell_broker_number[2];
  byte sell_order_id[8];
  byte sell_display_volume[4];
  byte bypass;
  byte trade_time_stamp[4];
  byte cross_type;
  byte is_dark;
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
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_number[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
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
  :: trade_report_message_at < 8 -> trade_report_message_record.buy_order_id[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.buy_display_volume[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.sell_broker_number[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.sell_order_id[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.sell_display_volume[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.bypass = trade_report_message_value;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_time_stamp[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.cross_type = trade_report_message_value;
  trade_report_message_record.is_dark = trade_report_message_value;
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
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_number[trade_report_message_at] = (trade_report_message_base + 12 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.price[trade_report_message_at] = (trade_report_message_base + 16 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.volume[trade_report_message_at] = (trade_report_message_base + 24 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.buy_broker_number[trade_report_message_at] = (trade_report_message_base + 28 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.buy_order_id[trade_report_message_at] = (trade_report_message_base + 30 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.buy_display_volume[trade_report_message_at] = (trade_report_message_base + 38 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.sell_broker_number[trade_report_message_at] = (trade_report_message_base + 42 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.sell_order_id[trade_report_message_at] = (trade_report_message_base + 44 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.sell_display_volume[trade_report_message_at] = (trade_report_message_base + 52 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.bypass = (trade_report_message_base + 56 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_time_stamp[trade_report_message_at] = (trade_report_message_base + 57 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.cross_type = (trade_report_message_base + 61 + 1) % 256;
  trade_report_message_record.is_dark = (trade_report_message_base + 62 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trading_system_time_stamp[trade_report_message_at] = (trade_report_message_base + 63 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Message to the wire, 71 bytes from where the cursor stands */
inline encode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 12 -> wire[at] = trade_report_message_record.symbol[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.trade_number[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
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
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.buy_order_id[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.buy_display_volume[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> wire[at] = trade_report_message_record.sell_broker_number[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.sell_order_id[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.sell_display_volume[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_record.bypass; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.trade_time_stamp[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_record.cross_type; at = at + 1;
  wire[at] = trade_report_message_record.is_dark; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.trading_system_time_stamp[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Message off the wire, 71 bytes from where the cursor stands */
inline decode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 12 -> trade_report_message_record.symbol[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_number[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
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
  :: trade_report_message_at < 8 -> trade_report_message_record.buy_order_id[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.buy_display_volume[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.sell_broker_number[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.sell_order_id[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.sell_display_volume[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.bypass = wire[at]; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_time_stamp[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.cross_type = wire[at]; at = at + 1;
  trade_report_message_record.is_dark = wire[at]; at = at + 1;
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
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.trade_number[trade_report_message_at] == trade_report_message_written.trade_number[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
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
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.buy_order_id[trade_report_message_at] == trade_report_message_written.buy_order_id[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.buy_display_volume[trade_report_message_at] == trade_report_message_written.buy_display_volume[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> assert(trade_report_message_read.sell_broker_number[trade_report_message_at] == trade_report_message_written.sell_broker_number[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.sell_order_id[trade_report_message_at] == trade_report_message_written.sell_order_id[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.sell_display_volume[trade_report_message_at] == trade_report_message_written.sell_display_volume[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_read.bypass == trade_report_message_written.bypass);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.trade_time_stamp[trade_report_message_at] == trade_report_message_written.trade_time_stamp[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_read.cross_type == trade_report_message_written.cross_type);
  assert(trade_report_message_read.is_dark == trade_report_message_written.is_dark);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.trading_system_time_stamp[trade_report_message_at] == trade_report_message_written.trading_system_time_stamp[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Report Terms Message: 74 bytes ------------------------------------ */

typedef TradeReportTermsMessage {
  byte symbol[12];
  byte trade_number[4];
  byte price[8];
  byte volume[4];
  byte buy_broker_number[2];
  byte buy_order_id[8];
  byte buy_display_volume[4];
  byte sell_broker_number[2];
  byte sell_order_id[8];
  byte sell_display_volume[4];
  byte trade_time_stamp[4];
  byte settlement_terms;
  byte settlement_date[4];
  byte cross_type;
  byte trading_system_time_stamp[8]
};

int trade_report_terms_message_at;

/* every byte of Trade Report Terms Message set to one value */
inline fill_trade_report_terms_message(trade_report_terms_message_record, trade_report_terms_message_value) {
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 12 -> trade_report_terms_message_record.symbol[trade_report_terms_message_at] = trade_report_terms_message_value; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.trade_number[trade_report_terms_message_at] = trade_report_terms_message_value; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> trade_report_terms_message_record.price[trade_report_terms_message_at] = trade_report_terms_message_value; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.volume[trade_report_terms_message_at] = trade_report_terms_message_value; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 2 -> trade_report_terms_message_record.buy_broker_number[trade_report_terms_message_at] = trade_report_terms_message_value; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> trade_report_terms_message_record.buy_order_id[trade_report_terms_message_at] = trade_report_terms_message_value; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.buy_display_volume[trade_report_terms_message_at] = trade_report_terms_message_value; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 2 -> trade_report_terms_message_record.sell_broker_number[trade_report_terms_message_at] = trade_report_terms_message_value; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> trade_report_terms_message_record.sell_order_id[trade_report_terms_message_at] = trade_report_terms_message_value; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.sell_display_volume[trade_report_terms_message_at] = trade_report_terms_message_value; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.trade_time_stamp[trade_report_terms_message_at] = trade_report_terms_message_value; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_record.settlement_terms = trade_report_terms_message_value;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.settlement_date[trade_report_terms_message_at] = trade_report_terms_message_value; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_record.cross_type = trade_report_terms_message_value;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> trade_report_terms_message_record.trading_system_time_stamp[trade_report_terms_message_at] = trade_report_terms_message_value; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Report Terms Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_terms_message(trade_report_terms_message_record, trade_report_terms_message_base) {
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 12 -> trade_report_terms_message_record.symbol[trade_report_terms_message_at] = (trade_report_terms_message_base + 0 + trade_report_terms_message_at + 1) % 256; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.trade_number[trade_report_terms_message_at] = (trade_report_terms_message_base + 12 + trade_report_terms_message_at + 1) % 256; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> trade_report_terms_message_record.price[trade_report_terms_message_at] = (trade_report_terms_message_base + 16 + trade_report_terms_message_at + 1) % 256; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.volume[trade_report_terms_message_at] = (trade_report_terms_message_base + 24 + trade_report_terms_message_at + 1) % 256; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 2 -> trade_report_terms_message_record.buy_broker_number[trade_report_terms_message_at] = (trade_report_terms_message_base + 28 + trade_report_terms_message_at + 1) % 256; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> trade_report_terms_message_record.buy_order_id[trade_report_terms_message_at] = (trade_report_terms_message_base + 30 + trade_report_terms_message_at + 1) % 256; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.buy_display_volume[trade_report_terms_message_at] = (trade_report_terms_message_base + 38 + trade_report_terms_message_at + 1) % 256; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 2 -> trade_report_terms_message_record.sell_broker_number[trade_report_terms_message_at] = (trade_report_terms_message_base + 42 + trade_report_terms_message_at + 1) % 256; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> trade_report_terms_message_record.sell_order_id[trade_report_terms_message_at] = (trade_report_terms_message_base + 44 + trade_report_terms_message_at + 1) % 256; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.sell_display_volume[trade_report_terms_message_at] = (trade_report_terms_message_base + 52 + trade_report_terms_message_at + 1) % 256; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.trade_time_stamp[trade_report_terms_message_at] = (trade_report_terms_message_base + 56 + trade_report_terms_message_at + 1) % 256; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_record.settlement_terms = (trade_report_terms_message_base + 60 + 1) % 256;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.settlement_date[trade_report_terms_message_at] = (trade_report_terms_message_base + 61 + trade_report_terms_message_at + 1) % 256; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_record.cross_type = (trade_report_terms_message_base + 65 + 1) % 256;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> trade_report_terms_message_record.trading_system_time_stamp[trade_report_terms_message_at] = (trade_report_terms_message_base + 66 + trade_report_terms_message_at + 1) % 256; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Terms Message to the wire, 74 bytes from where the cursor stands */
inline encode_trade_report_terms_message(trade_report_terms_message_record) {
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 12 -> wire[at] = trade_report_terms_message_record.symbol[trade_report_terms_message_at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> wire[at] = trade_report_terms_message_record.trade_number[trade_report_terms_message_at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> wire[at] = trade_report_terms_message_record.price[trade_report_terms_message_at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> wire[at] = trade_report_terms_message_record.volume[trade_report_terms_message_at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 2 -> wire[at] = trade_report_terms_message_record.buy_broker_number[trade_report_terms_message_at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> wire[at] = trade_report_terms_message_record.buy_order_id[trade_report_terms_message_at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> wire[at] = trade_report_terms_message_record.buy_display_volume[trade_report_terms_message_at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 2 -> wire[at] = trade_report_terms_message_record.sell_broker_number[trade_report_terms_message_at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> wire[at] = trade_report_terms_message_record.sell_order_id[trade_report_terms_message_at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> wire[at] = trade_report_terms_message_record.sell_display_volume[trade_report_terms_message_at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> wire[at] = trade_report_terms_message_record.trade_time_stamp[trade_report_terms_message_at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_terms_message_record.settlement_terms; at = at + 1;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> wire[at] = trade_report_terms_message_record.settlement_date[trade_report_terms_message_at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_terms_message_record.cross_type; at = at + 1;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> wire[at] = trade_report_terms_message_record.trading_system_time_stamp[trade_report_terms_message_at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Terms Message off the wire, 74 bytes from where the cursor stands */
inline decode_trade_report_terms_message(trade_report_terms_message_record) {
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 12 -> trade_report_terms_message_record.symbol[trade_report_terms_message_at] = wire[at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.trade_number[trade_report_terms_message_at] = wire[at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> trade_report_terms_message_record.price[trade_report_terms_message_at] = wire[at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.volume[trade_report_terms_message_at] = wire[at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 2 -> trade_report_terms_message_record.buy_broker_number[trade_report_terms_message_at] = wire[at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> trade_report_terms_message_record.buy_order_id[trade_report_terms_message_at] = wire[at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.buy_display_volume[trade_report_terms_message_at] = wire[at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 2 -> trade_report_terms_message_record.sell_broker_number[trade_report_terms_message_at] = wire[at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> trade_report_terms_message_record.sell_order_id[trade_report_terms_message_at] = wire[at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.sell_display_volume[trade_report_terms_message_at] = wire[at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.trade_time_stamp[trade_report_terms_message_at] = wire[at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_record.settlement_terms = wire[at]; at = at + 1;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> trade_report_terms_message_record.settlement_date[trade_report_terms_message_at] = wire[at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_record.cross_type = wire[at]; at = at + 1;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> trade_report_terms_message_record.trading_system_time_stamp[trade_report_terms_message_at] = wire[at]; at = at + 1; trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Report Terms Message is what was written, byte for byte */
inline equal_trade_report_terms_message(trade_report_terms_message_read, trade_report_terms_message_written) {
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 12 -> assert(trade_report_terms_message_read.symbol[trade_report_terms_message_at] == trade_report_terms_message_written.symbol[trade_report_terms_message_at]); trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> assert(trade_report_terms_message_read.trade_number[trade_report_terms_message_at] == trade_report_terms_message_written.trade_number[trade_report_terms_message_at]); trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> assert(trade_report_terms_message_read.price[trade_report_terms_message_at] == trade_report_terms_message_written.price[trade_report_terms_message_at]); trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> assert(trade_report_terms_message_read.volume[trade_report_terms_message_at] == trade_report_terms_message_written.volume[trade_report_terms_message_at]); trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 2 -> assert(trade_report_terms_message_read.buy_broker_number[trade_report_terms_message_at] == trade_report_terms_message_written.buy_broker_number[trade_report_terms_message_at]); trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> assert(trade_report_terms_message_read.buy_order_id[trade_report_terms_message_at] == trade_report_terms_message_written.buy_order_id[trade_report_terms_message_at]); trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> assert(trade_report_terms_message_read.buy_display_volume[trade_report_terms_message_at] == trade_report_terms_message_written.buy_display_volume[trade_report_terms_message_at]); trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 2 -> assert(trade_report_terms_message_read.sell_broker_number[trade_report_terms_message_at] == trade_report_terms_message_written.sell_broker_number[trade_report_terms_message_at]); trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> assert(trade_report_terms_message_read.sell_order_id[trade_report_terms_message_at] == trade_report_terms_message_written.sell_order_id[trade_report_terms_message_at]); trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> assert(trade_report_terms_message_read.sell_display_volume[trade_report_terms_message_at] == trade_report_terms_message_written.sell_display_volume[trade_report_terms_message_at]); trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> assert(trade_report_terms_message_read.trade_time_stamp[trade_report_terms_message_at] == trade_report_terms_message_written.trade_time_stamp[trade_report_terms_message_at]); trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  assert(trade_report_terms_message_read.settlement_terms == trade_report_terms_message_written.settlement_terms);
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 4 -> assert(trade_report_terms_message_read.settlement_date[trade_report_terms_message_at] == trade_report_terms_message_written.settlement_date[trade_report_terms_message_at]); trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  assert(trade_report_terms_message_read.cross_type == trade_report_terms_message_written.cross_type);
  trade_report_terms_message_at = 0;
  do
  :: trade_report_terms_message_at < 8 -> assert(trade_report_terms_message_read.trading_system_time_stamp[trade_report_terms_message_at] == trade_report_terms_message_written.trading_system_time_stamp[trade_report_terms_message_at]); trade_report_terms_message_at = trade_report_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancelled Message: 24 bytes --------------------------------------- */

typedef TradeCancelledMessage {
  byte symbol[12];
  byte trade_number[4];
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
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.trade_number[trade_cancelled_message_at] = trade_cancelled_message_value; trade_cancelled_message_at = trade_cancelled_message_at + 1
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
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.trade_number[trade_cancelled_message_at] = (trade_cancelled_message_base + 12 + trade_cancelled_message_at + 1) % 256; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> trade_cancelled_message_record.trading_system_time_stamp[trade_cancelled_message_at] = (trade_cancelled_message_base + 16 + trade_cancelled_message_at + 1) % 256; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancelled Message to the wire, 24 bytes from where the cursor stands */
inline encode_trade_cancelled_message(trade_cancelled_message_record) {
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 12 -> wire[at] = trade_cancelled_message_record.symbol[trade_cancelled_message_at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> wire[at] = trade_cancelled_message_record.trade_number[trade_cancelled_message_at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> wire[at] = trade_cancelled_message_record.trading_system_time_stamp[trade_cancelled_message_at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancelled Message off the wire, 24 bytes from where the cursor stands */
inline decode_trade_cancelled_message(trade_cancelled_message_record) {
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 12 -> trade_cancelled_message_record.symbol[trade_cancelled_message_at] = wire[at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 4 -> trade_cancelled_message_record.trade_number[trade_cancelled_message_at] = wire[at]; at = at + 1; trade_cancelled_message_at = trade_cancelled_message_at + 1
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
  :: trade_cancelled_message_at < 4 -> assert(trade_cancelled_message_read.trade_number[trade_cancelled_message_at] == trade_cancelled_message_written.trade_number[trade_cancelled_message_at]); trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  trade_cancelled_message_at = 0;
  do
  :: trade_cancelled_message_at < 8 -> assert(trade_cancelled_message_read.trading_system_time_stamp[trade_cancelled_message_at] == trade_cancelled_message_written.trading_system_time_stamp[trade_cancelled_message_at]); trade_cancelled_message_at = trade_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancelled Terms Message: 24 bytes --------------------------------- */

typedef TradeCancelledTermsMessage {
  byte symbol[12];
  byte trade_number[4];
  byte trading_system_time_stamp[8]
};

int trade_cancelled_terms_message_at;

/* every byte of Trade Cancelled Terms Message set to one value */
inline fill_trade_cancelled_terms_message(trade_cancelled_terms_message_record, trade_cancelled_terms_message_value) {
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 12 -> trade_cancelled_terms_message_record.symbol[trade_cancelled_terms_message_at] = trade_cancelled_terms_message_value; trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 4 -> trade_cancelled_terms_message_record.trade_number[trade_cancelled_terms_message_at] = trade_cancelled_terms_message_value; trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 8 -> trade_cancelled_terms_message_record.trading_system_time_stamp[trade_cancelled_terms_message_at] = trade_cancelled_terms_message_value; trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancelled Terms Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancelled_terms_message(trade_cancelled_terms_message_record, trade_cancelled_terms_message_base) {
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 12 -> trade_cancelled_terms_message_record.symbol[trade_cancelled_terms_message_at] = (trade_cancelled_terms_message_base + 0 + trade_cancelled_terms_message_at + 1) % 256; trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 4 -> trade_cancelled_terms_message_record.trade_number[trade_cancelled_terms_message_at] = (trade_cancelled_terms_message_base + 12 + trade_cancelled_terms_message_at + 1) % 256; trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 8 -> trade_cancelled_terms_message_record.trading_system_time_stamp[trade_cancelled_terms_message_at] = (trade_cancelled_terms_message_base + 16 + trade_cancelled_terms_message_at + 1) % 256; trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancelled Terms Message to the wire, 24 bytes from where the cursor stands */
inline encode_trade_cancelled_terms_message(trade_cancelled_terms_message_record) {
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 12 -> wire[at] = trade_cancelled_terms_message_record.symbol[trade_cancelled_terms_message_at]; at = at + 1; trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 4 -> wire[at] = trade_cancelled_terms_message_record.trade_number[trade_cancelled_terms_message_at]; at = at + 1; trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 8 -> wire[at] = trade_cancelled_terms_message_record.trading_system_time_stamp[trade_cancelled_terms_message_at]; at = at + 1; trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancelled Terms Message off the wire, 24 bytes from where the cursor stands */
inline decode_trade_cancelled_terms_message(trade_cancelled_terms_message_record) {
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 12 -> trade_cancelled_terms_message_record.symbol[trade_cancelled_terms_message_at] = wire[at]; at = at + 1; trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 4 -> trade_cancelled_terms_message_record.trade_number[trade_cancelled_terms_message_at] = wire[at]; at = at + 1; trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 8 -> trade_cancelled_terms_message_record.trading_system_time_stamp[trade_cancelled_terms_message_at] = wire[at]; at = at + 1; trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancelled Terms Message is what was written, byte for byte */
inline equal_trade_cancelled_terms_message(trade_cancelled_terms_message_read, trade_cancelled_terms_message_written) {
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 12 -> assert(trade_cancelled_terms_message_read.symbol[trade_cancelled_terms_message_at] == trade_cancelled_terms_message_written.symbol[trade_cancelled_terms_message_at]); trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 4 -> assert(trade_cancelled_terms_message_read.trade_number[trade_cancelled_terms_message_at] == trade_cancelled_terms_message_written.trade_number[trade_cancelled_terms_message_at]); trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  trade_cancelled_terms_message_at = 0;
  do
  :: trade_cancelled_terms_message_at < 8 -> assert(trade_cancelled_terms_message_read.trading_system_time_stamp[trade_cancelled_terms_message_at] == trade_cancelled_terms_message_written.trading_system_time_stamp[trade_cancelled_terms_message_at]); trade_cancelled_terms_message_at = trade_cancelled_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Correction Message: 52 bytes -------------------------------------- */

typedef TradeCorrectionMessage {
  byte symbol[12];
  byte trade_number[4];
  byte price[8];
  byte volume[4];
  byte buy_broker_number[2];
  byte sell_broker_number[2];
  byte initiated_by;
  byte orig_trade_number[4];
  byte bypass;
  byte trade_time_stamp[4];
  byte cross_type;
  byte is_dark;
  byte trading_system_time_stamp[8]
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> trade_correction_message_record.symbol[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.trade_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.volume[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.buy_broker_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.sell_broker_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.initiated_by = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.orig_trade_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.bypass = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.trade_time_stamp[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.cross_type = trade_correction_message_value;
  trade_correction_message_record.is_dark = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.trading_system_time_stamp[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> trade_correction_message_record.symbol[trade_correction_message_at] = (trade_correction_message_base + 0 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.trade_number[trade_correction_message_at] = (trade_correction_message_base + 12 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.price[trade_correction_message_at] = (trade_correction_message_base + 16 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.volume[trade_correction_message_at] = (trade_correction_message_base + 24 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.buy_broker_number[trade_correction_message_at] = (trade_correction_message_base + 28 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.sell_broker_number[trade_correction_message_at] = (trade_correction_message_base + 30 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.initiated_by = (trade_correction_message_base + 32 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.orig_trade_number[trade_correction_message_at] = (trade_correction_message_base + 33 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.bypass = (trade_correction_message_base + 37 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.trade_time_stamp[trade_correction_message_at] = (trade_correction_message_base + 38 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.cross_type = (trade_correction_message_base + 42 + 1) % 256;
  trade_correction_message_record.is_dark = (trade_correction_message_base + 43 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.trading_system_time_stamp[trade_correction_message_at] = (trade_correction_message_base + 44 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message to the wire, 52 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> wire[at] = trade_correction_message_record.symbol[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.trade_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.volume[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> wire[at] = trade_correction_message_record.buy_broker_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> wire[at] = trade_correction_message_record.sell_broker_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.initiated_by; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.orig_trade_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.bypass; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.trade_time_stamp[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.cross_type; at = at + 1;
  wire[at] = trade_correction_message_record.is_dark; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.trading_system_time_stamp[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message off the wire, 52 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> trade_correction_message_record.symbol[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.trade_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.volume[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.buy_broker_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.sell_broker_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.initiated_by = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.orig_trade_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.bypass = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.trade_time_stamp[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.cross_type = wire[at]; at = at + 1;
  trade_correction_message_record.is_dark = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.trading_system_time_stamp[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> assert(trade_correction_message_read.symbol[trade_correction_message_at] == trade_correction_message_written.symbol[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.trade_number[trade_correction_message_at] == trade_correction_message_written.trade_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.price[trade_correction_message_at] == trade_correction_message_written.price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.volume[trade_correction_message_at] == trade_correction_message_written.volume[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> assert(trade_correction_message_read.buy_broker_number[trade_correction_message_at] == trade_correction_message_written.buy_broker_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> assert(trade_correction_message_read.sell_broker_number[trade_correction_message_at] == trade_correction_message_written.sell_broker_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.initiated_by == trade_correction_message_written.initiated_by);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.orig_trade_number[trade_correction_message_at] == trade_correction_message_written.orig_trade_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.bypass == trade_correction_message_written.bypass);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.trade_time_stamp[trade_correction_message_at] == trade_correction_message_written.trade_time_stamp[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.cross_type == trade_correction_message_written.cross_type);
  assert(trade_correction_message_read.is_dark == trade_correction_message_written.is_dark);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.trading_system_time_stamp[trade_correction_message_at] == trade_correction_message_written.trading_system_time_stamp[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Correction Terms Message: 55 bytes -------------------------------- */

typedef TradeCorrectionTermsMessage {
  byte symbol[12];
  byte trade_number[4];
  byte price[8];
  byte volume[4];
  byte buy_broker_number[2];
  byte sell_broker_number[2];
  byte initiated_by;
  byte orig_trade_number[4];
  byte trade_time_stamp[4];
  byte settlement_terms;
  byte settlement_date[4];
  byte cross_type;
  byte trading_system_time_stamp[8]
};

int trade_correction_terms_message_at;

/* every byte of Trade Correction Terms Message set to one value */
inline fill_trade_correction_terms_message(trade_correction_terms_message_record, trade_correction_terms_message_value) {
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 12 -> trade_correction_terms_message_record.symbol[trade_correction_terms_message_at] = trade_correction_terms_message_value; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.trade_number[trade_correction_terms_message_at] = trade_correction_terms_message_value; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 8 -> trade_correction_terms_message_record.price[trade_correction_terms_message_at] = trade_correction_terms_message_value; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.volume[trade_correction_terms_message_at] = trade_correction_terms_message_value; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 2 -> trade_correction_terms_message_record.buy_broker_number[trade_correction_terms_message_at] = trade_correction_terms_message_value; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 2 -> trade_correction_terms_message_record.sell_broker_number[trade_correction_terms_message_at] = trade_correction_terms_message_value; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_record.initiated_by = trade_correction_terms_message_value;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.orig_trade_number[trade_correction_terms_message_at] = trade_correction_terms_message_value; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.trade_time_stamp[trade_correction_terms_message_at] = trade_correction_terms_message_value; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_record.settlement_terms = trade_correction_terms_message_value;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.settlement_date[trade_correction_terms_message_at] = trade_correction_terms_message_value; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_record.cross_type = trade_correction_terms_message_value;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 8 -> trade_correction_terms_message_record.trading_system_time_stamp[trade_correction_terms_message_at] = trade_correction_terms_message_value; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Correction Terms Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_terms_message(trade_correction_terms_message_record, trade_correction_terms_message_base) {
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 12 -> trade_correction_terms_message_record.symbol[trade_correction_terms_message_at] = (trade_correction_terms_message_base + 0 + trade_correction_terms_message_at + 1) % 256; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.trade_number[trade_correction_terms_message_at] = (trade_correction_terms_message_base + 12 + trade_correction_terms_message_at + 1) % 256; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 8 -> trade_correction_terms_message_record.price[trade_correction_terms_message_at] = (trade_correction_terms_message_base + 16 + trade_correction_terms_message_at + 1) % 256; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.volume[trade_correction_terms_message_at] = (trade_correction_terms_message_base + 24 + trade_correction_terms_message_at + 1) % 256; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 2 -> trade_correction_terms_message_record.buy_broker_number[trade_correction_terms_message_at] = (trade_correction_terms_message_base + 28 + trade_correction_terms_message_at + 1) % 256; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 2 -> trade_correction_terms_message_record.sell_broker_number[trade_correction_terms_message_at] = (trade_correction_terms_message_base + 30 + trade_correction_terms_message_at + 1) % 256; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_record.initiated_by = (trade_correction_terms_message_base + 32 + 1) % 256;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.orig_trade_number[trade_correction_terms_message_at] = (trade_correction_terms_message_base + 33 + trade_correction_terms_message_at + 1) % 256; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.trade_time_stamp[trade_correction_terms_message_at] = (trade_correction_terms_message_base + 37 + trade_correction_terms_message_at + 1) % 256; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_record.settlement_terms = (trade_correction_terms_message_base + 41 + 1) % 256;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.settlement_date[trade_correction_terms_message_at] = (trade_correction_terms_message_base + 42 + trade_correction_terms_message_at + 1) % 256; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_record.cross_type = (trade_correction_terms_message_base + 46 + 1) % 256;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 8 -> trade_correction_terms_message_record.trading_system_time_stamp[trade_correction_terms_message_at] = (trade_correction_terms_message_base + 47 + trade_correction_terms_message_at + 1) % 256; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Terms Message to the wire, 55 bytes from where the cursor stands */
inline encode_trade_correction_terms_message(trade_correction_terms_message_record) {
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 12 -> wire[at] = trade_correction_terms_message_record.symbol[trade_correction_terms_message_at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> wire[at] = trade_correction_terms_message_record.trade_number[trade_correction_terms_message_at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 8 -> wire[at] = trade_correction_terms_message_record.price[trade_correction_terms_message_at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> wire[at] = trade_correction_terms_message_record.volume[trade_correction_terms_message_at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 2 -> wire[at] = trade_correction_terms_message_record.buy_broker_number[trade_correction_terms_message_at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 2 -> wire[at] = trade_correction_terms_message_record.sell_broker_number[trade_correction_terms_message_at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_terms_message_record.initiated_by; at = at + 1;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> wire[at] = trade_correction_terms_message_record.orig_trade_number[trade_correction_terms_message_at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> wire[at] = trade_correction_terms_message_record.trade_time_stamp[trade_correction_terms_message_at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_terms_message_record.settlement_terms; at = at + 1;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> wire[at] = trade_correction_terms_message_record.settlement_date[trade_correction_terms_message_at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_terms_message_record.cross_type; at = at + 1;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 8 -> wire[at] = trade_correction_terms_message_record.trading_system_time_stamp[trade_correction_terms_message_at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Terms Message off the wire, 55 bytes from where the cursor stands */
inline decode_trade_correction_terms_message(trade_correction_terms_message_record) {
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 12 -> trade_correction_terms_message_record.symbol[trade_correction_terms_message_at] = wire[at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.trade_number[trade_correction_terms_message_at] = wire[at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 8 -> trade_correction_terms_message_record.price[trade_correction_terms_message_at] = wire[at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.volume[trade_correction_terms_message_at] = wire[at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 2 -> trade_correction_terms_message_record.buy_broker_number[trade_correction_terms_message_at] = wire[at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 2 -> trade_correction_terms_message_record.sell_broker_number[trade_correction_terms_message_at] = wire[at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_record.initiated_by = wire[at]; at = at + 1;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.orig_trade_number[trade_correction_terms_message_at] = wire[at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.trade_time_stamp[trade_correction_terms_message_at] = wire[at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_record.settlement_terms = wire[at]; at = at + 1;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> trade_correction_terms_message_record.settlement_date[trade_correction_terms_message_at] = wire[at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_record.cross_type = wire[at]; at = at + 1;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 8 -> trade_correction_terms_message_record.trading_system_time_stamp[trade_correction_terms_message_at] = wire[at]; at = at + 1; trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Correction Terms Message is what was written, byte for byte */
inline equal_trade_correction_terms_message(trade_correction_terms_message_read, trade_correction_terms_message_written) {
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 12 -> assert(trade_correction_terms_message_read.symbol[trade_correction_terms_message_at] == trade_correction_terms_message_written.symbol[trade_correction_terms_message_at]); trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> assert(trade_correction_terms_message_read.trade_number[trade_correction_terms_message_at] == trade_correction_terms_message_written.trade_number[trade_correction_terms_message_at]); trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 8 -> assert(trade_correction_terms_message_read.price[trade_correction_terms_message_at] == trade_correction_terms_message_written.price[trade_correction_terms_message_at]); trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> assert(trade_correction_terms_message_read.volume[trade_correction_terms_message_at] == trade_correction_terms_message_written.volume[trade_correction_terms_message_at]); trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 2 -> assert(trade_correction_terms_message_read.buy_broker_number[trade_correction_terms_message_at] == trade_correction_terms_message_written.buy_broker_number[trade_correction_terms_message_at]); trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 2 -> assert(trade_correction_terms_message_read.sell_broker_number[trade_correction_terms_message_at] == trade_correction_terms_message_written.sell_broker_number[trade_correction_terms_message_at]); trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_terms_message_read.initiated_by == trade_correction_terms_message_written.initiated_by);
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> assert(trade_correction_terms_message_read.orig_trade_number[trade_correction_terms_message_at] == trade_correction_terms_message_written.orig_trade_number[trade_correction_terms_message_at]); trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> assert(trade_correction_terms_message_read.trade_time_stamp[trade_correction_terms_message_at] == trade_correction_terms_message_written.trade_time_stamp[trade_correction_terms_message_at]); trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_terms_message_read.settlement_terms == trade_correction_terms_message_written.settlement_terms);
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 4 -> assert(trade_correction_terms_message_read.settlement_date[trade_correction_terms_message_at] == trade_correction_terms_message_written.settlement_date[trade_correction_terms_message_at]); trade_correction_terms_message_at = trade_correction_terms_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_terms_message_read.cross_type == trade_correction_terms_message_written.cross_type);
  trade_correction_terms_message_at = 0;
  do
  :: trade_correction_terms_message_at < 8 -> assert(trade_correction_terms_message_read.trading_system_time_stamp[trade_correction_terms_message_at] == trade_correction_terms_message_written.trading_system_time_stamp[trade_correction_terms_message_at]); trade_correction_terms_message_at = trade_correction_terms_message_at + 1
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
    assert(at == 53);
    at = 0;
    decode_symbol_status_message(symbol_status_message_got);
    assert(at == 53);
    equal_symbol_status_message(symbol_status_message_got, symbol_status_message_sent)
  }
}

/* Order Book Message: encoded, read back, and compared */
proctype check_order_book_message() {
  OrderBookMessage order_book_message_sent;
  OrderBookMessage order_book_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_message(order_book_message_sent, 0)
  :: pattern == 1 -> fill_order_book_message(order_book_message_sent, 32)
  :: pattern == 2 -> fill_order_book_message(order_book_message_sent, 255)
  :: else -> ramp_order_book_message(order_book_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_message(order_book_message_sent);
    assert(at == 43);
    at = 0;
    decode_order_book_message(order_book_message_got);
    assert(at == 43);
    equal_order_book_message(order_book_message_got, order_book_message_sent)
  }
}

/* Market State Update Message: encoded, read back, and compared */
proctype check_market_state_update_message() {
  MarketStateUpdateMessage market_state_update_message_sent;
  MarketStateUpdateMessage market_state_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_state_update_message(market_state_update_message_sent, 0)
  :: pattern == 1 -> fill_market_state_update_message(market_state_update_message_sent, 32)
  :: pattern == 2 -> fill_market_state_update_message(market_state_update_message_sent, 255)
  :: else -> ramp_market_state_update_message(market_state_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_state_update_message(market_state_update_message_sent);
    assert(at == 10);
    at = 0;
    decode_market_state_update_message(market_state_update_message_got);
    assert(at == 10);
    equal_market_state_update_message(market_state_update_message_got, market_state_update_message_sent)
  }
}

/* Order Booked Message: encoded, read back, and compared */
proctype check_order_booked_message() {
  OrderBookedMessage order_booked_message_sent;
  OrderBookedMessage order_booked_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_booked_message(order_booked_message_sent, 0)
  :: pattern == 1 -> fill_order_booked_message(order_booked_message_sent, 32)
  :: pattern == 2 -> fill_order_booked_message(order_booked_message_sent, 255)
  :: else -> ramp_order_booked_message(order_booked_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_booked_message(order_booked_message_sent);
    assert(at == 51);
    at = 0;
    decode_order_booked_message(order_booked_message_got);
    assert(at == 51);
    equal_order_booked_message(order_booked_message_got, order_booked_message_sent)
  }
}

/* Order Cancelled Message: encoded, read back, and compared */
proctype check_order_cancelled_message() {
  OrderCancelledMessage order_cancelled_message_sent;
  OrderCancelledMessage order_cancelled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancelled_message(order_cancelled_message_sent, 0)
  :: pattern == 1 -> fill_order_cancelled_message(order_cancelled_message_sent, 32)
  :: pattern == 2 -> fill_order_cancelled_message(order_cancelled_message_sent, 255)
  :: else -> ramp_order_cancelled_message(order_cancelled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancelled_message(order_cancelled_message_sent);
    assert(at == 31);
    at = 0;
    decode_order_cancelled_message(order_cancelled_message_got);
    assert(at == 31);
    equal_order_cancelled_message(order_cancelled_message_got, order_cancelled_message_sent)
  }
}

/* Order Price Time Assigned Message: encoded, read back, and compared */
proctype check_order_price_time_assigned_message() {
  OrderPriceTimeAssignedMessage order_price_time_assigned_message_sent;
  OrderPriceTimeAssignedMessage order_price_time_assigned_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_price_time_assigned_message(order_price_time_assigned_message_sent, 0)
  :: pattern == 1 -> fill_order_price_time_assigned_message(order_price_time_assigned_message_sent, 32)
  :: pattern == 2 -> fill_order_price_time_assigned_message(order_price_time_assigned_message_sent, 255)
  :: else -> ramp_order_price_time_assigned_message(order_price_time_assigned_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_price_time_assigned_message(order_price_time_assigned_message_sent);
    assert(at == 51);
    at = 0;
    decode_order_price_time_assigned_message(order_price_time_assigned_message_got);
    assert(at == 51);
    equal_order_price_time_assigned_message(order_price_time_assigned_message_got, order_price_time_assigned_message_sent)
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
    assert(at == 62);
    at = 0;
    decode_stock_status_message(stock_status_message_got);
    assert(at == 62);
    equal_stock_status_message(stock_status_message_got, stock_status_message_sent)
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
    assert(at == 71);
    at = 0;
    decode_trade_report_message(trade_report_message_got);
    assert(at == 71);
    equal_trade_report_message(trade_report_message_got, trade_report_message_sent)
  }
}

/* Trade Report Terms Message: encoded, read back, and compared */
proctype check_trade_report_terms_message() {
  TradeReportTermsMessage trade_report_terms_message_sent;
  TradeReportTermsMessage trade_report_terms_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_report_terms_message(trade_report_terms_message_sent, 0)
  :: pattern == 1 -> fill_trade_report_terms_message(trade_report_terms_message_sent, 32)
  :: pattern == 2 -> fill_trade_report_terms_message(trade_report_terms_message_sent, 255)
  :: else -> ramp_trade_report_terms_message(trade_report_terms_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_report_terms_message(trade_report_terms_message_sent);
    assert(at == 74);
    at = 0;
    decode_trade_report_terms_message(trade_report_terms_message_got);
    assert(at == 74);
    equal_trade_report_terms_message(trade_report_terms_message_got, trade_report_terms_message_sent)
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
    assert(at == 24);
    at = 0;
    decode_trade_cancelled_message(trade_cancelled_message_got);
    assert(at == 24);
    equal_trade_cancelled_message(trade_cancelled_message_got, trade_cancelled_message_sent)
  }
}

/* Trade Cancelled Terms Message: encoded, read back, and compared */
proctype check_trade_cancelled_terms_message() {
  TradeCancelledTermsMessage trade_cancelled_terms_message_sent;
  TradeCancelledTermsMessage trade_cancelled_terms_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancelled_terms_message(trade_cancelled_terms_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancelled_terms_message(trade_cancelled_terms_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancelled_terms_message(trade_cancelled_terms_message_sent, 255)
  :: else -> ramp_trade_cancelled_terms_message(trade_cancelled_terms_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancelled_terms_message(trade_cancelled_terms_message_sent);
    assert(at == 24);
    at = 0;
    decode_trade_cancelled_terms_message(trade_cancelled_terms_message_got);
    assert(at == 24);
    equal_trade_cancelled_terms_message(trade_cancelled_terms_message_got, trade_cancelled_terms_message_sent)
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
    assert(at == 52);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 52);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* Trade Correction Terms Message: encoded, read back, and compared */
proctype check_trade_correction_terms_message() {
  TradeCorrectionTermsMessage trade_correction_terms_message_sent;
  TradeCorrectionTermsMessage trade_correction_terms_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_correction_terms_message(trade_correction_terms_message_sent, 0)
  :: pattern == 1 -> fill_trade_correction_terms_message(trade_correction_terms_message_sent, 32)
  :: pattern == 2 -> fill_trade_correction_terms_message(trade_correction_terms_message_sent, 255)
  :: else -> ramp_trade_correction_terms_message(trade_correction_terms_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_correction_terms_message(trade_correction_terms_message_sent);
    assert(at == 55);
    at = 0;
    decode_trade_correction_terms_message(trade_correction_terms_message_got);
    assert(at == 55);
    equal_trade_correction_terms_message(trade_correction_terms_message_got, trade_correction_terms_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_frame_header()
  :: run check_body_header()
  :: run check_business_header()
  :: run check_symbol_status_message()
  :: run check_order_book_message()
  :: run check_market_state_update_message()
  :: run check_order_booked_message()
  :: run check_order_cancelled_message()
  :: run check_order_price_time_assigned_message()
  :: run check_stock_status_message()
  :: run check_trade_report_message()
  :: run check_trade_report_terms_message()
  :: run check_trade_cancelled_message()
  :: run check_trade_cancelled_terms_message()
  :: run check_trade_correction_message()
  :: run check_trade_correction_terms_message()
  fi
}
