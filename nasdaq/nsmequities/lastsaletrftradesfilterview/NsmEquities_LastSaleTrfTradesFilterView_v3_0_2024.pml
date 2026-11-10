/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Last Sale Trf Trades FilterView
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
#define WIRE 62

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 20 bytes ------------------------------------------------- */

/* Itch Mold Udp 64 Packet Header */
typedef PacketHeader {
  byte session[10];
  byte sequence_number[8];
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
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
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
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = (packet_header_base + 10 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = (packet_header_base + 18 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 20 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> wire[at] = packet_header_record.session[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.message_count[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 20 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
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
  :: packet_header_at < 8 -> assert(packet_header_read.sequence_number[packet_header_at] == packet_header_written.sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.message_count[packet_header_at] == packet_header_written.message_count[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 11 bytes ------------------------------------------------ */

typedef MessageHeader {
  byte message_length[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.tracking_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 6 -> message_header_record.timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.tracking_number[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 6 -> message_header_record.timestamp[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 10 + 1) % 256;
  skip
}

/* Message Header to the wire, 11 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.tracking_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 6 -> wire[at] = message_header_record.timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 11 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.tracking_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 6 -> message_header_record.timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.tracking_number[message_header_at] == message_header_written.tracking_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 6 -> assert(message_header_read.timestamp[message_header_at] == message_header_written.timestamp[message_header_at]); message_header_at = message_header_at + 1
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

/* Sale condition modifier consists of four levels */
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

/* ---- Trade Report Message: 32 bytes ------------------------------------------ */

/* The following message is used to relay Nasdaq execution system and TRF trade transactions that are reported for the current business day. Please note that Nasdaq only reports one-side of a trade execution on the Nasdaq Last Sale (NLS) feed and other data feed products. */
typedef TradeReportMessage {
  byte market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte trade_control_number[10];
  byte trade_price[4];
  byte trade_size[4];
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
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_price[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_size[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
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
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_price[trade_report_message_at] = (trade_report_message_base + 20 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_size[trade_report_message_at] = (trade_report_message_base + 24 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  ramp_sale_condition_modifier(trade_report_message_record.sale_condition_modifier, trade_report_message_base + 28);
  skip
}

/* Trade Report Message to the wire, 32 bytes from where the cursor stands */
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
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.trade_price[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.trade_size[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  encode_sale_condition_modifier(trade_report_message_record.sale_condition_modifier);
  skip
}

/* Trade Report Message off the wire, 32 bytes from where the cursor stands */
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
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_price[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_size[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
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
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.trade_price[trade_report_message_at] == trade_report_message_written.trade_price[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.trade_size[trade_report_message_at] == trade_report_message_written.trade_size[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  equal_sale_condition_modifier(trade_report_message_read.sale_condition_modifier, trade_report_message_written.sale_condition_modifier);
  skip
}

/* ---- Long Form Trade Report Message: 36 bytes -------------------------------- */

/* The following message is used to relay Nasdaq execution system and TRF trade transactions that are reported for the current business day, for long form trades exceeding the upper limit of a 4-byte price. */
typedef LongFormTradeReportMessage {
  byte originating_market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte trade_control_number[10];
  byte trade_price_long[8];
  byte trade_size[4];
  SaleConditionModifier sale_condition_modifier
};

int long_form_trade_report_message_at;

/* every byte of Long Form Trade Report Message set to one value */
inline fill_long_form_trade_report_message(long_form_trade_report_message_record, long_form_trade_report_message_value) {
  long_form_trade_report_message_record.originating_market_center_identifier = long_form_trade_report_message_value;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 8 -> long_form_trade_report_message_record.issue_symbol[long_form_trade_report_message_at] = long_form_trade_report_message_value; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  long_form_trade_report_message_record.security_class = long_form_trade_report_message_value;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 10 -> long_form_trade_report_message_record.trade_control_number[long_form_trade_report_message_at] = long_form_trade_report_message_value; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 8 -> long_form_trade_report_message_record.trade_price_long[long_form_trade_report_message_at] = long_form_trade_report_message_value; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 4 -> long_form_trade_report_message_record.trade_size[long_form_trade_report_message_at] = long_form_trade_report_message_value; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  fill_sale_condition_modifier(long_form_trade_report_message_record.sale_condition_modifier, long_form_trade_report_message_value);
  skip
}

/* each byte of Long Form Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_long_form_trade_report_message(long_form_trade_report_message_record, long_form_trade_report_message_base) {
  long_form_trade_report_message_record.originating_market_center_identifier = (long_form_trade_report_message_base + 0 + 1) % 256;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 8 -> long_form_trade_report_message_record.issue_symbol[long_form_trade_report_message_at] = (long_form_trade_report_message_base + 1 + long_form_trade_report_message_at + 1) % 256; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  long_form_trade_report_message_record.security_class = (long_form_trade_report_message_base + 9 + 1) % 256;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 10 -> long_form_trade_report_message_record.trade_control_number[long_form_trade_report_message_at] = (long_form_trade_report_message_base + 10 + long_form_trade_report_message_at + 1) % 256; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 8 -> long_form_trade_report_message_record.trade_price_long[long_form_trade_report_message_at] = (long_form_trade_report_message_base + 20 + long_form_trade_report_message_at + 1) % 256; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 4 -> long_form_trade_report_message_record.trade_size[long_form_trade_report_message_at] = (long_form_trade_report_message_base + 28 + long_form_trade_report_message_at + 1) % 256; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  ramp_sale_condition_modifier(long_form_trade_report_message_record.sale_condition_modifier, long_form_trade_report_message_base + 32);
  skip
}

/* Long Form Trade Report Message to the wire, 36 bytes from where the cursor stands */
inline encode_long_form_trade_report_message(long_form_trade_report_message_record) {
  wire[at] = long_form_trade_report_message_record.originating_market_center_identifier; at = at + 1;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 8 -> wire[at] = long_form_trade_report_message_record.issue_symbol[long_form_trade_report_message_at]; at = at + 1; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = long_form_trade_report_message_record.security_class; at = at + 1;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 10 -> wire[at] = long_form_trade_report_message_record.trade_control_number[long_form_trade_report_message_at]; at = at + 1; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 8 -> wire[at] = long_form_trade_report_message_record.trade_price_long[long_form_trade_report_message_at]; at = at + 1; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 4 -> wire[at] = long_form_trade_report_message_record.trade_size[long_form_trade_report_message_at]; at = at + 1; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  encode_sale_condition_modifier(long_form_trade_report_message_record.sale_condition_modifier);
  skip
}

/* Long Form Trade Report Message off the wire, 36 bytes from where the cursor stands */
inline decode_long_form_trade_report_message(long_form_trade_report_message_record) {
  long_form_trade_report_message_record.originating_market_center_identifier = wire[at]; at = at + 1;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 8 -> long_form_trade_report_message_record.issue_symbol[long_form_trade_report_message_at] = wire[at]; at = at + 1; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  long_form_trade_report_message_record.security_class = wire[at]; at = at + 1;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 10 -> long_form_trade_report_message_record.trade_control_number[long_form_trade_report_message_at] = wire[at]; at = at + 1; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 8 -> long_form_trade_report_message_record.trade_price_long[long_form_trade_report_message_at] = wire[at]; at = at + 1; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 4 -> long_form_trade_report_message_record.trade_size[long_form_trade_report_message_at] = wire[at]; at = at + 1; long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  decode_sale_condition_modifier(long_form_trade_report_message_record.sale_condition_modifier);
  skip
}

/* what was read of Long Form Trade Report Message is what was written, byte for byte */
inline equal_long_form_trade_report_message(long_form_trade_report_message_read, long_form_trade_report_message_written) {
  assert(long_form_trade_report_message_read.originating_market_center_identifier == long_form_trade_report_message_written.originating_market_center_identifier);
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 8 -> assert(long_form_trade_report_message_read.issue_symbol[long_form_trade_report_message_at] == long_form_trade_report_message_written.issue_symbol[long_form_trade_report_message_at]); long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  assert(long_form_trade_report_message_read.security_class == long_form_trade_report_message_written.security_class);
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 10 -> assert(long_form_trade_report_message_read.trade_control_number[long_form_trade_report_message_at] == long_form_trade_report_message_written.trade_control_number[long_form_trade_report_message_at]); long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 8 -> assert(long_form_trade_report_message_read.trade_price_long[long_form_trade_report_message_at] == long_form_trade_report_message_written.trade_price_long[long_form_trade_report_message_at]); long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  long_form_trade_report_message_at = 0;
  do
  :: long_form_trade_report_message_at < 4 -> assert(long_form_trade_report_message_read.trade_size[long_form_trade_report_message_at] == long_form_trade_report_message_written.trade_size[long_form_trade_report_message_at]); long_form_trade_report_message_at = long_form_trade_report_message_at + 1
  :: else -> break
  od;
  equal_sale_condition_modifier(long_form_trade_report_message_read.sale_condition_modifier, long_form_trade_report_message_written.sale_condition_modifier);
  skip
}

/* ---- Next Shares Trade Report Message: 36 bytes ------------------------------ */

/* The following message is used to relay Nasdaq execution system and TRF trade transactions for Exchange Traded Managed Funds (NextShares) that are reported for the current business day. */
typedef NextSharesTradeReportMessage {
  byte market_center_identifier;
  byte next_shares_symbol[8];
  byte security_class;
  byte trade_control_number[10];
  byte proxy_price[4];
  byte trade_size[4];
  byte nav_premium_discount_amount[4];
  SaleConditionModifier sale_condition_modifier
};

int next_shares_trade_report_message_at;

/* every byte of Next Shares Trade Report Message set to one value */
inline fill_next_shares_trade_report_message(next_shares_trade_report_message_record, next_shares_trade_report_message_value) {
  next_shares_trade_report_message_record.market_center_identifier = next_shares_trade_report_message_value;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 8 -> next_shares_trade_report_message_record.next_shares_symbol[next_shares_trade_report_message_at] = next_shares_trade_report_message_value; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_record.security_class = next_shares_trade_report_message_value;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 10 -> next_shares_trade_report_message_record.trade_control_number[next_shares_trade_report_message_at] = next_shares_trade_report_message_value; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.proxy_price[next_shares_trade_report_message_at] = next_shares_trade_report_message_value; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.trade_size[next_shares_trade_report_message_at] = next_shares_trade_report_message_value; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.nav_premium_discount_amount[next_shares_trade_report_message_at] = next_shares_trade_report_message_value; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  fill_sale_condition_modifier(next_shares_trade_report_message_record.sale_condition_modifier, next_shares_trade_report_message_value);
  skip
}

/* each byte of Next Shares Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_next_shares_trade_report_message(next_shares_trade_report_message_record, next_shares_trade_report_message_base) {
  next_shares_trade_report_message_record.market_center_identifier = (next_shares_trade_report_message_base + 0 + 1) % 256;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 8 -> next_shares_trade_report_message_record.next_shares_symbol[next_shares_trade_report_message_at] = (next_shares_trade_report_message_base + 1 + next_shares_trade_report_message_at + 1) % 256; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_record.security_class = (next_shares_trade_report_message_base + 9 + 1) % 256;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 10 -> next_shares_trade_report_message_record.trade_control_number[next_shares_trade_report_message_at] = (next_shares_trade_report_message_base + 10 + next_shares_trade_report_message_at + 1) % 256; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.proxy_price[next_shares_trade_report_message_at] = (next_shares_trade_report_message_base + 20 + next_shares_trade_report_message_at + 1) % 256; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.trade_size[next_shares_trade_report_message_at] = (next_shares_trade_report_message_base + 24 + next_shares_trade_report_message_at + 1) % 256; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.nav_premium_discount_amount[next_shares_trade_report_message_at] = (next_shares_trade_report_message_base + 28 + next_shares_trade_report_message_at + 1) % 256; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  ramp_sale_condition_modifier(next_shares_trade_report_message_record.sale_condition_modifier, next_shares_trade_report_message_base + 32);
  skip
}

/* Next Shares Trade Report Message to the wire, 36 bytes from where the cursor stands */
inline encode_next_shares_trade_report_message(next_shares_trade_report_message_record) {
  wire[at] = next_shares_trade_report_message_record.market_center_identifier; at = at + 1;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 8 -> wire[at] = next_shares_trade_report_message_record.next_shares_symbol[next_shares_trade_report_message_at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = next_shares_trade_report_message_record.security_class; at = at + 1;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 10 -> wire[at] = next_shares_trade_report_message_record.trade_control_number[next_shares_trade_report_message_at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> wire[at] = next_shares_trade_report_message_record.proxy_price[next_shares_trade_report_message_at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> wire[at] = next_shares_trade_report_message_record.trade_size[next_shares_trade_report_message_at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> wire[at] = next_shares_trade_report_message_record.nav_premium_discount_amount[next_shares_trade_report_message_at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  encode_sale_condition_modifier(next_shares_trade_report_message_record.sale_condition_modifier);
  skip
}

/* Next Shares Trade Report Message off the wire, 36 bytes from where the cursor stands */
inline decode_next_shares_trade_report_message(next_shares_trade_report_message_record) {
  next_shares_trade_report_message_record.market_center_identifier = wire[at]; at = at + 1;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 8 -> next_shares_trade_report_message_record.next_shares_symbol[next_shares_trade_report_message_at] = wire[at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_record.security_class = wire[at]; at = at + 1;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 10 -> next_shares_trade_report_message_record.trade_control_number[next_shares_trade_report_message_at] = wire[at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.proxy_price[next_shares_trade_report_message_at] = wire[at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.trade_size[next_shares_trade_report_message_at] = wire[at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.nav_premium_discount_amount[next_shares_trade_report_message_at] = wire[at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  decode_sale_condition_modifier(next_shares_trade_report_message_record.sale_condition_modifier);
  skip
}

/* what was read of Next Shares Trade Report Message is what was written, byte for byte */
inline equal_next_shares_trade_report_message(next_shares_trade_report_message_read, next_shares_trade_report_message_written) {
  assert(next_shares_trade_report_message_read.market_center_identifier == next_shares_trade_report_message_written.market_center_identifier);
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 8 -> assert(next_shares_trade_report_message_read.next_shares_symbol[next_shares_trade_report_message_at] == next_shares_trade_report_message_written.next_shares_symbol[next_shares_trade_report_message_at]); next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  assert(next_shares_trade_report_message_read.security_class == next_shares_trade_report_message_written.security_class);
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 10 -> assert(next_shares_trade_report_message_read.trade_control_number[next_shares_trade_report_message_at] == next_shares_trade_report_message_written.trade_control_number[next_shares_trade_report_message_at]); next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> assert(next_shares_trade_report_message_read.proxy_price[next_shares_trade_report_message_at] == next_shares_trade_report_message_written.proxy_price[next_shares_trade_report_message_at]); next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> assert(next_shares_trade_report_message_read.trade_size[next_shares_trade_report_message_at] == next_shares_trade_report_message_written.trade_size[next_shares_trade_report_message_at]); next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> assert(next_shares_trade_report_message_read.nav_premium_discount_amount[next_shares_trade_report_message_at] == next_shares_trade_report_message_written.nav_premium_discount_amount[next_shares_trade_report_message_at]); next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  equal_sale_condition_modifier(next_shares_trade_report_message_read.sale_condition_modifier, next_shares_trade_report_message_written.sale_condition_modifier);
  skip
}

/* ---- Original Sale Condition Modifier: 4 bytes ------------------------------- */

/* The sale condition modifiers as reported on the original trade transaction */
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

/* ---- Trade Cancel Error Message: 32 bytes ------------------------------------ */

/* The following message is used in the event that a Nasdaq or TRF trade transaction is cancelled on the same business day that it is reported. */
typedef TradeCancelErrorMessage {
  byte market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price[4];
  byte original_trade_size[4];
  OriginalSaleConditionModifier original_sale_condition_modifier
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
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fill_original_sale_condition_modifier(trade_cancel_error_message_record.original_sale_condition_modifier, trade_cancel_error_message_value);
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
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 20 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 24 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  ramp_original_sale_condition_modifier(trade_cancel_error_message_record.original_sale_condition_modifier, trade_cancel_error_message_base + 28);
  skip
}

/* Trade Cancel Error Message to the wire, 32 bytes from where the cursor stands */
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
  :: trade_cancel_error_message_at < 4 -> wire[at] = trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> wire[at] = trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  encode_original_sale_condition_modifier(trade_cancel_error_message_record.original_sale_condition_modifier);
  skip
}

/* Trade Cancel Error Message off the wire, 32 bytes from where the cursor stands */
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
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  decode_original_sale_condition_modifier(trade_cancel_error_message_record.original_sale_condition_modifier);
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
  :: trade_cancel_error_message_at < 4 -> assert(trade_cancel_error_message_read.original_trade_price[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_trade_price[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> assert(trade_cancel_error_message_read.original_trade_size[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_trade_size[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  equal_original_sale_condition_modifier(trade_cancel_error_message_read.original_sale_condition_modifier, trade_cancel_error_message_written.original_sale_condition_modifier);
  skip
}

/* ---- Long Form Trade Cancel Error Message: 36 bytes -------------------------- */

/* The following message is used in the event that a Nasdaq trade transaction, exceeding the upper limit of a 4-byte price, is cancelled on the same business day that it is reported. */
typedef LongFormTradeCancelErrorMessage {
  byte originating_market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price_long[8];
  byte original_trade_size[4];
  OriginalSaleConditionModifier original_sale_condition_modifier
};

int long_form_trade_cancel_error_message_at;

/* every byte of Long Form Trade Cancel Error Message set to one value */
inline fill_long_form_trade_cancel_error_message(long_form_trade_cancel_error_message_record, long_form_trade_cancel_error_message_value) {
  long_form_trade_cancel_error_message_record.originating_market_center_identifier = long_form_trade_cancel_error_message_value;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 8 -> long_form_trade_cancel_error_message_record.issue_symbol[long_form_trade_cancel_error_message_at] = long_form_trade_cancel_error_message_value; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  long_form_trade_cancel_error_message_record.security_class = long_form_trade_cancel_error_message_value;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 10 -> long_form_trade_cancel_error_message_record.original_trade_control_number[long_form_trade_cancel_error_message_at] = long_form_trade_cancel_error_message_value; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 8 -> long_form_trade_cancel_error_message_record.original_trade_price_long[long_form_trade_cancel_error_message_at] = long_form_trade_cancel_error_message_value; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 4 -> long_form_trade_cancel_error_message_record.original_trade_size[long_form_trade_cancel_error_message_at] = long_form_trade_cancel_error_message_value; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fill_original_sale_condition_modifier(long_form_trade_cancel_error_message_record.original_sale_condition_modifier, long_form_trade_cancel_error_message_value);
  skip
}

/* each byte of Long Form Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_long_form_trade_cancel_error_message(long_form_trade_cancel_error_message_record, long_form_trade_cancel_error_message_base) {
  long_form_trade_cancel_error_message_record.originating_market_center_identifier = (long_form_trade_cancel_error_message_base + 0 + 1) % 256;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 8 -> long_form_trade_cancel_error_message_record.issue_symbol[long_form_trade_cancel_error_message_at] = (long_form_trade_cancel_error_message_base + 1 + long_form_trade_cancel_error_message_at + 1) % 256; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  long_form_trade_cancel_error_message_record.security_class = (long_form_trade_cancel_error_message_base + 9 + 1) % 256;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 10 -> long_form_trade_cancel_error_message_record.original_trade_control_number[long_form_trade_cancel_error_message_at] = (long_form_trade_cancel_error_message_base + 10 + long_form_trade_cancel_error_message_at + 1) % 256; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 8 -> long_form_trade_cancel_error_message_record.original_trade_price_long[long_form_trade_cancel_error_message_at] = (long_form_trade_cancel_error_message_base + 20 + long_form_trade_cancel_error_message_at + 1) % 256; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 4 -> long_form_trade_cancel_error_message_record.original_trade_size[long_form_trade_cancel_error_message_at] = (long_form_trade_cancel_error_message_base + 28 + long_form_trade_cancel_error_message_at + 1) % 256; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  ramp_original_sale_condition_modifier(long_form_trade_cancel_error_message_record.original_sale_condition_modifier, long_form_trade_cancel_error_message_base + 32);
  skip
}

/* Long Form Trade Cancel Error Message to the wire, 36 bytes from where the cursor stands */
inline encode_long_form_trade_cancel_error_message(long_form_trade_cancel_error_message_record) {
  wire[at] = long_form_trade_cancel_error_message_record.originating_market_center_identifier; at = at + 1;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 8 -> wire[at] = long_form_trade_cancel_error_message_record.issue_symbol[long_form_trade_cancel_error_message_at]; at = at + 1; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = long_form_trade_cancel_error_message_record.security_class; at = at + 1;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 10 -> wire[at] = long_form_trade_cancel_error_message_record.original_trade_control_number[long_form_trade_cancel_error_message_at]; at = at + 1; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 8 -> wire[at] = long_form_trade_cancel_error_message_record.original_trade_price_long[long_form_trade_cancel_error_message_at]; at = at + 1; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 4 -> wire[at] = long_form_trade_cancel_error_message_record.original_trade_size[long_form_trade_cancel_error_message_at]; at = at + 1; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  encode_original_sale_condition_modifier(long_form_trade_cancel_error_message_record.original_sale_condition_modifier);
  skip
}

/* Long Form Trade Cancel Error Message off the wire, 36 bytes from where the cursor stands */
inline decode_long_form_trade_cancel_error_message(long_form_trade_cancel_error_message_record) {
  long_form_trade_cancel_error_message_record.originating_market_center_identifier = wire[at]; at = at + 1;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 8 -> long_form_trade_cancel_error_message_record.issue_symbol[long_form_trade_cancel_error_message_at] = wire[at]; at = at + 1; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  long_form_trade_cancel_error_message_record.security_class = wire[at]; at = at + 1;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 10 -> long_form_trade_cancel_error_message_record.original_trade_control_number[long_form_trade_cancel_error_message_at] = wire[at]; at = at + 1; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 8 -> long_form_trade_cancel_error_message_record.original_trade_price_long[long_form_trade_cancel_error_message_at] = wire[at]; at = at + 1; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 4 -> long_form_trade_cancel_error_message_record.original_trade_size[long_form_trade_cancel_error_message_at] = wire[at]; at = at + 1; long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  decode_original_sale_condition_modifier(long_form_trade_cancel_error_message_record.original_sale_condition_modifier);
  skip
}

/* what was read of Long Form Trade Cancel Error Message is what was written, byte for byte */
inline equal_long_form_trade_cancel_error_message(long_form_trade_cancel_error_message_read, long_form_trade_cancel_error_message_written) {
  assert(long_form_trade_cancel_error_message_read.originating_market_center_identifier == long_form_trade_cancel_error_message_written.originating_market_center_identifier);
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 8 -> assert(long_form_trade_cancel_error_message_read.issue_symbol[long_form_trade_cancel_error_message_at] == long_form_trade_cancel_error_message_written.issue_symbol[long_form_trade_cancel_error_message_at]); long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(long_form_trade_cancel_error_message_read.security_class == long_form_trade_cancel_error_message_written.security_class);
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 10 -> assert(long_form_trade_cancel_error_message_read.original_trade_control_number[long_form_trade_cancel_error_message_at] == long_form_trade_cancel_error_message_written.original_trade_control_number[long_form_trade_cancel_error_message_at]); long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 8 -> assert(long_form_trade_cancel_error_message_read.original_trade_price_long[long_form_trade_cancel_error_message_at] == long_form_trade_cancel_error_message_written.original_trade_price_long[long_form_trade_cancel_error_message_at]); long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  long_form_trade_cancel_error_message_at = 0;
  do
  :: long_form_trade_cancel_error_message_at < 4 -> assert(long_form_trade_cancel_error_message_read.original_trade_size[long_form_trade_cancel_error_message_at] == long_form_trade_cancel_error_message_written.original_trade_size[long_form_trade_cancel_error_message_at]); long_form_trade_cancel_error_message_at = long_form_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  equal_original_sale_condition_modifier(long_form_trade_cancel_error_message_read.original_sale_condition_modifier, long_form_trade_cancel_error_message_written.original_sale_condition_modifier);
  skip
}

/* ---- Next Shares Trade Cancel Error Message: 36 bytes ------------------------ */

/* The following message is used in the event that a Nasdaq or TRF trade transaction for an NextShares is cancelled on the same business day that it is reported. */
typedef NextSharesTradeCancelErrorMessage {
  byte market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price[4];
  byte original_nav_premium_discount_amount[4];
  byte original_trade_size[4];
  OriginalSaleConditionModifier original_sale_condition_modifier
};

int next_shares_trade_cancel_error_message_at;

/* every byte of Next Shares Trade Cancel Error Message set to one value */
inline fill_next_shares_trade_cancel_error_message(next_shares_trade_cancel_error_message_record, next_shares_trade_cancel_error_message_value) {
  next_shares_trade_cancel_error_message_record.market_center_identifier = next_shares_trade_cancel_error_message_value;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 8 -> next_shares_trade_cancel_error_message_record.issue_symbol[next_shares_trade_cancel_error_message_at] = next_shares_trade_cancel_error_message_value; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_record.security_class = next_shares_trade_cancel_error_message_value;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 10 -> next_shares_trade_cancel_error_message_record.original_trade_control_number[next_shares_trade_cancel_error_message_at] = next_shares_trade_cancel_error_message_value; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> next_shares_trade_cancel_error_message_record.original_trade_price[next_shares_trade_cancel_error_message_at] = next_shares_trade_cancel_error_message_value; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> next_shares_trade_cancel_error_message_record.original_nav_premium_discount_amount[next_shares_trade_cancel_error_message_at] = next_shares_trade_cancel_error_message_value; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> next_shares_trade_cancel_error_message_record.original_trade_size[next_shares_trade_cancel_error_message_at] = next_shares_trade_cancel_error_message_value; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  fill_original_sale_condition_modifier(next_shares_trade_cancel_error_message_record.original_sale_condition_modifier, next_shares_trade_cancel_error_message_value);
  skip
}

/* each byte of Next Shares Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_next_shares_trade_cancel_error_message(next_shares_trade_cancel_error_message_record, next_shares_trade_cancel_error_message_base) {
  next_shares_trade_cancel_error_message_record.market_center_identifier = (next_shares_trade_cancel_error_message_base + 0 + 1) % 256;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 8 -> next_shares_trade_cancel_error_message_record.issue_symbol[next_shares_trade_cancel_error_message_at] = (next_shares_trade_cancel_error_message_base + 1 + next_shares_trade_cancel_error_message_at + 1) % 256; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_record.security_class = (next_shares_trade_cancel_error_message_base + 9 + 1) % 256;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 10 -> next_shares_trade_cancel_error_message_record.original_trade_control_number[next_shares_trade_cancel_error_message_at] = (next_shares_trade_cancel_error_message_base + 10 + next_shares_trade_cancel_error_message_at + 1) % 256; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> next_shares_trade_cancel_error_message_record.original_trade_price[next_shares_trade_cancel_error_message_at] = (next_shares_trade_cancel_error_message_base + 20 + next_shares_trade_cancel_error_message_at + 1) % 256; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> next_shares_trade_cancel_error_message_record.original_nav_premium_discount_amount[next_shares_trade_cancel_error_message_at] = (next_shares_trade_cancel_error_message_base + 24 + next_shares_trade_cancel_error_message_at + 1) % 256; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> next_shares_trade_cancel_error_message_record.original_trade_size[next_shares_trade_cancel_error_message_at] = (next_shares_trade_cancel_error_message_base + 28 + next_shares_trade_cancel_error_message_at + 1) % 256; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  ramp_original_sale_condition_modifier(next_shares_trade_cancel_error_message_record.original_sale_condition_modifier, next_shares_trade_cancel_error_message_base + 32);
  skip
}

/* Next Shares Trade Cancel Error Message to the wire, 36 bytes from where the cursor stands */
inline encode_next_shares_trade_cancel_error_message(next_shares_trade_cancel_error_message_record) {
  wire[at] = next_shares_trade_cancel_error_message_record.market_center_identifier; at = at + 1;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 8 -> wire[at] = next_shares_trade_cancel_error_message_record.issue_symbol[next_shares_trade_cancel_error_message_at]; at = at + 1; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = next_shares_trade_cancel_error_message_record.security_class; at = at + 1;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 10 -> wire[at] = next_shares_trade_cancel_error_message_record.original_trade_control_number[next_shares_trade_cancel_error_message_at]; at = at + 1; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> wire[at] = next_shares_trade_cancel_error_message_record.original_trade_price[next_shares_trade_cancel_error_message_at]; at = at + 1; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> wire[at] = next_shares_trade_cancel_error_message_record.original_nav_premium_discount_amount[next_shares_trade_cancel_error_message_at]; at = at + 1; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> wire[at] = next_shares_trade_cancel_error_message_record.original_trade_size[next_shares_trade_cancel_error_message_at]; at = at + 1; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  encode_original_sale_condition_modifier(next_shares_trade_cancel_error_message_record.original_sale_condition_modifier);
  skip
}

/* Next Shares Trade Cancel Error Message off the wire, 36 bytes from where the cursor stands */
inline decode_next_shares_trade_cancel_error_message(next_shares_trade_cancel_error_message_record) {
  next_shares_trade_cancel_error_message_record.market_center_identifier = wire[at]; at = at + 1;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 8 -> next_shares_trade_cancel_error_message_record.issue_symbol[next_shares_trade_cancel_error_message_at] = wire[at]; at = at + 1; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_record.security_class = wire[at]; at = at + 1;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 10 -> next_shares_trade_cancel_error_message_record.original_trade_control_number[next_shares_trade_cancel_error_message_at] = wire[at]; at = at + 1; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> next_shares_trade_cancel_error_message_record.original_trade_price[next_shares_trade_cancel_error_message_at] = wire[at]; at = at + 1; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> next_shares_trade_cancel_error_message_record.original_nav_premium_discount_amount[next_shares_trade_cancel_error_message_at] = wire[at]; at = at + 1; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> next_shares_trade_cancel_error_message_record.original_trade_size[next_shares_trade_cancel_error_message_at] = wire[at]; at = at + 1; next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  decode_original_sale_condition_modifier(next_shares_trade_cancel_error_message_record.original_sale_condition_modifier);
  skip
}

/* what was read of Next Shares Trade Cancel Error Message is what was written, byte for byte */
inline equal_next_shares_trade_cancel_error_message(next_shares_trade_cancel_error_message_read, next_shares_trade_cancel_error_message_written) {
  assert(next_shares_trade_cancel_error_message_read.market_center_identifier == next_shares_trade_cancel_error_message_written.market_center_identifier);
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 8 -> assert(next_shares_trade_cancel_error_message_read.issue_symbol[next_shares_trade_cancel_error_message_at] == next_shares_trade_cancel_error_message_written.issue_symbol[next_shares_trade_cancel_error_message_at]); next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(next_shares_trade_cancel_error_message_read.security_class == next_shares_trade_cancel_error_message_written.security_class);
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 10 -> assert(next_shares_trade_cancel_error_message_read.original_trade_control_number[next_shares_trade_cancel_error_message_at] == next_shares_trade_cancel_error_message_written.original_trade_control_number[next_shares_trade_cancel_error_message_at]); next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> assert(next_shares_trade_cancel_error_message_read.original_trade_price[next_shares_trade_cancel_error_message_at] == next_shares_trade_cancel_error_message_written.original_trade_price[next_shares_trade_cancel_error_message_at]); next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> assert(next_shares_trade_cancel_error_message_read.original_nav_premium_discount_amount[next_shares_trade_cancel_error_message_at] == next_shares_trade_cancel_error_message_written.original_nav_premium_discount_amount[next_shares_trade_cancel_error_message_at]); next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  next_shares_trade_cancel_error_message_at = 0;
  do
  :: next_shares_trade_cancel_error_message_at < 4 -> assert(next_shares_trade_cancel_error_message_read.original_trade_size[next_shares_trade_cancel_error_message_at] == next_shares_trade_cancel_error_message_written.original_trade_size[next_shares_trade_cancel_error_message_at]); next_shares_trade_cancel_error_message_at = next_shares_trade_cancel_error_message_at + 1
  :: else -> break
  od;
  equal_original_sale_condition_modifier(next_shares_trade_cancel_error_message_read.original_sale_condition_modifier, next_shares_trade_cancel_error_message_written.original_sale_condition_modifier);
  skip
}

/* ---- Corrected Sale Condition Modifier: 4 bytes ------------------------------ */

/* The sale condition modifiers associated with the corrected trade transaction */
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

/* ---- Trade Correction Message: 54 bytes -------------------------------------- */

/* The following message is used in the event that a TRF trade transaction is corrected on the same business day that it is reported. */
typedef TradeCorrectionMessage {
  byte market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price[4];
  byte original_trade_size[4];
  OriginalSaleConditionModifier original_sale_condition_modifier;
  byte corrected_trade_control_number[10];
  byte corrected_trade_price[4];
  byte corrected_trade_size[4];
  CorrectedSaleConditionModifier corrected_sale_condition_modifier
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
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  fill_original_sale_condition_modifier(trade_correction_message_record.original_sale_condition_modifier, trade_correction_message_value);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.corrected_trade_control_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  fill_corrected_sale_condition_modifier(trade_correction_message_record.corrected_sale_condition_modifier, trade_correction_message_value);
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
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = (trade_correction_message_base + 20 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = (trade_correction_message_base + 24 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  ramp_original_sale_condition_modifier(trade_correction_message_record.original_sale_condition_modifier, trade_correction_message_base + 28);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.corrected_trade_control_number[trade_correction_message_at] = (trade_correction_message_base + 32 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = (trade_correction_message_base + 42 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = (trade_correction_message_base + 46 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  ramp_corrected_sale_condition_modifier(trade_correction_message_record.corrected_sale_condition_modifier, trade_correction_message_base + 50);
  skip
}

/* Trade Correction Message to the wire, 54 bytes from where the cursor stands */
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
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.original_trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.original_trade_size[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  encode_original_sale_condition_modifier(trade_correction_message_record.original_sale_condition_modifier);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> wire[at] = trade_correction_message_record.corrected_trade_control_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.corrected_trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.corrected_trade_size[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  encode_corrected_sale_condition_modifier(trade_correction_message_record.corrected_sale_condition_modifier);
  skip
}

/* Trade Correction Message off the wire, 54 bytes from where the cursor stands */
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
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  decode_original_sale_condition_modifier(trade_correction_message_record.original_sale_condition_modifier);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.corrected_trade_control_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  decode_corrected_sale_condition_modifier(trade_correction_message_record.corrected_sale_condition_modifier);
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
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.original_trade_price[trade_correction_message_at] == trade_correction_message_written.original_trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.original_trade_size[trade_correction_message_at] == trade_correction_message_written.original_trade_size[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  equal_original_sale_condition_modifier(trade_correction_message_read.original_sale_condition_modifier, trade_correction_message_written.original_sale_condition_modifier);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> assert(trade_correction_message_read.corrected_trade_control_number[trade_correction_message_at] == trade_correction_message_written.corrected_trade_control_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.corrected_trade_price[trade_correction_message_at] == trade_correction_message_written.corrected_trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.corrected_trade_size[trade_correction_message_at] == trade_correction_message_written.corrected_trade_size[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  equal_corrected_sale_condition_modifier(trade_correction_message_read.corrected_sale_condition_modifier, trade_correction_message_written.corrected_sale_condition_modifier);
  skip
}

/* ---- Long Form Trade Correction Message: 62 bytes ---------------------------- */

/* The following message is used in the event that a Nasdaq trade transaction is corrected on the same business day that it is reported, only for trades that have exceeded the upper limit of a 4-byte price. */
typedef LongFormTradeCorrectionMessage {
  byte originating_market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price_long[8];
  byte original_trade_size[4];
  OriginalSaleConditionModifier original_sale_condition_modifier;
  byte corrected_trade_control_number[10];
  byte corrected_trade_price_long[8];
  byte corrected_trade_size[4];
  CorrectedSaleConditionModifier corrected_sale_condition_modifier
};

int long_form_trade_correction_message_at;

/* every byte of Long Form Trade Correction Message set to one value */
inline fill_long_form_trade_correction_message(long_form_trade_correction_message_record, long_form_trade_correction_message_value) {
  long_form_trade_correction_message_record.originating_market_center_identifier = long_form_trade_correction_message_value;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> long_form_trade_correction_message_record.issue_symbol[long_form_trade_correction_message_at] = long_form_trade_correction_message_value; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_record.security_class = long_form_trade_correction_message_value;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 10 -> long_form_trade_correction_message_record.original_trade_control_number[long_form_trade_correction_message_at] = long_form_trade_correction_message_value; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> long_form_trade_correction_message_record.original_trade_price_long[long_form_trade_correction_message_at] = long_form_trade_correction_message_value; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 4 -> long_form_trade_correction_message_record.original_trade_size[long_form_trade_correction_message_at] = long_form_trade_correction_message_value; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  fill_original_sale_condition_modifier(long_form_trade_correction_message_record.original_sale_condition_modifier, long_form_trade_correction_message_value);
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 10 -> long_form_trade_correction_message_record.corrected_trade_control_number[long_form_trade_correction_message_at] = long_form_trade_correction_message_value; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> long_form_trade_correction_message_record.corrected_trade_price_long[long_form_trade_correction_message_at] = long_form_trade_correction_message_value; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 4 -> long_form_trade_correction_message_record.corrected_trade_size[long_form_trade_correction_message_at] = long_form_trade_correction_message_value; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  fill_corrected_sale_condition_modifier(long_form_trade_correction_message_record.corrected_sale_condition_modifier, long_form_trade_correction_message_value);
  skip
}

/* each byte of Long Form Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_long_form_trade_correction_message(long_form_trade_correction_message_record, long_form_trade_correction_message_base) {
  long_form_trade_correction_message_record.originating_market_center_identifier = (long_form_trade_correction_message_base + 0 + 1) % 256;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> long_form_trade_correction_message_record.issue_symbol[long_form_trade_correction_message_at] = (long_form_trade_correction_message_base + 1 + long_form_trade_correction_message_at + 1) % 256; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_record.security_class = (long_form_trade_correction_message_base + 9 + 1) % 256;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 10 -> long_form_trade_correction_message_record.original_trade_control_number[long_form_trade_correction_message_at] = (long_form_trade_correction_message_base + 10 + long_form_trade_correction_message_at + 1) % 256; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> long_form_trade_correction_message_record.original_trade_price_long[long_form_trade_correction_message_at] = (long_form_trade_correction_message_base + 20 + long_form_trade_correction_message_at + 1) % 256; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 4 -> long_form_trade_correction_message_record.original_trade_size[long_form_trade_correction_message_at] = (long_form_trade_correction_message_base + 28 + long_form_trade_correction_message_at + 1) % 256; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  ramp_original_sale_condition_modifier(long_form_trade_correction_message_record.original_sale_condition_modifier, long_form_trade_correction_message_base + 32);
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 10 -> long_form_trade_correction_message_record.corrected_trade_control_number[long_form_trade_correction_message_at] = (long_form_trade_correction_message_base + 36 + long_form_trade_correction_message_at + 1) % 256; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> long_form_trade_correction_message_record.corrected_trade_price_long[long_form_trade_correction_message_at] = (long_form_trade_correction_message_base + 46 + long_form_trade_correction_message_at + 1) % 256; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 4 -> long_form_trade_correction_message_record.corrected_trade_size[long_form_trade_correction_message_at] = (long_form_trade_correction_message_base + 54 + long_form_trade_correction_message_at + 1) % 256; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  ramp_corrected_sale_condition_modifier(long_form_trade_correction_message_record.corrected_sale_condition_modifier, long_form_trade_correction_message_base + 58);
  skip
}

/* Long Form Trade Correction Message to the wire, 62 bytes from where the cursor stands */
inline encode_long_form_trade_correction_message(long_form_trade_correction_message_record) {
  wire[at] = long_form_trade_correction_message_record.originating_market_center_identifier; at = at + 1;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> wire[at] = long_form_trade_correction_message_record.issue_symbol[long_form_trade_correction_message_at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = long_form_trade_correction_message_record.security_class; at = at + 1;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 10 -> wire[at] = long_form_trade_correction_message_record.original_trade_control_number[long_form_trade_correction_message_at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> wire[at] = long_form_trade_correction_message_record.original_trade_price_long[long_form_trade_correction_message_at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 4 -> wire[at] = long_form_trade_correction_message_record.original_trade_size[long_form_trade_correction_message_at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  encode_original_sale_condition_modifier(long_form_trade_correction_message_record.original_sale_condition_modifier);
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 10 -> wire[at] = long_form_trade_correction_message_record.corrected_trade_control_number[long_form_trade_correction_message_at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> wire[at] = long_form_trade_correction_message_record.corrected_trade_price_long[long_form_trade_correction_message_at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 4 -> wire[at] = long_form_trade_correction_message_record.corrected_trade_size[long_form_trade_correction_message_at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  encode_corrected_sale_condition_modifier(long_form_trade_correction_message_record.corrected_sale_condition_modifier);
  skip
}

/* Long Form Trade Correction Message off the wire, 62 bytes from where the cursor stands */
inline decode_long_form_trade_correction_message(long_form_trade_correction_message_record) {
  long_form_trade_correction_message_record.originating_market_center_identifier = wire[at]; at = at + 1;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> long_form_trade_correction_message_record.issue_symbol[long_form_trade_correction_message_at] = wire[at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_record.security_class = wire[at]; at = at + 1;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 10 -> long_form_trade_correction_message_record.original_trade_control_number[long_form_trade_correction_message_at] = wire[at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> long_form_trade_correction_message_record.original_trade_price_long[long_form_trade_correction_message_at] = wire[at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 4 -> long_form_trade_correction_message_record.original_trade_size[long_form_trade_correction_message_at] = wire[at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  decode_original_sale_condition_modifier(long_form_trade_correction_message_record.original_sale_condition_modifier);
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 10 -> long_form_trade_correction_message_record.corrected_trade_control_number[long_form_trade_correction_message_at] = wire[at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> long_form_trade_correction_message_record.corrected_trade_price_long[long_form_trade_correction_message_at] = wire[at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 4 -> long_form_trade_correction_message_record.corrected_trade_size[long_form_trade_correction_message_at] = wire[at]; at = at + 1; long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  decode_corrected_sale_condition_modifier(long_form_trade_correction_message_record.corrected_sale_condition_modifier);
  skip
}

/* what was read of Long Form Trade Correction Message is what was written, byte for byte */
inline equal_long_form_trade_correction_message(long_form_trade_correction_message_read, long_form_trade_correction_message_written) {
  assert(long_form_trade_correction_message_read.originating_market_center_identifier == long_form_trade_correction_message_written.originating_market_center_identifier);
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> assert(long_form_trade_correction_message_read.issue_symbol[long_form_trade_correction_message_at] == long_form_trade_correction_message_written.issue_symbol[long_form_trade_correction_message_at]); long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(long_form_trade_correction_message_read.security_class == long_form_trade_correction_message_written.security_class);
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 10 -> assert(long_form_trade_correction_message_read.original_trade_control_number[long_form_trade_correction_message_at] == long_form_trade_correction_message_written.original_trade_control_number[long_form_trade_correction_message_at]); long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> assert(long_form_trade_correction_message_read.original_trade_price_long[long_form_trade_correction_message_at] == long_form_trade_correction_message_written.original_trade_price_long[long_form_trade_correction_message_at]); long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 4 -> assert(long_form_trade_correction_message_read.original_trade_size[long_form_trade_correction_message_at] == long_form_trade_correction_message_written.original_trade_size[long_form_trade_correction_message_at]); long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  equal_original_sale_condition_modifier(long_form_trade_correction_message_read.original_sale_condition_modifier, long_form_trade_correction_message_written.original_sale_condition_modifier);
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 10 -> assert(long_form_trade_correction_message_read.corrected_trade_control_number[long_form_trade_correction_message_at] == long_form_trade_correction_message_written.corrected_trade_control_number[long_form_trade_correction_message_at]); long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 8 -> assert(long_form_trade_correction_message_read.corrected_trade_price_long[long_form_trade_correction_message_at] == long_form_trade_correction_message_written.corrected_trade_price_long[long_form_trade_correction_message_at]); long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  long_form_trade_correction_message_at = 0;
  do
  :: long_form_trade_correction_message_at < 4 -> assert(long_form_trade_correction_message_read.corrected_trade_size[long_form_trade_correction_message_at] == long_form_trade_correction_message_written.corrected_trade_size[long_form_trade_correction_message_at]); long_form_trade_correction_message_at = long_form_trade_correction_message_at + 1
  :: else -> break
  od;
  equal_corrected_sale_condition_modifier(long_form_trade_correction_message_read.corrected_sale_condition_modifier, long_form_trade_correction_message_written.corrected_sale_condition_modifier);
  skip
}

/* ---- Next Shares Trade Correction Message: 62 bytes -------------------------- */

/* The following message is used in the event that a TRF trade transaction for an NextShares is corrected on the same business day that it is reported. */
typedef NextSharesTradeCorrectionMessage {
  byte market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price[4];
  byte original_nav_premium_discount_amount[4];
  byte original_trade_size[4];
  OriginalSaleConditionModifier original_sale_condition_modifier;
  byte corrected_trade_control_number[10];
  byte corrected_trade_price[4];
  byte corrected_nav_premium_discount_amount[4];
  byte corrected_trade_size[4];
  CorrectedSaleConditionModifier corrected_sale_condition_modifier
};

int next_shares_trade_correction_message_at;

/* every byte of Next Shares Trade Correction Message set to one value */
inline fill_next_shares_trade_correction_message(next_shares_trade_correction_message_record, next_shares_trade_correction_message_value) {
  next_shares_trade_correction_message_record.market_center_identifier = next_shares_trade_correction_message_value;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 8 -> next_shares_trade_correction_message_record.issue_symbol[next_shares_trade_correction_message_at] = next_shares_trade_correction_message_value; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_record.security_class = next_shares_trade_correction_message_value;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 10 -> next_shares_trade_correction_message_record.original_trade_control_number[next_shares_trade_correction_message_at] = next_shares_trade_correction_message_value; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.original_trade_price[next_shares_trade_correction_message_at] = next_shares_trade_correction_message_value; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.original_nav_premium_discount_amount[next_shares_trade_correction_message_at] = next_shares_trade_correction_message_value; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.original_trade_size[next_shares_trade_correction_message_at] = next_shares_trade_correction_message_value; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  fill_original_sale_condition_modifier(next_shares_trade_correction_message_record.original_sale_condition_modifier, next_shares_trade_correction_message_value);
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 10 -> next_shares_trade_correction_message_record.corrected_trade_control_number[next_shares_trade_correction_message_at] = next_shares_trade_correction_message_value; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.corrected_trade_price[next_shares_trade_correction_message_at] = next_shares_trade_correction_message_value; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.corrected_nav_premium_discount_amount[next_shares_trade_correction_message_at] = next_shares_trade_correction_message_value; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.corrected_trade_size[next_shares_trade_correction_message_at] = next_shares_trade_correction_message_value; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  fill_corrected_sale_condition_modifier(next_shares_trade_correction_message_record.corrected_sale_condition_modifier, next_shares_trade_correction_message_value);
  skip
}

/* each byte of Next Shares Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_next_shares_trade_correction_message(next_shares_trade_correction_message_record, next_shares_trade_correction_message_base) {
  next_shares_trade_correction_message_record.market_center_identifier = (next_shares_trade_correction_message_base + 0 + 1) % 256;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 8 -> next_shares_trade_correction_message_record.issue_symbol[next_shares_trade_correction_message_at] = (next_shares_trade_correction_message_base + 1 + next_shares_trade_correction_message_at + 1) % 256; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_record.security_class = (next_shares_trade_correction_message_base + 9 + 1) % 256;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 10 -> next_shares_trade_correction_message_record.original_trade_control_number[next_shares_trade_correction_message_at] = (next_shares_trade_correction_message_base + 10 + next_shares_trade_correction_message_at + 1) % 256; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.original_trade_price[next_shares_trade_correction_message_at] = (next_shares_trade_correction_message_base + 20 + next_shares_trade_correction_message_at + 1) % 256; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.original_nav_premium_discount_amount[next_shares_trade_correction_message_at] = (next_shares_trade_correction_message_base + 24 + next_shares_trade_correction_message_at + 1) % 256; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.original_trade_size[next_shares_trade_correction_message_at] = (next_shares_trade_correction_message_base + 28 + next_shares_trade_correction_message_at + 1) % 256; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  ramp_original_sale_condition_modifier(next_shares_trade_correction_message_record.original_sale_condition_modifier, next_shares_trade_correction_message_base + 32);
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 10 -> next_shares_trade_correction_message_record.corrected_trade_control_number[next_shares_trade_correction_message_at] = (next_shares_trade_correction_message_base + 36 + next_shares_trade_correction_message_at + 1) % 256; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.corrected_trade_price[next_shares_trade_correction_message_at] = (next_shares_trade_correction_message_base + 46 + next_shares_trade_correction_message_at + 1) % 256; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.corrected_nav_premium_discount_amount[next_shares_trade_correction_message_at] = (next_shares_trade_correction_message_base + 50 + next_shares_trade_correction_message_at + 1) % 256; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.corrected_trade_size[next_shares_trade_correction_message_at] = (next_shares_trade_correction_message_base + 54 + next_shares_trade_correction_message_at + 1) % 256; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  ramp_corrected_sale_condition_modifier(next_shares_trade_correction_message_record.corrected_sale_condition_modifier, next_shares_trade_correction_message_base + 58);
  skip
}

/* Next Shares Trade Correction Message to the wire, 62 bytes from where the cursor stands */
inline encode_next_shares_trade_correction_message(next_shares_trade_correction_message_record) {
  wire[at] = next_shares_trade_correction_message_record.market_center_identifier; at = at + 1;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 8 -> wire[at] = next_shares_trade_correction_message_record.issue_symbol[next_shares_trade_correction_message_at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = next_shares_trade_correction_message_record.security_class; at = at + 1;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 10 -> wire[at] = next_shares_trade_correction_message_record.original_trade_control_number[next_shares_trade_correction_message_at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> wire[at] = next_shares_trade_correction_message_record.original_trade_price[next_shares_trade_correction_message_at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> wire[at] = next_shares_trade_correction_message_record.original_nav_premium_discount_amount[next_shares_trade_correction_message_at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> wire[at] = next_shares_trade_correction_message_record.original_trade_size[next_shares_trade_correction_message_at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  encode_original_sale_condition_modifier(next_shares_trade_correction_message_record.original_sale_condition_modifier);
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 10 -> wire[at] = next_shares_trade_correction_message_record.corrected_trade_control_number[next_shares_trade_correction_message_at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> wire[at] = next_shares_trade_correction_message_record.corrected_trade_price[next_shares_trade_correction_message_at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> wire[at] = next_shares_trade_correction_message_record.corrected_nav_premium_discount_amount[next_shares_trade_correction_message_at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> wire[at] = next_shares_trade_correction_message_record.corrected_trade_size[next_shares_trade_correction_message_at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  encode_corrected_sale_condition_modifier(next_shares_trade_correction_message_record.corrected_sale_condition_modifier);
  skip
}

/* Next Shares Trade Correction Message off the wire, 62 bytes from where the cursor stands */
inline decode_next_shares_trade_correction_message(next_shares_trade_correction_message_record) {
  next_shares_trade_correction_message_record.market_center_identifier = wire[at]; at = at + 1;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 8 -> next_shares_trade_correction_message_record.issue_symbol[next_shares_trade_correction_message_at] = wire[at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_record.security_class = wire[at]; at = at + 1;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 10 -> next_shares_trade_correction_message_record.original_trade_control_number[next_shares_trade_correction_message_at] = wire[at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.original_trade_price[next_shares_trade_correction_message_at] = wire[at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.original_nav_premium_discount_amount[next_shares_trade_correction_message_at] = wire[at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.original_trade_size[next_shares_trade_correction_message_at] = wire[at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  decode_original_sale_condition_modifier(next_shares_trade_correction_message_record.original_sale_condition_modifier);
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 10 -> next_shares_trade_correction_message_record.corrected_trade_control_number[next_shares_trade_correction_message_at] = wire[at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.corrected_trade_price[next_shares_trade_correction_message_at] = wire[at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.corrected_nav_premium_discount_amount[next_shares_trade_correction_message_at] = wire[at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> next_shares_trade_correction_message_record.corrected_trade_size[next_shares_trade_correction_message_at] = wire[at]; at = at + 1; next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  decode_corrected_sale_condition_modifier(next_shares_trade_correction_message_record.corrected_sale_condition_modifier);
  skip
}

/* what was read of Next Shares Trade Correction Message is what was written, byte for byte */
inline equal_next_shares_trade_correction_message(next_shares_trade_correction_message_read, next_shares_trade_correction_message_written) {
  assert(next_shares_trade_correction_message_read.market_center_identifier == next_shares_trade_correction_message_written.market_center_identifier);
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 8 -> assert(next_shares_trade_correction_message_read.issue_symbol[next_shares_trade_correction_message_at] == next_shares_trade_correction_message_written.issue_symbol[next_shares_trade_correction_message_at]); next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(next_shares_trade_correction_message_read.security_class == next_shares_trade_correction_message_written.security_class);
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 10 -> assert(next_shares_trade_correction_message_read.original_trade_control_number[next_shares_trade_correction_message_at] == next_shares_trade_correction_message_written.original_trade_control_number[next_shares_trade_correction_message_at]); next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> assert(next_shares_trade_correction_message_read.original_trade_price[next_shares_trade_correction_message_at] == next_shares_trade_correction_message_written.original_trade_price[next_shares_trade_correction_message_at]); next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> assert(next_shares_trade_correction_message_read.original_nav_premium_discount_amount[next_shares_trade_correction_message_at] == next_shares_trade_correction_message_written.original_nav_premium_discount_amount[next_shares_trade_correction_message_at]); next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> assert(next_shares_trade_correction_message_read.original_trade_size[next_shares_trade_correction_message_at] == next_shares_trade_correction_message_written.original_trade_size[next_shares_trade_correction_message_at]); next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  equal_original_sale_condition_modifier(next_shares_trade_correction_message_read.original_sale_condition_modifier, next_shares_trade_correction_message_written.original_sale_condition_modifier);
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 10 -> assert(next_shares_trade_correction_message_read.corrected_trade_control_number[next_shares_trade_correction_message_at] == next_shares_trade_correction_message_written.corrected_trade_control_number[next_shares_trade_correction_message_at]); next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> assert(next_shares_trade_correction_message_read.corrected_trade_price[next_shares_trade_correction_message_at] == next_shares_trade_correction_message_written.corrected_trade_price[next_shares_trade_correction_message_at]); next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> assert(next_shares_trade_correction_message_read.corrected_nav_premium_discount_amount[next_shares_trade_correction_message_at] == next_shares_trade_correction_message_written.corrected_nav_premium_discount_amount[next_shares_trade_correction_message_at]); next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  next_shares_trade_correction_message_at = 0;
  do
  :: next_shares_trade_correction_message_at < 4 -> assert(next_shares_trade_correction_message_read.corrected_trade_size[next_shares_trade_correction_message_at] == next_shares_trade_correction_message_written.corrected_trade_size[next_shares_trade_correction_message_at]); next_shares_trade_correction_message_at = next_shares_trade_correction_message_at + 1
  :: else -> break
  od;
  equal_corrected_sale_condition_modifier(next_shares_trade_correction_message_read.corrected_sale_condition_modifier, next_shares_trade_correction_message_written.corrected_sale_condition_modifier);
  skip
}

/* ---- Stock Trading Action Message: 14 bytes ---------------------------------- */

/* Nasdaq uses this administrative message to indicate the current trading status of a security to the trading community. */
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

/* Nasdaq processes orders based on the most recent Reg SHO Restriction status value. */
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

/* ---- Stock Directory Message: 40 bytes --------------------------------------- */

/* At the start of each trading day, Nasdaq disseminates stock directory messages for all active symbols in the Nasdaq system. */
typedef StockDirectoryMessage {
  byte stock[8];
  byte market_category;
  byte financial_status_indicator;
  byte round_lot_size[4];
  byte round_lots_only;
  byte issue_classification;
  byte issue_sub_type[2];
  byte authenticity;
  byte short_sale_threshold_indicator;
  byte ipo_flag;
  byte luld_reference_price_tier;
  byte etp_flag;
  byte etp_leverage_factor[4];
  byte inverse_indicator;
  byte bloomberg_id[12]
};

int stock_directory_message_at;

/* every byte of Stock Directory Message set to one value */
inline fill_stock_directory_message(stock_directory_message_record, stock_directory_message_value) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = stock_directory_message_value;
  stock_directory_message_record.financial_status_indicator = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = stock_directory_message_value;
  stock_directory_message_record.issue_classification = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.issue_sub_type[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.authenticity = stock_directory_message_value;
  stock_directory_message_record.short_sale_threshold_indicator = stock_directory_message_value;
  stock_directory_message_record.ipo_flag = stock_directory_message_value;
  stock_directory_message_record.luld_reference_price_tier = stock_directory_message_value;
  stock_directory_message_record.etp_flag = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.etp_leverage_factor[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.inverse_indicator = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 12 -> stock_directory_message_record.bloomberg_id[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Directory Message set to where it lies, so a field read out of place says so */
inline ramp_stock_directory_message(stock_directory_message_record, stock_directory_message_base) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock[stock_directory_message_at] = (stock_directory_message_base + 0 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = (stock_directory_message_base + 8 + 1) % 256;
  stock_directory_message_record.financial_status_indicator = (stock_directory_message_base + 9 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = (stock_directory_message_base + 10 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = (stock_directory_message_base + 14 + 1) % 256;
  stock_directory_message_record.issue_classification = (stock_directory_message_base + 15 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.issue_sub_type[stock_directory_message_at] = (stock_directory_message_base + 16 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.authenticity = (stock_directory_message_base + 18 + 1) % 256;
  stock_directory_message_record.short_sale_threshold_indicator = (stock_directory_message_base + 19 + 1) % 256;
  stock_directory_message_record.ipo_flag = (stock_directory_message_base + 20 + 1) % 256;
  stock_directory_message_record.luld_reference_price_tier = (stock_directory_message_base + 21 + 1) % 256;
  stock_directory_message_record.etp_flag = (stock_directory_message_base + 22 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.etp_leverage_factor[stock_directory_message_at] = (stock_directory_message_base + 23 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.inverse_indicator = (stock_directory_message_base + 27 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 12 -> stock_directory_message_record.bloomberg_id[stock_directory_message_at] = (stock_directory_message_base + 28 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Directory Message to the wire, 40 bytes from where the cursor stands */
inline encode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> wire[at] = stock_directory_message_record.stock[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.market_category; at = at + 1;
  wire[at] = stock_directory_message_record.financial_status_indicator; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> wire[at] = stock_directory_message_record.round_lot_size[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.round_lots_only; at = at + 1;
  wire[at] = stock_directory_message_record.issue_classification; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> wire[at] = stock_directory_message_record.issue_sub_type[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.authenticity; at = at + 1;
  wire[at] = stock_directory_message_record.short_sale_threshold_indicator; at = at + 1;
  wire[at] = stock_directory_message_record.ipo_flag; at = at + 1;
  wire[at] = stock_directory_message_record.luld_reference_price_tier; at = at + 1;
  wire[at] = stock_directory_message_record.etp_flag; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> wire[at] = stock_directory_message_record.etp_leverage_factor[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.inverse_indicator; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 12 -> wire[at] = stock_directory_message_record.bloomberg_id[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Directory Message off the wire, 40 bytes from where the cursor stands */
inline decode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = wire[at]; at = at + 1;
  stock_directory_message_record.financial_status_indicator = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = wire[at]; at = at + 1;
  stock_directory_message_record.issue_classification = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.issue_sub_type[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.authenticity = wire[at]; at = at + 1;
  stock_directory_message_record.short_sale_threshold_indicator = wire[at]; at = at + 1;
  stock_directory_message_record.ipo_flag = wire[at]; at = at + 1;
  stock_directory_message_record.luld_reference_price_tier = wire[at]; at = at + 1;
  stock_directory_message_record.etp_flag = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.etp_leverage_factor[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.inverse_indicator = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 12 -> stock_directory_message_record.bloomberg_id[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Directory Message is what was written, byte for byte */
inline equal_stock_directory_message(stock_directory_message_read, stock_directory_message_written) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> assert(stock_directory_message_read.stock[stock_directory_message_at] == stock_directory_message_written.stock[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.market_category == stock_directory_message_written.market_category);
  assert(stock_directory_message_read.financial_status_indicator == stock_directory_message_written.financial_status_indicator);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> assert(stock_directory_message_read.round_lot_size[stock_directory_message_at] == stock_directory_message_written.round_lot_size[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.round_lots_only == stock_directory_message_written.round_lots_only);
  assert(stock_directory_message_read.issue_classification == stock_directory_message_written.issue_classification);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> assert(stock_directory_message_read.issue_sub_type[stock_directory_message_at] == stock_directory_message_written.issue_sub_type[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.authenticity == stock_directory_message_written.authenticity);
  assert(stock_directory_message_read.short_sale_threshold_indicator == stock_directory_message_written.short_sale_threshold_indicator);
  assert(stock_directory_message_read.ipo_flag == stock_directory_message_written.ipo_flag);
  assert(stock_directory_message_read.luld_reference_price_tier == stock_directory_message_written.luld_reference_price_tier);
  assert(stock_directory_message_read.etp_flag == stock_directory_message_written.etp_flag);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> assert(stock_directory_message_read.etp_leverage_factor[stock_directory_message_at] == stock_directory_message_written.etp_leverage_factor[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.inverse_indicator == stock_directory_message_written.inverse_indicator);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 12 -> assert(stock_directory_message_read.bloomberg_id[stock_directory_message_at] == stock_directory_message_written.bloomberg_id[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Adjusted Closing Price Message: 13 bytes -------------------------------- */

/* At the start of each trading day, Nasdaq disseminates the adjusted closing price for all active symbols in the Nasdaq system. */
typedef AdjustedClosingPriceMessage {
  byte stock[8];
  byte security_class;
  byte adjusted_closing_price[4]
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
  :: adjusted_closing_price_message_at < 4 -> adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at] = adjusted_closing_price_message_value; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
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
  :: adjusted_closing_price_message_at < 4 -> adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 9 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Adjusted Closing Price Message to the wire, 13 bytes from where the cursor stands */
inline encode_adjusted_closing_price_message(adjusted_closing_price_message_record) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> wire[at] = adjusted_closing_price_message_record.stock[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  wire[at] = adjusted_closing_price_message_record.security_class; at = at + 1;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 4 -> wire[at] = adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Adjusted Closing Price Message off the wire, 13 bytes from where the cursor stands */
inline decode_adjusted_closing_price_message(adjusted_closing_price_message_record) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.stock[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_record.security_class = wire[at]; at = at + 1;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 4 -> adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
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
  :: adjusted_closing_price_message_at < 4 -> assert(adjusted_closing_price_message_read.adjusted_closing_price[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.adjusted_closing_price[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Form Adjusted Closing Price Message: 17 bytes ---------------------- */

/* At the start of each trading day, Nasdaq disseminates the adjusted closing price for all active symbols in the Nasdaq system, only for securities that have exceeded the upper limit of a 4-byte price. */
typedef LongFormAdjustedClosingPriceMessage {
  byte issue_symbol[8];
  byte security_class;
  byte adjusted_closing_price_long[8]
};

int long_form_adjusted_closing_price_message_at;

/* every byte of Long Form Adjusted Closing Price Message set to one value */
inline fill_long_form_adjusted_closing_price_message(long_form_adjusted_closing_price_message_record, long_form_adjusted_closing_price_message_value) {
  long_form_adjusted_closing_price_message_at = 0;
  do
  :: long_form_adjusted_closing_price_message_at < 8 -> long_form_adjusted_closing_price_message_record.issue_symbol[long_form_adjusted_closing_price_message_at] = long_form_adjusted_closing_price_message_value; long_form_adjusted_closing_price_message_at = long_form_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  long_form_adjusted_closing_price_message_record.security_class = long_form_adjusted_closing_price_message_value;
  long_form_adjusted_closing_price_message_at = 0;
  do
  :: long_form_adjusted_closing_price_message_at < 8 -> long_form_adjusted_closing_price_message_record.adjusted_closing_price_long[long_form_adjusted_closing_price_message_at] = long_form_adjusted_closing_price_message_value; long_form_adjusted_closing_price_message_at = long_form_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Form Adjusted Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_long_form_adjusted_closing_price_message(long_form_adjusted_closing_price_message_record, long_form_adjusted_closing_price_message_base) {
  long_form_adjusted_closing_price_message_at = 0;
  do
  :: long_form_adjusted_closing_price_message_at < 8 -> long_form_adjusted_closing_price_message_record.issue_symbol[long_form_adjusted_closing_price_message_at] = (long_form_adjusted_closing_price_message_base + 0 + long_form_adjusted_closing_price_message_at + 1) % 256; long_form_adjusted_closing_price_message_at = long_form_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  long_form_adjusted_closing_price_message_record.security_class = (long_form_adjusted_closing_price_message_base + 8 + 1) % 256;
  long_form_adjusted_closing_price_message_at = 0;
  do
  :: long_form_adjusted_closing_price_message_at < 8 -> long_form_adjusted_closing_price_message_record.adjusted_closing_price_long[long_form_adjusted_closing_price_message_at] = (long_form_adjusted_closing_price_message_base + 9 + long_form_adjusted_closing_price_message_at + 1) % 256; long_form_adjusted_closing_price_message_at = long_form_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Form Adjusted Closing Price Message to the wire, 17 bytes from where the cursor stands */
inline encode_long_form_adjusted_closing_price_message(long_form_adjusted_closing_price_message_record) {
  long_form_adjusted_closing_price_message_at = 0;
  do
  :: long_form_adjusted_closing_price_message_at < 8 -> wire[at] = long_form_adjusted_closing_price_message_record.issue_symbol[long_form_adjusted_closing_price_message_at]; at = at + 1; long_form_adjusted_closing_price_message_at = long_form_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  wire[at] = long_form_adjusted_closing_price_message_record.security_class; at = at + 1;
  long_form_adjusted_closing_price_message_at = 0;
  do
  :: long_form_adjusted_closing_price_message_at < 8 -> wire[at] = long_form_adjusted_closing_price_message_record.adjusted_closing_price_long[long_form_adjusted_closing_price_message_at]; at = at + 1; long_form_adjusted_closing_price_message_at = long_form_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Form Adjusted Closing Price Message off the wire, 17 bytes from where the cursor stands */
inline decode_long_form_adjusted_closing_price_message(long_form_adjusted_closing_price_message_record) {
  long_form_adjusted_closing_price_message_at = 0;
  do
  :: long_form_adjusted_closing_price_message_at < 8 -> long_form_adjusted_closing_price_message_record.issue_symbol[long_form_adjusted_closing_price_message_at] = wire[at]; at = at + 1; long_form_adjusted_closing_price_message_at = long_form_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  long_form_adjusted_closing_price_message_record.security_class = wire[at]; at = at + 1;
  long_form_adjusted_closing_price_message_at = 0;
  do
  :: long_form_adjusted_closing_price_message_at < 8 -> long_form_adjusted_closing_price_message_record.adjusted_closing_price_long[long_form_adjusted_closing_price_message_at] = wire[at]; at = at + 1; long_form_adjusted_closing_price_message_at = long_form_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Form Adjusted Closing Price Message is what was written, byte for byte */
inline equal_long_form_adjusted_closing_price_message(long_form_adjusted_closing_price_message_read, long_form_adjusted_closing_price_message_written) {
  long_form_adjusted_closing_price_message_at = 0;
  do
  :: long_form_adjusted_closing_price_message_at < 8 -> assert(long_form_adjusted_closing_price_message_read.issue_symbol[long_form_adjusted_closing_price_message_at] == long_form_adjusted_closing_price_message_written.issue_symbol[long_form_adjusted_closing_price_message_at]); long_form_adjusted_closing_price_message_at = long_form_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  assert(long_form_adjusted_closing_price_message_read.security_class == long_form_adjusted_closing_price_message_written.security_class);
  long_form_adjusted_closing_price_message_at = 0;
  do
  :: long_form_adjusted_closing_price_message_at < 8 -> assert(long_form_adjusted_closing_price_message_read.adjusted_closing_price_long[long_form_adjusted_closing_price_message_at] == long_form_adjusted_closing_price_message_written.adjusted_closing_price_long[long_form_adjusted_closing_price_message_at]); long_form_adjusted_closing_price_message_at = long_form_adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mwcb Decline Level Message: 24 bytes ------------------------------------ */

/* Informs data recipients what the daily MWCB breach points are set to for the current trading day. */
typedef MwcbDeclineLevelMessage {
  byte level_1[8];
  byte level_2[8];
  byte level_3[8]
};

int mwcb_decline_level_message_at;

/* every byte of Mwcb Decline Level Message set to one value */
inline fill_mwcb_decline_level_message(mwcb_decline_level_message_record, mwcb_decline_level_message_value) {
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_1[mwcb_decline_level_message_at] = mwcb_decline_level_message_value; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_2[mwcb_decline_level_message_at] = mwcb_decline_level_message_value; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_3[mwcb_decline_level_message_at] = mwcb_decline_level_message_value; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mwcb Decline Level Message set to where it lies, so a field read out of place says so */
inline ramp_mwcb_decline_level_message(mwcb_decline_level_message_record, mwcb_decline_level_message_base) {
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_1[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 0 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_2[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 8 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_3[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 16 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mwcb Decline Level Message to the wire, 24 bytes from where the cursor stands */
inline encode_mwcb_decline_level_message(mwcb_decline_level_message_record) {
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> wire[at] = mwcb_decline_level_message_record.level_1[mwcb_decline_level_message_at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> wire[at] = mwcb_decline_level_message_record.level_2[mwcb_decline_level_message_at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> wire[at] = mwcb_decline_level_message_record.level_3[mwcb_decline_level_message_at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mwcb Decline Level Message off the wire, 24 bytes from where the cursor stands */
inline decode_mwcb_decline_level_message(mwcb_decline_level_message_record) {
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_1[mwcb_decline_level_message_at] = wire[at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_2[mwcb_decline_level_message_at] = wire[at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_3[mwcb_decline_level_message_at] = wire[at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mwcb Decline Level Message is what was written, byte for byte */
inline equal_mwcb_decline_level_message(mwcb_decline_level_message_read, mwcb_decline_level_message_written) {
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> assert(mwcb_decline_level_message_read.level_1[mwcb_decline_level_message_at] == mwcb_decline_level_message_written.level_1[mwcb_decline_level_message_at]); mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> assert(mwcb_decline_level_message_read.level_2[mwcb_decline_level_message_at] == mwcb_decline_level_message_written.level_2[mwcb_decline_level_message_at]); mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> assert(mwcb_decline_level_message_read.level_3[mwcb_decline_level_message_at] == mwcb_decline_level_message_written.level_3[mwcb_decline_level_message_at]); mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mwcb Status Message: 1 bytes -------------------------------------------- */

/* Informs data recipients when a MWCB has breached one of the established levels. */
typedef MwcbStatusMessage {
  byte breached_level
};

/* every byte of Mwcb Status Message set to one value */
inline fill_mwcb_status_message(mwcb_status_message_record, mwcb_status_message_value) {
  mwcb_status_message_record.breached_level = mwcb_status_message_value;
  skip
}

/* each byte of Mwcb Status Message set to where it lies, so a field read out of place says so */
inline ramp_mwcb_status_message(mwcb_status_message_record, mwcb_status_message_base) {
  mwcb_status_message_record.breached_level = (mwcb_status_message_base + 0 + 1) % 256;
  skip
}

/* Mwcb Status Message to the wire, 1 bytes from where the cursor stands */
inline encode_mwcb_status_message(mwcb_status_message_record) {
  wire[at] = mwcb_status_message_record.breached_level; at = at + 1;
  skip
}

/* Mwcb Status Message off the wire, 1 bytes from where the cursor stands */
inline decode_mwcb_status_message(mwcb_status_message_record) {
  mwcb_status_message_record.breached_level = wire[at]; at = at + 1;
  skip
}

/* what was read of Mwcb Status Message is what was written, byte for byte */
inline equal_mwcb_status_message(mwcb_status_message_read, mwcb_status_message_written) {
  assert(mwcb_status_message_read.breached_level == mwcb_status_message_written.breached_level);
  skip
}

/* ---- Ipo Quoting Period Update Message: 17 bytes ----------------------------- */

/* Indicates the anticipated IPO quotation release time of a security. */
typedef IpoQuotingPeriodUpdateMessage {
  byte stock[8];
  byte ipo_quotation_release_time[4];
  byte ipo_quotation_release_qualifier;
  byte ipo_price[4]
};

int ipo_quoting_period_update_message_at;

/* every byte of Ipo Quoting Period Update Message set to one value */
inline fill_ipo_quoting_period_update_message(ipo_quoting_period_update_message_record, ipo_quoting_period_update_message_value) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> ipo_quoting_period_update_message_record.stock[ipo_quoting_period_update_message_at] = ipo_quoting_period_update_message_value; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_quotation_release_time[ipo_quoting_period_update_message_at] = ipo_quoting_period_update_message_value; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_record.ipo_quotation_release_qualifier = ipo_quoting_period_update_message_value;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_price[ipo_quoting_period_update_message_at] = ipo_quoting_period_update_message_value; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ipo Quoting Period Update Message set to where it lies, so a field read out of place says so */
inline ramp_ipo_quoting_period_update_message(ipo_quoting_period_update_message_record, ipo_quoting_period_update_message_base) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> ipo_quoting_period_update_message_record.stock[ipo_quoting_period_update_message_at] = (ipo_quoting_period_update_message_base + 0 + ipo_quoting_period_update_message_at + 1) % 256; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_quotation_release_time[ipo_quoting_period_update_message_at] = (ipo_quoting_period_update_message_base + 8 + ipo_quoting_period_update_message_at + 1) % 256; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_record.ipo_quotation_release_qualifier = (ipo_quoting_period_update_message_base + 12 + 1) % 256;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_price[ipo_quoting_period_update_message_at] = (ipo_quoting_period_update_message_base + 13 + ipo_quoting_period_update_message_at + 1) % 256; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ipo Quoting Period Update Message to the wire, 17 bytes from where the cursor stands */
inline encode_ipo_quoting_period_update_message(ipo_quoting_period_update_message_record) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> wire[at] = ipo_quoting_period_update_message_record.stock[ipo_quoting_period_update_message_at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> wire[at] = ipo_quoting_period_update_message_record.ipo_quotation_release_time[ipo_quoting_period_update_message_at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  wire[at] = ipo_quoting_period_update_message_record.ipo_quotation_release_qualifier; at = at + 1;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> wire[at] = ipo_quoting_period_update_message_record.ipo_price[ipo_quoting_period_update_message_at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ipo Quoting Period Update Message off the wire, 17 bytes from where the cursor stands */
inline decode_ipo_quoting_period_update_message(ipo_quoting_period_update_message_record) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> ipo_quoting_period_update_message_record.stock[ipo_quoting_period_update_message_at] = wire[at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_quotation_release_time[ipo_quoting_period_update_message_at] = wire[at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_record.ipo_quotation_release_qualifier = wire[at]; at = at + 1;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_price[ipo_quoting_period_update_message_at] = wire[at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ipo Quoting Period Update Message is what was written, byte for byte */
inline equal_ipo_quoting_period_update_message(ipo_quoting_period_update_message_read, ipo_quoting_period_update_message_written) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> assert(ipo_quoting_period_update_message_read.stock[ipo_quoting_period_update_message_at] == ipo_quoting_period_update_message_written.stock[ipo_quoting_period_update_message_at]); ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> assert(ipo_quoting_period_update_message_read.ipo_quotation_release_time[ipo_quoting_period_update_message_at] == ipo_quoting_period_update_message_written.ipo_quotation_release_time[ipo_quoting_period_update_message_at]); ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  assert(ipo_quoting_period_update_message_read.ipo_quotation_release_qualifier == ipo_quoting_period_update_message_written.ipo_quotation_release_qualifier);
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> assert(ipo_quoting_period_update_message_read.ipo_price[ipo_quoting_period_update_message_at] == ipo_quoting_period_update_message_written.ipo_price[ipo_quoting_period_update_message_at]); ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Operational Halt Message: 10 bytes -------------------------------------- */

/* An Operational Halt means that there has been an interruption of service on the identified security impacting only the designated Market Center. */
typedef OperationalHaltMessage {
  byte stock[8];
  byte market_code;
  byte operational_halt_action
};

int operational_halt_message_at;

/* every byte of Operational Halt Message set to one value */
inline fill_operational_halt_message(operational_halt_message_record, operational_halt_message_value) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> operational_halt_message_record.stock[operational_halt_message_at] = operational_halt_message_value; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_record.market_code = operational_halt_message_value;
  operational_halt_message_record.operational_halt_action = operational_halt_message_value;
  skip
}

/* each byte of Operational Halt Message set to where it lies, so a field read out of place says so */
inline ramp_operational_halt_message(operational_halt_message_record, operational_halt_message_base) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> operational_halt_message_record.stock[operational_halt_message_at] = (operational_halt_message_base + 0 + operational_halt_message_at + 1) % 256; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_record.market_code = (operational_halt_message_base + 8 + 1) % 256;
  operational_halt_message_record.operational_halt_action = (operational_halt_message_base + 9 + 1) % 256;
  skip
}

/* Operational Halt Message to the wire, 10 bytes from where the cursor stands */
inline encode_operational_halt_message(operational_halt_message_record) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> wire[at] = operational_halt_message_record.stock[operational_halt_message_at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  wire[at] = operational_halt_message_record.market_code; at = at + 1;
  wire[at] = operational_halt_message_record.operational_halt_action; at = at + 1;
  skip
}

/* Operational Halt Message off the wire, 10 bytes from where the cursor stands */
inline decode_operational_halt_message(operational_halt_message_record) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> operational_halt_message_record.stock[operational_halt_message_at] = wire[at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_record.market_code = wire[at]; at = at + 1;
  operational_halt_message_record.operational_halt_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Operational Halt Message is what was written, byte for byte */
inline equal_operational_halt_message(operational_halt_message_read, operational_halt_message_written) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> assert(operational_halt_message_read.stock[operational_halt_message_at] == operational_halt_message_written.stock[operational_halt_message_at]); operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  assert(operational_halt_message_read.market_code == operational_halt_message_written.market_code);
  assert(operational_halt_message_read.operational_halt_action == operational_halt_message_written.operational_halt_action);
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
    assert(at == 20);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 20);
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
    assert(at == 11);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 11);
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
    assert(at == 32);
    at = 0;
    decode_trade_report_message(trade_report_message_got);
    assert(at == 32);
    equal_trade_report_message(trade_report_message_got, trade_report_message_sent)
  }
}

/* Long Form Trade Report Message: encoded, read back, and compared */
proctype check_long_form_trade_report_message() {
  LongFormTradeReportMessage long_form_trade_report_message_sent;
  LongFormTradeReportMessage long_form_trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_form_trade_report_message(long_form_trade_report_message_sent, 0)
  :: pattern == 1 -> fill_long_form_trade_report_message(long_form_trade_report_message_sent, 32)
  :: pattern == 2 -> fill_long_form_trade_report_message(long_form_trade_report_message_sent, 255)
  :: else -> ramp_long_form_trade_report_message(long_form_trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_form_trade_report_message(long_form_trade_report_message_sent);
    assert(at == 36);
    at = 0;
    decode_long_form_trade_report_message(long_form_trade_report_message_got);
    assert(at == 36);
    equal_long_form_trade_report_message(long_form_trade_report_message_got, long_form_trade_report_message_sent)
  }
}

/* Next Shares Trade Report Message: encoded, read back, and compared */
proctype check_next_shares_trade_report_message() {
  NextSharesTradeReportMessage next_shares_trade_report_message_sent;
  NextSharesTradeReportMessage next_shares_trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_next_shares_trade_report_message(next_shares_trade_report_message_sent, 0)
  :: pattern == 1 -> fill_next_shares_trade_report_message(next_shares_trade_report_message_sent, 32)
  :: pattern == 2 -> fill_next_shares_trade_report_message(next_shares_trade_report_message_sent, 255)
  :: else -> ramp_next_shares_trade_report_message(next_shares_trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_next_shares_trade_report_message(next_shares_trade_report_message_sent);
    assert(at == 36);
    at = 0;
    decode_next_shares_trade_report_message(next_shares_trade_report_message_got);
    assert(at == 36);
    equal_next_shares_trade_report_message(next_shares_trade_report_message_got, next_shares_trade_report_message_sent)
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
    assert(at == 32);
    at = 0;
    decode_trade_cancel_error_message(trade_cancel_error_message_got);
    assert(at == 32);
    equal_trade_cancel_error_message(trade_cancel_error_message_got, trade_cancel_error_message_sent)
  }
}

/* Long Form Trade Cancel Error Message: encoded, read back, and compared */
proctype check_long_form_trade_cancel_error_message() {
  LongFormTradeCancelErrorMessage long_form_trade_cancel_error_message_sent;
  LongFormTradeCancelErrorMessage long_form_trade_cancel_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_form_trade_cancel_error_message(long_form_trade_cancel_error_message_sent, 0)
  :: pattern == 1 -> fill_long_form_trade_cancel_error_message(long_form_trade_cancel_error_message_sent, 32)
  :: pattern == 2 -> fill_long_form_trade_cancel_error_message(long_form_trade_cancel_error_message_sent, 255)
  :: else -> ramp_long_form_trade_cancel_error_message(long_form_trade_cancel_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_form_trade_cancel_error_message(long_form_trade_cancel_error_message_sent);
    assert(at == 36);
    at = 0;
    decode_long_form_trade_cancel_error_message(long_form_trade_cancel_error_message_got);
    assert(at == 36);
    equal_long_form_trade_cancel_error_message(long_form_trade_cancel_error_message_got, long_form_trade_cancel_error_message_sent)
  }
}

/* Next Shares Trade Cancel Error Message: encoded, read back, and compared */
proctype check_next_shares_trade_cancel_error_message() {
  NextSharesTradeCancelErrorMessage next_shares_trade_cancel_error_message_sent;
  NextSharesTradeCancelErrorMessage next_shares_trade_cancel_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_next_shares_trade_cancel_error_message(next_shares_trade_cancel_error_message_sent, 0)
  :: pattern == 1 -> fill_next_shares_trade_cancel_error_message(next_shares_trade_cancel_error_message_sent, 32)
  :: pattern == 2 -> fill_next_shares_trade_cancel_error_message(next_shares_trade_cancel_error_message_sent, 255)
  :: else -> ramp_next_shares_trade_cancel_error_message(next_shares_trade_cancel_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_next_shares_trade_cancel_error_message(next_shares_trade_cancel_error_message_sent);
    assert(at == 36);
    at = 0;
    decode_next_shares_trade_cancel_error_message(next_shares_trade_cancel_error_message_got);
    assert(at == 36);
    equal_next_shares_trade_cancel_error_message(next_shares_trade_cancel_error_message_got, next_shares_trade_cancel_error_message_sent)
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
    assert(at == 54);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 54);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* Long Form Trade Correction Message: encoded, read back, and compared */
proctype check_long_form_trade_correction_message() {
  LongFormTradeCorrectionMessage long_form_trade_correction_message_sent;
  LongFormTradeCorrectionMessage long_form_trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_form_trade_correction_message(long_form_trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_long_form_trade_correction_message(long_form_trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_long_form_trade_correction_message(long_form_trade_correction_message_sent, 255)
  :: else -> ramp_long_form_trade_correction_message(long_form_trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_form_trade_correction_message(long_form_trade_correction_message_sent);
    assert(at == 62);
    at = 0;
    decode_long_form_trade_correction_message(long_form_trade_correction_message_got);
    assert(at == 62);
    equal_long_form_trade_correction_message(long_form_trade_correction_message_got, long_form_trade_correction_message_sent)
  }
}

/* Next Shares Trade Correction Message: encoded, read back, and compared */
proctype check_next_shares_trade_correction_message() {
  NextSharesTradeCorrectionMessage next_shares_trade_correction_message_sent;
  NextSharesTradeCorrectionMessage next_shares_trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_next_shares_trade_correction_message(next_shares_trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_next_shares_trade_correction_message(next_shares_trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_next_shares_trade_correction_message(next_shares_trade_correction_message_sent, 255)
  :: else -> ramp_next_shares_trade_correction_message(next_shares_trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_next_shares_trade_correction_message(next_shares_trade_correction_message_sent);
    assert(at == 62);
    at = 0;
    decode_next_shares_trade_correction_message(next_shares_trade_correction_message_got);
    assert(at == 62);
    equal_next_shares_trade_correction_message(next_shares_trade_correction_message_got, next_shares_trade_correction_message_sent)
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
    assert(at == 40);
    at = 0;
    decode_stock_directory_message(stock_directory_message_got);
    assert(at == 40);
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
    assert(at == 13);
    at = 0;
    decode_adjusted_closing_price_message(adjusted_closing_price_message_got);
    assert(at == 13);
    equal_adjusted_closing_price_message(adjusted_closing_price_message_got, adjusted_closing_price_message_sent)
  }
}

/* Long Form Adjusted Closing Price Message: encoded, read back, and compared */
proctype check_long_form_adjusted_closing_price_message() {
  LongFormAdjustedClosingPriceMessage long_form_adjusted_closing_price_message_sent;
  LongFormAdjustedClosingPriceMessage long_form_adjusted_closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_form_adjusted_closing_price_message(long_form_adjusted_closing_price_message_sent, 0)
  :: pattern == 1 -> fill_long_form_adjusted_closing_price_message(long_form_adjusted_closing_price_message_sent, 32)
  :: pattern == 2 -> fill_long_form_adjusted_closing_price_message(long_form_adjusted_closing_price_message_sent, 255)
  :: else -> ramp_long_form_adjusted_closing_price_message(long_form_adjusted_closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_form_adjusted_closing_price_message(long_form_adjusted_closing_price_message_sent);
    assert(at == 17);
    at = 0;
    decode_long_form_adjusted_closing_price_message(long_form_adjusted_closing_price_message_got);
    assert(at == 17);
    equal_long_form_adjusted_closing_price_message(long_form_adjusted_closing_price_message_got, long_form_adjusted_closing_price_message_sent)
  }
}

/* Mwcb Decline Level Message: encoded, read back, and compared */
proctype check_mwcb_decline_level_message() {
  MwcbDeclineLevelMessage mwcb_decline_level_message_sent;
  MwcbDeclineLevelMessage mwcb_decline_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mwcb_decline_level_message(mwcb_decline_level_message_sent, 0)
  :: pattern == 1 -> fill_mwcb_decline_level_message(mwcb_decline_level_message_sent, 32)
  :: pattern == 2 -> fill_mwcb_decline_level_message(mwcb_decline_level_message_sent, 255)
  :: else -> ramp_mwcb_decline_level_message(mwcb_decline_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mwcb_decline_level_message(mwcb_decline_level_message_sent);
    assert(at == 24);
    at = 0;
    decode_mwcb_decline_level_message(mwcb_decline_level_message_got);
    assert(at == 24);
    equal_mwcb_decline_level_message(mwcb_decline_level_message_got, mwcb_decline_level_message_sent)
  }
}

/* Mwcb Status Message: encoded, read back, and compared */
proctype check_mwcb_status_message() {
  MwcbStatusMessage mwcb_status_message_sent;
  MwcbStatusMessage mwcb_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mwcb_status_message(mwcb_status_message_sent, 0)
  :: pattern == 1 -> fill_mwcb_status_message(mwcb_status_message_sent, 32)
  :: pattern == 2 -> fill_mwcb_status_message(mwcb_status_message_sent, 255)
  :: else -> ramp_mwcb_status_message(mwcb_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mwcb_status_message(mwcb_status_message_sent);
    assert(at == 1);
    at = 0;
    decode_mwcb_status_message(mwcb_status_message_got);
    assert(at == 1);
    equal_mwcb_status_message(mwcb_status_message_got, mwcb_status_message_sent)
  }
}

/* Ipo Quoting Period Update Message: encoded, read back, and compared */
proctype check_ipo_quoting_period_update_message() {
  IpoQuotingPeriodUpdateMessage ipo_quoting_period_update_message_sent;
  IpoQuotingPeriodUpdateMessage ipo_quoting_period_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent, 0)
  :: pattern == 1 -> fill_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent, 32)
  :: pattern == 2 -> fill_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent, 255)
  :: else -> ramp_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent);
    assert(at == 17);
    at = 0;
    decode_ipo_quoting_period_update_message(ipo_quoting_period_update_message_got);
    assert(at == 17);
    equal_ipo_quoting_period_update_message(ipo_quoting_period_update_message_got, ipo_quoting_period_update_message_sent)
  }
}

/* Operational Halt Message: encoded, read back, and compared */
proctype check_operational_halt_message() {
  OperationalHaltMessage operational_halt_message_sent;
  OperationalHaltMessage operational_halt_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_operational_halt_message(operational_halt_message_sent, 0)
  :: pattern == 1 -> fill_operational_halt_message(operational_halt_message_sent, 32)
  :: pattern == 2 -> fill_operational_halt_message(operational_halt_message_sent, 255)
  :: else -> ramp_operational_halt_message(operational_halt_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_operational_halt_message(operational_halt_message_sent);
    assert(at == 10);
    at = 0;
    decode_operational_halt_message(operational_halt_message_got);
    assert(at == 10);
    equal_operational_halt_message(operational_halt_message_got, operational_halt_message_sent)
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
  :: run check_long_form_trade_report_message()
  :: run check_next_shares_trade_report_message()
  :: run check_original_sale_condition_modifier()
  :: run check_trade_cancel_error_message()
  :: run check_long_form_trade_cancel_error_message()
  :: run check_next_shares_trade_cancel_error_message()
  :: run check_corrected_sale_condition_modifier()
  :: run check_trade_correction_message()
  :: run check_long_form_trade_correction_message()
  :: run check_next_shares_trade_correction_message()
  :: run check_stock_trading_action_message()
  :: run check_reg_sho_short_sale_price_test_restricted_indicator_message()
  :: run check_stock_directory_message()
  :: run check_adjusted_closing_price_message()
  :: run check_long_form_adjusted_closing_price_message()
  :: run check_mwcb_decline_level_message()
  :: run check_mwcb_status_message()
  :: run check_ipo_quoting_period_update_message()
  :: run check_operational_halt_message()
  fi
}
