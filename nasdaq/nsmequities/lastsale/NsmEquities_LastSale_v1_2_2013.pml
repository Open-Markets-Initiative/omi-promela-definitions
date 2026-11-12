/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Last Sale
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 76

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

typedef PacketHeader {
  byte session[10];
  byte sequence_number[4];
  byte message_count[2]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = (packet_header_base + 10 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = (packet_header_base + 14 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> wire[at] = packet_header_record.session[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.message_count[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> assert(packet_header_read.session[packet_header_at] == packet_header_written.session[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence_number[packet_header_at] == packet_header_written.sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.message_count[packet_header_at] == packet_header_written.message_count[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 9 bytes ------------------------------------------------- */

typedef MessageHeader {
  byte timestamp[8];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 8 + 1) % 256;
  skip
}

/* Message Header to the wire, 9 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 9 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.timestamp[message_header_at] == message_header_written.timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- System Event Message: 1 bytes ------------------------------------------- */

/* System Event Messages is used to signal key market or data feed control events. */
typedef SystemEventMessage {
  byte event_code
};

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_record.event_code = (system_event_message_base + 0 + 1) % 256;
  skip
}

/* System Event Message to the wire, 1 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 1 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Sale Condition Modifier: 4 bytes ---------------------------------------- */

/* Sale Condition Modifier */
typedef SaleConditionModifier {
  byte settlement_type;
  byte trade_through_exemption;
  byte extended_hours_or_sold_code;
  byte special_sale_condition
};

/* every byte of Sale Condition Modifier set to one value */
inline fill_sale_condition_modifier(sale_condition_modifier_record, sale_condition_modifier_value) {
  sale_condition_modifier_record.settlement_type = sale_condition_modifier_value;
  sale_condition_modifier_record.trade_through_exemption = sale_condition_modifier_value;
  sale_condition_modifier_record.extended_hours_or_sold_code = sale_condition_modifier_value;
  sale_condition_modifier_record.special_sale_condition = sale_condition_modifier_value;
  skip
}

/* each byte of Sale Condition Modifier set to where it lies, so a field read out of place says so */
inline ramp_sale_condition_modifier(sale_condition_modifier_record, sale_condition_modifier_base) {
  sale_condition_modifier_record.settlement_type = (sale_condition_modifier_base + 0 + 1) % 256;
  sale_condition_modifier_record.trade_through_exemption = (sale_condition_modifier_base + 1 + 1) % 256;
  sale_condition_modifier_record.extended_hours_or_sold_code = (sale_condition_modifier_base + 2 + 1) % 256;
  sale_condition_modifier_record.special_sale_condition = (sale_condition_modifier_base + 3 + 1) % 256;
  skip
}

/* Sale Condition Modifier to the wire, 4 bytes from where the cursor stands */
inline encode_sale_condition_modifier(sale_condition_modifier_record) {
  wire[at] = sale_condition_modifier_record.settlement_type; at = at + 1;
  wire[at] = sale_condition_modifier_record.trade_through_exemption; at = at + 1;
  wire[at] = sale_condition_modifier_record.extended_hours_or_sold_code; at = at + 1;
  wire[at] = sale_condition_modifier_record.special_sale_condition; at = at + 1;
  skip
}

/* Sale Condition Modifier off the wire, 4 bytes from where the cursor stands */
inline decode_sale_condition_modifier(sale_condition_modifier_record) {
  sale_condition_modifier_record.settlement_type = wire[at]; at = at + 1;
  sale_condition_modifier_record.trade_through_exemption = wire[at]; at = at + 1;
  sale_condition_modifier_record.extended_hours_or_sold_code = wire[at]; at = at + 1;
  sale_condition_modifier_record.special_sale_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Sale Condition Modifier is what was written, byte for byte */
inline equal_sale_condition_modifier(sale_condition_modifier_read, sale_condition_modifier_written) {
  assert(sale_condition_modifier_read.settlement_type == sale_condition_modifier_written.settlement_type);
  assert(sale_condition_modifier_read.trade_through_exemption == sale_condition_modifier_written.trade_through_exemption);
  assert(sale_condition_modifier_read.extended_hours_or_sold_code == sale_condition_modifier_written.extended_hours_or_sold_code);
  assert(sale_condition_modifier_read.special_sale_condition == sale_condition_modifier_written.special_sale_condition);
  skip
}

/* ---- Trade Report Message: 43 bytes ------------------------------------------ */

/* The following message is used to relay NASDAQ execution system and TRF trade transactions that are reported for the current business day. Please note that NASDAQ only reports one-side of a trade execution on the NASDAQ Last Sale (NLS) feed and other data feed products. */
typedef TradeReportMessage {
  byte market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte trade_control_number[10];
  byte trade_price[10];
  byte trade_size[9];
  SaleConditionModifier sale_condition_modifier
};

int trade_report_message_at;

/* every byte of Trade Report Message set to one value */
inline fill_trade_report_message(trade_report_message_record, trade_report_message_value) {
  trade_report_message_record.market_center_identifier = trade_report_message_value;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.issue_symbol[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.security_class = trade_report_message_value;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.trade_control_number[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.trade_price[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 9 -> trade_report_message_record.trade_size[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  fill_sale_condition_modifier(trade_report_message_record.sale_condition_modifier, trade_report_message_value);
  skip
}

/* each byte of Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_message(trade_report_message_record, trade_report_message_base) {
  trade_report_message_record.market_center_identifier = (trade_report_message_base + 0 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.issue_symbol[trade_report_message_at] = (trade_report_message_base + 1 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.security_class = (trade_report_message_base + 9 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.trade_control_number[trade_report_message_at] = (trade_report_message_base + 10 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.trade_price[trade_report_message_at] = (trade_report_message_base + 20 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 9 -> trade_report_message_record.trade_size[trade_report_message_at] = (trade_report_message_base + 30 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  ramp_sale_condition_modifier(trade_report_message_record.sale_condition_modifier, trade_report_message_base + 39);
  skip
}

/* Trade Report Message to the wire, 43 bytes from where the cursor stands */
inline encode_trade_report_message(trade_report_message_record) {
  wire[at] = trade_report_message_record.market_center_identifier; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.issue_symbol[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_record.security_class; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> wire[at] = trade_report_message_record.trade_control_number[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> wire[at] = trade_report_message_record.trade_price[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 9 -> wire[at] = trade_report_message_record.trade_size[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  encode_sale_condition_modifier(trade_report_message_record.sale_condition_modifier);
  skip
}

/* Trade Report Message off the wire, 43 bytes from where the cursor stands */
inline decode_trade_report_message(trade_report_message_record) {
  trade_report_message_record.market_center_identifier = wire[at]; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.issue_symbol[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.security_class = wire[at]; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.trade_control_number[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.trade_price[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 9 -> trade_report_message_record.trade_size[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  decode_sale_condition_modifier(trade_report_message_record.sale_condition_modifier);
  skip
}

/* what was read of Trade Report Message is what was written, byte for byte */
inline equal_trade_report_message(trade_report_message_read, trade_report_message_written) {
  assert(trade_report_message_read.market_center_identifier == trade_report_message_written.market_center_identifier);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.issue_symbol[trade_report_message_at] == trade_report_message_written.issue_symbol[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_read.security_class == trade_report_message_written.security_class);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> assert(trade_report_message_read.trade_control_number[trade_report_message_at] == trade_report_message_written.trade_control_number[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> assert(trade_report_message_read.trade_price[trade_report_message_at] == trade_report_message_written.trade_price[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 9 -> assert(trade_report_message_read.trade_size[trade_report_message_at] == trade_report_message_written.trade_size[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  equal_sale_condition_modifier(trade_report_message_read.sale_condition_modifier, trade_report_message_written.sale_condition_modifier);
  skip
}

/* ---- Original Sale Condition Modifier: 4 bytes ------------------------------- */

/* Original Sale Condition Modifier */
typedef OriginalSaleConditionModifier {
  byte original_settlement_type;
  byte original_trade_through_exemption;
  byte original_extended_hours_or_sold_code;
  byte original_special_sale_condition
};

/* every byte of Original Sale Condition Modifier set to one value */
inline fill_original_sale_condition_modifier(original_sale_condition_modifier_record, original_sale_condition_modifier_value) {
  original_sale_condition_modifier_record.original_settlement_type = original_sale_condition_modifier_value;
  original_sale_condition_modifier_record.original_trade_through_exemption = original_sale_condition_modifier_value;
  original_sale_condition_modifier_record.original_extended_hours_or_sold_code = original_sale_condition_modifier_value;
  original_sale_condition_modifier_record.original_special_sale_condition = original_sale_condition_modifier_value;
  skip
}

/* each byte of Original Sale Condition Modifier set to where it lies, so a field read out of place says so */
inline ramp_original_sale_condition_modifier(original_sale_condition_modifier_record, original_sale_condition_modifier_base) {
  original_sale_condition_modifier_record.original_settlement_type = (original_sale_condition_modifier_base + 0 + 1) % 256;
  original_sale_condition_modifier_record.original_trade_through_exemption = (original_sale_condition_modifier_base + 1 + 1) % 256;
  original_sale_condition_modifier_record.original_extended_hours_or_sold_code = (original_sale_condition_modifier_base + 2 + 1) % 256;
  original_sale_condition_modifier_record.original_special_sale_condition = (original_sale_condition_modifier_base + 3 + 1) % 256;
  skip
}

/* Original Sale Condition Modifier to the wire, 4 bytes from where the cursor stands */
inline encode_original_sale_condition_modifier(original_sale_condition_modifier_record) {
  wire[at] = original_sale_condition_modifier_record.original_settlement_type; at = at + 1;
  wire[at] = original_sale_condition_modifier_record.original_trade_through_exemption; at = at + 1;
  wire[at] = original_sale_condition_modifier_record.original_extended_hours_or_sold_code; at = at + 1;
  wire[at] = original_sale_condition_modifier_record.original_special_sale_condition; at = at + 1;
  skip
}

/* Original Sale Condition Modifier off the wire, 4 bytes from where the cursor stands */
inline decode_original_sale_condition_modifier(original_sale_condition_modifier_record) {
  original_sale_condition_modifier_record.original_settlement_type = wire[at]; at = at + 1;
  original_sale_condition_modifier_record.original_trade_through_exemption = wire[at]; at = at + 1;
  original_sale_condition_modifier_record.original_extended_hours_or_sold_code = wire[at]; at = at + 1;
  original_sale_condition_modifier_record.original_special_sale_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Original Sale Condition Modifier is what was written, byte for byte */
inline equal_original_sale_condition_modifier(original_sale_condition_modifier_read, original_sale_condition_modifier_written) {
  assert(original_sale_condition_modifier_read.original_settlement_type == original_sale_condition_modifier_written.original_settlement_type);
  assert(original_sale_condition_modifier_read.original_trade_through_exemption == original_sale_condition_modifier_written.original_trade_through_exemption);
  assert(original_sale_condition_modifier_read.original_extended_hours_or_sold_code == original_sale_condition_modifier_written.original_extended_hours_or_sold_code);
  assert(original_sale_condition_modifier_read.original_special_sale_condition == original_sale_condition_modifier_written.original_special_sale_condition);
  skip
}

/* ---- Trade Cancel Error Message: 43 bytes ------------------------------------ */

/* The following message is used in the event that a NASDAQ or TRF trade transaction is cancelled on the same business day that it is reported. */
typedef TradeCancelErrorMessage {
  byte market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price[10];
  byte original_trade_size[9];
  OriginalSaleConditionModifier original_sale_con_5dv852
};

int trade_cancel_error_message_at;

/* every byte of Trade Cancel Error Message set to one value */
inline fill_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_value) {
  trade_cancel_error_message_record.market_center_identifier = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.issue_symbol[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.security_class = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> trade_cancel_error_message_record.original_trade_control_number[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 9 -> trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fill_original_sale_condition_modifier(trade_cancel_error_message_record.original_sale_con_5dv852, trade_cancel_error_message_value);
  skip
}

/* each byte of Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_base) {
  trade_cancel_error_message_record.market_center_identifier = (trade_cancel_error_message_base + 0 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.issue_symbol[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 1 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.security_class = (trade_cancel_error_message_base + 9 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> trade_cancel_error_message_record.original_trade_control_number[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 10 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 20 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 9 -> trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 30 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  ramp_original_sale_condition_modifier(trade_cancel_error_message_record.original_sale_con_5dv852, trade_cancel_error_message_base + 39);
  skip
}

/* Trade Cancel Error Message to the wire, 43 bytes from where the cursor stands */
inline encode_trade_cancel_error_message(trade_cancel_error_message_record) {
  wire[at] = trade_cancel_error_message_record.market_center_identifier; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.issue_symbol[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_error_message_record.security_class; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> wire[at] = trade_cancel_error_message_record.original_trade_control_number[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> wire[at] = trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 9 -> wire[at] = trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  encode_original_sale_condition_modifier(trade_cancel_error_message_record.original_sale_con_5dv852);
  skip
}

/* Trade Cancel Error Message off the wire, 43 bytes from where the cursor stands */
inline decode_trade_cancel_error_message(trade_cancel_error_message_record) {
  trade_cancel_error_message_record.market_center_identifier = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.issue_symbol[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.security_class = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> trade_cancel_error_message_record.original_trade_control_number[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 9 -> trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  decode_original_sale_condition_modifier(trade_cancel_error_message_record.original_sale_con_5dv852);
  skip
}

/* what was read of Trade Cancel Error Message is what was written, byte for byte */
inline equal_trade_cancel_error_message(trade_cancel_error_message_read, trade_cancel_error_message_written) {
  assert(trade_cancel_error_message_read.market_center_identifier == trade_cancel_error_message_written.market_center_identifier);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.issue_symbol[trade_cancel_error_message_at] == trade_cancel_error_message_written.issue_symbol[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_error_message_read.security_class == trade_cancel_error_message_written.security_class);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> assert(trade_cancel_error_message_read.original_trade_control_number[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_trade_control_number[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> assert(trade_cancel_error_message_read.original_trade_price[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_trade_price[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 9 -> assert(trade_cancel_error_message_read.original_trade_size[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_trade_size[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  equal_original_sale_condition_modifier(trade_cancel_error_message_read.original_sale_con_5dv852, trade_cancel_error_message_written.original_sale_con_5dv852);
  skip
}

/* ---- Corrected Sale Condition Modifier: 4 bytes ------------------------------ */

/* Corrected Sale Condition Modifier */
typedef CorrectedSaleConditionModifier {
  byte corrected_settlement_type;
  byte corrected_trade_through_exemption;
  byte corrected_extended_hours_or_sold_code;
  byte corrected_special_sale_condition
};

/* every byte of Corrected Sale Condition Modifier set to one value */
inline fill_corrected_sale_condition_modifier(corrected_sale_condition_modifier_record, corrected_sale_condition_modifier_value) {
  corrected_sale_condition_modifier_record.corrected_settlement_type = corrected_sale_condition_modifier_value;
  corrected_sale_condition_modifier_record.corrected_trade_through_exemption = corrected_sale_condition_modifier_value;
  corrected_sale_condition_modifier_record.corrected_extended_hours_or_sold_code = corrected_sale_condition_modifier_value;
  corrected_sale_condition_modifier_record.corrected_special_sale_condition = corrected_sale_condition_modifier_value;
  skip
}

/* each byte of Corrected Sale Condition Modifier set to where it lies, so a field read out of place says so */
inline ramp_corrected_sale_condition_modifier(corrected_sale_condition_modifier_record, corrected_sale_condition_modifier_base) {
  corrected_sale_condition_modifier_record.corrected_settlement_type = (corrected_sale_condition_modifier_base + 0 + 1) % 256;
  corrected_sale_condition_modifier_record.corrected_trade_through_exemption = (corrected_sale_condition_modifier_base + 1 + 1) % 256;
  corrected_sale_condition_modifier_record.corrected_extended_hours_or_sold_code = (corrected_sale_condition_modifier_base + 2 + 1) % 256;
  corrected_sale_condition_modifier_record.corrected_special_sale_condition = (corrected_sale_condition_modifier_base + 3 + 1) % 256;
  skip
}

/* Corrected Sale Condition Modifier to the wire, 4 bytes from where the cursor stands */
inline encode_corrected_sale_condition_modifier(corrected_sale_condition_modifier_record) {
  wire[at] = corrected_sale_condition_modifier_record.corrected_settlement_type; at = at + 1;
  wire[at] = corrected_sale_condition_modifier_record.corrected_trade_through_exemption; at = at + 1;
  wire[at] = corrected_sale_condition_modifier_record.corrected_extended_hours_or_sold_code; at = at + 1;
  wire[at] = corrected_sale_condition_modifier_record.corrected_special_sale_condition; at = at + 1;
  skip
}

/* Corrected Sale Condition Modifier off the wire, 4 bytes from where the cursor stands */
inline decode_corrected_sale_condition_modifier(corrected_sale_condition_modifier_record) {
  corrected_sale_condition_modifier_record.corrected_settlement_type = wire[at]; at = at + 1;
  corrected_sale_condition_modifier_record.corrected_trade_through_exemption = wire[at]; at = at + 1;
  corrected_sale_condition_modifier_record.corrected_extended_hours_or_sold_code = wire[at]; at = at + 1;
  corrected_sale_condition_modifier_record.corrected_special_sale_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Corrected Sale Condition Modifier is what was written, byte for byte */
inline equal_corrected_sale_condition_modifier(corrected_sale_condition_modifier_read, corrected_sale_condition_modifier_written) {
  assert(corrected_sale_condition_modifier_read.corrected_settlement_type == corrected_sale_condition_modifier_written.corrected_settlement_type);
  assert(corrected_sale_condition_modifier_read.corrected_trade_through_exemption == corrected_sale_condition_modifier_written.corrected_trade_through_exemption);
  assert(corrected_sale_condition_modifier_read.corrected_extended_hours_or_sold_code == corrected_sale_condition_modifier_written.corrected_extended_hours_or_sold_code);
  assert(corrected_sale_condition_modifier_read.corrected_special_sale_condition == corrected_sale_condition_modifier_written.corrected_special_sale_condition);
  skip
}

/* ---- Trade Correction Message: 76 bytes -------------------------------------- */

/* The following message is used in the event that a TRF trade transaction is corrected on the same business day that it is reported. */
typedef TradeCorrectionMessage {
  byte market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price[10];
  byte original_trade_size[9];
  OriginalSaleConditionModifier original_sale_con_5dv852;
  byte corrected_trade_control_number[10];
  byte corrected_trade_price[10];
  byte corrected_trade_size[9];
  CorrectedSaleConditionModifier corrected_sale_co_w2lix0
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_record.market_center_identifier = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.issue_symbol[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.security_class = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.original_trade_control_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  fill_original_sale_condition_modifier(trade_correction_message_record.original_sale_con_5dv852, trade_correction_message_value);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.corrected_trade_control_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  fill_corrected_sale_condition_modifier(trade_correction_message_record.corrected_sale_co_w2lix0, trade_correction_message_value);
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  trade_correction_message_record.market_center_identifier = (trade_correction_message_base + 0 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.issue_symbol[trade_correction_message_at] = (trade_correction_message_base + 1 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.security_class = (trade_correction_message_base + 9 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.original_trade_control_number[trade_correction_message_at] = (trade_correction_message_base + 10 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = (trade_correction_message_base + 20 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = (trade_correction_message_base + 30 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  ramp_original_sale_condition_modifier(trade_correction_message_record.original_sale_con_5dv852, trade_correction_message_base + 39);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.corrected_trade_control_number[trade_correction_message_at] = (trade_correction_message_base + 43 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = (trade_correction_message_base + 53 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = (trade_correction_message_base + 63 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  ramp_corrected_sale_condition_modifier(trade_correction_message_record.corrected_sale_co_w2lix0, trade_correction_message_base + 72);
  skip
}

/* Trade Correction Message to the wire, 76 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  wire[at] = trade_correction_message_record.market_center_identifier; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.issue_symbol[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.security_class; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> wire[at] = trade_correction_message_record.original_trade_control_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> wire[at] = trade_correction_message_record.original_trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> wire[at] = trade_correction_message_record.original_trade_size[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  encode_original_sale_condition_modifier(trade_correction_message_record.original_sale_con_5dv852);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> wire[at] = trade_correction_message_record.corrected_trade_control_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> wire[at] = trade_correction_message_record.corrected_trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> wire[at] = trade_correction_message_record.corrected_trade_size[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  encode_corrected_sale_condition_modifier(trade_correction_message_record.corrected_sale_co_w2lix0);
  skip
}

/* Trade Correction Message off the wire, 76 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_record.market_center_identifier = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.issue_symbol[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.security_class = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.original_trade_control_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  decode_original_sale_condition_modifier(trade_correction_message_record.original_sale_con_5dv852);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.corrected_trade_control_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  decode_corrected_sale_condition_modifier(trade_correction_message_record.corrected_sale_co_w2lix0);
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  assert(trade_correction_message_read.market_center_identifier == trade_correction_message_written.market_center_identifier);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.issue_symbol[trade_correction_message_at] == trade_correction_message_written.issue_symbol[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.security_class == trade_correction_message_written.security_class);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> assert(trade_correction_message_read.original_trade_control_number[trade_correction_message_at] == trade_correction_message_written.original_trade_control_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> assert(trade_correction_message_read.original_trade_price[trade_correction_message_at] == trade_correction_message_written.original_trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> assert(trade_correction_message_read.original_trade_size[trade_correction_message_at] == trade_correction_message_written.original_trade_size[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  equal_original_sale_condition_modifier(trade_correction_message_read.original_sale_con_5dv852, trade_correction_message_written.original_sale_con_5dv852);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> assert(trade_correction_message_read.corrected_trade_control_number[trade_correction_message_at] == trade_correction_message_written.corrected_trade_control_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> assert(trade_correction_message_read.corrected_trade_price[trade_correction_message_at] == trade_correction_message_written.corrected_trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 9 -> assert(trade_correction_message_read.corrected_trade_size[trade_correction_message_at] == trade_correction_message_written.corrected_trade_size[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  equal_corrected_sale_condition_modifier(trade_correction_message_read.corrected_sale_co_w2lix0, trade_correction_message_written.corrected_sale_co_w2lix0);
  skip
}

/* ---- Stock Trading Action Message: 14 bytes ---------------------------------- */

/* NASDAQ uses this administrative message to indicate the current trading status of a security to the trading community. */
typedef StockTradingActionMessage {
  byte issue_symbol[8];
  byte security_class;
  byte current_trading_state;
  byte reason[4]
};

int stock_trading_action_message_at;

/* every byte of Stock Trading Action Message set to one value */
inline fill_stock_trading_action_message(stock_trading_action_message_record, stock_trading_action_message_value) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.issue_symbol[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.security_class = stock_trading_action_message_value;
  stock_trading_action_message_record.current_trading_state = stock_trading_action_message_value;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_stock_trading_action_message(stock_trading_action_message_record, stock_trading_action_message_base) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.issue_symbol[stock_trading_action_message_at] = (stock_trading_action_message_base + 0 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.security_class = (stock_trading_action_message_base + 8 + 1) % 256;
  stock_trading_action_message_record.current_trading_state = (stock_trading_action_message_base + 9 + 1) % 256;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = (stock_trading_action_message_base + 10 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message to the wire, 14 bytes from where the cursor stands */
inline encode_stock_trading_action_message(stock_trading_action_message_record) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> wire[at] = stock_trading_action_message_record.issue_symbol[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_trading_action_message_record.security_class; at = at + 1;
  wire[at] = stock_trading_action_message_record.current_trading_state; at = at + 1;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> wire[at] = stock_trading_action_message_record.reason[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message off the wire, 14 bytes from where the cursor stands */
inline decode_stock_trading_action_message(stock_trading_action_message_record) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.issue_symbol[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.security_class = wire[at]; at = at + 1;
  stock_trading_action_message_record.current_trading_state = wire[at]; at = at + 1;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Trading Action Message is what was written, byte for byte */
inline equal_stock_trading_action_message(stock_trading_action_message_read, stock_trading_action_message_written) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> assert(stock_trading_action_message_read.issue_symbol[stock_trading_action_message_at] == stock_trading_action_message_written.issue_symbol[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  assert(stock_trading_action_message_read.security_class == stock_trading_action_message_written.security_class);
  assert(stock_trading_action_message_read.current_trading_state == stock_trading_action_message_written.current_trading_state);
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> assert(stock_trading_action_message_read.reason[stock_trading_action_message_at] == stock_trading_action_message_written.reason[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reg Sho Short Sale Price Test Restricted Indicator Message: 9 bytes ----- */

/* Denotes the Reg SHO Short Sale Price Test Restriction (Rule 201) status for an issue: a full pre-opening spin for NASDAQ-listed issues and intraday status changes. */
typedef RegShoShortSalePriceTestRestrictedIndicatorMessage {
  byte stock[8];
  byte reg_sho_action
};

int reg_sho_short_sale_price_test_restricted_indicator_message_at;

/* every byte of Reg Sho Short Sale Price Test Restricted Indicator Message set to one value */
inline fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record, reg_sho_short_sale_price_test_restricted_indicator_message_value) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = reg_sho_short_sale_price_test_restricted_indicator_message_value;
  skip
}

/* each byte of Reg Sho Short Sale Price Test Restricted Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record, reg_sho_short_sale_price_test_restricted_indicator_message_base) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 0 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 8 + 1) % 256;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message to the wire, 9 bytes from where the cursor stands */
inline encode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action; at = at + 1;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message off the wire, 9 bytes from where the cursor stands */
inline decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Reg Sho Short Sale Price Test Restricted Indicator Message is what was written, byte for byte */
inline equal_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_read, reg_sho_short_sale_price_test_restricted_indicator_message_written) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.reg_sho_action == reg_sho_short_sale_price_test_restricted_indicator_message_written.reg_sho_action);
  skip
}

/* ---- Stock Directory Message: 10 bytes --------------------------------------- */

/* At the start of each trading day, NASDAQ disseminates stock directory messages for all active symbols in the NASDAQ system. */
typedef StockDirectoryMessage {
  byte issue_symbol[8];
  byte market_category;
  byte financial_status_indicator
};

int stock_directory_message_at;

/* every byte of Stock Directory Message set to one value */
inline fill_stock_directory_message(stock_directory_message_record, stock_directory_message_value) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.issue_symbol[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = stock_directory_message_value;
  stock_directory_message_record.financial_status_indicator = stock_directory_message_value;
  skip
}

/* each byte of Stock Directory Message set to where it lies, so a field read out of place says so */
inline ramp_stock_directory_message(stock_directory_message_record, stock_directory_message_base) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.issue_symbol[stock_directory_message_at] = (stock_directory_message_base + 0 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = (stock_directory_message_base + 8 + 1) % 256;
  stock_directory_message_record.financial_status_indicator = (stock_directory_message_base + 9 + 1) % 256;
  skip
}

/* Stock Directory Message to the wire, 10 bytes from where the cursor stands */
inline encode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> wire[at] = stock_directory_message_record.issue_symbol[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.market_category; at = at + 1;
  wire[at] = stock_directory_message_record.financial_status_indicator; at = at + 1;
  skip
}

/* Stock Directory Message off the wire, 10 bytes from where the cursor stands */
inline decode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.issue_symbol[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = wire[at]; at = at + 1;
  stock_directory_message_record.financial_status_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock Directory Message is what was written, byte for byte */
inline equal_stock_directory_message(stock_directory_message_read, stock_directory_message_written) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> assert(stock_directory_message_read.issue_symbol[stock_directory_message_at] == stock_directory_message_written.issue_symbol[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.market_category == stock_directory_message_written.market_category);
  assert(stock_directory_message_read.financial_status_indicator == stock_directory_message_written.financial_status_indicator);
  skip
}

/* ---- Adjusted Closing Price Message: 19 bytes -------------------------------- */

/* At the start of each trading day, NASDAQ disseminates the adjusted closing price for all active symbols in the NASDAQ system. */
typedef AdjustedClosingPriceMessage {
  byte stock[8];
  byte security_class;
  byte adjusted_closing_price[10]
};

int adjusted_closing_price_message_at;

/* every byte of Adjusted Closing Price Message set to one value */
inline fill_adjusted_closing_price_message(adjusted_closing_price_message_record, adjusted_closing_price_message_value) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.stock[adjusted_closing_price_message_at] = adjusted_closing_price_message_value; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_record.security_class = adjusted_closing_price_message_value;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 10 -> adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at] = adjusted_closing_price_message_value; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Adjusted Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_adjusted_closing_price_message(adjusted_closing_price_message_record, adjusted_closing_price_message_base) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.stock[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 0 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_record.security_class = (adjusted_closing_price_message_base + 8 + 1) % 256;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 10 -> adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 9 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Adjusted Closing Price Message to the wire, 19 bytes from where the cursor stands */
inline encode_adjusted_closing_price_message(adjusted_closing_price_message_record) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> wire[at] = adjusted_closing_price_message_record.stock[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  wire[at] = adjusted_closing_price_message_record.security_class; at = at + 1;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 10 -> wire[at] = adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Adjusted Closing Price Message off the wire, 19 bytes from where the cursor stands */
inline decode_adjusted_closing_price_message(adjusted_closing_price_message_record) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.stock[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_record.security_class = wire[at]; at = at + 1;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 10 -> adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Adjusted Closing Price Message is what was written, byte for byte */
inline equal_adjusted_closing_price_message(adjusted_closing_price_message_read, adjusted_closing_price_message_written) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> assert(adjusted_closing_price_message_read.stock[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.stock[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  assert(adjusted_closing_price_message_read.security_class == adjusted_closing_price_message_written.security_class);
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 10 -> assert(adjusted_closing_price_message_read.adjusted_closing_price[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.adjusted_closing_price[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
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
    assert(at == 16);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 16);
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
    assert(at == 9);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 9);
    equal_message_header(message_header_got, message_header_sent)
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
    assert(at == 1);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 1);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Sale Condition Modifier: encoded, read back, and compared */
proctype check_sale_condition_modifier() {
  SaleConditionModifier sale_condition_modifier_sent;
  SaleConditionModifier sale_condition_modifier_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sale_condition_modifier(sale_condition_modifier_sent, 0)
  :: pattern == 1 -> fill_sale_condition_modifier(sale_condition_modifier_sent, 32)
  :: pattern == 2 -> fill_sale_condition_modifier(sale_condition_modifier_sent, 255)
  :: else -> ramp_sale_condition_modifier(sale_condition_modifier_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sale_condition_modifier(sale_condition_modifier_sent);
    assert(at == 4);
    at = 0;
    decode_sale_condition_modifier(sale_condition_modifier_got);
    assert(at == 4);
    equal_sale_condition_modifier(sale_condition_modifier_got, sale_condition_modifier_sent)
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
    assert(at == 43);
    at = 0;
    decode_trade_report_message(trade_report_message_got);
    assert(at == 43);
    equal_trade_report_message(trade_report_message_got, trade_report_message_sent)
  }
}

/* Original Sale Condition Modifier: encoded, read back, and compared */
proctype check_original_sale_condition_modifier() {
  OriginalSaleConditionModifier original_sale_condition_modifier_sent;
  OriginalSaleConditionModifier original_sale_condition_modifier_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_original_sale_condition_modifier(original_sale_condition_modifier_sent, 0)
  :: pattern == 1 -> fill_original_sale_condition_modifier(original_sale_condition_modifier_sent, 32)
  :: pattern == 2 -> fill_original_sale_condition_modifier(original_sale_condition_modifier_sent, 255)
  :: else -> ramp_original_sale_condition_modifier(original_sale_condition_modifier_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_original_sale_condition_modifier(original_sale_condition_modifier_sent);
    assert(at == 4);
    at = 0;
    decode_original_sale_condition_modifier(original_sale_condition_modifier_got);
    assert(at == 4);
    equal_original_sale_condition_modifier(original_sale_condition_modifier_got, original_sale_condition_modifier_sent)
  }
}

/* Trade Cancel Error Message: encoded, read back, and compared */
proctype check_trade_cancel_error_message() {
  TradeCancelErrorMessage trade_cancel_error_message_sent;
  TradeCancelErrorMessage trade_cancel_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 255)
  :: else -> ramp_trade_cancel_error_message(trade_cancel_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_error_message(trade_cancel_error_message_sent);
    assert(at == 43);
    at = 0;
    decode_trade_cancel_error_message(trade_cancel_error_message_got);
    assert(at == 43);
    equal_trade_cancel_error_message(trade_cancel_error_message_got, trade_cancel_error_message_sent)
  }
}

/* Corrected Sale Condition Modifier: encoded, read back, and compared */
proctype check_corrected_sale_condition_modifier() {
  CorrectedSaleConditionModifier corrected_sale_condition_modifier_sent;
  CorrectedSaleConditionModifier corrected_sale_condition_modifier_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_corrected_sale_condition_modifier(corrected_sale_condition_modifier_sent, 0)
  :: pattern == 1 -> fill_corrected_sale_condition_modifier(corrected_sale_condition_modifier_sent, 32)
  :: pattern == 2 -> fill_corrected_sale_condition_modifier(corrected_sale_condition_modifier_sent, 255)
  :: else -> ramp_corrected_sale_condition_modifier(corrected_sale_condition_modifier_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_corrected_sale_condition_modifier(corrected_sale_condition_modifier_sent);
    assert(at == 4);
    at = 0;
    decode_corrected_sale_condition_modifier(corrected_sale_condition_modifier_got);
    assert(at == 4);
    equal_corrected_sale_condition_modifier(corrected_sale_condition_modifier_got, corrected_sale_condition_modifier_sent)
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
    assert(at == 76);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 76);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* Stock Trading Action Message: encoded, read back, and compared */
proctype check_stock_trading_action_message() {
  StockTradingActionMessage stock_trading_action_message_sent;
  StockTradingActionMessage stock_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_trading_action_message(stock_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_stock_trading_action_message(stock_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_stock_trading_action_message(stock_trading_action_message_sent, 255)
  :: else -> ramp_stock_trading_action_message(stock_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_trading_action_message(stock_trading_action_message_sent);
    assert(at == 14);
    at = 0;
    decode_stock_trading_action_message(stock_trading_action_message_got);
    assert(at == 14);
    equal_stock_trading_action_message(stock_trading_action_message_got, stock_trading_action_message_sent)
  }
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message: encoded, read back, and compared */
proctype check_reg_sho_short_sale_price_test_restricted_indicator_message() {
  RegShoShortSalePriceTestRestrictedIndicatorMessage reg_sho_short_sale_price_test_restricted_indicator_message_sent;
  RegShoShortSalePriceTestRestrictedIndicatorMessage reg_sho_short_sale_price_test_restricted_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 0)
  :: pattern == 1 -> fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 32)
  :: pattern == 2 -> fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 255)
  :: else -> ramp_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent);
    assert(at == 9);
    at = 0;
    decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_got);
    assert(at == 9);
    equal_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_got, reg_sho_short_sale_price_test_restricted_indicator_message_sent)
  }
}

/* Stock Directory Message: encoded, read back, and compared */
proctype check_stock_directory_message() {
  StockDirectoryMessage stock_directory_message_sent;
  StockDirectoryMessage stock_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_directory_message(stock_directory_message_sent, 0)
  :: pattern == 1 -> fill_stock_directory_message(stock_directory_message_sent, 32)
  :: pattern == 2 -> fill_stock_directory_message(stock_directory_message_sent, 255)
  :: else -> ramp_stock_directory_message(stock_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_directory_message(stock_directory_message_sent);
    assert(at == 10);
    at = 0;
    decode_stock_directory_message(stock_directory_message_got);
    assert(at == 10);
    equal_stock_directory_message(stock_directory_message_got, stock_directory_message_sent)
  }
}

/* Adjusted Closing Price Message: encoded, read back, and compared */
proctype check_adjusted_closing_price_message() {
  AdjustedClosingPriceMessage adjusted_closing_price_message_sent;
  AdjustedClosingPriceMessage adjusted_closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_adjusted_closing_price_message(adjusted_closing_price_message_sent, 0)
  :: pattern == 1 -> fill_adjusted_closing_price_message(adjusted_closing_price_message_sent, 32)
  :: pattern == 2 -> fill_adjusted_closing_price_message(adjusted_closing_price_message_sent, 255)
  :: else -> ramp_adjusted_closing_price_message(adjusted_closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_adjusted_closing_price_message(adjusted_closing_price_message_sent);
    assert(at == 19);
    at = 0;
    decode_adjusted_closing_price_message(adjusted_closing_price_message_got);
    assert(at == 19);
    equal_adjusted_closing_price_message(adjusted_closing_price_message_got, adjusted_closing_price_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_sale_condition_modifier()
  :: run check_trade_report_message()
  :: run check_original_sale_condition_modifier()
  :: run check_trade_cancel_error_message()
  :: run check_corrected_sale_condition_modifier()
  :: run check_trade_correction_message()
  :: run check_stock_trading_action_message()
  :: run check_reg_sho_short_sale_price_test_restricted_indicator_message()
  :: run check_stock_directory_message()
  :: run check_adjusted_closing_price_message()
  fi
}
