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
#define WIRE 141

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

/* ---- New Order Us Equities V 1: 141 bytes ------------------------------------ */

/* Submission of a new order to Cboe */
typedef NewOrderUsEquitiesV1 {
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
  byte discretion_amount[2];
  byte peg_difference[8];
  byte prevent_match[3];
  byte locate_reqd;
  byte expire_time[8];
  byte attributed_quote;
  byte ext_exec_inst;
  byte display_range[4];
  byte stop_px[8];
  byte rout_strategy[6];
  byte route_delivery_method[3];
  byte ex_destination;
  byte risk_group_id[2];
  byte cross_trade_flag;
  byte locate_broker[4];
  byte step_up_amount[4];
  byte cmc_sessions[2]
};

int new_order_us_equities_v1_at;

/* every byte of New Order Us Equities V 1 set to one value */
inline fill_new_order_us_equities_v1(new_order_us_equities_v1_record, new_order_us_equities_v1_value) {
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 20 -> new_order_us_equities_v1_record.cl_ord_id[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.side = new_order_us_equities_v1_value;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.order_qty[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.clearing_firm[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.clearing_account[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.price[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.exec_inst = new_order_us_equities_v1_value;
  new_order_us_equities_v1_record.ord_type = new_order_us_equities_v1_value;
  new_order_us_equities_v1_record.time_in_force = new_order_us_equities_v1_value;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.min_qty[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.max_floor[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.symbol[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.capacity = new_order_us_equities_v1_value;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.routing_inst[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 16 -> new_order_us_equities_v1_record.account[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.display_indicator = new_order_us_equities_v1_value;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> new_order_us_equities_v1_record.discretion_amount[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.peg_difference[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 3 -> new_order_us_equities_v1_record.prevent_match[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.locate_reqd = new_order_us_equities_v1_value;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.expire_time[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.attributed_quote = new_order_us_equities_v1_value;
  new_order_us_equities_v1_record.ext_exec_inst = new_order_us_equities_v1_value;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.display_range[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.stop_px[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 6 -> new_order_us_equities_v1_record.rout_strategy[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 3 -> new_order_us_equities_v1_record.route_delivery_method[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.ex_destination = new_order_us_equities_v1_value;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> new_order_us_equities_v1_record.risk_group_id[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.cross_trade_flag = new_order_us_equities_v1_value;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.locate_broker[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.step_up_amount[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> new_order_us_equities_v1_record.cmc_sessions[new_order_us_equities_v1_at] = new_order_us_equities_v1_value; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_new_order_us_equities_v1(new_order_us_equities_v1_record, new_order_us_equities_v1_base) {
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 20 -> new_order_us_equities_v1_record.cl_ord_id[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 0 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.side = (new_order_us_equities_v1_base + 20 + 1) % 256;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.order_qty[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 21 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.clearing_firm[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 25 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.clearing_account[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 29 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.price[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 33 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.exec_inst = (new_order_us_equities_v1_base + 41 + 1) % 256;
  new_order_us_equities_v1_record.ord_type = (new_order_us_equities_v1_base + 42 + 1) % 256;
  new_order_us_equities_v1_record.time_in_force = (new_order_us_equities_v1_base + 43 + 1) % 256;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.min_qty[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 44 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.max_floor[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 48 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.symbol[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 52 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.capacity = (new_order_us_equities_v1_base + 60 + 1) % 256;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.routing_inst[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 61 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 16 -> new_order_us_equities_v1_record.account[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 65 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.display_indicator = (new_order_us_equities_v1_base + 81 + 1) % 256;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> new_order_us_equities_v1_record.discretion_amount[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 82 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.peg_difference[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 84 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 3 -> new_order_us_equities_v1_record.prevent_match[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 92 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.locate_reqd = (new_order_us_equities_v1_base + 95 + 1) % 256;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.expire_time[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 96 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.attributed_quote = (new_order_us_equities_v1_base + 104 + 1) % 256;
  new_order_us_equities_v1_record.ext_exec_inst = (new_order_us_equities_v1_base + 105 + 1) % 256;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.display_range[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 106 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.stop_px[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 110 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 6 -> new_order_us_equities_v1_record.rout_strategy[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 118 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 3 -> new_order_us_equities_v1_record.route_delivery_method[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 124 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.ex_destination = (new_order_us_equities_v1_base + 127 + 1) % 256;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> new_order_us_equities_v1_record.risk_group_id[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 128 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.cross_trade_flag = (new_order_us_equities_v1_base + 130 + 1) % 256;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.locate_broker[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 131 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.step_up_amount[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 135 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> new_order_us_equities_v1_record.cmc_sessions[new_order_us_equities_v1_at] = (new_order_us_equities_v1_base + 139 + new_order_us_equities_v1_at + 1) % 256; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Us Equities V 1 to the wire, 141 bytes from where the cursor stands */
inline encode_new_order_us_equities_v1(new_order_us_equities_v1_record) {
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 20 -> wire[at] = new_order_us_equities_v1_record.cl_ord_id[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_us_equities_v1_record.side; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> wire[at] = new_order_us_equities_v1_record.order_qty[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> wire[at] = new_order_us_equities_v1_record.clearing_firm[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> wire[at] = new_order_us_equities_v1_record.clearing_account[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> wire[at] = new_order_us_equities_v1_record.price[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_us_equities_v1_record.exec_inst; at = at + 1;
  wire[at] = new_order_us_equities_v1_record.ord_type; at = at + 1;
  wire[at] = new_order_us_equities_v1_record.time_in_force; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> wire[at] = new_order_us_equities_v1_record.min_qty[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> wire[at] = new_order_us_equities_v1_record.max_floor[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> wire[at] = new_order_us_equities_v1_record.symbol[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_us_equities_v1_record.capacity; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> wire[at] = new_order_us_equities_v1_record.routing_inst[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 16 -> wire[at] = new_order_us_equities_v1_record.account[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_us_equities_v1_record.display_indicator; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> wire[at] = new_order_us_equities_v1_record.discretion_amount[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> wire[at] = new_order_us_equities_v1_record.peg_difference[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 3 -> wire[at] = new_order_us_equities_v1_record.prevent_match[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_us_equities_v1_record.locate_reqd; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> wire[at] = new_order_us_equities_v1_record.expire_time[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_us_equities_v1_record.attributed_quote; at = at + 1;
  wire[at] = new_order_us_equities_v1_record.ext_exec_inst; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> wire[at] = new_order_us_equities_v1_record.display_range[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> wire[at] = new_order_us_equities_v1_record.stop_px[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 6 -> wire[at] = new_order_us_equities_v1_record.rout_strategy[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 3 -> wire[at] = new_order_us_equities_v1_record.route_delivery_method[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_us_equities_v1_record.ex_destination; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> wire[at] = new_order_us_equities_v1_record.risk_group_id[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_us_equities_v1_record.cross_trade_flag; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> wire[at] = new_order_us_equities_v1_record.locate_broker[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> wire[at] = new_order_us_equities_v1_record.step_up_amount[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> wire[at] = new_order_us_equities_v1_record.cmc_sessions[new_order_us_equities_v1_at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Us Equities V 1 off the wire, 141 bytes from where the cursor stands */
inline decode_new_order_us_equities_v1(new_order_us_equities_v1_record) {
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 20 -> new_order_us_equities_v1_record.cl_ord_id[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.side = wire[at]; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.order_qty[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.clearing_firm[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.clearing_account[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.price[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.exec_inst = wire[at]; at = at + 1;
  new_order_us_equities_v1_record.ord_type = wire[at]; at = at + 1;
  new_order_us_equities_v1_record.time_in_force = wire[at]; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.min_qty[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.max_floor[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.symbol[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.capacity = wire[at]; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.routing_inst[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 16 -> new_order_us_equities_v1_record.account[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.display_indicator = wire[at]; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> new_order_us_equities_v1_record.discretion_amount[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.peg_difference[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 3 -> new_order_us_equities_v1_record.prevent_match[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.locate_reqd = wire[at]; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.expire_time[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.attributed_quote = wire[at]; at = at + 1;
  new_order_us_equities_v1_record.ext_exec_inst = wire[at]; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.display_range[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> new_order_us_equities_v1_record.stop_px[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 6 -> new_order_us_equities_v1_record.rout_strategy[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 3 -> new_order_us_equities_v1_record.route_delivery_method[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.ex_destination = wire[at]; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> new_order_us_equities_v1_record.risk_group_id[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_record.cross_trade_flag = wire[at]; at = at + 1;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.locate_broker[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> new_order_us_equities_v1_record.step_up_amount[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> new_order_us_equities_v1_record.cmc_sessions[new_order_us_equities_v1_at] = wire[at]; at = at + 1; new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Us Equities V 1 is what was written, byte for byte */
inline equal_new_order_us_equities_v1(new_order_us_equities_v1_read, new_order_us_equities_v1_written) {
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 20 -> assert(new_order_us_equities_v1_read.cl_ord_id[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.cl_ord_id[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_us_equities_v1_read.side == new_order_us_equities_v1_written.side);
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> assert(new_order_us_equities_v1_read.order_qty[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.order_qty[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> assert(new_order_us_equities_v1_read.clearing_firm[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.clearing_firm[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> assert(new_order_us_equities_v1_read.clearing_account[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.clearing_account[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> assert(new_order_us_equities_v1_read.price[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.price[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_us_equities_v1_read.exec_inst == new_order_us_equities_v1_written.exec_inst);
  assert(new_order_us_equities_v1_read.ord_type == new_order_us_equities_v1_written.ord_type);
  assert(new_order_us_equities_v1_read.time_in_force == new_order_us_equities_v1_written.time_in_force);
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> assert(new_order_us_equities_v1_read.min_qty[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.min_qty[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> assert(new_order_us_equities_v1_read.max_floor[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.max_floor[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> assert(new_order_us_equities_v1_read.symbol[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.symbol[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_us_equities_v1_read.capacity == new_order_us_equities_v1_written.capacity);
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> assert(new_order_us_equities_v1_read.routing_inst[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.routing_inst[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 16 -> assert(new_order_us_equities_v1_read.account[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.account[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_us_equities_v1_read.display_indicator == new_order_us_equities_v1_written.display_indicator);
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> assert(new_order_us_equities_v1_read.discretion_amount[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.discretion_amount[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> assert(new_order_us_equities_v1_read.peg_difference[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.peg_difference[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 3 -> assert(new_order_us_equities_v1_read.prevent_match[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.prevent_match[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_us_equities_v1_read.locate_reqd == new_order_us_equities_v1_written.locate_reqd);
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> assert(new_order_us_equities_v1_read.expire_time[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.expire_time[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_us_equities_v1_read.attributed_quote == new_order_us_equities_v1_written.attributed_quote);
  assert(new_order_us_equities_v1_read.ext_exec_inst == new_order_us_equities_v1_written.ext_exec_inst);
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> assert(new_order_us_equities_v1_read.display_range[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.display_range[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 8 -> assert(new_order_us_equities_v1_read.stop_px[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.stop_px[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 6 -> assert(new_order_us_equities_v1_read.rout_strategy[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.rout_strategy[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 3 -> assert(new_order_us_equities_v1_read.route_delivery_method[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.route_delivery_method[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_us_equities_v1_read.ex_destination == new_order_us_equities_v1_written.ex_destination);
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> assert(new_order_us_equities_v1_read.risk_group_id[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.risk_group_id[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_us_equities_v1_read.cross_trade_flag == new_order_us_equities_v1_written.cross_trade_flag);
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> assert(new_order_us_equities_v1_read.locate_broker[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.locate_broker[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 4 -> assert(new_order_us_equities_v1_read.step_up_amount[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.step_up_amount[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_us_equities_v1_at = 0;
  do
  :: new_order_us_equities_v1_at < 2 -> assert(new_order_us_equities_v1_read.cmc_sessions[new_order_us_equities_v1_at] == new_order_us_equities_v1_written.cmc_sessions[new_order_us_equities_v1_at]); new_order_us_equities_v1_at = new_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Order Short Us Equities V 1: 71 bytes ------------------------------- */

/* Submission of a new order to Cboe */
typedef NewOrderShortUsEquitiesV1 {
  byte cl_ord_id[20];
  byte side;
  byte order_qty[4];
  byte clearing_firm[4];
  byte clearing_account[4];
  byte price[8];
  byte exec_inst;
  byte ord_type;
  byte time_in_force;
  byte symbol[8];
  byte capacity;
  byte short_routing_inst;
  byte short_account[10];
  byte display_indicator;
  byte risk_group_id[2];
  byte locate_broker[4]
};

int new_order_short_us_equities_v1_at;

/* every byte of New Order Short Us Equities V 1 set to one value */
inline fill_new_order_short_us_equities_v1(new_order_short_us_equities_v1_record, new_order_short_us_equities_v1_value) {
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 20 -> new_order_short_us_equities_v1_record.cl_ord_id[new_order_short_us_equities_v1_at] = new_order_short_us_equities_v1_value; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_record.side = new_order_short_us_equities_v1_value;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> new_order_short_us_equities_v1_record.order_qty[new_order_short_us_equities_v1_at] = new_order_short_us_equities_v1_value; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> new_order_short_us_equities_v1_record.clearing_firm[new_order_short_us_equities_v1_at] = new_order_short_us_equities_v1_value; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> new_order_short_us_equities_v1_record.clearing_account[new_order_short_us_equities_v1_at] = new_order_short_us_equities_v1_value; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 8 -> new_order_short_us_equities_v1_record.price[new_order_short_us_equities_v1_at] = new_order_short_us_equities_v1_value; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_record.exec_inst = new_order_short_us_equities_v1_value;
  new_order_short_us_equities_v1_record.ord_type = new_order_short_us_equities_v1_value;
  new_order_short_us_equities_v1_record.time_in_force = new_order_short_us_equities_v1_value;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 8 -> new_order_short_us_equities_v1_record.symbol[new_order_short_us_equities_v1_at] = new_order_short_us_equities_v1_value; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_record.capacity = new_order_short_us_equities_v1_value;
  new_order_short_us_equities_v1_record.short_routing_inst = new_order_short_us_equities_v1_value;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 10 -> new_order_short_us_equities_v1_record.short_account[new_order_short_us_equities_v1_at] = new_order_short_us_equities_v1_value; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_record.display_indicator = new_order_short_us_equities_v1_value;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 2 -> new_order_short_us_equities_v1_record.risk_group_id[new_order_short_us_equities_v1_at] = new_order_short_us_equities_v1_value; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> new_order_short_us_equities_v1_record.locate_broker[new_order_short_us_equities_v1_at] = new_order_short_us_equities_v1_value; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Short Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_new_order_short_us_equities_v1(new_order_short_us_equities_v1_record, new_order_short_us_equities_v1_base) {
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 20 -> new_order_short_us_equities_v1_record.cl_ord_id[new_order_short_us_equities_v1_at] = (new_order_short_us_equities_v1_base + 0 + new_order_short_us_equities_v1_at + 1) % 256; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_record.side = (new_order_short_us_equities_v1_base + 20 + 1) % 256;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> new_order_short_us_equities_v1_record.order_qty[new_order_short_us_equities_v1_at] = (new_order_short_us_equities_v1_base + 21 + new_order_short_us_equities_v1_at + 1) % 256; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> new_order_short_us_equities_v1_record.clearing_firm[new_order_short_us_equities_v1_at] = (new_order_short_us_equities_v1_base + 25 + new_order_short_us_equities_v1_at + 1) % 256; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> new_order_short_us_equities_v1_record.clearing_account[new_order_short_us_equities_v1_at] = (new_order_short_us_equities_v1_base + 29 + new_order_short_us_equities_v1_at + 1) % 256; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 8 -> new_order_short_us_equities_v1_record.price[new_order_short_us_equities_v1_at] = (new_order_short_us_equities_v1_base + 33 + new_order_short_us_equities_v1_at + 1) % 256; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_record.exec_inst = (new_order_short_us_equities_v1_base + 41 + 1) % 256;
  new_order_short_us_equities_v1_record.ord_type = (new_order_short_us_equities_v1_base + 42 + 1) % 256;
  new_order_short_us_equities_v1_record.time_in_force = (new_order_short_us_equities_v1_base + 43 + 1) % 256;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 8 -> new_order_short_us_equities_v1_record.symbol[new_order_short_us_equities_v1_at] = (new_order_short_us_equities_v1_base + 44 + new_order_short_us_equities_v1_at + 1) % 256; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_record.capacity = (new_order_short_us_equities_v1_base + 52 + 1) % 256;
  new_order_short_us_equities_v1_record.short_routing_inst = (new_order_short_us_equities_v1_base + 53 + 1) % 256;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 10 -> new_order_short_us_equities_v1_record.short_account[new_order_short_us_equities_v1_at] = (new_order_short_us_equities_v1_base + 54 + new_order_short_us_equities_v1_at + 1) % 256; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_record.display_indicator = (new_order_short_us_equities_v1_base + 64 + 1) % 256;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 2 -> new_order_short_us_equities_v1_record.risk_group_id[new_order_short_us_equities_v1_at] = (new_order_short_us_equities_v1_base + 65 + new_order_short_us_equities_v1_at + 1) % 256; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> new_order_short_us_equities_v1_record.locate_broker[new_order_short_us_equities_v1_at] = (new_order_short_us_equities_v1_base + 67 + new_order_short_us_equities_v1_at + 1) % 256; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Short Us Equities V 1 to the wire, 71 bytes from where the cursor stands */
inline encode_new_order_short_us_equities_v1(new_order_short_us_equities_v1_record) {
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 20 -> wire[at] = new_order_short_us_equities_v1_record.cl_ord_id[new_order_short_us_equities_v1_at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_us_equities_v1_record.side; at = at + 1;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> wire[at] = new_order_short_us_equities_v1_record.order_qty[new_order_short_us_equities_v1_at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> wire[at] = new_order_short_us_equities_v1_record.clearing_firm[new_order_short_us_equities_v1_at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> wire[at] = new_order_short_us_equities_v1_record.clearing_account[new_order_short_us_equities_v1_at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 8 -> wire[at] = new_order_short_us_equities_v1_record.price[new_order_short_us_equities_v1_at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_us_equities_v1_record.exec_inst; at = at + 1;
  wire[at] = new_order_short_us_equities_v1_record.ord_type; at = at + 1;
  wire[at] = new_order_short_us_equities_v1_record.time_in_force; at = at + 1;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 8 -> wire[at] = new_order_short_us_equities_v1_record.symbol[new_order_short_us_equities_v1_at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_us_equities_v1_record.capacity; at = at + 1;
  wire[at] = new_order_short_us_equities_v1_record.short_routing_inst; at = at + 1;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 10 -> wire[at] = new_order_short_us_equities_v1_record.short_account[new_order_short_us_equities_v1_at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_short_us_equities_v1_record.display_indicator; at = at + 1;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 2 -> wire[at] = new_order_short_us_equities_v1_record.risk_group_id[new_order_short_us_equities_v1_at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> wire[at] = new_order_short_us_equities_v1_record.locate_broker[new_order_short_us_equities_v1_at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Short Us Equities V 1 off the wire, 71 bytes from where the cursor stands */
inline decode_new_order_short_us_equities_v1(new_order_short_us_equities_v1_record) {
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 20 -> new_order_short_us_equities_v1_record.cl_ord_id[new_order_short_us_equities_v1_at] = wire[at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_record.side = wire[at]; at = at + 1;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> new_order_short_us_equities_v1_record.order_qty[new_order_short_us_equities_v1_at] = wire[at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> new_order_short_us_equities_v1_record.clearing_firm[new_order_short_us_equities_v1_at] = wire[at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> new_order_short_us_equities_v1_record.clearing_account[new_order_short_us_equities_v1_at] = wire[at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 8 -> new_order_short_us_equities_v1_record.price[new_order_short_us_equities_v1_at] = wire[at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_record.exec_inst = wire[at]; at = at + 1;
  new_order_short_us_equities_v1_record.ord_type = wire[at]; at = at + 1;
  new_order_short_us_equities_v1_record.time_in_force = wire[at]; at = at + 1;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 8 -> new_order_short_us_equities_v1_record.symbol[new_order_short_us_equities_v1_at] = wire[at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_record.capacity = wire[at]; at = at + 1;
  new_order_short_us_equities_v1_record.short_routing_inst = wire[at]; at = at + 1;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 10 -> new_order_short_us_equities_v1_record.short_account[new_order_short_us_equities_v1_at] = wire[at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_record.display_indicator = wire[at]; at = at + 1;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 2 -> new_order_short_us_equities_v1_record.risk_group_id[new_order_short_us_equities_v1_at] = wire[at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> new_order_short_us_equities_v1_record.locate_broker[new_order_short_us_equities_v1_at] = wire[at]; at = at + 1; new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Short Us Equities V 1 is what was written, byte for byte */
inline equal_new_order_short_us_equities_v1(new_order_short_us_equities_v1_read, new_order_short_us_equities_v1_written) {
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 20 -> assert(new_order_short_us_equities_v1_read.cl_ord_id[new_order_short_us_equities_v1_at] == new_order_short_us_equities_v1_written.cl_ord_id[new_order_short_us_equities_v1_at]); new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_short_us_equities_v1_read.side == new_order_short_us_equities_v1_written.side);
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> assert(new_order_short_us_equities_v1_read.order_qty[new_order_short_us_equities_v1_at] == new_order_short_us_equities_v1_written.order_qty[new_order_short_us_equities_v1_at]); new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> assert(new_order_short_us_equities_v1_read.clearing_firm[new_order_short_us_equities_v1_at] == new_order_short_us_equities_v1_written.clearing_firm[new_order_short_us_equities_v1_at]); new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> assert(new_order_short_us_equities_v1_read.clearing_account[new_order_short_us_equities_v1_at] == new_order_short_us_equities_v1_written.clearing_account[new_order_short_us_equities_v1_at]); new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 8 -> assert(new_order_short_us_equities_v1_read.price[new_order_short_us_equities_v1_at] == new_order_short_us_equities_v1_written.price[new_order_short_us_equities_v1_at]); new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_short_us_equities_v1_read.exec_inst == new_order_short_us_equities_v1_written.exec_inst);
  assert(new_order_short_us_equities_v1_read.ord_type == new_order_short_us_equities_v1_written.ord_type);
  assert(new_order_short_us_equities_v1_read.time_in_force == new_order_short_us_equities_v1_written.time_in_force);
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 8 -> assert(new_order_short_us_equities_v1_read.symbol[new_order_short_us_equities_v1_at] == new_order_short_us_equities_v1_written.symbol[new_order_short_us_equities_v1_at]); new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_short_us_equities_v1_read.capacity == new_order_short_us_equities_v1_written.capacity);
  assert(new_order_short_us_equities_v1_read.short_routing_inst == new_order_short_us_equities_v1_written.short_routing_inst);
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 10 -> assert(new_order_short_us_equities_v1_read.short_account[new_order_short_us_equities_v1_at] == new_order_short_us_equities_v1_written.short_account[new_order_short_us_equities_v1_at]); new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_short_us_equities_v1_read.display_indicator == new_order_short_us_equities_v1_written.display_indicator);
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 2 -> assert(new_order_short_us_equities_v1_read.risk_group_id[new_order_short_us_equities_v1_at] == new_order_short_us_equities_v1_written.risk_group_id[new_order_short_us_equities_v1_at]); new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  new_order_short_us_equities_v1_at = 0;
  do
  :: new_order_short_us_equities_v1_at < 4 -> assert(new_order_short_us_equities_v1_read.locate_broker[new_order_short_us_equities_v1_at] == new_order_short_us_equities_v1_written.locate_broker[new_order_short_us_equities_v1_at]); new_order_short_us_equities_v1_at = new_order_short_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order Us Equities V 1: 24 bytes ---------------------------------- */

/* Request to cancel a single order */
typedef CancelOrderUsEquitiesV1 {
  byte orig_cl_ord_id[20];
  byte clearing_firm[4]
};

int cancel_order_us_equities_v1_at;

/* every byte of Cancel Order Us Equities V 1 set to one value */
inline fill_cancel_order_us_equities_v1(cancel_order_us_equities_v1_record, cancel_order_us_equities_v1_value) {
  cancel_order_us_equities_v1_at = 0;
  do
  :: cancel_order_us_equities_v1_at < 20 -> cancel_order_us_equities_v1_record.orig_cl_ord_id[cancel_order_us_equities_v1_at] = cancel_order_us_equities_v1_value; cancel_order_us_equities_v1_at = cancel_order_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_us_equities_v1_at = 0;
  do
  :: cancel_order_us_equities_v1_at < 4 -> cancel_order_us_equities_v1_record.clearing_firm[cancel_order_us_equities_v1_at] = cancel_order_us_equities_v1_value; cancel_order_us_equities_v1_at = cancel_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_us_equities_v1(cancel_order_us_equities_v1_record, cancel_order_us_equities_v1_base) {
  cancel_order_us_equities_v1_at = 0;
  do
  :: cancel_order_us_equities_v1_at < 20 -> cancel_order_us_equities_v1_record.orig_cl_ord_id[cancel_order_us_equities_v1_at] = (cancel_order_us_equities_v1_base + 0 + cancel_order_us_equities_v1_at + 1) % 256; cancel_order_us_equities_v1_at = cancel_order_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_us_equities_v1_at = 0;
  do
  :: cancel_order_us_equities_v1_at < 4 -> cancel_order_us_equities_v1_record.clearing_firm[cancel_order_us_equities_v1_at] = (cancel_order_us_equities_v1_base + 20 + cancel_order_us_equities_v1_at + 1) % 256; cancel_order_us_equities_v1_at = cancel_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Us Equities V 1 to the wire, 24 bytes from where the cursor stands */
inline encode_cancel_order_us_equities_v1(cancel_order_us_equities_v1_record) {
  cancel_order_us_equities_v1_at = 0;
  do
  :: cancel_order_us_equities_v1_at < 20 -> wire[at] = cancel_order_us_equities_v1_record.orig_cl_ord_id[cancel_order_us_equities_v1_at]; at = at + 1; cancel_order_us_equities_v1_at = cancel_order_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_us_equities_v1_at = 0;
  do
  :: cancel_order_us_equities_v1_at < 4 -> wire[at] = cancel_order_us_equities_v1_record.clearing_firm[cancel_order_us_equities_v1_at]; at = at + 1; cancel_order_us_equities_v1_at = cancel_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Us Equities V 1 off the wire, 24 bytes from where the cursor stands */
inline decode_cancel_order_us_equities_v1(cancel_order_us_equities_v1_record) {
  cancel_order_us_equities_v1_at = 0;
  do
  :: cancel_order_us_equities_v1_at < 20 -> cancel_order_us_equities_v1_record.orig_cl_ord_id[cancel_order_us_equities_v1_at] = wire[at]; at = at + 1; cancel_order_us_equities_v1_at = cancel_order_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_us_equities_v1_at = 0;
  do
  :: cancel_order_us_equities_v1_at < 4 -> cancel_order_us_equities_v1_record.clearing_firm[cancel_order_us_equities_v1_at] = wire[at]; at = at + 1; cancel_order_us_equities_v1_at = cancel_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Us Equities V 1 is what was written, byte for byte */
inline equal_cancel_order_us_equities_v1(cancel_order_us_equities_v1_read, cancel_order_us_equities_v1_written) {
  cancel_order_us_equities_v1_at = 0;
  do
  :: cancel_order_us_equities_v1_at < 20 -> assert(cancel_order_us_equities_v1_read.orig_cl_ord_id[cancel_order_us_equities_v1_at] == cancel_order_us_equities_v1_written.orig_cl_ord_id[cancel_order_us_equities_v1_at]); cancel_order_us_equities_v1_at = cancel_order_us_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_us_equities_v1_at = 0;
  do
  :: cancel_order_us_equities_v1_at < 4 -> assert(cancel_order_us_equities_v1_read.clearing_firm[cancel_order_us_equities_v1_at] == cancel_order_us_equities_v1_written.clearing_firm[cancel_order_us_equities_v1_at]); cancel_order_us_equities_v1_at = cancel_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Us Equities V 1: 83 bytes ---------------------------------- */

/* Request to modify an order */
typedef ModifyOrderUsEquitiesV1 {
  byte cl_ord_id[20];
  byte orig_cl_ord_id[20];
  byte clearing_firm[4];
  byte symbol[8];
  byte order_qty[4];
  byte price[8];
  byte ord_type;
  byte side;
  byte max_floor[4];
  byte stop_px[8];
  byte cancel_orig_on_reject;
  byte locate_broker[4]
};

int modify_order_us_equities_v1_at;

/* every byte of Modify Order Us Equities V 1 set to one value */
inline fill_modify_order_us_equities_v1(modify_order_us_equities_v1_record, modify_order_us_equities_v1_value) {
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 20 -> modify_order_us_equities_v1_record.cl_ord_id[modify_order_us_equities_v1_at] = modify_order_us_equities_v1_value; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 20 -> modify_order_us_equities_v1_record.orig_cl_ord_id[modify_order_us_equities_v1_at] = modify_order_us_equities_v1_value; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> modify_order_us_equities_v1_record.clearing_firm[modify_order_us_equities_v1_at] = modify_order_us_equities_v1_value; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> modify_order_us_equities_v1_record.symbol[modify_order_us_equities_v1_at] = modify_order_us_equities_v1_value; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> modify_order_us_equities_v1_record.order_qty[modify_order_us_equities_v1_at] = modify_order_us_equities_v1_value; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> modify_order_us_equities_v1_record.price[modify_order_us_equities_v1_at] = modify_order_us_equities_v1_value; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_record.ord_type = modify_order_us_equities_v1_value;
  modify_order_us_equities_v1_record.side = modify_order_us_equities_v1_value;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> modify_order_us_equities_v1_record.max_floor[modify_order_us_equities_v1_at] = modify_order_us_equities_v1_value; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> modify_order_us_equities_v1_record.stop_px[modify_order_us_equities_v1_at] = modify_order_us_equities_v1_value; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_record.cancel_orig_on_reject = modify_order_us_equities_v1_value;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> modify_order_us_equities_v1_record.locate_broker[modify_order_us_equities_v1_at] = modify_order_us_equities_v1_value; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_modify_order_us_equities_v1(modify_order_us_equities_v1_record, modify_order_us_equities_v1_base) {
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 20 -> modify_order_us_equities_v1_record.cl_ord_id[modify_order_us_equities_v1_at] = (modify_order_us_equities_v1_base + 0 + modify_order_us_equities_v1_at + 1) % 256; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 20 -> modify_order_us_equities_v1_record.orig_cl_ord_id[modify_order_us_equities_v1_at] = (modify_order_us_equities_v1_base + 20 + modify_order_us_equities_v1_at + 1) % 256; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> modify_order_us_equities_v1_record.clearing_firm[modify_order_us_equities_v1_at] = (modify_order_us_equities_v1_base + 40 + modify_order_us_equities_v1_at + 1) % 256; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> modify_order_us_equities_v1_record.symbol[modify_order_us_equities_v1_at] = (modify_order_us_equities_v1_base + 44 + modify_order_us_equities_v1_at + 1) % 256; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> modify_order_us_equities_v1_record.order_qty[modify_order_us_equities_v1_at] = (modify_order_us_equities_v1_base + 52 + modify_order_us_equities_v1_at + 1) % 256; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> modify_order_us_equities_v1_record.price[modify_order_us_equities_v1_at] = (modify_order_us_equities_v1_base + 56 + modify_order_us_equities_v1_at + 1) % 256; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_record.ord_type = (modify_order_us_equities_v1_base + 64 + 1) % 256;
  modify_order_us_equities_v1_record.side = (modify_order_us_equities_v1_base + 65 + 1) % 256;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> modify_order_us_equities_v1_record.max_floor[modify_order_us_equities_v1_at] = (modify_order_us_equities_v1_base + 66 + modify_order_us_equities_v1_at + 1) % 256; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> modify_order_us_equities_v1_record.stop_px[modify_order_us_equities_v1_at] = (modify_order_us_equities_v1_base + 70 + modify_order_us_equities_v1_at + 1) % 256; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_record.cancel_orig_on_reject = (modify_order_us_equities_v1_base + 78 + 1) % 256;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> modify_order_us_equities_v1_record.locate_broker[modify_order_us_equities_v1_at] = (modify_order_us_equities_v1_base + 79 + modify_order_us_equities_v1_at + 1) % 256; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Us Equities V 1 to the wire, 83 bytes from where the cursor stands */
inline encode_modify_order_us_equities_v1(modify_order_us_equities_v1_record) {
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 20 -> wire[at] = modify_order_us_equities_v1_record.cl_ord_id[modify_order_us_equities_v1_at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 20 -> wire[at] = modify_order_us_equities_v1_record.orig_cl_ord_id[modify_order_us_equities_v1_at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> wire[at] = modify_order_us_equities_v1_record.clearing_firm[modify_order_us_equities_v1_at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> wire[at] = modify_order_us_equities_v1_record.symbol[modify_order_us_equities_v1_at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> wire[at] = modify_order_us_equities_v1_record.order_qty[modify_order_us_equities_v1_at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> wire[at] = modify_order_us_equities_v1_record.price[modify_order_us_equities_v1_at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_us_equities_v1_record.ord_type; at = at + 1;
  wire[at] = modify_order_us_equities_v1_record.side; at = at + 1;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> wire[at] = modify_order_us_equities_v1_record.max_floor[modify_order_us_equities_v1_at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> wire[at] = modify_order_us_equities_v1_record.stop_px[modify_order_us_equities_v1_at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_us_equities_v1_record.cancel_orig_on_reject; at = at + 1;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> wire[at] = modify_order_us_equities_v1_record.locate_broker[modify_order_us_equities_v1_at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Us Equities V 1 off the wire, 83 bytes from where the cursor stands */
inline decode_modify_order_us_equities_v1(modify_order_us_equities_v1_record) {
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 20 -> modify_order_us_equities_v1_record.cl_ord_id[modify_order_us_equities_v1_at] = wire[at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 20 -> modify_order_us_equities_v1_record.orig_cl_ord_id[modify_order_us_equities_v1_at] = wire[at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> modify_order_us_equities_v1_record.clearing_firm[modify_order_us_equities_v1_at] = wire[at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> modify_order_us_equities_v1_record.symbol[modify_order_us_equities_v1_at] = wire[at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> modify_order_us_equities_v1_record.order_qty[modify_order_us_equities_v1_at] = wire[at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> modify_order_us_equities_v1_record.price[modify_order_us_equities_v1_at] = wire[at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_record.ord_type = wire[at]; at = at + 1;
  modify_order_us_equities_v1_record.side = wire[at]; at = at + 1;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> modify_order_us_equities_v1_record.max_floor[modify_order_us_equities_v1_at] = wire[at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> modify_order_us_equities_v1_record.stop_px[modify_order_us_equities_v1_at] = wire[at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_record.cancel_orig_on_reject = wire[at]; at = at + 1;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> modify_order_us_equities_v1_record.locate_broker[modify_order_us_equities_v1_at] = wire[at]; at = at + 1; modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order Us Equities V 1 is what was written, byte for byte */
inline equal_modify_order_us_equities_v1(modify_order_us_equities_v1_read, modify_order_us_equities_v1_written) {
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 20 -> assert(modify_order_us_equities_v1_read.cl_ord_id[modify_order_us_equities_v1_at] == modify_order_us_equities_v1_written.cl_ord_id[modify_order_us_equities_v1_at]); modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 20 -> assert(modify_order_us_equities_v1_read.orig_cl_ord_id[modify_order_us_equities_v1_at] == modify_order_us_equities_v1_written.orig_cl_ord_id[modify_order_us_equities_v1_at]); modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> assert(modify_order_us_equities_v1_read.clearing_firm[modify_order_us_equities_v1_at] == modify_order_us_equities_v1_written.clearing_firm[modify_order_us_equities_v1_at]); modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> assert(modify_order_us_equities_v1_read.symbol[modify_order_us_equities_v1_at] == modify_order_us_equities_v1_written.symbol[modify_order_us_equities_v1_at]); modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> assert(modify_order_us_equities_v1_read.order_qty[modify_order_us_equities_v1_at] == modify_order_us_equities_v1_written.order_qty[modify_order_us_equities_v1_at]); modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> assert(modify_order_us_equities_v1_read.price[modify_order_us_equities_v1_at] == modify_order_us_equities_v1_written.price[modify_order_us_equities_v1_at]); modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(modify_order_us_equities_v1_read.ord_type == modify_order_us_equities_v1_written.ord_type);
  assert(modify_order_us_equities_v1_read.side == modify_order_us_equities_v1_written.side);
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> assert(modify_order_us_equities_v1_read.max_floor[modify_order_us_equities_v1_at] == modify_order_us_equities_v1_written.max_floor[modify_order_us_equities_v1_at]); modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 8 -> assert(modify_order_us_equities_v1_read.stop_px[modify_order_us_equities_v1_at] == modify_order_us_equities_v1_written.stop_px[modify_order_us_equities_v1_at]); modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(modify_order_us_equities_v1_read.cancel_orig_on_reject == modify_order_us_equities_v1_written.cancel_orig_on_reject);
  modify_order_us_equities_v1_at = 0;
  do
  :: modify_order_us_equities_v1_at < 4 -> assert(modify_order_us_equities_v1_read.locate_broker[modify_order_us_equities_v1_at] == modify_order_us_equities_v1_written.locate_broker[modify_order_us_equities_v1_at]); modify_order_us_equities_v1_at = modify_order_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reset Risk Us Equities V 1: 39 bytes ------------------------------------ */

/* Reset or release Firm, Symbol, or Risk Group ID level lockout conditions resulting from risk profile trips or self-imposed lockouts issued via Purge Orders messages */
typedef ResetRiskUsEquitiesV1 {
  byte risk_status_id[16];
  byte risk_reset[8];
  byte clearing_firm[4];
  byte symbol[8];
  byte target_matching_unit;
  byte risk_group_id[2]
};

int reset_risk_us_equities_v1_at;

/* every byte of Reset Risk Us Equities V 1 set to one value */
inline fill_reset_risk_us_equities_v1(reset_risk_us_equities_v1_record, reset_risk_us_equities_v1_value) {
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 16 -> reset_risk_us_equities_v1_record.risk_status_id[reset_risk_us_equities_v1_at] = reset_risk_us_equities_v1_value; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 8 -> reset_risk_us_equities_v1_record.risk_reset[reset_risk_us_equities_v1_at] = reset_risk_us_equities_v1_value; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 4 -> reset_risk_us_equities_v1_record.clearing_firm[reset_risk_us_equities_v1_at] = reset_risk_us_equities_v1_value; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 8 -> reset_risk_us_equities_v1_record.symbol[reset_risk_us_equities_v1_at] = reset_risk_us_equities_v1_value; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_record.target_matching_unit = reset_risk_us_equities_v1_value;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 2 -> reset_risk_us_equities_v1_record.risk_group_id[reset_risk_us_equities_v1_at] = reset_risk_us_equities_v1_value; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reset Risk Us Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_reset_risk_us_equities_v1(reset_risk_us_equities_v1_record, reset_risk_us_equities_v1_base) {
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 16 -> reset_risk_us_equities_v1_record.risk_status_id[reset_risk_us_equities_v1_at] = (reset_risk_us_equities_v1_base + 0 + reset_risk_us_equities_v1_at + 1) % 256; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 8 -> reset_risk_us_equities_v1_record.risk_reset[reset_risk_us_equities_v1_at] = (reset_risk_us_equities_v1_base + 16 + reset_risk_us_equities_v1_at + 1) % 256; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 4 -> reset_risk_us_equities_v1_record.clearing_firm[reset_risk_us_equities_v1_at] = (reset_risk_us_equities_v1_base + 24 + reset_risk_us_equities_v1_at + 1) % 256; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 8 -> reset_risk_us_equities_v1_record.symbol[reset_risk_us_equities_v1_at] = (reset_risk_us_equities_v1_base + 28 + reset_risk_us_equities_v1_at + 1) % 256; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_record.target_matching_unit = (reset_risk_us_equities_v1_base + 36 + 1) % 256;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 2 -> reset_risk_us_equities_v1_record.risk_group_id[reset_risk_us_equities_v1_at] = (reset_risk_us_equities_v1_base + 37 + reset_risk_us_equities_v1_at + 1) % 256; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Risk Us Equities V 1 to the wire, 39 bytes from where the cursor stands */
inline encode_reset_risk_us_equities_v1(reset_risk_us_equities_v1_record) {
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 16 -> wire[at] = reset_risk_us_equities_v1_record.risk_status_id[reset_risk_us_equities_v1_at]; at = at + 1; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 8 -> wire[at] = reset_risk_us_equities_v1_record.risk_reset[reset_risk_us_equities_v1_at]; at = at + 1; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 4 -> wire[at] = reset_risk_us_equities_v1_record.clearing_firm[reset_risk_us_equities_v1_at]; at = at + 1; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 8 -> wire[at] = reset_risk_us_equities_v1_record.symbol[reset_risk_us_equities_v1_at]; at = at + 1; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = reset_risk_us_equities_v1_record.target_matching_unit; at = at + 1;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 2 -> wire[at] = reset_risk_us_equities_v1_record.risk_group_id[reset_risk_us_equities_v1_at]; at = at + 1; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Risk Us Equities V 1 off the wire, 39 bytes from where the cursor stands */
inline decode_reset_risk_us_equities_v1(reset_risk_us_equities_v1_record) {
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 16 -> reset_risk_us_equities_v1_record.risk_status_id[reset_risk_us_equities_v1_at] = wire[at]; at = at + 1; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 8 -> reset_risk_us_equities_v1_record.risk_reset[reset_risk_us_equities_v1_at] = wire[at]; at = at + 1; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 4 -> reset_risk_us_equities_v1_record.clearing_firm[reset_risk_us_equities_v1_at] = wire[at]; at = at + 1; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 8 -> reset_risk_us_equities_v1_record.symbol[reset_risk_us_equities_v1_at] = wire[at]; at = at + 1; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_record.target_matching_unit = wire[at]; at = at + 1;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 2 -> reset_risk_us_equities_v1_record.risk_group_id[reset_risk_us_equities_v1_at] = wire[at]; at = at + 1; reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reset Risk Us Equities V 1 is what was written, byte for byte */
inline equal_reset_risk_us_equities_v1(reset_risk_us_equities_v1_read, reset_risk_us_equities_v1_written) {
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 16 -> assert(reset_risk_us_equities_v1_read.risk_status_id[reset_risk_us_equities_v1_at] == reset_risk_us_equities_v1_written.risk_status_id[reset_risk_us_equities_v1_at]); reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 8 -> assert(reset_risk_us_equities_v1_read.risk_reset[reset_risk_us_equities_v1_at] == reset_risk_us_equities_v1_written.risk_reset[reset_risk_us_equities_v1_at]); reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 4 -> assert(reset_risk_us_equities_v1_read.clearing_firm[reset_risk_us_equities_v1_at] == reset_risk_us_equities_v1_written.clearing_firm[reset_risk_us_equities_v1_at]); reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 8 -> assert(reset_risk_us_equities_v1_read.symbol[reset_risk_us_equities_v1_at] == reset_risk_us_equities_v1_written.symbol[reset_risk_us_equities_v1_at]); reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
  :: else -> break
  od;
  assert(reset_risk_us_equities_v1_read.target_matching_unit == reset_risk_us_equities_v1_written.target_matching_unit);
  reset_risk_us_equities_v1_at = 0;
  do
  :: reset_risk_us_equities_v1_at < 2 -> assert(reset_risk_us_equities_v1_read.risk_group_id[reset_risk_us_equities_v1_at] == reset_risk_us_equities_v1_written.risk_group_id[reset_risk_us_equities_v1_at]); reset_risk_us_equities_v1_at = reset_risk_us_equities_v1_at + 1
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

/* New Order Us Equities V 1: encoded, read back, and compared */
proctype check_new_order_us_equities_v1() {
  NewOrderUsEquitiesV1 new_order_us_equities_v1_sent;
  NewOrderUsEquitiesV1 new_order_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_us_equities_v1(new_order_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_new_order_us_equities_v1(new_order_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_new_order_us_equities_v1(new_order_us_equities_v1_sent, 255)
  :: else -> ramp_new_order_us_equities_v1(new_order_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_us_equities_v1(new_order_us_equities_v1_sent);
    assert(at == 141);
    at = 0;
    decode_new_order_us_equities_v1(new_order_us_equities_v1_got);
    assert(at == 141);
    equal_new_order_us_equities_v1(new_order_us_equities_v1_got, new_order_us_equities_v1_sent)
  }
}

/* New Order Short Us Equities V 1: encoded, read back, and compared */
proctype check_new_order_short_us_equities_v1() {
  NewOrderShortUsEquitiesV1 new_order_short_us_equities_v1_sent;
  NewOrderShortUsEquitiesV1 new_order_short_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_short_us_equities_v1(new_order_short_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_new_order_short_us_equities_v1(new_order_short_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_new_order_short_us_equities_v1(new_order_short_us_equities_v1_sent, 255)
  :: else -> ramp_new_order_short_us_equities_v1(new_order_short_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_short_us_equities_v1(new_order_short_us_equities_v1_sent);
    assert(at == 71);
    at = 0;
    decode_new_order_short_us_equities_v1(new_order_short_us_equities_v1_got);
    assert(at == 71);
    equal_new_order_short_us_equities_v1(new_order_short_us_equities_v1_got, new_order_short_us_equities_v1_sent)
  }
}

/* Cancel Order Us Equities V 1: encoded, read back, and compared */
proctype check_cancel_order_us_equities_v1() {
  CancelOrderUsEquitiesV1 cancel_order_us_equities_v1_sent;
  CancelOrderUsEquitiesV1 cancel_order_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_us_equities_v1(cancel_order_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_cancel_order_us_equities_v1(cancel_order_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_cancel_order_us_equities_v1(cancel_order_us_equities_v1_sent, 255)
  :: else -> ramp_cancel_order_us_equities_v1(cancel_order_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_us_equities_v1(cancel_order_us_equities_v1_sent);
    assert(at == 24);
    at = 0;
    decode_cancel_order_us_equities_v1(cancel_order_us_equities_v1_got);
    assert(at == 24);
    equal_cancel_order_us_equities_v1(cancel_order_us_equities_v1_got, cancel_order_us_equities_v1_sent)
  }
}

/* Modify Order Us Equities V 1: encoded, read back, and compared */
proctype check_modify_order_us_equities_v1() {
  ModifyOrderUsEquitiesV1 modify_order_us_equities_v1_sent;
  ModifyOrderUsEquitiesV1 modify_order_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_us_equities_v1(modify_order_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_modify_order_us_equities_v1(modify_order_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_modify_order_us_equities_v1(modify_order_us_equities_v1_sent, 255)
  :: else -> ramp_modify_order_us_equities_v1(modify_order_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_us_equities_v1(modify_order_us_equities_v1_sent);
    assert(at == 83);
    at = 0;
    decode_modify_order_us_equities_v1(modify_order_us_equities_v1_got);
    assert(at == 83);
    equal_modify_order_us_equities_v1(modify_order_us_equities_v1_got, modify_order_us_equities_v1_sent)
  }
}

/* Reset Risk Us Equities V 1: encoded, read back, and compared */
proctype check_reset_risk_us_equities_v1() {
  ResetRiskUsEquitiesV1 reset_risk_us_equities_v1_sent;
  ResetRiskUsEquitiesV1 reset_risk_us_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reset_risk_us_equities_v1(reset_risk_us_equities_v1_sent, 0)
  :: pattern == 1 -> fill_reset_risk_us_equities_v1(reset_risk_us_equities_v1_sent, 32)
  :: pattern == 2 -> fill_reset_risk_us_equities_v1(reset_risk_us_equities_v1_sent, 255)
  :: else -> ramp_reset_risk_us_equities_v1(reset_risk_us_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reset_risk_us_equities_v1(reset_risk_us_equities_v1_sent);
    assert(at == 39);
    at = 0;
    decode_reset_risk_us_equities_v1(reset_risk_us_equities_v1_got);
    assert(at == 39);
    equal_reset_risk_us_equities_v1(reset_risk_us_equities_v1_got, reset_risk_us_equities_v1_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_firm_message_header()
  :: run check_new_order_us_equities_v1()
  :: run check_new_order_short_us_equities_v1()
  :: run check_cancel_order_us_equities_v1()
  :: run check_modify_order_us_equities_v1()
  :: run check_reset_risk_us_equities_v1()
  fi
}
