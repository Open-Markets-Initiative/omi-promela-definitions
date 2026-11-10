/*
 * National Stock Exchange of India Ltd Order Entry
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
 *   - a Composite rule
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 194

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 40 bytes ------------------------------------------------ */

/* MESSAGE_HEADER */
typedef MessageHeader {
  byte transaction_code[2];
  byte log_time[4];
  byte alpha_char[2];
  byte trader_id[4];
  byte error_code[2];
  byte header_timestamp[8];
  byte time_stamp_1[8];
  byte time_stamp_2[8];
  byte message_length[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.log_time[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.alpha_char[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.trader_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.header_timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_1[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_2[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.log_time[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.alpha_char[message_header_at] = (message_header_base + 6 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.trader_id[message_header_at] = (message_header_base + 8 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = (message_header_base + 12 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.header_timestamp[message_header_at] = (message_header_base + 14 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_1[message_header_at] = (message_header_base + 22 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_2[message_header_at] = (message_header_base + 30 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 38 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 40 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.transaction_code[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.log_time[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.alpha_char[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.trader_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.error_code[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.header_timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.time_stamp_1[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.time_stamp_2[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 40 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.log_time[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.alpha_char[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.trader_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.header_timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_1[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_2[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.transaction_code[message_header_at] == message_header_written.transaction_code[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.log_time[message_header_at] == message_header_written.log_time[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.alpha_char[message_header_at] == message_header_written.alpha_char[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.trader_id[message_header_at] == message_header_written.trader_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.error_code[message_header_at] == message_header_written.error_code[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.header_timestamp[message_header_at] == message_header_written.header_timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.time_stamp_1[message_header_at] == message_header_written.time_stamp_1[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.time_stamp_2[message_header_at] == message_header_written.time_stamp_2[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Information In Message: 4 bytes ---------------------------------- */

/* 1600 MS_SYSTEM_INFO_REQ 44 I, carried in the MS_SYSTEM_INFO_REQ structure */
typedef SystemInformationInMessage {
  byte last_update_portfolio_time[4]
};

int system_information_in_message_at;

/* every byte of System Information In Message set to one value */
inline fill_system_information_in_message(system_information_in_message_record, system_information_in_message_value) {
  system_information_in_message_at = 0;
  do
  :: system_information_in_message_at < 4 -> system_information_in_message_record.last_update_portfolio_time[system_information_in_message_at] = system_information_in_message_value; system_information_in_message_at = system_information_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Information In Message set to where it lies, so a field read out of place says so */
inline ramp_system_information_in_message(system_information_in_message_record, system_information_in_message_base) {
  system_information_in_message_at = 0;
  do
  :: system_information_in_message_at < 4 -> system_information_in_message_record.last_update_portfolio_time[system_information_in_message_at] = (system_information_in_message_base + 0 + system_information_in_message_at + 1) % 256; system_information_in_message_at = system_information_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Information In Message to the wire, 4 bytes from where the cursor stands */
inline encode_system_information_in_message(system_information_in_message_record) {
  system_information_in_message_at = 0;
  do
  :: system_information_in_message_at < 4 -> wire[at] = system_information_in_message_record.last_update_portfolio_time[system_information_in_message_at]; at = at + 1; system_information_in_message_at = system_information_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Information In Message off the wire, 4 bytes from where the cursor stands */
inline decode_system_information_in_message(system_information_in_message_record) {
  system_information_in_message_at = 0;
  do
  :: system_information_in_message_at < 4 -> system_information_in_message_record.last_update_portfolio_time[system_information_in_message_at] = wire[at]; at = at + 1; system_information_in_message_at = system_information_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Information In Message is what was written, byte for byte */
inline equal_system_information_in_message(system_information_in_message_read, system_information_in_message_written) {
  system_information_in_message_at = 0;
  do
  :: system_information_in_message_at < 4 -> assert(system_information_in_message_read.last_update_portfolio_time[system_information_in_message_at] == system_information_in_message_written.last_update_portfolio_time[system_information_in_message_at]); system_information_in_message_at = system_information_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Contract Desc: 28 bytes ------------------------------------------------- */

/* CONTRACT_DESC */
typedef ContractDesc {
  byte instrument_name[6];
  byte symbol[10];
  byte expiry_date[4];
  byte strike_price[4];
  byte option_type[2];
  byte ca_level[2]
};

int contract_desc_at;

/* every byte of Contract Desc set to one value */
inline fill_contract_desc(contract_desc_record, contract_desc_value) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> contract_desc_record.instrument_name[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> contract_desc_record.symbol[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.expiry_date[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.strike_price[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.option_type[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.ca_level[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Contract Desc set to where it lies, so a field read out of place says so */
inline ramp_contract_desc(contract_desc_record, contract_desc_base) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> contract_desc_record.instrument_name[contract_desc_at] = (contract_desc_base + 0 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> contract_desc_record.symbol[contract_desc_at] = (contract_desc_base + 6 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.expiry_date[contract_desc_at] = (contract_desc_base + 16 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.strike_price[contract_desc_at] = (contract_desc_base + 20 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.option_type[contract_desc_at] = (contract_desc_base + 24 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.ca_level[contract_desc_at] = (contract_desc_base + 26 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* Contract Desc to the wire, 28 bytes from where the cursor stands */
inline encode_contract_desc(contract_desc_record) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> wire[at] = contract_desc_record.instrument_name[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> wire[at] = contract_desc_record.symbol[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> wire[at] = contract_desc_record.expiry_date[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> wire[at] = contract_desc_record.strike_price[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> wire[at] = contract_desc_record.option_type[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> wire[at] = contract_desc_record.ca_level[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* Contract Desc off the wire, 28 bytes from where the cursor stands */
inline decode_contract_desc(contract_desc_record) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> contract_desc_record.instrument_name[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> contract_desc_record.symbol[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.expiry_date[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.strike_price[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.option_type[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.ca_level[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Contract Desc is what was written, byte for byte */
inline equal_contract_desc(contract_desc_read, contract_desc_written) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> assert(contract_desc_read.instrument_name[contract_desc_at] == contract_desc_written.instrument_name[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> assert(contract_desc_read.symbol[contract_desc_at] == contract_desc_written.symbol[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> assert(contract_desc_read.expiry_date[contract_desc_at] == contract_desc_written.expiry_date[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> assert(contract_desc_read.strike_price[contract_desc_at] == contract_desc_written.strike_price[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> assert(contract_desc_read.option_type[contract_desc_at] == contract_desc_written.option_type[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> assert(contract_desc_read.ca_level[contract_desc_at] == contract_desc_written.ca_level[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel In Message: 194 bytes -------------------------------------- */

/* 5440 MS_TRADE_INQ_DATA 234 I, carried in the MS_TRADE_INQ_DATA structure */
typedef TradeCancelInMessage {
  byte token_no[4];
  ContractDesc contract_desc;
  byte fill_number[4];
  byte fill_quantity[4];
  byte fill_price[4];
  byte mkt_type;
  byte buy_open_close;
  byte new_volume[4];
  byte buy_broker_id[5];
  byte sell_broker_id[5];
  byte trader_id[4];
  byte requested_by;
  byte sell_open_close;
  byte buy_account_number[10];
  byte sell_account_number[10];
  byte buy_participant[12];
  byte sell_participant[12];
  byte reserved_2[2];
  byte buy_giveup_flag;
  byte sell_giveup_flag;
  byte buy_pan[10];
  byte sell_pan[10];
  byte reserved_60[60]
};

int trade_cancel_in_message_at;

/* every byte of Trade Cancel In Message set to one value */
inline fill_trade_cancel_in_message(trade_cancel_in_message_record, trade_cancel_in_message_value) {
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.token_no[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  fill_contract_desc(trade_cancel_in_message_record.contract_desc, trade_cancel_in_message_value);
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.fill_number[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.fill_quantity[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.fill_price[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_record.mkt_type = trade_cancel_in_message_value;
  trade_cancel_in_message_record.buy_open_close = trade_cancel_in_message_value;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.new_volume[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 5 -> trade_cancel_in_message_record.buy_broker_id[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 5 -> trade_cancel_in_message_record.sell_broker_id[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.trader_id[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_record.requested_by = trade_cancel_in_message_value;
  trade_cancel_in_message_record.sell_open_close = trade_cancel_in_message_value;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> trade_cancel_in_message_record.buy_account_number[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> trade_cancel_in_message_record.sell_account_number[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 12 -> trade_cancel_in_message_record.buy_participant[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 12 -> trade_cancel_in_message_record.sell_participant[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 2 -> trade_cancel_in_message_record.reserved_2[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_record.buy_giveup_flag = trade_cancel_in_message_value;
  trade_cancel_in_message_record.sell_giveup_flag = trade_cancel_in_message_value;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> trade_cancel_in_message_record.buy_pan[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> trade_cancel_in_message_record.sell_pan[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 60 -> trade_cancel_in_message_record.reserved_60[trade_cancel_in_message_at] = trade_cancel_in_message_value; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel In Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_in_message(trade_cancel_in_message_record, trade_cancel_in_message_base) {
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.token_no[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 0 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  ramp_contract_desc(trade_cancel_in_message_record.contract_desc, trade_cancel_in_message_base + 4);
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.fill_number[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 32 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.fill_quantity[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 36 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.fill_price[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 40 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_record.mkt_type = (trade_cancel_in_message_base + 44 + 1) % 256;
  trade_cancel_in_message_record.buy_open_close = (trade_cancel_in_message_base + 45 + 1) % 256;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.new_volume[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 46 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 5 -> trade_cancel_in_message_record.buy_broker_id[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 50 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 5 -> trade_cancel_in_message_record.sell_broker_id[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 55 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.trader_id[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 60 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_record.requested_by = (trade_cancel_in_message_base + 64 + 1) % 256;
  trade_cancel_in_message_record.sell_open_close = (trade_cancel_in_message_base + 65 + 1) % 256;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> trade_cancel_in_message_record.buy_account_number[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 66 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> trade_cancel_in_message_record.sell_account_number[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 76 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 12 -> trade_cancel_in_message_record.buy_participant[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 86 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 12 -> trade_cancel_in_message_record.sell_participant[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 98 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 2 -> trade_cancel_in_message_record.reserved_2[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 110 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_record.buy_giveup_flag = (trade_cancel_in_message_base + 112 + 1) % 256;
  trade_cancel_in_message_record.sell_giveup_flag = (trade_cancel_in_message_base + 113 + 1) % 256;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> trade_cancel_in_message_record.buy_pan[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 114 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> trade_cancel_in_message_record.sell_pan[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 124 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 60 -> trade_cancel_in_message_record.reserved_60[trade_cancel_in_message_at] = (trade_cancel_in_message_base + 134 + trade_cancel_in_message_at + 1) % 256; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel In Message to the wire, 194 bytes from where the cursor stands */
inline encode_trade_cancel_in_message(trade_cancel_in_message_record) {
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> wire[at] = trade_cancel_in_message_record.token_no[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  encode_contract_desc(trade_cancel_in_message_record.contract_desc);
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> wire[at] = trade_cancel_in_message_record.fill_number[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> wire[at] = trade_cancel_in_message_record.fill_quantity[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> wire[at] = trade_cancel_in_message_record.fill_price[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_in_message_record.mkt_type; at = at + 1;
  wire[at] = trade_cancel_in_message_record.buy_open_close; at = at + 1;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> wire[at] = trade_cancel_in_message_record.new_volume[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 5 -> wire[at] = trade_cancel_in_message_record.buy_broker_id[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 5 -> wire[at] = trade_cancel_in_message_record.sell_broker_id[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> wire[at] = trade_cancel_in_message_record.trader_id[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_in_message_record.requested_by; at = at + 1;
  wire[at] = trade_cancel_in_message_record.sell_open_close; at = at + 1;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> wire[at] = trade_cancel_in_message_record.buy_account_number[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> wire[at] = trade_cancel_in_message_record.sell_account_number[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 12 -> wire[at] = trade_cancel_in_message_record.buy_participant[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 12 -> wire[at] = trade_cancel_in_message_record.sell_participant[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 2 -> wire[at] = trade_cancel_in_message_record.reserved_2[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_in_message_record.buy_giveup_flag; at = at + 1;
  wire[at] = trade_cancel_in_message_record.sell_giveup_flag; at = at + 1;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> wire[at] = trade_cancel_in_message_record.buy_pan[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> wire[at] = trade_cancel_in_message_record.sell_pan[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 60 -> wire[at] = trade_cancel_in_message_record.reserved_60[trade_cancel_in_message_at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel In Message off the wire, 194 bytes from where the cursor stands */
inline decode_trade_cancel_in_message(trade_cancel_in_message_record) {
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.token_no[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  decode_contract_desc(trade_cancel_in_message_record.contract_desc);
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.fill_number[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.fill_quantity[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.fill_price[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_record.mkt_type = wire[at]; at = at + 1;
  trade_cancel_in_message_record.buy_open_close = wire[at]; at = at + 1;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.new_volume[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 5 -> trade_cancel_in_message_record.buy_broker_id[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 5 -> trade_cancel_in_message_record.sell_broker_id[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> trade_cancel_in_message_record.trader_id[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_record.requested_by = wire[at]; at = at + 1;
  trade_cancel_in_message_record.sell_open_close = wire[at]; at = at + 1;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> trade_cancel_in_message_record.buy_account_number[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> trade_cancel_in_message_record.sell_account_number[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 12 -> trade_cancel_in_message_record.buy_participant[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 12 -> trade_cancel_in_message_record.sell_participant[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 2 -> trade_cancel_in_message_record.reserved_2[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_record.buy_giveup_flag = wire[at]; at = at + 1;
  trade_cancel_in_message_record.sell_giveup_flag = wire[at]; at = at + 1;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> trade_cancel_in_message_record.buy_pan[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> trade_cancel_in_message_record.sell_pan[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 60 -> trade_cancel_in_message_record.reserved_60[trade_cancel_in_message_at] = wire[at]; at = at + 1; trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel In Message is what was written, byte for byte */
inline equal_trade_cancel_in_message(trade_cancel_in_message_read, trade_cancel_in_message_written) {
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> assert(trade_cancel_in_message_read.token_no[trade_cancel_in_message_at] == trade_cancel_in_message_written.token_no[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  equal_contract_desc(trade_cancel_in_message_read.contract_desc, trade_cancel_in_message_written.contract_desc);
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> assert(trade_cancel_in_message_read.fill_number[trade_cancel_in_message_at] == trade_cancel_in_message_written.fill_number[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> assert(trade_cancel_in_message_read.fill_quantity[trade_cancel_in_message_at] == trade_cancel_in_message_written.fill_quantity[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> assert(trade_cancel_in_message_read.fill_price[trade_cancel_in_message_at] == trade_cancel_in_message_written.fill_price[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_in_message_read.mkt_type == trade_cancel_in_message_written.mkt_type);
  assert(trade_cancel_in_message_read.buy_open_close == trade_cancel_in_message_written.buy_open_close);
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> assert(trade_cancel_in_message_read.new_volume[trade_cancel_in_message_at] == trade_cancel_in_message_written.new_volume[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 5 -> assert(trade_cancel_in_message_read.buy_broker_id[trade_cancel_in_message_at] == trade_cancel_in_message_written.buy_broker_id[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 5 -> assert(trade_cancel_in_message_read.sell_broker_id[trade_cancel_in_message_at] == trade_cancel_in_message_written.sell_broker_id[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 4 -> assert(trade_cancel_in_message_read.trader_id[trade_cancel_in_message_at] == trade_cancel_in_message_written.trader_id[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_in_message_read.requested_by == trade_cancel_in_message_written.requested_by);
  assert(trade_cancel_in_message_read.sell_open_close == trade_cancel_in_message_written.sell_open_close);
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> assert(trade_cancel_in_message_read.buy_account_number[trade_cancel_in_message_at] == trade_cancel_in_message_written.buy_account_number[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> assert(trade_cancel_in_message_read.sell_account_number[trade_cancel_in_message_at] == trade_cancel_in_message_written.sell_account_number[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 12 -> assert(trade_cancel_in_message_read.buy_participant[trade_cancel_in_message_at] == trade_cancel_in_message_written.buy_participant[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 12 -> assert(trade_cancel_in_message_read.sell_participant[trade_cancel_in_message_at] == trade_cancel_in_message_written.sell_participant[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 2 -> assert(trade_cancel_in_message_read.reserved_2[trade_cancel_in_message_at] == trade_cancel_in_message_written.reserved_2[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_in_message_read.buy_giveup_flag == trade_cancel_in_message_written.buy_giveup_flag);
  assert(trade_cancel_in_message_read.sell_giveup_flag == trade_cancel_in_message_written.sell_giveup_flag);
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> assert(trade_cancel_in_message_read.buy_pan[trade_cancel_in_message_at] == trade_cancel_in_message_written.buy_pan[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 10 -> assert(trade_cancel_in_message_read.sell_pan[trade_cancel_in_message_at] == trade_cancel_in_message_written.sell_pan[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  trade_cancel_in_message_at = 0;
  do
  :: trade_cancel_in_message_at < 60 -> assert(trade_cancel_in_message_read.reserved_60[trade_cancel_in_message_at] == trade_cancel_in_message_written.reserved_60[trade_cancel_in_message_at]); trade_cancel_in_message_at = trade_cancel_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Mod In Message: 194 bytes ----------------------------------------- */

/* 5445 MS_TRADE_INQ_DATA 234 I, carried in the MS_TRADE_INQ_DATA structure */
typedef TradeModInMessage {
  byte token_no[4];
  ContractDesc contract_desc;
  byte fill_number[4];
  byte fill_quantity[4];
  byte fill_price[4];
  byte mkt_type;
  byte buy_open_close;
  byte new_volume[4];
  byte buy_broker_id[5];
  byte sell_broker_id[5];
  byte trader_id[4];
  byte requested_by;
  byte sell_open_close;
  byte buy_account_number[10];
  byte sell_account_number[10];
  byte buy_participant[12];
  byte sell_participant[12];
  byte reserved_2[2];
  byte buy_giveup_flag;
  byte sell_giveup_flag;
  byte buy_pan[10];
  byte sell_pan[10];
  byte reserved_60[60]
};

int trade_mod_in_message_at;

/* every byte of Trade Mod In Message set to one value */
inline fill_trade_mod_in_message(trade_mod_in_message_record, trade_mod_in_message_value) {
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.token_no[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  fill_contract_desc(trade_mod_in_message_record.contract_desc, trade_mod_in_message_value);
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.fill_number[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.fill_quantity[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.fill_price[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_record.mkt_type = trade_mod_in_message_value;
  trade_mod_in_message_record.buy_open_close = trade_mod_in_message_value;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.new_volume[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 5 -> trade_mod_in_message_record.buy_broker_id[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 5 -> trade_mod_in_message_record.sell_broker_id[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.trader_id[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_record.requested_by = trade_mod_in_message_value;
  trade_mod_in_message_record.sell_open_close = trade_mod_in_message_value;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> trade_mod_in_message_record.buy_account_number[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> trade_mod_in_message_record.sell_account_number[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 12 -> trade_mod_in_message_record.buy_participant[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 12 -> trade_mod_in_message_record.sell_participant[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 2 -> trade_mod_in_message_record.reserved_2[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_record.buy_giveup_flag = trade_mod_in_message_value;
  trade_mod_in_message_record.sell_giveup_flag = trade_mod_in_message_value;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> trade_mod_in_message_record.buy_pan[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> trade_mod_in_message_record.sell_pan[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 60 -> trade_mod_in_message_record.reserved_60[trade_mod_in_message_at] = trade_mod_in_message_value; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Mod In Message set to where it lies, so a field read out of place says so */
inline ramp_trade_mod_in_message(trade_mod_in_message_record, trade_mod_in_message_base) {
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.token_no[trade_mod_in_message_at] = (trade_mod_in_message_base + 0 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  ramp_contract_desc(trade_mod_in_message_record.contract_desc, trade_mod_in_message_base + 4);
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.fill_number[trade_mod_in_message_at] = (trade_mod_in_message_base + 32 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.fill_quantity[trade_mod_in_message_at] = (trade_mod_in_message_base + 36 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.fill_price[trade_mod_in_message_at] = (trade_mod_in_message_base + 40 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_record.mkt_type = (trade_mod_in_message_base + 44 + 1) % 256;
  trade_mod_in_message_record.buy_open_close = (trade_mod_in_message_base + 45 + 1) % 256;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.new_volume[trade_mod_in_message_at] = (trade_mod_in_message_base + 46 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 5 -> trade_mod_in_message_record.buy_broker_id[trade_mod_in_message_at] = (trade_mod_in_message_base + 50 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 5 -> trade_mod_in_message_record.sell_broker_id[trade_mod_in_message_at] = (trade_mod_in_message_base + 55 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.trader_id[trade_mod_in_message_at] = (trade_mod_in_message_base + 60 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_record.requested_by = (trade_mod_in_message_base + 64 + 1) % 256;
  trade_mod_in_message_record.sell_open_close = (trade_mod_in_message_base + 65 + 1) % 256;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> trade_mod_in_message_record.buy_account_number[trade_mod_in_message_at] = (trade_mod_in_message_base + 66 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> trade_mod_in_message_record.sell_account_number[trade_mod_in_message_at] = (trade_mod_in_message_base + 76 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 12 -> trade_mod_in_message_record.buy_participant[trade_mod_in_message_at] = (trade_mod_in_message_base + 86 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 12 -> trade_mod_in_message_record.sell_participant[trade_mod_in_message_at] = (trade_mod_in_message_base + 98 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 2 -> trade_mod_in_message_record.reserved_2[trade_mod_in_message_at] = (trade_mod_in_message_base + 110 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_record.buy_giveup_flag = (trade_mod_in_message_base + 112 + 1) % 256;
  trade_mod_in_message_record.sell_giveup_flag = (trade_mod_in_message_base + 113 + 1) % 256;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> trade_mod_in_message_record.buy_pan[trade_mod_in_message_at] = (trade_mod_in_message_base + 114 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> trade_mod_in_message_record.sell_pan[trade_mod_in_message_at] = (trade_mod_in_message_base + 124 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 60 -> trade_mod_in_message_record.reserved_60[trade_mod_in_message_at] = (trade_mod_in_message_base + 134 + trade_mod_in_message_at + 1) % 256; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Mod In Message to the wire, 194 bytes from where the cursor stands */
inline encode_trade_mod_in_message(trade_mod_in_message_record) {
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> wire[at] = trade_mod_in_message_record.token_no[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  encode_contract_desc(trade_mod_in_message_record.contract_desc);
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> wire[at] = trade_mod_in_message_record.fill_number[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> wire[at] = trade_mod_in_message_record.fill_quantity[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> wire[at] = trade_mod_in_message_record.fill_price[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_mod_in_message_record.mkt_type; at = at + 1;
  wire[at] = trade_mod_in_message_record.buy_open_close; at = at + 1;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> wire[at] = trade_mod_in_message_record.new_volume[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 5 -> wire[at] = trade_mod_in_message_record.buy_broker_id[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 5 -> wire[at] = trade_mod_in_message_record.sell_broker_id[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> wire[at] = trade_mod_in_message_record.trader_id[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_mod_in_message_record.requested_by; at = at + 1;
  wire[at] = trade_mod_in_message_record.sell_open_close; at = at + 1;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> wire[at] = trade_mod_in_message_record.buy_account_number[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> wire[at] = trade_mod_in_message_record.sell_account_number[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 12 -> wire[at] = trade_mod_in_message_record.buy_participant[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 12 -> wire[at] = trade_mod_in_message_record.sell_participant[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 2 -> wire[at] = trade_mod_in_message_record.reserved_2[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_mod_in_message_record.buy_giveup_flag; at = at + 1;
  wire[at] = trade_mod_in_message_record.sell_giveup_flag; at = at + 1;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> wire[at] = trade_mod_in_message_record.buy_pan[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> wire[at] = trade_mod_in_message_record.sell_pan[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 60 -> wire[at] = trade_mod_in_message_record.reserved_60[trade_mod_in_message_at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Mod In Message off the wire, 194 bytes from where the cursor stands */
inline decode_trade_mod_in_message(trade_mod_in_message_record) {
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.token_no[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  decode_contract_desc(trade_mod_in_message_record.contract_desc);
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.fill_number[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.fill_quantity[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.fill_price[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_record.mkt_type = wire[at]; at = at + 1;
  trade_mod_in_message_record.buy_open_close = wire[at]; at = at + 1;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.new_volume[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 5 -> trade_mod_in_message_record.buy_broker_id[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 5 -> trade_mod_in_message_record.sell_broker_id[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> trade_mod_in_message_record.trader_id[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_record.requested_by = wire[at]; at = at + 1;
  trade_mod_in_message_record.sell_open_close = wire[at]; at = at + 1;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> trade_mod_in_message_record.buy_account_number[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> trade_mod_in_message_record.sell_account_number[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 12 -> trade_mod_in_message_record.buy_participant[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 12 -> trade_mod_in_message_record.sell_participant[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 2 -> trade_mod_in_message_record.reserved_2[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_record.buy_giveup_flag = wire[at]; at = at + 1;
  trade_mod_in_message_record.sell_giveup_flag = wire[at]; at = at + 1;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> trade_mod_in_message_record.buy_pan[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> trade_mod_in_message_record.sell_pan[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 60 -> trade_mod_in_message_record.reserved_60[trade_mod_in_message_at] = wire[at]; at = at + 1; trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Mod In Message is what was written, byte for byte */
inline equal_trade_mod_in_message(trade_mod_in_message_read, trade_mod_in_message_written) {
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> assert(trade_mod_in_message_read.token_no[trade_mod_in_message_at] == trade_mod_in_message_written.token_no[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  equal_contract_desc(trade_mod_in_message_read.contract_desc, trade_mod_in_message_written.contract_desc);
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> assert(trade_mod_in_message_read.fill_number[trade_mod_in_message_at] == trade_mod_in_message_written.fill_number[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> assert(trade_mod_in_message_read.fill_quantity[trade_mod_in_message_at] == trade_mod_in_message_written.fill_quantity[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> assert(trade_mod_in_message_read.fill_price[trade_mod_in_message_at] == trade_mod_in_message_written.fill_price[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  assert(trade_mod_in_message_read.mkt_type == trade_mod_in_message_written.mkt_type);
  assert(trade_mod_in_message_read.buy_open_close == trade_mod_in_message_written.buy_open_close);
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> assert(trade_mod_in_message_read.new_volume[trade_mod_in_message_at] == trade_mod_in_message_written.new_volume[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 5 -> assert(trade_mod_in_message_read.buy_broker_id[trade_mod_in_message_at] == trade_mod_in_message_written.buy_broker_id[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 5 -> assert(trade_mod_in_message_read.sell_broker_id[trade_mod_in_message_at] == trade_mod_in_message_written.sell_broker_id[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 4 -> assert(trade_mod_in_message_read.trader_id[trade_mod_in_message_at] == trade_mod_in_message_written.trader_id[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  assert(trade_mod_in_message_read.requested_by == trade_mod_in_message_written.requested_by);
  assert(trade_mod_in_message_read.sell_open_close == trade_mod_in_message_written.sell_open_close);
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> assert(trade_mod_in_message_read.buy_account_number[trade_mod_in_message_at] == trade_mod_in_message_written.buy_account_number[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> assert(trade_mod_in_message_read.sell_account_number[trade_mod_in_message_at] == trade_mod_in_message_written.sell_account_number[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 12 -> assert(trade_mod_in_message_read.buy_participant[trade_mod_in_message_at] == trade_mod_in_message_written.buy_participant[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 12 -> assert(trade_mod_in_message_read.sell_participant[trade_mod_in_message_at] == trade_mod_in_message_written.sell_participant[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 2 -> assert(trade_mod_in_message_read.reserved_2[trade_mod_in_message_at] == trade_mod_in_message_written.reserved_2[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  assert(trade_mod_in_message_read.buy_giveup_flag == trade_mod_in_message_written.buy_giveup_flag);
  assert(trade_mod_in_message_read.sell_giveup_flag == trade_mod_in_message_written.sell_giveup_flag);
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> assert(trade_mod_in_message_read.buy_pan[trade_mod_in_message_at] == trade_mod_in_message_written.buy_pan[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 10 -> assert(trade_mod_in_message_read.sell_pan[trade_mod_in_message_at] == trade_mod_in_message_written.sell_pan[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  trade_mod_in_message_at = 0;
  do
  :: trade_mod_in_message_at < 60 -> assert(trade_mod_in_message_read.reserved_60[trade_mod_in_message_at] == trade_mod_in_message_written.reserved_60[trade_mod_in_message_at]); trade_mod_in_message_at = trade_mod_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Gr Request Message: 8 bytes --------------------------------------------- */

/* 2400 MS_GR_REQUEST 48 I, carried in the MS_GR_REQUEST structure */
typedef GrRequestMessage {
  byte box_id[2];
  byte broker_id[5];
  byte filler
};

int gr_request_message_at;

/* every byte of Gr Request Message set to one value */
inline fill_gr_request_message(gr_request_message_record, gr_request_message_value) {
  gr_request_message_at = 0;
  do
  :: gr_request_message_at < 2 -> gr_request_message_record.box_id[gr_request_message_at] = gr_request_message_value; gr_request_message_at = gr_request_message_at + 1
  :: else -> break
  od;
  gr_request_message_at = 0;
  do
  :: gr_request_message_at < 5 -> gr_request_message_record.broker_id[gr_request_message_at] = gr_request_message_value; gr_request_message_at = gr_request_message_at + 1
  :: else -> break
  od;
  gr_request_message_record.filler = gr_request_message_value;
  skip
}

/* each byte of Gr Request Message set to where it lies, so a field read out of place says so */
inline ramp_gr_request_message(gr_request_message_record, gr_request_message_base) {
  gr_request_message_at = 0;
  do
  :: gr_request_message_at < 2 -> gr_request_message_record.box_id[gr_request_message_at] = (gr_request_message_base + 0 + gr_request_message_at + 1) % 256; gr_request_message_at = gr_request_message_at + 1
  :: else -> break
  od;
  gr_request_message_at = 0;
  do
  :: gr_request_message_at < 5 -> gr_request_message_record.broker_id[gr_request_message_at] = (gr_request_message_base + 2 + gr_request_message_at + 1) % 256; gr_request_message_at = gr_request_message_at + 1
  :: else -> break
  od;
  gr_request_message_record.filler = (gr_request_message_base + 7 + 1) % 256;
  skip
}

/* Gr Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_gr_request_message(gr_request_message_record) {
  gr_request_message_at = 0;
  do
  :: gr_request_message_at < 2 -> wire[at] = gr_request_message_record.box_id[gr_request_message_at]; at = at + 1; gr_request_message_at = gr_request_message_at + 1
  :: else -> break
  od;
  gr_request_message_at = 0;
  do
  :: gr_request_message_at < 5 -> wire[at] = gr_request_message_record.broker_id[gr_request_message_at]; at = at + 1; gr_request_message_at = gr_request_message_at + 1
  :: else -> break
  od;
  wire[at] = gr_request_message_record.filler; at = at + 1;
  skip
}

/* Gr Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_gr_request_message(gr_request_message_record) {
  gr_request_message_at = 0;
  do
  :: gr_request_message_at < 2 -> gr_request_message_record.box_id[gr_request_message_at] = wire[at]; at = at + 1; gr_request_message_at = gr_request_message_at + 1
  :: else -> break
  od;
  gr_request_message_at = 0;
  do
  :: gr_request_message_at < 5 -> gr_request_message_record.broker_id[gr_request_message_at] = wire[at]; at = at + 1; gr_request_message_at = gr_request_message_at + 1
  :: else -> break
  od;
  gr_request_message_record.filler = wire[at]; at = at + 1;
  skip
}

/* what was read of Gr Request Message is what was written, byte for byte */
inline equal_gr_request_message(gr_request_message_read, gr_request_message_written) {
  gr_request_message_at = 0;
  do
  :: gr_request_message_at < 2 -> assert(gr_request_message_read.box_id[gr_request_message_at] == gr_request_message_written.box_id[gr_request_message_at]); gr_request_message_at = gr_request_message_at + 1
  :: else -> break
  od;
  gr_request_message_at = 0;
  do
  :: gr_request_message_at < 5 -> assert(gr_request_message_read.broker_id[gr_request_message_at] == gr_request_message_written.broker_id[gr_request_message_at]); gr_request_message_at = gr_request_message_at + 1
  :: else -> break
  od;
  assert(gr_request_message_read.filler == gr_request_message_written.filler);
  skip
}

/* ---- User Addr Unlock In Message: 74 bytes ----------------------------------- */

/* 5427 USER_ADDR_UNLOCK_REQ_F 114 I O, carried in the USER_ADDR_UNLOCK_REQ_FO structure */
typedef UserAddrUnlockInMessage {
  byte user_id[4];
  byte reserved_70[70]
};

int user_addr_unlock_in_message_at;

/* every byte of User Addr Unlock In Message set to one value */
inline fill_user_addr_unlock_in_message(user_addr_unlock_in_message_record, user_addr_unlock_in_message_value) {
  user_addr_unlock_in_message_at = 0;
  do
  :: user_addr_unlock_in_message_at < 4 -> user_addr_unlock_in_message_record.user_id[user_addr_unlock_in_message_at] = user_addr_unlock_in_message_value; user_addr_unlock_in_message_at = user_addr_unlock_in_message_at + 1
  :: else -> break
  od;
  user_addr_unlock_in_message_at = 0;
  do
  :: user_addr_unlock_in_message_at < 70 -> user_addr_unlock_in_message_record.reserved_70[user_addr_unlock_in_message_at] = user_addr_unlock_in_message_value; user_addr_unlock_in_message_at = user_addr_unlock_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Addr Unlock In Message set to where it lies, so a field read out of place says so */
inline ramp_user_addr_unlock_in_message(user_addr_unlock_in_message_record, user_addr_unlock_in_message_base) {
  user_addr_unlock_in_message_at = 0;
  do
  :: user_addr_unlock_in_message_at < 4 -> user_addr_unlock_in_message_record.user_id[user_addr_unlock_in_message_at] = (user_addr_unlock_in_message_base + 0 + user_addr_unlock_in_message_at + 1) % 256; user_addr_unlock_in_message_at = user_addr_unlock_in_message_at + 1
  :: else -> break
  od;
  user_addr_unlock_in_message_at = 0;
  do
  :: user_addr_unlock_in_message_at < 70 -> user_addr_unlock_in_message_record.reserved_70[user_addr_unlock_in_message_at] = (user_addr_unlock_in_message_base + 4 + user_addr_unlock_in_message_at + 1) % 256; user_addr_unlock_in_message_at = user_addr_unlock_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Addr Unlock In Message to the wire, 74 bytes from where the cursor stands */
inline encode_user_addr_unlock_in_message(user_addr_unlock_in_message_record) {
  user_addr_unlock_in_message_at = 0;
  do
  :: user_addr_unlock_in_message_at < 4 -> wire[at] = user_addr_unlock_in_message_record.user_id[user_addr_unlock_in_message_at]; at = at + 1; user_addr_unlock_in_message_at = user_addr_unlock_in_message_at + 1
  :: else -> break
  od;
  user_addr_unlock_in_message_at = 0;
  do
  :: user_addr_unlock_in_message_at < 70 -> wire[at] = user_addr_unlock_in_message_record.reserved_70[user_addr_unlock_in_message_at]; at = at + 1; user_addr_unlock_in_message_at = user_addr_unlock_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Addr Unlock In Message off the wire, 74 bytes from where the cursor stands */
inline decode_user_addr_unlock_in_message(user_addr_unlock_in_message_record) {
  user_addr_unlock_in_message_at = 0;
  do
  :: user_addr_unlock_in_message_at < 4 -> user_addr_unlock_in_message_record.user_id[user_addr_unlock_in_message_at] = wire[at]; at = at + 1; user_addr_unlock_in_message_at = user_addr_unlock_in_message_at + 1
  :: else -> break
  od;
  user_addr_unlock_in_message_at = 0;
  do
  :: user_addr_unlock_in_message_at < 70 -> user_addr_unlock_in_message_record.reserved_70[user_addr_unlock_in_message_at] = wire[at]; at = at + 1; user_addr_unlock_in_message_at = user_addr_unlock_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Addr Unlock In Message is what was written, byte for byte */
inline equal_user_addr_unlock_in_message(user_addr_unlock_in_message_read, user_addr_unlock_in_message_written) {
  user_addr_unlock_in_message_at = 0;
  do
  :: user_addr_unlock_in_message_at < 4 -> assert(user_addr_unlock_in_message_read.user_id[user_addr_unlock_in_message_at] == user_addr_unlock_in_message_written.user_id[user_addr_unlock_in_message_at]); user_addr_unlock_in_message_at = user_addr_unlock_in_message_at + 1
  :: else -> break
  od;
  user_addr_unlock_in_message_at = 0;
  do
  :: user_addr_unlock_in_message_at < 70 -> assert(user_addr_unlock_in_message_read.reserved_70[user_addr_unlock_in_message_at] == user_addr_unlock_in_message_written.reserved_70[user_addr_unlock_in_message_at]); user_addr_unlock_in_message_at = user_addr_unlock_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reset User Password In Message: 18 bytes -------------------------------- */

/* 5740 RESET_USER_PASSWORD_IN_ 58 I FO, carried in the RESET_USER_PASSWORD_IN_FO structure */
typedef ResetUserPasswordInMessage {
  byte user_id[4];
  byte reserved_14[14]
};

int reset_user_password_in_message_at;

/* every byte of Reset User Password In Message set to one value */
inline fill_reset_user_password_in_message(reset_user_password_in_message_record, reset_user_password_in_message_value) {
  reset_user_password_in_message_at = 0;
  do
  :: reset_user_password_in_message_at < 4 -> reset_user_password_in_message_record.user_id[reset_user_password_in_message_at] = reset_user_password_in_message_value; reset_user_password_in_message_at = reset_user_password_in_message_at + 1
  :: else -> break
  od;
  reset_user_password_in_message_at = 0;
  do
  :: reset_user_password_in_message_at < 14 -> reset_user_password_in_message_record.reserved_14[reset_user_password_in_message_at] = reset_user_password_in_message_value; reset_user_password_in_message_at = reset_user_password_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reset User Password In Message set to where it lies, so a field read out of place says so */
inline ramp_reset_user_password_in_message(reset_user_password_in_message_record, reset_user_password_in_message_base) {
  reset_user_password_in_message_at = 0;
  do
  :: reset_user_password_in_message_at < 4 -> reset_user_password_in_message_record.user_id[reset_user_password_in_message_at] = (reset_user_password_in_message_base + 0 + reset_user_password_in_message_at + 1) % 256; reset_user_password_in_message_at = reset_user_password_in_message_at + 1
  :: else -> break
  od;
  reset_user_password_in_message_at = 0;
  do
  :: reset_user_password_in_message_at < 14 -> reset_user_password_in_message_record.reserved_14[reset_user_password_in_message_at] = (reset_user_password_in_message_base + 4 + reset_user_password_in_message_at + 1) % 256; reset_user_password_in_message_at = reset_user_password_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset User Password In Message to the wire, 18 bytes from where the cursor stands */
inline encode_reset_user_password_in_message(reset_user_password_in_message_record) {
  reset_user_password_in_message_at = 0;
  do
  :: reset_user_password_in_message_at < 4 -> wire[at] = reset_user_password_in_message_record.user_id[reset_user_password_in_message_at]; at = at + 1; reset_user_password_in_message_at = reset_user_password_in_message_at + 1
  :: else -> break
  od;
  reset_user_password_in_message_at = 0;
  do
  :: reset_user_password_in_message_at < 14 -> wire[at] = reset_user_password_in_message_record.reserved_14[reset_user_password_in_message_at]; at = at + 1; reset_user_password_in_message_at = reset_user_password_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset User Password In Message off the wire, 18 bytes from where the cursor stands */
inline decode_reset_user_password_in_message(reset_user_password_in_message_record) {
  reset_user_password_in_message_at = 0;
  do
  :: reset_user_password_in_message_at < 4 -> reset_user_password_in_message_record.user_id[reset_user_password_in_message_at] = wire[at]; at = at + 1; reset_user_password_in_message_at = reset_user_password_in_message_at + 1
  :: else -> break
  od;
  reset_user_password_in_message_at = 0;
  do
  :: reset_user_password_in_message_at < 14 -> reset_user_password_in_message_record.reserved_14[reset_user_password_in_message_at] = wire[at]; at = at + 1; reset_user_password_in_message_at = reset_user_password_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reset User Password In Message is what was written, byte for byte */
inline equal_reset_user_password_in_message(reset_user_password_in_message_read, reset_user_password_in_message_written) {
  reset_user_password_in_message_at = 0;
  do
  :: reset_user_password_in_message_at < 4 -> assert(reset_user_password_in_message_read.user_id[reset_user_password_in_message_at] == reset_user_password_in_message_written.user_id[reset_user_password_in_message_at]); reset_user_password_in_message_at = reset_user_password_in_message_at + 1
  :: else -> break
  od;
  reset_user_password_in_message_at = 0;
  do
  :: reset_user_password_in_message_at < 14 -> assert(reset_user_password_in_message_read.reserved_14[reset_user_password_in_message_at] == reset_user_password_in_message_written.reserved_14[reset_user_password_in_message_at]); reset_user_password_in_message_at = reset_user_password_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Col User Status Change In Message: 12 bytes ----------------------------- */

/* 5744 COL_USER_STATUS_CHANGE_ 52 I REQ, carried in the COL_USER_STATUS_CHANGE_REQ structure */
typedef ColUserStatusChangeInMessage {
  byte user_id[4];
  byte col_user_bit;
  byte reserved_7[7]
};

int col_user_status_change_in_message_at;

/* every byte of Col User Status Change In Message set to one value */
inline fill_col_user_status_change_in_message(col_user_status_change_in_message_record, col_user_status_change_in_message_value) {
  col_user_status_change_in_message_at = 0;
  do
  :: col_user_status_change_in_message_at < 4 -> col_user_status_change_in_message_record.user_id[col_user_status_change_in_message_at] = col_user_status_change_in_message_value; col_user_status_change_in_message_at = col_user_status_change_in_message_at + 1
  :: else -> break
  od;
  col_user_status_change_in_message_record.col_user_bit = col_user_status_change_in_message_value;
  col_user_status_change_in_message_at = 0;
  do
  :: col_user_status_change_in_message_at < 7 -> col_user_status_change_in_message_record.reserved_7[col_user_status_change_in_message_at] = col_user_status_change_in_message_value; col_user_status_change_in_message_at = col_user_status_change_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Col User Status Change In Message set to where it lies, so a field read out of place says so */
inline ramp_col_user_status_change_in_message(col_user_status_change_in_message_record, col_user_status_change_in_message_base) {
  col_user_status_change_in_message_at = 0;
  do
  :: col_user_status_change_in_message_at < 4 -> col_user_status_change_in_message_record.user_id[col_user_status_change_in_message_at] = (col_user_status_change_in_message_base + 0 + col_user_status_change_in_message_at + 1) % 256; col_user_status_change_in_message_at = col_user_status_change_in_message_at + 1
  :: else -> break
  od;
  col_user_status_change_in_message_record.col_user_bit = (col_user_status_change_in_message_base + 4 + 1) % 256;
  col_user_status_change_in_message_at = 0;
  do
  :: col_user_status_change_in_message_at < 7 -> col_user_status_change_in_message_record.reserved_7[col_user_status_change_in_message_at] = (col_user_status_change_in_message_base + 5 + col_user_status_change_in_message_at + 1) % 256; col_user_status_change_in_message_at = col_user_status_change_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Col User Status Change In Message to the wire, 12 bytes from where the cursor stands */
inline encode_col_user_status_change_in_message(col_user_status_change_in_message_record) {
  col_user_status_change_in_message_at = 0;
  do
  :: col_user_status_change_in_message_at < 4 -> wire[at] = col_user_status_change_in_message_record.user_id[col_user_status_change_in_message_at]; at = at + 1; col_user_status_change_in_message_at = col_user_status_change_in_message_at + 1
  :: else -> break
  od;
  wire[at] = col_user_status_change_in_message_record.col_user_bit; at = at + 1;
  col_user_status_change_in_message_at = 0;
  do
  :: col_user_status_change_in_message_at < 7 -> wire[at] = col_user_status_change_in_message_record.reserved_7[col_user_status_change_in_message_at]; at = at + 1; col_user_status_change_in_message_at = col_user_status_change_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Col User Status Change In Message off the wire, 12 bytes from where the cursor stands */
inline decode_col_user_status_change_in_message(col_user_status_change_in_message_record) {
  col_user_status_change_in_message_at = 0;
  do
  :: col_user_status_change_in_message_at < 4 -> col_user_status_change_in_message_record.user_id[col_user_status_change_in_message_at] = wire[at]; at = at + 1; col_user_status_change_in_message_at = col_user_status_change_in_message_at + 1
  :: else -> break
  od;
  col_user_status_change_in_message_record.col_user_bit = wire[at]; at = at + 1;
  col_user_status_change_in_message_at = 0;
  do
  :: col_user_status_change_in_message_at < 7 -> col_user_status_change_in_message_record.reserved_7[col_user_status_change_in_message_at] = wire[at]; at = at + 1; col_user_status_change_in_message_at = col_user_status_change_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Col User Status Change In Message is what was written, byte for byte */
inline equal_col_user_status_change_in_message(col_user_status_change_in_message_read, col_user_status_change_in_message_written) {
  col_user_status_change_in_message_at = 0;
  do
  :: col_user_status_change_in_message_at < 4 -> assert(col_user_status_change_in_message_read.user_id[col_user_status_change_in_message_at] == col_user_status_change_in_message_written.user_id[col_user_status_change_in_message_at]); col_user_status_change_in_message_at = col_user_status_change_in_message_at + 1
  :: else -> break
  od;
  assert(col_user_status_change_in_message_read.col_user_bit == col_user_status_change_in_message_written.col_user_bit);
  col_user_status_change_in_message_at = 0;
  do
  :: col_user_status_change_in_message_at < 7 -> assert(col_user_status_change_in_message_read.reserved_7[col_user_status_change_in_message_at] == col_user_status_change_in_message_written.reserved_7[col_user_status_change_in_message_at]); col_user_status_change_in_message_at = col_user_status_change_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- St Market Status: 8 bytes ----------------------------------------------- */

/* ST_MARKET_STATUS */
typedef StMarketStatus {
  byte normal[2];
  byte oddlot[2];
  byte spot[2];
  byte auction[2]
};

int st_market_status_at;

/* every byte of St Market Status set to one value */
inline fill_st_market_status(st_market_status_record, st_market_status_value) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.normal[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.oddlot[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.spot[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.auction[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of St Market Status set to where it lies, so a field read out of place says so */
inline ramp_st_market_status(st_market_status_record, st_market_status_base) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.normal[st_market_status_at] = (st_market_status_base + 0 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.oddlot[st_market_status_at] = (st_market_status_base + 2 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.spot[st_market_status_at] = (st_market_status_base + 4 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.auction[st_market_status_at] = (st_market_status_base + 6 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Market Status to the wire, 8 bytes from where the cursor stands */
inline encode_st_market_status(st_market_status_record) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.normal[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.oddlot[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.spot[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.auction[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Market Status off the wire, 8 bytes from where the cursor stands */
inline decode_st_market_status(st_market_status_record) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.normal[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.oddlot[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.spot[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.auction[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of St Market Status is what was written, byte for byte */
inline equal_st_market_status(st_market_status_read, st_market_status_written) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.normal[st_market_status_at] == st_market_status_written.normal[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.oddlot[st_market_status_at] == st_market_status_written.oddlot[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.spot[st_market_status_at] == st_market_status_written.spot[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.auction[st_market_status_at] == st_market_status_written.auction[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- St Ex Market Status: 8 bytes -------------------------------------------- */

/* ST_EX_MARKET_STATUS */
typedef StExMarketStatus {
  byte normal[2];
  byte oddlot[2];
  byte spot[2];
  byte auction[2]
};

int st_ex_market_status_at;

/* every byte of St Ex Market Status set to one value */
inline fill_st_ex_market_status(st_ex_market_status_record, st_ex_market_status_value) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.normal[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.oddlot[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.spot[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.auction[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of St Ex Market Status set to where it lies, so a field read out of place says so */
inline ramp_st_ex_market_status(st_ex_market_status_record, st_ex_market_status_base) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.normal[st_ex_market_status_at] = (st_ex_market_status_base + 0 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.oddlot[st_ex_market_status_at] = (st_ex_market_status_base + 2 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.spot[st_ex_market_status_at] = (st_ex_market_status_base + 4 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.auction[st_ex_market_status_at] = (st_ex_market_status_base + 6 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Ex Market Status to the wire, 8 bytes from where the cursor stands */
inline encode_st_ex_market_status(st_ex_market_status_record) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.normal[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.oddlot[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.spot[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.auction[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Ex Market Status off the wire, 8 bytes from where the cursor stands */
inline decode_st_ex_market_status(st_ex_market_status_record) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.normal[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.oddlot[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.spot[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.auction[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of St Ex Market Status is what was written, byte for byte */
inline equal_st_ex_market_status(st_ex_market_status_read, st_ex_market_status_written) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.normal[st_ex_market_status_at] == st_ex_market_status_written.normal[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.oddlot[st_ex_market_status_at] == st_ex_market_status_written.oddlot[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.spot[st_ex_market_status_at] == st_ex_market_status_written.spot[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.auction[st_ex_market_status_at] == st_ex_market_status_written.auction[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- St Pl Market Status: 8 bytes -------------------------------------------- */

/* ST_PL_MARKET_STATUS */
typedef StPlMarketStatus {
  byte normal[2];
  byte oddlot[2];
  byte spot[2];
  byte auction[2]
};

int st_pl_market_status_at;

/* every byte of St Pl Market Status set to one value */
inline fill_st_pl_market_status(st_pl_market_status_record, st_pl_market_status_value) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.normal[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.oddlot[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.spot[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.auction[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of St Pl Market Status set to where it lies, so a field read out of place says so */
inline ramp_st_pl_market_status(st_pl_market_status_record, st_pl_market_status_base) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.normal[st_pl_market_status_at] = (st_pl_market_status_base + 0 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.oddlot[st_pl_market_status_at] = (st_pl_market_status_base + 2 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.spot[st_pl_market_status_at] = (st_pl_market_status_base + 4 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.auction[st_pl_market_status_at] = (st_pl_market_status_base + 6 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Pl Market Status to the wire, 8 bytes from where the cursor stands */
inline encode_st_pl_market_status(st_pl_market_status_record) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.normal[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.oddlot[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.spot[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.auction[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Pl Market Status off the wire, 8 bytes from where the cursor stands */
inline decode_st_pl_market_status(st_pl_market_status_record) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.normal[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.oddlot[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.spot[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.auction[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of St Pl Market Status is what was written, byte for byte */
inline equal_st_pl_market_status(st_pl_market_status_read, st_pl_market_status_written) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.normal[st_pl_market_status_at] == st_pl_market_status_written.normal[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.oddlot[st_pl_market_status_at] == st_pl_market_status_written.oddlot[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.spot[st_pl_market_status_at] == st_pl_market_status_written.spot[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.auction[st_pl_market_status_at] == st_pl_market_status_written.auction[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Update Localdb In Message: 42 bytes ------------------------------------- */

/* 7300 MS_UPDATE_LOCAL_DATABA 82 I SE, carried in the MS_UPDATE_LOCAL_DATABASE structure */
typedef UpdateLocaldbInMessage {
  byte last_update_security_time[4];
  byte last_update_participant_time[4];
  byte last_update_instrument_time[4];
  byte last_update_index_time[4];
  byte request_for_open_orders;
  byte c_filler;
  StMarketStatus st_market_status;
  StExMarketStatus st_ex_market_status;
  StPlMarketStatus st_pl_market_status
};

int update_localdb_in_message_at;

/* every byte of Update Localdb In Message set to one value */
inline fill_update_localdb_in_message(update_localdb_in_message_record, update_localdb_in_message_value) {
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> update_localdb_in_message_record.last_update_security_time[update_localdb_in_message_at] = update_localdb_in_message_value; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> update_localdb_in_message_record.last_update_participant_time[update_localdb_in_message_at] = update_localdb_in_message_value; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> update_localdb_in_message_record.last_update_instrument_time[update_localdb_in_message_at] = update_localdb_in_message_value; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> update_localdb_in_message_record.last_update_index_time[update_localdb_in_message_at] = update_localdb_in_message_value; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_record.request_for_open_orders = update_localdb_in_message_value;
  update_localdb_in_message_record.c_filler = update_localdb_in_message_value;
  fill_st_market_status(update_localdb_in_message_record.st_market_status, update_localdb_in_message_value);
  fill_st_ex_market_status(update_localdb_in_message_record.st_ex_market_status, update_localdb_in_message_value);
  fill_st_pl_market_status(update_localdb_in_message_record.st_pl_market_status, update_localdb_in_message_value);
  skip
}

/* each byte of Update Localdb In Message set to where it lies, so a field read out of place says so */
inline ramp_update_localdb_in_message(update_localdb_in_message_record, update_localdb_in_message_base) {
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> update_localdb_in_message_record.last_update_security_time[update_localdb_in_message_at] = (update_localdb_in_message_base + 0 + update_localdb_in_message_at + 1) % 256; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> update_localdb_in_message_record.last_update_participant_time[update_localdb_in_message_at] = (update_localdb_in_message_base + 4 + update_localdb_in_message_at + 1) % 256; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> update_localdb_in_message_record.last_update_instrument_time[update_localdb_in_message_at] = (update_localdb_in_message_base + 8 + update_localdb_in_message_at + 1) % 256; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> update_localdb_in_message_record.last_update_index_time[update_localdb_in_message_at] = (update_localdb_in_message_base + 12 + update_localdb_in_message_at + 1) % 256; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_record.request_for_open_orders = (update_localdb_in_message_base + 16 + 1) % 256;
  update_localdb_in_message_record.c_filler = (update_localdb_in_message_base + 17 + 1) % 256;
  ramp_st_market_status(update_localdb_in_message_record.st_market_status, update_localdb_in_message_base + 18);
  ramp_st_ex_market_status(update_localdb_in_message_record.st_ex_market_status, update_localdb_in_message_base + 26);
  ramp_st_pl_market_status(update_localdb_in_message_record.st_pl_market_status, update_localdb_in_message_base + 34);
  skip
}

/* Update Localdb In Message to the wire, 42 bytes from where the cursor stands */
inline encode_update_localdb_in_message(update_localdb_in_message_record) {
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> wire[at] = update_localdb_in_message_record.last_update_security_time[update_localdb_in_message_at]; at = at + 1; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> wire[at] = update_localdb_in_message_record.last_update_participant_time[update_localdb_in_message_at]; at = at + 1; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> wire[at] = update_localdb_in_message_record.last_update_instrument_time[update_localdb_in_message_at]; at = at + 1; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> wire[at] = update_localdb_in_message_record.last_update_index_time[update_localdb_in_message_at]; at = at + 1; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  wire[at] = update_localdb_in_message_record.request_for_open_orders; at = at + 1;
  wire[at] = update_localdb_in_message_record.c_filler; at = at + 1;
  encode_st_market_status(update_localdb_in_message_record.st_market_status);
  encode_st_ex_market_status(update_localdb_in_message_record.st_ex_market_status);
  encode_st_pl_market_status(update_localdb_in_message_record.st_pl_market_status);
  skip
}

/* Update Localdb In Message off the wire, 42 bytes from where the cursor stands */
inline decode_update_localdb_in_message(update_localdb_in_message_record) {
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> update_localdb_in_message_record.last_update_security_time[update_localdb_in_message_at] = wire[at]; at = at + 1; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> update_localdb_in_message_record.last_update_participant_time[update_localdb_in_message_at] = wire[at]; at = at + 1; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> update_localdb_in_message_record.last_update_instrument_time[update_localdb_in_message_at] = wire[at]; at = at + 1; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> update_localdb_in_message_record.last_update_index_time[update_localdb_in_message_at] = wire[at]; at = at + 1; update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_record.request_for_open_orders = wire[at]; at = at + 1;
  update_localdb_in_message_record.c_filler = wire[at]; at = at + 1;
  decode_st_market_status(update_localdb_in_message_record.st_market_status);
  decode_st_ex_market_status(update_localdb_in_message_record.st_ex_market_status);
  decode_st_pl_market_status(update_localdb_in_message_record.st_pl_market_status);
  skip
}

/* what was read of Update Localdb In Message is what was written, byte for byte */
inline equal_update_localdb_in_message(update_localdb_in_message_read, update_localdb_in_message_written) {
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> assert(update_localdb_in_message_read.last_update_security_time[update_localdb_in_message_at] == update_localdb_in_message_written.last_update_security_time[update_localdb_in_message_at]); update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> assert(update_localdb_in_message_read.last_update_participant_time[update_localdb_in_message_at] == update_localdb_in_message_written.last_update_participant_time[update_localdb_in_message_at]); update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> assert(update_localdb_in_message_read.last_update_instrument_time[update_localdb_in_message_at] == update_localdb_in_message_written.last_update_instrument_time[update_localdb_in_message_at]); update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  update_localdb_in_message_at = 0;
  do
  :: update_localdb_in_message_at < 4 -> assert(update_localdb_in_message_read.last_update_index_time[update_localdb_in_message_at] == update_localdb_in_message_written.last_update_index_time[update_localdb_in_message_at]); update_localdb_in_message_at = update_localdb_in_message_at + 1
  :: else -> break
  od;
  assert(update_localdb_in_message_read.request_for_open_orders == update_localdb_in_message_written.request_for_open_orders);
  assert(update_localdb_in_message_read.c_filler == update_localdb_in_message_written.c_filler);
  equal_st_market_status(update_localdb_in_message_read.st_market_status, update_localdb_in_message_written.st_market_status);
  equal_st_ex_market_status(update_localdb_in_message_read.st_ex_market_status, update_localdb_in_message_written.st_ex_market_status);
  equal_st_pl_market_status(update_localdb_in_message_read.st_pl_market_status, update_localdb_in_message_written.st_pl_market_status);
  skip
}

/* ---- Box Sign On Request In Message: 20 bytes -------------------------------- */

/* 23000 MS_BOX_SIGN_ON_REQUEST 60 I _IN Confidential Commodity Derivatives Trading System - Protocol for Non-Neat Front End, carried in the MS_BOX_SIGN_ON_REQUEST_IN structure */
typedef BoxSignOnRequestInMessage {
  byte box_id[2];
  byte broker_id[5];
  byte reserved_5[5];
  byte session_key[8]
};

int box_sign_on_request_in_message_at;

/* every byte of Box Sign On Request In Message set to one value */
inline fill_box_sign_on_request_in_message(box_sign_on_request_in_message_record, box_sign_on_request_in_message_value) {
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 2 -> box_sign_on_request_in_message_record.box_id[box_sign_on_request_in_message_at] = box_sign_on_request_in_message_value; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> box_sign_on_request_in_message_record.broker_id[box_sign_on_request_in_message_at] = box_sign_on_request_in_message_value; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> box_sign_on_request_in_message_record.reserved_5[box_sign_on_request_in_message_at] = box_sign_on_request_in_message_value; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 8 -> box_sign_on_request_in_message_record.session_key[box_sign_on_request_in_message_at] = box_sign_on_request_in_message_value; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Box Sign On Request In Message set to where it lies, so a field read out of place says so */
inline ramp_box_sign_on_request_in_message(box_sign_on_request_in_message_record, box_sign_on_request_in_message_base) {
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 2 -> box_sign_on_request_in_message_record.box_id[box_sign_on_request_in_message_at] = (box_sign_on_request_in_message_base + 0 + box_sign_on_request_in_message_at + 1) % 256; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> box_sign_on_request_in_message_record.broker_id[box_sign_on_request_in_message_at] = (box_sign_on_request_in_message_base + 2 + box_sign_on_request_in_message_at + 1) % 256; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> box_sign_on_request_in_message_record.reserved_5[box_sign_on_request_in_message_at] = (box_sign_on_request_in_message_base + 7 + box_sign_on_request_in_message_at + 1) % 256; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 8 -> box_sign_on_request_in_message_record.session_key[box_sign_on_request_in_message_at] = (box_sign_on_request_in_message_base + 12 + box_sign_on_request_in_message_at + 1) % 256; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Request In Message to the wire, 20 bytes from where the cursor stands */
inline encode_box_sign_on_request_in_message(box_sign_on_request_in_message_record) {
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 2 -> wire[at] = box_sign_on_request_in_message_record.box_id[box_sign_on_request_in_message_at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> wire[at] = box_sign_on_request_in_message_record.broker_id[box_sign_on_request_in_message_at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> wire[at] = box_sign_on_request_in_message_record.reserved_5[box_sign_on_request_in_message_at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 8 -> wire[at] = box_sign_on_request_in_message_record.session_key[box_sign_on_request_in_message_at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Request In Message off the wire, 20 bytes from where the cursor stands */
inline decode_box_sign_on_request_in_message(box_sign_on_request_in_message_record) {
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 2 -> box_sign_on_request_in_message_record.box_id[box_sign_on_request_in_message_at] = wire[at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> box_sign_on_request_in_message_record.broker_id[box_sign_on_request_in_message_at] = wire[at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> box_sign_on_request_in_message_record.reserved_5[box_sign_on_request_in_message_at] = wire[at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 8 -> box_sign_on_request_in_message_record.session_key[box_sign_on_request_in_message_at] = wire[at]; at = at + 1; box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Box Sign On Request In Message is what was written, byte for byte */
inline equal_box_sign_on_request_in_message(box_sign_on_request_in_message_read, box_sign_on_request_in_message_written) {
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 2 -> assert(box_sign_on_request_in_message_read.box_id[box_sign_on_request_in_message_at] == box_sign_on_request_in_message_written.box_id[box_sign_on_request_in_message_at]); box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> assert(box_sign_on_request_in_message_read.broker_id[box_sign_on_request_in_message_at] == box_sign_on_request_in_message_written.broker_id[box_sign_on_request_in_message_at]); box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 5 -> assert(box_sign_on_request_in_message_read.reserved_5[box_sign_on_request_in_message_at] == box_sign_on_request_in_message_written.reserved_5[box_sign_on_request_in_message_at]); box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_in_message_at = 0;
  do
  :: box_sign_on_request_in_message_at < 8 -> assert(box_sign_on_request_in_message_read.session_key[box_sign_on_request_in_message_at] == box_sign_on_request_in_message_written.session_key[box_sign_on_request_in_message_at]); box_sign_on_request_in_message_at = box_sign_on_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Secure Box Registration Request In Message: 2 bytes --------------------- */

/* Secure Box Registration Request In, carried in the MS_SECURE_BOX_REGISTRATION_REQUEST_IN structure */
typedef SecureBoxRegistrationRequestInMessage {
  byte box_id[2]
};

int secure_box_registration_request_in_message_at;

/* every byte of Secure Box Registration Request In Message set to one value */
inline fill_secure_box_registration_request_in_message(secure_box_registration_request_in_message_record, secure_box_registration_request_in_message_value) {
  secure_box_registration_request_in_message_at = 0;
  do
  :: secure_box_registration_request_in_message_at < 2 -> secure_box_registration_request_in_message_record.box_id[secure_box_registration_request_in_message_at] = secure_box_registration_request_in_message_value; secure_box_registration_request_in_message_at = secure_box_registration_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Secure Box Registration Request In Message set to where it lies, so a field read out of place says so */
inline ramp_secure_box_registration_request_in_message(secure_box_registration_request_in_message_record, secure_box_registration_request_in_message_base) {
  secure_box_registration_request_in_message_at = 0;
  do
  :: secure_box_registration_request_in_message_at < 2 -> secure_box_registration_request_in_message_record.box_id[secure_box_registration_request_in_message_at] = (secure_box_registration_request_in_message_base + 0 + secure_box_registration_request_in_message_at + 1) % 256; secure_box_registration_request_in_message_at = secure_box_registration_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Secure Box Registration Request In Message to the wire, 2 bytes from where the cursor stands */
inline encode_secure_box_registration_request_in_message(secure_box_registration_request_in_message_record) {
  secure_box_registration_request_in_message_at = 0;
  do
  :: secure_box_registration_request_in_message_at < 2 -> wire[at] = secure_box_registration_request_in_message_record.box_id[secure_box_registration_request_in_message_at]; at = at + 1; secure_box_registration_request_in_message_at = secure_box_registration_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Secure Box Registration Request In Message off the wire, 2 bytes from where the cursor stands */
inline decode_secure_box_registration_request_in_message(secure_box_registration_request_in_message_record) {
  secure_box_registration_request_in_message_at = 0;
  do
  :: secure_box_registration_request_in_message_at < 2 -> secure_box_registration_request_in_message_record.box_id[secure_box_registration_request_in_message_at] = wire[at]; at = at + 1; secure_box_registration_request_in_message_at = secure_box_registration_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Secure Box Registration Request In Message is what was written, byte for byte */
inline equal_secure_box_registration_request_in_message(secure_box_registration_request_in_message_read, secure_box_registration_request_in_message_written) {
  secure_box_registration_request_in_message_at = 0;
  do
  :: secure_box_registration_request_in_message_at < 2 -> assert(secure_box_registration_request_in_message_read.box_id[secure_box_registration_request_in_message_at] == secure_box_registration_request_in_message_written.box_id[secure_box_registration_request_in_message_at]); secure_box_registration_request_in_message_at = secure_box_registration_request_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

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
    assert(at == 40);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 40);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* System Information In Message: encoded, read back, and compared */
proctype check_system_information_in_message() {
  SystemInformationInMessage system_information_in_message_sent;
  SystemInformationInMessage system_information_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_information_in_message(system_information_in_message_sent, 0)
  :: pattern == 1 -> fill_system_information_in_message(system_information_in_message_sent, 32)
  :: pattern == 2 -> fill_system_information_in_message(system_information_in_message_sent, 255)
  :: else -> ramp_system_information_in_message(system_information_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_information_in_message(system_information_in_message_sent);
    assert(at == 4);
    at = 0;
    decode_system_information_in_message(system_information_in_message_got);
    assert(at == 4);
    equal_system_information_in_message(system_information_in_message_got, system_information_in_message_sent)
  }
}

/* Contract Desc: encoded, read back, and compared */
proctype check_contract_desc() {
  ContractDesc contract_desc_sent;
  ContractDesc contract_desc_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contract_desc(contract_desc_sent, 0)
  :: pattern == 1 -> fill_contract_desc(contract_desc_sent, 32)
  :: pattern == 2 -> fill_contract_desc(contract_desc_sent, 255)
  :: else -> ramp_contract_desc(contract_desc_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contract_desc(contract_desc_sent);
    assert(at == 28);
    at = 0;
    decode_contract_desc(contract_desc_got);
    assert(at == 28);
    equal_contract_desc(contract_desc_got, contract_desc_sent)
  }
}

/* Trade Cancel In Message: encoded, read back, and compared */
proctype check_trade_cancel_in_message() {
  TradeCancelInMessage trade_cancel_in_message_sent;
  TradeCancelInMessage trade_cancel_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_in_message(trade_cancel_in_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_in_message(trade_cancel_in_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_in_message(trade_cancel_in_message_sent, 255)
  :: else -> ramp_trade_cancel_in_message(trade_cancel_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_in_message(trade_cancel_in_message_sent);
    assert(at == 194);
    at = 0;
    decode_trade_cancel_in_message(trade_cancel_in_message_got);
    assert(at == 194);
    equal_trade_cancel_in_message(trade_cancel_in_message_got, trade_cancel_in_message_sent)
  }
}

/* Trade Mod In Message: encoded, read back, and compared */
proctype check_trade_mod_in_message() {
  TradeModInMessage trade_mod_in_message_sent;
  TradeModInMessage trade_mod_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_mod_in_message(trade_mod_in_message_sent, 0)
  :: pattern == 1 -> fill_trade_mod_in_message(trade_mod_in_message_sent, 32)
  :: pattern == 2 -> fill_trade_mod_in_message(trade_mod_in_message_sent, 255)
  :: else -> ramp_trade_mod_in_message(trade_mod_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_mod_in_message(trade_mod_in_message_sent);
    assert(at == 194);
    at = 0;
    decode_trade_mod_in_message(trade_mod_in_message_got);
    assert(at == 194);
    equal_trade_mod_in_message(trade_mod_in_message_got, trade_mod_in_message_sent)
  }
}

/* Gr Request Message: encoded, read back, and compared */
proctype check_gr_request_message() {
  GrRequestMessage gr_request_message_sent;
  GrRequestMessage gr_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_gr_request_message(gr_request_message_sent, 0)
  :: pattern == 1 -> fill_gr_request_message(gr_request_message_sent, 32)
  :: pattern == 2 -> fill_gr_request_message(gr_request_message_sent, 255)
  :: else -> ramp_gr_request_message(gr_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_gr_request_message(gr_request_message_sent);
    assert(at == 8);
    at = 0;
    decode_gr_request_message(gr_request_message_got);
    assert(at == 8);
    equal_gr_request_message(gr_request_message_got, gr_request_message_sent)
  }
}

/* User Addr Unlock In Message: encoded, read back, and compared */
proctype check_user_addr_unlock_in_message() {
  UserAddrUnlockInMessage user_addr_unlock_in_message_sent;
  UserAddrUnlockInMessage user_addr_unlock_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_addr_unlock_in_message(user_addr_unlock_in_message_sent, 0)
  :: pattern == 1 -> fill_user_addr_unlock_in_message(user_addr_unlock_in_message_sent, 32)
  :: pattern == 2 -> fill_user_addr_unlock_in_message(user_addr_unlock_in_message_sent, 255)
  :: else -> ramp_user_addr_unlock_in_message(user_addr_unlock_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_addr_unlock_in_message(user_addr_unlock_in_message_sent);
    assert(at == 74);
    at = 0;
    decode_user_addr_unlock_in_message(user_addr_unlock_in_message_got);
    assert(at == 74);
    equal_user_addr_unlock_in_message(user_addr_unlock_in_message_got, user_addr_unlock_in_message_sent)
  }
}

/* Reset User Password In Message: encoded, read back, and compared */
proctype check_reset_user_password_in_message() {
  ResetUserPasswordInMessage reset_user_password_in_message_sent;
  ResetUserPasswordInMessage reset_user_password_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reset_user_password_in_message(reset_user_password_in_message_sent, 0)
  :: pattern == 1 -> fill_reset_user_password_in_message(reset_user_password_in_message_sent, 32)
  :: pattern == 2 -> fill_reset_user_password_in_message(reset_user_password_in_message_sent, 255)
  :: else -> ramp_reset_user_password_in_message(reset_user_password_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reset_user_password_in_message(reset_user_password_in_message_sent);
    assert(at == 18);
    at = 0;
    decode_reset_user_password_in_message(reset_user_password_in_message_got);
    assert(at == 18);
    equal_reset_user_password_in_message(reset_user_password_in_message_got, reset_user_password_in_message_sent)
  }
}

/* Col User Status Change In Message: encoded, read back, and compared */
proctype check_col_user_status_change_in_message() {
  ColUserStatusChangeInMessage col_user_status_change_in_message_sent;
  ColUserStatusChangeInMessage col_user_status_change_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_col_user_status_change_in_message(col_user_status_change_in_message_sent, 0)
  :: pattern == 1 -> fill_col_user_status_change_in_message(col_user_status_change_in_message_sent, 32)
  :: pattern == 2 -> fill_col_user_status_change_in_message(col_user_status_change_in_message_sent, 255)
  :: else -> ramp_col_user_status_change_in_message(col_user_status_change_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_col_user_status_change_in_message(col_user_status_change_in_message_sent);
    assert(at == 12);
    at = 0;
    decode_col_user_status_change_in_message(col_user_status_change_in_message_got);
    assert(at == 12);
    equal_col_user_status_change_in_message(col_user_status_change_in_message_got, col_user_status_change_in_message_sent)
  }
}

/* St Market Status: encoded, read back, and compared */
proctype check_st_market_status() {
  StMarketStatus st_market_status_sent;
  StMarketStatus st_market_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_st_market_status(st_market_status_sent, 0)
  :: pattern == 1 -> fill_st_market_status(st_market_status_sent, 32)
  :: pattern == 2 -> fill_st_market_status(st_market_status_sent, 255)
  :: else -> ramp_st_market_status(st_market_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_st_market_status(st_market_status_sent);
    assert(at == 8);
    at = 0;
    decode_st_market_status(st_market_status_got);
    assert(at == 8);
    equal_st_market_status(st_market_status_got, st_market_status_sent)
  }
}

/* St Ex Market Status: encoded, read back, and compared */
proctype check_st_ex_market_status() {
  StExMarketStatus st_ex_market_status_sent;
  StExMarketStatus st_ex_market_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_st_ex_market_status(st_ex_market_status_sent, 0)
  :: pattern == 1 -> fill_st_ex_market_status(st_ex_market_status_sent, 32)
  :: pattern == 2 -> fill_st_ex_market_status(st_ex_market_status_sent, 255)
  :: else -> ramp_st_ex_market_status(st_ex_market_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_st_ex_market_status(st_ex_market_status_sent);
    assert(at == 8);
    at = 0;
    decode_st_ex_market_status(st_ex_market_status_got);
    assert(at == 8);
    equal_st_ex_market_status(st_ex_market_status_got, st_ex_market_status_sent)
  }
}

/* St Pl Market Status: encoded, read back, and compared */
proctype check_st_pl_market_status() {
  StPlMarketStatus st_pl_market_status_sent;
  StPlMarketStatus st_pl_market_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_st_pl_market_status(st_pl_market_status_sent, 0)
  :: pattern == 1 -> fill_st_pl_market_status(st_pl_market_status_sent, 32)
  :: pattern == 2 -> fill_st_pl_market_status(st_pl_market_status_sent, 255)
  :: else -> ramp_st_pl_market_status(st_pl_market_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_st_pl_market_status(st_pl_market_status_sent);
    assert(at == 8);
    at = 0;
    decode_st_pl_market_status(st_pl_market_status_got);
    assert(at == 8);
    equal_st_pl_market_status(st_pl_market_status_got, st_pl_market_status_sent)
  }
}

/* Update Localdb In Message: encoded, read back, and compared */
proctype check_update_localdb_in_message() {
  UpdateLocaldbInMessage update_localdb_in_message_sent;
  UpdateLocaldbInMessage update_localdb_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_update_localdb_in_message(update_localdb_in_message_sent, 0)
  :: pattern == 1 -> fill_update_localdb_in_message(update_localdb_in_message_sent, 32)
  :: pattern == 2 -> fill_update_localdb_in_message(update_localdb_in_message_sent, 255)
  :: else -> ramp_update_localdb_in_message(update_localdb_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_update_localdb_in_message(update_localdb_in_message_sent);
    assert(at == 42);
    at = 0;
    decode_update_localdb_in_message(update_localdb_in_message_got);
    assert(at == 42);
    equal_update_localdb_in_message(update_localdb_in_message_got, update_localdb_in_message_sent)
  }
}

/* Box Sign On Request In Message: encoded, read back, and compared */
proctype check_box_sign_on_request_in_message() {
  BoxSignOnRequestInMessage box_sign_on_request_in_message_sent;
  BoxSignOnRequestInMessage box_sign_on_request_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_box_sign_on_request_in_message(box_sign_on_request_in_message_sent, 0)
  :: pattern == 1 -> fill_box_sign_on_request_in_message(box_sign_on_request_in_message_sent, 32)
  :: pattern == 2 -> fill_box_sign_on_request_in_message(box_sign_on_request_in_message_sent, 255)
  :: else -> ramp_box_sign_on_request_in_message(box_sign_on_request_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_box_sign_on_request_in_message(box_sign_on_request_in_message_sent);
    assert(at == 20);
    at = 0;
    decode_box_sign_on_request_in_message(box_sign_on_request_in_message_got);
    assert(at == 20);
    equal_box_sign_on_request_in_message(box_sign_on_request_in_message_got, box_sign_on_request_in_message_sent)
  }
}

/* Secure Box Registration Request In Message: encoded, read back, and compared */
proctype check_secure_box_registration_request_in_message() {
  SecureBoxRegistrationRequestInMessage secure_box_registration_request_in_message_sent;
  SecureBoxRegistrationRequestInMessage secure_box_registration_request_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_secure_box_registration_request_in_message(secure_box_registration_request_in_message_sent, 0)
  :: pattern == 1 -> fill_secure_box_registration_request_in_message(secure_box_registration_request_in_message_sent, 32)
  :: pattern == 2 -> fill_secure_box_registration_request_in_message(secure_box_registration_request_in_message_sent, 255)
  :: else -> ramp_secure_box_registration_request_in_message(secure_box_registration_request_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_secure_box_registration_request_in_message(secure_box_registration_request_in_message_sent);
    assert(at == 2);
    at = 0;
    decode_secure_box_registration_request_in_message(secure_box_registration_request_in_message_got);
    assert(at == 2);
    equal_secure_box_registration_request_in_message(secure_box_registration_request_in_message_got, secure_box_registration_request_in_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_system_information_in_message()
  :: run check_contract_desc()
  :: run check_trade_cancel_in_message()
  :: run check_trade_mod_in_message()
  :: run check_gr_request_message()
  :: run check_user_addr_unlock_in_message()
  :: run check_reset_user_password_in_message()
  :: run check_col_user_status_change_in_message()
  :: run check_st_market_status()
  :: run check_st_ex_market_status()
  :: run check_st_pl_market_status()
  :: run check_update_localdb_in_message()
  :: run check_box_sign_on_request_in_message()
  :: run check_secure_box_registration_request_in_message()
  fi
}
