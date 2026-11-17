/*
 * Miami International Holdings Clearing Trade Drop
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
 *   - a run filling what frames it
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 310

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Sesm Packet Header: 3 bytes --------------------------------------------- */

/* SesM packet header */
typedef SesmPacketHeader {
  byte sesm_packet_length[2];
  byte sesm_packet_type
};

int sesm_packet_header_at;

/* every byte of Sesm Packet Header set to one value */
inline fill_sesm_packet_header(sesm_packet_header_record, sesm_packet_header_value) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at] = sesm_packet_header_value; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  sesm_packet_header_record.sesm_packet_type = sesm_packet_header_value;
  skip
}

/* each byte of Sesm Packet Header set to where it lies, so a field read out of place says so */
inline ramp_sesm_packet_header(sesm_packet_header_record, sesm_packet_header_base) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at] = (sesm_packet_header_base + 0 + sesm_packet_header_at + 1) % 256; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  sesm_packet_header_record.sesm_packet_type = (sesm_packet_header_base + 2 + 1) % 256;
  skip
}

/* Sesm Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_sesm_packet_header(sesm_packet_header_record) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> wire[at] = sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at]; at = at + 1; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = sesm_packet_header_record.sesm_packet_type; at = at + 1;
  skip
}

/* Sesm Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_sesm_packet_header(sesm_packet_header_record) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at] = wire[at]; at = at + 1; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  sesm_packet_header_record.sesm_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Sesm Packet Header is what was written, byte for byte */
inline equal_sesm_packet_header(sesm_packet_header_read, sesm_packet_header_written) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> assert(sesm_packet_header_read.sesm_packet_length[sesm_packet_header_at] == sesm_packet_header_written.sesm_packet_length[sesm_packet_header_at]); sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  assert(sesm_packet_header_read.sesm_packet_type == sesm_packet_header_written.sesm_packet_type);
  skip
}

/* ---- System State: 21 bytes -------------------------------------------------- */

/* This message format is used to notify firms of the state changes of the system. Firms can use notifications as triggers in their system to ensure electronic synchronization of systems. */
typedef SystemState {
  byte notification_time[8];
  byte ctd_version[8];
  byte trading_session_id[4];
  byte system_status
};

int system_state_at;

/* every byte of System State set to one value */
inline fill_system_state(system_state_record, system_state_value) {
  system_state_at = 0;
  do
  :: system_state_at < 8 -> system_state_record.notification_time[system_state_at] = system_state_value; system_state_at = system_state_at + 1
  :: else -> break
  od;
  system_state_at = 0;
  do
  :: system_state_at < 8 -> system_state_record.ctd_version[system_state_at] = system_state_value; system_state_at = system_state_at + 1
  :: else -> break
  od;
  system_state_at = 0;
  do
  :: system_state_at < 4 -> system_state_record.trading_session_id[system_state_at] = system_state_value; system_state_at = system_state_at + 1
  :: else -> break
  od;
  system_state_record.system_status = system_state_value;
  skip
}

/* each byte of System State set to where it lies, so a field read out of place says so */
inline ramp_system_state(system_state_record, system_state_base) {
  system_state_at = 0;
  do
  :: system_state_at < 8 -> system_state_record.notification_time[system_state_at] = (system_state_base + 0 + system_state_at + 1) % 256; system_state_at = system_state_at + 1
  :: else -> break
  od;
  system_state_at = 0;
  do
  :: system_state_at < 8 -> system_state_record.ctd_version[system_state_at] = (system_state_base + 8 + system_state_at + 1) % 256; system_state_at = system_state_at + 1
  :: else -> break
  od;
  system_state_at = 0;
  do
  :: system_state_at < 4 -> system_state_record.trading_session_id[system_state_at] = (system_state_base + 16 + system_state_at + 1) % 256; system_state_at = system_state_at + 1
  :: else -> break
  od;
  system_state_record.system_status = (system_state_base + 20 + 1) % 256;
  skip
}

/* System State to the wire, 21 bytes from where the cursor stands */
inline encode_system_state(system_state_record) {
  system_state_at = 0;
  do
  :: system_state_at < 8 -> wire[at] = system_state_record.notification_time[system_state_at]; at = at + 1; system_state_at = system_state_at + 1
  :: else -> break
  od;
  system_state_at = 0;
  do
  :: system_state_at < 8 -> wire[at] = system_state_record.ctd_version[system_state_at]; at = at + 1; system_state_at = system_state_at + 1
  :: else -> break
  od;
  system_state_at = 0;
  do
  :: system_state_at < 4 -> wire[at] = system_state_record.trading_session_id[system_state_at]; at = at + 1; system_state_at = system_state_at + 1
  :: else -> break
  od;
  wire[at] = system_state_record.system_status; at = at + 1;
  skip
}

/* System State off the wire, 21 bytes from where the cursor stands */
inline decode_system_state(system_state_record) {
  system_state_at = 0;
  do
  :: system_state_at < 8 -> system_state_record.notification_time[system_state_at] = wire[at]; at = at + 1; system_state_at = system_state_at + 1
  :: else -> break
  od;
  system_state_at = 0;
  do
  :: system_state_at < 8 -> system_state_record.ctd_version[system_state_at] = wire[at]; at = at + 1; system_state_at = system_state_at + 1
  :: else -> break
  od;
  system_state_at = 0;
  do
  :: system_state_at < 4 -> system_state_record.trading_session_id[system_state_at] = wire[at]; at = at + 1; system_state_at = system_state_at + 1
  :: else -> break
  od;
  system_state_record.system_status = wire[at]; at = at + 1;
  skip
}

/* what was read of System State is what was written, byte for byte */
inline equal_system_state(system_state_read, system_state_written) {
  system_state_at = 0;
  do
  :: system_state_at < 8 -> assert(system_state_read.notification_time[system_state_at] == system_state_written.notification_time[system_state_at]); system_state_at = system_state_at + 1
  :: else -> break
  od;
  system_state_at = 0;
  do
  :: system_state_at < 8 -> assert(system_state_read.ctd_version[system_state_at] == system_state_written.ctd_version[system_state_at]); system_state_at = system_state_at + 1
  :: else -> break
  od;
  system_state_at = 0;
  do
  :: system_state_at < 4 -> assert(system_state_read.trading_session_id[system_state_at] == system_state_written.trading_session_id[system_state_at]); system_state_at = system_state_at + 1
  :: else -> break
  od;
  assert(system_state_read.system_status == system_state_written.system_status);
  skip
}

/* ---- Trade Message: 310 bytes ------------------------------------------------ */

/* This is the message format that will be used to disseminate all Emerald trade-related content for entitled parties. Emerald sends trades, trade corrections and trade cancels using this message. This is a sequenced message. */
typedef TradeMessage {
  byte processing_time[8];
  byte trade_time[8];
  byte trade_as_of_date[4];
  byte trade_action;
  byte trade_type;
  byte trade_id[4];
  byte execution_id[8];
  byte correction_number;
  byte transaction_id[4];
  byte reference_trade_time[8];
  byte reference_trade_id[4];
  byte reference_correction_number;
  byte correction_type;
  byte event_id[4];
  byte strategy_id[4];
  byte reserved_12[12];
  byte product_id[4];
  byte underlying_symbol[11];
  byte underlying_type;
  byte security_symbol[6];
  byte expiration_date[4];
  byte strike_price[4];
  byte call_or_put;
  byte reserved_8[8];
  byte side;
  byte price[4];
  byte size[4];
  byte trade_condition;
  byte second_reserved_8[8];
  byte class_fee_type;
  byte emerald_bbo_posting_increment_indicator;
  byte execution_exchange;
  byte routed_order_quantity[4];
  byte market_maker_role;
  byte traded_with_directed_mm;
  byte market_state;
  byte auction_type;
  byte directed_status;
  byte strategy_state;
  byte strategy_auction_type;
  byte stock_execution_destination;
  byte contra_liquidity_type;
  byte second_reserved_12[12];
  byte executing_mpid[4];
  byte order_date[4];
  byte fix_order_id[30];
  byte client_message_id[4];
  byte bulk_quote_index;
  byte open_close_indicator;
  byte liquidity_type;
  byte mm_priority_indicator;
  byte liquidity_indicator;
  byte liquidity_timer_role;
  byte time_in_force;
  byte billing_mpid[4];
  byte leg_reference_id[5];
  byte strategy_timer_role;
  byte stock_short_sell_indicator;
  byte reserved_4[4];
  byte clearing_mpid[4];
  byte member_type;
  byte origin;
  byte clearing_number[4];
  byte cmta[4];
  byte multi_account[5];
  byte account_id[10];
  byte supplementary_id[13];
  byte allocation_id[4];
  byte billing_clearing_number[4];
  byte order_capacity;
  byte reserved_7[7];
  byte mpid[4];
  byte contra_member_type;
  byte contra_origin;
  byte contra_clearing_number[4];
  byte contra_cmta[4];
  byte contra_time_in_force;
  byte contra_liquidity_timer_role;
  byte contra_strategy_timer_role;
  byte contra_order_capacity;
  byte third_reserved_12[12]
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.processing_time[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_time[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_as_of_date[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_action = trade_message_value;
  trade_message_record.trade_type = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.execution_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.correction_number = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.transaction_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.reference_trade_time[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.reference_trade_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.reference_correction_number = trade_message_value;
  trade_message_record.correction_type = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.event_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.strategy_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.reserved_12[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.product_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> trade_message_record.underlying_symbol[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.underlying_type = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.security_symbol[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.expiration_date[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.strike_price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.call_or_put = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.reserved_8[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.size[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_condition = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.second_reserved_8[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.class_fee_type = trade_message_value;
  trade_message_record.emerald_bbo_posting_increment_indicator = trade_message_value;
  trade_message_record.execution_exchange = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.routed_order_quantity[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.market_maker_role = trade_message_value;
  trade_message_record.traded_with_directed_mm = trade_message_value;
  trade_message_record.market_state = trade_message_value;
  trade_message_record.auction_type = trade_message_value;
  trade_message_record.directed_status = trade_message_value;
  trade_message_record.strategy_state = trade_message_value;
  trade_message_record.strategy_auction_type = trade_message_value;
  trade_message_record.stock_execution_destination = trade_message_value;
  trade_message_record.contra_liquidity_type = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.second_reserved_12[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.executing_mpid[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.order_date[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 30 -> trade_message_record.fix_order_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.client_message_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.bulk_quote_index = trade_message_value;
  trade_message_record.open_close_indicator = trade_message_value;
  trade_message_record.liquidity_type = trade_message_value;
  trade_message_record.mm_priority_indicator = trade_message_value;
  trade_message_record.liquidity_indicator = trade_message_value;
  trade_message_record.liquidity_timer_role = trade_message_value;
  trade_message_record.time_in_force = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.billing_mpid[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> trade_message_record.leg_reference_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.strategy_timer_role = trade_message_value;
  trade_message_record.stock_short_sell_indicator = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.reserved_4[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.clearing_mpid[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.member_type = trade_message_value;
  trade_message_record.origin = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.clearing_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.cmta[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> trade_message_record.multi_account[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> trade_message_record.account_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 13 -> trade_message_record.supplementary_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.allocation_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.billing_clearing_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.order_capacity = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 7 -> trade_message_record.reserved_7[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.mpid[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.contra_member_type = trade_message_value;
  trade_message_record.contra_origin = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.contra_clearing_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.contra_cmta[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.contra_time_in_force = trade_message_value;
  trade_message_record.contra_liquidity_timer_role = trade_message_value;
  trade_message_record.contra_strategy_timer_role = trade_message_value;
  trade_message_record.contra_order_capacity = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.third_reserved_12[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.processing_time[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_time[trade_message_at] = (trade_message_base + 8 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_as_of_date[trade_message_at] = (trade_message_base + 16 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_action = (trade_message_base + 20 + 1) % 256;
  trade_message_record.trade_type = (trade_message_base + 21 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_id[trade_message_at] = (trade_message_base + 22 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.execution_id[trade_message_at] = (trade_message_base + 26 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.correction_number = (trade_message_base + 34 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.transaction_id[trade_message_at] = (trade_message_base + 35 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.reference_trade_time[trade_message_at] = (trade_message_base + 39 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.reference_trade_id[trade_message_at] = (trade_message_base + 47 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.reference_correction_number = (trade_message_base + 51 + 1) % 256;
  trade_message_record.correction_type = (trade_message_base + 52 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.event_id[trade_message_at] = (trade_message_base + 53 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.strategy_id[trade_message_at] = (trade_message_base + 57 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.reserved_12[trade_message_at] = (trade_message_base + 61 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.product_id[trade_message_at] = (trade_message_base + 73 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> trade_message_record.underlying_symbol[trade_message_at] = (trade_message_base + 77 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.underlying_type = (trade_message_base + 88 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.security_symbol[trade_message_at] = (trade_message_base + 89 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.expiration_date[trade_message_at] = (trade_message_base + 95 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.strike_price[trade_message_at] = (trade_message_base + 99 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.call_or_put = (trade_message_base + 103 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.reserved_8[trade_message_at] = (trade_message_base + 104 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side = (trade_message_base + 112 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = (trade_message_base + 113 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.size[trade_message_at] = (trade_message_base + 117 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_condition = (trade_message_base + 121 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.second_reserved_8[trade_message_at] = (trade_message_base + 122 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.class_fee_type = (trade_message_base + 130 + 1) % 256;
  trade_message_record.emerald_bbo_posting_increment_indicator = (trade_message_base + 131 + 1) % 256;
  trade_message_record.execution_exchange = (trade_message_base + 132 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.routed_order_quantity[trade_message_at] = (trade_message_base + 133 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.market_maker_role = (trade_message_base + 137 + 1) % 256;
  trade_message_record.traded_with_directed_mm = (trade_message_base + 138 + 1) % 256;
  trade_message_record.market_state = (trade_message_base + 139 + 1) % 256;
  trade_message_record.auction_type = (trade_message_base + 140 + 1) % 256;
  trade_message_record.directed_status = (trade_message_base + 141 + 1) % 256;
  trade_message_record.strategy_state = (trade_message_base + 142 + 1) % 256;
  trade_message_record.strategy_auction_type = (trade_message_base + 143 + 1) % 256;
  trade_message_record.stock_execution_destination = (trade_message_base + 144 + 1) % 256;
  trade_message_record.contra_liquidity_type = (trade_message_base + 145 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.second_reserved_12[trade_message_at] = (trade_message_base + 146 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.executing_mpid[trade_message_at] = (trade_message_base + 158 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.order_date[trade_message_at] = (trade_message_base + 162 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 30 -> trade_message_record.fix_order_id[trade_message_at] = (trade_message_base + 166 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.client_message_id[trade_message_at] = (trade_message_base + 196 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.bulk_quote_index = (trade_message_base + 200 + 1) % 256;
  trade_message_record.open_close_indicator = (trade_message_base + 201 + 1) % 256;
  trade_message_record.liquidity_type = (trade_message_base + 202 + 1) % 256;
  trade_message_record.mm_priority_indicator = (trade_message_base + 203 + 1) % 256;
  trade_message_record.liquidity_indicator = (trade_message_base + 204 + 1) % 256;
  trade_message_record.liquidity_timer_role = (trade_message_base + 205 + 1) % 256;
  trade_message_record.time_in_force = (trade_message_base + 206 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.billing_mpid[trade_message_at] = (trade_message_base + 207 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> trade_message_record.leg_reference_id[trade_message_at] = (trade_message_base + 211 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.strategy_timer_role = (trade_message_base + 216 + 1) % 256;
  trade_message_record.stock_short_sell_indicator = (trade_message_base + 217 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.reserved_4[trade_message_at] = (trade_message_base + 218 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.clearing_mpid[trade_message_at] = (trade_message_base + 222 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.member_type = (trade_message_base + 226 + 1) % 256;
  trade_message_record.origin = (trade_message_base + 227 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.clearing_number[trade_message_at] = (trade_message_base + 228 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.cmta[trade_message_at] = (trade_message_base + 232 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> trade_message_record.multi_account[trade_message_at] = (trade_message_base + 236 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> trade_message_record.account_id[trade_message_at] = (trade_message_base + 241 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 13 -> trade_message_record.supplementary_id[trade_message_at] = (trade_message_base + 251 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.allocation_id[trade_message_at] = (trade_message_base + 264 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.billing_clearing_number[trade_message_at] = (trade_message_base + 268 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.order_capacity = (trade_message_base + 272 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 7 -> trade_message_record.reserved_7[trade_message_at] = (trade_message_base + 273 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.mpid[trade_message_at] = (trade_message_base + 280 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.contra_member_type = (trade_message_base + 284 + 1) % 256;
  trade_message_record.contra_origin = (trade_message_base + 285 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.contra_clearing_number[trade_message_at] = (trade_message_base + 286 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.contra_cmta[trade_message_at] = (trade_message_base + 290 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.contra_time_in_force = (trade_message_base + 294 + 1) % 256;
  trade_message_record.contra_liquidity_timer_role = (trade_message_base + 295 + 1) % 256;
  trade_message_record.contra_strategy_timer_role = (trade_message_base + 296 + 1) % 256;
  trade_message_record.contra_order_capacity = (trade_message_base + 297 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.third_reserved_12[trade_message_at] = (trade_message_base + 298 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 310 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.processing_time[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.trade_time[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.trade_as_of_date[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.trade_action; at = at + 1;
  wire[at] = trade_message_record.trade_type; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.trade_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.execution_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.correction_number; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.transaction_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.reference_trade_time[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.reference_trade_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.reference_correction_number; at = at + 1;
  wire[at] = trade_message_record.correction_type; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.event_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.strategy_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> wire[at] = trade_message_record.reserved_12[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.product_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> wire[at] = trade_message_record.underlying_symbol[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.underlying_type; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> wire[at] = trade_message_record.security_symbol[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.expiration_date[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.strike_price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.call_or_put; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.reserved_8[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.side; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.size[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.trade_condition; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.second_reserved_8[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.class_fee_type; at = at + 1;
  wire[at] = trade_message_record.emerald_bbo_posting_increment_indicator; at = at + 1;
  wire[at] = trade_message_record.execution_exchange; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.routed_order_quantity[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.market_maker_role; at = at + 1;
  wire[at] = trade_message_record.traded_with_directed_mm; at = at + 1;
  wire[at] = trade_message_record.market_state; at = at + 1;
  wire[at] = trade_message_record.auction_type; at = at + 1;
  wire[at] = trade_message_record.directed_status; at = at + 1;
  wire[at] = trade_message_record.strategy_state; at = at + 1;
  wire[at] = trade_message_record.strategy_auction_type; at = at + 1;
  wire[at] = trade_message_record.stock_execution_destination; at = at + 1;
  wire[at] = trade_message_record.contra_liquidity_type; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> wire[at] = trade_message_record.second_reserved_12[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.executing_mpid[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.order_date[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 30 -> wire[at] = trade_message_record.fix_order_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.client_message_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.bulk_quote_index; at = at + 1;
  wire[at] = trade_message_record.open_close_indicator; at = at + 1;
  wire[at] = trade_message_record.liquidity_type; at = at + 1;
  wire[at] = trade_message_record.mm_priority_indicator; at = at + 1;
  wire[at] = trade_message_record.liquidity_indicator; at = at + 1;
  wire[at] = trade_message_record.liquidity_timer_role; at = at + 1;
  wire[at] = trade_message_record.time_in_force; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.billing_mpid[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> wire[at] = trade_message_record.leg_reference_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.strategy_timer_role; at = at + 1;
  wire[at] = trade_message_record.stock_short_sell_indicator; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.reserved_4[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.clearing_mpid[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.member_type; at = at + 1;
  wire[at] = trade_message_record.origin; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.clearing_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.cmta[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> wire[at] = trade_message_record.multi_account[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> wire[at] = trade_message_record.account_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 13 -> wire[at] = trade_message_record.supplementary_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.allocation_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.billing_clearing_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.order_capacity; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 7 -> wire[at] = trade_message_record.reserved_7[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.mpid[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.contra_member_type; at = at + 1;
  wire[at] = trade_message_record.contra_origin; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.contra_clearing_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.contra_cmta[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.contra_time_in_force; at = at + 1;
  wire[at] = trade_message_record.contra_liquidity_timer_role; at = at + 1;
  wire[at] = trade_message_record.contra_strategy_timer_role; at = at + 1;
  wire[at] = trade_message_record.contra_order_capacity; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> wire[at] = trade_message_record.third_reserved_12[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 310 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.processing_time[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_time[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_as_of_date[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_action = wire[at]; at = at + 1;
  trade_message_record.trade_type = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.execution_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.correction_number = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.transaction_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.reference_trade_time[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.reference_trade_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.reference_correction_number = wire[at]; at = at + 1;
  trade_message_record.correction_type = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.event_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.strategy_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.reserved_12[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.product_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> trade_message_record.underlying_symbol[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.underlying_type = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.security_symbol[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.expiration_date[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.strike_price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.call_or_put = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.reserved_8[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.size[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.trade_condition = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.second_reserved_8[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.class_fee_type = wire[at]; at = at + 1;
  trade_message_record.emerald_bbo_posting_increment_indicator = wire[at]; at = at + 1;
  trade_message_record.execution_exchange = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.routed_order_quantity[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.market_maker_role = wire[at]; at = at + 1;
  trade_message_record.traded_with_directed_mm = wire[at]; at = at + 1;
  trade_message_record.market_state = wire[at]; at = at + 1;
  trade_message_record.auction_type = wire[at]; at = at + 1;
  trade_message_record.directed_status = wire[at]; at = at + 1;
  trade_message_record.strategy_state = wire[at]; at = at + 1;
  trade_message_record.strategy_auction_type = wire[at]; at = at + 1;
  trade_message_record.stock_execution_destination = wire[at]; at = at + 1;
  trade_message_record.contra_liquidity_type = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.second_reserved_12[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.executing_mpid[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.order_date[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 30 -> trade_message_record.fix_order_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.client_message_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.bulk_quote_index = wire[at]; at = at + 1;
  trade_message_record.open_close_indicator = wire[at]; at = at + 1;
  trade_message_record.liquidity_type = wire[at]; at = at + 1;
  trade_message_record.mm_priority_indicator = wire[at]; at = at + 1;
  trade_message_record.liquidity_indicator = wire[at]; at = at + 1;
  trade_message_record.liquidity_timer_role = wire[at]; at = at + 1;
  trade_message_record.time_in_force = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.billing_mpid[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> trade_message_record.leg_reference_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.strategy_timer_role = wire[at]; at = at + 1;
  trade_message_record.stock_short_sell_indicator = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.reserved_4[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.clearing_mpid[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.member_type = wire[at]; at = at + 1;
  trade_message_record.origin = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.clearing_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.cmta[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> trade_message_record.multi_account[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> trade_message_record.account_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 13 -> trade_message_record.supplementary_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.allocation_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.billing_clearing_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.order_capacity = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 7 -> trade_message_record.reserved_7[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.mpid[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.contra_member_type = wire[at]; at = at + 1;
  trade_message_record.contra_origin = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.contra_clearing_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.contra_cmta[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.contra_time_in_force = wire[at]; at = at + 1;
  trade_message_record.contra_liquidity_timer_role = wire[at]; at = at + 1;
  trade_message_record.contra_strategy_timer_role = wire[at]; at = at + 1;
  trade_message_record.contra_order_capacity = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.third_reserved_12[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.processing_time[trade_message_at] == trade_message_written.processing_time[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.trade_time[trade_message_at] == trade_message_written.trade_time[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.trade_as_of_date[trade_message_at] == trade_message_written.trade_as_of_date[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.trade_action == trade_message_written.trade_action);
  assert(trade_message_read.trade_type == trade_message_written.trade_type);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.trade_id[trade_message_at] == trade_message_written.trade_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.execution_id[trade_message_at] == trade_message_written.execution_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.correction_number == trade_message_written.correction_number);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.transaction_id[trade_message_at] == trade_message_written.transaction_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.reference_trade_time[trade_message_at] == trade_message_written.reference_trade_time[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.reference_trade_id[trade_message_at] == trade_message_written.reference_trade_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.reference_correction_number == trade_message_written.reference_correction_number);
  assert(trade_message_read.correction_type == trade_message_written.correction_type);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.event_id[trade_message_at] == trade_message_written.event_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.strategy_id[trade_message_at] == trade_message_written.strategy_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> assert(trade_message_read.reserved_12[trade_message_at] == trade_message_written.reserved_12[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.product_id[trade_message_at] == trade_message_written.product_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> assert(trade_message_read.underlying_symbol[trade_message_at] == trade_message_written.underlying_symbol[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.underlying_type == trade_message_written.underlying_type);
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> assert(trade_message_read.security_symbol[trade_message_at] == trade_message_written.security_symbol[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.expiration_date[trade_message_at] == trade_message_written.expiration_date[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.strike_price[trade_message_at] == trade_message_written.strike_price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.call_or_put == trade_message_written.call_or_put);
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.reserved_8[trade_message_at] == trade_message_written.reserved_8[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.side == trade_message_written.side);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.size[trade_message_at] == trade_message_written.size[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.trade_condition == trade_message_written.trade_condition);
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.second_reserved_8[trade_message_at] == trade_message_written.second_reserved_8[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.class_fee_type == trade_message_written.class_fee_type);
  assert(trade_message_read.emerald_bbo_posting_increment_indicator == trade_message_written.emerald_bbo_posting_increment_indicator);
  assert(trade_message_read.execution_exchange == trade_message_written.execution_exchange);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.routed_order_quantity[trade_message_at] == trade_message_written.routed_order_quantity[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.market_maker_role == trade_message_written.market_maker_role);
  assert(trade_message_read.traded_with_directed_mm == trade_message_written.traded_with_directed_mm);
  assert(trade_message_read.market_state == trade_message_written.market_state);
  assert(trade_message_read.auction_type == trade_message_written.auction_type);
  assert(trade_message_read.directed_status == trade_message_written.directed_status);
  assert(trade_message_read.strategy_state == trade_message_written.strategy_state);
  assert(trade_message_read.strategy_auction_type == trade_message_written.strategy_auction_type);
  assert(trade_message_read.stock_execution_destination == trade_message_written.stock_execution_destination);
  assert(trade_message_read.contra_liquidity_type == trade_message_written.contra_liquidity_type);
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> assert(trade_message_read.second_reserved_12[trade_message_at] == trade_message_written.second_reserved_12[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.executing_mpid[trade_message_at] == trade_message_written.executing_mpid[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.order_date[trade_message_at] == trade_message_written.order_date[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 30 -> assert(trade_message_read.fix_order_id[trade_message_at] == trade_message_written.fix_order_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.client_message_id[trade_message_at] == trade_message_written.client_message_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.bulk_quote_index == trade_message_written.bulk_quote_index);
  assert(trade_message_read.open_close_indicator == trade_message_written.open_close_indicator);
  assert(trade_message_read.liquidity_type == trade_message_written.liquidity_type);
  assert(trade_message_read.mm_priority_indicator == trade_message_written.mm_priority_indicator);
  assert(trade_message_read.liquidity_indicator == trade_message_written.liquidity_indicator);
  assert(trade_message_read.liquidity_timer_role == trade_message_written.liquidity_timer_role);
  assert(trade_message_read.time_in_force == trade_message_written.time_in_force);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.billing_mpid[trade_message_at] == trade_message_written.billing_mpid[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> assert(trade_message_read.leg_reference_id[trade_message_at] == trade_message_written.leg_reference_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.strategy_timer_role == trade_message_written.strategy_timer_role);
  assert(trade_message_read.stock_short_sell_indicator == trade_message_written.stock_short_sell_indicator);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.reserved_4[trade_message_at] == trade_message_written.reserved_4[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.clearing_mpid[trade_message_at] == trade_message_written.clearing_mpid[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.member_type == trade_message_written.member_type);
  assert(trade_message_read.origin == trade_message_written.origin);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.clearing_number[trade_message_at] == trade_message_written.clearing_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.cmta[trade_message_at] == trade_message_written.cmta[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> assert(trade_message_read.multi_account[trade_message_at] == trade_message_written.multi_account[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> assert(trade_message_read.account_id[trade_message_at] == trade_message_written.account_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 13 -> assert(trade_message_read.supplementary_id[trade_message_at] == trade_message_written.supplementary_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.allocation_id[trade_message_at] == trade_message_written.allocation_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.billing_clearing_number[trade_message_at] == trade_message_written.billing_clearing_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.order_capacity == trade_message_written.order_capacity);
  trade_message_at = 0;
  do
  :: trade_message_at < 7 -> assert(trade_message_read.reserved_7[trade_message_at] == trade_message_written.reserved_7[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.mpid[trade_message_at] == trade_message_written.mpid[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.contra_member_type == trade_message_written.contra_member_type);
  assert(trade_message_read.contra_origin == trade_message_written.contra_origin);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.contra_clearing_number[trade_message_at] == trade_message_written.contra_clearing_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.contra_cmta[trade_message_at] == trade_message_written.contra_cmta[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.contra_time_in_force == trade_message_written.contra_time_in_force);
  assert(trade_message_read.contra_liquidity_timer_role == trade_message_written.contra_liquidity_timer_role);
  assert(trade_message_read.contra_strategy_timer_role == trade_message_written.contra_strategy_timer_role);
  assert(trade_message_read.contra_order_capacity == trade_message_written.contra_order_capacity);
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> assert(trade_message_read.third_reserved_12[trade_message_at] == trade_message_written.third_reserved_12[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Risk Notification Message: 160 bytes ------------------------------------ */

/* Firms configured to use Risk Protection Monitoring will receive User Notification communicating the status of Risk checks. Field Event Type is used to determine the reason for the notification. The following message will be used to disseminate all Emerald Risk Protection Monitor (RPM) related notifications. Sequenced and UnSequenced Pkt based on Event Type: solicited event types (T, R, W, D, A, P, U) are Sequenced messages at the SesM protocol level and recoverable; unsolicited (S) are Unsequenced and not recoverable. */
typedef RiskNotificationMessage {
  byte processing_time[8];
  byte mpid_group_id[32];
  byte metric_id[32];
  byte route_id[32];
  byte metric_type;
  byte protection_type;
  byte event_type;
  byte event_id[4];
  byte configured_counting_time_period[4];
  byte configured_max_quantity[4];
  byte current_quantity[4];
  byte max_peak_quantity[4];
  byte percentage_level;
  byte reserved_32[32]
};

int risk_notification_message_at;

/* every byte of Risk Notification Message set to one value */
inline fill_risk_notification_message(risk_notification_message_record, risk_notification_message_value) {
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 8 -> risk_notification_message_record.processing_time[risk_notification_message_at] = risk_notification_message_value; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> risk_notification_message_record.mpid_group_id[risk_notification_message_at] = risk_notification_message_value; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> risk_notification_message_record.metric_id[risk_notification_message_at] = risk_notification_message_value; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> risk_notification_message_record.route_id[risk_notification_message_at] = risk_notification_message_value; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_record.metric_type = risk_notification_message_value;
  risk_notification_message_record.protection_type = risk_notification_message_value;
  risk_notification_message_record.event_type = risk_notification_message_value;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.event_id[risk_notification_message_at] = risk_notification_message_value; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.configured_counting_time_period[risk_notification_message_at] = risk_notification_message_value; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.configured_max_quantity[risk_notification_message_at] = risk_notification_message_value; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.current_quantity[risk_notification_message_at] = risk_notification_message_value; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.max_peak_quantity[risk_notification_message_at] = risk_notification_message_value; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_record.percentage_level = risk_notification_message_value;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> risk_notification_message_record.reserved_32[risk_notification_message_at] = risk_notification_message_value; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Risk Notification Message set to where it lies, so a field read out of place says so */
inline ramp_risk_notification_message(risk_notification_message_record, risk_notification_message_base) {
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 8 -> risk_notification_message_record.processing_time[risk_notification_message_at] = (risk_notification_message_base + 0 + risk_notification_message_at + 1) % 256; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> risk_notification_message_record.mpid_group_id[risk_notification_message_at] = (risk_notification_message_base + 8 + risk_notification_message_at + 1) % 256; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> risk_notification_message_record.metric_id[risk_notification_message_at] = (risk_notification_message_base + 40 + risk_notification_message_at + 1) % 256; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> risk_notification_message_record.route_id[risk_notification_message_at] = (risk_notification_message_base + 72 + risk_notification_message_at + 1) % 256; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_record.metric_type = (risk_notification_message_base + 104 + 1) % 256;
  risk_notification_message_record.protection_type = (risk_notification_message_base + 105 + 1) % 256;
  risk_notification_message_record.event_type = (risk_notification_message_base + 106 + 1) % 256;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.event_id[risk_notification_message_at] = (risk_notification_message_base + 107 + risk_notification_message_at + 1) % 256; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.configured_counting_time_period[risk_notification_message_at] = (risk_notification_message_base + 111 + risk_notification_message_at + 1) % 256; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.configured_max_quantity[risk_notification_message_at] = (risk_notification_message_base + 115 + risk_notification_message_at + 1) % 256; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.current_quantity[risk_notification_message_at] = (risk_notification_message_base + 119 + risk_notification_message_at + 1) % 256; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.max_peak_quantity[risk_notification_message_at] = (risk_notification_message_base + 123 + risk_notification_message_at + 1) % 256; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_record.percentage_level = (risk_notification_message_base + 127 + 1) % 256;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> risk_notification_message_record.reserved_32[risk_notification_message_at] = (risk_notification_message_base + 128 + risk_notification_message_at + 1) % 256; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Risk Notification Message to the wire, 160 bytes from where the cursor stands */
inline encode_risk_notification_message(risk_notification_message_record) {
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 8 -> wire[at] = risk_notification_message_record.processing_time[risk_notification_message_at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> wire[at] = risk_notification_message_record.mpid_group_id[risk_notification_message_at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> wire[at] = risk_notification_message_record.metric_id[risk_notification_message_at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> wire[at] = risk_notification_message_record.route_id[risk_notification_message_at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = risk_notification_message_record.metric_type; at = at + 1;
  wire[at] = risk_notification_message_record.protection_type; at = at + 1;
  wire[at] = risk_notification_message_record.event_type; at = at + 1;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> wire[at] = risk_notification_message_record.event_id[risk_notification_message_at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> wire[at] = risk_notification_message_record.configured_counting_time_period[risk_notification_message_at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> wire[at] = risk_notification_message_record.configured_max_quantity[risk_notification_message_at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> wire[at] = risk_notification_message_record.current_quantity[risk_notification_message_at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> wire[at] = risk_notification_message_record.max_peak_quantity[risk_notification_message_at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = risk_notification_message_record.percentage_level; at = at + 1;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> wire[at] = risk_notification_message_record.reserved_32[risk_notification_message_at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Risk Notification Message off the wire, 160 bytes from where the cursor stands */
inline decode_risk_notification_message(risk_notification_message_record) {
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 8 -> risk_notification_message_record.processing_time[risk_notification_message_at] = wire[at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> risk_notification_message_record.mpid_group_id[risk_notification_message_at] = wire[at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> risk_notification_message_record.metric_id[risk_notification_message_at] = wire[at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> risk_notification_message_record.route_id[risk_notification_message_at] = wire[at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_record.metric_type = wire[at]; at = at + 1;
  risk_notification_message_record.protection_type = wire[at]; at = at + 1;
  risk_notification_message_record.event_type = wire[at]; at = at + 1;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.event_id[risk_notification_message_at] = wire[at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.configured_counting_time_period[risk_notification_message_at] = wire[at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.configured_max_quantity[risk_notification_message_at] = wire[at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.current_quantity[risk_notification_message_at] = wire[at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> risk_notification_message_record.max_peak_quantity[risk_notification_message_at] = wire[at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_record.percentage_level = wire[at]; at = at + 1;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> risk_notification_message_record.reserved_32[risk_notification_message_at] = wire[at]; at = at + 1; risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Risk Notification Message is what was written, byte for byte */
inline equal_risk_notification_message(risk_notification_message_read, risk_notification_message_written) {
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 8 -> assert(risk_notification_message_read.processing_time[risk_notification_message_at] == risk_notification_message_written.processing_time[risk_notification_message_at]); risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> assert(risk_notification_message_read.mpid_group_id[risk_notification_message_at] == risk_notification_message_written.mpid_group_id[risk_notification_message_at]); risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> assert(risk_notification_message_read.metric_id[risk_notification_message_at] == risk_notification_message_written.metric_id[risk_notification_message_at]); risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> assert(risk_notification_message_read.route_id[risk_notification_message_at] == risk_notification_message_written.route_id[risk_notification_message_at]); risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  assert(risk_notification_message_read.metric_type == risk_notification_message_written.metric_type);
  assert(risk_notification_message_read.protection_type == risk_notification_message_written.protection_type);
  assert(risk_notification_message_read.event_type == risk_notification_message_written.event_type);
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> assert(risk_notification_message_read.event_id[risk_notification_message_at] == risk_notification_message_written.event_id[risk_notification_message_at]); risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> assert(risk_notification_message_read.configured_counting_time_period[risk_notification_message_at] == risk_notification_message_written.configured_counting_time_period[risk_notification_message_at]); risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> assert(risk_notification_message_read.configured_max_quantity[risk_notification_message_at] == risk_notification_message_written.configured_max_quantity[risk_notification_message_at]); risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> assert(risk_notification_message_read.current_quantity[risk_notification_message_at] == risk_notification_message_written.current_quantity[risk_notification_message_at]); risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 4 -> assert(risk_notification_message_read.max_peak_quantity[risk_notification_message_at] == risk_notification_message_written.max_peak_quantity[risk_notification_message_at]); risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  assert(risk_notification_message_read.percentage_level == risk_notification_message_written.percentage_level);
  risk_notification_message_at = 0;
  do
  :: risk_notification_message_at < 32 -> assert(risk_notification_message_read.reserved_32[risk_notification_message_at] == risk_notification_message_written.reserved_32[risk_notification_message_at]); risk_notification_message_at = risk_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Request: 35 bytes ------------------------------------------------- */

/* The SesM client uses this packet to allow the server to authenticate the client and to convey to the server the last sequenced packet that the client received */
typedef LoginRequest {
  byte sesm_version[5];
  byte username[5];
  byte computer_id[8];
  byte application_protocol[8];
  byte requested_session;
  byte requested_sequence_number[8]
};

int login_request_at;

/* every byte of Login Request set to one value */
inline fill_login_request(login_request_record, login_request_value) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.sesm_version[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.username[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.computer_id[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.application_protocol[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_record.requested_session = login_request_value;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.requested_sequence_number[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request set to where it lies, so a field read out of place says so */
inline ramp_login_request(login_request_record, login_request_base) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.sesm_version[login_request_at] = (login_request_base + 0 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.username[login_request_at] = (login_request_base + 5 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.computer_id[login_request_at] = (login_request_base + 10 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.application_protocol[login_request_at] = (login_request_base + 18 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_record.requested_session = (login_request_base + 26 + 1) % 256;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.requested_sequence_number[login_request_at] = (login_request_base + 27 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request to the wire, 35 bytes from where the cursor stands */
inline encode_login_request(login_request_record) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> wire[at] = login_request_record.sesm_version[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> wire[at] = login_request_record.username[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> wire[at] = login_request_record.computer_id[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> wire[at] = login_request_record.application_protocol[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  wire[at] = login_request_record.requested_session; at = at + 1;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> wire[at] = login_request_record.requested_sequence_number[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request off the wire, 35 bytes from where the cursor stands */
inline decode_login_request(login_request_record) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.sesm_version[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.username[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.computer_id[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.application_protocol[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_record.requested_session = wire[at]; at = at + 1;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.requested_sequence_number[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request is what was written, byte for byte */
inline equal_login_request(login_request_read, login_request_written) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> assert(login_request_read.sesm_version[login_request_at] == login_request_written.sesm_version[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> assert(login_request_read.username[login_request_at] == login_request_written.username[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> assert(login_request_read.computer_id[login_request_at] == login_request_written.computer_id[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> assert(login_request_read.application_protocol[login_request_at] == login_request_written.application_protocol[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  assert(login_request_read.requested_session == login_request_written.requested_session);
  login_request_at = 0;
  do
  :: login_request_at < 8 -> assert(login_request_read.requested_sequence_number[login_request_at] == login_request_written.requested_sequence_number[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response: 10 bytes ------------------------------------------------ */

/* The SesM server sends a Login response packet in response to a Login request packet from the client */
typedef LoginResponse {
  byte login_status;
  byte session_id;
  byte highest_sequence_number[8]
};

int login_response_at;

/* every byte of Login Response set to one value */
inline fill_login_response(login_response_record, login_response_value) {
  login_response_record.login_status = login_response_value;
  login_response_record.session_id = login_response_value;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = login_response_value; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Response set to where it lies, so a field read out of place says so */
inline ramp_login_response(login_response_record, login_response_base) {
  login_response_record.login_status = (login_response_base + 0 + 1) % 256;
  login_response_record.session_id = (login_response_base + 1 + 1) % 256;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = (login_response_base + 2 + login_response_at + 1) % 256; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response to the wire, 10 bytes from where the cursor stands */
inline encode_login_response(login_response_record) {
  wire[at] = login_response_record.login_status; at = at + 1;
  wire[at] = login_response_record.session_id; at = at + 1;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> wire[at] = login_response_record.highest_sequence_number[login_response_at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response off the wire, 10 bytes from where the cursor stands */
inline decode_login_response(login_response_record) {
  login_response_record.login_status = wire[at]; at = at + 1;
  login_response_record.session_id = wire[at]; at = at + 1;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = wire[at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Response is what was written, byte for byte */
inline equal_login_response(login_response_read, login_response_written) {
  assert(login_response_read.login_status == login_response_written.login_status);
  assert(login_response_read.session_id == login_response_written.session_id);
  login_response_at = 0;
  do
  :: login_response_at < 8 -> assert(login_response_read.highest_sequence_number[login_response_at] == login_response_written.highest_sequence_number[login_response_at]); login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Request: 16 bytes ---------------------------------------- */

/* The SesM client uses this packet to request the server to retransmit a range of packets */
typedef RetransmissionRequest {
  byte start_sequence_number[8];
  byte end_sequence_number[8]
};

int retransmission_request_at;

/* every byte of Retransmission Request set to one value */
inline fill_retransmission_request(retransmission_request_record, retransmission_request_value) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = retransmission_request_value; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = retransmission_request_value; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Request set to where it lies, so a field read out of place says so */
inline ramp_retransmission_request(retransmission_request_record, retransmission_request_base) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = (retransmission_request_base + 0 + retransmission_request_at + 1) % 256; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = (retransmission_request_base + 8 + retransmission_request_at + 1) % 256; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request to the wire, 16 bytes from where the cursor stands */
inline encode_retransmission_request(retransmission_request_record) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> wire[at] = retransmission_request_record.start_sequence_number[retransmission_request_at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> wire[at] = retransmission_request_record.end_sequence_number[retransmission_request_at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request off the wire, 16 bytes from where the cursor stands */
inline decode_retransmission_request(retransmission_request_record) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = wire[at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = wire[at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Request is what was written, byte for byte */
inline equal_retransmission_request(retransmission_request_read, retransmission_request_written) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> assert(retransmission_request_read.start_sequence_number[retransmission_request_at] == retransmission_request_written.start_sequence_number[retransmission_request_at]); retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> assert(retransmission_request_read.end_sequence_number[retransmission_request_at] == retransmission_request_written.end_sequence_number[retransmission_request_at]); retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Sesm Packet Header: encoded, read back, and compared */
proctype check_sesm_packet_header() {
  SesmPacketHeader sesm_packet_header_sent;
  SesmPacketHeader sesm_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sesm_packet_header(sesm_packet_header_sent, 0)
  :: pattern == 1 -> fill_sesm_packet_header(sesm_packet_header_sent, 32)
  :: pattern == 2 -> fill_sesm_packet_header(sesm_packet_header_sent, 255)
  :: else -> ramp_sesm_packet_header(sesm_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sesm_packet_header(sesm_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_sesm_packet_header(sesm_packet_header_got);
    assert(at == 3);
    equal_sesm_packet_header(sesm_packet_header_got, sesm_packet_header_sent)
  }
}

/* System State: encoded, read back, and compared */
proctype check_system_state() {
  SystemState system_state_sent;
  SystemState system_state_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_state(system_state_sent, 0)
  :: pattern == 1 -> fill_system_state(system_state_sent, 32)
  :: pattern == 2 -> fill_system_state(system_state_sent, 255)
  :: else -> ramp_system_state(system_state_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_state(system_state_sent);
    assert(at == 21);
    at = 0;
    decode_system_state(system_state_got);
    assert(at == 21);
    equal_system_state(system_state_got, system_state_sent)
  }
}

/* Trade Message: encoded, read back, and compared */
proctype check_trade_message() {
  TradeMessage trade_message_sent;
  TradeMessage trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message(trade_message_sent, 0)
  :: pattern == 1 -> fill_trade_message(trade_message_sent, 32)
  :: pattern == 2 -> fill_trade_message(trade_message_sent, 255)
  :: else -> ramp_trade_message(trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message(trade_message_sent);
    assert(at == 310);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 310);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Risk Notification Message: encoded, read back, and compared */
proctype check_risk_notification_message() {
  RiskNotificationMessage risk_notification_message_sent;
  RiskNotificationMessage risk_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_risk_notification_message(risk_notification_message_sent, 0)
  :: pattern == 1 -> fill_risk_notification_message(risk_notification_message_sent, 32)
  :: pattern == 2 -> fill_risk_notification_message(risk_notification_message_sent, 255)
  :: else -> ramp_risk_notification_message(risk_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_risk_notification_message(risk_notification_message_sent);
    assert(at == 160);
    at = 0;
    decode_risk_notification_message(risk_notification_message_got);
    assert(at == 160);
    equal_risk_notification_message(risk_notification_message_got, risk_notification_message_sent)
  }
}

/* Login Request: encoded, read back, and compared */
proctype check_login_request() {
  LoginRequest login_request_sent;
  LoginRequest login_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_request(login_request_sent, 0)
  :: pattern == 1 -> fill_login_request(login_request_sent, 32)
  :: pattern == 2 -> fill_login_request(login_request_sent, 255)
  :: else -> ramp_login_request(login_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_request(login_request_sent);
    assert(at == 35);
    at = 0;
    decode_login_request(login_request_got);
    assert(at == 35);
    equal_login_request(login_request_got, login_request_sent)
  }
}

/* Login Response: encoded, read back, and compared */
proctype check_login_response() {
  LoginResponse login_response_sent;
  LoginResponse login_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_response(login_response_sent, 0)
  :: pattern == 1 -> fill_login_response(login_response_sent, 32)
  :: pattern == 2 -> fill_login_response(login_response_sent, 255)
  :: else -> ramp_login_response(login_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_response(login_response_sent);
    assert(at == 10);
    at = 0;
    decode_login_response(login_response_got);
    assert(at == 10);
    equal_login_response(login_response_got, login_response_sent)
  }
}

/* Retransmission Request: encoded, read back, and compared */
proctype check_retransmission_request() {
  RetransmissionRequest retransmission_request_sent;
  RetransmissionRequest retransmission_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_request(retransmission_request_sent, 0)
  :: pattern == 1 -> fill_retransmission_request(retransmission_request_sent, 32)
  :: pattern == 2 -> fill_retransmission_request(retransmission_request_sent, 255)
  :: else -> ramp_retransmission_request(retransmission_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_request(retransmission_request_sent);
    assert(at == 16);
    at = 0;
    decode_retransmission_request(retransmission_request_got);
    assert(at == 16);
    equal_retransmission_request(retransmission_request_got, retransmission_request_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_sesm_packet_header()
  :: run check_system_state()
  :: run check_trade_message()
  :: run check_risk_notification_message()
  :: run check_login_request()
  :: run check_login_response()
  :: run check_retransmission_request()
  fi
}
