/*
 * Chicago Board Options Exchange Binary Order Entry
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
 *   - a Reassemble rule
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 193

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Firm Message Header: 12 bytes ------------------------------------------- */

/* Message header of a packet sent by the firm */
typedef FirmMessageHeader {
  byte start_of_message[2];
  byte message_length[2];
  byte firm_message_type[2];
  byte matching_unit;
  byte reserved_field;
  byte sequence_number[4]
};

int firm_message_header_at;

/* every byte of Firm Message Header set to one value */
inline fill_firm_message_header(firm_message_header_record, firm_message_header_value) {
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> firm_message_header_record.start_of_message[firm_message_header_at] = firm_message_header_value; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> firm_message_header_record.message_length[firm_message_header_at] = firm_message_header_value; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> firm_message_header_record.firm_message_type[firm_message_header_at] = firm_message_header_value; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  firm_message_header_record.matching_unit = firm_message_header_value;
  firm_message_header_record.reserved_field = firm_message_header_value;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 4 -> firm_message_header_record.sequence_number[firm_message_header_at] = firm_message_header_value; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Firm Message Header set to where it lies, so a field read out of place says so */
inline ramp_firm_message_header(firm_message_header_record, firm_message_header_base) {
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> firm_message_header_record.start_of_message[firm_message_header_at] = (firm_message_header_base + 0 + firm_message_header_at + 1) % 256; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> firm_message_header_record.message_length[firm_message_header_at] = (firm_message_header_base + 2 + firm_message_header_at + 1) % 256; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> firm_message_header_record.firm_message_type[firm_message_header_at] = (firm_message_header_base + 4 + firm_message_header_at + 1) % 256; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  firm_message_header_record.matching_unit = (firm_message_header_base + 6 + 1) % 256;
  firm_message_header_record.reserved_field = (firm_message_header_base + 7 + 1) % 256;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 4 -> firm_message_header_record.sequence_number[firm_message_header_at] = (firm_message_header_base + 8 + firm_message_header_at + 1) % 256; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Firm Message Header to the wire, 12 bytes from where the cursor stands */
inline encode_firm_message_header(firm_message_header_record) {
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> wire[at] = firm_message_header_record.start_of_message[firm_message_header_at]; at = at + 1; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> wire[at] = firm_message_header_record.message_length[firm_message_header_at]; at = at + 1; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> wire[at] = firm_message_header_record.firm_message_type[firm_message_header_at]; at = at + 1; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  wire[at] = firm_message_header_record.matching_unit; at = at + 1;
  wire[at] = firm_message_header_record.reserved_field; at = at + 1;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 4 -> wire[at] = firm_message_header_record.sequence_number[firm_message_header_at]; at = at + 1; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Firm Message Header off the wire, 12 bytes from where the cursor stands */
inline decode_firm_message_header(firm_message_header_record) {
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> firm_message_header_record.start_of_message[firm_message_header_at] = wire[at]; at = at + 1; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> firm_message_header_record.message_length[firm_message_header_at] = wire[at]; at = at + 1; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> firm_message_header_record.firm_message_type[firm_message_header_at] = wire[at]; at = at + 1; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  firm_message_header_record.matching_unit = wire[at]; at = at + 1;
  firm_message_header_record.reserved_field = wire[at]; at = at + 1;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 4 -> firm_message_header_record.sequence_number[firm_message_header_at] = wire[at]; at = at + 1; firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Firm Message Header is what was written, byte for byte */
inline equal_firm_message_header(firm_message_header_read, firm_message_header_written) {
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> assert(firm_message_header_read.start_of_message[firm_message_header_at] == firm_message_header_written.start_of_message[firm_message_header_at]); firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> assert(firm_message_header_read.message_length[firm_message_header_at] == firm_message_header_written.message_length[firm_message_header_at]); firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 2 -> assert(firm_message_header_read.firm_message_type[firm_message_header_at] == firm_message_header_written.firm_message_type[firm_message_header_at]); firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  assert(firm_message_header_read.matching_unit == firm_message_header_written.matching_unit);
  assert(firm_message_header_read.reserved_field == firm_message_header_written.reserved_field);
  firm_message_header_at = 0;
  do
  :: firm_message_header_at < 4 -> assert(firm_message_header_read.sequence_number[firm_message_header_at] == firm_message_header_written.sequence_number[firm_message_header_at]); firm_message_header_at = firm_message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Prevent Match: 3 bytes -------------------------------------------------- */

typedef PreventMatch {
  byte mtp_modifier;
  byte unique_id_level;
  byte trading_group_id
};

/* every byte of Prevent Match set to one value */
inline fill_prevent_match(prevent_match_record, prevent_match_value) {
  prevent_match_record.mtp_modifier = prevent_match_value;
  prevent_match_record.unique_id_level = prevent_match_value;
  prevent_match_record.trading_group_id = prevent_match_value;
  skip
}

/* each byte of Prevent Match set to where it lies, so a field read out of place says so */
inline ramp_prevent_match(prevent_match_record, prevent_match_base) {
  prevent_match_record.mtp_modifier = (prevent_match_base + 0 + 1) % 256;
  prevent_match_record.unique_id_level = (prevent_match_base + 1 + 1) % 256;
  prevent_match_record.trading_group_id = (prevent_match_base + 2 + 1) % 256;
  skip
}

/* Prevent Match to the wire, 3 bytes from where the cursor stands */
inline encode_prevent_match(prevent_match_record) {
  wire[at] = prevent_match_record.mtp_modifier; at = at + 1;
  wire[at] = prevent_match_record.unique_id_level; at = at + 1;
  wire[at] = prevent_match_record.trading_group_id; at = at + 1;
  skip
}

/* Prevent Match off the wire, 3 bytes from where the cursor stands */
inline decode_prevent_match(prevent_match_record) {
  prevent_match_record.mtp_modifier = wire[at]; at = at + 1;
  prevent_match_record.unique_id_level = wire[at]; at = at + 1;
  prevent_match_record.trading_group_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Prevent Match is what was written, byte for byte */
inline equal_prevent_match(prevent_match_read, prevent_match_written) {
  assert(prevent_match_read.mtp_modifier == prevent_match_written.mtp_modifier);
  assert(prevent_match_read.unique_id_level == prevent_match_written.unique_id_level);
  assert(prevent_match_read.trading_group_id == prevent_match_written.trading_group_id);
  skip
}

/* ---- New Order Message: 193 bytes -------------------------------------------- */

/* Submission of a new simple (single leg) order to Cboe */
typedef NewOrderMessage {
  byte cl_ord_id[20];
  byte side;
  byte order_qty[4];
  byte clearing_firm[4];
  byte clearing_account[4];
  byte price[8];
  byte exec_inst;
  byte ord_type;
  byte time_in_force;
  byte min_qty[4];
  byte max_floor[4];
  byte symbol[8];
  byte capacity;
  byte routing_inst[4];
  byte account[16];
  byte display_indicator;
  PreventMatch prevent_match;
  byte expire_time[8];
  byte maturity_date[4];
  byte strike_price[8];
  byte put_or_call;
  byte open_close;
  byte cmta_number[4];
  byte target_party_id[4];
  byte session_eligibility;
  byte attributed_quote;
  byte display_range[4];
  byte stop_px[8];
  byte rout_strategy[6];
  byte route_delivery_method[3];
  byte ex_destination;
  byte auction_id[8];
  byte routing_firm_id[4];
  byte custom_group_id[2];
  byte clearing_optional_data[16];
  byte client_id_attr[4];
  byte frequent_trader_id[6];
  byte compression;
  byte floor_destination[4];
  byte floor_routing_inst;
  byte order_origin[3];
  byte order_router_subsidy;
  byte price_type;
  byte held;
  byte scratch_pad[2]
};

int new_order_message_at;

/* every byte of New Order Message set to one value */
inline fill_new_order_message(new_order_message_record, new_order_message_value) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 20 -> new_order_message_record.cl_ord_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.side = new_order_message_value;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.order_qty[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.clearing_firm[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.clearing_account[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.price[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.exec_inst = new_order_message_value;
  new_order_message_record.ord_type = new_order_message_value;
  new_order_message_record.time_in_force = new_order_message_value;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.min_qty[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.max_floor[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.symbol[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.capacity = new_order_message_value;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.routing_inst[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 16 -> new_order_message_record.account[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.display_indicator = new_order_message_value;
  fill_prevent_match(new_order_message_record.prevent_match, new_order_message_value);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.expire_time[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.maturity_date[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.strike_price[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.put_or_call = new_order_message_value;
  new_order_message_record.open_close = new_order_message_value;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.cmta_number[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.target_party_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.session_eligibility = new_order_message_value;
  new_order_message_record.attributed_quote = new_order_message_value;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.display_range[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.stop_px[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 6 -> new_order_message_record.rout_strategy[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 3 -> new_order_message_record.route_delivery_method[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.ex_destination = new_order_message_value;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.auction_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.routing_firm_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> new_order_message_record.custom_group_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 16 -> new_order_message_record.clearing_optional_data[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.client_id_attr[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 6 -> new_order_message_record.frequent_trader_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.compression = new_order_message_value;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.floor_destination[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.floor_routing_inst = new_order_message_value;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 3 -> new_order_message_record.order_origin[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.order_router_subsidy = new_order_message_value;
  new_order_message_record.price_type = new_order_message_value;
  new_order_message_record.held = new_order_message_value;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> new_order_message_record.scratch_pad[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_message(new_order_message_record, new_order_message_base) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 20 -> new_order_message_record.cl_ord_id[new_order_message_at] = (new_order_message_base + 0 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.side = (new_order_message_base + 20 + 1) % 256;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.order_qty[new_order_message_at] = (new_order_message_base + 21 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.clearing_firm[new_order_message_at] = (new_order_message_base + 25 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.clearing_account[new_order_message_at] = (new_order_message_base + 29 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.price[new_order_message_at] = (new_order_message_base + 33 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.exec_inst = (new_order_message_base + 41 + 1) % 256;
  new_order_message_record.ord_type = (new_order_message_base + 42 + 1) % 256;
  new_order_message_record.time_in_force = (new_order_message_base + 43 + 1) % 256;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.min_qty[new_order_message_at] = (new_order_message_base + 44 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.max_floor[new_order_message_at] = (new_order_message_base + 48 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.symbol[new_order_message_at] = (new_order_message_base + 52 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.capacity = (new_order_message_base + 60 + 1) % 256;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.routing_inst[new_order_message_at] = (new_order_message_base + 61 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 16 -> new_order_message_record.account[new_order_message_at] = (new_order_message_base + 65 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.display_indicator = (new_order_message_base + 81 + 1) % 256;
  ramp_prevent_match(new_order_message_record.prevent_match, new_order_message_base + 82);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.expire_time[new_order_message_at] = (new_order_message_base + 85 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.maturity_date[new_order_message_at] = (new_order_message_base + 93 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.strike_price[new_order_message_at] = (new_order_message_base + 97 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.put_or_call = (new_order_message_base + 105 + 1) % 256;
  new_order_message_record.open_close = (new_order_message_base + 106 + 1) % 256;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.cmta_number[new_order_message_at] = (new_order_message_base + 107 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.target_party_id[new_order_message_at] = (new_order_message_base + 111 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.session_eligibility = (new_order_message_base + 115 + 1) % 256;
  new_order_message_record.attributed_quote = (new_order_message_base + 116 + 1) % 256;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.display_range[new_order_message_at] = (new_order_message_base + 117 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.stop_px[new_order_message_at] = (new_order_message_base + 121 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 6 -> new_order_message_record.rout_strategy[new_order_message_at] = (new_order_message_base + 129 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 3 -> new_order_message_record.route_delivery_method[new_order_message_at] = (new_order_message_base + 135 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.ex_destination = (new_order_message_base + 138 + 1) % 256;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.auction_id[new_order_message_at] = (new_order_message_base + 139 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.routing_firm_id[new_order_message_at] = (new_order_message_base + 147 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> new_order_message_record.custom_group_id[new_order_message_at] = (new_order_message_base + 151 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 16 -> new_order_message_record.clearing_optional_data[new_order_message_at] = (new_order_message_base + 153 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.client_id_attr[new_order_message_at] = (new_order_message_base + 169 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 6 -> new_order_message_record.frequent_trader_id[new_order_message_at] = (new_order_message_base + 173 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.compression = (new_order_message_base + 179 + 1) % 256;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.floor_destination[new_order_message_at] = (new_order_message_base + 180 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.floor_routing_inst = (new_order_message_base + 184 + 1) % 256;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 3 -> new_order_message_record.order_origin[new_order_message_at] = (new_order_message_base + 185 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.order_router_subsidy = (new_order_message_base + 188 + 1) % 256;
  new_order_message_record.price_type = (new_order_message_base + 189 + 1) % 256;
  new_order_message_record.held = (new_order_message_base + 190 + 1) % 256;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> new_order_message_record.scratch_pad[new_order_message_at] = (new_order_message_base + 191 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Message to the wire, 193 bytes from where the cursor stands */
inline encode_new_order_message(new_order_message_record) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 20 -> wire[at] = new_order_message_record.cl_ord_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.side; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.order_qty[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.clearing_firm[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.clearing_account[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.price[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.exec_inst; at = at + 1;
  wire[at] = new_order_message_record.ord_type; at = at + 1;
  wire[at] = new_order_message_record.time_in_force; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.min_qty[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.max_floor[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.symbol[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.capacity; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.routing_inst[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 16 -> wire[at] = new_order_message_record.account[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.display_indicator; at = at + 1;
  encode_prevent_match(new_order_message_record.prevent_match);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.expire_time[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.maturity_date[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.strike_price[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.put_or_call; at = at + 1;
  wire[at] = new_order_message_record.open_close; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.cmta_number[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.target_party_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.session_eligibility; at = at + 1;
  wire[at] = new_order_message_record.attributed_quote; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.display_range[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.stop_px[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 6 -> wire[at] = new_order_message_record.rout_strategy[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 3 -> wire[at] = new_order_message_record.route_delivery_method[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.ex_destination; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.auction_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.routing_firm_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> wire[at] = new_order_message_record.custom_group_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 16 -> wire[at] = new_order_message_record.clearing_optional_data[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.client_id_attr[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 6 -> wire[at] = new_order_message_record.frequent_trader_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.compression; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.floor_destination[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.floor_routing_inst; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 3 -> wire[at] = new_order_message_record.order_origin[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.order_router_subsidy; at = at + 1;
  wire[at] = new_order_message_record.price_type; at = at + 1;
  wire[at] = new_order_message_record.held; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> wire[at] = new_order_message_record.scratch_pad[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Message off the wire, 193 bytes from where the cursor stands */
inline decode_new_order_message(new_order_message_record) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 20 -> new_order_message_record.cl_ord_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.side = wire[at]; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.order_qty[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.clearing_firm[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.clearing_account[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.price[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.exec_inst = wire[at]; at = at + 1;
  new_order_message_record.ord_type = wire[at]; at = at + 1;
  new_order_message_record.time_in_force = wire[at]; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.min_qty[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.max_floor[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.symbol[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.capacity = wire[at]; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.routing_inst[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 16 -> new_order_message_record.account[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.display_indicator = wire[at]; at = at + 1;
  decode_prevent_match(new_order_message_record.prevent_match);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.expire_time[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.maturity_date[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.strike_price[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.put_or_call = wire[at]; at = at + 1;
  new_order_message_record.open_close = wire[at]; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.cmta_number[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.target_party_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.session_eligibility = wire[at]; at = at + 1;
  new_order_message_record.attributed_quote = wire[at]; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.display_range[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.stop_px[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 6 -> new_order_message_record.rout_strategy[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 3 -> new_order_message_record.route_delivery_method[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.ex_destination = wire[at]; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.auction_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.routing_firm_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> new_order_message_record.custom_group_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 16 -> new_order_message_record.clearing_optional_data[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.client_id_attr[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 6 -> new_order_message_record.frequent_trader_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.compression = wire[at]; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.floor_destination[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.floor_routing_inst = wire[at]; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 3 -> new_order_message_record.order_origin[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.order_router_subsidy = wire[at]; at = at + 1;
  new_order_message_record.price_type = wire[at]; at = at + 1;
  new_order_message_record.held = wire[at]; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> new_order_message_record.scratch_pad[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Message is what was written, byte for byte */
inline equal_new_order_message(new_order_message_read, new_order_message_written) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 20 -> assert(new_order_message_read.cl_ord_id[new_order_message_at] == new_order_message_written.cl_ord_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.side == new_order_message_written.side);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.order_qty[new_order_message_at] == new_order_message_written.order_qty[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.clearing_firm[new_order_message_at] == new_order_message_written.clearing_firm[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.clearing_account[new_order_message_at] == new_order_message_written.clearing_account[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.price[new_order_message_at] == new_order_message_written.price[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.exec_inst == new_order_message_written.exec_inst);
  assert(new_order_message_read.ord_type == new_order_message_written.ord_type);
  assert(new_order_message_read.time_in_force == new_order_message_written.time_in_force);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.min_qty[new_order_message_at] == new_order_message_written.min_qty[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.max_floor[new_order_message_at] == new_order_message_written.max_floor[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.symbol[new_order_message_at] == new_order_message_written.symbol[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.capacity == new_order_message_written.capacity);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.routing_inst[new_order_message_at] == new_order_message_written.routing_inst[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 16 -> assert(new_order_message_read.account[new_order_message_at] == new_order_message_written.account[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.display_indicator == new_order_message_written.display_indicator);
  equal_prevent_match(new_order_message_read.prevent_match, new_order_message_written.prevent_match);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.expire_time[new_order_message_at] == new_order_message_written.expire_time[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.maturity_date[new_order_message_at] == new_order_message_written.maturity_date[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.strike_price[new_order_message_at] == new_order_message_written.strike_price[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.put_or_call == new_order_message_written.put_or_call);
  assert(new_order_message_read.open_close == new_order_message_written.open_close);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.cmta_number[new_order_message_at] == new_order_message_written.cmta_number[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.target_party_id[new_order_message_at] == new_order_message_written.target_party_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.session_eligibility == new_order_message_written.session_eligibility);
  assert(new_order_message_read.attributed_quote == new_order_message_written.attributed_quote);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.display_range[new_order_message_at] == new_order_message_written.display_range[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.stop_px[new_order_message_at] == new_order_message_written.stop_px[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 6 -> assert(new_order_message_read.rout_strategy[new_order_message_at] == new_order_message_written.rout_strategy[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 3 -> assert(new_order_message_read.route_delivery_method[new_order_message_at] == new_order_message_written.route_delivery_method[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.ex_destination == new_order_message_written.ex_destination);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.auction_id[new_order_message_at] == new_order_message_written.auction_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.routing_firm_id[new_order_message_at] == new_order_message_written.routing_firm_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> assert(new_order_message_read.custom_group_id[new_order_message_at] == new_order_message_written.custom_group_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 16 -> assert(new_order_message_read.clearing_optional_data[new_order_message_at] == new_order_message_written.clearing_optional_data[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.client_id_attr[new_order_message_at] == new_order_message_written.client_id_attr[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 6 -> assert(new_order_message_read.frequent_trader_id[new_order_message_at] == new_order_message_written.frequent_trader_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.compression == new_order_message_written.compression);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.floor_destination[new_order_message_at] == new_order_message_written.floor_destination[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.floor_routing_inst == new_order_message_written.floor_routing_inst);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 3 -> assert(new_order_message_read.order_origin[new_order_message_at] == new_order_message_written.order_origin[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.order_router_subsidy == new_order_message_written.order_router_subsidy);
  assert(new_order_message_read.price_type == new_order_message_written.price_type);
  assert(new_order_message_read.held == new_order_message_written.held);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 2 -> assert(new_order_message_read.scratch_pad[new_order_message_at] == new_order_message_written.scratch_pad[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Order Short Message: 117 bytes -------------------------------------- */

/* Submission of a new simple (single leg) order to Cboe */
typedef NewOrderShortMessage {
  byte cl_ord_id[20];
  byte side;
  byte order_qty[4];
  byte clearing_firm[4];
  byte clearing_account[4];
  byte price[8];
  byte exec_inst;
  byte ord_type;
  byte time_in_force;
  byte min_qty[4];
  byte max_floor[4];
  byte symbol[8];
  byte capacity;
  byte routing_inst[4];
  byte account[16];
  byte display_indicator;
  PreventMatch prevent_match;
  byte open_close;
  byte cmta_number[4];
  byte session_eligibility;
  byte attributed_quote;
  byte rout_strategy[6];
  byte ex_destination;
  byte auction_id[8];
  byte custom_group_id[2];
  byte frequent_trader_id[6];
  byte scratch_pad[2]
};

int new_order_short_message_at;

/* every byte of New Order Short Message set to one value */
inline fill_new_order_short_message(new_order_short_message_record, new_order_short_message_value) {
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 20 -> new_order_short_message_record.cl_ord_id[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.side = new_order_short_message_value;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.order_qty[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.clearing_firm[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.clearing_account[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> new_order_short_message_record.price[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.exec_inst = new_order_short_message_value;
  new_order_short_message_record.ord_type = new_order_short_message_value;
  new_order_short_message_record.time_in_force = new_order_short_message_value;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.min_qty[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.max_floor[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> new_order_short_message_record.symbol[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.capacity = new_order_short_message_value;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.routing_inst[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 16 -> new_order_short_message_record.account[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.display_indicator = new_order_short_message_value;
  fill_prevent_match(new_order_short_message_record.prevent_match, new_order_short_message_value);
  new_order_short_message_record.open_close = new_order_short_message_value;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.cmta_number[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.session_eligibility = new_order_short_message_value;
  new_order_short_message_record.attributed_quote = new_order_short_message_value;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 6 -> new_order_short_message_record.rout_strategy[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.ex_destination = new_order_short_message_value;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> new_order_short_message_record.auction_id[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 2 -> new_order_short_message_record.custom_group_id[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 6 -> new_order_short_message_record.frequent_trader_id[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 2 -> new_order_short_message_record.scratch_pad[new_order_short_message_at] = new_order_short_message_value; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Short Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_short_message(new_order_short_message_record, new_order_short_message_base) {
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 20 -> new_order_short_message_record.cl_ord_id[new_order_short_message_at] = (new_order_short_message_base + 0 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.side = (new_order_short_message_base + 20 + 1) % 256;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.order_qty[new_order_short_message_at] = (new_order_short_message_base + 21 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.clearing_firm[new_order_short_message_at] = (new_order_short_message_base + 25 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.clearing_account[new_order_short_message_at] = (new_order_short_message_base + 29 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> new_order_short_message_record.price[new_order_short_message_at] = (new_order_short_message_base + 33 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.exec_inst = (new_order_short_message_base + 41 + 1) % 256;
  new_order_short_message_record.ord_type = (new_order_short_message_base + 42 + 1) % 256;
  new_order_short_message_record.time_in_force = (new_order_short_message_base + 43 + 1) % 256;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.min_qty[new_order_short_message_at] = (new_order_short_message_base + 44 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.max_floor[new_order_short_message_at] = (new_order_short_message_base + 48 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> new_order_short_message_record.symbol[new_order_short_message_at] = (new_order_short_message_base + 52 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.capacity = (new_order_short_message_base + 60 + 1) % 256;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.routing_inst[new_order_short_message_at] = (new_order_short_message_base + 61 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 16 -> new_order_short_message_record.account[new_order_short_message_at] = (new_order_short_message_base + 65 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.display_indicator = (new_order_short_message_base + 81 + 1) % 256;
  ramp_prevent_match(new_order_short_message_record.prevent_match, new_order_short_message_base + 82);
  new_order_short_message_record.open_close = (new_order_short_message_base + 85 + 1) % 256;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.cmta_number[new_order_short_message_at] = (new_order_short_message_base + 86 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.session_eligibility = (new_order_short_message_base + 90 + 1) % 256;
  new_order_short_message_record.attributed_quote = (new_order_short_message_base + 91 + 1) % 256;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 6 -> new_order_short_message_record.rout_strategy[new_order_short_message_at] = (new_order_short_message_base + 92 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.ex_destination = (new_order_short_message_base + 98 + 1) % 256;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> new_order_short_message_record.auction_id[new_order_short_message_at] = (new_order_short_message_base + 99 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 2 -> new_order_short_message_record.custom_group_id[new_order_short_message_at] = (new_order_short_message_base + 107 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 6 -> new_order_short_message_record.frequent_trader_id[new_order_short_message_at] = (new_order_short_message_base + 109 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 2 -> new_order_short_message_record.scratch_pad[new_order_short_message_at] = (new_order_short_message_base + 115 + new_order_short_message_at + 1) % 256; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Short Message to the wire, 117 bytes from where the cursor stands */
inline encode_new_order_short_message(new_order_short_message_record) {
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 20 -> wire[at] = new_order_short_message_record.cl_ord_id[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_message_record.side; at = at + 1;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> wire[at] = new_order_short_message_record.order_qty[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> wire[at] = new_order_short_message_record.clearing_firm[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> wire[at] = new_order_short_message_record.clearing_account[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> wire[at] = new_order_short_message_record.price[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_message_record.exec_inst; at = at + 1;
  wire[at] = new_order_short_message_record.ord_type; at = at + 1;
  wire[at] = new_order_short_message_record.time_in_force; at = at + 1;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> wire[at] = new_order_short_message_record.min_qty[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> wire[at] = new_order_short_message_record.max_floor[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> wire[at] = new_order_short_message_record.symbol[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_message_record.capacity; at = at + 1;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> wire[at] = new_order_short_message_record.routing_inst[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 16 -> wire[at] = new_order_short_message_record.account[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_message_record.display_indicator; at = at + 1;
  encode_prevent_match(new_order_short_message_record.prevent_match);
  wire[at] = new_order_short_message_record.open_close; at = at + 1;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> wire[at] = new_order_short_message_record.cmta_number[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_message_record.session_eligibility; at = at + 1;
  wire[at] = new_order_short_message_record.attributed_quote; at = at + 1;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 6 -> wire[at] = new_order_short_message_record.rout_strategy[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_message_record.ex_destination; at = at + 1;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> wire[at] = new_order_short_message_record.auction_id[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 2 -> wire[at] = new_order_short_message_record.custom_group_id[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 6 -> wire[at] = new_order_short_message_record.frequent_trader_id[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 2 -> wire[at] = new_order_short_message_record.scratch_pad[new_order_short_message_at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Short Message off the wire, 117 bytes from where the cursor stands */
inline decode_new_order_short_message(new_order_short_message_record) {
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 20 -> new_order_short_message_record.cl_ord_id[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.side = wire[at]; at = at + 1;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.order_qty[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.clearing_firm[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.clearing_account[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> new_order_short_message_record.price[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.exec_inst = wire[at]; at = at + 1;
  new_order_short_message_record.ord_type = wire[at]; at = at + 1;
  new_order_short_message_record.time_in_force = wire[at]; at = at + 1;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.min_qty[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.max_floor[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> new_order_short_message_record.symbol[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.capacity = wire[at]; at = at + 1;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.routing_inst[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 16 -> new_order_short_message_record.account[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.display_indicator = wire[at]; at = at + 1;
  decode_prevent_match(new_order_short_message_record.prevent_match);
  new_order_short_message_record.open_close = wire[at]; at = at + 1;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> new_order_short_message_record.cmta_number[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.session_eligibility = wire[at]; at = at + 1;
  new_order_short_message_record.attributed_quote = wire[at]; at = at + 1;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 6 -> new_order_short_message_record.rout_strategy[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_record.ex_destination = wire[at]; at = at + 1;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> new_order_short_message_record.auction_id[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 2 -> new_order_short_message_record.custom_group_id[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 6 -> new_order_short_message_record.frequent_trader_id[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 2 -> new_order_short_message_record.scratch_pad[new_order_short_message_at] = wire[at]; at = at + 1; new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Short Message is what was written, byte for byte */
inline equal_new_order_short_message(new_order_short_message_read, new_order_short_message_written) {
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 20 -> assert(new_order_short_message_read.cl_ord_id[new_order_short_message_at] == new_order_short_message_written.cl_ord_id[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  assert(new_order_short_message_read.side == new_order_short_message_written.side);
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> assert(new_order_short_message_read.order_qty[new_order_short_message_at] == new_order_short_message_written.order_qty[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> assert(new_order_short_message_read.clearing_firm[new_order_short_message_at] == new_order_short_message_written.clearing_firm[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> assert(new_order_short_message_read.clearing_account[new_order_short_message_at] == new_order_short_message_written.clearing_account[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> assert(new_order_short_message_read.price[new_order_short_message_at] == new_order_short_message_written.price[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  assert(new_order_short_message_read.exec_inst == new_order_short_message_written.exec_inst);
  assert(new_order_short_message_read.ord_type == new_order_short_message_written.ord_type);
  assert(new_order_short_message_read.time_in_force == new_order_short_message_written.time_in_force);
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> assert(new_order_short_message_read.min_qty[new_order_short_message_at] == new_order_short_message_written.min_qty[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> assert(new_order_short_message_read.max_floor[new_order_short_message_at] == new_order_short_message_written.max_floor[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> assert(new_order_short_message_read.symbol[new_order_short_message_at] == new_order_short_message_written.symbol[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  assert(new_order_short_message_read.capacity == new_order_short_message_written.capacity);
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> assert(new_order_short_message_read.routing_inst[new_order_short_message_at] == new_order_short_message_written.routing_inst[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 16 -> assert(new_order_short_message_read.account[new_order_short_message_at] == new_order_short_message_written.account[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  assert(new_order_short_message_read.display_indicator == new_order_short_message_written.display_indicator);
  equal_prevent_match(new_order_short_message_read.prevent_match, new_order_short_message_written.prevent_match);
  assert(new_order_short_message_read.open_close == new_order_short_message_written.open_close);
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 4 -> assert(new_order_short_message_read.cmta_number[new_order_short_message_at] == new_order_short_message_written.cmta_number[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  assert(new_order_short_message_read.session_eligibility == new_order_short_message_written.session_eligibility);
  assert(new_order_short_message_read.attributed_quote == new_order_short_message_written.attributed_quote);
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 6 -> assert(new_order_short_message_read.rout_strategy[new_order_short_message_at] == new_order_short_message_written.rout_strategy[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  assert(new_order_short_message_read.ex_destination == new_order_short_message_written.ex_destination);
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 8 -> assert(new_order_short_message_read.auction_id[new_order_short_message_at] == new_order_short_message_written.auction_id[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 2 -> assert(new_order_short_message_read.custom_group_id[new_order_short_message_at] == new_order_short_message_written.custom_group_id[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 6 -> assert(new_order_short_message_read.frequent_trader_id[new_order_short_message_at] == new_order_short_message_written.frequent_trader_id[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  new_order_short_message_at = 0;
  do
  :: new_order_short_message_at < 2 -> assert(new_order_short_message_read.scratch_pad[new_order_short_message_at] == new_order_short_message_written.scratch_pad[new_order_short_message_at]); new_order_short_message_at = new_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order Message: 30 bytes ------------------------------------------ */

/* Request to cancel a single order */
typedef CancelOrderMessage {
  byte orig_cl_ord_id[20];
  byte clearing_firm[4];
  byte routing_firm_id[4];
  byte scratch_pad[2]
};

int cancel_order_message_at;

/* every byte of Cancel Order Message set to one value */
inline fill_cancel_order_message(cancel_order_message_record, cancel_order_message_value) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 20 -> cancel_order_message_record.orig_cl_ord_id[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.clearing_firm[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.routing_firm_id[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 2 -> cancel_order_message_record.scratch_pad[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_message(cancel_order_message_record, cancel_order_message_base) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 20 -> cancel_order_message_record.orig_cl_ord_id[cancel_order_message_at] = (cancel_order_message_base + 0 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.clearing_firm[cancel_order_message_at] = (cancel_order_message_base + 20 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.routing_firm_id[cancel_order_message_at] = (cancel_order_message_base + 24 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 2 -> cancel_order_message_record.scratch_pad[cancel_order_message_at] = (cancel_order_message_base + 28 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message to the wire, 30 bytes from where the cursor stands */
inline encode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 20 -> wire[at] = cancel_order_message_record.orig_cl_ord_id[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> wire[at] = cancel_order_message_record.clearing_firm[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> wire[at] = cancel_order_message_record.routing_firm_id[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 2 -> wire[at] = cancel_order_message_record.scratch_pad[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message off the wire, 30 bytes from where the cursor stands */
inline decode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 20 -> cancel_order_message_record.orig_cl_ord_id[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.clearing_firm[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.routing_firm_id[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 2 -> cancel_order_message_record.scratch_pad[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Message is what was written, byte for byte */
inline equal_cancel_order_message(cancel_order_message_read, cancel_order_message_written) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 20 -> assert(cancel_order_message_read.orig_cl_ord_id[cancel_order_message_at] == cancel_order_message_written.orig_cl_ord_id[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> assert(cancel_order_message_read.clearing_firm[cancel_order_message_at] == cancel_order_message_written.clearing_firm[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> assert(cancel_order_message_read.routing_firm_id[cancel_order_message_at] == cancel_order_message_written.routing_firm_id[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 2 -> assert(cancel_order_message_read.scratch_pad[cancel_order_message_at] == cancel_order_message_written.scratch_pad[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Inst: 8 bytes ----------------------------------------------- */

typedef MassCancelInst {
  byte clearing_firm_filter;
  byte acknowledgement_style;
  byte lockout_instruction;
  byte instrument_type_filter;
  byte gtc_order_filter;
  byte instruction_details[3]
};

int mass_cancel_inst_at;

/* every byte of Mass Cancel Inst set to one value */
inline fill_mass_cancel_inst(mass_cancel_inst_record, mass_cancel_inst_value) {
  mass_cancel_inst_record.clearing_firm_filter = mass_cancel_inst_value;
  mass_cancel_inst_record.acknowledgement_style = mass_cancel_inst_value;
  mass_cancel_inst_record.lockout_instruction = mass_cancel_inst_value;
  mass_cancel_inst_record.instrument_type_filter = mass_cancel_inst_value;
  mass_cancel_inst_record.gtc_order_filter = mass_cancel_inst_value;
  mass_cancel_inst_at = 0;
  do
  :: mass_cancel_inst_at < 3 -> mass_cancel_inst_record.instruction_details[mass_cancel_inst_at] = mass_cancel_inst_value; mass_cancel_inst_at = mass_cancel_inst_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Inst set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_inst(mass_cancel_inst_record, mass_cancel_inst_base) {
  mass_cancel_inst_record.clearing_firm_filter = (mass_cancel_inst_base + 0 + 1) % 256;
  mass_cancel_inst_record.acknowledgement_style = (mass_cancel_inst_base + 1 + 1) % 256;
  mass_cancel_inst_record.lockout_instruction = (mass_cancel_inst_base + 2 + 1) % 256;
  mass_cancel_inst_record.instrument_type_filter = (mass_cancel_inst_base + 3 + 1) % 256;
  mass_cancel_inst_record.gtc_order_filter = (mass_cancel_inst_base + 4 + 1) % 256;
  mass_cancel_inst_at = 0;
  do
  :: mass_cancel_inst_at < 3 -> mass_cancel_inst_record.instruction_details[mass_cancel_inst_at] = (mass_cancel_inst_base + 5 + mass_cancel_inst_at + 1) % 256; mass_cancel_inst_at = mass_cancel_inst_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Inst to the wire, 8 bytes from where the cursor stands */
inline encode_mass_cancel_inst(mass_cancel_inst_record) {
  wire[at] = mass_cancel_inst_record.clearing_firm_filter; at = at + 1;
  wire[at] = mass_cancel_inst_record.acknowledgement_style; at = at + 1;
  wire[at] = mass_cancel_inst_record.lockout_instruction; at = at + 1;
  wire[at] = mass_cancel_inst_record.instrument_type_filter; at = at + 1;
  wire[at] = mass_cancel_inst_record.gtc_order_filter; at = at + 1;
  mass_cancel_inst_at = 0;
  do
  :: mass_cancel_inst_at < 3 -> wire[at] = mass_cancel_inst_record.instruction_details[mass_cancel_inst_at]; at = at + 1; mass_cancel_inst_at = mass_cancel_inst_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Inst off the wire, 8 bytes from where the cursor stands */
inline decode_mass_cancel_inst(mass_cancel_inst_record) {
  mass_cancel_inst_record.clearing_firm_filter = wire[at]; at = at + 1;
  mass_cancel_inst_record.acknowledgement_style = wire[at]; at = at + 1;
  mass_cancel_inst_record.lockout_instruction = wire[at]; at = at + 1;
  mass_cancel_inst_record.instrument_type_filter = wire[at]; at = at + 1;
  mass_cancel_inst_record.gtc_order_filter = wire[at]; at = at + 1;
  mass_cancel_inst_at = 0;
  do
  :: mass_cancel_inst_at < 3 -> mass_cancel_inst_record.instruction_details[mass_cancel_inst_at] = wire[at]; at = at + 1; mass_cancel_inst_at = mass_cancel_inst_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Inst is what was written, byte for byte */
inline equal_mass_cancel_inst(mass_cancel_inst_read, mass_cancel_inst_written) {
  assert(mass_cancel_inst_read.clearing_firm_filter == mass_cancel_inst_written.clearing_firm_filter);
  assert(mass_cancel_inst_read.acknowledgement_style == mass_cancel_inst_written.acknowledgement_style);
  assert(mass_cancel_inst_read.lockout_instruction == mass_cancel_inst_written.lockout_instruction);
  assert(mass_cancel_inst_read.instrument_type_filter == mass_cancel_inst_written.instrument_type_filter);
  assert(mass_cancel_inst_read.gtc_order_filter == mass_cancel_inst_written.gtc_order_filter);
  mass_cancel_inst_at = 0;
  do
  :: mass_cancel_inst_at < 3 -> assert(mass_cancel_inst_read.instruction_details[mass_cancel_inst_at] == mass_cancel_inst_written.instruction_details[mass_cancel_inst_at]); mass_cancel_inst_at = mass_cancel_inst_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Order Message: 52 bytes ------------------------------------- */

/* MassCancelOrderMessage */
typedef MassCancelOrderMessage {
  byte mass_cancel_id[20];
  byte clearing_firm[4];
  byte routing_firm_id[4];
  byte risk_root[6];
  MassCancelInst mass_cancel_inst;
  byte send_time[8];
  byte scratch_pad[2]
};

int mass_cancel_order_message_at;

/* every byte of Mass Cancel Order Message set to one value */
inline fill_mass_cancel_order_message(mass_cancel_order_message_record, mass_cancel_order_message_value) {
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 20 -> mass_cancel_order_message_record.mass_cancel_id[mass_cancel_order_message_at] = mass_cancel_order_message_value; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> mass_cancel_order_message_record.clearing_firm[mass_cancel_order_message_at] = mass_cancel_order_message_value; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> mass_cancel_order_message_record.routing_firm_id[mass_cancel_order_message_at] = mass_cancel_order_message_value; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 6 -> mass_cancel_order_message_record.risk_root[mass_cancel_order_message_at] = mass_cancel_order_message_value; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  fill_mass_cancel_inst(mass_cancel_order_message_record.mass_cancel_inst, mass_cancel_order_message_value);
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> mass_cancel_order_message_record.send_time[mass_cancel_order_message_at] = mass_cancel_order_message_value; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 2 -> mass_cancel_order_message_record.scratch_pad[mass_cancel_order_message_at] = mass_cancel_order_message_value; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Order Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_order_message(mass_cancel_order_message_record, mass_cancel_order_message_base) {
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 20 -> mass_cancel_order_message_record.mass_cancel_id[mass_cancel_order_message_at] = (mass_cancel_order_message_base + 0 + mass_cancel_order_message_at + 1) % 256; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> mass_cancel_order_message_record.clearing_firm[mass_cancel_order_message_at] = (mass_cancel_order_message_base + 20 + mass_cancel_order_message_at + 1) % 256; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> mass_cancel_order_message_record.routing_firm_id[mass_cancel_order_message_at] = (mass_cancel_order_message_base + 24 + mass_cancel_order_message_at + 1) % 256; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 6 -> mass_cancel_order_message_record.risk_root[mass_cancel_order_message_at] = (mass_cancel_order_message_base + 28 + mass_cancel_order_message_at + 1) % 256; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  ramp_mass_cancel_inst(mass_cancel_order_message_record.mass_cancel_inst, mass_cancel_order_message_base + 34);
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> mass_cancel_order_message_record.send_time[mass_cancel_order_message_at] = (mass_cancel_order_message_base + 42 + mass_cancel_order_message_at + 1) % 256; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 2 -> mass_cancel_order_message_record.scratch_pad[mass_cancel_order_message_at] = (mass_cancel_order_message_base + 50 + mass_cancel_order_message_at + 1) % 256; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Order Message to the wire, 52 bytes from where the cursor stands */
inline encode_mass_cancel_order_message(mass_cancel_order_message_record) {
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 20 -> wire[at] = mass_cancel_order_message_record.mass_cancel_id[mass_cancel_order_message_at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> wire[at] = mass_cancel_order_message_record.clearing_firm[mass_cancel_order_message_at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> wire[at] = mass_cancel_order_message_record.routing_firm_id[mass_cancel_order_message_at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 6 -> wire[at] = mass_cancel_order_message_record.risk_root[mass_cancel_order_message_at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  encode_mass_cancel_inst(mass_cancel_order_message_record.mass_cancel_inst);
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> wire[at] = mass_cancel_order_message_record.send_time[mass_cancel_order_message_at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 2 -> wire[at] = mass_cancel_order_message_record.scratch_pad[mass_cancel_order_message_at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Order Message off the wire, 52 bytes from where the cursor stands */
inline decode_mass_cancel_order_message(mass_cancel_order_message_record) {
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 20 -> mass_cancel_order_message_record.mass_cancel_id[mass_cancel_order_message_at] = wire[at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> mass_cancel_order_message_record.clearing_firm[mass_cancel_order_message_at] = wire[at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> mass_cancel_order_message_record.routing_firm_id[mass_cancel_order_message_at] = wire[at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 6 -> mass_cancel_order_message_record.risk_root[mass_cancel_order_message_at] = wire[at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  decode_mass_cancel_inst(mass_cancel_order_message_record.mass_cancel_inst);
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> mass_cancel_order_message_record.send_time[mass_cancel_order_message_at] = wire[at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 2 -> mass_cancel_order_message_record.scratch_pad[mass_cancel_order_message_at] = wire[at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Order Message is what was written, byte for byte */
inline equal_mass_cancel_order_message(mass_cancel_order_message_read, mass_cancel_order_message_written) {
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 20 -> assert(mass_cancel_order_message_read.mass_cancel_id[mass_cancel_order_message_at] == mass_cancel_order_message_written.mass_cancel_id[mass_cancel_order_message_at]); mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> assert(mass_cancel_order_message_read.clearing_firm[mass_cancel_order_message_at] == mass_cancel_order_message_written.clearing_firm[mass_cancel_order_message_at]); mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> assert(mass_cancel_order_message_read.routing_firm_id[mass_cancel_order_message_at] == mass_cancel_order_message_written.routing_firm_id[mass_cancel_order_message_at]); mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 6 -> assert(mass_cancel_order_message_read.risk_root[mass_cancel_order_message_at] == mass_cancel_order_message_written.risk_root[mass_cancel_order_message_at]); mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  equal_mass_cancel_inst(mass_cancel_order_message_read.mass_cancel_inst, mass_cancel_order_message_written.mass_cancel_inst);
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> assert(mass_cancel_order_message_read.send_time[mass_cancel_order_message_at] == mass_cancel_order_message_written.send_time[mass_cancel_order_message_at]); mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 2 -> assert(mass_cancel_order_message_read.scratch_pad[mass_cancel_order_message_at] == mass_cancel_order_message_written.scratch_pad[mass_cancel_order_message_at]); mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Message: 117 bytes ----------------------------------------- */

/* Request to modify an order */
typedef ModifyOrderMessage {
  byte cl_ord_id[20];
  byte orig_cl_ord_id[20];
  byte clearing_firm[4];
  byte routing_firm_id[4];
  byte order_qty[4];
  byte price[8];
  byte ord_type;
  byte max_floor[4];
  byte stop_px[8];
  byte cancel_orig_on_reject;
  byte reserved[41];
  byte scratch_pad[2]
};

int modify_order_message_at;

/* every byte of Modify Order Message set to one value */
inline fill_modify_order_message(modify_order_message_record, modify_order_message_value) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 20 -> modify_order_message_record.cl_ord_id[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 20 -> modify_order_message_record.orig_cl_ord_id[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.clearing_firm[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.routing_firm_id[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.order_qty[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.price[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.ord_type = modify_order_message_value;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.max_floor[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.stop_px[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.cancel_orig_on_reject = modify_order_message_value;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 41 -> modify_order_message_record.reserved[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> modify_order_message_record.scratch_pad[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_message(modify_order_message_record, modify_order_message_base) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 20 -> modify_order_message_record.cl_ord_id[modify_order_message_at] = (modify_order_message_base + 0 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 20 -> modify_order_message_record.orig_cl_ord_id[modify_order_message_at] = (modify_order_message_base + 20 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.clearing_firm[modify_order_message_at] = (modify_order_message_base + 40 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.routing_firm_id[modify_order_message_at] = (modify_order_message_base + 44 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.order_qty[modify_order_message_at] = (modify_order_message_base + 48 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.price[modify_order_message_at] = (modify_order_message_base + 52 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.ord_type = (modify_order_message_base + 60 + 1) % 256;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.max_floor[modify_order_message_at] = (modify_order_message_base + 61 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.stop_px[modify_order_message_at] = (modify_order_message_base + 65 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.cancel_orig_on_reject = (modify_order_message_base + 73 + 1) % 256;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 41 -> modify_order_message_record.reserved[modify_order_message_at] = (modify_order_message_base + 74 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> modify_order_message_record.scratch_pad[modify_order_message_at] = (modify_order_message_base + 115 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Message to the wire, 117 bytes from where the cursor stands */
inline encode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 20 -> wire[at] = modify_order_message_record.cl_ord_id[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 20 -> wire[at] = modify_order_message_record.orig_cl_ord_id[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.clearing_firm[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.routing_firm_id[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.order_qty[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> wire[at] = modify_order_message_record.price[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_message_record.ord_type; at = at + 1;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.max_floor[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> wire[at] = modify_order_message_record.stop_px[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_message_record.cancel_orig_on_reject; at = at + 1;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 41 -> wire[at] = modify_order_message_record.reserved[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> wire[at] = modify_order_message_record.scratch_pad[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Message off the wire, 117 bytes from where the cursor stands */
inline decode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 20 -> modify_order_message_record.cl_ord_id[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 20 -> modify_order_message_record.orig_cl_ord_id[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.clearing_firm[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.routing_firm_id[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.order_qty[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.price[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.ord_type = wire[at]; at = at + 1;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.max_floor[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.stop_px[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.cancel_orig_on_reject = wire[at]; at = at + 1;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 41 -> modify_order_message_record.reserved[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> modify_order_message_record.scratch_pad[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order Message is what was written, byte for byte */
inline equal_modify_order_message(modify_order_message_read, modify_order_message_written) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 20 -> assert(modify_order_message_read.cl_ord_id[modify_order_message_at] == modify_order_message_written.cl_ord_id[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 20 -> assert(modify_order_message_read.orig_cl_ord_id[modify_order_message_at] == modify_order_message_written.orig_cl_ord_id[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.clearing_firm[modify_order_message_at] == modify_order_message_written.clearing_firm[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.routing_firm_id[modify_order_message_at] == modify_order_message_written.routing_firm_id[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.order_qty[modify_order_message_at] == modify_order_message_written.order_qty[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> assert(modify_order_message_read.price[modify_order_message_at] == modify_order_message_written.price[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  assert(modify_order_message_read.ord_type == modify_order_message_written.ord_type);
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.max_floor[modify_order_message_at] == modify_order_message_written.max_floor[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> assert(modify_order_message_read.stop_px[modify_order_message_at] == modify_order_message_written.stop_px[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  assert(modify_order_message_read.cancel_orig_on_reject == modify_order_message_written.cancel_orig_on_reject);
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 41 -> assert(modify_order_message_read.reserved[modify_order_message_at] == modify_order_message_written.reserved[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 2 -> assert(modify_order_message_read.scratch_pad[modify_order_message_at] == modify_order_message_written.scratch_pad[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reset Risk Message: 39 bytes -------------------------------------------- */

/* Reset or release Firm, Risk Root, or Custom Group ID level lockout conditions resulting from risk profile trips or self-imposed lockouts issued via Cancel Order or Purge Orders messages */
typedef ResetRiskMessage {
  byte risk_status_id[16];
  byte risk_reset[8];
  byte clearing_firm[4];
  byte risk_root[6];
  byte target_matching_unit;
  byte custom_group_id[2];
  byte scratch_pad[2]
};

int reset_risk_message_at;

/* every byte of Reset Risk Message set to one value */
inline fill_reset_risk_message(reset_risk_message_record, reset_risk_message_value) {
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 16 -> reset_risk_message_record.risk_status_id[reset_risk_message_at] = reset_risk_message_value; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 8 -> reset_risk_message_record.risk_reset[reset_risk_message_at] = reset_risk_message_value; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 4 -> reset_risk_message_record.clearing_firm[reset_risk_message_at] = reset_risk_message_value; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 6 -> reset_risk_message_record.risk_root[reset_risk_message_at] = reset_risk_message_value; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_record.target_matching_unit = reset_risk_message_value;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 2 -> reset_risk_message_record.custom_group_id[reset_risk_message_at] = reset_risk_message_value; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 2 -> reset_risk_message_record.scratch_pad[reset_risk_message_at] = reset_risk_message_value; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reset Risk Message set to where it lies, so a field read out of place says so */
inline ramp_reset_risk_message(reset_risk_message_record, reset_risk_message_base) {
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 16 -> reset_risk_message_record.risk_status_id[reset_risk_message_at] = (reset_risk_message_base + 0 + reset_risk_message_at + 1) % 256; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 8 -> reset_risk_message_record.risk_reset[reset_risk_message_at] = (reset_risk_message_base + 16 + reset_risk_message_at + 1) % 256; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 4 -> reset_risk_message_record.clearing_firm[reset_risk_message_at] = (reset_risk_message_base + 24 + reset_risk_message_at + 1) % 256; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 6 -> reset_risk_message_record.risk_root[reset_risk_message_at] = (reset_risk_message_base + 28 + reset_risk_message_at + 1) % 256; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_record.target_matching_unit = (reset_risk_message_base + 34 + 1) % 256;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 2 -> reset_risk_message_record.custom_group_id[reset_risk_message_at] = (reset_risk_message_base + 35 + reset_risk_message_at + 1) % 256; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 2 -> reset_risk_message_record.scratch_pad[reset_risk_message_at] = (reset_risk_message_base + 37 + reset_risk_message_at + 1) % 256; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Risk Message to the wire, 39 bytes from where the cursor stands */
inline encode_reset_risk_message(reset_risk_message_record) {
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 16 -> wire[at] = reset_risk_message_record.risk_status_id[reset_risk_message_at]; at = at + 1; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 8 -> wire[at] = reset_risk_message_record.risk_reset[reset_risk_message_at]; at = at + 1; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 4 -> wire[at] = reset_risk_message_record.clearing_firm[reset_risk_message_at]; at = at + 1; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 6 -> wire[at] = reset_risk_message_record.risk_root[reset_risk_message_at]; at = at + 1; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  wire[at] = reset_risk_message_record.target_matching_unit; at = at + 1;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 2 -> wire[at] = reset_risk_message_record.custom_group_id[reset_risk_message_at]; at = at + 1; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 2 -> wire[at] = reset_risk_message_record.scratch_pad[reset_risk_message_at]; at = at + 1; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Risk Message off the wire, 39 bytes from where the cursor stands */
inline decode_reset_risk_message(reset_risk_message_record) {
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 16 -> reset_risk_message_record.risk_status_id[reset_risk_message_at] = wire[at]; at = at + 1; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 8 -> reset_risk_message_record.risk_reset[reset_risk_message_at] = wire[at]; at = at + 1; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 4 -> reset_risk_message_record.clearing_firm[reset_risk_message_at] = wire[at]; at = at + 1; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 6 -> reset_risk_message_record.risk_root[reset_risk_message_at] = wire[at]; at = at + 1; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_record.target_matching_unit = wire[at]; at = at + 1;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 2 -> reset_risk_message_record.custom_group_id[reset_risk_message_at] = wire[at]; at = at + 1; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 2 -> reset_risk_message_record.scratch_pad[reset_risk_message_at] = wire[at]; at = at + 1; reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reset Risk Message is what was written, byte for byte */
inline equal_reset_risk_message(reset_risk_message_read, reset_risk_message_written) {
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 16 -> assert(reset_risk_message_read.risk_status_id[reset_risk_message_at] == reset_risk_message_written.risk_status_id[reset_risk_message_at]); reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 8 -> assert(reset_risk_message_read.risk_reset[reset_risk_message_at] == reset_risk_message_written.risk_reset[reset_risk_message_at]); reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 4 -> assert(reset_risk_message_read.clearing_firm[reset_risk_message_at] == reset_risk_message_written.clearing_firm[reset_risk_message_at]); reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 6 -> assert(reset_risk_message_read.risk_root[reset_risk_message_at] == reset_risk_message_written.risk_root[reset_risk_message_at]); reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  assert(reset_risk_message_read.target_matching_unit == reset_risk_message_written.target_matching_unit);
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 2 -> assert(reset_risk_message_read.custom_group_id[reset_risk_message_at] == reset_risk_message_written.custom_group_id[reset_risk_message_at]); reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  reset_risk_message_at = 0;
  do
  :: reset_risk_message_at < 2 -> assert(reset_risk_message_read.scratch_pad[reset_risk_message_at] == reset_risk_message_written.scratch_pad[reset_risk_message_at]); reset_risk_message_at = reset_risk_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Firm Message Header: encoded, read back, and compared */
proctype check_firm_message_header() {
  FirmMessageHeader firm_message_header_sent;
  FirmMessageHeader firm_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_firm_message_header(firm_message_header_sent, 0)
  :: pattern == 1 -> fill_firm_message_header(firm_message_header_sent, 32)
  :: pattern == 2 -> fill_firm_message_header(firm_message_header_sent, 255)
  :: else -> ramp_firm_message_header(firm_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_firm_message_header(firm_message_header_sent);
    assert(at == 12);
    at = 0;
    decode_firm_message_header(firm_message_header_got);
    assert(at == 12);
    equal_firm_message_header(firm_message_header_got, firm_message_header_sent)
  }
}

/* Prevent Match: encoded, read back, and compared */
proctype check_prevent_match() {
  PreventMatch prevent_match_sent;
  PreventMatch prevent_match_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_prevent_match(prevent_match_sent, 0)
  :: pattern == 1 -> fill_prevent_match(prevent_match_sent, 32)
  :: pattern == 2 -> fill_prevent_match(prevent_match_sent, 255)
  :: else -> ramp_prevent_match(prevent_match_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_prevent_match(prevent_match_sent);
    assert(at == 3);
    at = 0;
    decode_prevent_match(prevent_match_got);
    assert(at == 3);
    equal_prevent_match(prevent_match_got, prevent_match_sent)
  }
}

/* New Order Message: encoded, read back, and compared */
proctype check_new_order_message() {
  NewOrderMessage new_order_message_sent;
  NewOrderMessage new_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_message(new_order_message_sent, 0)
  :: pattern == 1 -> fill_new_order_message(new_order_message_sent, 32)
  :: pattern == 2 -> fill_new_order_message(new_order_message_sent, 255)
  :: else -> ramp_new_order_message(new_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_message(new_order_message_sent);
    assert(at == 193);
    at = 0;
    decode_new_order_message(new_order_message_got);
    assert(at == 193);
    equal_new_order_message(new_order_message_got, new_order_message_sent)
  }
}

/* New Order Short Message: encoded, read back, and compared */
proctype check_new_order_short_message() {
  NewOrderShortMessage new_order_short_message_sent;
  NewOrderShortMessage new_order_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_short_message(new_order_short_message_sent, 0)
  :: pattern == 1 -> fill_new_order_short_message(new_order_short_message_sent, 32)
  :: pattern == 2 -> fill_new_order_short_message(new_order_short_message_sent, 255)
  :: else -> ramp_new_order_short_message(new_order_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_short_message(new_order_short_message_sent);
    assert(at == 117);
    at = 0;
    decode_new_order_short_message(new_order_short_message_got);
    assert(at == 117);
    equal_new_order_short_message(new_order_short_message_got, new_order_short_message_sent)
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
    assert(at == 30);
    at = 0;
    decode_cancel_order_message(cancel_order_message_got);
    assert(at == 30);
    equal_cancel_order_message(cancel_order_message_got, cancel_order_message_sent)
  }
}

/* Mass Cancel Inst: encoded, read back, and compared */
proctype check_mass_cancel_inst() {
  MassCancelInst mass_cancel_inst_sent;
  MassCancelInst mass_cancel_inst_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_inst(mass_cancel_inst_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_inst(mass_cancel_inst_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_inst(mass_cancel_inst_sent, 255)
  :: else -> ramp_mass_cancel_inst(mass_cancel_inst_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_inst(mass_cancel_inst_sent);
    assert(at == 8);
    at = 0;
    decode_mass_cancel_inst(mass_cancel_inst_got);
    assert(at == 8);
    equal_mass_cancel_inst(mass_cancel_inst_got, mass_cancel_inst_sent)
  }
}

/* Mass Cancel Order Message: encoded, read back, and compared */
proctype check_mass_cancel_order_message() {
  MassCancelOrderMessage mass_cancel_order_message_sent;
  MassCancelOrderMessage mass_cancel_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_order_message(mass_cancel_order_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_order_message(mass_cancel_order_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_order_message(mass_cancel_order_message_sent, 255)
  :: else -> ramp_mass_cancel_order_message(mass_cancel_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_order_message(mass_cancel_order_message_sent);
    assert(at == 52);
    at = 0;
    decode_mass_cancel_order_message(mass_cancel_order_message_got);
    assert(at == 52);
    equal_mass_cancel_order_message(mass_cancel_order_message_got, mass_cancel_order_message_sent)
  }
}

/* Modify Order Message: encoded, read back, and compared */
proctype check_modify_order_message() {
  ModifyOrderMessage modify_order_message_sent;
  ModifyOrderMessage modify_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_message(modify_order_message_sent, 0)
  :: pattern == 1 -> fill_modify_order_message(modify_order_message_sent, 32)
  :: pattern == 2 -> fill_modify_order_message(modify_order_message_sent, 255)
  :: else -> ramp_modify_order_message(modify_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_message(modify_order_message_sent);
    assert(at == 117);
    at = 0;
    decode_modify_order_message(modify_order_message_got);
    assert(at == 117);
    equal_modify_order_message(modify_order_message_got, modify_order_message_sent)
  }
}

/* Reset Risk Message: encoded, read back, and compared */
proctype check_reset_risk_message() {
  ResetRiskMessage reset_risk_message_sent;
  ResetRiskMessage reset_risk_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reset_risk_message(reset_risk_message_sent, 0)
  :: pattern == 1 -> fill_reset_risk_message(reset_risk_message_sent, 32)
  :: pattern == 2 -> fill_reset_risk_message(reset_risk_message_sent, 255)
  :: else -> ramp_reset_risk_message(reset_risk_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reset_risk_message(reset_risk_message_sent);
    assert(at == 39);
    at = 0;
    decode_reset_risk_message(reset_risk_message_got);
    assert(at == 39);
    equal_reset_risk_message(reset_risk_message_got, reset_risk_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_firm_message_header()
  :: run check_prevent_match()
  :: run check_new_order_message()
  :: run check_new_order_short_message()
  :: run check_cancel_order_message()
  :: run check_mass_cancel_inst()
  :: run check_mass_cancel_order_message()
  :: run check_modify_order_message()
  :: run check_reset_risk_message()
  fi
}
