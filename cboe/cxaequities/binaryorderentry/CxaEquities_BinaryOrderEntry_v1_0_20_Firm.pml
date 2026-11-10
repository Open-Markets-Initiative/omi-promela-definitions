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
#define WIRE 166

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

/* ---- New Order Au Equities V 1: 160 bytes ------------------------------------ */

/* Submission of a new order to Cboe Australia */
typedef NewOrderAuEquitiesV1 {
  byte account[10];
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte exec_inst;
  byte order_qty[4];
  byte ord_type;
  byte price[8];
  byte capacity;
  byte side;
  byte symbol[6];
  byte time_in_force;
  byte min_qty[4];
  byte max_floor[4];
  byte expire_time[8];
  byte clearing_participant_id[4];
  byte clearing_account[10];
  byte undisclosed;
  byte client_cross_ref[15];
  byte short_sell_naked_qty[4];
  byte short_sell_covered_qty[4];
  byte short_sell_long_qty[4];
  byte risk_group_id[2];
  byte no_trade_feat;
  byte no_trade_key[10];
  byte meqse;
  byte origin_of_trans[20];
  byte intermediary_id[10];
  byte directed_wholesale_indicator;
  byte remove_crossing_from_clearing;
  byte broker_preferencing
};

int new_order_au_equities_v1_at;

/* every byte of New Order Au Equities V 1 set to one value */
inline fill_new_order_au_equities_v1(new_order_au_equities_v1_record, new_order_au_equities_v1_value) {
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> new_order_au_equities_v1_record.account[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 2 -> new_order_au_equities_v1_record.trading_participant_id[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 20 -> new_order_au_equities_v1_record.cl_ord_id[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.exec_inst = new_order_au_equities_v1_value;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.order_qty[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.ord_type = new_order_au_equities_v1_value;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 8 -> new_order_au_equities_v1_record.price[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.capacity = new_order_au_equities_v1_value;
  new_order_au_equities_v1_record.side = new_order_au_equities_v1_value;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 6 -> new_order_au_equities_v1_record.symbol[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.time_in_force = new_order_au_equities_v1_value;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.min_qty[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.max_floor[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 8 -> new_order_au_equities_v1_record.expire_time[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.clearing_participant_id[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> new_order_au_equities_v1_record.clearing_account[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.undisclosed = new_order_au_equities_v1_value;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 15 -> new_order_au_equities_v1_record.client_cross_ref[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.short_sell_naked_qty[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.short_sell_covered_qty[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.short_sell_long_qty[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 2 -> new_order_au_equities_v1_record.risk_group_id[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.no_trade_feat = new_order_au_equities_v1_value;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> new_order_au_equities_v1_record.no_trade_key[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.meqse = new_order_au_equities_v1_value;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 20 -> new_order_au_equities_v1_record.origin_of_trans[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> new_order_au_equities_v1_record.intermediary_id[new_order_au_equities_v1_at] = new_order_au_equities_v1_value; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.directed_wholesale_indicator = new_order_au_equities_v1_value;
  new_order_au_equities_v1_record.remove_crossing_from_clearing = new_order_au_equities_v1_value;
  new_order_au_equities_v1_record.broker_preferencing = new_order_au_equities_v1_value;
  skip
}

/* each byte of New Order Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_new_order_au_equities_v1(new_order_au_equities_v1_record, new_order_au_equities_v1_base) {
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> new_order_au_equities_v1_record.account[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 0 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 2 -> new_order_au_equities_v1_record.trading_participant_id[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 10 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 20 -> new_order_au_equities_v1_record.cl_ord_id[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 12 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.exec_inst = (new_order_au_equities_v1_base + 32 + 1) % 256;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.order_qty[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 33 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.ord_type = (new_order_au_equities_v1_base + 37 + 1) % 256;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 8 -> new_order_au_equities_v1_record.price[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 38 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.capacity = (new_order_au_equities_v1_base + 46 + 1) % 256;
  new_order_au_equities_v1_record.side = (new_order_au_equities_v1_base + 47 + 1) % 256;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 6 -> new_order_au_equities_v1_record.symbol[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 48 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.time_in_force = (new_order_au_equities_v1_base + 54 + 1) % 256;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.min_qty[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 55 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.max_floor[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 59 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 8 -> new_order_au_equities_v1_record.expire_time[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 63 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.clearing_participant_id[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 71 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> new_order_au_equities_v1_record.clearing_account[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 75 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.undisclosed = (new_order_au_equities_v1_base + 85 + 1) % 256;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 15 -> new_order_au_equities_v1_record.client_cross_ref[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 86 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.short_sell_naked_qty[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 101 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.short_sell_covered_qty[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 105 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.short_sell_long_qty[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 109 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 2 -> new_order_au_equities_v1_record.risk_group_id[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 113 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.no_trade_feat = (new_order_au_equities_v1_base + 115 + 1) % 256;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> new_order_au_equities_v1_record.no_trade_key[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 116 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.meqse = (new_order_au_equities_v1_base + 126 + 1) % 256;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 20 -> new_order_au_equities_v1_record.origin_of_trans[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 127 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> new_order_au_equities_v1_record.intermediary_id[new_order_au_equities_v1_at] = (new_order_au_equities_v1_base + 147 + new_order_au_equities_v1_at + 1) % 256; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.directed_wholesale_indicator = (new_order_au_equities_v1_base + 157 + 1) % 256;
  new_order_au_equities_v1_record.remove_crossing_from_clearing = (new_order_au_equities_v1_base + 158 + 1) % 256;
  new_order_au_equities_v1_record.broker_preferencing = (new_order_au_equities_v1_base + 159 + 1) % 256;
  skip
}

/* New Order Au Equities V 1 to the wire, 160 bytes from where the cursor stands */
inline encode_new_order_au_equities_v1(new_order_au_equities_v1_record) {
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> wire[at] = new_order_au_equities_v1_record.account[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 2 -> wire[at] = new_order_au_equities_v1_record.trading_participant_id[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 20 -> wire[at] = new_order_au_equities_v1_record.cl_ord_id[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v1_record.exec_inst; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> wire[at] = new_order_au_equities_v1_record.order_qty[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v1_record.ord_type; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 8 -> wire[at] = new_order_au_equities_v1_record.price[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v1_record.capacity; at = at + 1;
  wire[at] = new_order_au_equities_v1_record.side; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 6 -> wire[at] = new_order_au_equities_v1_record.symbol[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v1_record.time_in_force; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> wire[at] = new_order_au_equities_v1_record.min_qty[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> wire[at] = new_order_au_equities_v1_record.max_floor[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 8 -> wire[at] = new_order_au_equities_v1_record.expire_time[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> wire[at] = new_order_au_equities_v1_record.clearing_participant_id[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> wire[at] = new_order_au_equities_v1_record.clearing_account[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v1_record.undisclosed; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 15 -> wire[at] = new_order_au_equities_v1_record.client_cross_ref[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> wire[at] = new_order_au_equities_v1_record.short_sell_naked_qty[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> wire[at] = new_order_au_equities_v1_record.short_sell_covered_qty[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> wire[at] = new_order_au_equities_v1_record.short_sell_long_qty[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 2 -> wire[at] = new_order_au_equities_v1_record.risk_group_id[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v1_record.no_trade_feat; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> wire[at] = new_order_au_equities_v1_record.no_trade_key[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v1_record.meqse; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 20 -> wire[at] = new_order_au_equities_v1_record.origin_of_trans[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> wire[at] = new_order_au_equities_v1_record.intermediary_id[new_order_au_equities_v1_at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v1_record.directed_wholesale_indicator; at = at + 1;
  wire[at] = new_order_au_equities_v1_record.remove_crossing_from_clearing; at = at + 1;
  wire[at] = new_order_au_equities_v1_record.broker_preferencing; at = at + 1;
  skip
}

/* New Order Au Equities V 1 off the wire, 160 bytes from where the cursor stands */
inline decode_new_order_au_equities_v1(new_order_au_equities_v1_record) {
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> new_order_au_equities_v1_record.account[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 2 -> new_order_au_equities_v1_record.trading_participant_id[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 20 -> new_order_au_equities_v1_record.cl_ord_id[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.exec_inst = wire[at]; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.order_qty[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.ord_type = wire[at]; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 8 -> new_order_au_equities_v1_record.price[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.capacity = wire[at]; at = at + 1;
  new_order_au_equities_v1_record.side = wire[at]; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 6 -> new_order_au_equities_v1_record.symbol[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.time_in_force = wire[at]; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.min_qty[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.max_floor[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 8 -> new_order_au_equities_v1_record.expire_time[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.clearing_participant_id[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> new_order_au_equities_v1_record.clearing_account[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.undisclosed = wire[at]; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 15 -> new_order_au_equities_v1_record.client_cross_ref[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.short_sell_naked_qty[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.short_sell_covered_qty[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> new_order_au_equities_v1_record.short_sell_long_qty[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 2 -> new_order_au_equities_v1_record.risk_group_id[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.no_trade_feat = wire[at]; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> new_order_au_equities_v1_record.no_trade_key[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.meqse = wire[at]; at = at + 1;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 20 -> new_order_au_equities_v1_record.origin_of_trans[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> new_order_au_equities_v1_record.intermediary_id[new_order_au_equities_v1_at] = wire[at]; at = at + 1; new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_record.directed_wholesale_indicator = wire[at]; at = at + 1;
  new_order_au_equities_v1_record.remove_crossing_from_clearing = wire[at]; at = at + 1;
  new_order_au_equities_v1_record.broker_preferencing = wire[at]; at = at + 1;
  skip
}

/* what was read of New Order Au Equities V 1 is what was written, byte for byte */
inline equal_new_order_au_equities_v1(new_order_au_equities_v1_read, new_order_au_equities_v1_written) {
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> assert(new_order_au_equities_v1_read.account[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.account[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 2 -> assert(new_order_au_equities_v1_read.trading_participant_id[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.trading_participant_id[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 20 -> assert(new_order_au_equities_v1_read.cl_ord_id[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.cl_ord_id[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v1_read.exec_inst == new_order_au_equities_v1_written.exec_inst);
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> assert(new_order_au_equities_v1_read.order_qty[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.order_qty[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v1_read.ord_type == new_order_au_equities_v1_written.ord_type);
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 8 -> assert(new_order_au_equities_v1_read.price[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.price[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v1_read.capacity == new_order_au_equities_v1_written.capacity);
  assert(new_order_au_equities_v1_read.side == new_order_au_equities_v1_written.side);
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 6 -> assert(new_order_au_equities_v1_read.symbol[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.symbol[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v1_read.time_in_force == new_order_au_equities_v1_written.time_in_force);
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> assert(new_order_au_equities_v1_read.min_qty[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.min_qty[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> assert(new_order_au_equities_v1_read.max_floor[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.max_floor[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 8 -> assert(new_order_au_equities_v1_read.expire_time[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.expire_time[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> assert(new_order_au_equities_v1_read.clearing_participant_id[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.clearing_participant_id[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> assert(new_order_au_equities_v1_read.clearing_account[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.clearing_account[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v1_read.undisclosed == new_order_au_equities_v1_written.undisclosed);
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 15 -> assert(new_order_au_equities_v1_read.client_cross_ref[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.client_cross_ref[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> assert(new_order_au_equities_v1_read.short_sell_naked_qty[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.short_sell_naked_qty[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> assert(new_order_au_equities_v1_read.short_sell_covered_qty[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.short_sell_covered_qty[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 4 -> assert(new_order_au_equities_v1_read.short_sell_long_qty[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.short_sell_long_qty[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 2 -> assert(new_order_au_equities_v1_read.risk_group_id[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.risk_group_id[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v1_read.no_trade_feat == new_order_au_equities_v1_written.no_trade_feat);
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> assert(new_order_au_equities_v1_read.no_trade_key[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.no_trade_key[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v1_read.meqse == new_order_au_equities_v1_written.meqse);
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 20 -> assert(new_order_au_equities_v1_read.origin_of_trans[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.origin_of_trans[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  new_order_au_equities_v1_at = 0;
  do
  :: new_order_au_equities_v1_at < 10 -> assert(new_order_au_equities_v1_read.intermediary_id[new_order_au_equities_v1_at] == new_order_au_equities_v1_written.intermediary_id[new_order_au_equities_v1_at]); new_order_au_equities_v1_at = new_order_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v1_read.directed_wholesale_indicator == new_order_au_equities_v1_written.directed_wholesale_indicator);
  assert(new_order_au_equities_v1_read.remove_crossing_from_clearing == new_order_au_equities_v1_written.remove_crossing_from_clearing);
  assert(new_order_au_equities_v1_read.broker_preferencing == new_order_au_equities_v1_written.broker_preferencing);
  skip
}

/* ---- New Order Au Equities V 2: 166 bytes ------------------------------------ */

/* Submission of a new order to Cboe Australia, with Post Only and multi-day order fields */
typedef NewOrderAuEquitiesV2 {
  byte account[10];
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte exec_inst;
  byte order_qty[4];
  byte ord_type;
  byte price[8];
  byte capacity;
  byte side;
  byte symbol[6];
  byte time_in_force;
  byte min_qty[4];
  byte max_floor[4];
  byte expire_time[8];
  byte clearing_participant_id[4];
  byte clearing_account[10];
  byte undisclosed;
  byte client_cross_ref[15];
  byte short_sell_naked_qty[4];
  byte short_sell_covered_qty[4];
  byte short_sell_long_qty[4];
  byte risk_group_id[2];
  byte no_trade_feat;
  byte no_trade_key[10];
  byte meqse;
  byte origin_of_trans[20];
  byte intermediary_id[10];
  byte directed_wholesale_indicator;
  byte remove_crossing_from_clearing;
  byte broker_preferencing;
  byte routing_inst;
  byte display_indicator;
  byte expire_date[4]
};

int new_order_au_equities_v2_at;

/* every byte of New Order Au Equities V 2 set to one value */
inline fill_new_order_au_equities_v2(new_order_au_equities_v2_record, new_order_au_equities_v2_value) {
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> new_order_au_equities_v2_record.account[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 2 -> new_order_au_equities_v2_record.trading_participant_id[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 20 -> new_order_au_equities_v2_record.cl_ord_id[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.exec_inst = new_order_au_equities_v2_value;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.order_qty[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.ord_type = new_order_au_equities_v2_value;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 8 -> new_order_au_equities_v2_record.price[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.capacity = new_order_au_equities_v2_value;
  new_order_au_equities_v2_record.side = new_order_au_equities_v2_value;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 6 -> new_order_au_equities_v2_record.symbol[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.time_in_force = new_order_au_equities_v2_value;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.min_qty[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.max_floor[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 8 -> new_order_au_equities_v2_record.expire_time[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.clearing_participant_id[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> new_order_au_equities_v2_record.clearing_account[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.undisclosed = new_order_au_equities_v2_value;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 15 -> new_order_au_equities_v2_record.client_cross_ref[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.short_sell_naked_qty[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.short_sell_covered_qty[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.short_sell_long_qty[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 2 -> new_order_au_equities_v2_record.risk_group_id[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.no_trade_feat = new_order_au_equities_v2_value;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> new_order_au_equities_v2_record.no_trade_key[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.meqse = new_order_au_equities_v2_value;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 20 -> new_order_au_equities_v2_record.origin_of_trans[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> new_order_au_equities_v2_record.intermediary_id[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.directed_wholesale_indicator = new_order_au_equities_v2_value;
  new_order_au_equities_v2_record.remove_crossing_from_clearing = new_order_au_equities_v2_value;
  new_order_au_equities_v2_record.broker_preferencing = new_order_au_equities_v2_value;
  new_order_au_equities_v2_record.routing_inst = new_order_au_equities_v2_value;
  new_order_au_equities_v2_record.display_indicator = new_order_au_equities_v2_value;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.expire_date[new_order_au_equities_v2_at] = new_order_au_equities_v2_value; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Au Equities V 2 set to where it lies, so a field read out of place says so */
inline ramp_new_order_au_equities_v2(new_order_au_equities_v2_record, new_order_au_equities_v2_base) {
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> new_order_au_equities_v2_record.account[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 0 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 2 -> new_order_au_equities_v2_record.trading_participant_id[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 10 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 20 -> new_order_au_equities_v2_record.cl_ord_id[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 12 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.exec_inst = (new_order_au_equities_v2_base + 32 + 1) % 256;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.order_qty[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 33 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.ord_type = (new_order_au_equities_v2_base + 37 + 1) % 256;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 8 -> new_order_au_equities_v2_record.price[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 38 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.capacity = (new_order_au_equities_v2_base + 46 + 1) % 256;
  new_order_au_equities_v2_record.side = (new_order_au_equities_v2_base + 47 + 1) % 256;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 6 -> new_order_au_equities_v2_record.symbol[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 48 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.time_in_force = (new_order_au_equities_v2_base + 54 + 1) % 256;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.min_qty[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 55 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.max_floor[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 59 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 8 -> new_order_au_equities_v2_record.expire_time[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 63 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.clearing_participant_id[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 71 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> new_order_au_equities_v2_record.clearing_account[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 75 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.undisclosed = (new_order_au_equities_v2_base + 85 + 1) % 256;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 15 -> new_order_au_equities_v2_record.client_cross_ref[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 86 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.short_sell_naked_qty[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 101 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.short_sell_covered_qty[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 105 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.short_sell_long_qty[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 109 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 2 -> new_order_au_equities_v2_record.risk_group_id[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 113 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.no_trade_feat = (new_order_au_equities_v2_base + 115 + 1) % 256;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> new_order_au_equities_v2_record.no_trade_key[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 116 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.meqse = (new_order_au_equities_v2_base + 126 + 1) % 256;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 20 -> new_order_au_equities_v2_record.origin_of_trans[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 127 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> new_order_au_equities_v2_record.intermediary_id[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 147 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.directed_wholesale_indicator = (new_order_au_equities_v2_base + 157 + 1) % 256;
  new_order_au_equities_v2_record.remove_crossing_from_clearing = (new_order_au_equities_v2_base + 158 + 1) % 256;
  new_order_au_equities_v2_record.broker_preferencing = (new_order_au_equities_v2_base + 159 + 1) % 256;
  new_order_au_equities_v2_record.routing_inst = (new_order_au_equities_v2_base + 160 + 1) % 256;
  new_order_au_equities_v2_record.display_indicator = (new_order_au_equities_v2_base + 161 + 1) % 256;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.expire_date[new_order_au_equities_v2_at] = (new_order_au_equities_v2_base + 162 + new_order_au_equities_v2_at + 1) % 256; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Au Equities V 2 to the wire, 166 bytes from where the cursor stands */
inline encode_new_order_au_equities_v2(new_order_au_equities_v2_record) {
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> wire[at] = new_order_au_equities_v2_record.account[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 2 -> wire[at] = new_order_au_equities_v2_record.trading_participant_id[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 20 -> wire[at] = new_order_au_equities_v2_record.cl_ord_id[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v2_record.exec_inst; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> wire[at] = new_order_au_equities_v2_record.order_qty[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v2_record.ord_type; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 8 -> wire[at] = new_order_au_equities_v2_record.price[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v2_record.capacity; at = at + 1;
  wire[at] = new_order_au_equities_v2_record.side; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 6 -> wire[at] = new_order_au_equities_v2_record.symbol[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v2_record.time_in_force; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> wire[at] = new_order_au_equities_v2_record.min_qty[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> wire[at] = new_order_au_equities_v2_record.max_floor[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 8 -> wire[at] = new_order_au_equities_v2_record.expire_time[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> wire[at] = new_order_au_equities_v2_record.clearing_participant_id[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> wire[at] = new_order_au_equities_v2_record.clearing_account[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v2_record.undisclosed; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 15 -> wire[at] = new_order_au_equities_v2_record.client_cross_ref[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> wire[at] = new_order_au_equities_v2_record.short_sell_naked_qty[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> wire[at] = new_order_au_equities_v2_record.short_sell_covered_qty[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> wire[at] = new_order_au_equities_v2_record.short_sell_long_qty[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 2 -> wire[at] = new_order_au_equities_v2_record.risk_group_id[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v2_record.no_trade_feat; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> wire[at] = new_order_au_equities_v2_record.no_trade_key[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v2_record.meqse; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 20 -> wire[at] = new_order_au_equities_v2_record.origin_of_trans[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> wire[at] = new_order_au_equities_v2_record.intermediary_id[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = new_order_au_equities_v2_record.directed_wholesale_indicator; at = at + 1;
  wire[at] = new_order_au_equities_v2_record.remove_crossing_from_clearing; at = at + 1;
  wire[at] = new_order_au_equities_v2_record.broker_preferencing; at = at + 1;
  wire[at] = new_order_au_equities_v2_record.routing_inst; at = at + 1;
  wire[at] = new_order_au_equities_v2_record.display_indicator; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> wire[at] = new_order_au_equities_v2_record.expire_date[new_order_au_equities_v2_at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Au Equities V 2 off the wire, 166 bytes from where the cursor stands */
inline decode_new_order_au_equities_v2(new_order_au_equities_v2_record) {
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> new_order_au_equities_v2_record.account[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 2 -> new_order_au_equities_v2_record.trading_participant_id[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 20 -> new_order_au_equities_v2_record.cl_ord_id[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.exec_inst = wire[at]; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.order_qty[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.ord_type = wire[at]; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 8 -> new_order_au_equities_v2_record.price[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.capacity = wire[at]; at = at + 1;
  new_order_au_equities_v2_record.side = wire[at]; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 6 -> new_order_au_equities_v2_record.symbol[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.time_in_force = wire[at]; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.min_qty[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.max_floor[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 8 -> new_order_au_equities_v2_record.expire_time[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.clearing_participant_id[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> new_order_au_equities_v2_record.clearing_account[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.undisclosed = wire[at]; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 15 -> new_order_au_equities_v2_record.client_cross_ref[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.short_sell_naked_qty[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.short_sell_covered_qty[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.short_sell_long_qty[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 2 -> new_order_au_equities_v2_record.risk_group_id[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.no_trade_feat = wire[at]; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> new_order_au_equities_v2_record.no_trade_key[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.meqse = wire[at]; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 20 -> new_order_au_equities_v2_record.origin_of_trans[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> new_order_au_equities_v2_record.intermediary_id[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_record.directed_wholesale_indicator = wire[at]; at = at + 1;
  new_order_au_equities_v2_record.remove_crossing_from_clearing = wire[at]; at = at + 1;
  new_order_au_equities_v2_record.broker_preferencing = wire[at]; at = at + 1;
  new_order_au_equities_v2_record.routing_inst = wire[at]; at = at + 1;
  new_order_au_equities_v2_record.display_indicator = wire[at]; at = at + 1;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> new_order_au_equities_v2_record.expire_date[new_order_au_equities_v2_at] = wire[at]; at = at + 1; new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Au Equities V 2 is what was written, byte for byte */
inline equal_new_order_au_equities_v2(new_order_au_equities_v2_read, new_order_au_equities_v2_written) {
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> assert(new_order_au_equities_v2_read.account[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.account[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 2 -> assert(new_order_au_equities_v2_read.trading_participant_id[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.trading_participant_id[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 20 -> assert(new_order_au_equities_v2_read.cl_ord_id[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.cl_ord_id[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v2_read.exec_inst == new_order_au_equities_v2_written.exec_inst);
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> assert(new_order_au_equities_v2_read.order_qty[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.order_qty[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v2_read.ord_type == new_order_au_equities_v2_written.ord_type);
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 8 -> assert(new_order_au_equities_v2_read.price[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.price[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v2_read.capacity == new_order_au_equities_v2_written.capacity);
  assert(new_order_au_equities_v2_read.side == new_order_au_equities_v2_written.side);
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 6 -> assert(new_order_au_equities_v2_read.symbol[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.symbol[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v2_read.time_in_force == new_order_au_equities_v2_written.time_in_force);
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> assert(new_order_au_equities_v2_read.min_qty[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.min_qty[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> assert(new_order_au_equities_v2_read.max_floor[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.max_floor[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 8 -> assert(new_order_au_equities_v2_read.expire_time[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.expire_time[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> assert(new_order_au_equities_v2_read.clearing_participant_id[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.clearing_participant_id[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> assert(new_order_au_equities_v2_read.clearing_account[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.clearing_account[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v2_read.undisclosed == new_order_au_equities_v2_written.undisclosed);
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 15 -> assert(new_order_au_equities_v2_read.client_cross_ref[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.client_cross_ref[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> assert(new_order_au_equities_v2_read.short_sell_naked_qty[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.short_sell_naked_qty[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> assert(new_order_au_equities_v2_read.short_sell_covered_qty[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.short_sell_covered_qty[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> assert(new_order_au_equities_v2_read.short_sell_long_qty[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.short_sell_long_qty[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 2 -> assert(new_order_au_equities_v2_read.risk_group_id[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.risk_group_id[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v2_read.no_trade_feat == new_order_au_equities_v2_written.no_trade_feat);
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> assert(new_order_au_equities_v2_read.no_trade_key[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.no_trade_key[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v2_read.meqse == new_order_au_equities_v2_written.meqse);
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 20 -> assert(new_order_au_equities_v2_read.origin_of_trans[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.origin_of_trans[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 10 -> assert(new_order_au_equities_v2_read.intermediary_id[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.intermediary_id[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  assert(new_order_au_equities_v2_read.directed_wholesale_indicator == new_order_au_equities_v2_written.directed_wholesale_indicator);
  assert(new_order_au_equities_v2_read.remove_crossing_from_clearing == new_order_au_equities_v2_written.remove_crossing_from_clearing);
  assert(new_order_au_equities_v2_read.broker_preferencing == new_order_au_equities_v2_written.broker_preferencing);
  assert(new_order_au_equities_v2_read.routing_inst == new_order_au_equities_v2_written.routing_inst);
  assert(new_order_au_equities_v2_read.display_indicator == new_order_au_equities_v2_written.display_indicator);
  new_order_au_equities_v2_at = 0;
  do
  :: new_order_au_equities_v2_at < 4 -> assert(new_order_au_equities_v2_read.expire_date[new_order_au_equities_v2_at] == new_order_au_equities_v2_written.expire_date[new_order_au_equities_v2_at]); new_order_au_equities_v2_at = new_order_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Au Equities V 1: 76 bytes ---------------------------------- */

/* Request to modify an order */
typedef ModifyOrderAuEquitiesV1 {
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte exec_inst;
  byte order_qty[4];
  byte orig_cl_ord_id[20];
  byte price[8];
  byte min_qty[4];
  byte max_floor[4];
  byte short_sell_naked_qty[4];
  byte short_sell_covered_qty[4];
  byte short_sell_long_qty[4];
  byte cancel_orig_on_reject
};

int modify_order_au_equities_v1_at;

/* every byte of Modify Order Au Equities V 1 set to one value */
inline fill_modify_order_au_equities_v1(modify_order_au_equities_v1_record, modify_order_au_equities_v1_value) {
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 2 -> modify_order_au_equities_v1_record.trading_participant_id[modify_order_au_equities_v1_at] = modify_order_au_equities_v1_value; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 20 -> modify_order_au_equities_v1_record.cl_ord_id[modify_order_au_equities_v1_at] = modify_order_au_equities_v1_value; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_record.exec_inst = modify_order_au_equities_v1_value;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.order_qty[modify_order_au_equities_v1_at] = modify_order_au_equities_v1_value; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 20 -> modify_order_au_equities_v1_record.orig_cl_ord_id[modify_order_au_equities_v1_at] = modify_order_au_equities_v1_value; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 8 -> modify_order_au_equities_v1_record.price[modify_order_au_equities_v1_at] = modify_order_au_equities_v1_value; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.min_qty[modify_order_au_equities_v1_at] = modify_order_au_equities_v1_value; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.max_floor[modify_order_au_equities_v1_at] = modify_order_au_equities_v1_value; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.short_sell_naked_qty[modify_order_au_equities_v1_at] = modify_order_au_equities_v1_value; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.short_sell_covered_qty[modify_order_au_equities_v1_at] = modify_order_au_equities_v1_value; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.short_sell_long_qty[modify_order_au_equities_v1_at] = modify_order_au_equities_v1_value; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_record.cancel_orig_on_reject = modify_order_au_equities_v1_value;
  skip
}

/* each byte of Modify Order Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_modify_order_au_equities_v1(modify_order_au_equities_v1_record, modify_order_au_equities_v1_base) {
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 2 -> modify_order_au_equities_v1_record.trading_participant_id[modify_order_au_equities_v1_at] = (modify_order_au_equities_v1_base + 0 + modify_order_au_equities_v1_at + 1) % 256; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 20 -> modify_order_au_equities_v1_record.cl_ord_id[modify_order_au_equities_v1_at] = (modify_order_au_equities_v1_base + 2 + modify_order_au_equities_v1_at + 1) % 256; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_record.exec_inst = (modify_order_au_equities_v1_base + 22 + 1) % 256;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.order_qty[modify_order_au_equities_v1_at] = (modify_order_au_equities_v1_base + 23 + modify_order_au_equities_v1_at + 1) % 256; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 20 -> modify_order_au_equities_v1_record.orig_cl_ord_id[modify_order_au_equities_v1_at] = (modify_order_au_equities_v1_base + 27 + modify_order_au_equities_v1_at + 1) % 256; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 8 -> modify_order_au_equities_v1_record.price[modify_order_au_equities_v1_at] = (modify_order_au_equities_v1_base + 47 + modify_order_au_equities_v1_at + 1) % 256; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.min_qty[modify_order_au_equities_v1_at] = (modify_order_au_equities_v1_base + 55 + modify_order_au_equities_v1_at + 1) % 256; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.max_floor[modify_order_au_equities_v1_at] = (modify_order_au_equities_v1_base + 59 + modify_order_au_equities_v1_at + 1) % 256; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.short_sell_naked_qty[modify_order_au_equities_v1_at] = (modify_order_au_equities_v1_base + 63 + modify_order_au_equities_v1_at + 1) % 256; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.short_sell_covered_qty[modify_order_au_equities_v1_at] = (modify_order_au_equities_v1_base + 67 + modify_order_au_equities_v1_at + 1) % 256; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.short_sell_long_qty[modify_order_au_equities_v1_at] = (modify_order_au_equities_v1_base + 71 + modify_order_au_equities_v1_at + 1) % 256; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_record.cancel_orig_on_reject = (modify_order_au_equities_v1_base + 75 + 1) % 256;
  skip
}

/* Modify Order Au Equities V 1 to the wire, 76 bytes from where the cursor stands */
inline encode_modify_order_au_equities_v1(modify_order_au_equities_v1_record) {
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 2 -> wire[at] = modify_order_au_equities_v1_record.trading_participant_id[modify_order_au_equities_v1_at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 20 -> wire[at] = modify_order_au_equities_v1_record.cl_ord_id[modify_order_au_equities_v1_at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_au_equities_v1_record.exec_inst; at = at + 1;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> wire[at] = modify_order_au_equities_v1_record.order_qty[modify_order_au_equities_v1_at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 20 -> wire[at] = modify_order_au_equities_v1_record.orig_cl_ord_id[modify_order_au_equities_v1_at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 8 -> wire[at] = modify_order_au_equities_v1_record.price[modify_order_au_equities_v1_at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> wire[at] = modify_order_au_equities_v1_record.min_qty[modify_order_au_equities_v1_at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> wire[at] = modify_order_au_equities_v1_record.max_floor[modify_order_au_equities_v1_at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> wire[at] = modify_order_au_equities_v1_record.short_sell_naked_qty[modify_order_au_equities_v1_at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> wire[at] = modify_order_au_equities_v1_record.short_sell_covered_qty[modify_order_au_equities_v1_at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> wire[at] = modify_order_au_equities_v1_record.short_sell_long_qty[modify_order_au_equities_v1_at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_au_equities_v1_record.cancel_orig_on_reject; at = at + 1;
  skip
}

/* Modify Order Au Equities V 1 off the wire, 76 bytes from where the cursor stands */
inline decode_modify_order_au_equities_v1(modify_order_au_equities_v1_record) {
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 2 -> modify_order_au_equities_v1_record.trading_participant_id[modify_order_au_equities_v1_at] = wire[at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 20 -> modify_order_au_equities_v1_record.cl_ord_id[modify_order_au_equities_v1_at] = wire[at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_record.exec_inst = wire[at]; at = at + 1;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.order_qty[modify_order_au_equities_v1_at] = wire[at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 20 -> modify_order_au_equities_v1_record.orig_cl_ord_id[modify_order_au_equities_v1_at] = wire[at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 8 -> modify_order_au_equities_v1_record.price[modify_order_au_equities_v1_at] = wire[at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.min_qty[modify_order_au_equities_v1_at] = wire[at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.max_floor[modify_order_au_equities_v1_at] = wire[at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.short_sell_naked_qty[modify_order_au_equities_v1_at] = wire[at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.short_sell_covered_qty[modify_order_au_equities_v1_at] = wire[at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> modify_order_au_equities_v1_record.short_sell_long_qty[modify_order_au_equities_v1_at] = wire[at]; at = at + 1; modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_record.cancel_orig_on_reject = wire[at]; at = at + 1;
  skip
}

/* what was read of Modify Order Au Equities V 1 is what was written, byte for byte */
inline equal_modify_order_au_equities_v1(modify_order_au_equities_v1_read, modify_order_au_equities_v1_written) {
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 2 -> assert(modify_order_au_equities_v1_read.trading_participant_id[modify_order_au_equities_v1_at] == modify_order_au_equities_v1_written.trading_participant_id[modify_order_au_equities_v1_at]); modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 20 -> assert(modify_order_au_equities_v1_read.cl_ord_id[modify_order_au_equities_v1_at] == modify_order_au_equities_v1_written.cl_ord_id[modify_order_au_equities_v1_at]); modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(modify_order_au_equities_v1_read.exec_inst == modify_order_au_equities_v1_written.exec_inst);
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> assert(modify_order_au_equities_v1_read.order_qty[modify_order_au_equities_v1_at] == modify_order_au_equities_v1_written.order_qty[modify_order_au_equities_v1_at]); modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 20 -> assert(modify_order_au_equities_v1_read.orig_cl_ord_id[modify_order_au_equities_v1_at] == modify_order_au_equities_v1_written.orig_cl_ord_id[modify_order_au_equities_v1_at]); modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 8 -> assert(modify_order_au_equities_v1_read.price[modify_order_au_equities_v1_at] == modify_order_au_equities_v1_written.price[modify_order_au_equities_v1_at]); modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> assert(modify_order_au_equities_v1_read.min_qty[modify_order_au_equities_v1_at] == modify_order_au_equities_v1_written.min_qty[modify_order_au_equities_v1_at]); modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> assert(modify_order_au_equities_v1_read.max_floor[modify_order_au_equities_v1_at] == modify_order_au_equities_v1_written.max_floor[modify_order_au_equities_v1_at]); modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> assert(modify_order_au_equities_v1_read.short_sell_naked_qty[modify_order_au_equities_v1_at] == modify_order_au_equities_v1_written.short_sell_naked_qty[modify_order_au_equities_v1_at]); modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> assert(modify_order_au_equities_v1_read.short_sell_covered_qty[modify_order_au_equities_v1_at] == modify_order_au_equities_v1_written.short_sell_covered_qty[modify_order_au_equities_v1_at]); modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v1_at = 0;
  do
  :: modify_order_au_equities_v1_at < 4 -> assert(modify_order_au_equities_v1_read.short_sell_long_qty[modify_order_au_equities_v1_at] == modify_order_au_equities_v1_written.short_sell_long_qty[modify_order_au_equities_v1_at]); modify_order_au_equities_v1_at = modify_order_au_equities_v1_at + 1
  :: else -> break
  od;
  assert(modify_order_au_equities_v1_read.cancel_orig_on_reject == modify_order_au_equities_v1_written.cancel_orig_on_reject);
  skip
}

/* ---- Modify Order Au Equities V 2: 80 bytes ---------------------------------- */

/* Request to modify an order, with ExpireDate for multi-day orders */
typedef ModifyOrderAuEquitiesV2 {
  byte trading_participant_id[2];
  byte cl_ord_id[20];
  byte exec_inst;
  byte order_qty[4];
  byte orig_cl_ord_id[20];
  byte price[8];
  byte min_qty[4];
  byte max_floor[4];
  byte short_sell_naked_qty[4];
  byte short_sell_covered_qty[4];
  byte short_sell_long_qty[4];
  byte cancel_orig_on_reject;
  byte expire_date[4]
};

int modify_order_au_equities_v2_at;

/* every byte of Modify Order Au Equities V 2 set to one value */
inline fill_modify_order_au_equities_v2(modify_order_au_equities_v2_record, modify_order_au_equities_v2_value) {
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 2 -> modify_order_au_equities_v2_record.trading_participant_id[modify_order_au_equities_v2_at] = modify_order_au_equities_v2_value; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 20 -> modify_order_au_equities_v2_record.cl_ord_id[modify_order_au_equities_v2_at] = modify_order_au_equities_v2_value; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_record.exec_inst = modify_order_au_equities_v2_value;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.order_qty[modify_order_au_equities_v2_at] = modify_order_au_equities_v2_value; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 20 -> modify_order_au_equities_v2_record.orig_cl_ord_id[modify_order_au_equities_v2_at] = modify_order_au_equities_v2_value; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 8 -> modify_order_au_equities_v2_record.price[modify_order_au_equities_v2_at] = modify_order_au_equities_v2_value; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.min_qty[modify_order_au_equities_v2_at] = modify_order_au_equities_v2_value; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.max_floor[modify_order_au_equities_v2_at] = modify_order_au_equities_v2_value; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.short_sell_naked_qty[modify_order_au_equities_v2_at] = modify_order_au_equities_v2_value; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.short_sell_covered_qty[modify_order_au_equities_v2_at] = modify_order_au_equities_v2_value; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.short_sell_long_qty[modify_order_au_equities_v2_at] = modify_order_au_equities_v2_value; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_record.cancel_orig_on_reject = modify_order_au_equities_v2_value;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.expire_date[modify_order_au_equities_v2_at] = modify_order_au_equities_v2_value; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order Au Equities V 2 set to where it lies, so a field read out of place says so */
inline ramp_modify_order_au_equities_v2(modify_order_au_equities_v2_record, modify_order_au_equities_v2_base) {
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 2 -> modify_order_au_equities_v2_record.trading_participant_id[modify_order_au_equities_v2_at] = (modify_order_au_equities_v2_base + 0 + modify_order_au_equities_v2_at + 1) % 256; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 20 -> modify_order_au_equities_v2_record.cl_ord_id[modify_order_au_equities_v2_at] = (modify_order_au_equities_v2_base + 2 + modify_order_au_equities_v2_at + 1) % 256; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_record.exec_inst = (modify_order_au_equities_v2_base + 22 + 1) % 256;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.order_qty[modify_order_au_equities_v2_at] = (modify_order_au_equities_v2_base + 23 + modify_order_au_equities_v2_at + 1) % 256; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 20 -> modify_order_au_equities_v2_record.orig_cl_ord_id[modify_order_au_equities_v2_at] = (modify_order_au_equities_v2_base + 27 + modify_order_au_equities_v2_at + 1) % 256; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 8 -> modify_order_au_equities_v2_record.price[modify_order_au_equities_v2_at] = (modify_order_au_equities_v2_base + 47 + modify_order_au_equities_v2_at + 1) % 256; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.min_qty[modify_order_au_equities_v2_at] = (modify_order_au_equities_v2_base + 55 + modify_order_au_equities_v2_at + 1) % 256; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.max_floor[modify_order_au_equities_v2_at] = (modify_order_au_equities_v2_base + 59 + modify_order_au_equities_v2_at + 1) % 256; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.short_sell_naked_qty[modify_order_au_equities_v2_at] = (modify_order_au_equities_v2_base + 63 + modify_order_au_equities_v2_at + 1) % 256; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.short_sell_covered_qty[modify_order_au_equities_v2_at] = (modify_order_au_equities_v2_base + 67 + modify_order_au_equities_v2_at + 1) % 256; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.short_sell_long_qty[modify_order_au_equities_v2_at] = (modify_order_au_equities_v2_base + 71 + modify_order_au_equities_v2_at + 1) % 256; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_record.cancel_orig_on_reject = (modify_order_au_equities_v2_base + 75 + 1) % 256;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.expire_date[modify_order_au_equities_v2_at] = (modify_order_au_equities_v2_base + 76 + modify_order_au_equities_v2_at + 1) % 256; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Au Equities V 2 to the wire, 80 bytes from where the cursor stands */
inline encode_modify_order_au_equities_v2(modify_order_au_equities_v2_record) {
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 2 -> wire[at] = modify_order_au_equities_v2_record.trading_participant_id[modify_order_au_equities_v2_at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 20 -> wire[at] = modify_order_au_equities_v2_record.cl_ord_id[modify_order_au_equities_v2_at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_au_equities_v2_record.exec_inst; at = at + 1;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> wire[at] = modify_order_au_equities_v2_record.order_qty[modify_order_au_equities_v2_at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 20 -> wire[at] = modify_order_au_equities_v2_record.orig_cl_ord_id[modify_order_au_equities_v2_at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 8 -> wire[at] = modify_order_au_equities_v2_record.price[modify_order_au_equities_v2_at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> wire[at] = modify_order_au_equities_v2_record.min_qty[modify_order_au_equities_v2_at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> wire[at] = modify_order_au_equities_v2_record.max_floor[modify_order_au_equities_v2_at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> wire[at] = modify_order_au_equities_v2_record.short_sell_naked_qty[modify_order_au_equities_v2_at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> wire[at] = modify_order_au_equities_v2_record.short_sell_covered_qty[modify_order_au_equities_v2_at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> wire[at] = modify_order_au_equities_v2_record.short_sell_long_qty[modify_order_au_equities_v2_at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_au_equities_v2_record.cancel_orig_on_reject; at = at + 1;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> wire[at] = modify_order_au_equities_v2_record.expire_date[modify_order_au_equities_v2_at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Au Equities V 2 off the wire, 80 bytes from where the cursor stands */
inline decode_modify_order_au_equities_v2(modify_order_au_equities_v2_record) {
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 2 -> modify_order_au_equities_v2_record.trading_participant_id[modify_order_au_equities_v2_at] = wire[at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 20 -> modify_order_au_equities_v2_record.cl_ord_id[modify_order_au_equities_v2_at] = wire[at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_record.exec_inst = wire[at]; at = at + 1;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.order_qty[modify_order_au_equities_v2_at] = wire[at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 20 -> modify_order_au_equities_v2_record.orig_cl_ord_id[modify_order_au_equities_v2_at] = wire[at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 8 -> modify_order_au_equities_v2_record.price[modify_order_au_equities_v2_at] = wire[at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.min_qty[modify_order_au_equities_v2_at] = wire[at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.max_floor[modify_order_au_equities_v2_at] = wire[at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.short_sell_naked_qty[modify_order_au_equities_v2_at] = wire[at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.short_sell_covered_qty[modify_order_au_equities_v2_at] = wire[at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.short_sell_long_qty[modify_order_au_equities_v2_at] = wire[at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_record.cancel_orig_on_reject = wire[at]; at = at + 1;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> modify_order_au_equities_v2_record.expire_date[modify_order_au_equities_v2_at] = wire[at]; at = at + 1; modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order Au Equities V 2 is what was written, byte for byte */
inline equal_modify_order_au_equities_v2(modify_order_au_equities_v2_read, modify_order_au_equities_v2_written) {
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 2 -> assert(modify_order_au_equities_v2_read.trading_participant_id[modify_order_au_equities_v2_at] == modify_order_au_equities_v2_written.trading_participant_id[modify_order_au_equities_v2_at]); modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 20 -> assert(modify_order_au_equities_v2_read.cl_ord_id[modify_order_au_equities_v2_at] == modify_order_au_equities_v2_written.cl_ord_id[modify_order_au_equities_v2_at]); modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  assert(modify_order_au_equities_v2_read.exec_inst == modify_order_au_equities_v2_written.exec_inst);
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> assert(modify_order_au_equities_v2_read.order_qty[modify_order_au_equities_v2_at] == modify_order_au_equities_v2_written.order_qty[modify_order_au_equities_v2_at]); modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 20 -> assert(modify_order_au_equities_v2_read.orig_cl_ord_id[modify_order_au_equities_v2_at] == modify_order_au_equities_v2_written.orig_cl_ord_id[modify_order_au_equities_v2_at]); modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 8 -> assert(modify_order_au_equities_v2_read.price[modify_order_au_equities_v2_at] == modify_order_au_equities_v2_written.price[modify_order_au_equities_v2_at]); modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> assert(modify_order_au_equities_v2_read.min_qty[modify_order_au_equities_v2_at] == modify_order_au_equities_v2_written.min_qty[modify_order_au_equities_v2_at]); modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> assert(modify_order_au_equities_v2_read.max_floor[modify_order_au_equities_v2_at] == modify_order_au_equities_v2_written.max_floor[modify_order_au_equities_v2_at]); modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> assert(modify_order_au_equities_v2_read.short_sell_naked_qty[modify_order_au_equities_v2_at] == modify_order_au_equities_v2_written.short_sell_naked_qty[modify_order_au_equities_v2_at]); modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> assert(modify_order_au_equities_v2_read.short_sell_covered_qty[modify_order_au_equities_v2_at] == modify_order_au_equities_v2_written.short_sell_covered_qty[modify_order_au_equities_v2_at]); modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> assert(modify_order_au_equities_v2_read.short_sell_long_qty[modify_order_au_equities_v2_at] == modify_order_au_equities_v2_written.short_sell_long_qty[modify_order_au_equities_v2_at]); modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  assert(modify_order_au_equities_v2_read.cancel_orig_on_reject == modify_order_au_equities_v2_written.cancel_orig_on_reject);
  modify_order_au_equities_v2_at = 0;
  do
  :: modify_order_au_equities_v2_at < 4 -> assert(modify_order_au_equities_v2_read.expire_date[modify_order_au_equities_v2_at] == modify_order_au_equities_v2_written.expire_date[modify_order_au_equities_v2_at]); modify_order_au_equities_v2_at = modify_order_au_equities_v2_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order Au Equities V 1: 22 bytes ---------------------------------- */

/* Request to cancel a single order */
typedef CancelOrderAuEquitiesV1 {
  byte trading_participant_id[2];
  byte orig_cl_ord_id[20]
};

int cancel_order_au_equities_v1_at;

/* every byte of Cancel Order Au Equities V 1 set to one value */
inline fill_cancel_order_au_equities_v1(cancel_order_au_equities_v1_record, cancel_order_au_equities_v1_value) {
  cancel_order_au_equities_v1_at = 0;
  do
  :: cancel_order_au_equities_v1_at < 2 -> cancel_order_au_equities_v1_record.trading_participant_id[cancel_order_au_equities_v1_at] = cancel_order_au_equities_v1_value; cancel_order_au_equities_v1_at = cancel_order_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_au_equities_v1_at = 0;
  do
  :: cancel_order_au_equities_v1_at < 20 -> cancel_order_au_equities_v1_record.orig_cl_ord_id[cancel_order_au_equities_v1_at] = cancel_order_au_equities_v1_value; cancel_order_au_equities_v1_at = cancel_order_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Au Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_au_equities_v1(cancel_order_au_equities_v1_record, cancel_order_au_equities_v1_base) {
  cancel_order_au_equities_v1_at = 0;
  do
  :: cancel_order_au_equities_v1_at < 2 -> cancel_order_au_equities_v1_record.trading_participant_id[cancel_order_au_equities_v1_at] = (cancel_order_au_equities_v1_base + 0 + cancel_order_au_equities_v1_at + 1) % 256; cancel_order_au_equities_v1_at = cancel_order_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_au_equities_v1_at = 0;
  do
  :: cancel_order_au_equities_v1_at < 20 -> cancel_order_au_equities_v1_record.orig_cl_ord_id[cancel_order_au_equities_v1_at] = (cancel_order_au_equities_v1_base + 2 + cancel_order_au_equities_v1_at + 1) % 256; cancel_order_au_equities_v1_at = cancel_order_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Au Equities V 1 to the wire, 22 bytes from where the cursor stands */
inline encode_cancel_order_au_equities_v1(cancel_order_au_equities_v1_record) {
  cancel_order_au_equities_v1_at = 0;
  do
  :: cancel_order_au_equities_v1_at < 2 -> wire[at] = cancel_order_au_equities_v1_record.trading_participant_id[cancel_order_au_equities_v1_at]; at = at + 1; cancel_order_au_equities_v1_at = cancel_order_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_au_equities_v1_at = 0;
  do
  :: cancel_order_au_equities_v1_at < 20 -> wire[at] = cancel_order_au_equities_v1_record.orig_cl_ord_id[cancel_order_au_equities_v1_at]; at = at + 1; cancel_order_au_equities_v1_at = cancel_order_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Au Equities V 1 off the wire, 22 bytes from where the cursor stands */
inline decode_cancel_order_au_equities_v1(cancel_order_au_equities_v1_record) {
  cancel_order_au_equities_v1_at = 0;
  do
  :: cancel_order_au_equities_v1_at < 2 -> cancel_order_au_equities_v1_record.trading_participant_id[cancel_order_au_equities_v1_at] = wire[at]; at = at + 1; cancel_order_au_equities_v1_at = cancel_order_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_au_equities_v1_at = 0;
  do
  :: cancel_order_au_equities_v1_at < 20 -> cancel_order_au_equities_v1_record.orig_cl_ord_id[cancel_order_au_equities_v1_at] = wire[at]; at = at + 1; cancel_order_au_equities_v1_at = cancel_order_au_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Au Equities V 1 is what was written, byte for byte */
inline equal_cancel_order_au_equities_v1(cancel_order_au_equities_v1_read, cancel_order_au_equities_v1_written) {
  cancel_order_au_equities_v1_at = 0;
  do
  :: cancel_order_au_equities_v1_at < 2 -> assert(cancel_order_au_equities_v1_read.trading_participant_id[cancel_order_au_equities_v1_at] == cancel_order_au_equities_v1_written.trading_participant_id[cancel_order_au_equities_v1_at]); cancel_order_au_equities_v1_at = cancel_order_au_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_au_equities_v1_at = 0;
  do
  :: cancel_order_au_equities_v1_at < 20 -> assert(cancel_order_au_equities_v1_read.orig_cl_ord_id[cancel_order_au_equities_v1_at] == cancel_order_au_equities_v1_written.orig_cl_ord_id[cancel_order_au_equities_v1_at]); cancel_order_au_equities_v1_at = cancel_order_au_equities_v1_at + 1
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

/* New Order Au Equities V 1: encoded, read back, and compared */
proctype check_new_order_au_equities_v1() {
  NewOrderAuEquitiesV1 new_order_au_equities_v1_sent;
  NewOrderAuEquitiesV1 new_order_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_au_equities_v1(new_order_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_new_order_au_equities_v1(new_order_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_new_order_au_equities_v1(new_order_au_equities_v1_sent, 255)
  :: else -> ramp_new_order_au_equities_v1(new_order_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_au_equities_v1(new_order_au_equities_v1_sent);
    assert(at == 160);
    at = 0;
    decode_new_order_au_equities_v1(new_order_au_equities_v1_got);
    assert(at == 160);
    equal_new_order_au_equities_v1(new_order_au_equities_v1_got, new_order_au_equities_v1_sent)
  }
}

/* New Order Au Equities V 2: encoded, read back, and compared */
proctype check_new_order_au_equities_v2() {
  NewOrderAuEquitiesV2 new_order_au_equities_v2_sent;
  NewOrderAuEquitiesV2 new_order_au_equities_v2_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_au_equities_v2(new_order_au_equities_v2_sent, 0)
  :: pattern == 1 -> fill_new_order_au_equities_v2(new_order_au_equities_v2_sent, 32)
  :: pattern == 2 -> fill_new_order_au_equities_v2(new_order_au_equities_v2_sent, 255)
  :: else -> ramp_new_order_au_equities_v2(new_order_au_equities_v2_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_au_equities_v2(new_order_au_equities_v2_sent);
    assert(at == 166);
    at = 0;
    decode_new_order_au_equities_v2(new_order_au_equities_v2_got);
    assert(at == 166);
    equal_new_order_au_equities_v2(new_order_au_equities_v2_got, new_order_au_equities_v2_sent)
  }
}

/* Modify Order Au Equities V 1: encoded, read back, and compared */
proctype check_modify_order_au_equities_v1() {
  ModifyOrderAuEquitiesV1 modify_order_au_equities_v1_sent;
  ModifyOrderAuEquitiesV1 modify_order_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_au_equities_v1(modify_order_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_modify_order_au_equities_v1(modify_order_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_modify_order_au_equities_v1(modify_order_au_equities_v1_sent, 255)
  :: else -> ramp_modify_order_au_equities_v1(modify_order_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_au_equities_v1(modify_order_au_equities_v1_sent);
    assert(at == 76);
    at = 0;
    decode_modify_order_au_equities_v1(modify_order_au_equities_v1_got);
    assert(at == 76);
    equal_modify_order_au_equities_v1(modify_order_au_equities_v1_got, modify_order_au_equities_v1_sent)
  }
}

/* Modify Order Au Equities V 2: encoded, read back, and compared */
proctype check_modify_order_au_equities_v2() {
  ModifyOrderAuEquitiesV2 modify_order_au_equities_v2_sent;
  ModifyOrderAuEquitiesV2 modify_order_au_equities_v2_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_au_equities_v2(modify_order_au_equities_v2_sent, 0)
  :: pattern == 1 -> fill_modify_order_au_equities_v2(modify_order_au_equities_v2_sent, 32)
  :: pattern == 2 -> fill_modify_order_au_equities_v2(modify_order_au_equities_v2_sent, 255)
  :: else -> ramp_modify_order_au_equities_v2(modify_order_au_equities_v2_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_au_equities_v2(modify_order_au_equities_v2_sent);
    assert(at == 80);
    at = 0;
    decode_modify_order_au_equities_v2(modify_order_au_equities_v2_got);
    assert(at == 80);
    equal_modify_order_au_equities_v2(modify_order_au_equities_v2_got, modify_order_au_equities_v2_sent)
  }
}

/* Cancel Order Au Equities V 1: encoded, read back, and compared */
proctype check_cancel_order_au_equities_v1() {
  CancelOrderAuEquitiesV1 cancel_order_au_equities_v1_sent;
  CancelOrderAuEquitiesV1 cancel_order_au_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_au_equities_v1(cancel_order_au_equities_v1_sent, 0)
  :: pattern == 1 -> fill_cancel_order_au_equities_v1(cancel_order_au_equities_v1_sent, 32)
  :: pattern == 2 -> fill_cancel_order_au_equities_v1(cancel_order_au_equities_v1_sent, 255)
  :: else -> ramp_cancel_order_au_equities_v1(cancel_order_au_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_au_equities_v1(cancel_order_au_equities_v1_sent);
    assert(at == 22);
    at = 0;
    decode_cancel_order_au_equities_v1(cancel_order_au_equities_v1_got);
    assert(at == 22);
    equal_cancel_order_au_equities_v1(cancel_order_au_equities_v1_got, cancel_order_au_equities_v1_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_firm_message_header()
  :: run check_new_order_au_equities_v1()
  :: run check_new_order_au_equities_v2()
  :: run check_modify_order_au_equities_v1()
  :: run check_modify_order_au_equities_v2()
  :: run check_cancel_order_au_equities_v1()
  fi
}
