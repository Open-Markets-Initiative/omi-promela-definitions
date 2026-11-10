/*
 * Chicago Board Options Exchange Futures Binary Order Entry
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
#define WIRE 131

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

/* ---- New Order: 131 bytes ---------------------------------------------------- */

/* New order futures message */
typedef NewOrder {
  byte cl_ord_id[20];
  byte side;
  byte order_qty[4];
  byte clearing_firm[4];
  byte clearing_account[4];
  byte price[8];
  byte ord_type;
  byte time_in_force;
  byte min_qty[4];
  byte symbol[8];
  byte capacity;
  byte account[16];
  PreventMatch prevent_match;
  byte expire_time[8];
  byte maturity_date[4];
  byte open_close;
  byte cmta_number[4];
  byte stop_px[8];
  byte custom_group_id[2];
  byte cti_code;
  byte manual_order_indicator;
  byte oeo_id[18];
  byte frequent_trader_id[6];
  byte cust_order_handling_inst;
  byte country_code[2]
};

int new_order_at;

/* every byte of New Order set to one value */
inline fill_new_order(new_order_record, new_order_value) {
  new_order_at = 0;
  do
  :: new_order_at < 20 -> new_order_record.cl_ord_id[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.side = new_order_value;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.order_qty[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.clearing_firm[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.clearing_account[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> new_order_record.price[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.ord_type = new_order_value;
  new_order_record.time_in_force = new_order_value;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.min_qty[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> new_order_record.symbol[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.capacity = new_order_value;
  new_order_at = 0;
  do
  :: new_order_at < 16 -> new_order_record.account[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  fill_prevent_match(new_order_record.prevent_match, new_order_value);
  new_order_at = 0;
  do
  :: new_order_at < 8 -> new_order_record.expire_time[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.maturity_date[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.open_close = new_order_value;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.cmta_number[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> new_order_record.stop_px[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 2 -> new_order_record.custom_group_id[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.cti_code = new_order_value;
  new_order_record.manual_order_indicator = new_order_value;
  new_order_at = 0;
  do
  :: new_order_at < 18 -> new_order_record.oeo_id[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 6 -> new_order_record.frequent_trader_id[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.cust_order_handling_inst = new_order_value;
  new_order_at = 0;
  do
  :: new_order_at < 2 -> new_order_record.country_code[new_order_at] = new_order_value; new_order_at = new_order_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order set to where it lies, so a field read out of place says so */
inline ramp_new_order(new_order_record, new_order_base) {
  new_order_at = 0;
  do
  :: new_order_at < 20 -> new_order_record.cl_ord_id[new_order_at] = (new_order_base + 0 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.side = (new_order_base + 20 + 1) % 256;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.order_qty[new_order_at] = (new_order_base + 21 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.clearing_firm[new_order_at] = (new_order_base + 25 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.clearing_account[new_order_at] = (new_order_base + 29 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> new_order_record.price[new_order_at] = (new_order_base + 33 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.ord_type = (new_order_base + 41 + 1) % 256;
  new_order_record.time_in_force = (new_order_base + 42 + 1) % 256;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.min_qty[new_order_at] = (new_order_base + 43 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> new_order_record.symbol[new_order_at] = (new_order_base + 47 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.capacity = (new_order_base + 55 + 1) % 256;
  new_order_at = 0;
  do
  :: new_order_at < 16 -> new_order_record.account[new_order_at] = (new_order_base + 56 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  ramp_prevent_match(new_order_record.prevent_match, new_order_base + 72);
  new_order_at = 0;
  do
  :: new_order_at < 8 -> new_order_record.expire_time[new_order_at] = (new_order_base + 75 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.maturity_date[new_order_at] = (new_order_base + 83 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.open_close = (new_order_base + 87 + 1) % 256;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.cmta_number[new_order_at] = (new_order_base + 88 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> new_order_record.stop_px[new_order_at] = (new_order_base + 92 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 2 -> new_order_record.custom_group_id[new_order_at] = (new_order_base + 100 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.cti_code = (new_order_base + 102 + 1) % 256;
  new_order_record.manual_order_indicator = (new_order_base + 103 + 1) % 256;
  new_order_at = 0;
  do
  :: new_order_at < 18 -> new_order_record.oeo_id[new_order_at] = (new_order_base + 104 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 6 -> new_order_record.frequent_trader_id[new_order_at] = (new_order_base + 122 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.cust_order_handling_inst = (new_order_base + 128 + 1) % 256;
  new_order_at = 0;
  do
  :: new_order_at < 2 -> new_order_record.country_code[new_order_at] = (new_order_base + 129 + new_order_at + 1) % 256; new_order_at = new_order_at + 1
  :: else -> break
  od;
  skip
}

/* New Order to the wire, 131 bytes from where the cursor stands */
inline encode_new_order(new_order_record) {
  new_order_at = 0;
  do
  :: new_order_at < 20 -> wire[at] = new_order_record.cl_ord_id[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  wire[at] = new_order_record.side; at = at + 1;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> wire[at] = new_order_record.order_qty[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> wire[at] = new_order_record.clearing_firm[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> wire[at] = new_order_record.clearing_account[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> wire[at] = new_order_record.price[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  wire[at] = new_order_record.ord_type; at = at + 1;
  wire[at] = new_order_record.time_in_force; at = at + 1;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> wire[at] = new_order_record.min_qty[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> wire[at] = new_order_record.symbol[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  wire[at] = new_order_record.capacity; at = at + 1;
  new_order_at = 0;
  do
  :: new_order_at < 16 -> wire[at] = new_order_record.account[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  encode_prevent_match(new_order_record.prevent_match);
  new_order_at = 0;
  do
  :: new_order_at < 8 -> wire[at] = new_order_record.expire_time[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> wire[at] = new_order_record.maturity_date[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  wire[at] = new_order_record.open_close; at = at + 1;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> wire[at] = new_order_record.cmta_number[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> wire[at] = new_order_record.stop_px[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 2 -> wire[at] = new_order_record.custom_group_id[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  wire[at] = new_order_record.cti_code; at = at + 1;
  wire[at] = new_order_record.manual_order_indicator; at = at + 1;
  new_order_at = 0;
  do
  :: new_order_at < 18 -> wire[at] = new_order_record.oeo_id[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 6 -> wire[at] = new_order_record.frequent_trader_id[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  wire[at] = new_order_record.cust_order_handling_inst; at = at + 1;
  new_order_at = 0;
  do
  :: new_order_at < 2 -> wire[at] = new_order_record.country_code[new_order_at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  skip
}

/* New Order off the wire, 131 bytes from where the cursor stands */
inline decode_new_order(new_order_record) {
  new_order_at = 0;
  do
  :: new_order_at < 20 -> new_order_record.cl_ord_id[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.side = wire[at]; at = at + 1;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.order_qty[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.clearing_firm[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.clearing_account[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> new_order_record.price[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.ord_type = wire[at]; at = at + 1;
  new_order_record.time_in_force = wire[at]; at = at + 1;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.min_qty[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> new_order_record.symbol[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.capacity = wire[at]; at = at + 1;
  new_order_at = 0;
  do
  :: new_order_at < 16 -> new_order_record.account[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  decode_prevent_match(new_order_record.prevent_match);
  new_order_at = 0;
  do
  :: new_order_at < 8 -> new_order_record.expire_time[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.maturity_date[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.open_close = wire[at]; at = at + 1;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> new_order_record.cmta_number[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> new_order_record.stop_px[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 2 -> new_order_record.custom_group_id[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.cti_code = wire[at]; at = at + 1;
  new_order_record.manual_order_indicator = wire[at]; at = at + 1;
  new_order_at = 0;
  do
  :: new_order_at < 18 -> new_order_record.oeo_id[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 6 -> new_order_record.frequent_trader_id[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_record.cust_order_handling_inst = wire[at]; at = at + 1;
  new_order_at = 0;
  do
  :: new_order_at < 2 -> new_order_record.country_code[new_order_at] = wire[at]; at = at + 1; new_order_at = new_order_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order is what was written, byte for byte */
inline equal_new_order(new_order_read, new_order_written) {
  new_order_at = 0;
  do
  :: new_order_at < 20 -> assert(new_order_read.cl_ord_id[new_order_at] == new_order_written.cl_ord_id[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  assert(new_order_read.side == new_order_written.side);
  new_order_at = 0;
  do
  :: new_order_at < 4 -> assert(new_order_read.order_qty[new_order_at] == new_order_written.order_qty[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> assert(new_order_read.clearing_firm[new_order_at] == new_order_written.clearing_firm[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> assert(new_order_read.clearing_account[new_order_at] == new_order_written.clearing_account[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> assert(new_order_read.price[new_order_at] == new_order_written.price[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  assert(new_order_read.ord_type == new_order_written.ord_type);
  assert(new_order_read.time_in_force == new_order_written.time_in_force);
  new_order_at = 0;
  do
  :: new_order_at < 4 -> assert(new_order_read.min_qty[new_order_at] == new_order_written.min_qty[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> assert(new_order_read.symbol[new_order_at] == new_order_written.symbol[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  assert(new_order_read.capacity == new_order_written.capacity);
  new_order_at = 0;
  do
  :: new_order_at < 16 -> assert(new_order_read.account[new_order_at] == new_order_written.account[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  equal_prevent_match(new_order_read.prevent_match, new_order_written.prevent_match);
  new_order_at = 0;
  do
  :: new_order_at < 8 -> assert(new_order_read.expire_time[new_order_at] == new_order_written.expire_time[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 4 -> assert(new_order_read.maturity_date[new_order_at] == new_order_written.maturity_date[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  assert(new_order_read.open_close == new_order_written.open_close);
  new_order_at = 0;
  do
  :: new_order_at < 4 -> assert(new_order_read.cmta_number[new_order_at] == new_order_written.cmta_number[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 8 -> assert(new_order_read.stop_px[new_order_at] == new_order_written.stop_px[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 2 -> assert(new_order_read.custom_group_id[new_order_at] == new_order_written.custom_group_id[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  assert(new_order_read.cti_code == new_order_written.cti_code);
  assert(new_order_read.manual_order_indicator == new_order_written.manual_order_indicator);
  new_order_at = 0;
  do
  :: new_order_at < 18 -> assert(new_order_read.oeo_id[new_order_at] == new_order_written.oeo_id[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  new_order_at = 0;
  do
  :: new_order_at < 6 -> assert(new_order_read.frequent_trader_id[new_order_at] == new_order_written.frequent_trader_id[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  assert(new_order_read.cust_order_handling_inst == new_order_written.cust_order_handling_inst);
  new_order_at = 0;
  do
  :: new_order_at < 2 -> assert(new_order_read.country_code[new_order_at] == new_order_written.country_code[new_order_at]); new_order_at = new_order_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order: 92 bytes -------------------------------------------------- */

/* Request to modify an order */
typedef ModifyOrder {
  byte cl_ord_id[20];
  byte orig_cl_ord_id[20];
  byte clearing_firm[4];
  byte order_qty[4];
  byte price[8];
  byte ord_type;
  byte cancel_orig_on_reject;
  byte stop_px[8];
  byte manual_order_indicator;
  byte oeo_id[18];
  byte frequent_trader_id[6];
  byte cust_order_handling_inst
};

int modify_order_at;

/* every byte of Modify Order set to one value */
inline fill_modify_order(modify_order_record, modify_order_value) {
  modify_order_at = 0;
  do
  :: modify_order_at < 20 -> modify_order_record.cl_ord_id[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 20 -> modify_order_record.orig_cl_ord_id[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.clearing_firm[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.order_qty[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.price[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.ord_type = modify_order_value;
  modify_order_record.cancel_orig_on_reject = modify_order_value;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.stop_px[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.manual_order_indicator = modify_order_value;
  modify_order_at = 0;
  do
  :: modify_order_at < 18 -> modify_order_record.oeo_id[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 6 -> modify_order_record.frequent_trader_id[modify_order_at] = modify_order_value; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.cust_order_handling_inst = modify_order_value;
  skip
}

/* each byte of Modify Order set to where it lies, so a field read out of place says so */
inline ramp_modify_order(modify_order_record, modify_order_base) {
  modify_order_at = 0;
  do
  :: modify_order_at < 20 -> modify_order_record.cl_ord_id[modify_order_at] = (modify_order_base + 0 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 20 -> modify_order_record.orig_cl_ord_id[modify_order_at] = (modify_order_base + 20 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.clearing_firm[modify_order_at] = (modify_order_base + 40 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.order_qty[modify_order_at] = (modify_order_base + 44 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.price[modify_order_at] = (modify_order_base + 48 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.ord_type = (modify_order_base + 56 + 1) % 256;
  modify_order_record.cancel_orig_on_reject = (modify_order_base + 57 + 1) % 256;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.stop_px[modify_order_at] = (modify_order_base + 58 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.manual_order_indicator = (modify_order_base + 66 + 1) % 256;
  modify_order_at = 0;
  do
  :: modify_order_at < 18 -> modify_order_record.oeo_id[modify_order_at] = (modify_order_base + 67 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 6 -> modify_order_record.frequent_trader_id[modify_order_at] = (modify_order_base + 85 + modify_order_at + 1) % 256; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.cust_order_handling_inst = (modify_order_base + 91 + 1) % 256;
  skip
}

/* Modify Order to the wire, 92 bytes from where the cursor stands */
inline encode_modify_order(modify_order_record) {
  modify_order_at = 0;
  do
  :: modify_order_at < 20 -> wire[at] = modify_order_record.cl_ord_id[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 20 -> wire[at] = modify_order_record.orig_cl_ord_id[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> wire[at] = modify_order_record.clearing_firm[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> wire[at] = modify_order_record.order_qty[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> wire[at] = modify_order_record.price[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_record.ord_type; at = at + 1;
  wire[at] = modify_order_record.cancel_orig_on_reject; at = at + 1;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> wire[at] = modify_order_record.stop_px[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_record.manual_order_indicator; at = at + 1;
  modify_order_at = 0;
  do
  :: modify_order_at < 18 -> wire[at] = modify_order_record.oeo_id[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 6 -> wire[at] = modify_order_record.frequent_trader_id[modify_order_at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_record.cust_order_handling_inst; at = at + 1;
  skip
}

/* Modify Order off the wire, 92 bytes from where the cursor stands */
inline decode_modify_order(modify_order_record) {
  modify_order_at = 0;
  do
  :: modify_order_at < 20 -> modify_order_record.cl_ord_id[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 20 -> modify_order_record.orig_cl_ord_id[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.clearing_firm[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> modify_order_record.order_qty[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.price[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.ord_type = wire[at]; at = at + 1;
  modify_order_record.cancel_orig_on_reject = wire[at]; at = at + 1;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> modify_order_record.stop_px[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.manual_order_indicator = wire[at]; at = at + 1;
  modify_order_at = 0;
  do
  :: modify_order_at < 18 -> modify_order_record.oeo_id[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 6 -> modify_order_record.frequent_trader_id[modify_order_at] = wire[at]; at = at + 1; modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_record.cust_order_handling_inst = wire[at]; at = at + 1;
  skip
}

/* what was read of Modify Order is what was written, byte for byte */
inline equal_modify_order(modify_order_read, modify_order_written) {
  modify_order_at = 0;
  do
  :: modify_order_at < 20 -> assert(modify_order_read.cl_ord_id[modify_order_at] == modify_order_written.cl_ord_id[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 20 -> assert(modify_order_read.orig_cl_ord_id[modify_order_at] == modify_order_written.orig_cl_ord_id[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> assert(modify_order_read.clearing_firm[modify_order_at] == modify_order_written.clearing_firm[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 4 -> assert(modify_order_read.order_qty[modify_order_at] == modify_order_written.order_qty[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> assert(modify_order_read.price[modify_order_at] == modify_order_written.price[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  assert(modify_order_read.ord_type == modify_order_written.ord_type);
  assert(modify_order_read.cancel_orig_on_reject == modify_order_written.cancel_orig_on_reject);
  modify_order_at = 0;
  do
  :: modify_order_at < 8 -> assert(modify_order_read.stop_px[modify_order_at] == modify_order_written.stop_px[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  assert(modify_order_read.manual_order_indicator == modify_order_written.manual_order_indicator);
  modify_order_at = 0;
  do
  :: modify_order_at < 18 -> assert(modify_order_read.oeo_id[modify_order_at] == modify_order_written.oeo_id[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  modify_order_at = 0;
  do
  :: modify_order_at < 6 -> assert(modify_order_read.frequent_trader_id[modify_order_at] == modify_order_written.frequent_trader_id[modify_order_at]); modify_order_at = modify_order_at + 1
  :: else -> break
  od;
  assert(modify_order_read.cust_order_handling_inst == modify_order_written.cust_order_handling_inst);
  skip
}

/* ---- Cancel Order: 43 bytes -------------------------------------------------- */

/* Request to cancel a single order or quote */
typedef CancelOrder {
  byte orig_cl_ord_id[20];
  byte clearing_firm[4];
  byte manual_order_indicator;
  byte oeo_id[18]
};

int cancel_order_at;

/* every byte of Cancel Order set to one value */
inline fill_cancel_order(cancel_order_record, cancel_order_value) {
  cancel_order_at = 0;
  do
  :: cancel_order_at < 20 -> cancel_order_record.orig_cl_ord_id[cancel_order_at] = cancel_order_value; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  cancel_order_at = 0;
  do
  :: cancel_order_at < 4 -> cancel_order_record.clearing_firm[cancel_order_at] = cancel_order_value; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  cancel_order_record.manual_order_indicator = cancel_order_value;
  cancel_order_at = 0;
  do
  :: cancel_order_at < 18 -> cancel_order_record.oeo_id[cancel_order_at] = cancel_order_value; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order set to where it lies, so a field read out of place says so */
inline ramp_cancel_order(cancel_order_record, cancel_order_base) {
  cancel_order_at = 0;
  do
  :: cancel_order_at < 20 -> cancel_order_record.orig_cl_ord_id[cancel_order_at] = (cancel_order_base + 0 + cancel_order_at + 1) % 256; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  cancel_order_at = 0;
  do
  :: cancel_order_at < 4 -> cancel_order_record.clearing_firm[cancel_order_at] = (cancel_order_base + 20 + cancel_order_at + 1) % 256; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  cancel_order_record.manual_order_indicator = (cancel_order_base + 24 + 1) % 256;
  cancel_order_at = 0;
  do
  :: cancel_order_at < 18 -> cancel_order_record.oeo_id[cancel_order_at] = (cancel_order_base + 25 + cancel_order_at + 1) % 256; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order to the wire, 43 bytes from where the cursor stands */
inline encode_cancel_order(cancel_order_record) {
  cancel_order_at = 0;
  do
  :: cancel_order_at < 20 -> wire[at] = cancel_order_record.orig_cl_ord_id[cancel_order_at]; at = at + 1; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  cancel_order_at = 0;
  do
  :: cancel_order_at < 4 -> wire[at] = cancel_order_record.clearing_firm[cancel_order_at]; at = at + 1; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  wire[at] = cancel_order_record.manual_order_indicator; at = at + 1;
  cancel_order_at = 0;
  do
  :: cancel_order_at < 18 -> wire[at] = cancel_order_record.oeo_id[cancel_order_at]; at = at + 1; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order off the wire, 43 bytes from where the cursor stands */
inline decode_cancel_order(cancel_order_record) {
  cancel_order_at = 0;
  do
  :: cancel_order_at < 20 -> cancel_order_record.orig_cl_ord_id[cancel_order_at] = wire[at]; at = at + 1; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  cancel_order_at = 0;
  do
  :: cancel_order_at < 4 -> cancel_order_record.clearing_firm[cancel_order_at] = wire[at]; at = at + 1; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  cancel_order_record.manual_order_indicator = wire[at]; at = at + 1;
  cancel_order_at = 0;
  do
  :: cancel_order_at < 18 -> cancel_order_record.oeo_id[cancel_order_at] = wire[at]; at = at + 1; cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order is what was written, byte for byte */
inline equal_cancel_order(cancel_order_read, cancel_order_written) {
  cancel_order_at = 0;
  do
  :: cancel_order_at < 20 -> assert(cancel_order_read.orig_cl_ord_id[cancel_order_at] == cancel_order_written.orig_cl_ord_id[cancel_order_at]); cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  cancel_order_at = 0;
  do
  :: cancel_order_at < 4 -> assert(cancel_order_read.clearing_firm[cancel_order_at] == cancel_order_written.clearing_firm[cancel_order_at]); cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  assert(cancel_order_read.manual_order_indicator == cancel_order_written.manual_order_indicator);
  cancel_order_at = 0;
  do
  :: cancel_order_at < 18 -> assert(cancel_order_read.oeo_id[cancel_order_at] == cancel_order_written.oeo_id[cancel_order_at]); cancel_order_at = cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Inst: 16 bytes ---------------------------------------------- */

typedef MassCancelInst {
  byte clearing_firm_filter;
  byte acknowledgement_style;
  byte lockout_instruction;
  byte instrument_type_filter;
  byte gtc_order_filter;
  byte instruction_details[11]
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
  :: mass_cancel_inst_at < 11 -> mass_cancel_inst_record.instruction_details[mass_cancel_inst_at] = mass_cancel_inst_value; mass_cancel_inst_at = mass_cancel_inst_at + 1
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
  :: mass_cancel_inst_at < 11 -> mass_cancel_inst_record.instruction_details[mass_cancel_inst_at] = (mass_cancel_inst_base + 5 + mass_cancel_inst_at + 1) % 256; mass_cancel_inst_at = mass_cancel_inst_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Inst to the wire, 16 bytes from where the cursor stands */
inline encode_mass_cancel_inst(mass_cancel_inst_record) {
  wire[at] = mass_cancel_inst_record.clearing_firm_filter; at = at + 1;
  wire[at] = mass_cancel_inst_record.acknowledgement_style; at = at + 1;
  wire[at] = mass_cancel_inst_record.lockout_instruction; at = at + 1;
  wire[at] = mass_cancel_inst_record.instrument_type_filter; at = at + 1;
  wire[at] = mass_cancel_inst_record.gtc_order_filter; at = at + 1;
  mass_cancel_inst_at = 0;
  do
  :: mass_cancel_inst_at < 11 -> wire[at] = mass_cancel_inst_record.instruction_details[mass_cancel_inst_at]; at = at + 1; mass_cancel_inst_at = mass_cancel_inst_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Inst off the wire, 16 bytes from where the cursor stands */
inline decode_mass_cancel_inst(mass_cancel_inst_record) {
  mass_cancel_inst_record.clearing_firm_filter = wire[at]; at = at + 1;
  mass_cancel_inst_record.acknowledgement_style = wire[at]; at = at + 1;
  mass_cancel_inst_record.lockout_instruction = wire[at]; at = at + 1;
  mass_cancel_inst_record.instrument_type_filter = wire[at]; at = at + 1;
  mass_cancel_inst_record.gtc_order_filter = wire[at]; at = at + 1;
  mass_cancel_inst_at = 0;
  do
  :: mass_cancel_inst_at < 11 -> mass_cancel_inst_record.instruction_details[mass_cancel_inst_at] = wire[at]; at = at + 1; mass_cancel_inst_at = mass_cancel_inst_at + 1
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
  :: mass_cancel_inst_at < 11 -> assert(mass_cancel_inst_read.instruction_details[mass_cancel_inst_at] == mass_cancel_inst_written.instruction_details[mass_cancel_inst_at]); mass_cancel_inst_at = mass_cancel_inst_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Order: 65 bytes --------------------------------------------- */

/* A Mass Cancel Order message is a request to cancel a group of orders or quotes */
typedef MassCancelOrder {
  byte mass_cancel_id[20];
  byte clearing_firm[4];
  byte product_name[6];
  MassCancelInst mass_cancel_inst;
  byte manual_order_indicator;
  byte oeo_id[18]
};

int mass_cancel_order_at;

/* every byte of Mass Cancel Order set to one value */
inline fill_mass_cancel_order(mass_cancel_order_record, mass_cancel_order_value) {
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 20 -> mass_cancel_order_record.mass_cancel_id[mass_cancel_order_at] = mass_cancel_order_value; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 4 -> mass_cancel_order_record.clearing_firm[mass_cancel_order_at] = mass_cancel_order_value; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 6 -> mass_cancel_order_record.product_name[mass_cancel_order_at] = mass_cancel_order_value; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  fill_mass_cancel_inst(mass_cancel_order_record.mass_cancel_inst, mass_cancel_order_value);
  mass_cancel_order_record.manual_order_indicator = mass_cancel_order_value;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 18 -> mass_cancel_order_record.oeo_id[mass_cancel_order_at] = mass_cancel_order_value; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Order set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_order(mass_cancel_order_record, mass_cancel_order_base) {
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 20 -> mass_cancel_order_record.mass_cancel_id[mass_cancel_order_at] = (mass_cancel_order_base + 0 + mass_cancel_order_at + 1) % 256; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 4 -> mass_cancel_order_record.clearing_firm[mass_cancel_order_at] = (mass_cancel_order_base + 20 + mass_cancel_order_at + 1) % 256; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 6 -> mass_cancel_order_record.product_name[mass_cancel_order_at] = (mass_cancel_order_base + 24 + mass_cancel_order_at + 1) % 256; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  ramp_mass_cancel_inst(mass_cancel_order_record.mass_cancel_inst, mass_cancel_order_base + 30);
  mass_cancel_order_record.manual_order_indicator = (mass_cancel_order_base + 46 + 1) % 256;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 18 -> mass_cancel_order_record.oeo_id[mass_cancel_order_at] = (mass_cancel_order_base + 47 + mass_cancel_order_at + 1) % 256; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Order to the wire, 65 bytes from where the cursor stands */
inline encode_mass_cancel_order(mass_cancel_order_record) {
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 20 -> wire[at] = mass_cancel_order_record.mass_cancel_id[mass_cancel_order_at]; at = at + 1; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 4 -> wire[at] = mass_cancel_order_record.clearing_firm[mass_cancel_order_at]; at = at + 1; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 6 -> wire[at] = mass_cancel_order_record.product_name[mass_cancel_order_at]; at = at + 1; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  encode_mass_cancel_inst(mass_cancel_order_record.mass_cancel_inst);
  wire[at] = mass_cancel_order_record.manual_order_indicator; at = at + 1;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 18 -> wire[at] = mass_cancel_order_record.oeo_id[mass_cancel_order_at]; at = at + 1; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Order off the wire, 65 bytes from where the cursor stands */
inline decode_mass_cancel_order(mass_cancel_order_record) {
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 20 -> mass_cancel_order_record.mass_cancel_id[mass_cancel_order_at] = wire[at]; at = at + 1; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 4 -> mass_cancel_order_record.clearing_firm[mass_cancel_order_at] = wire[at]; at = at + 1; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 6 -> mass_cancel_order_record.product_name[mass_cancel_order_at] = wire[at]; at = at + 1; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  decode_mass_cancel_inst(mass_cancel_order_record.mass_cancel_inst);
  mass_cancel_order_record.manual_order_indicator = wire[at]; at = at + 1;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 18 -> mass_cancel_order_record.oeo_id[mass_cancel_order_at] = wire[at]; at = at + 1; mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Order is what was written, byte for byte */
inline equal_mass_cancel_order(mass_cancel_order_read, mass_cancel_order_written) {
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 20 -> assert(mass_cancel_order_read.mass_cancel_id[mass_cancel_order_at] == mass_cancel_order_written.mass_cancel_id[mass_cancel_order_at]); mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 4 -> assert(mass_cancel_order_read.clearing_firm[mass_cancel_order_at] == mass_cancel_order_written.clearing_firm[mass_cancel_order_at]); mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 6 -> assert(mass_cancel_order_read.product_name[mass_cancel_order_at] == mass_cancel_order_written.product_name[mass_cancel_order_at]); mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  equal_mass_cancel_inst(mass_cancel_order_read.mass_cancel_inst, mass_cancel_order_written.mass_cancel_inst);
  assert(mass_cancel_order_read.manual_order_indicator == mass_cancel_order_written.manual_order_indicator);
  mass_cancel_order_at = 0;
  do
  :: mass_cancel_order_at < 18 -> assert(mass_cancel_order_read.oeo_id[mass_cancel_order_at] == mass_cancel_order_written.oeo_id[mass_cancel_order_at]); mass_cancel_order_at = mass_cancel_order_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Purge Orders: 68 bytes -------------------------------------------------- */

/* Request to cancel a group of orders or quotes across all the TPH's sessions for that port’s matching unit */
typedef PurgeOrders {
  byte mass_cancel_id[20];
  byte clearing_firm[4];
  byte product_name[6];
  MassCancelInst mass_cancel_inst;
  byte manual_order_indicator;
  byte oeo_id[18];
  byte custom_group_id_cnt;
  byte custom_group_id[2]
};

int purge_orders_at;

/* every byte of Purge Orders set to one value */
inline fill_purge_orders(purge_orders_record, purge_orders_value) {
  purge_orders_at = 0;
  do
  :: purge_orders_at < 20 -> purge_orders_record.mass_cancel_id[purge_orders_at] = purge_orders_value; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 4 -> purge_orders_record.clearing_firm[purge_orders_at] = purge_orders_value; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 6 -> purge_orders_record.product_name[purge_orders_at] = purge_orders_value; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  fill_mass_cancel_inst(purge_orders_record.mass_cancel_inst, purge_orders_value);
  purge_orders_record.manual_order_indicator = purge_orders_value;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 18 -> purge_orders_record.oeo_id[purge_orders_at] = purge_orders_value; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  purge_orders_record.custom_group_id_cnt = purge_orders_value;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 2 -> purge_orders_record.custom_group_id[purge_orders_at] = purge_orders_value; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Purge Orders set to where it lies, so a field read out of place says so */
inline ramp_purge_orders(purge_orders_record, purge_orders_base) {
  purge_orders_at = 0;
  do
  :: purge_orders_at < 20 -> purge_orders_record.mass_cancel_id[purge_orders_at] = (purge_orders_base + 0 + purge_orders_at + 1) % 256; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 4 -> purge_orders_record.clearing_firm[purge_orders_at] = (purge_orders_base + 20 + purge_orders_at + 1) % 256; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 6 -> purge_orders_record.product_name[purge_orders_at] = (purge_orders_base + 24 + purge_orders_at + 1) % 256; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  ramp_mass_cancel_inst(purge_orders_record.mass_cancel_inst, purge_orders_base + 30);
  purge_orders_record.manual_order_indicator = (purge_orders_base + 46 + 1) % 256;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 18 -> purge_orders_record.oeo_id[purge_orders_at] = (purge_orders_base + 47 + purge_orders_at + 1) % 256; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  purge_orders_record.custom_group_id_cnt = (purge_orders_base + 65 + 1) % 256;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 2 -> purge_orders_record.custom_group_id[purge_orders_at] = (purge_orders_base + 66 + purge_orders_at + 1) % 256; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Orders to the wire, 68 bytes from where the cursor stands */
inline encode_purge_orders(purge_orders_record) {
  purge_orders_at = 0;
  do
  :: purge_orders_at < 20 -> wire[at] = purge_orders_record.mass_cancel_id[purge_orders_at]; at = at + 1; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 4 -> wire[at] = purge_orders_record.clearing_firm[purge_orders_at]; at = at + 1; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 6 -> wire[at] = purge_orders_record.product_name[purge_orders_at]; at = at + 1; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  encode_mass_cancel_inst(purge_orders_record.mass_cancel_inst);
  wire[at] = purge_orders_record.manual_order_indicator; at = at + 1;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 18 -> wire[at] = purge_orders_record.oeo_id[purge_orders_at]; at = at + 1; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  wire[at] = purge_orders_record.custom_group_id_cnt; at = at + 1;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 2 -> wire[at] = purge_orders_record.custom_group_id[purge_orders_at]; at = at + 1; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  skip
}

/* Purge Orders off the wire, 68 bytes from where the cursor stands */
inline decode_purge_orders(purge_orders_record) {
  purge_orders_at = 0;
  do
  :: purge_orders_at < 20 -> purge_orders_record.mass_cancel_id[purge_orders_at] = wire[at]; at = at + 1; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 4 -> purge_orders_record.clearing_firm[purge_orders_at] = wire[at]; at = at + 1; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 6 -> purge_orders_record.product_name[purge_orders_at] = wire[at]; at = at + 1; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  decode_mass_cancel_inst(purge_orders_record.mass_cancel_inst);
  purge_orders_record.manual_order_indicator = wire[at]; at = at + 1;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 18 -> purge_orders_record.oeo_id[purge_orders_at] = wire[at]; at = at + 1; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  purge_orders_record.custom_group_id_cnt = wire[at]; at = at + 1;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 2 -> purge_orders_record.custom_group_id[purge_orders_at] = wire[at]; at = at + 1; purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Purge Orders is what was written, byte for byte */
inline equal_purge_orders(purge_orders_read, purge_orders_written) {
  purge_orders_at = 0;
  do
  :: purge_orders_at < 20 -> assert(purge_orders_read.mass_cancel_id[purge_orders_at] == purge_orders_written.mass_cancel_id[purge_orders_at]); purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 4 -> assert(purge_orders_read.clearing_firm[purge_orders_at] == purge_orders_written.clearing_firm[purge_orders_at]); purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  purge_orders_at = 0;
  do
  :: purge_orders_at < 6 -> assert(purge_orders_read.product_name[purge_orders_at] == purge_orders_written.product_name[purge_orders_at]); purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  equal_mass_cancel_inst(purge_orders_read.mass_cancel_inst, purge_orders_written.mass_cancel_inst);
  assert(purge_orders_read.manual_order_indicator == purge_orders_written.manual_order_indicator);
  purge_orders_at = 0;
  do
  :: purge_orders_at < 18 -> assert(purge_orders_read.oeo_id[purge_orders_at] == purge_orders_written.oeo_id[purge_orders_at]); purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  assert(purge_orders_read.custom_group_id_cnt == purge_orders_written.custom_group_id_cnt);
  purge_orders_at = 0;
  do
  :: purge_orders_at < 2 -> assert(purge_orders_read.custom_group_id[purge_orders_at] == purge_orders_written.custom_group_id[purge_orders_at]); purge_orders_at = purge_orders_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reset Risk: 36 bytes ---------------------------------------------------- */

/* Reset or release Firm/EFID, Product, or Custom Group Id level lockout conditions resulting from risk profile trips or self-imposed lockouts issued viaMass Cancel Order or Purge Orders messages */
typedef ResetRisk {
  byte risk_status_id[16];
  byte risk_reset[8];
  byte clearing_firm[4];
  byte product_name[6];
  byte custom_group_id[2]
};

int reset_risk_at;

/* every byte of Reset Risk set to one value */
inline fill_reset_risk(reset_risk_record, reset_risk_value) {
  reset_risk_at = 0;
  do
  :: reset_risk_at < 16 -> reset_risk_record.risk_status_id[reset_risk_at] = reset_risk_value; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 8 -> reset_risk_record.risk_reset[reset_risk_at] = reset_risk_value; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 4 -> reset_risk_record.clearing_firm[reset_risk_at] = reset_risk_value; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 6 -> reset_risk_record.product_name[reset_risk_at] = reset_risk_value; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 2 -> reset_risk_record.custom_group_id[reset_risk_at] = reset_risk_value; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reset Risk set to where it lies, so a field read out of place says so */
inline ramp_reset_risk(reset_risk_record, reset_risk_base) {
  reset_risk_at = 0;
  do
  :: reset_risk_at < 16 -> reset_risk_record.risk_status_id[reset_risk_at] = (reset_risk_base + 0 + reset_risk_at + 1) % 256; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 8 -> reset_risk_record.risk_reset[reset_risk_at] = (reset_risk_base + 16 + reset_risk_at + 1) % 256; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 4 -> reset_risk_record.clearing_firm[reset_risk_at] = (reset_risk_base + 24 + reset_risk_at + 1) % 256; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 6 -> reset_risk_record.product_name[reset_risk_at] = (reset_risk_base + 28 + reset_risk_at + 1) % 256; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 2 -> reset_risk_record.custom_group_id[reset_risk_at] = (reset_risk_base + 34 + reset_risk_at + 1) % 256; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Risk to the wire, 36 bytes from where the cursor stands */
inline encode_reset_risk(reset_risk_record) {
  reset_risk_at = 0;
  do
  :: reset_risk_at < 16 -> wire[at] = reset_risk_record.risk_status_id[reset_risk_at]; at = at + 1; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 8 -> wire[at] = reset_risk_record.risk_reset[reset_risk_at]; at = at + 1; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 4 -> wire[at] = reset_risk_record.clearing_firm[reset_risk_at]; at = at + 1; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 6 -> wire[at] = reset_risk_record.product_name[reset_risk_at]; at = at + 1; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 2 -> wire[at] = reset_risk_record.custom_group_id[reset_risk_at]; at = at + 1; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Risk off the wire, 36 bytes from where the cursor stands */
inline decode_reset_risk(reset_risk_record) {
  reset_risk_at = 0;
  do
  :: reset_risk_at < 16 -> reset_risk_record.risk_status_id[reset_risk_at] = wire[at]; at = at + 1; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 8 -> reset_risk_record.risk_reset[reset_risk_at] = wire[at]; at = at + 1; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 4 -> reset_risk_record.clearing_firm[reset_risk_at] = wire[at]; at = at + 1; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 6 -> reset_risk_record.product_name[reset_risk_at] = wire[at]; at = at + 1; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 2 -> reset_risk_record.custom_group_id[reset_risk_at] = wire[at]; at = at + 1; reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reset Risk is what was written, byte for byte */
inline equal_reset_risk(reset_risk_read, reset_risk_written) {
  reset_risk_at = 0;
  do
  :: reset_risk_at < 16 -> assert(reset_risk_read.risk_status_id[reset_risk_at] == reset_risk_written.risk_status_id[reset_risk_at]); reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 8 -> assert(reset_risk_read.risk_reset[reset_risk_at] == reset_risk_written.risk_reset[reset_risk_at]); reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 4 -> assert(reset_risk_read.clearing_firm[reset_risk_at] == reset_risk_written.clearing_firm[reset_risk_at]); reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 6 -> assert(reset_risk_read.product_name[reset_risk_at] == reset_risk_written.product_name[reset_risk_at]); reset_risk_at = reset_risk_at + 1
  :: else -> break
  od;
  reset_risk_at = 0;
  do
  :: reset_risk_at < 2 -> assert(reset_risk_read.custom_group_id[reset_risk_at] == reset_risk_written.custom_group_id[reset_risk_at]); reset_risk_at = reset_risk_at + 1
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

/* New Order: encoded, read back, and compared */
proctype check_new_order() {
  NewOrder new_order_sent;
  NewOrder new_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order(new_order_sent, 0)
  :: pattern == 1 -> fill_new_order(new_order_sent, 32)
  :: pattern == 2 -> fill_new_order(new_order_sent, 255)
  :: else -> ramp_new_order(new_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order(new_order_sent);
    assert(at == 131);
    at = 0;
    decode_new_order(new_order_got);
    assert(at == 131);
    equal_new_order(new_order_got, new_order_sent)
  }
}

/* Modify Order: encoded, read back, and compared */
proctype check_modify_order() {
  ModifyOrder modify_order_sent;
  ModifyOrder modify_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order(modify_order_sent, 0)
  :: pattern == 1 -> fill_modify_order(modify_order_sent, 32)
  :: pattern == 2 -> fill_modify_order(modify_order_sent, 255)
  :: else -> ramp_modify_order(modify_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order(modify_order_sent);
    assert(at == 92);
    at = 0;
    decode_modify_order(modify_order_got);
    assert(at == 92);
    equal_modify_order(modify_order_got, modify_order_sent)
  }
}

/* Cancel Order: encoded, read back, and compared */
proctype check_cancel_order() {
  CancelOrder cancel_order_sent;
  CancelOrder cancel_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order(cancel_order_sent, 0)
  :: pattern == 1 -> fill_cancel_order(cancel_order_sent, 32)
  :: pattern == 2 -> fill_cancel_order(cancel_order_sent, 255)
  :: else -> ramp_cancel_order(cancel_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order(cancel_order_sent);
    assert(at == 43);
    at = 0;
    decode_cancel_order(cancel_order_got);
    assert(at == 43);
    equal_cancel_order(cancel_order_got, cancel_order_sent)
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
    assert(at == 16);
    at = 0;
    decode_mass_cancel_inst(mass_cancel_inst_got);
    assert(at == 16);
    equal_mass_cancel_inst(mass_cancel_inst_got, mass_cancel_inst_sent)
  }
}

/* Mass Cancel Order: encoded, read back, and compared */
proctype check_mass_cancel_order() {
  MassCancelOrder mass_cancel_order_sent;
  MassCancelOrder mass_cancel_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_order(mass_cancel_order_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_order(mass_cancel_order_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_order(mass_cancel_order_sent, 255)
  :: else -> ramp_mass_cancel_order(mass_cancel_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_order(mass_cancel_order_sent);
    assert(at == 65);
    at = 0;
    decode_mass_cancel_order(mass_cancel_order_got);
    assert(at == 65);
    equal_mass_cancel_order(mass_cancel_order_got, mass_cancel_order_sent)
  }
}

/* Purge Orders: encoded, read back, and compared */
proctype check_purge_orders() {
  PurgeOrders purge_orders_sent;
  PurgeOrders purge_orders_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_purge_orders(purge_orders_sent, 0)
  :: pattern == 1 -> fill_purge_orders(purge_orders_sent, 32)
  :: pattern == 2 -> fill_purge_orders(purge_orders_sent, 255)
  :: else -> ramp_purge_orders(purge_orders_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_purge_orders(purge_orders_sent);
    assert(at == 68);
    at = 0;
    decode_purge_orders(purge_orders_got);
    assert(at == 68);
    equal_purge_orders(purge_orders_got, purge_orders_sent)
  }
}

/* Reset Risk: encoded, read back, and compared */
proctype check_reset_risk() {
  ResetRisk reset_risk_sent;
  ResetRisk reset_risk_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reset_risk(reset_risk_sent, 0)
  :: pattern == 1 -> fill_reset_risk(reset_risk_sent, 32)
  :: pattern == 2 -> fill_reset_risk(reset_risk_sent, 255)
  :: else -> ramp_reset_risk(reset_risk_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reset_risk(reset_risk_sent);
    assert(at == 36);
    at = 0;
    decode_reset_risk(reset_risk_got);
    assert(at == 36);
    equal_reset_risk(reset_risk_got, reset_risk_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_firm_message_header()
  :: run check_prevent_match()
  :: run check_new_order()
  :: run check_modify_order()
  :: run check_cancel_order()
  :: run check_mass_cancel_inst()
  :: run check_mass_cancel_order()
  :: run check_purge_orders()
  :: run check_reset_risk()
  fi
}
