/*
 * Chicago Board Options Exchange Order Entry
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
#define WIRE 347

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

/* ---- New Order Ca Equities V 1: 253 bytes ------------------------------------ */

/* New order message for Cboe Canada Equities */
typedef NewOrderCaEquitiesV1 {
  byte account[16];
  byte cl_ord_id[20];
  byte broker_id[2];
  byte exec_inst;
  byte handling_inst;
  byte order_qty[4];
  byte ord_type;
  byte price[8];
  byte stop_px[8];
  byte side;
  byte symbol[14];
  byte time_in_force;
  byte settlement_type;
  byte fut_settl_date[4];
  byte ex_destination;
  byte max_floor[4];
  byte expire_time[8];
  byte expire_date[4];
  byte lei_order_origin;
  byte lei_routing_arrangement_indicator;
  byte umir_account_type;
  byte umir_user_id[12];
  byte basket_trade[4];
  byte program_trade;
  byte jitney[2];
  byte anonymous;
  byte umir_regulation_id;
  byte non_resident;
  byte bypass;
  byte ncib;
  byte no_trade_feat;
  byte no_trade_key[6];
  byte short_marking_exempt;
  byte lei_customer_account[20];
  byte lei_algorithm_id[20];
  byte customer_lei[52];
  byte broker_lei[20];
  byte routing_inst;
  byte display_indicator;
  byte matching_state_participation;
  byte true_min_qty[4]
};

int new_order_ca_equities_v1_at;

/* every byte of New Order Ca Equities V 1 set to one value */
inline fill_new_order_ca_equities_v1(new_order_ca_equities_v1_record, new_order_ca_equities_v1_value) {
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 16 -> new_order_ca_equities_v1_record.account[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> new_order_ca_equities_v1_record.cl_ord_id[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 2 -> new_order_ca_equities_v1_record.broker_id[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.exec_inst = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_record.handling_inst = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.order_qty[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.ord_type = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> new_order_ca_equities_v1_record.price[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> new_order_ca_equities_v1_record.stop_px[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.side = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 14 -> new_order_ca_equities_v1_record.symbol[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.time_in_force = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_record.settlement_type = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.fut_settl_date[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.ex_destination = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.max_floor[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> new_order_ca_equities_v1_record.expire_time[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.expire_date[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.lei_order_origin = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_record.lei_routing_arrangement_indicator = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_record.umir_account_type = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 12 -> new_order_ca_equities_v1_record.umir_user_id[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.basket_trade[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.program_trade = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 2 -> new_order_ca_equities_v1_record.jitney[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.anonymous = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_record.umir_regulation_id = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_record.non_resident = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_record.bypass = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_record.ncib = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_record.no_trade_feat = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 6 -> new_order_ca_equities_v1_record.no_trade_key[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.short_marking_exempt = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> new_order_ca_equities_v1_record.lei_customer_account[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> new_order_ca_equities_v1_record.lei_algorithm_id[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 52 -> new_order_ca_equities_v1_record.customer_lei[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> new_order_ca_equities_v1_record.broker_lei[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.routing_inst = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_record.display_indicator = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_record.matching_state_participation = new_order_ca_equities_v1_value;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.true_min_qty[new_order_ca_equities_v1_at] = new_order_ca_equities_v1_value; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_new_order_ca_equities_v1(new_order_ca_equities_v1_record, new_order_ca_equities_v1_base) {
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 16 -> new_order_ca_equities_v1_record.account[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 0 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> new_order_ca_equities_v1_record.cl_ord_id[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 16 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 2 -> new_order_ca_equities_v1_record.broker_id[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 36 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.exec_inst = (new_order_ca_equities_v1_base + 38 + 1) % 256;
  new_order_ca_equities_v1_record.handling_inst = (new_order_ca_equities_v1_base + 39 + 1) % 256;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.order_qty[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 40 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.ord_type = (new_order_ca_equities_v1_base + 44 + 1) % 256;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> new_order_ca_equities_v1_record.price[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 45 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> new_order_ca_equities_v1_record.stop_px[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 53 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.side = (new_order_ca_equities_v1_base + 61 + 1) % 256;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 14 -> new_order_ca_equities_v1_record.symbol[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 62 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.time_in_force = (new_order_ca_equities_v1_base + 76 + 1) % 256;
  new_order_ca_equities_v1_record.settlement_type = (new_order_ca_equities_v1_base + 77 + 1) % 256;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.fut_settl_date[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 78 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.ex_destination = (new_order_ca_equities_v1_base + 82 + 1) % 256;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.max_floor[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 83 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> new_order_ca_equities_v1_record.expire_time[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 87 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.expire_date[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 95 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.lei_order_origin = (new_order_ca_equities_v1_base + 99 + 1) % 256;
  new_order_ca_equities_v1_record.lei_routing_arrangement_indicator = (new_order_ca_equities_v1_base + 100 + 1) % 256;
  new_order_ca_equities_v1_record.umir_account_type = (new_order_ca_equities_v1_base + 101 + 1) % 256;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 12 -> new_order_ca_equities_v1_record.umir_user_id[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 102 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.basket_trade[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 114 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.program_trade = (new_order_ca_equities_v1_base + 118 + 1) % 256;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 2 -> new_order_ca_equities_v1_record.jitney[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 119 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.anonymous = (new_order_ca_equities_v1_base + 121 + 1) % 256;
  new_order_ca_equities_v1_record.umir_regulation_id = (new_order_ca_equities_v1_base + 122 + 1) % 256;
  new_order_ca_equities_v1_record.non_resident = (new_order_ca_equities_v1_base + 123 + 1) % 256;
  new_order_ca_equities_v1_record.bypass = (new_order_ca_equities_v1_base + 124 + 1) % 256;
  new_order_ca_equities_v1_record.ncib = (new_order_ca_equities_v1_base + 125 + 1) % 256;
  new_order_ca_equities_v1_record.no_trade_feat = (new_order_ca_equities_v1_base + 126 + 1) % 256;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 6 -> new_order_ca_equities_v1_record.no_trade_key[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 127 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.short_marking_exempt = (new_order_ca_equities_v1_base + 133 + 1) % 256;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> new_order_ca_equities_v1_record.lei_customer_account[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 134 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> new_order_ca_equities_v1_record.lei_algorithm_id[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 154 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 52 -> new_order_ca_equities_v1_record.customer_lei[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 174 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> new_order_ca_equities_v1_record.broker_lei[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 226 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.routing_inst = (new_order_ca_equities_v1_base + 246 + 1) % 256;
  new_order_ca_equities_v1_record.display_indicator = (new_order_ca_equities_v1_base + 247 + 1) % 256;
  new_order_ca_equities_v1_record.matching_state_participation = (new_order_ca_equities_v1_base + 248 + 1) % 256;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.true_min_qty[new_order_ca_equities_v1_at] = (new_order_ca_equities_v1_base + 249 + new_order_ca_equities_v1_at + 1) % 256; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Ca Equities V 1 to the wire, 253 bytes from where the cursor stands */
inline encode_new_order_ca_equities_v1(new_order_ca_equities_v1_record) {
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 16 -> wire[at] = new_order_ca_equities_v1_record.account[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> wire[at] = new_order_ca_equities_v1_record.cl_ord_id[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 2 -> wire[at] = new_order_ca_equities_v1_record.broker_id[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v1_record.exec_inst; at = at + 1;
  wire[at] = new_order_ca_equities_v1_record.handling_inst; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> wire[at] = new_order_ca_equities_v1_record.order_qty[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v1_record.ord_type; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> wire[at] = new_order_ca_equities_v1_record.price[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> wire[at] = new_order_ca_equities_v1_record.stop_px[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v1_record.side; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 14 -> wire[at] = new_order_ca_equities_v1_record.symbol[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v1_record.time_in_force; at = at + 1;
  wire[at] = new_order_ca_equities_v1_record.settlement_type; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> wire[at] = new_order_ca_equities_v1_record.fut_settl_date[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v1_record.ex_destination; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> wire[at] = new_order_ca_equities_v1_record.max_floor[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> wire[at] = new_order_ca_equities_v1_record.expire_time[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> wire[at] = new_order_ca_equities_v1_record.expire_date[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v1_record.lei_order_origin; at = at + 1;
  wire[at] = new_order_ca_equities_v1_record.lei_routing_arrangement_indicator; at = at + 1;
  wire[at] = new_order_ca_equities_v1_record.umir_account_type; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 12 -> wire[at] = new_order_ca_equities_v1_record.umir_user_id[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> wire[at] = new_order_ca_equities_v1_record.basket_trade[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v1_record.program_trade; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 2 -> wire[at] = new_order_ca_equities_v1_record.jitney[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v1_record.anonymous; at = at + 1;
  wire[at] = new_order_ca_equities_v1_record.umir_regulation_id; at = at + 1;
  wire[at] = new_order_ca_equities_v1_record.non_resident; at = at + 1;
  wire[at] = new_order_ca_equities_v1_record.bypass; at = at + 1;
  wire[at] = new_order_ca_equities_v1_record.ncib; at = at + 1;
  wire[at] = new_order_ca_equities_v1_record.no_trade_feat; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 6 -> wire[at] = new_order_ca_equities_v1_record.no_trade_key[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v1_record.short_marking_exempt; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> wire[at] = new_order_ca_equities_v1_record.lei_customer_account[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> wire[at] = new_order_ca_equities_v1_record.lei_algorithm_id[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 52 -> wire[at] = new_order_ca_equities_v1_record.customer_lei[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> wire[at] = new_order_ca_equities_v1_record.broker_lei[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v1_record.routing_inst; at = at + 1;
  wire[at] = new_order_ca_equities_v1_record.display_indicator; at = at + 1;
  wire[at] = new_order_ca_equities_v1_record.matching_state_participation; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> wire[at] = new_order_ca_equities_v1_record.true_min_qty[new_order_ca_equities_v1_at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Ca Equities V 1 off the wire, 253 bytes from where the cursor stands */
inline decode_new_order_ca_equities_v1(new_order_ca_equities_v1_record) {
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 16 -> new_order_ca_equities_v1_record.account[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> new_order_ca_equities_v1_record.cl_ord_id[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 2 -> new_order_ca_equities_v1_record.broker_id[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.exec_inst = wire[at]; at = at + 1;
  new_order_ca_equities_v1_record.handling_inst = wire[at]; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.order_qty[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.ord_type = wire[at]; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> new_order_ca_equities_v1_record.price[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> new_order_ca_equities_v1_record.stop_px[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.side = wire[at]; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 14 -> new_order_ca_equities_v1_record.symbol[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.time_in_force = wire[at]; at = at + 1;
  new_order_ca_equities_v1_record.settlement_type = wire[at]; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.fut_settl_date[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.ex_destination = wire[at]; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.max_floor[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> new_order_ca_equities_v1_record.expire_time[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.expire_date[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.lei_order_origin = wire[at]; at = at + 1;
  new_order_ca_equities_v1_record.lei_routing_arrangement_indicator = wire[at]; at = at + 1;
  new_order_ca_equities_v1_record.umir_account_type = wire[at]; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 12 -> new_order_ca_equities_v1_record.umir_user_id[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.basket_trade[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.program_trade = wire[at]; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 2 -> new_order_ca_equities_v1_record.jitney[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.anonymous = wire[at]; at = at + 1;
  new_order_ca_equities_v1_record.umir_regulation_id = wire[at]; at = at + 1;
  new_order_ca_equities_v1_record.non_resident = wire[at]; at = at + 1;
  new_order_ca_equities_v1_record.bypass = wire[at]; at = at + 1;
  new_order_ca_equities_v1_record.ncib = wire[at]; at = at + 1;
  new_order_ca_equities_v1_record.no_trade_feat = wire[at]; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 6 -> new_order_ca_equities_v1_record.no_trade_key[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.short_marking_exempt = wire[at]; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> new_order_ca_equities_v1_record.lei_customer_account[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> new_order_ca_equities_v1_record.lei_algorithm_id[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 52 -> new_order_ca_equities_v1_record.customer_lei[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> new_order_ca_equities_v1_record.broker_lei[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_record.routing_inst = wire[at]; at = at + 1;
  new_order_ca_equities_v1_record.display_indicator = wire[at]; at = at + 1;
  new_order_ca_equities_v1_record.matching_state_participation = wire[at]; at = at + 1;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> new_order_ca_equities_v1_record.true_min_qty[new_order_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Ca Equities V 1 is what was written, byte for byte */
inline equal_new_order_ca_equities_v1(new_order_ca_equities_v1_read, new_order_ca_equities_v1_written) {
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 16 -> assert(new_order_ca_equities_v1_read.account[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.account[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> assert(new_order_ca_equities_v1_read.cl_ord_id[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.cl_ord_id[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 2 -> assert(new_order_ca_equities_v1_read.broker_id[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.broker_id[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v1_read.exec_inst == new_order_ca_equities_v1_written.exec_inst);
  assert(new_order_ca_equities_v1_read.handling_inst == new_order_ca_equities_v1_written.handling_inst);
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> assert(new_order_ca_equities_v1_read.order_qty[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.order_qty[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v1_read.ord_type == new_order_ca_equities_v1_written.ord_type);
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> assert(new_order_ca_equities_v1_read.price[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.price[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> assert(new_order_ca_equities_v1_read.stop_px[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.stop_px[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v1_read.side == new_order_ca_equities_v1_written.side);
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 14 -> assert(new_order_ca_equities_v1_read.symbol[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.symbol[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v1_read.time_in_force == new_order_ca_equities_v1_written.time_in_force);
  assert(new_order_ca_equities_v1_read.settlement_type == new_order_ca_equities_v1_written.settlement_type);
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> assert(new_order_ca_equities_v1_read.fut_settl_date[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.fut_settl_date[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v1_read.ex_destination == new_order_ca_equities_v1_written.ex_destination);
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> assert(new_order_ca_equities_v1_read.max_floor[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.max_floor[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 8 -> assert(new_order_ca_equities_v1_read.expire_time[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.expire_time[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> assert(new_order_ca_equities_v1_read.expire_date[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.expire_date[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v1_read.lei_order_origin == new_order_ca_equities_v1_written.lei_order_origin);
  assert(new_order_ca_equities_v1_read.lei_routing_arrangement_indicator == new_order_ca_equities_v1_written.lei_routing_arrangement_indicator);
  assert(new_order_ca_equities_v1_read.umir_account_type == new_order_ca_equities_v1_written.umir_account_type);
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 12 -> assert(new_order_ca_equities_v1_read.umir_user_id[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.umir_user_id[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> assert(new_order_ca_equities_v1_read.basket_trade[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.basket_trade[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v1_read.program_trade == new_order_ca_equities_v1_written.program_trade);
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 2 -> assert(new_order_ca_equities_v1_read.jitney[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.jitney[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v1_read.anonymous == new_order_ca_equities_v1_written.anonymous);
  assert(new_order_ca_equities_v1_read.umir_regulation_id == new_order_ca_equities_v1_written.umir_regulation_id);
  assert(new_order_ca_equities_v1_read.non_resident == new_order_ca_equities_v1_written.non_resident);
  assert(new_order_ca_equities_v1_read.bypass == new_order_ca_equities_v1_written.bypass);
  assert(new_order_ca_equities_v1_read.ncib == new_order_ca_equities_v1_written.ncib);
  assert(new_order_ca_equities_v1_read.no_trade_feat == new_order_ca_equities_v1_written.no_trade_feat);
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 6 -> assert(new_order_ca_equities_v1_read.no_trade_key[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.no_trade_key[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v1_read.short_marking_exempt == new_order_ca_equities_v1_written.short_marking_exempt);
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> assert(new_order_ca_equities_v1_read.lei_customer_account[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.lei_customer_account[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> assert(new_order_ca_equities_v1_read.lei_algorithm_id[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.lei_algorithm_id[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 52 -> assert(new_order_ca_equities_v1_read.customer_lei[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.customer_lei[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 20 -> assert(new_order_ca_equities_v1_read.broker_lei[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.broker_lei[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v1_read.routing_inst == new_order_ca_equities_v1_written.routing_inst);
  assert(new_order_ca_equities_v1_read.display_indicator == new_order_ca_equities_v1_written.display_indicator);
  assert(new_order_ca_equities_v1_read.matching_state_participation == new_order_ca_equities_v1_written.matching_state_participation);
  new_order_ca_equities_v1_at = 0;
  do
  :: new_order_ca_equities_v1_at < 4 -> assert(new_order_ca_equities_v1_read.true_min_qty[new_order_ca_equities_v1_at] == new_order_ca_equities_v1_written.true_min_qty[new_order_ca_equities_v1_at]); new_order_ca_equities_v1_at = new_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Order Ca Equities V 2: 261 bytes ------------------------------------ */

/* New order V2 message for Cboe Canada Equities, adds PegDifference */
typedef NewOrderCaEquitiesV2 {
  byte account[16];
  byte cl_ord_id[20];
  byte broker_id[2];
  byte exec_inst;
  byte handling_inst;
  byte order_qty[4];
  byte ord_type;
  byte price[8];
  byte stop_px[8];
  byte side;
  byte symbol[14];
  byte time_in_force;
  byte settlement_type;
  byte fut_settl_date[4];
  byte ex_destination;
  byte max_floor[4];
  byte expire_time[8];
  byte expire_date[4];
  byte lei_order_origin;
  byte lei_routing_arrangement_indicator;
  byte umir_account_type;
  byte umir_user_id[12];
  byte basket_trade[4];
  byte program_trade;
  byte jitney[2];
  byte anonymous;
  byte umir_regulation_id;
  byte non_resident;
  byte bypass;
  byte ncib;
  byte no_trade_feat;
  byte no_trade_key[6];
  byte short_marking_exempt;
  byte lei_customer_account[20];
  byte lei_algorithm_id[20];
  byte customer_lei[52];
  byte broker_lei[20];
  byte routing_inst;
  byte display_indicator;
  byte matching_state_participation;
  byte true_min_qty[4];
  byte peg_difference[8]
};

int new_order_ca_equities_v2_at;

/* every byte of New Order Ca Equities V 2 set to one value */
inline fill_new_order_ca_equities_v2(new_order_ca_equities_v2_record, new_order_ca_equities_v2_value) {
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 16 -> new_order_ca_equities_v2_record.account[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> new_order_ca_equities_v2_record.cl_ord_id[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 2 -> new_order_ca_equities_v2_record.broker_id[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.exec_inst = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_record.handling_inst = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.order_qty[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.ord_type = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> new_order_ca_equities_v2_record.price[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> new_order_ca_equities_v2_record.stop_px[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.side = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 14 -> new_order_ca_equities_v2_record.symbol[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.time_in_force = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_record.settlement_type = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.fut_settl_date[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.ex_destination = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.max_floor[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> new_order_ca_equities_v2_record.expire_time[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.expire_date[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.lei_order_origin = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_record.lei_routing_arrangement_indicator = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_record.umir_account_type = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 12 -> new_order_ca_equities_v2_record.umir_user_id[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.basket_trade[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.program_trade = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 2 -> new_order_ca_equities_v2_record.jitney[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.anonymous = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_record.umir_regulation_id = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_record.non_resident = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_record.bypass = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_record.ncib = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_record.no_trade_feat = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 6 -> new_order_ca_equities_v2_record.no_trade_key[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.short_marking_exempt = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> new_order_ca_equities_v2_record.lei_customer_account[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> new_order_ca_equities_v2_record.lei_algorithm_id[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 52 -> new_order_ca_equities_v2_record.customer_lei[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> new_order_ca_equities_v2_record.broker_lei[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.routing_inst = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_record.display_indicator = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_record.matching_state_participation = new_order_ca_equities_v2_value;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.true_min_qty[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> new_order_ca_equities_v2_record.peg_difference[new_order_ca_equities_v2_at] = new_order_ca_equities_v2_value; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Ca Equities V 2 set to where it lies, so a field read out of place says so */
inline ramp_new_order_ca_equities_v2(new_order_ca_equities_v2_record, new_order_ca_equities_v2_base) {
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 16 -> new_order_ca_equities_v2_record.account[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 0 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> new_order_ca_equities_v2_record.cl_ord_id[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 16 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 2 -> new_order_ca_equities_v2_record.broker_id[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 36 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.exec_inst = (new_order_ca_equities_v2_base + 38 + 1) % 256;
  new_order_ca_equities_v2_record.handling_inst = (new_order_ca_equities_v2_base + 39 + 1) % 256;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.order_qty[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 40 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.ord_type = (new_order_ca_equities_v2_base + 44 + 1) % 256;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> new_order_ca_equities_v2_record.price[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 45 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> new_order_ca_equities_v2_record.stop_px[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 53 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.side = (new_order_ca_equities_v2_base + 61 + 1) % 256;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 14 -> new_order_ca_equities_v2_record.symbol[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 62 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.time_in_force = (new_order_ca_equities_v2_base + 76 + 1) % 256;
  new_order_ca_equities_v2_record.settlement_type = (new_order_ca_equities_v2_base + 77 + 1) % 256;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.fut_settl_date[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 78 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.ex_destination = (new_order_ca_equities_v2_base + 82 + 1) % 256;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.max_floor[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 83 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> new_order_ca_equities_v2_record.expire_time[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 87 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.expire_date[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 95 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.lei_order_origin = (new_order_ca_equities_v2_base + 99 + 1) % 256;
  new_order_ca_equities_v2_record.lei_routing_arrangement_indicator = (new_order_ca_equities_v2_base + 100 + 1) % 256;
  new_order_ca_equities_v2_record.umir_account_type = (new_order_ca_equities_v2_base + 101 + 1) % 256;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 12 -> new_order_ca_equities_v2_record.umir_user_id[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 102 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.basket_trade[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 114 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.program_trade = (new_order_ca_equities_v2_base + 118 + 1) % 256;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 2 -> new_order_ca_equities_v2_record.jitney[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 119 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.anonymous = (new_order_ca_equities_v2_base + 121 + 1) % 256;
  new_order_ca_equities_v2_record.umir_regulation_id = (new_order_ca_equities_v2_base + 122 + 1) % 256;
  new_order_ca_equities_v2_record.non_resident = (new_order_ca_equities_v2_base + 123 + 1) % 256;
  new_order_ca_equities_v2_record.bypass = (new_order_ca_equities_v2_base + 124 + 1) % 256;
  new_order_ca_equities_v2_record.ncib = (new_order_ca_equities_v2_base + 125 + 1) % 256;
  new_order_ca_equities_v2_record.no_trade_feat = (new_order_ca_equities_v2_base + 126 + 1) % 256;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 6 -> new_order_ca_equities_v2_record.no_trade_key[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 127 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.short_marking_exempt = (new_order_ca_equities_v2_base + 133 + 1) % 256;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> new_order_ca_equities_v2_record.lei_customer_account[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 134 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> new_order_ca_equities_v2_record.lei_algorithm_id[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 154 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 52 -> new_order_ca_equities_v2_record.customer_lei[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 174 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> new_order_ca_equities_v2_record.broker_lei[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 226 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.routing_inst = (new_order_ca_equities_v2_base + 246 + 1) % 256;
  new_order_ca_equities_v2_record.display_indicator = (new_order_ca_equities_v2_base + 247 + 1) % 256;
  new_order_ca_equities_v2_record.matching_state_participation = (new_order_ca_equities_v2_base + 248 + 1) % 256;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.true_min_qty[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 249 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> new_order_ca_equities_v2_record.peg_difference[new_order_ca_equities_v2_at] = (new_order_ca_equities_v2_base + 253 + new_order_ca_equities_v2_at + 1) % 256; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Ca Equities V 2 to the wire, 261 bytes from where the cursor stands */
inline encode_new_order_ca_equities_v2(new_order_ca_equities_v2_record) {
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 16 -> wire[at] = new_order_ca_equities_v2_record.account[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> wire[at] = new_order_ca_equities_v2_record.cl_ord_id[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 2 -> wire[at] = new_order_ca_equities_v2_record.broker_id[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v2_record.exec_inst; at = at + 1;
  wire[at] = new_order_ca_equities_v2_record.handling_inst; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> wire[at] = new_order_ca_equities_v2_record.order_qty[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v2_record.ord_type; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> wire[at] = new_order_ca_equities_v2_record.price[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> wire[at] = new_order_ca_equities_v2_record.stop_px[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v2_record.side; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 14 -> wire[at] = new_order_ca_equities_v2_record.symbol[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v2_record.time_in_force; at = at + 1;
  wire[at] = new_order_ca_equities_v2_record.settlement_type; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> wire[at] = new_order_ca_equities_v2_record.fut_settl_date[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v2_record.ex_destination; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> wire[at] = new_order_ca_equities_v2_record.max_floor[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> wire[at] = new_order_ca_equities_v2_record.expire_time[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> wire[at] = new_order_ca_equities_v2_record.expire_date[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v2_record.lei_order_origin; at = at + 1;
  wire[at] = new_order_ca_equities_v2_record.lei_routing_arrangement_indicator; at = at + 1;
  wire[at] = new_order_ca_equities_v2_record.umir_account_type; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 12 -> wire[at] = new_order_ca_equities_v2_record.umir_user_id[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> wire[at] = new_order_ca_equities_v2_record.basket_trade[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v2_record.program_trade; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 2 -> wire[at] = new_order_ca_equities_v2_record.jitney[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v2_record.anonymous; at = at + 1;
  wire[at] = new_order_ca_equities_v2_record.umir_regulation_id; at = at + 1;
  wire[at] = new_order_ca_equities_v2_record.non_resident; at = at + 1;
  wire[at] = new_order_ca_equities_v2_record.bypass; at = at + 1;
  wire[at] = new_order_ca_equities_v2_record.ncib; at = at + 1;
  wire[at] = new_order_ca_equities_v2_record.no_trade_feat; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 6 -> wire[at] = new_order_ca_equities_v2_record.no_trade_key[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v2_record.short_marking_exempt; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> wire[at] = new_order_ca_equities_v2_record.lei_customer_account[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> wire[at] = new_order_ca_equities_v2_record.lei_algorithm_id[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 52 -> wire[at] = new_order_ca_equities_v2_record.customer_lei[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> wire[at] = new_order_ca_equities_v2_record.broker_lei[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ca_equities_v2_record.routing_inst; at = at + 1;
  wire[at] = new_order_ca_equities_v2_record.display_indicator; at = at + 1;
  wire[at] = new_order_ca_equities_v2_record.matching_state_participation; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> wire[at] = new_order_ca_equities_v2_record.true_min_qty[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> wire[at] = new_order_ca_equities_v2_record.peg_difference[new_order_ca_equities_v2_at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Ca Equities V 2 off the wire, 261 bytes from where the cursor stands */
inline decode_new_order_ca_equities_v2(new_order_ca_equities_v2_record) {
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 16 -> new_order_ca_equities_v2_record.account[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> new_order_ca_equities_v2_record.cl_ord_id[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 2 -> new_order_ca_equities_v2_record.broker_id[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.exec_inst = wire[at]; at = at + 1;
  new_order_ca_equities_v2_record.handling_inst = wire[at]; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.order_qty[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.ord_type = wire[at]; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> new_order_ca_equities_v2_record.price[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> new_order_ca_equities_v2_record.stop_px[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.side = wire[at]; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 14 -> new_order_ca_equities_v2_record.symbol[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.time_in_force = wire[at]; at = at + 1;
  new_order_ca_equities_v2_record.settlement_type = wire[at]; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.fut_settl_date[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.ex_destination = wire[at]; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.max_floor[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> new_order_ca_equities_v2_record.expire_time[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.expire_date[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.lei_order_origin = wire[at]; at = at + 1;
  new_order_ca_equities_v2_record.lei_routing_arrangement_indicator = wire[at]; at = at + 1;
  new_order_ca_equities_v2_record.umir_account_type = wire[at]; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 12 -> new_order_ca_equities_v2_record.umir_user_id[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.basket_trade[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.program_trade = wire[at]; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 2 -> new_order_ca_equities_v2_record.jitney[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.anonymous = wire[at]; at = at + 1;
  new_order_ca_equities_v2_record.umir_regulation_id = wire[at]; at = at + 1;
  new_order_ca_equities_v2_record.non_resident = wire[at]; at = at + 1;
  new_order_ca_equities_v2_record.bypass = wire[at]; at = at + 1;
  new_order_ca_equities_v2_record.ncib = wire[at]; at = at + 1;
  new_order_ca_equities_v2_record.no_trade_feat = wire[at]; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 6 -> new_order_ca_equities_v2_record.no_trade_key[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.short_marking_exempt = wire[at]; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> new_order_ca_equities_v2_record.lei_customer_account[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> new_order_ca_equities_v2_record.lei_algorithm_id[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 52 -> new_order_ca_equities_v2_record.customer_lei[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> new_order_ca_equities_v2_record.broker_lei[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_record.routing_inst = wire[at]; at = at + 1;
  new_order_ca_equities_v2_record.display_indicator = wire[at]; at = at + 1;
  new_order_ca_equities_v2_record.matching_state_participation = wire[at]; at = at + 1;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> new_order_ca_equities_v2_record.true_min_qty[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> new_order_ca_equities_v2_record.peg_difference[new_order_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Ca Equities V 2 is what was written, byte for byte */
inline equal_new_order_ca_equities_v2(new_order_ca_equities_v2_read, new_order_ca_equities_v2_written) {
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 16 -> assert(new_order_ca_equities_v2_read.account[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.account[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> assert(new_order_ca_equities_v2_read.cl_ord_id[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.cl_ord_id[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 2 -> assert(new_order_ca_equities_v2_read.broker_id[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.broker_id[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v2_read.exec_inst == new_order_ca_equities_v2_written.exec_inst);
  assert(new_order_ca_equities_v2_read.handling_inst == new_order_ca_equities_v2_written.handling_inst);
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> assert(new_order_ca_equities_v2_read.order_qty[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.order_qty[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v2_read.ord_type == new_order_ca_equities_v2_written.ord_type);
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> assert(new_order_ca_equities_v2_read.price[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.price[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> assert(new_order_ca_equities_v2_read.stop_px[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.stop_px[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v2_read.side == new_order_ca_equities_v2_written.side);
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 14 -> assert(new_order_ca_equities_v2_read.symbol[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.symbol[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v2_read.time_in_force == new_order_ca_equities_v2_written.time_in_force);
  assert(new_order_ca_equities_v2_read.settlement_type == new_order_ca_equities_v2_written.settlement_type);
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> assert(new_order_ca_equities_v2_read.fut_settl_date[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.fut_settl_date[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v2_read.ex_destination == new_order_ca_equities_v2_written.ex_destination);
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> assert(new_order_ca_equities_v2_read.max_floor[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.max_floor[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> assert(new_order_ca_equities_v2_read.expire_time[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.expire_time[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> assert(new_order_ca_equities_v2_read.expire_date[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.expire_date[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v2_read.lei_order_origin == new_order_ca_equities_v2_written.lei_order_origin);
  assert(new_order_ca_equities_v2_read.lei_routing_arrangement_indicator == new_order_ca_equities_v2_written.lei_routing_arrangement_indicator);
  assert(new_order_ca_equities_v2_read.umir_account_type == new_order_ca_equities_v2_written.umir_account_type);
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 12 -> assert(new_order_ca_equities_v2_read.umir_user_id[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.umir_user_id[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> assert(new_order_ca_equities_v2_read.basket_trade[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.basket_trade[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v2_read.program_trade == new_order_ca_equities_v2_written.program_trade);
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 2 -> assert(new_order_ca_equities_v2_read.jitney[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.jitney[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v2_read.anonymous == new_order_ca_equities_v2_written.anonymous);
  assert(new_order_ca_equities_v2_read.umir_regulation_id == new_order_ca_equities_v2_written.umir_regulation_id);
  assert(new_order_ca_equities_v2_read.non_resident == new_order_ca_equities_v2_written.non_resident);
  assert(new_order_ca_equities_v2_read.bypass == new_order_ca_equities_v2_written.bypass);
  assert(new_order_ca_equities_v2_read.ncib == new_order_ca_equities_v2_written.ncib);
  assert(new_order_ca_equities_v2_read.no_trade_feat == new_order_ca_equities_v2_written.no_trade_feat);
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 6 -> assert(new_order_ca_equities_v2_read.no_trade_key[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.no_trade_key[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v2_read.short_marking_exempt == new_order_ca_equities_v2_written.short_marking_exempt);
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> assert(new_order_ca_equities_v2_read.lei_customer_account[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.lei_customer_account[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> assert(new_order_ca_equities_v2_read.lei_algorithm_id[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.lei_algorithm_id[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 52 -> assert(new_order_ca_equities_v2_read.customer_lei[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.customer_lei[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 20 -> assert(new_order_ca_equities_v2_read.broker_lei[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.broker_lei[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_ca_equities_v2_read.routing_inst == new_order_ca_equities_v2_written.routing_inst);
  assert(new_order_ca_equities_v2_read.display_indicator == new_order_ca_equities_v2_written.display_indicator);
  assert(new_order_ca_equities_v2_read.matching_state_participation == new_order_ca_equities_v2_written.matching_state_participation);
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 4 -> assert(new_order_ca_equities_v2_read.true_min_qty[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.true_min_qty[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_ca_equities_v2_at = 0;
  do
  :: new_order_ca_equities_v2_at < 8 -> assert(new_order_ca_equities_v2_read.peg_difference[new_order_ca_equities_v2_at] == new_order_ca_equities_v2_written.peg_difference[new_order_ca_equities_v2_at]); new_order_ca_equities_v2_at = new_order_ca_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Ca Equities V 1: 215 bytes --------------------------------- */

/* Request to modify an existing order */
typedef ModifyOrderCaEquitiesV1 {
  byte cl_ord_id[20];
  byte orig_cl_ord_id[20];
  byte broker_id[2];
  byte account[16];
  byte order_qty[4];
  byte price[8];
  byte stop_px[8];
  byte time_in_force;
  byte max_floor[4];
  byte expire_date[4];
  byte lei_order_origin;
  byte lei_routing_arrangement_indicator;
  byte umir_account_type;
  byte lei_customer_account[20];
  byte lei_algorithm_id[20];
  byte customer_lei[52];
  byte broker_lei[20];
  byte cancel_orig_on_reject;
  byte true_min_qty[4];
  byte expire_time[8]
};

int modify_order_ca_equities_v1_at;

/* every byte of Modify Order Ca Equities V 1 set to one value */
inline fill_modify_order_ca_equities_v1(modify_order_ca_equities_v1_record, modify_order_ca_equities_v1_value) {
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.cl_ord_id[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.orig_cl_ord_id[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 2 -> modify_order_ca_equities_v1_record.broker_id[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 16 -> modify_order_ca_equities_v1_record.account[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> modify_order_ca_equities_v1_record.order_qty[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> modify_order_ca_equities_v1_record.price[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> modify_order_ca_equities_v1_record.stop_px[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_record.time_in_force = modify_order_ca_equities_v1_value;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> modify_order_ca_equities_v1_record.max_floor[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> modify_order_ca_equities_v1_record.expire_date[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_record.lei_order_origin = modify_order_ca_equities_v1_value;
  modify_order_ca_equities_v1_record.lei_routing_arrangement_indicator = modify_order_ca_equities_v1_value;
  modify_order_ca_equities_v1_record.umir_account_type = modify_order_ca_equities_v1_value;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.lei_customer_account[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.lei_algorithm_id[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 52 -> modify_order_ca_equities_v1_record.customer_lei[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.broker_lei[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_record.cancel_orig_on_reject = modify_order_ca_equities_v1_value;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> modify_order_ca_equities_v1_record.true_min_qty[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> modify_order_ca_equities_v1_record.expire_time[modify_order_ca_equities_v1_at] = modify_order_ca_equities_v1_value; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_modify_order_ca_equities_v1(modify_order_ca_equities_v1_record, modify_order_ca_equities_v1_base) {
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.cl_ord_id[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 0 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.orig_cl_ord_id[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 20 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 2 -> modify_order_ca_equities_v1_record.broker_id[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 40 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 16 -> modify_order_ca_equities_v1_record.account[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 42 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> modify_order_ca_equities_v1_record.order_qty[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 58 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> modify_order_ca_equities_v1_record.price[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 62 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> modify_order_ca_equities_v1_record.stop_px[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 70 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_record.time_in_force = (modify_order_ca_equities_v1_base + 78 + 1) % 256;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> modify_order_ca_equities_v1_record.max_floor[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 79 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> modify_order_ca_equities_v1_record.expire_date[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 83 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_record.lei_order_origin = (modify_order_ca_equities_v1_base + 87 + 1) % 256;
  modify_order_ca_equities_v1_record.lei_routing_arrangement_indicator = (modify_order_ca_equities_v1_base + 88 + 1) % 256;
  modify_order_ca_equities_v1_record.umir_account_type = (modify_order_ca_equities_v1_base + 89 + 1) % 256;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.lei_customer_account[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 90 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.lei_algorithm_id[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 110 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 52 -> modify_order_ca_equities_v1_record.customer_lei[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 130 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.broker_lei[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 182 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_record.cancel_orig_on_reject = (modify_order_ca_equities_v1_base + 202 + 1) % 256;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> modify_order_ca_equities_v1_record.true_min_qty[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 203 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> modify_order_ca_equities_v1_record.expire_time[modify_order_ca_equities_v1_at] = (modify_order_ca_equities_v1_base + 207 + modify_order_ca_equities_v1_at + 1) % 256; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Ca Equities V 1 to the wire, 215 bytes from where the cursor stands */
inline encode_modify_order_ca_equities_v1(modify_order_ca_equities_v1_record) {
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> wire[at] = modify_order_ca_equities_v1_record.cl_ord_id[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> wire[at] = modify_order_ca_equities_v1_record.orig_cl_ord_id[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 2 -> wire[at] = modify_order_ca_equities_v1_record.broker_id[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 16 -> wire[at] = modify_order_ca_equities_v1_record.account[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> wire[at] = modify_order_ca_equities_v1_record.order_qty[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> wire[at] = modify_order_ca_equities_v1_record.price[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> wire[at] = modify_order_ca_equities_v1_record.stop_px[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_ca_equities_v1_record.time_in_force; at = at + 1;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> wire[at] = modify_order_ca_equities_v1_record.max_floor[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> wire[at] = modify_order_ca_equities_v1_record.expire_date[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_ca_equities_v1_record.lei_order_origin; at = at + 1;
  wire[at] = modify_order_ca_equities_v1_record.lei_routing_arrangement_indicator; at = at + 1;
  wire[at] = modify_order_ca_equities_v1_record.umir_account_type; at = at + 1;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> wire[at] = modify_order_ca_equities_v1_record.lei_customer_account[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> wire[at] = modify_order_ca_equities_v1_record.lei_algorithm_id[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 52 -> wire[at] = modify_order_ca_equities_v1_record.customer_lei[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> wire[at] = modify_order_ca_equities_v1_record.broker_lei[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_ca_equities_v1_record.cancel_orig_on_reject; at = at + 1;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> wire[at] = modify_order_ca_equities_v1_record.true_min_qty[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> wire[at] = modify_order_ca_equities_v1_record.expire_time[modify_order_ca_equities_v1_at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Ca Equities V 1 off the wire, 215 bytes from where the cursor stands */
inline decode_modify_order_ca_equities_v1(modify_order_ca_equities_v1_record) {
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.cl_ord_id[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.orig_cl_ord_id[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 2 -> modify_order_ca_equities_v1_record.broker_id[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 16 -> modify_order_ca_equities_v1_record.account[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> modify_order_ca_equities_v1_record.order_qty[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> modify_order_ca_equities_v1_record.price[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> modify_order_ca_equities_v1_record.stop_px[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_record.time_in_force = wire[at]; at = at + 1;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> modify_order_ca_equities_v1_record.max_floor[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> modify_order_ca_equities_v1_record.expire_date[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_record.lei_order_origin = wire[at]; at = at + 1;
  modify_order_ca_equities_v1_record.lei_routing_arrangement_indicator = wire[at]; at = at + 1;
  modify_order_ca_equities_v1_record.umir_account_type = wire[at]; at = at + 1;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.lei_customer_account[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.lei_algorithm_id[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 52 -> modify_order_ca_equities_v1_record.customer_lei[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> modify_order_ca_equities_v1_record.broker_lei[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_record.cancel_orig_on_reject = wire[at]; at = at + 1;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> modify_order_ca_equities_v1_record.true_min_qty[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> modify_order_ca_equities_v1_record.expire_time[modify_order_ca_equities_v1_at] = wire[at]; at = at + 1; modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order Ca Equities V 1 is what was written, byte for byte */
inline equal_modify_order_ca_equities_v1(modify_order_ca_equities_v1_read, modify_order_ca_equities_v1_written) {
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> assert(modify_order_ca_equities_v1_read.cl_ord_id[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.cl_ord_id[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> assert(modify_order_ca_equities_v1_read.orig_cl_ord_id[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.orig_cl_ord_id[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 2 -> assert(modify_order_ca_equities_v1_read.broker_id[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.broker_id[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 16 -> assert(modify_order_ca_equities_v1_read.account[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.account[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> assert(modify_order_ca_equities_v1_read.order_qty[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.order_qty[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> assert(modify_order_ca_equities_v1_read.price[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.price[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> assert(modify_order_ca_equities_v1_read.stop_px[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.stop_px[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(modify_order_ca_equities_v1_read.time_in_force == modify_order_ca_equities_v1_written.time_in_force);
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> assert(modify_order_ca_equities_v1_read.max_floor[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.max_floor[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> assert(modify_order_ca_equities_v1_read.expire_date[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.expire_date[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(modify_order_ca_equities_v1_read.lei_order_origin == modify_order_ca_equities_v1_written.lei_order_origin);
  assert(modify_order_ca_equities_v1_read.lei_routing_arrangement_indicator == modify_order_ca_equities_v1_written.lei_routing_arrangement_indicator);
  assert(modify_order_ca_equities_v1_read.umir_account_type == modify_order_ca_equities_v1_written.umir_account_type);
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> assert(modify_order_ca_equities_v1_read.lei_customer_account[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.lei_customer_account[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> assert(modify_order_ca_equities_v1_read.lei_algorithm_id[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.lei_algorithm_id[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 52 -> assert(modify_order_ca_equities_v1_read.customer_lei[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.customer_lei[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 20 -> assert(modify_order_ca_equities_v1_read.broker_lei[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.broker_lei[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(modify_order_ca_equities_v1_read.cancel_orig_on_reject == modify_order_ca_equities_v1_written.cancel_orig_on_reject);
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 4 -> assert(modify_order_ca_equities_v1_read.true_min_qty[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.true_min_qty[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_ca_equities_v1_at = 0;
  do
  :: modify_order_ca_equities_v1_at < 8 -> assert(modify_order_ca_equities_v1_read.expire_time[modify_order_ca_equities_v1_at] == modify_order_ca_equities_v1_written.expire_time[modify_order_ca_equities_v1_at]); modify_order_ca_equities_v1_at = modify_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order Ca Equities V 1: 22 bytes ---------------------------------- */

/* Request to cancel a single order */
typedef CancelOrderCaEquitiesV1 {
  byte broker_id[2];
  byte orig_cl_ord_id[20]
};

int cancel_order_ca_equities_v1_at;

/* every byte of Cancel Order Ca Equities V 1 set to one value */
inline fill_cancel_order_ca_equities_v1(cancel_order_ca_equities_v1_record, cancel_order_ca_equities_v1_value) {
  cancel_order_ca_equities_v1_at = 0;
  do
  :: cancel_order_ca_equities_v1_at < 2 -> cancel_order_ca_equities_v1_record.broker_id[cancel_order_ca_equities_v1_at] = cancel_order_ca_equities_v1_value; cancel_order_ca_equities_v1_at = cancel_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_ca_equities_v1_at = 0;
  do
  :: cancel_order_ca_equities_v1_at < 20 -> cancel_order_ca_equities_v1_record.orig_cl_ord_id[cancel_order_ca_equities_v1_at] = cancel_order_ca_equities_v1_value; cancel_order_ca_equities_v1_at = cancel_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_ca_equities_v1(cancel_order_ca_equities_v1_record, cancel_order_ca_equities_v1_base) {
  cancel_order_ca_equities_v1_at = 0;
  do
  :: cancel_order_ca_equities_v1_at < 2 -> cancel_order_ca_equities_v1_record.broker_id[cancel_order_ca_equities_v1_at] = (cancel_order_ca_equities_v1_base + 0 + cancel_order_ca_equities_v1_at + 1) % 256; cancel_order_ca_equities_v1_at = cancel_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_ca_equities_v1_at = 0;
  do
  :: cancel_order_ca_equities_v1_at < 20 -> cancel_order_ca_equities_v1_record.orig_cl_ord_id[cancel_order_ca_equities_v1_at] = (cancel_order_ca_equities_v1_base + 2 + cancel_order_ca_equities_v1_at + 1) % 256; cancel_order_ca_equities_v1_at = cancel_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Ca Equities V 1 to the wire, 22 bytes from where the cursor stands */
inline encode_cancel_order_ca_equities_v1(cancel_order_ca_equities_v1_record) {
  cancel_order_ca_equities_v1_at = 0;
  do
  :: cancel_order_ca_equities_v1_at < 2 -> wire[at] = cancel_order_ca_equities_v1_record.broker_id[cancel_order_ca_equities_v1_at]; at = at + 1; cancel_order_ca_equities_v1_at = cancel_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_ca_equities_v1_at = 0;
  do
  :: cancel_order_ca_equities_v1_at < 20 -> wire[at] = cancel_order_ca_equities_v1_record.orig_cl_ord_id[cancel_order_ca_equities_v1_at]; at = at + 1; cancel_order_ca_equities_v1_at = cancel_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Ca Equities V 1 off the wire, 22 bytes from where the cursor stands */
inline decode_cancel_order_ca_equities_v1(cancel_order_ca_equities_v1_record) {
  cancel_order_ca_equities_v1_at = 0;
  do
  :: cancel_order_ca_equities_v1_at < 2 -> cancel_order_ca_equities_v1_record.broker_id[cancel_order_ca_equities_v1_at] = wire[at]; at = at + 1; cancel_order_ca_equities_v1_at = cancel_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_ca_equities_v1_at = 0;
  do
  :: cancel_order_ca_equities_v1_at < 20 -> cancel_order_ca_equities_v1_record.orig_cl_ord_id[cancel_order_ca_equities_v1_at] = wire[at]; at = at + 1; cancel_order_ca_equities_v1_at = cancel_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Ca Equities V 1 is what was written, byte for byte */
inline equal_cancel_order_ca_equities_v1(cancel_order_ca_equities_v1_read, cancel_order_ca_equities_v1_written) {
  cancel_order_ca_equities_v1_at = 0;
  do
  :: cancel_order_ca_equities_v1_at < 2 -> assert(cancel_order_ca_equities_v1_read.broker_id[cancel_order_ca_equities_v1_at] == cancel_order_ca_equities_v1_written.broker_id[cancel_order_ca_equities_v1_at]); cancel_order_ca_equities_v1_at = cancel_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_ca_equities_v1_at = 0;
  do
  :: cancel_order_ca_equities_v1_at < 20 -> assert(cancel_order_ca_equities_v1_read.orig_cl_ord_id[cancel_order_ca_equities_v1_at] == cancel_order_ca_equities_v1_written.orig_cl_ord_id[cancel_order_ca_equities_v1_at]); cancel_order_ca_equities_v1_at = cancel_order_ca_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Order Cross Ca Equities V 1: 342 bytes ------------------------------ */

/* New Order Cross message for pre-arranged two-sided trades */
typedef NewOrderCrossCaEquitiesV1 {
  byte broker_id[2];
  byte cross_cl_ord_id[18];
  byte cross_type;
  byte price[8];
  byte order_qty[4];
  byte symbol[14];
  byte settlement_type;
  byte fut_settl_date[4];
  byte umir_user_id[12];
  byte basket_trade[4];
  byte program_trade;
  byte non_resident;
  byte bypass;
  byte ncib;
  byte cross_side;
  byte short_marking_exempt;
  byte buy_umir_account_type;
  byte buy_account[16];
  byte buy_umir_regulation_id;
  byte buy_jitney[2];
  byte buy_lei_customer_account[20];
  byte buy_lei_algorithm_id[20];
  byte buy_customer_lei[52];
  byte buy_broker_lei[20];
  byte buy_lei_order_origin;
  byte buy_lei_routing_arrangemeant_indicator;
  byte sell_umir_account_type;
  byte sell_account[16];
  byte sell_umir_regulation_id;
  byte sell_jitney[2];
  byte sell_lei_customer_account[20];
  byte sell_lei_algorithm_id[20];
  byte sell_customer_lei[52];
  byte sell_broker_lei[20];
  byte sell_lei_order_origin;
  byte sell_lei_routing_arrangement_indicator
};

int new_order_cross_ca_equities_v1_at;

/* every byte of New Order Cross Ca Equities V 1 set to one value */
inline fill_new_order_cross_ca_equities_v1(new_order_cross_ca_equities_v1_record, new_order_cross_ca_equities_v1_value) {
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> new_order_cross_ca_equities_v1_record.broker_id[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 18 -> new_order_cross_ca_equities_v1_record.cross_cl_ord_id[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.cross_type = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 8 -> new_order_cross_ca_equities_v1_record.price[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> new_order_cross_ca_equities_v1_record.order_qty[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 14 -> new_order_cross_ca_equities_v1_record.symbol[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.settlement_type = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> new_order_cross_ca_equities_v1_record.fut_settl_date[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 12 -> new_order_cross_ca_equities_v1_record.umir_user_id[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> new_order_cross_ca_equities_v1_record.basket_trade[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.program_trade = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_record.non_resident = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_record.bypass = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_record.ncib = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_record.cross_side = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_record.short_marking_exempt = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_record.buy_umir_account_type = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 16 -> new_order_cross_ca_equities_v1_record.buy_account[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.buy_umir_regulation_id = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> new_order_cross_ca_equities_v1_record.buy_jitney[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.buy_lei_customer_account[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.buy_lei_algorithm_id[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 52 -> new_order_cross_ca_equities_v1_record.buy_customer_lei[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.buy_broker_lei[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.buy_lei_order_origin = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_record.buy_lei_routing_arrangemeant_indicator = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_record.sell_umir_account_type = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 16 -> new_order_cross_ca_equities_v1_record.sell_account[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.sell_umir_regulation_id = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> new_order_cross_ca_equities_v1_record.sell_jitney[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.sell_lei_customer_account[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.sell_lei_algorithm_id[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 52 -> new_order_cross_ca_equities_v1_record.sell_customer_lei[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.sell_broker_lei[new_order_cross_ca_equities_v1_at] = new_order_cross_ca_equities_v1_value; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.sell_lei_order_origin = new_order_cross_ca_equities_v1_value;
  new_order_cross_ca_equities_v1_record.sell_lei_routing_arrangement_indicator = new_order_cross_ca_equities_v1_value;
  skip
}

/* each byte of New Order Cross Ca Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_new_order_cross_ca_equities_v1(new_order_cross_ca_equities_v1_record, new_order_cross_ca_equities_v1_base) {
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> new_order_cross_ca_equities_v1_record.broker_id[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 0 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 18 -> new_order_cross_ca_equities_v1_record.cross_cl_ord_id[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 2 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.cross_type = (new_order_cross_ca_equities_v1_base + 20 + 1) % 256;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 8 -> new_order_cross_ca_equities_v1_record.price[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 21 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> new_order_cross_ca_equities_v1_record.order_qty[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 29 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 14 -> new_order_cross_ca_equities_v1_record.symbol[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 33 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.settlement_type = (new_order_cross_ca_equities_v1_base + 47 + 1) % 256;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> new_order_cross_ca_equities_v1_record.fut_settl_date[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 48 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 12 -> new_order_cross_ca_equities_v1_record.umir_user_id[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 52 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> new_order_cross_ca_equities_v1_record.basket_trade[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 64 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.program_trade = (new_order_cross_ca_equities_v1_base + 68 + 1) % 256;
  new_order_cross_ca_equities_v1_record.non_resident = (new_order_cross_ca_equities_v1_base + 69 + 1) % 256;
  new_order_cross_ca_equities_v1_record.bypass = (new_order_cross_ca_equities_v1_base + 70 + 1) % 256;
  new_order_cross_ca_equities_v1_record.ncib = (new_order_cross_ca_equities_v1_base + 71 + 1) % 256;
  new_order_cross_ca_equities_v1_record.cross_side = (new_order_cross_ca_equities_v1_base + 72 + 1) % 256;
  new_order_cross_ca_equities_v1_record.short_marking_exempt = (new_order_cross_ca_equities_v1_base + 73 + 1) % 256;
  new_order_cross_ca_equities_v1_record.buy_umir_account_type = (new_order_cross_ca_equities_v1_base + 74 + 1) % 256;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 16 -> new_order_cross_ca_equities_v1_record.buy_account[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 75 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.buy_umir_regulation_id = (new_order_cross_ca_equities_v1_base + 91 + 1) % 256;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> new_order_cross_ca_equities_v1_record.buy_jitney[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 92 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.buy_lei_customer_account[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 94 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.buy_lei_algorithm_id[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 114 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 52 -> new_order_cross_ca_equities_v1_record.buy_customer_lei[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 134 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.buy_broker_lei[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 186 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.buy_lei_order_origin = (new_order_cross_ca_equities_v1_base + 206 + 1) % 256;
  new_order_cross_ca_equities_v1_record.buy_lei_routing_arrangemeant_indicator = (new_order_cross_ca_equities_v1_base + 207 + 1) % 256;
  new_order_cross_ca_equities_v1_record.sell_umir_account_type = (new_order_cross_ca_equities_v1_base + 208 + 1) % 256;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 16 -> new_order_cross_ca_equities_v1_record.sell_account[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 209 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.sell_umir_regulation_id = (new_order_cross_ca_equities_v1_base + 225 + 1) % 256;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> new_order_cross_ca_equities_v1_record.sell_jitney[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 226 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.sell_lei_customer_account[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 228 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.sell_lei_algorithm_id[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 248 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 52 -> new_order_cross_ca_equities_v1_record.sell_customer_lei[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 268 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.sell_broker_lei[new_order_cross_ca_equities_v1_at] = (new_order_cross_ca_equities_v1_base + 320 + new_order_cross_ca_equities_v1_at + 1) % 256; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.sell_lei_order_origin = (new_order_cross_ca_equities_v1_base + 340 + 1) % 256;
  new_order_cross_ca_equities_v1_record.sell_lei_routing_arrangement_indicator = (new_order_cross_ca_equities_v1_base + 341 + 1) % 256;
  skip
}

/* New Order Cross Ca Equities V 1 to the wire, 342 bytes from where the cursor stands */
inline encode_new_order_cross_ca_equities_v1(new_order_cross_ca_equities_v1_record) {
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> wire[at] = new_order_cross_ca_equities_v1_record.broker_id[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 18 -> wire[at] = new_order_cross_ca_equities_v1_record.cross_cl_ord_id[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v1_record.cross_type; at = at + 1;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 8 -> wire[at] = new_order_cross_ca_equities_v1_record.price[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> wire[at] = new_order_cross_ca_equities_v1_record.order_qty[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 14 -> wire[at] = new_order_cross_ca_equities_v1_record.symbol[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v1_record.settlement_type; at = at + 1;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> wire[at] = new_order_cross_ca_equities_v1_record.fut_settl_date[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 12 -> wire[at] = new_order_cross_ca_equities_v1_record.umir_user_id[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> wire[at] = new_order_cross_ca_equities_v1_record.basket_trade[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v1_record.program_trade; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v1_record.non_resident; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v1_record.bypass; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v1_record.ncib; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v1_record.cross_side; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v1_record.short_marking_exempt; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v1_record.buy_umir_account_type; at = at + 1;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 16 -> wire[at] = new_order_cross_ca_equities_v1_record.buy_account[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v1_record.buy_umir_regulation_id; at = at + 1;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> wire[at] = new_order_cross_ca_equities_v1_record.buy_jitney[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> wire[at] = new_order_cross_ca_equities_v1_record.buy_lei_customer_account[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> wire[at] = new_order_cross_ca_equities_v1_record.buy_lei_algorithm_id[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 52 -> wire[at] = new_order_cross_ca_equities_v1_record.buy_customer_lei[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> wire[at] = new_order_cross_ca_equities_v1_record.buy_broker_lei[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v1_record.buy_lei_order_origin; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v1_record.buy_lei_routing_arrangemeant_indicator; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v1_record.sell_umir_account_type; at = at + 1;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 16 -> wire[at] = new_order_cross_ca_equities_v1_record.sell_account[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v1_record.sell_umir_regulation_id; at = at + 1;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> wire[at] = new_order_cross_ca_equities_v1_record.sell_jitney[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> wire[at] = new_order_cross_ca_equities_v1_record.sell_lei_customer_account[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> wire[at] = new_order_cross_ca_equities_v1_record.sell_lei_algorithm_id[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 52 -> wire[at] = new_order_cross_ca_equities_v1_record.sell_customer_lei[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> wire[at] = new_order_cross_ca_equities_v1_record.sell_broker_lei[new_order_cross_ca_equities_v1_at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v1_record.sell_lei_order_origin; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v1_record.sell_lei_routing_arrangement_indicator; at = at + 1;
  skip
}

/* New Order Cross Ca Equities V 1 off the wire, 342 bytes from where the cursor stands */
inline decode_new_order_cross_ca_equities_v1(new_order_cross_ca_equities_v1_record) {
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> new_order_cross_ca_equities_v1_record.broker_id[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 18 -> new_order_cross_ca_equities_v1_record.cross_cl_ord_id[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.cross_type = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 8 -> new_order_cross_ca_equities_v1_record.price[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> new_order_cross_ca_equities_v1_record.order_qty[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 14 -> new_order_cross_ca_equities_v1_record.symbol[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.settlement_type = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> new_order_cross_ca_equities_v1_record.fut_settl_date[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 12 -> new_order_cross_ca_equities_v1_record.umir_user_id[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> new_order_cross_ca_equities_v1_record.basket_trade[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.program_trade = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_record.non_resident = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_record.bypass = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_record.ncib = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_record.cross_side = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_record.short_marking_exempt = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_record.buy_umir_account_type = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 16 -> new_order_cross_ca_equities_v1_record.buy_account[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.buy_umir_regulation_id = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> new_order_cross_ca_equities_v1_record.buy_jitney[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.buy_lei_customer_account[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.buy_lei_algorithm_id[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 52 -> new_order_cross_ca_equities_v1_record.buy_customer_lei[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.buy_broker_lei[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.buy_lei_order_origin = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_record.buy_lei_routing_arrangemeant_indicator = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_record.sell_umir_account_type = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 16 -> new_order_cross_ca_equities_v1_record.sell_account[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.sell_umir_regulation_id = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> new_order_cross_ca_equities_v1_record.sell_jitney[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.sell_lei_customer_account[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.sell_lei_algorithm_id[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 52 -> new_order_cross_ca_equities_v1_record.sell_customer_lei[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> new_order_cross_ca_equities_v1_record.sell_broker_lei[new_order_cross_ca_equities_v1_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_record.sell_lei_order_origin = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v1_record.sell_lei_routing_arrangement_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of New Order Cross Ca Equities V 1 is what was written, byte for byte */
inline equal_new_order_cross_ca_equities_v1(new_order_cross_ca_equities_v1_read, new_order_cross_ca_equities_v1_written) {
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> assert(new_order_cross_ca_equities_v1_read.broker_id[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.broker_id[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 18 -> assert(new_order_cross_ca_equities_v1_read.cross_cl_ord_id[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.cross_cl_ord_id[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v1_read.cross_type == new_order_cross_ca_equities_v1_written.cross_type);
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 8 -> assert(new_order_cross_ca_equities_v1_read.price[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.price[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> assert(new_order_cross_ca_equities_v1_read.order_qty[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.order_qty[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 14 -> assert(new_order_cross_ca_equities_v1_read.symbol[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.symbol[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v1_read.settlement_type == new_order_cross_ca_equities_v1_written.settlement_type);
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> assert(new_order_cross_ca_equities_v1_read.fut_settl_date[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.fut_settl_date[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 12 -> assert(new_order_cross_ca_equities_v1_read.umir_user_id[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.umir_user_id[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 4 -> assert(new_order_cross_ca_equities_v1_read.basket_trade[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.basket_trade[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v1_read.program_trade == new_order_cross_ca_equities_v1_written.program_trade);
  assert(new_order_cross_ca_equities_v1_read.non_resident == new_order_cross_ca_equities_v1_written.non_resident);
  assert(new_order_cross_ca_equities_v1_read.bypass == new_order_cross_ca_equities_v1_written.bypass);
  assert(new_order_cross_ca_equities_v1_read.ncib == new_order_cross_ca_equities_v1_written.ncib);
  assert(new_order_cross_ca_equities_v1_read.cross_side == new_order_cross_ca_equities_v1_written.cross_side);
  assert(new_order_cross_ca_equities_v1_read.short_marking_exempt == new_order_cross_ca_equities_v1_written.short_marking_exempt);
  assert(new_order_cross_ca_equities_v1_read.buy_umir_account_type == new_order_cross_ca_equities_v1_written.buy_umir_account_type);
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 16 -> assert(new_order_cross_ca_equities_v1_read.buy_account[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.buy_account[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v1_read.buy_umir_regulation_id == new_order_cross_ca_equities_v1_written.buy_umir_regulation_id);
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> assert(new_order_cross_ca_equities_v1_read.buy_jitney[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.buy_jitney[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> assert(new_order_cross_ca_equities_v1_read.buy_lei_customer_account[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.buy_lei_customer_account[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> assert(new_order_cross_ca_equities_v1_read.buy_lei_algorithm_id[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.buy_lei_algorithm_id[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 52 -> assert(new_order_cross_ca_equities_v1_read.buy_customer_lei[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.buy_customer_lei[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> assert(new_order_cross_ca_equities_v1_read.buy_broker_lei[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.buy_broker_lei[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v1_read.buy_lei_order_origin == new_order_cross_ca_equities_v1_written.buy_lei_order_origin);
  assert(new_order_cross_ca_equities_v1_read.buy_lei_routing_arrangemeant_indicator == new_order_cross_ca_equities_v1_written.buy_lei_routing_arrangemeant_indicator);
  assert(new_order_cross_ca_equities_v1_read.sell_umir_account_type == new_order_cross_ca_equities_v1_written.sell_umir_account_type);
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 16 -> assert(new_order_cross_ca_equities_v1_read.sell_account[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.sell_account[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v1_read.sell_umir_regulation_id == new_order_cross_ca_equities_v1_written.sell_umir_regulation_id);
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 2 -> assert(new_order_cross_ca_equities_v1_read.sell_jitney[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.sell_jitney[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> assert(new_order_cross_ca_equities_v1_read.sell_lei_customer_account[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.sell_lei_customer_account[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> assert(new_order_cross_ca_equities_v1_read.sell_lei_algorithm_id[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.sell_lei_algorithm_id[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 52 -> assert(new_order_cross_ca_equities_v1_read.sell_customer_lei[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.sell_customer_lei[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v1_at = 0;
  do
  :: new_order_cross_ca_equities_v1_at < 20 -> assert(new_order_cross_ca_equities_v1_read.sell_broker_lei[new_order_cross_ca_equities_v1_at] == new_order_cross_ca_equities_v1_written.sell_broker_lei[new_order_cross_ca_equities_v1_at]); new_order_cross_ca_equities_v1_at = new_order_cross_ca_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v1_read.sell_lei_order_origin == new_order_cross_ca_equities_v1_written.sell_lei_order_origin);
  assert(new_order_cross_ca_equities_v1_read.sell_lei_routing_arrangement_indicator == new_order_cross_ca_equities_v1_written.sell_lei_routing_arrangement_indicator);
  skip
}

/* ---- New Order Cross Ca Equities V 2: 347 bytes ------------------------------ */

/* New Order Cross V2 message with Anonymous flag */
typedef NewOrderCrossCaEquitiesV2 {
  byte broker_id[2];
  byte cross_cl_ord_id[18];
  byte cross_type;
  byte price[8];
  byte order_qty[4];
  byte symbol[14];
  byte settlement_type;
  byte fut_settl_date[4];
  byte umir_user_id[12];
  byte basket_trade[4];
  byte program_trade;
  byte non_resident;
  byte bypass;
  byte ncib;
  byte cross_side;
  byte short_marking_exempt;
  byte buy_umir_account_type;
  byte buy_account[16];
  byte buy_umir_regulation_id;
  byte buy_jitney[2];
  byte buy_lei_customer_account[20];
  byte buy_lei_algorithm_id[20];
  byte buy_customer_lei[52];
  byte buy_broker_lei[20];
  byte buy_lei_order_origin;
  byte buy_lei_routing_arrangement_indicator;
  byte sell_umir_account_type;
  byte sell_account[16];
  byte sell_umir_regulation_id;
  byte sell_jitney[2];
  byte sell_lei_customer_account[20];
  byte sell_lei_algorithm_id[20];
  byte sell_customer_lei[52];
  byte sell_broker_lei[20];
  byte sell_lei_order_origin;
  byte sell_lei_routing_arrangement_indicator;
  byte anonymous;
  byte reserved[4]
};

int new_order_cross_ca_equities_v2_at;

/* every byte of New Order Cross Ca Equities V 2 set to one value */
inline fill_new_order_cross_ca_equities_v2(new_order_cross_ca_equities_v2_record, new_order_cross_ca_equities_v2_value) {
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> new_order_cross_ca_equities_v2_record.broker_id[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 18 -> new_order_cross_ca_equities_v2_record.cross_cl_ord_id[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.cross_type = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 8 -> new_order_cross_ca_equities_v2_record.price[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> new_order_cross_ca_equities_v2_record.order_qty[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 14 -> new_order_cross_ca_equities_v2_record.symbol[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.settlement_type = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> new_order_cross_ca_equities_v2_record.fut_settl_date[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 12 -> new_order_cross_ca_equities_v2_record.umir_user_id[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> new_order_cross_ca_equities_v2_record.basket_trade[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.program_trade = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_record.non_resident = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_record.bypass = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_record.ncib = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_record.cross_side = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_record.short_marking_exempt = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_record.buy_umir_account_type = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 16 -> new_order_cross_ca_equities_v2_record.buy_account[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.buy_umir_regulation_id = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> new_order_cross_ca_equities_v2_record.buy_jitney[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.buy_lei_customer_account[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.buy_lei_algorithm_id[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 52 -> new_order_cross_ca_equities_v2_record.buy_customer_lei[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.buy_broker_lei[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.buy_lei_order_origin = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_record.buy_lei_routing_arrangement_indicator = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_record.sell_umir_account_type = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 16 -> new_order_cross_ca_equities_v2_record.sell_account[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.sell_umir_regulation_id = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> new_order_cross_ca_equities_v2_record.sell_jitney[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.sell_lei_customer_account[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.sell_lei_algorithm_id[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 52 -> new_order_cross_ca_equities_v2_record.sell_customer_lei[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.sell_broker_lei[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.sell_lei_order_origin = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_record.sell_lei_routing_arrangement_indicator = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_record.anonymous = new_order_cross_ca_equities_v2_value;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> new_order_cross_ca_equities_v2_record.reserved[new_order_cross_ca_equities_v2_at] = new_order_cross_ca_equities_v2_value; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Cross Ca Equities V 2 set to where it lies, so a field read out of place says so */
inline ramp_new_order_cross_ca_equities_v2(new_order_cross_ca_equities_v2_record, new_order_cross_ca_equities_v2_base) {
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> new_order_cross_ca_equities_v2_record.broker_id[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 0 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 18 -> new_order_cross_ca_equities_v2_record.cross_cl_ord_id[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 2 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.cross_type = (new_order_cross_ca_equities_v2_base + 20 + 1) % 256;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 8 -> new_order_cross_ca_equities_v2_record.price[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 21 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> new_order_cross_ca_equities_v2_record.order_qty[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 29 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 14 -> new_order_cross_ca_equities_v2_record.symbol[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 33 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.settlement_type = (new_order_cross_ca_equities_v2_base + 47 + 1) % 256;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> new_order_cross_ca_equities_v2_record.fut_settl_date[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 48 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 12 -> new_order_cross_ca_equities_v2_record.umir_user_id[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 52 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> new_order_cross_ca_equities_v2_record.basket_trade[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 64 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.program_trade = (new_order_cross_ca_equities_v2_base + 68 + 1) % 256;
  new_order_cross_ca_equities_v2_record.non_resident = (new_order_cross_ca_equities_v2_base + 69 + 1) % 256;
  new_order_cross_ca_equities_v2_record.bypass = (new_order_cross_ca_equities_v2_base + 70 + 1) % 256;
  new_order_cross_ca_equities_v2_record.ncib = (new_order_cross_ca_equities_v2_base + 71 + 1) % 256;
  new_order_cross_ca_equities_v2_record.cross_side = (new_order_cross_ca_equities_v2_base + 72 + 1) % 256;
  new_order_cross_ca_equities_v2_record.short_marking_exempt = (new_order_cross_ca_equities_v2_base + 73 + 1) % 256;
  new_order_cross_ca_equities_v2_record.buy_umir_account_type = (new_order_cross_ca_equities_v2_base + 74 + 1) % 256;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 16 -> new_order_cross_ca_equities_v2_record.buy_account[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 75 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.buy_umir_regulation_id = (new_order_cross_ca_equities_v2_base + 91 + 1) % 256;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> new_order_cross_ca_equities_v2_record.buy_jitney[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 92 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.buy_lei_customer_account[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 94 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.buy_lei_algorithm_id[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 114 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 52 -> new_order_cross_ca_equities_v2_record.buy_customer_lei[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 134 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.buy_broker_lei[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 186 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.buy_lei_order_origin = (new_order_cross_ca_equities_v2_base + 206 + 1) % 256;
  new_order_cross_ca_equities_v2_record.buy_lei_routing_arrangement_indicator = (new_order_cross_ca_equities_v2_base + 207 + 1) % 256;
  new_order_cross_ca_equities_v2_record.sell_umir_account_type = (new_order_cross_ca_equities_v2_base + 208 + 1) % 256;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 16 -> new_order_cross_ca_equities_v2_record.sell_account[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 209 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.sell_umir_regulation_id = (new_order_cross_ca_equities_v2_base + 225 + 1) % 256;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> new_order_cross_ca_equities_v2_record.sell_jitney[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 226 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.sell_lei_customer_account[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 228 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.sell_lei_algorithm_id[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 248 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 52 -> new_order_cross_ca_equities_v2_record.sell_customer_lei[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 268 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.sell_broker_lei[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 320 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.sell_lei_order_origin = (new_order_cross_ca_equities_v2_base + 340 + 1) % 256;
  new_order_cross_ca_equities_v2_record.sell_lei_routing_arrangement_indicator = (new_order_cross_ca_equities_v2_base + 341 + 1) % 256;
  new_order_cross_ca_equities_v2_record.anonymous = (new_order_cross_ca_equities_v2_base + 342 + 1) % 256;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> new_order_cross_ca_equities_v2_record.reserved[new_order_cross_ca_equities_v2_at] = (new_order_cross_ca_equities_v2_base + 343 + new_order_cross_ca_equities_v2_at + 1) % 256; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Cross Ca Equities V 2 to the wire, 347 bytes from where the cursor stands */
inline encode_new_order_cross_ca_equities_v2(new_order_cross_ca_equities_v2_record) {
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> wire[at] = new_order_cross_ca_equities_v2_record.broker_id[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 18 -> wire[at] = new_order_cross_ca_equities_v2_record.cross_cl_ord_id[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v2_record.cross_type; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 8 -> wire[at] = new_order_cross_ca_equities_v2_record.price[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> wire[at] = new_order_cross_ca_equities_v2_record.order_qty[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 14 -> wire[at] = new_order_cross_ca_equities_v2_record.symbol[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v2_record.settlement_type; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> wire[at] = new_order_cross_ca_equities_v2_record.fut_settl_date[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 12 -> wire[at] = new_order_cross_ca_equities_v2_record.umir_user_id[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> wire[at] = new_order_cross_ca_equities_v2_record.basket_trade[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v2_record.program_trade; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v2_record.non_resident; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v2_record.bypass; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v2_record.ncib; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v2_record.cross_side; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v2_record.short_marking_exempt; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v2_record.buy_umir_account_type; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 16 -> wire[at] = new_order_cross_ca_equities_v2_record.buy_account[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v2_record.buy_umir_regulation_id; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> wire[at] = new_order_cross_ca_equities_v2_record.buy_jitney[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> wire[at] = new_order_cross_ca_equities_v2_record.buy_lei_customer_account[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> wire[at] = new_order_cross_ca_equities_v2_record.buy_lei_algorithm_id[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 52 -> wire[at] = new_order_cross_ca_equities_v2_record.buy_customer_lei[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> wire[at] = new_order_cross_ca_equities_v2_record.buy_broker_lei[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v2_record.buy_lei_order_origin; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v2_record.buy_lei_routing_arrangement_indicator; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v2_record.sell_umir_account_type; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 16 -> wire[at] = new_order_cross_ca_equities_v2_record.sell_account[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v2_record.sell_umir_regulation_id; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> wire[at] = new_order_cross_ca_equities_v2_record.sell_jitney[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> wire[at] = new_order_cross_ca_equities_v2_record.sell_lei_customer_account[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> wire[at] = new_order_cross_ca_equities_v2_record.sell_lei_algorithm_id[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 52 -> wire[at] = new_order_cross_ca_equities_v2_record.sell_customer_lei[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> wire[at] = new_order_cross_ca_equities_v2_record.sell_broker_lei[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_ca_equities_v2_record.sell_lei_order_origin; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v2_record.sell_lei_routing_arrangement_indicator; at = at + 1;
  wire[at] = new_order_cross_ca_equities_v2_record.anonymous; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> wire[at] = new_order_cross_ca_equities_v2_record.reserved[new_order_cross_ca_equities_v2_at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Cross Ca Equities V 2 off the wire, 347 bytes from where the cursor stands */
inline decode_new_order_cross_ca_equities_v2(new_order_cross_ca_equities_v2_record) {
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> new_order_cross_ca_equities_v2_record.broker_id[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 18 -> new_order_cross_ca_equities_v2_record.cross_cl_ord_id[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.cross_type = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 8 -> new_order_cross_ca_equities_v2_record.price[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> new_order_cross_ca_equities_v2_record.order_qty[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 14 -> new_order_cross_ca_equities_v2_record.symbol[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.settlement_type = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> new_order_cross_ca_equities_v2_record.fut_settl_date[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 12 -> new_order_cross_ca_equities_v2_record.umir_user_id[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> new_order_cross_ca_equities_v2_record.basket_trade[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.program_trade = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_record.non_resident = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_record.bypass = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_record.ncib = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_record.cross_side = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_record.short_marking_exempt = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_record.buy_umir_account_type = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 16 -> new_order_cross_ca_equities_v2_record.buy_account[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.buy_umir_regulation_id = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> new_order_cross_ca_equities_v2_record.buy_jitney[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.buy_lei_customer_account[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.buy_lei_algorithm_id[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 52 -> new_order_cross_ca_equities_v2_record.buy_customer_lei[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.buy_broker_lei[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.buy_lei_order_origin = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_record.buy_lei_routing_arrangement_indicator = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_record.sell_umir_account_type = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 16 -> new_order_cross_ca_equities_v2_record.sell_account[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.sell_umir_regulation_id = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> new_order_cross_ca_equities_v2_record.sell_jitney[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.sell_lei_customer_account[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.sell_lei_algorithm_id[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 52 -> new_order_cross_ca_equities_v2_record.sell_customer_lei[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> new_order_cross_ca_equities_v2_record.sell_broker_lei[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_record.sell_lei_order_origin = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_record.sell_lei_routing_arrangement_indicator = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_record.anonymous = wire[at]; at = at + 1;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> new_order_cross_ca_equities_v2_record.reserved[new_order_cross_ca_equities_v2_at] = wire[at]; at = at + 1; new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Cross Ca Equities V 2 is what was written, byte for byte */
inline equal_new_order_cross_ca_equities_v2(new_order_cross_ca_equities_v2_read, new_order_cross_ca_equities_v2_written) {
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> assert(new_order_cross_ca_equities_v2_read.broker_id[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.broker_id[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 18 -> assert(new_order_cross_ca_equities_v2_read.cross_cl_ord_id[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.cross_cl_ord_id[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v2_read.cross_type == new_order_cross_ca_equities_v2_written.cross_type);
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 8 -> assert(new_order_cross_ca_equities_v2_read.price[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.price[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> assert(new_order_cross_ca_equities_v2_read.order_qty[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.order_qty[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 14 -> assert(new_order_cross_ca_equities_v2_read.symbol[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.symbol[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v2_read.settlement_type == new_order_cross_ca_equities_v2_written.settlement_type);
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> assert(new_order_cross_ca_equities_v2_read.fut_settl_date[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.fut_settl_date[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 12 -> assert(new_order_cross_ca_equities_v2_read.umir_user_id[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.umir_user_id[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> assert(new_order_cross_ca_equities_v2_read.basket_trade[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.basket_trade[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v2_read.program_trade == new_order_cross_ca_equities_v2_written.program_trade);
  assert(new_order_cross_ca_equities_v2_read.non_resident == new_order_cross_ca_equities_v2_written.non_resident);
  assert(new_order_cross_ca_equities_v2_read.bypass == new_order_cross_ca_equities_v2_written.bypass);
  assert(new_order_cross_ca_equities_v2_read.ncib == new_order_cross_ca_equities_v2_written.ncib);
  assert(new_order_cross_ca_equities_v2_read.cross_side == new_order_cross_ca_equities_v2_written.cross_side);
  assert(new_order_cross_ca_equities_v2_read.short_marking_exempt == new_order_cross_ca_equities_v2_written.short_marking_exempt);
  assert(new_order_cross_ca_equities_v2_read.buy_umir_account_type == new_order_cross_ca_equities_v2_written.buy_umir_account_type);
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 16 -> assert(new_order_cross_ca_equities_v2_read.buy_account[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.buy_account[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v2_read.buy_umir_regulation_id == new_order_cross_ca_equities_v2_written.buy_umir_regulation_id);
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> assert(new_order_cross_ca_equities_v2_read.buy_jitney[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.buy_jitney[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> assert(new_order_cross_ca_equities_v2_read.buy_lei_customer_account[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.buy_lei_customer_account[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> assert(new_order_cross_ca_equities_v2_read.buy_lei_algorithm_id[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.buy_lei_algorithm_id[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 52 -> assert(new_order_cross_ca_equities_v2_read.buy_customer_lei[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.buy_customer_lei[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> assert(new_order_cross_ca_equities_v2_read.buy_broker_lei[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.buy_broker_lei[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v2_read.buy_lei_order_origin == new_order_cross_ca_equities_v2_written.buy_lei_order_origin);
  assert(new_order_cross_ca_equities_v2_read.buy_lei_routing_arrangement_indicator == new_order_cross_ca_equities_v2_written.buy_lei_routing_arrangement_indicator);
  assert(new_order_cross_ca_equities_v2_read.sell_umir_account_type == new_order_cross_ca_equities_v2_written.sell_umir_account_type);
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 16 -> assert(new_order_cross_ca_equities_v2_read.sell_account[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.sell_account[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v2_read.sell_umir_regulation_id == new_order_cross_ca_equities_v2_written.sell_umir_regulation_id);
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 2 -> assert(new_order_cross_ca_equities_v2_read.sell_jitney[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.sell_jitney[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> assert(new_order_cross_ca_equities_v2_read.sell_lei_customer_account[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.sell_lei_customer_account[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> assert(new_order_cross_ca_equities_v2_read.sell_lei_algorithm_id[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.sell_lei_algorithm_id[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 52 -> assert(new_order_cross_ca_equities_v2_read.sell_customer_lei[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.sell_customer_lei[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 20 -> assert(new_order_cross_ca_equities_v2_read.sell_broker_lei[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.sell_broker_lei[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_cross_ca_equities_v2_read.sell_lei_order_origin == new_order_cross_ca_equities_v2_written.sell_lei_order_origin);
  assert(new_order_cross_ca_equities_v2_read.sell_lei_routing_arrangement_indicator == new_order_cross_ca_equities_v2_written.sell_lei_routing_arrangement_indicator);
  assert(new_order_cross_ca_equities_v2_read.anonymous == new_order_cross_ca_equities_v2_written.anonymous);
  new_order_cross_ca_equities_v2_at = 0;
  do
  :: new_order_cross_ca_equities_v2_at < 4 -> assert(new_order_cross_ca_equities_v2_read.reserved[new_order_cross_ca_equities_v2_at] == new_order_cross_ca_equities_v2_written.reserved[new_order_cross_ca_equities_v2_at]); new_order_cross_ca_equities_v2_at = new_order_cross_ca_equities_v2_at + 1
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

/* New Order Ca Equities V 1: encoded, read back, and compared */
proctype check_new_order_ca_equities_v1() {
  NewOrderCaEquitiesV1 new_order_ca_equities_v1_sent;
  NewOrderCaEquitiesV1 new_order_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_ca_equities_v1(new_order_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_new_order_ca_equities_v1(new_order_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_new_order_ca_equities_v1(new_order_ca_equities_v1_sent, 255)
  :: else -> ramp_new_order_ca_equities_v1(new_order_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_ca_equities_v1(new_order_ca_equities_v1_sent);
    assert(at == 253);
    at = 0;
    decode_new_order_ca_equities_v1(new_order_ca_equities_v1_got);
    assert(at == 253);
    equal_new_order_ca_equities_v1(new_order_ca_equities_v1_got, new_order_ca_equities_v1_sent)
  }
}

/* New Order Ca Equities V 2: encoded, read back, and compared */
proctype check_new_order_ca_equities_v2() {
  NewOrderCaEquitiesV2 new_order_ca_equities_v2_sent;
  NewOrderCaEquitiesV2 new_order_ca_equities_v2_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_ca_equities_v2(new_order_ca_equities_v2_sent, 0)
  :: pattern == 1 -> fill_new_order_ca_equities_v2(new_order_ca_equities_v2_sent, 32)
  :: pattern == 2 -> fill_new_order_ca_equities_v2(new_order_ca_equities_v2_sent, 255)
  :: else -> ramp_new_order_ca_equities_v2(new_order_ca_equities_v2_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_ca_equities_v2(new_order_ca_equities_v2_sent);
    assert(at == 261);
    at = 0;
    decode_new_order_ca_equities_v2(new_order_ca_equities_v2_got);
    assert(at == 261);
    equal_new_order_ca_equities_v2(new_order_ca_equities_v2_got, new_order_ca_equities_v2_sent)
  }
}

/* Modify Order Ca Equities V 1: encoded, read back, and compared */
proctype check_modify_order_ca_equities_v1() {
  ModifyOrderCaEquitiesV1 modify_order_ca_equities_v1_sent;
  ModifyOrderCaEquitiesV1 modify_order_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_ca_equities_v1(modify_order_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_modify_order_ca_equities_v1(modify_order_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_modify_order_ca_equities_v1(modify_order_ca_equities_v1_sent, 255)
  :: else -> ramp_modify_order_ca_equities_v1(modify_order_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_ca_equities_v1(modify_order_ca_equities_v1_sent);
    assert(at == 215);
    at = 0;
    decode_modify_order_ca_equities_v1(modify_order_ca_equities_v1_got);
    assert(at == 215);
    equal_modify_order_ca_equities_v1(modify_order_ca_equities_v1_got, modify_order_ca_equities_v1_sent)
  }
}

/* Cancel Order Ca Equities V 1: encoded, read back, and compared */
proctype check_cancel_order_ca_equities_v1() {
  CancelOrderCaEquitiesV1 cancel_order_ca_equities_v1_sent;
  CancelOrderCaEquitiesV1 cancel_order_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_ca_equities_v1(cancel_order_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_cancel_order_ca_equities_v1(cancel_order_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_cancel_order_ca_equities_v1(cancel_order_ca_equities_v1_sent, 255)
  :: else -> ramp_cancel_order_ca_equities_v1(cancel_order_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_ca_equities_v1(cancel_order_ca_equities_v1_sent);
    assert(at == 22);
    at = 0;
    decode_cancel_order_ca_equities_v1(cancel_order_ca_equities_v1_got);
    assert(at == 22);
    equal_cancel_order_ca_equities_v1(cancel_order_ca_equities_v1_got, cancel_order_ca_equities_v1_sent)
  }
}

/* New Order Cross Ca Equities V 1: encoded, read back, and compared */
proctype check_new_order_cross_ca_equities_v1() {
  NewOrderCrossCaEquitiesV1 new_order_cross_ca_equities_v1_sent;
  NewOrderCrossCaEquitiesV1 new_order_cross_ca_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_cross_ca_equities_v1(new_order_cross_ca_equities_v1_sent, 0)
  :: pattern == 1 -> fill_new_order_cross_ca_equities_v1(new_order_cross_ca_equities_v1_sent, 32)
  :: pattern == 2 -> fill_new_order_cross_ca_equities_v1(new_order_cross_ca_equities_v1_sent, 255)
  :: else -> ramp_new_order_cross_ca_equities_v1(new_order_cross_ca_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_cross_ca_equities_v1(new_order_cross_ca_equities_v1_sent);
    assert(at == 342);
    at = 0;
    decode_new_order_cross_ca_equities_v1(new_order_cross_ca_equities_v1_got);
    assert(at == 342);
    equal_new_order_cross_ca_equities_v1(new_order_cross_ca_equities_v1_got, new_order_cross_ca_equities_v1_sent)
  }
}

/* New Order Cross Ca Equities V 2: encoded, read back, and compared */
proctype check_new_order_cross_ca_equities_v2() {
  NewOrderCrossCaEquitiesV2 new_order_cross_ca_equities_v2_sent;
  NewOrderCrossCaEquitiesV2 new_order_cross_ca_equities_v2_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_cross_ca_equities_v2(new_order_cross_ca_equities_v2_sent, 0)
  :: pattern == 1 -> fill_new_order_cross_ca_equities_v2(new_order_cross_ca_equities_v2_sent, 32)
  :: pattern == 2 -> fill_new_order_cross_ca_equities_v2(new_order_cross_ca_equities_v2_sent, 255)
  :: else -> ramp_new_order_cross_ca_equities_v2(new_order_cross_ca_equities_v2_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_cross_ca_equities_v2(new_order_cross_ca_equities_v2_sent);
    assert(at == 347);
    at = 0;
    decode_new_order_cross_ca_equities_v2(new_order_cross_ca_equities_v2_got);
    assert(at == 347);
    equal_new_order_cross_ca_equities_v2(new_order_cross_ca_equities_v2_got, new_order_cross_ca_equities_v2_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_firm_message_header()
  :: run check_new_order_ca_equities_v1()
  :: run check_new_order_ca_equities_v2()
  :: run check_modify_order_ca_equities_v1()
  :: run check_cancel_order_ca_equities_v1()
  :: run check_new_order_cross_ca_equities_v1()
  :: run check_new_order_cross_ca_equities_v2()
  fi
}
