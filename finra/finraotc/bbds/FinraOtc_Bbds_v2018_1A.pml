/*
 * Financial Industry Regulatory Authority Bulletin Board Dissemination Service
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
 *   - the dispatch that chooses a message by its type
 *   - a field present only on a condition
 *   - a field ended by the first of several bytes it does not carry
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 45

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Datetime: 7 bytes ------------------------------------------------------- */

/* Datetime */
typedef Datetime {
  byte year[2];
  byte month;
  byte day;
  byte hour;
  byte minute;
  byte second
};

int datetime_at;

/* every byte of Datetime set to one value */
inline fill_datetime(datetime_record, datetime_value) {
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.year[datetime_at] = datetime_value; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_record.month = datetime_value;
  datetime_record.day = datetime_value;
  datetime_record.hour = datetime_value;
  datetime_record.minute = datetime_value;
  datetime_record.second = datetime_value;
  skip
}

/* each byte of Datetime set to where it lies, so a field read out of place says so */
inline ramp_datetime(datetime_record, datetime_base) {
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.year[datetime_at] = (datetime_base + 0 + datetime_at + 1) % 256; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_record.month = (datetime_base + 2 + 1) % 256;
  datetime_record.day = (datetime_base + 3 + 1) % 256;
  datetime_record.hour = (datetime_base + 4 + 1) % 256;
  datetime_record.minute = (datetime_base + 5 + 1) % 256;
  datetime_record.second = (datetime_base + 6 + 1) % 256;
  skip
}

/* Datetime to the wire, 7 bytes from where the cursor stands */
inline encode_datetime(datetime_record) {
  datetime_at = 0;
  do
  :: datetime_at < 2 -> wire[at] = datetime_record.year[datetime_at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  wire[at] = datetime_record.month; at = at + 1;
  wire[at] = datetime_record.day; at = at + 1;
  wire[at] = datetime_record.hour; at = at + 1;
  wire[at] = datetime_record.minute; at = at + 1;
  wire[at] = datetime_record.second; at = at + 1;
  skip
}

/* Datetime off the wire, 7 bytes from where the cursor stands */
inline decode_datetime(datetime_record) {
  datetime_at = 0;
  do
  :: datetime_at < 2 -> datetime_record.year[datetime_at] = wire[at]; at = at + 1; datetime_at = datetime_at + 1
  :: else -> break
  od;
  datetime_record.month = wire[at]; at = at + 1;
  datetime_record.day = wire[at]; at = at + 1;
  datetime_record.hour = wire[at]; at = at + 1;
  datetime_record.minute = wire[at]; at = at + 1;
  datetime_record.second = wire[at]; at = at + 1;
  skip
}

/* what was read of Datetime is what was written, byte for byte */
inline equal_datetime(datetime_read, datetime_written) {
  datetime_at = 0;
  do
  :: datetime_at < 2 -> assert(datetime_read.year[datetime_at] == datetime_written.year[datetime_at]); datetime_at = datetime_at + 1
  :: else -> break
  od;
  assert(datetime_read.month == datetime_written.month);
  assert(datetime_read.day == datetime_written.day);
  assert(datetime_read.hour == datetime_written.hour);
  assert(datetime_read.minute == datetime_written.minute);
  assert(datetime_read.second == datetime_written.second);
  skip
}

/* ---- Message Header: 20 bytes ------------------------------------------------ */

/* Message Header */
typedef MessageHeader {
  byte session_identifier;
  byte retransmission_requester[2];
  byte message_sequence_number[8];
  byte market_center_originator_id;
  Datetime datetime;
  byte reserved_1
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.session_identifier = message_header_value;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.retransmission_requester[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.message_sequence_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.market_center_originator_id = message_header_value;
  fill_datetime(message_header_record.datetime, message_header_value);
  message_header_record.reserved_1 = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.session_identifier = (message_header_base + 0 + 1) % 256;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.retransmission_requester[message_header_at] = (message_header_base + 1 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.message_sequence_number[message_header_at] = (message_header_base + 3 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.market_center_originator_id = (message_header_base + 11 + 1) % 256;
  ramp_datetime(message_header_record.datetime, message_header_base + 12);
  message_header_record.reserved_1 = (message_header_base + 19 + 1) % 256;
  skip
}

/* Message Header to the wire, 20 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.session_identifier; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.retransmission_requester[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.message_sequence_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.market_center_originator_id; at = at + 1;
  encode_datetime(message_header_record.datetime);
  wire[at] = message_header_record.reserved_1; at = at + 1;
  skip
}

/* Message Header off the wire, 20 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.session_identifier = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.retransmission_requester[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.message_sequence_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.market_center_originator_id = wire[at]; at = at + 1;
  decode_datetime(message_header_record.datetime);
  message_header_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.session_identifier == message_header_written.session_identifier);
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.retransmission_requester[message_header_at] == message_header_written.retransmission_requester[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.message_sequence_number[message_header_at] == message_header_written.message_sequence_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.market_center_originator_id == message_header_written.market_center_originator_id);
  equal_datetime(message_header_read.datetime, message_header_written.datetime);
  assert(message_header_read.reserved_1 == message_header_written.reserved_1);
  skip
}

/* ---- Action Datetime: 7 bytes ------------------------------------------------ */

/* Action Datetime */
typedef ActionDatetime {
  byte year[2];
  byte month;
  byte day;
  byte hour;
  byte minute;
  byte second
};

int action_datetime_at;

/* every byte of Action Datetime set to one value */
inline fill_action_datetime(action_datetime_record, action_datetime_value) {
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.year[action_datetime_at] = action_datetime_value; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_record.month = action_datetime_value;
  action_datetime_record.day = action_datetime_value;
  action_datetime_record.hour = action_datetime_value;
  action_datetime_record.minute = action_datetime_value;
  action_datetime_record.second = action_datetime_value;
  skip
}

/* each byte of Action Datetime set to where it lies, so a field read out of place says so */
inline ramp_action_datetime(action_datetime_record, action_datetime_base) {
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.year[action_datetime_at] = (action_datetime_base + 0 + action_datetime_at + 1) % 256; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_record.month = (action_datetime_base + 2 + 1) % 256;
  action_datetime_record.day = (action_datetime_base + 3 + 1) % 256;
  action_datetime_record.hour = (action_datetime_base + 4 + 1) % 256;
  action_datetime_record.minute = (action_datetime_base + 5 + 1) % 256;
  action_datetime_record.second = (action_datetime_base + 6 + 1) % 256;
  skip
}

/* Action Datetime to the wire, 7 bytes from where the cursor stands */
inline encode_action_datetime(action_datetime_record) {
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> wire[at] = action_datetime_record.year[action_datetime_at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  wire[at] = action_datetime_record.month; at = at + 1;
  wire[at] = action_datetime_record.day; at = at + 1;
  wire[at] = action_datetime_record.hour; at = at + 1;
  wire[at] = action_datetime_record.minute; at = at + 1;
  wire[at] = action_datetime_record.second; at = at + 1;
  skip
}

/* Action Datetime off the wire, 7 bytes from where the cursor stands */
inline decode_action_datetime(action_datetime_record) {
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> action_datetime_record.year[action_datetime_at] = wire[at]; at = at + 1; action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  action_datetime_record.month = wire[at]; at = at + 1;
  action_datetime_record.day = wire[at]; at = at + 1;
  action_datetime_record.hour = wire[at]; at = at + 1;
  action_datetime_record.minute = wire[at]; at = at + 1;
  action_datetime_record.second = wire[at]; at = at + 1;
  skip
}

/* what was read of Action Datetime is what was written, byte for byte */
inline equal_action_datetime(action_datetime_read, action_datetime_written) {
  action_datetime_at = 0;
  do
  :: action_datetime_at < 2 -> assert(action_datetime_read.year[action_datetime_at] == action_datetime_written.year[action_datetime_at]); action_datetime_at = action_datetime_at + 1
  :: else -> break
  od;
  assert(action_datetime_read.month == action_datetime_written.month);
  assert(action_datetime_read.day == action_datetime_written.day);
  assert(action_datetime_read.hour == action_datetime_written.hour);
  assert(action_datetime_read.minute == action_datetime_written.minute);
  assert(action_datetime_read.second == action_datetime_written.second);
  skip
}

/* ---- Trading Action Message: 45 bytes ---------------------------------------- */

/* FINRA will disseminate this message to inform customers of trading actions, such as halts or trading resumptions which affect individual OTCBB or Other OTC securities */
typedef TradingActionMessage {
  MessageHeader message_header;
  byte stock_symbol[11];
  byte action;
  ActionDatetime action_datetime;
  byte reason_code[6]
};

int trading_action_message_at;

/* every byte of Trading Action Message set to one value */
inline fill_trading_action_message(trading_action_message_record, trading_action_message_value) {
  fill_message_header(trading_action_message_record.message_header, trading_action_message_value);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 11 -> trading_action_message_record.stock_symbol[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.action = trading_action_message_value;
  fill_action_datetime(trading_action_message_record.action_datetime, trading_action_message_value);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> trading_action_message_record.reason_code[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_trading_action_message(trading_action_message_record, trading_action_message_base) {
  ramp_message_header(trading_action_message_record.message_header, trading_action_message_base + 0);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 11 -> trading_action_message_record.stock_symbol[trading_action_message_at] = (trading_action_message_base + 20 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.action = (trading_action_message_base + 31 + 1) % 256;
  ramp_action_datetime(trading_action_message_record.action_datetime, trading_action_message_base + 32);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> trading_action_message_record.reason_code[trading_action_message_at] = (trading_action_message_base + 39 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Action Message to the wire, 45 bytes from where the cursor stands */
inline encode_trading_action_message(trading_action_message_record) {
  encode_message_header(trading_action_message_record.message_header);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 11 -> wire[at] = trading_action_message_record.stock_symbol[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_action_message_record.action; at = at + 1;
  encode_action_datetime(trading_action_message_record.action_datetime);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> wire[at] = trading_action_message_record.reason_code[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Action Message off the wire, 45 bytes from where the cursor stands */
inline decode_trading_action_message(trading_action_message_record) {
  decode_message_header(trading_action_message_record.message_header);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 11 -> trading_action_message_record.stock_symbol[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.action = wire[at]; at = at + 1;
  decode_action_datetime(trading_action_message_record.action_datetime);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> trading_action_message_record.reason_code[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Action Message is what was written, byte for byte */
inline equal_trading_action_message(trading_action_message_read, trading_action_message_written) {
  equal_message_header(trading_action_message_read.message_header, trading_action_message_written.message_header);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 11 -> assert(trading_action_message_read.stock_symbol[trading_action_message_at] == trading_action_message_written.stock_symbol[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  assert(trading_action_message_read.action == trading_action_message_written.action);
  equal_action_datetime(trading_action_message_read.action_datetime, trading_action_message_written.action_datetime);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 6 -> assert(trading_action_message_read.reason_code[trading_action_message_at] == trading_action_message_written.reason_code[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Day Message: 20 bytes ------------------------------------------ */

/* The Start of Day control message signifies the beginning of each operational cycle for TDDS processing */
typedef StartOfDayMessage {
  MessageHeader message_header
};

/* every byte of Start Of Day Message set to one value */
inline fill_start_of_day_message(start_of_day_message_record, start_of_day_message_value) {
  fill_message_header(start_of_day_message_record.message_header, start_of_day_message_value);
  skip
}

/* each byte of Start Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_day_message(start_of_day_message_record, start_of_day_message_base) {
  ramp_message_header(start_of_day_message_record.message_header, start_of_day_message_base + 0);
  skip
}

/* Start Of Day Message to the wire, 20 bytes from where the cursor stands */
inline encode_start_of_day_message(start_of_day_message_record) {
  encode_message_header(start_of_day_message_record.message_header);
  skip
}

/* Start Of Day Message off the wire, 20 bytes from where the cursor stands */
inline decode_start_of_day_message(start_of_day_message_record) {
  decode_message_header(start_of_day_message_record.message_header);
  skip
}

/* what was read of Start Of Day Message is what was written, byte for byte */
inline equal_start_of_day_message(start_of_day_message_read, start_of_day_message_written) {
  equal_message_header(start_of_day_message_read.message_header, start_of_day_message_written.message_header);
  skip
}

/* ---- End Of Day Message: 20 bytes -------------------------------------------- */

/* The End of Day control message signals the end of active message dissemination for the TDDS operational cycle */
typedef EndOfDayMessage {
  MessageHeader message_header
};

/* every byte of End Of Day Message set to one value */
inline fill_end_of_day_message(end_of_day_message_record, end_of_day_message_value) {
  fill_message_header(end_of_day_message_record.message_header, end_of_day_message_value);
  skip
}

/* each byte of End Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_day_message(end_of_day_message_record, end_of_day_message_base) {
  ramp_message_header(end_of_day_message_record.message_header, end_of_day_message_base + 0);
  skip
}

/* End Of Day Message to the wire, 20 bytes from where the cursor stands */
inline encode_end_of_day_message(end_of_day_message_record) {
  encode_message_header(end_of_day_message_record.message_header);
  skip
}

/* End Of Day Message off the wire, 20 bytes from where the cursor stands */
inline decode_end_of_day_message(end_of_day_message_record) {
  decode_message_header(end_of_day_message_record.message_header);
  skip
}

/* what was read of End Of Day Message is what was written, byte for byte */
inline equal_end_of_day_message(end_of_day_message_read, end_of_day_message_written) {
  equal_message_header(end_of_day_message_read.message_header, end_of_day_message_written.message_header);
  skip
}

/* ---- Market Session Open Message: 20 bytes ----------------------------------- */

/* The Market Session Open Control Message signifies the opening of FINRA’s market systems for the session indicated in the Message Header */
typedef MarketSessionOpenMessage {
  MessageHeader message_header
};

/* every byte of Market Session Open Message set to one value */
inline fill_market_session_open_message(market_session_open_message_record, market_session_open_message_value) {
  fill_message_header(market_session_open_message_record.message_header, market_session_open_message_value);
  skip
}

/* each byte of Market Session Open Message set to where it lies, so a field read out of place says so */
inline ramp_market_session_open_message(market_session_open_message_record, market_session_open_message_base) {
  ramp_message_header(market_session_open_message_record.message_header, market_session_open_message_base + 0);
  skip
}

/* Market Session Open Message to the wire, 20 bytes from where the cursor stands */
inline encode_market_session_open_message(market_session_open_message_record) {
  encode_message_header(market_session_open_message_record.message_header);
  skip
}

/* Market Session Open Message off the wire, 20 bytes from where the cursor stands */
inline decode_market_session_open_message(market_session_open_message_record) {
  decode_message_header(market_session_open_message_record.message_header);
  skip
}

/* what was read of Market Session Open Message is what was written, byte for byte */
inline equal_market_session_open_message(market_session_open_message_read, market_session_open_message_written) {
  equal_message_header(market_session_open_message_read.message_header, market_session_open_message_written.message_header);
  skip
}

/* ---- Market Session Close Message: 20 bytes ---------------------------------- */

/* The Session Close Control Message signals the closing of FINRA’s market systems for the session indicated in the Message Header */
typedef MarketSessionCloseMessage {
  MessageHeader message_header
};

/* every byte of Market Session Close Message set to one value */
inline fill_market_session_close_message(market_session_close_message_record, market_session_close_message_value) {
  fill_message_header(market_session_close_message_record.message_header, market_session_close_message_value);
  skip
}

/* each byte of Market Session Close Message set to where it lies, so a field read out of place says so */
inline ramp_market_session_close_message(market_session_close_message_record, market_session_close_message_base) {
  ramp_message_header(market_session_close_message_record.message_header, market_session_close_message_base + 0);
  skip
}

/* Market Session Close Message to the wire, 20 bytes from where the cursor stands */
inline encode_market_session_close_message(market_session_close_message_record) {
  encode_message_header(market_session_close_message_record.message_header);
  skip
}

/* Market Session Close Message off the wire, 20 bytes from where the cursor stands */
inline decode_market_session_close_message(market_session_close_message_record) {
  decode_message_header(market_session_close_message_record.message_header);
  skip
}

/* what was read of Market Session Close Message is what was written, byte for byte */
inline equal_market_session_close_message(market_session_close_message_read, market_session_close_message_written) {
  equal_message_header(market_session_close_message_read.message_header, market_session_close_message_written.message_header);
  skip
}

/* ---- End Of Retransmission Requests Message: 20 bytes ------------------------ */

/* This message signals that no further retransmission requests will be honored. The End of Retransmission Requests message will be sent three times, at one-minute intervals */
typedef EndOfRetransmissionRequestsMessage {
  MessageHeader message_header
};

/* every byte of End Of Retransmission Requests Message set to one value */
inline fill_end_of_retransmission_requests_message(end_of_retransmission_requests_message_record, end_of_retransmission_requests_message_value) {
  fill_message_header(end_of_retransmission_requests_message_record.message_header, end_of_retransmission_requests_message_value);
  skip
}

/* each byte of End Of Retransmission Requests Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_retransmission_requests_message(end_of_retransmission_requests_message_record, end_of_retransmission_requests_message_base) {
  ramp_message_header(end_of_retransmission_requests_message_record.message_header, end_of_retransmission_requests_message_base + 0);
  skip
}

/* End Of Retransmission Requests Message to the wire, 20 bytes from where the cursor stands */
inline encode_end_of_retransmission_requests_message(end_of_retransmission_requests_message_record) {
  encode_message_header(end_of_retransmission_requests_message_record.message_header);
  skip
}

/* End Of Retransmission Requests Message off the wire, 20 bytes from where the cursor stands */
inline decode_end_of_retransmission_requests_message(end_of_retransmission_requests_message_record) {
  decode_message_header(end_of_retransmission_requests_message_record.message_header);
  skip
}

/* what was read of End Of Retransmission Requests Message is what was written, byte for byte */
inline equal_end_of_retransmission_requests_message(end_of_retransmission_requests_message_read, end_of_retransmission_requests_message_written) {
  equal_message_header(end_of_retransmission_requests_message_read.message_header, end_of_retransmission_requests_message_written.message_header);
  skip
}

/* ---- End Of Transmissions Message: 20 bytes ---------------------------------- */

/* The End of Transmissions Message signals that there will be no further transmissions of data sent through the TDDS line. */
typedef EndOfTransmissionsMessage {
  MessageHeader message_header
};

/* every byte of End Of Transmissions Message set to one value */
inline fill_end_of_transmissions_message(end_of_transmissions_message_record, end_of_transmissions_message_value) {
  fill_message_header(end_of_transmissions_message_record.message_header, end_of_transmissions_message_value);
  skip
}

/* each byte of End Of Transmissions Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_transmissions_message(end_of_transmissions_message_record, end_of_transmissions_message_base) {
  ramp_message_header(end_of_transmissions_message_record.message_header, end_of_transmissions_message_base + 0);
  skip
}

/* End Of Transmissions Message to the wire, 20 bytes from where the cursor stands */
inline encode_end_of_transmissions_message(end_of_transmissions_message_record) {
  encode_message_header(end_of_transmissions_message_record.message_header);
  skip
}

/* End Of Transmissions Message off the wire, 20 bytes from where the cursor stands */
inline decode_end_of_transmissions_message(end_of_transmissions_message_record) {
  decode_message_header(end_of_transmissions_message_record.message_header);
  skip
}

/* what was read of End Of Transmissions Message is what was written, byte for byte */
inline equal_end_of_transmissions_message(end_of_transmissions_message_read, end_of_transmissions_message_written) {
  equal_message_header(end_of_transmissions_message_read.message_header, end_of_transmissions_message_written.message_header);
  skip
}

/* ---- Line Integrity Message: 20 bytes ---------------------------------------- */

/* The Line Integrity Control Message will be transmitted at approximately one-minute intervals to verify the operational integrity of the TDDS message transmission, and will be intermixed with other messages */
typedef LineIntegrityMessage {
  MessageHeader message_header
};

/* every byte of Line Integrity Message set to one value */
inline fill_line_integrity_message(line_integrity_message_record, line_integrity_message_value) {
  fill_message_header(line_integrity_message_record.message_header, line_integrity_message_value);
  skip
}

/* each byte of Line Integrity Message set to where it lies, so a field read out of place says so */
inline ramp_line_integrity_message(line_integrity_message_record, line_integrity_message_base) {
  ramp_message_header(line_integrity_message_record.message_header, line_integrity_message_base + 0);
  skip
}

/* Line Integrity Message to the wire, 20 bytes from where the cursor stands */
inline encode_line_integrity_message(line_integrity_message_record) {
  encode_message_header(line_integrity_message_record.message_header);
  skip
}

/* Line Integrity Message off the wire, 20 bytes from where the cursor stands */
inline decode_line_integrity_message(line_integrity_message_record) {
  decode_message_header(line_integrity_message_record.message_header);
  skip
}

/* what was read of Line Integrity Message is what was written, byte for byte */
inline equal_line_integrity_message(line_integrity_message_read, line_integrity_message_written) {
  equal_message_header(line_integrity_message_read.message_header, line_integrity_message_written.message_header);
  skip
}

/* ---- Sequence Number Reset Message: 20 bytes --------------------------------- */

/* The Sequence Number Reset Message forces the resetting of the Sequence Number. The Sequence Number will either be reset to zero or to a number greater than the last number previously transmitted */
typedef SequenceNumberResetMessage {
  MessageHeader message_header
};

/* every byte of Sequence Number Reset Message set to one value */
inline fill_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_value) {
  fill_message_header(sequence_number_reset_message_record.message_header, sequence_number_reset_message_value);
  skip
}

/* each byte of Sequence Number Reset Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_base) {
  ramp_message_header(sequence_number_reset_message_record.message_header, sequence_number_reset_message_base + 0);
  skip
}

/* Sequence Number Reset Message to the wire, 20 bytes from where the cursor stands */
inline encode_sequence_number_reset_message(sequence_number_reset_message_record) {
  encode_message_header(sequence_number_reset_message_record.message_header);
  skip
}

/* Sequence Number Reset Message off the wire, 20 bytes from where the cursor stands */
inline decode_sequence_number_reset_message(sequence_number_reset_message_record) {
  decode_message_header(sequence_number_reset_message_record.message_header);
  skip
}

/* what was read of Sequence Number Reset Message is what was written, byte for byte */
inline equal_sequence_number_reset_message(sequence_number_reset_message_read, sequence_number_reset_message_written) {
  equal_message_header(sequence_number_reset_message_read.message_header, sequence_number_reset_message_written.message_header);
  skip
}

/* ---- End Of Trade Reporting Message: 20 bytes -------------------------------- */

/* The End of Trade Reporting Control Message signals that the ORF system is closed for market participant trade transactions */
typedef EndOfTradeReportingMessage {
  MessageHeader message_header
};

/* every byte of End Of Trade Reporting Message set to one value */
inline fill_end_of_trade_reporting_message(end_of_trade_reporting_message_record, end_of_trade_reporting_message_value) {
  fill_message_header(end_of_trade_reporting_message_record.message_header, end_of_trade_reporting_message_value);
  skip
}

/* each byte of End Of Trade Reporting Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_trade_reporting_message(end_of_trade_reporting_message_record, end_of_trade_reporting_message_base) {
  ramp_message_header(end_of_trade_reporting_message_record.message_header, end_of_trade_reporting_message_base + 0);
  skip
}

/* End Of Trade Reporting Message to the wire, 20 bytes from where the cursor stands */
inline encode_end_of_trade_reporting_message(end_of_trade_reporting_message_record) {
  encode_message_header(end_of_trade_reporting_message_record.message_header);
  skip
}

/* End Of Trade Reporting Message off the wire, 20 bytes from where the cursor stands */
inline decode_end_of_trade_reporting_message(end_of_trade_reporting_message_record) {
  decode_message_header(end_of_trade_reporting_message_record.message_header);
  skip
}

/* what was read of End Of Trade Reporting Message is what was written, byte for byte */
inline equal_end_of_trade_reporting_message(end_of_trade_reporting_message_read, end_of_trade_reporting_message_written) {
  equal_message_header(end_of_trade_reporting_message_read.message_header, end_of_trade_reporting_message_written.message_header);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Datetime: encoded, read back, and compared */
proctype check_datetime() {
  Datetime datetime_sent;
  Datetime datetime_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_datetime(datetime_sent, 0)
  :: pattern == 1 -> fill_datetime(datetime_sent, 32)
  :: pattern == 2 -> fill_datetime(datetime_sent, 255)
  :: else -> ramp_datetime(datetime_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_datetime(datetime_sent);
    assert(at == 7);
    at = 0;
    decode_datetime(datetime_got);
    assert(at == 7);
    equal_datetime(datetime_got, datetime_sent)
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
    assert(at == 20);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 20);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Action Datetime: encoded, read back, and compared */
proctype check_action_datetime() {
  ActionDatetime action_datetime_sent;
  ActionDatetime action_datetime_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_action_datetime(action_datetime_sent, 0)
  :: pattern == 1 -> fill_action_datetime(action_datetime_sent, 32)
  :: pattern == 2 -> fill_action_datetime(action_datetime_sent, 255)
  :: else -> ramp_action_datetime(action_datetime_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_action_datetime(action_datetime_sent);
    assert(at == 7);
    at = 0;
    decode_action_datetime(action_datetime_got);
    assert(at == 7);
    equal_action_datetime(action_datetime_got, action_datetime_sent)
  }
}

/* Trading Action Message: encoded, read back, and compared */
proctype check_trading_action_message() {
  TradingActionMessage trading_action_message_sent;
  TradingActionMessage trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_action_message(trading_action_message_sent, 0)
  :: pattern == 1 -> fill_trading_action_message(trading_action_message_sent, 32)
  :: pattern == 2 -> fill_trading_action_message(trading_action_message_sent, 255)
  :: else -> ramp_trading_action_message(trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_action_message(trading_action_message_sent);
    assert(at == 45);
    at = 0;
    decode_trading_action_message(trading_action_message_got);
    assert(at == 45);
    equal_trading_action_message(trading_action_message_got, trading_action_message_sent)
  }
}

/* Start Of Day Message: encoded, read back, and compared */
proctype check_start_of_day_message() {
  StartOfDayMessage start_of_day_message_sent;
  StartOfDayMessage start_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_day_message(start_of_day_message_sent, 0)
  :: pattern == 1 -> fill_start_of_day_message(start_of_day_message_sent, 32)
  :: pattern == 2 -> fill_start_of_day_message(start_of_day_message_sent, 255)
  :: else -> ramp_start_of_day_message(start_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_day_message(start_of_day_message_sent);
    assert(at == 20);
    at = 0;
    decode_start_of_day_message(start_of_day_message_got);
    assert(at == 20);
    equal_start_of_day_message(start_of_day_message_got, start_of_day_message_sent)
  }
}

/* End Of Day Message: encoded, read back, and compared */
proctype check_end_of_day_message() {
  EndOfDayMessage end_of_day_message_sent;
  EndOfDayMessage end_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_day_message(end_of_day_message_sent, 0)
  :: pattern == 1 -> fill_end_of_day_message(end_of_day_message_sent, 32)
  :: pattern == 2 -> fill_end_of_day_message(end_of_day_message_sent, 255)
  :: else -> ramp_end_of_day_message(end_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_day_message(end_of_day_message_sent);
    assert(at == 20);
    at = 0;
    decode_end_of_day_message(end_of_day_message_got);
    assert(at == 20);
    equal_end_of_day_message(end_of_day_message_got, end_of_day_message_sent)
  }
}

/* Market Session Open Message: encoded, read back, and compared */
proctype check_market_session_open_message() {
  MarketSessionOpenMessage market_session_open_message_sent;
  MarketSessionOpenMessage market_session_open_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_session_open_message(market_session_open_message_sent, 0)
  :: pattern == 1 -> fill_market_session_open_message(market_session_open_message_sent, 32)
  :: pattern == 2 -> fill_market_session_open_message(market_session_open_message_sent, 255)
  :: else -> ramp_market_session_open_message(market_session_open_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_session_open_message(market_session_open_message_sent);
    assert(at == 20);
    at = 0;
    decode_market_session_open_message(market_session_open_message_got);
    assert(at == 20);
    equal_market_session_open_message(market_session_open_message_got, market_session_open_message_sent)
  }
}

/* Market Session Close Message: encoded, read back, and compared */
proctype check_market_session_close_message() {
  MarketSessionCloseMessage market_session_close_message_sent;
  MarketSessionCloseMessage market_session_close_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_session_close_message(market_session_close_message_sent, 0)
  :: pattern == 1 -> fill_market_session_close_message(market_session_close_message_sent, 32)
  :: pattern == 2 -> fill_market_session_close_message(market_session_close_message_sent, 255)
  :: else -> ramp_market_session_close_message(market_session_close_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_session_close_message(market_session_close_message_sent);
    assert(at == 20);
    at = 0;
    decode_market_session_close_message(market_session_close_message_got);
    assert(at == 20);
    equal_market_session_close_message(market_session_close_message_got, market_session_close_message_sent)
  }
}

/* End Of Retransmission Requests Message: encoded, read back, and compared */
proctype check_end_of_retransmission_requests_message() {
  EndOfRetransmissionRequestsMessage end_of_retransmission_requests_message_sent;
  EndOfRetransmissionRequestsMessage end_of_retransmission_requests_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_retransmission_requests_message(end_of_retransmission_requests_message_sent, 0)
  :: pattern == 1 -> fill_end_of_retransmission_requests_message(end_of_retransmission_requests_message_sent, 32)
  :: pattern == 2 -> fill_end_of_retransmission_requests_message(end_of_retransmission_requests_message_sent, 255)
  :: else -> ramp_end_of_retransmission_requests_message(end_of_retransmission_requests_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_retransmission_requests_message(end_of_retransmission_requests_message_sent);
    assert(at == 20);
    at = 0;
    decode_end_of_retransmission_requests_message(end_of_retransmission_requests_message_got);
    assert(at == 20);
    equal_end_of_retransmission_requests_message(end_of_retransmission_requests_message_got, end_of_retransmission_requests_message_sent)
  }
}

/* End Of Transmissions Message: encoded, read back, and compared */
proctype check_end_of_transmissions_message() {
  EndOfTransmissionsMessage end_of_transmissions_message_sent;
  EndOfTransmissionsMessage end_of_transmissions_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_transmissions_message(end_of_transmissions_message_sent, 0)
  :: pattern == 1 -> fill_end_of_transmissions_message(end_of_transmissions_message_sent, 32)
  :: pattern == 2 -> fill_end_of_transmissions_message(end_of_transmissions_message_sent, 255)
  :: else -> ramp_end_of_transmissions_message(end_of_transmissions_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_transmissions_message(end_of_transmissions_message_sent);
    assert(at == 20);
    at = 0;
    decode_end_of_transmissions_message(end_of_transmissions_message_got);
    assert(at == 20);
    equal_end_of_transmissions_message(end_of_transmissions_message_got, end_of_transmissions_message_sent)
  }
}

/* Line Integrity Message: encoded, read back, and compared */
proctype check_line_integrity_message() {
  LineIntegrityMessage line_integrity_message_sent;
  LineIntegrityMessage line_integrity_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_line_integrity_message(line_integrity_message_sent, 0)
  :: pattern == 1 -> fill_line_integrity_message(line_integrity_message_sent, 32)
  :: pattern == 2 -> fill_line_integrity_message(line_integrity_message_sent, 255)
  :: else -> ramp_line_integrity_message(line_integrity_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_line_integrity_message(line_integrity_message_sent);
    assert(at == 20);
    at = 0;
    decode_line_integrity_message(line_integrity_message_got);
    assert(at == 20);
    equal_line_integrity_message(line_integrity_message_got, line_integrity_message_sent)
  }
}

/* Sequence Number Reset Message: encoded, read back, and compared */
proctype check_sequence_number_reset_message() {
  SequenceNumberResetMessage sequence_number_reset_message_sent;
  SequenceNumberResetMessage sequence_number_reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  :: pattern == 1 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 32)
  :: pattern == 2 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 255)
  :: else -> ramp_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_number_reset_message(sequence_number_reset_message_sent);
    assert(at == 20);
    at = 0;
    decode_sequence_number_reset_message(sequence_number_reset_message_got);
    assert(at == 20);
    equal_sequence_number_reset_message(sequence_number_reset_message_got, sequence_number_reset_message_sent)
  }
}

/* End Of Trade Reporting Message: encoded, read back, and compared */
proctype check_end_of_trade_reporting_message() {
  EndOfTradeReportingMessage end_of_trade_reporting_message_sent;
  EndOfTradeReportingMessage end_of_trade_reporting_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_trade_reporting_message(end_of_trade_reporting_message_sent, 0)
  :: pattern == 1 -> fill_end_of_trade_reporting_message(end_of_trade_reporting_message_sent, 32)
  :: pattern == 2 -> fill_end_of_trade_reporting_message(end_of_trade_reporting_message_sent, 255)
  :: else -> ramp_end_of_trade_reporting_message(end_of_trade_reporting_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_trade_reporting_message(end_of_trade_reporting_message_sent);
    assert(at == 20);
    at = 0;
    decode_end_of_trade_reporting_message(end_of_trade_reporting_message_got);
    assert(at == 20);
    equal_end_of_trade_reporting_message(end_of_trade_reporting_message_got, end_of_trade_reporting_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_datetime()
  :: run check_message_header()
  :: run check_action_datetime()
  :: run check_trading_action_message()
  :: run check_start_of_day_message()
  :: run check_end_of_day_message()
  :: run check_market_session_open_message()
  :: run check_market_session_close_message()
  :: run check_end_of_retransmission_requests_message()
  :: run check_end_of_transmissions_message()
  :: run check_line_integrity_message()
  :: run check_sequence_number_reset_message()
  :: run check_end_of_trade_reporting_message()
  fi
}
