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
#define WIRE 87

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

/* ---- New Order Jp Equities V 1: 87 bytes ------------------------------------- */

/* Submission of a new order to Cboe Japan */
typedef NewOrderJpEquitiesV1 {
  byte account[10];
  byte trading_firm[4];
  byte cl_ord_id[20];
  byte order_qty[4];
  byte ord_type;
  byte price[8];
  byte capacity;
  byte side;
  byte symbol[8];
  byte time_in_force;
  byte expire_time[8];
  byte cash_margin;
  byte risk_group_id[2];
  byte no_trade_feat;
  byte no_trade_key[10];
  byte posting_instruction;
  byte order_classification;
  byte margin_transaction_type;
  byte company_id[4]
};

int new_order_jp_equities_v1_at;

/* every byte of New Order Jp Equities V 1 set to one value */
inline fill_new_order_jp_equities_v1(new_order_jp_equities_v1_record, new_order_jp_equities_v1_value) {
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 10 -> new_order_jp_equities_v1_record.account[new_order_jp_equities_v1_at] = new_order_jp_equities_v1_value; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> new_order_jp_equities_v1_record.trading_firm[new_order_jp_equities_v1_at] = new_order_jp_equities_v1_value; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 20 -> new_order_jp_equities_v1_record.cl_ord_id[new_order_jp_equities_v1_at] = new_order_jp_equities_v1_value; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> new_order_jp_equities_v1_record.order_qty[new_order_jp_equities_v1_at] = new_order_jp_equities_v1_value; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.ord_type = new_order_jp_equities_v1_value;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> new_order_jp_equities_v1_record.price[new_order_jp_equities_v1_at] = new_order_jp_equities_v1_value; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.capacity = new_order_jp_equities_v1_value;
  new_order_jp_equities_v1_record.side = new_order_jp_equities_v1_value;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> new_order_jp_equities_v1_record.symbol[new_order_jp_equities_v1_at] = new_order_jp_equities_v1_value; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.time_in_force = new_order_jp_equities_v1_value;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> new_order_jp_equities_v1_record.expire_time[new_order_jp_equities_v1_at] = new_order_jp_equities_v1_value; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.cash_margin = new_order_jp_equities_v1_value;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 2 -> new_order_jp_equities_v1_record.risk_group_id[new_order_jp_equities_v1_at] = new_order_jp_equities_v1_value; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.no_trade_feat = new_order_jp_equities_v1_value;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 10 -> new_order_jp_equities_v1_record.no_trade_key[new_order_jp_equities_v1_at] = new_order_jp_equities_v1_value; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.posting_instruction = new_order_jp_equities_v1_value;
  new_order_jp_equities_v1_record.order_classification = new_order_jp_equities_v1_value;
  new_order_jp_equities_v1_record.margin_transaction_type = new_order_jp_equities_v1_value;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> new_order_jp_equities_v1_record.company_id[new_order_jp_equities_v1_at] = new_order_jp_equities_v1_value; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Jp Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_new_order_jp_equities_v1(new_order_jp_equities_v1_record, new_order_jp_equities_v1_base) {
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 10 -> new_order_jp_equities_v1_record.account[new_order_jp_equities_v1_at] = (new_order_jp_equities_v1_base + 0 + new_order_jp_equities_v1_at + 1) % 256; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> new_order_jp_equities_v1_record.trading_firm[new_order_jp_equities_v1_at] = (new_order_jp_equities_v1_base + 10 + new_order_jp_equities_v1_at + 1) % 256; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 20 -> new_order_jp_equities_v1_record.cl_ord_id[new_order_jp_equities_v1_at] = (new_order_jp_equities_v1_base + 14 + new_order_jp_equities_v1_at + 1) % 256; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> new_order_jp_equities_v1_record.order_qty[new_order_jp_equities_v1_at] = (new_order_jp_equities_v1_base + 34 + new_order_jp_equities_v1_at + 1) % 256; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.ord_type = (new_order_jp_equities_v1_base + 38 + 1) % 256;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> new_order_jp_equities_v1_record.price[new_order_jp_equities_v1_at] = (new_order_jp_equities_v1_base + 39 + new_order_jp_equities_v1_at + 1) % 256; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.capacity = (new_order_jp_equities_v1_base + 47 + 1) % 256;
  new_order_jp_equities_v1_record.side = (new_order_jp_equities_v1_base + 48 + 1) % 256;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> new_order_jp_equities_v1_record.symbol[new_order_jp_equities_v1_at] = (new_order_jp_equities_v1_base + 49 + new_order_jp_equities_v1_at + 1) % 256; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.time_in_force = (new_order_jp_equities_v1_base + 57 + 1) % 256;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> new_order_jp_equities_v1_record.expire_time[new_order_jp_equities_v1_at] = (new_order_jp_equities_v1_base + 58 + new_order_jp_equities_v1_at + 1) % 256; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.cash_margin = (new_order_jp_equities_v1_base + 66 + 1) % 256;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 2 -> new_order_jp_equities_v1_record.risk_group_id[new_order_jp_equities_v1_at] = (new_order_jp_equities_v1_base + 67 + new_order_jp_equities_v1_at + 1) % 256; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.no_trade_feat = (new_order_jp_equities_v1_base + 69 + 1) % 256;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 10 -> new_order_jp_equities_v1_record.no_trade_key[new_order_jp_equities_v1_at] = (new_order_jp_equities_v1_base + 70 + new_order_jp_equities_v1_at + 1) % 256; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.posting_instruction = (new_order_jp_equities_v1_base + 80 + 1) % 256;
  new_order_jp_equities_v1_record.order_classification = (new_order_jp_equities_v1_base + 81 + 1) % 256;
  new_order_jp_equities_v1_record.margin_transaction_type = (new_order_jp_equities_v1_base + 82 + 1) % 256;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> new_order_jp_equities_v1_record.company_id[new_order_jp_equities_v1_at] = (new_order_jp_equities_v1_base + 83 + new_order_jp_equities_v1_at + 1) % 256; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Jp Equities V 1 to the wire, 87 bytes from where the cursor stands */
inline encode_new_order_jp_equities_v1(new_order_jp_equities_v1_record) {
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 10 -> wire[at] = new_order_jp_equities_v1_record.account[new_order_jp_equities_v1_at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> wire[at] = new_order_jp_equities_v1_record.trading_firm[new_order_jp_equities_v1_at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 20 -> wire[at] = new_order_jp_equities_v1_record.cl_ord_id[new_order_jp_equities_v1_at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> wire[at] = new_order_jp_equities_v1_record.order_qty[new_order_jp_equities_v1_at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_jp_equities_v1_record.ord_type; at = at + 1;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> wire[at] = new_order_jp_equities_v1_record.price[new_order_jp_equities_v1_at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_jp_equities_v1_record.capacity; at = at + 1;
  wire[at] = new_order_jp_equities_v1_record.side; at = at + 1;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> wire[at] = new_order_jp_equities_v1_record.symbol[new_order_jp_equities_v1_at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_jp_equities_v1_record.time_in_force; at = at + 1;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> wire[at] = new_order_jp_equities_v1_record.expire_time[new_order_jp_equities_v1_at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_jp_equities_v1_record.cash_margin; at = at + 1;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 2 -> wire[at] = new_order_jp_equities_v1_record.risk_group_id[new_order_jp_equities_v1_at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_jp_equities_v1_record.no_trade_feat; at = at + 1;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 10 -> wire[at] = new_order_jp_equities_v1_record.no_trade_key[new_order_jp_equities_v1_at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = new_order_jp_equities_v1_record.posting_instruction; at = at + 1;
  wire[at] = new_order_jp_equities_v1_record.order_classification; at = at + 1;
  wire[at] = new_order_jp_equities_v1_record.margin_transaction_type; at = at + 1;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> wire[at] = new_order_jp_equities_v1_record.company_id[new_order_jp_equities_v1_at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Jp Equities V 1 off the wire, 87 bytes from where the cursor stands */
inline decode_new_order_jp_equities_v1(new_order_jp_equities_v1_record) {
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 10 -> new_order_jp_equities_v1_record.account[new_order_jp_equities_v1_at] = wire[at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> new_order_jp_equities_v1_record.trading_firm[new_order_jp_equities_v1_at] = wire[at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 20 -> new_order_jp_equities_v1_record.cl_ord_id[new_order_jp_equities_v1_at] = wire[at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> new_order_jp_equities_v1_record.order_qty[new_order_jp_equities_v1_at] = wire[at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.ord_type = wire[at]; at = at + 1;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> new_order_jp_equities_v1_record.price[new_order_jp_equities_v1_at] = wire[at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.capacity = wire[at]; at = at + 1;
  new_order_jp_equities_v1_record.side = wire[at]; at = at + 1;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> new_order_jp_equities_v1_record.symbol[new_order_jp_equities_v1_at] = wire[at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.time_in_force = wire[at]; at = at + 1;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> new_order_jp_equities_v1_record.expire_time[new_order_jp_equities_v1_at] = wire[at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.cash_margin = wire[at]; at = at + 1;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 2 -> new_order_jp_equities_v1_record.risk_group_id[new_order_jp_equities_v1_at] = wire[at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.no_trade_feat = wire[at]; at = at + 1;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 10 -> new_order_jp_equities_v1_record.no_trade_key[new_order_jp_equities_v1_at] = wire[at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_record.posting_instruction = wire[at]; at = at + 1;
  new_order_jp_equities_v1_record.order_classification = wire[at]; at = at + 1;
  new_order_jp_equities_v1_record.margin_transaction_type = wire[at]; at = at + 1;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> new_order_jp_equities_v1_record.company_id[new_order_jp_equities_v1_at] = wire[at]; at = at + 1; new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Jp Equities V 1 is what was written, byte for byte */
inline equal_new_order_jp_equities_v1(new_order_jp_equities_v1_read, new_order_jp_equities_v1_written) {
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 10 -> assert(new_order_jp_equities_v1_read.account[new_order_jp_equities_v1_at] == new_order_jp_equities_v1_written.account[new_order_jp_equities_v1_at]); new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> assert(new_order_jp_equities_v1_read.trading_firm[new_order_jp_equities_v1_at] == new_order_jp_equities_v1_written.trading_firm[new_order_jp_equities_v1_at]); new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 20 -> assert(new_order_jp_equities_v1_read.cl_ord_id[new_order_jp_equities_v1_at] == new_order_jp_equities_v1_written.cl_ord_id[new_order_jp_equities_v1_at]); new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> assert(new_order_jp_equities_v1_read.order_qty[new_order_jp_equities_v1_at] == new_order_jp_equities_v1_written.order_qty[new_order_jp_equities_v1_at]); new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_jp_equities_v1_read.ord_type == new_order_jp_equities_v1_written.ord_type);
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> assert(new_order_jp_equities_v1_read.price[new_order_jp_equities_v1_at] == new_order_jp_equities_v1_written.price[new_order_jp_equities_v1_at]); new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_jp_equities_v1_read.capacity == new_order_jp_equities_v1_written.capacity);
  assert(new_order_jp_equities_v1_read.side == new_order_jp_equities_v1_written.side);
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> assert(new_order_jp_equities_v1_read.symbol[new_order_jp_equities_v1_at] == new_order_jp_equities_v1_written.symbol[new_order_jp_equities_v1_at]); new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_jp_equities_v1_read.time_in_force == new_order_jp_equities_v1_written.time_in_force);
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 8 -> assert(new_order_jp_equities_v1_read.expire_time[new_order_jp_equities_v1_at] == new_order_jp_equities_v1_written.expire_time[new_order_jp_equities_v1_at]); new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_jp_equities_v1_read.cash_margin == new_order_jp_equities_v1_written.cash_margin);
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 2 -> assert(new_order_jp_equities_v1_read.risk_group_id[new_order_jp_equities_v1_at] == new_order_jp_equities_v1_written.risk_group_id[new_order_jp_equities_v1_at]); new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_jp_equities_v1_read.no_trade_feat == new_order_jp_equities_v1_written.no_trade_feat);
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 10 -> assert(new_order_jp_equities_v1_read.no_trade_key[new_order_jp_equities_v1_at] == new_order_jp_equities_v1_written.no_trade_key[new_order_jp_equities_v1_at]); new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(new_order_jp_equities_v1_read.posting_instruction == new_order_jp_equities_v1_written.posting_instruction);
  assert(new_order_jp_equities_v1_read.order_classification == new_order_jp_equities_v1_written.order_classification);
  assert(new_order_jp_equities_v1_read.margin_transaction_type == new_order_jp_equities_v1_written.margin_transaction_type);
  new_order_jp_equities_v1_at = 0;
  do
  :: new_order_jp_equities_v1_at < 4 -> assert(new_order_jp_equities_v1_read.company_id[new_order_jp_equities_v1_at] == new_order_jp_equities_v1_written.company_id[new_order_jp_equities_v1_at]); new_order_jp_equities_v1_at = new_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Jp Equities V 1: 57 bytes ---------------------------------- */

/* Request to modify an order. Only Price and OrderQty may be adjusted */
typedef ModifyOrderJpEquitiesV1 {
  byte trading_firm[4];
  byte cl_ord_id[20];
  byte order_qty[4];
  byte orig_cl_ord_id[20];
  byte price[8];
  byte cancel_orig_on_reject
};

int modify_order_jp_equities_v1_at;

/* every byte of Modify Order Jp Equities V 1 set to one value */
inline fill_modify_order_jp_equities_v1(modify_order_jp_equities_v1_record, modify_order_jp_equities_v1_value) {
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 4 -> modify_order_jp_equities_v1_record.trading_firm[modify_order_jp_equities_v1_at] = modify_order_jp_equities_v1_value; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 20 -> modify_order_jp_equities_v1_record.cl_ord_id[modify_order_jp_equities_v1_at] = modify_order_jp_equities_v1_value; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 4 -> modify_order_jp_equities_v1_record.order_qty[modify_order_jp_equities_v1_at] = modify_order_jp_equities_v1_value; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 20 -> modify_order_jp_equities_v1_record.orig_cl_ord_id[modify_order_jp_equities_v1_at] = modify_order_jp_equities_v1_value; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 8 -> modify_order_jp_equities_v1_record.price[modify_order_jp_equities_v1_at] = modify_order_jp_equities_v1_value; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_record.cancel_orig_on_reject = modify_order_jp_equities_v1_value;
  skip
}

/* each byte of Modify Order Jp Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_modify_order_jp_equities_v1(modify_order_jp_equities_v1_record, modify_order_jp_equities_v1_base) {
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 4 -> modify_order_jp_equities_v1_record.trading_firm[modify_order_jp_equities_v1_at] = (modify_order_jp_equities_v1_base + 0 + modify_order_jp_equities_v1_at + 1) % 256; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 20 -> modify_order_jp_equities_v1_record.cl_ord_id[modify_order_jp_equities_v1_at] = (modify_order_jp_equities_v1_base + 4 + modify_order_jp_equities_v1_at + 1) % 256; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 4 -> modify_order_jp_equities_v1_record.order_qty[modify_order_jp_equities_v1_at] = (modify_order_jp_equities_v1_base + 24 + modify_order_jp_equities_v1_at + 1) % 256; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 20 -> modify_order_jp_equities_v1_record.orig_cl_ord_id[modify_order_jp_equities_v1_at] = (modify_order_jp_equities_v1_base + 28 + modify_order_jp_equities_v1_at + 1) % 256; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 8 -> modify_order_jp_equities_v1_record.price[modify_order_jp_equities_v1_at] = (modify_order_jp_equities_v1_base + 48 + modify_order_jp_equities_v1_at + 1) % 256; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_record.cancel_orig_on_reject = (modify_order_jp_equities_v1_base + 56 + 1) % 256;
  skip
}

/* Modify Order Jp Equities V 1 to the wire, 57 bytes from where the cursor stands */
inline encode_modify_order_jp_equities_v1(modify_order_jp_equities_v1_record) {
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 4 -> wire[at] = modify_order_jp_equities_v1_record.trading_firm[modify_order_jp_equities_v1_at]; at = at + 1; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 20 -> wire[at] = modify_order_jp_equities_v1_record.cl_ord_id[modify_order_jp_equities_v1_at]; at = at + 1; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 4 -> wire[at] = modify_order_jp_equities_v1_record.order_qty[modify_order_jp_equities_v1_at]; at = at + 1; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 20 -> wire[at] = modify_order_jp_equities_v1_record.orig_cl_ord_id[modify_order_jp_equities_v1_at]; at = at + 1; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 8 -> wire[at] = modify_order_jp_equities_v1_record.price[modify_order_jp_equities_v1_at]; at = at + 1; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_jp_equities_v1_record.cancel_orig_on_reject; at = at + 1;
  skip
}

/* Modify Order Jp Equities V 1 off the wire, 57 bytes from where the cursor stands */
inline decode_modify_order_jp_equities_v1(modify_order_jp_equities_v1_record) {
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 4 -> modify_order_jp_equities_v1_record.trading_firm[modify_order_jp_equities_v1_at] = wire[at]; at = at + 1; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 20 -> modify_order_jp_equities_v1_record.cl_ord_id[modify_order_jp_equities_v1_at] = wire[at]; at = at + 1; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 4 -> modify_order_jp_equities_v1_record.order_qty[modify_order_jp_equities_v1_at] = wire[at]; at = at + 1; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 20 -> modify_order_jp_equities_v1_record.orig_cl_ord_id[modify_order_jp_equities_v1_at] = wire[at]; at = at + 1; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 8 -> modify_order_jp_equities_v1_record.price[modify_order_jp_equities_v1_at] = wire[at]; at = at + 1; modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_record.cancel_orig_on_reject = wire[at]; at = at + 1;
  skip
}

/* what was read of Modify Order Jp Equities V 1 is what was written, byte for byte */
inline equal_modify_order_jp_equities_v1(modify_order_jp_equities_v1_read, modify_order_jp_equities_v1_written) {
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 4 -> assert(modify_order_jp_equities_v1_read.trading_firm[modify_order_jp_equities_v1_at] == modify_order_jp_equities_v1_written.trading_firm[modify_order_jp_equities_v1_at]); modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 20 -> assert(modify_order_jp_equities_v1_read.cl_ord_id[modify_order_jp_equities_v1_at] == modify_order_jp_equities_v1_written.cl_ord_id[modify_order_jp_equities_v1_at]); modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 4 -> assert(modify_order_jp_equities_v1_read.order_qty[modify_order_jp_equities_v1_at] == modify_order_jp_equities_v1_written.order_qty[modify_order_jp_equities_v1_at]); modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 20 -> assert(modify_order_jp_equities_v1_read.orig_cl_ord_id[modify_order_jp_equities_v1_at] == modify_order_jp_equities_v1_written.orig_cl_ord_id[modify_order_jp_equities_v1_at]); modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  modify_order_jp_equities_v1_at = 0;
  do
  :: modify_order_jp_equities_v1_at < 8 -> assert(modify_order_jp_equities_v1_read.price[modify_order_jp_equities_v1_at] == modify_order_jp_equities_v1_written.price[modify_order_jp_equities_v1_at]); modify_order_jp_equities_v1_at = modify_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  assert(modify_order_jp_equities_v1_read.cancel_orig_on_reject == modify_order_jp_equities_v1_written.cancel_orig_on_reject);
  skip
}

/* ---- Cancel Order Jp Equities V 1: 24 bytes ---------------------------------- */

/* Request to cancel a single order */
typedef CancelOrderJpEquitiesV1 {
  byte trading_firm[4];
  byte orig_cl_ord_id[20]
};

int cancel_order_jp_equities_v1_at;

/* every byte of Cancel Order Jp Equities V 1 set to one value */
inline fill_cancel_order_jp_equities_v1(cancel_order_jp_equities_v1_record, cancel_order_jp_equities_v1_value) {
  cancel_order_jp_equities_v1_at = 0;
  do
  :: cancel_order_jp_equities_v1_at < 4 -> cancel_order_jp_equities_v1_record.trading_firm[cancel_order_jp_equities_v1_at] = cancel_order_jp_equities_v1_value; cancel_order_jp_equities_v1_at = cancel_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_jp_equities_v1_at = 0;
  do
  :: cancel_order_jp_equities_v1_at < 20 -> cancel_order_jp_equities_v1_record.orig_cl_ord_id[cancel_order_jp_equities_v1_at] = cancel_order_jp_equities_v1_value; cancel_order_jp_equities_v1_at = cancel_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Jp Equities V 1 set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_jp_equities_v1(cancel_order_jp_equities_v1_record, cancel_order_jp_equities_v1_base) {
  cancel_order_jp_equities_v1_at = 0;
  do
  :: cancel_order_jp_equities_v1_at < 4 -> cancel_order_jp_equities_v1_record.trading_firm[cancel_order_jp_equities_v1_at] = (cancel_order_jp_equities_v1_base + 0 + cancel_order_jp_equities_v1_at + 1) % 256; cancel_order_jp_equities_v1_at = cancel_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_jp_equities_v1_at = 0;
  do
  :: cancel_order_jp_equities_v1_at < 20 -> cancel_order_jp_equities_v1_record.orig_cl_ord_id[cancel_order_jp_equities_v1_at] = (cancel_order_jp_equities_v1_base + 4 + cancel_order_jp_equities_v1_at + 1) % 256; cancel_order_jp_equities_v1_at = cancel_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Jp Equities V 1 to the wire, 24 bytes from where the cursor stands */
inline encode_cancel_order_jp_equities_v1(cancel_order_jp_equities_v1_record) {
  cancel_order_jp_equities_v1_at = 0;
  do
  :: cancel_order_jp_equities_v1_at < 4 -> wire[at] = cancel_order_jp_equities_v1_record.trading_firm[cancel_order_jp_equities_v1_at]; at = at + 1; cancel_order_jp_equities_v1_at = cancel_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_jp_equities_v1_at = 0;
  do
  :: cancel_order_jp_equities_v1_at < 20 -> wire[at] = cancel_order_jp_equities_v1_record.orig_cl_ord_id[cancel_order_jp_equities_v1_at]; at = at + 1; cancel_order_jp_equities_v1_at = cancel_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Jp Equities V 1 off the wire, 24 bytes from where the cursor stands */
inline decode_cancel_order_jp_equities_v1(cancel_order_jp_equities_v1_record) {
  cancel_order_jp_equities_v1_at = 0;
  do
  :: cancel_order_jp_equities_v1_at < 4 -> cancel_order_jp_equities_v1_record.trading_firm[cancel_order_jp_equities_v1_at] = wire[at]; at = at + 1; cancel_order_jp_equities_v1_at = cancel_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_jp_equities_v1_at = 0;
  do
  :: cancel_order_jp_equities_v1_at < 20 -> cancel_order_jp_equities_v1_record.orig_cl_ord_id[cancel_order_jp_equities_v1_at] = wire[at]; at = at + 1; cancel_order_jp_equities_v1_at = cancel_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Jp Equities V 1 is what was written, byte for byte */
inline equal_cancel_order_jp_equities_v1(cancel_order_jp_equities_v1_read, cancel_order_jp_equities_v1_written) {
  cancel_order_jp_equities_v1_at = 0;
  do
  :: cancel_order_jp_equities_v1_at < 4 -> assert(cancel_order_jp_equities_v1_read.trading_firm[cancel_order_jp_equities_v1_at] == cancel_order_jp_equities_v1_written.trading_firm[cancel_order_jp_equities_v1_at]); cancel_order_jp_equities_v1_at = cancel_order_jp_equities_v1_at + 1
  :: else -> break
  od;
  cancel_order_jp_equities_v1_at = 0;
  do
  :: cancel_order_jp_equities_v1_at < 20 -> assert(cancel_order_jp_equities_v1_read.orig_cl_ord_id[cancel_order_jp_equities_v1_at] == cancel_order_jp_equities_v1_written.orig_cl_ord_id[cancel_order_jp_equities_v1_at]); cancel_order_jp_equities_v1_at = cancel_order_jp_equities_v1_at + 1
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

/* New Order Jp Equities V 1: encoded, read back, and compared */
proctype check_new_order_jp_equities_v1() {
  NewOrderJpEquitiesV1 new_order_jp_equities_v1_sent;
  NewOrderJpEquitiesV1 new_order_jp_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_jp_equities_v1(new_order_jp_equities_v1_sent, 0)
  :: pattern == 1 -> fill_new_order_jp_equities_v1(new_order_jp_equities_v1_sent, 32)
  :: pattern == 2 -> fill_new_order_jp_equities_v1(new_order_jp_equities_v1_sent, 255)
  :: else -> ramp_new_order_jp_equities_v1(new_order_jp_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_jp_equities_v1(new_order_jp_equities_v1_sent);
    assert(at == 87);
    at = 0;
    decode_new_order_jp_equities_v1(new_order_jp_equities_v1_got);
    assert(at == 87);
    equal_new_order_jp_equities_v1(new_order_jp_equities_v1_got, new_order_jp_equities_v1_sent)
  }
}

/* Modify Order Jp Equities V 1: encoded, read back, and compared */
proctype check_modify_order_jp_equities_v1() {
  ModifyOrderJpEquitiesV1 modify_order_jp_equities_v1_sent;
  ModifyOrderJpEquitiesV1 modify_order_jp_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_jp_equities_v1(modify_order_jp_equities_v1_sent, 0)
  :: pattern == 1 -> fill_modify_order_jp_equities_v1(modify_order_jp_equities_v1_sent, 32)
  :: pattern == 2 -> fill_modify_order_jp_equities_v1(modify_order_jp_equities_v1_sent, 255)
  :: else -> ramp_modify_order_jp_equities_v1(modify_order_jp_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_jp_equities_v1(modify_order_jp_equities_v1_sent);
    assert(at == 57);
    at = 0;
    decode_modify_order_jp_equities_v1(modify_order_jp_equities_v1_got);
    assert(at == 57);
    equal_modify_order_jp_equities_v1(modify_order_jp_equities_v1_got, modify_order_jp_equities_v1_sent)
  }
}

/* Cancel Order Jp Equities V 1: encoded, read back, and compared */
proctype check_cancel_order_jp_equities_v1() {
  CancelOrderJpEquitiesV1 cancel_order_jp_equities_v1_sent;
  CancelOrderJpEquitiesV1 cancel_order_jp_equities_v1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_jp_equities_v1(cancel_order_jp_equities_v1_sent, 0)
  :: pattern == 1 -> fill_cancel_order_jp_equities_v1(cancel_order_jp_equities_v1_sent, 32)
  :: pattern == 2 -> fill_cancel_order_jp_equities_v1(cancel_order_jp_equities_v1_sent, 255)
  :: else -> ramp_cancel_order_jp_equities_v1(cancel_order_jp_equities_v1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_jp_equities_v1(cancel_order_jp_equities_v1_sent);
    assert(at == 24);
    at = 0;
    decode_cancel_order_jp_equities_v1(cancel_order_jp_equities_v1_got);
    assert(at == 24);
    equal_cancel_order_jp_equities_v1(cancel_order_jp_equities_v1_got, cancel_order_jp_equities_v1_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_firm_message_header()
  :: run check_new_order_jp_equities_v1()
  :: run check_modify_order_jp_equities_v1()
  :: run check_cancel_order_jp_equities_v1()
  fi
}
