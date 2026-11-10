/*
 * Box Options Market Sola Multicast
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 108

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 11 bytes ------------------------------------------------ */

/* Hsvf Udp Market Data Packet Header */
typedef MessageHeader {
  byte sequence_number[9];
  byte message_type[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 9 -> message_header_record.sequence_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 9 -> message_header_record.sequence_number[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = (message_header_base + 9 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 11 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 9 -> wire[at] = message_header_record.sequence_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_type[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 11 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 9 -> message_header_record.sequence_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 9 -> assert(message_header_read.sequence_number[message_header_at] == message_header_written.sequence_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_type[message_header_at] == message_header_written.message_type[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Transmission Message: 7 bytes ------------------------------------ */

/* This message will be sent to indicate that the day's transmission is complete */
typedef EndOfTransmissionMessage {
  byte exchange_id;
  byte time[6]
};

int end_of_transmission_message_at;

/* every byte of End Of Transmission Message set to one value */
inline fill_end_of_transmission_message(end_of_transmission_message_record, end_of_transmission_message_value) {
  end_of_transmission_message_record.exchange_id = end_of_transmission_message_value;
  end_of_transmission_message_at = 0;
  do
  :: end_of_transmission_message_at < 6 -> end_of_transmission_message_record.time[end_of_transmission_message_at] = end_of_transmission_message_value; end_of_transmission_message_at = end_of_transmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Transmission Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_transmission_message(end_of_transmission_message_record, end_of_transmission_message_base) {
  end_of_transmission_message_record.exchange_id = (end_of_transmission_message_base + 0 + 1) % 256;
  end_of_transmission_message_at = 0;
  do
  :: end_of_transmission_message_at < 6 -> end_of_transmission_message_record.time[end_of_transmission_message_at] = (end_of_transmission_message_base + 1 + end_of_transmission_message_at + 1) % 256; end_of_transmission_message_at = end_of_transmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Transmission Message to the wire, 7 bytes from where the cursor stands */
inline encode_end_of_transmission_message(end_of_transmission_message_record) {
  wire[at] = end_of_transmission_message_record.exchange_id; at = at + 1;
  end_of_transmission_message_at = 0;
  do
  :: end_of_transmission_message_at < 6 -> wire[at] = end_of_transmission_message_record.time[end_of_transmission_message_at]; at = at + 1; end_of_transmission_message_at = end_of_transmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Transmission Message off the wire, 7 bytes from where the cursor stands */
inline decode_end_of_transmission_message(end_of_transmission_message_record) {
  end_of_transmission_message_record.exchange_id = wire[at]; at = at + 1;
  end_of_transmission_message_at = 0;
  do
  :: end_of_transmission_message_at < 6 -> end_of_transmission_message_record.time[end_of_transmission_message_at] = wire[at]; at = at + 1; end_of_transmission_message_at = end_of_transmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Transmission Message is what was written, byte for byte */
inline equal_end_of_transmission_message(end_of_transmission_message_read, end_of_transmission_message_written) {
  assert(end_of_transmission_message_read.exchange_id == end_of_transmission_message_written.exchange_id);
  end_of_transmission_message_at = 0;
  do
  :: end_of_transmission_message_at < 6 -> assert(end_of_transmission_message_read.time[end_of_transmission_message_at] == end_of_transmission_message_written.time[end_of_transmission_message_at]); end_of_transmission_message_at = end_of_transmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Circuit Assurance Message: 6 bytes -------------------------------------- */

/* This message is sent out if no messages are sent by BOX for more than one second after the broadcast has started */
typedef CircuitAssuranceMessage {
  byte time[6]
};

int circuit_assurance_message_at;

/* every byte of Circuit Assurance Message set to one value */
inline fill_circuit_assurance_message(circuit_assurance_message_record, circuit_assurance_message_value) {
  circuit_assurance_message_at = 0;
  do
  :: circuit_assurance_message_at < 6 -> circuit_assurance_message_record.time[circuit_assurance_message_at] = circuit_assurance_message_value; circuit_assurance_message_at = circuit_assurance_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Circuit Assurance Message set to where it lies, so a field read out of place says so */
inline ramp_circuit_assurance_message(circuit_assurance_message_record, circuit_assurance_message_base) {
  circuit_assurance_message_at = 0;
  do
  :: circuit_assurance_message_at < 6 -> circuit_assurance_message_record.time[circuit_assurance_message_at] = (circuit_assurance_message_base + 0 + circuit_assurance_message_at + 1) % 256; circuit_assurance_message_at = circuit_assurance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Circuit Assurance Message to the wire, 6 bytes from where the cursor stands */
inline encode_circuit_assurance_message(circuit_assurance_message_record) {
  circuit_assurance_message_at = 0;
  do
  :: circuit_assurance_message_at < 6 -> wire[at] = circuit_assurance_message_record.time[circuit_assurance_message_at]; at = at + 1; circuit_assurance_message_at = circuit_assurance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Circuit Assurance Message off the wire, 6 bytes from where the cursor stands */
inline decode_circuit_assurance_message(circuit_assurance_message_record) {
  circuit_assurance_message_at = 0;
  do
  :: circuit_assurance_message_at < 6 -> circuit_assurance_message_record.time[circuit_assurance_message_at] = wire[at]; at = at + 1; circuit_assurance_message_at = circuit_assurance_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Circuit Assurance Message is what was written, byte for byte */
inline equal_circuit_assurance_message(circuit_assurance_message_read, circuit_assurance_message_written) {
  circuit_assurance_message_at = 0;
  do
  :: circuit_assurance_message_at < 6 -> assert(circuit_assurance_message_read.time[circuit_assurance_message_at] == circuit_assurance_message_written.time[circuit_assurance_message_at]); circuit_assurance_message_at = circuit_assurance_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Timestamp Message: 9 bytes --------------------------------------- */

/* This message is sent out every second and contains the time stamp when it was originally transmitted by the trading engine */
typedef SystemTimestampMessage {
  byte trading_engine_timestamp[9]
};

int system_timestamp_message_at;

/* every byte of System Timestamp Message set to one value */
inline fill_system_timestamp_message(system_timestamp_message_record, system_timestamp_message_value) {
  system_timestamp_message_at = 0;
  do
  :: system_timestamp_message_at < 9 -> system_timestamp_message_record.trading_engine_timestamp[system_timestamp_message_at] = system_timestamp_message_value; system_timestamp_message_at = system_timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Timestamp Message set to where it lies, so a field read out of place says so */
inline ramp_system_timestamp_message(system_timestamp_message_record, system_timestamp_message_base) {
  system_timestamp_message_at = 0;
  do
  :: system_timestamp_message_at < 9 -> system_timestamp_message_record.trading_engine_timestamp[system_timestamp_message_at] = (system_timestamp_message_base + 0 + system_timestamp_message_at + 1) % 256; system_timestamp_message_at = system_timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Timestamp Message to the wire, 9 bytes from where the cursor stands */
inline encode_system_timestamp_message(system_timestamp_message_record) {
  system_timestamp_message_at = 0;
  do
  :: system_timestamp_message_at < 9 -> wire[at] = system_timestamp_message_record.trading_engine_timestamp[system_timestamp_message_at]; at = at + 1; system_timestamp_message_at = system_timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Timestamp Message off the wire, 9 bytes from where the cursor stands */
inline decode_system_timestamp_message(system_timestamp_message_record) {
  system_timestamp_message_at = 0;
  do
  :: system_timestamp_message_at < 9 -> system_timestamp_message_record.trading_engine_timestamp[system_timestamp_message_at] = wire[at]; at = at + 1; system_timestamp_message_at = system_timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Timestamp Message is what was written, byte for byte */
inline equal_system_timestamp_message(system_timestamp_message_read, system_timestamp_message_written) {
  system_timestamp_message_at = 0;
  do
  :: system_timestamp_message_at < 9 -> assert(system_timestamp_message_read.trading_engine_timestamp[system_timestamp_message_at] == system_timestamp_message_written.trading_engine_timestamp[system_timestamp_message_at]); system_timestamp_message_at = system_timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Description: 20 bytes ---------------------------------------- */

typedef InstrumentDescription {
  byte root_symbol[6];
  byte expiry_month_code;
  byte filler_1;
  byte strike_price[7];
  byte strike_price_fraction_indicator;
  byte expiry_year[2];
  byte expiry_day[2]
};

int instrument_description_at;

/* every byte of Instrument Description set to one value */
inline fill_instrument_description(instrument_description_record, instrument_description_value) {
  instrument_description_at = 0;
  do
  :: instrument_description_at < 6 -> instrument_description_record.root_symbol[instrument_description_at] = instrument_description_value; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  instrument_description_record.expiry_month_code = instrument_description_value;
  instrument_description_record.filler_1 = instrument_description_value;
  instrument_description_at = 0;
  do
  :: instrument_description_at < 7 -> instrument_description_record.strike_price[instrument_description_at] = instrument_description_value; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  instrument_description_record.strike_price_fraction_indicator = instrument_description_value;
  instrument_description_at = 0;
  do
  :: instrument_description_at < 2 -> instrument_description_record.expiry_year[instrument_description_at] = instrument_description_value; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  instrument_description_at = 0;
  do
  :: instrument_description_at < 2 -> instrument_description_record.expiry_day[instrument_description_at] = instrument_description_value; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Description set to where it lies, so a field read out of place says so */
inline ramp_instrument_description(instrument_description_record, instrument_description_base) {
  instrument_description_at = 0;
  do
  :: instrument_description_at < 6 -> instrument_description_record.root_symbol[instrument_description_at] = (instrument_description_base + 0 + instrument_description_at + 1) % 256; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  instrument_description_record.expiry_month_code = (instrument_description_base + 6 + 1) % 256;
  instrument_description_record.filler_1 = (instrument_description_base + 7 + 1) % 256;
  instrument_description_at = 0;
  do
  :: instrument_description_at < 7 -> instrument_description_record.strike_price[instrument_description_at] = (instrument_description_base + 8 + instrument_description_at + 1) % 256; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  instrument_description_record.strike_price_fraction_indicator = (instrument_description_base + 15 + 1) % 256;
  instrument_description_at = 0;
  do
  :: instrument_description_at < 2 -> instrument_description_record.expiry_year[instrument_description_at] = (instrument_description_base + 16 + instrument_description_at + 1) % 256; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  instrument_description_at = 0;
  do
  :: instrument_description_at < 2 -> instrument_description_record.expiry_day[instrument_description_at] = (instrument_description_base + 18 + instrument_description_at + 1) % 256; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Description to the wire, 20 bytes from where the cursor stands */
inline encode_instrument_description(instrument_description_record) {
  instrument_description_at = 0;
  do
  :: instrument_description_at < 6 -> wire[at] = instrument_description_record.root_symbol[instrument_description_at]; at = at + 1; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  wire[at] = instrument_description_record.expiry_month_code; at = at + 1;
  wire[at] = instrument_description_record.filler_1; at = at + 1;
  instrument_description_at = 0;
  do
  :: instrument_description_at < 7 -> wire[at] = instrument_description_record.strike_price[instrument_description_at]; at = at + 1; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  wire[at] = instrument_description_record.strike_price_fraction_indicator; at = at + 1;
  instrument_description_at = 0;
  do
  :: instrument_description_at < 2 -> wire[at] = instrument_description_record.expiry_year[instrument_description_at]; at = at + 1; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  instrument_description_at = 0;
  do
  :: instrument_description_at < 2 -> wire[at] = instrument_description_record.expiry_day[instrument_description_at]; at = at + 1; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Description off the wire, 20 bytes from where the cursor stands */
inline decode_instrument_description(instrument_description_record) {
  instrument_description_at = 0;
  do
  :: instrument_description_at < 6 -> instrument_description_record.root_symbol[instrument_description_at] = wire[at]; at = at + 1; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  instrument_description_record.expiry_month_code = wire[at]; at = at + 1;
  instrument_description_record.filler_1 = wire[at]; at = at + 1;
  instrument_description_at = 0;
  do
  :: instrument_description_at < 7 -> instrument_description_record.strike_price[instrument_description_at] = wire[at]; at = at + 1; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  instrument_description_record.strike_price_fraction_indicator = wire[at]; at = at + 1;
  instrument_description_at = 0;
  do
  :: instrument_description_at < 2 -> instrument_description_record.expiry_year[instrument_description_at] = wire[at]; at = at + 1; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  instrument_description_at = 0;
  do
  :: instrument_description_at < 2 -> instrument_description_record.expiry_day[instrument_description_at] = wire[at]; at = at + 1; instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Description is what was written, byte for byte */
inline equal_instrument_description(instrument_description_read, instrument_description_written) {
  instrument_description_at = 0;
  do
  :: instrument_description_at < 6 -> assert(instrument_description_read.root_symbol[instrument_description_at] == instrument_description_written.root_symbol[instrument_description_at]); instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  assert(instrument_description_read.expiry_month_code == instrument_description_written.expiry_month_code);
  assert(instrument_description_read.filler_1 == instrument_description_written.filler_1);
  instrument_description_at = 0;
  do
  :: instrument_description_at < 7 -> assert(instrument_description_read.strike_price[instrument_description_at] == instrument_description_written.strike_price[instrument_description_at]); instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  assert(instrument_description_read.strike_price_fraction_indicator == instrument_description_written.strike_price_fraction_indicator);
  instrument_description_at = 0;
  do
  :: instrument_description_at < 2 -> assert(instrument_description_read.expiry_year[instrument_description_at] == instrument_description_written.expiry_year[instrument_description_at]); instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  instrument_description_at = 0;
  do
  :: instrument_description_at < 2 -> assert(instrument_description_read.expiry_day[instrument_description_at] == instrument_description_written.expiry_day[instrument_description_at]); instrument_description_at = instrument_description_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Group Opening Time Message: 14 bytes ------------------------------------ */

/* Group Opening Time */
typedef GroupOpeningTimeMessage {
  byte exchange_id;
  byte root_symbol[6];
  byte group_status;
  byte scheduled_time[6]
};

int group_opening_time_message_at;

/* every byte of Group Opening Time Message set to one value */
inline fill_group_opening_time_message(group_opening_time_message_record, group_opening_time_message_value) {
  group_opening_time_message_record.exchange_id = group_opening_time_message_value;
  group_opening_time_message_at = 0;
  do
  :: group_opening_time_message_at < 6 -> group_opening_time_message_record.root_symbol[group_opening_time_message_at] = group_opening_time_message_value; group_opening_time_message_at = group_opening_time_message_at + 1
  :: else -> break
  od;
  group_opening_time_message_record.group_status = group_opening_time_message_value;
  group_opening_time_message_at = 0;
  do
  :: group_opening_time_message_at < 6 -> group_opening_time_message_record.scheduled_time[group_opening_time_message_at] = group_opening_time_message_value; group_opening_time_message_at = group_opening_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Group Opening Time Message set to where it lies, so a field read out of place says so */
inline ramp_group_opening_time_message(group_opening_time_message_record, group_opening_time_message_base) {
  group_opening_time_message_record.exchange_id = (group_opening_time_message_base + 0 + 1) % 256;
  group_opening_time_message_at = 0;
  do
  :: group_opening_time_message_at < 6 -> group_opening_time_message_record.root_symbol[group_opening_time_message_at] = (group_opening_time_message_base + 1 + group_opening_time_message_at + 1) % 256; group_opening_time_message_at = group_opening_time_message_at + 1
  :: else -> break
  od;
  group_opening_time_message_record.group_status = (group_opening_time_message_base + 7 + 1) % 256;
  group_opening_time_message_at = 0;
  do
  :: group_opening_time_message_at < 6 -> group_opening_time_message_record.scheduled_time[group_opening_time_message_at] = (group_opening_time_message_base + 8 + group_opening_time_message_at + 1) % 256; group_opening_time_message_at = group_opening_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Group Opening Time Message to the wire, 14 bytes from where the cursor stands */
inline encode_group_opening_time_message(group_opening_time_message_record) {
  wire[at] = group_opening_time_message_record.exchange_id; at = at + 1;
  group_opening_time_message_at = 0;
  do
  :: group_opening_time_message_at < 6 -> wire[at] = group_opening_time_message_record.root_symbol[group_opening_time_message_at]; at = at + 1; group_opening_time_message_at = group_opening_time_message_at + 1
  :: else -> break
  od;
  wire[at] = group_opening_time_message_record.group_status; at = at + 1;
  group_opening_time_message_at = 0;
  do
  :: group_opening_time_message_at < 6 -> wire[at] = group_opening_time_message_record.scheduled_time[group_opening_time_message_at]; at = at + 1; group_opening_time_message_at = group_opening_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Group Opening Time Message off the wire, 14 bytes from where the cursor stands */
inline decode_group_opening_time_message(group_opening_time_message_record) {
  group_opening_time_message_record.exchange_id = wire[at]; at = at + 1;
  group_opening_time_message_at = 0;
  do
  :: group_opening_time_message_at < 6 -> group_opening_time_message_record.root_symbol[group_opening_time_message_at] = wire[at]; at = at + 1; group_opening_time_message_at = group_opening_time_message_at + 1
  :: else -> break
  od;
  group_opening_time_message_record.group_status = wire[at]; at = at + 1;
  group_opening_time_message_at = 0;
  do
  :: group_opening_time_message_at < 6 -> group_opening_time_message_record.scheduled_time[group_opening_time_message_at] = wire[at]; at = at + 1; group_opening_time_message_at = group_opening_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Group Opening Time Message is what was written, byte for byte */
inline equal_group_opening_time_message(group_opening_time_message_read, group_opening_time_message_written) {
  assert(group_opening_time_message_read.exchange_id == group_opening_time_message_written.exchange_id);
  group_opening_time_message_at = 0;
  do
  :: group_opening_time_message_at < 6 -> assert(group_opening_time_message_read.root_symbol[group_opening_time_message_at] == group_opening_time_message_written.root_symbol[group_opening_time_message_at]); group_opening_time_message_at = group_opening_time_message_at + 1
  :: else -> break
  od;
  assert(group_opening_time_message_read.group_status == group_opening_time_message_written.group_status);
  group_opening_time_message_at = 0;
  do
  :: group_opening_time_message_at < 6 -> assert(group_opening_time_message_read.scheduled_time[group_opening_time_message_at] == group_opening_time_message_written.scheduled_time[group_opening_time_message_at]); group_opening_time_message_at = group_opening_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Group Status Message: 8 bytes ------------------------------------------- */

/* This message will be sent when a group of trading instruments enters a new status */
typedef GroupStatusMessage {
  byte exchange_id;
  byte root_symbol[6];
  byte group_status
};

int group_status_message_at;

/* every byte of Group Status Message set to one value */
inline fill_group_status_message(group_status_message_record, group_status_message_value) {
  group_status_message_record.exchange_id = group_status_message_value;
  group_status_message_at = 0;
  do
  :: group_status_message_at < 6 -> group_status_message_record.root_symbol[group_status_message_at] = group_status_message_value; group_status_message_at = group_status_message_at + 1
  :: else -> break
  od;
  group_status_message_record.group_status = group_status_message_value;
  skip
}

/* each byte of Group Status Message set to where it lies, so a field read out of place says so */
inline ramp_group_status_message(group_status_message_record, group_status_message_base) {
  group_status_message_record.exchange_id = (group_status_message_base + 0 + 1) % 256;
  group_status_message_at = 0;
  do
  :: group_status_message_at < 6 -> group_status_message_record.root_symbol[group_status_message_at] = (group_status_message_base + 1 + group_status_message_at + 1) % 256; group_status_message_at = group_status_message_at + 1
  :: else -> break
  od;
  group_status_message_record.group_status = (group_status_message_base + 7 + 1) % 256;
  skip
}

/* Group Status Message to the wire, 8 bytes from where the cursor stands */
inline encode_group_status_message(group_status_message_record) {
  wire[at] = group_status_message_record.exchange_id; at = at + 1;
  group_status_message_at = 0;
  do
  :: group_status_message_at < 6 -> wire[at] = group_status_message_record.root_symbol[group_status_message_at]; at = at + 1; group_status_message_at = group_status_message_at + 1
  :: else -> break
  od;
  wire[at] = group_status_message_record.group_status; at = at + 1;
  skip
}

/* Group Status Message off the wire, 8 bytes from where the cursor stands */
inline decode_group_status_message(group_status_message_record) {
  group_status_message_record.exchange_id = wire[at]; at = at + 1;
  group_status_message_at = 0;
  do
  :: group_status_message_at < 6 -> group_status_message_record.root_symbol[group_status_message_at] = wire[at]; at = at + 1; group_status_message_at = group_status_message_at + 1
  :: else -> break
  od;
  group_status_message_record.group_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Group Status Message is what was written, byte for byte */
inline equal_group_status_message(group_status_message_read, group_status_message_written) {
  assert(group_status_message_read.exchange_id == group_status_message_written.exchange_id);
  group_status_message_at = 0;
  do
  :: group_status_message_at < 6 -> assert(group_status_message_read.root_symbol[group_status_message_at] == group_status_message_written.root_symbol[group_status_message_at]); group_status_message_at = group_status_message_at + 1
  :: else -> break
  od;
  assert(group_status_message_read.group_status == group_status_message_written.group_status);
  skip
}

/* ---- Strategies Group Status Message: 4 bytes -------------------------------- */

/* This message will be sent when a group of complex trading instruments enters a new status */
typedef StrategiesGroupStatusMessage {
  byte exchange_id;
  byte group_of_the_complex_order_instrument[2];
  byte group_status
};

int strategies_group_status_message_at;

/* every byte of Strategies Group Status Message set to one value */
inline fill_strategies_group_status_message(strategies_group_status_message_record, strategies_group_status_message_value) {
  strategies_group_status_message_record.exchange_id = strategies_group_status_message_value;
  strategies_group_status_message_at = 0;
  do
  :: strategies_group_status_message_at < 2 -> strategies_group_status_message_record.group_of_the_complex_order_instrument[strategies_group_status_message_at] = strategies_group_status_message_value; strategies_group_status_message_at = strategies_group_status_message_at + 1
  :: else -> break
  od;
  strategies_group_status_message_record.group_status = strategies_group_status_message_value;
  skip
}

/* each byte of Strategies Group Status Message set to where it lies, so a field read out of place says so */
inline ramp_strategies_group_status_message(strategies_group_status_message_record, strategies_group_status_message_base) {
  strategies_group_status_message_record.exchange_id = (strategies_group_status_message_base + 0 + 1) % 256;
  strategies_group_status_message_at = 0;
  do
  :: strategies_group_status_message_at < 2 -> strategies_group_status_message_record.group_of_the_complex_order_instrument[strategies_group_status_message_at] = (strategies_group_status_message_base + 1 + strategies_group_status_message_at + 1) % 256; strategies_group_status_message_at = strategies_group_status_message_at + 1
  :: else -> break
  od;
  strategies_group_status_message_record.group_status = (strategies_group_status_message_base + 3 + 1) % 256;
  skip
}

/* Strategies Group Status Message to the wire, 4 bytes from where the cursor stands */
inline encode_strategies_group_status_message(strategies_group_status_message_record) {
  wire[at] = strategies_group_status_message_record.exchange_id; at = at + 1;
  strategies_group_status_message_at = 0;
  do
  :: strategies_group_status_message_at < 2 -> wire[at] = strategies_group_status_message_record.group_of_the_complex_order_instrument[strategies_group_status_message_at]; at = at + 1; strategies_group_status_message_at = strategies_group_status_message_at + 1
  :: else -> break
  od;
  wire[at] = strategies_group_status_message_record.group_status; at = at + 1;
  skip
}

/* Strategies Group Status Message off the wire, 4 bytes from where the cursor stands */
inline decode_strategies_group_status_message(strategies_group_status_message_record) {
  strategies_group_status_message_record.exchange_id = wire[at]; at = at + 1;
  strategies_group_status_message_at = 0;
  do
  :: strategies_group_status_message_at < 2 -> strategies_group_status_message_record.group_of_the_complex_order_instrument[strategies_group_status_message_at] = wire[at]; at = at + 1; strategies_group_status_message_at = strategies_group_status_message_at + 1
  :: else -> break
  od;
  strategies_group_status_message_record.group_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Strategies Group Status Message is what was written, byte for byte */
inline equal_strategies_group_status_message(strategies_group_status_message_read, strategies_group_status_message_written) {
  assert(strategies_group_status_message_read.exchange_id == strategies_group_status_message_written.exchange_id);
  strategies_group_status_message_at = 0;
  do
  :: strategies_group_status_message_at < 2 -> assert(strategies_group_status_message_read.group_of_the_complex_order_instrument[strategies_group_status_message_at] == strategies_group_status_message_written.group_of_the_complex_order_instrument[strategies_group_status_message_at]); strategies_group_status_message_at = strategies_group_status_message_at + 1
  :: else -> break
  od;
  assert(strategies_group_status_message_read.group_status == strategies_group_status_message_written.group_status);
  skip
}

/* ---- Market Flow Indicator: 2 bytes ------------------------------------------ */

typedef MarketFlowIndicator {
  byte type_of_instrument;
  byte type_of_underlying
};

/* every byte of Market Flow Indicator set to one value */
inline fill_market_flow_indicator(market_flow_indicator_record, market_flow_indicator_value) {
  market_flow_indicator_record.type_of_instrument = market_flow_indicator_value;
  market_flow_indicator_record.type_of_underlying = market_flow_indicator_value;
  skip
}

/* each byte of Market Flow Indicator set to where it lies, so a field read out of place says so */
inline ramp_market_flow_indicator(market_flow_indicator_record, market_flow_indicator_base) {
  market_flow_indicator_record.type_of_instrument = (market_flow_indicator_base + 0 + 1) % 256;
  market_flow_indicator_record.type_of_underlying = (market_flow_indicator_base + 1 + 1) % 256;
  skip
}

/* Market Flow Indicator to the wire, 2 bytes from where the cursor stands */
inline encode_market_flow_indicator(market_flow_indicator_record) {
  wire[at] = market_flow_indicator_record.type_of_instrument; at = at + 1;
  wire[at] = market_flow_indicator_record.type_of_underlying; at = at + 1;
  skip
}

/* Market Flow Indicator off the wire, 2 bytes from where the cursor stands */
inline decode_market_flow_indicator(market_flow_indicator_record) {
  market_flow_indicator_record.type_of_instrument = wire[at]; at = at + 1;
  market_flow_indicator_record.type_of_underlying = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Flow Indicator is what was written, byte for byte */
inline equal_market_flow_indicator(market_flow_indicator_read, market_flow_indicator_written) {
  assert(market_flow_indicator_read.type_of_instrument == market_flow_indicator_written.type_of_instrument);
  assert(market_flow_indicator_read.type_of_underlying == market_flow_indicator_written.type_of_underlying);
  skip
}

/* ---- Option Marker: 2 bytes -------------------------------------------------- */

typedef OptionMarker {
  byte type_of_market;
  byte type_of_options
};

/* every byte of Option Marker set to one value */
inline fill_option_marker(option_marker_record, option_marker_value) {
  option_marker_record.type_of_market = option_marker_value;
  option_marker_record.type_of_options = option_marker_value;
  skip
}

/* each byte of Option Marker set to where it lies, so a field read out of place says so */
inline ramp_option_marker(option_marker_record, option_marker_base) {
  option_marker_record.type_of_market = (option_marker_base + 0 + 1) % 256;
  option_marker_record.type_of_options = (option_marker_base + 1 + 1) % 256;
  skip
}

/* Option Marker to the wire, 2 bytes from where the cursor stands */
inline encode_option_marker(option_marker_record) {
  wire[at] = option_marker_record.type_of_market; at = at + 1;
  wire[at] = option_marker_record.type_of_options; at = at + 1;
  skip
}

/* Option Marker off the wire, 2 bytes from where the cursor stands */
inline decode_option_marker(option_marker_record) {
  option_marker_record.type_of_market = wire[at]; at = at + 1;
  option_marker_record.type_of_options = wire[at]; at = at + 1;
  skip
}

/* what was read of Option Marker is what was written, byte for byte */
inline equal_option_marker(option_marker_read, option_marker_written) {
  assert(option_marker_read.type_of_market == option_marker_written.type_of_market);
  assert(option_marker_read.type_of_options == option_marker_written.type_of_options);
  skip
}

/* ---- Option Instrument Keys Message: 108 bytes ------------------------------- */

/* Option Instrument Keys */
typedef OptionInstrumentKeysMessage {
  byte exchange_id;
  InstrumentDescription instrument_description;
  byte strike_price_currency[3];
  byte maximum_number_of_contracts_per_order[6];
  byte minimum_number_of_contracts_per_order[6];
  byte maximum_threshold_price[6];
  byte maximum_threshold_price_fraction_indicator;
  byte minimum_threshold_price[6];
  byte minimum_threshold_price_fraction_indicator;
  byte tick_increment[6];
  byte tick_increment_fraction_indicator;
  byte option_type;
  MarketFlowIndicator market_flow_indicator;
  byte group_instrument[2];
  byte instrument[4];
  byte instrument_external_code[30];
  OptionMarker option_marker;
  byte underlying_symbol_root[10]
};

int option_instrument_keys_message_at;

/* every byte of Option Instrument Keys Message set to one value */
inline fill_option_instrument_keys_message(option_instrument_keys_message_record, option_instrument_keys_message_value) {
  option_instrument_keys_message_record.exchange_id = option_instrument_keys_message_value;
  fill_instrument_description(option_instrument_keys_message_record.instrument_description, option_instrument_keys_message_value);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 3 -> option_instrument_keys_message_record.strike_price_currency[option_instrument_keys_message_at] = option_instrument_keys_message_value; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.maximum_number_of_contracts_per_order[option_instrument_keys_message_at] = option_instrument_keys_message_value; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.minimum_number_of_contracts_per_order[option_instrument_keys_message_at] = option_instrument_keys_message_value; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.maximum_threshold_price[option_instrument_keys_message_at] = option_instrument_keys_message_value; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_record.maximum_threshold_price_fraction_indicator = option_instrument_keys_message_value;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.minimum_threshold_price[option_instrument_keys_message_at] = option_instrument_keys_message_value; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_record.minimum_threshold_price_fraction_indicator = option_instrument_keys_message_value;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.tick_increment[option_instrument_keys_message_at] = option_instrument_keys_message_value; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_record.tick_increment_fraction_indicator = option_instrument_keys_message_value;
  option_instrument_keys_message_record.option_type = option_instrument_keys_message_value;
  fill_market_flow_indicator(option_instrument_keys_message_record.market_flow_indicator, option_instrument_keys_message_value);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 2 -> option_instrument_keys_message_record.group_instrument[option_instrument_keys_message_at] = option_instrument_keys_message_value; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 4 -> option_instrument_keys_message_record.instrument[option_instrument_keys_message_at] = option_instrument_keys_message_value; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 30 -> option_instrument_keys_message_record.instrument_external_code[option_instrument_keys_message_at] = option_instrument_keys_message_value; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  fill_option_marker(option_instrument_keys_message_record.option_marker, option_instrument_keys_message_value);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 10 -> option_instrument_keys_message_record.underlying_symbol_root[option_instrument_keys_message_at] = option_instrument_keys_message_value; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Option Instrument Keys Message set to where it lies, so a field read out of place says so */
inline ramp_option_instrument_keys_message(option_instrument_keys_message_record, option_instrument_keys_message_base) {
  option_instrument_keys_message_record.exchange_id = (option_instrument_keys_message_base + 0 + 1) % 256;
  ramp_instrument_description(option_instrument_keys_message_record.instrument_description, option_instrument_keys_message_base + 1);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 3 -> option_instrument_keys_message_record.strike_price_currency[option_instrument_keys_message_at] = (option_instrument_keys_message_base + 21 + option_instrument_keys_message_at + 1) % 256; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.maximum_number_of_contracts_per_order[option_instrument_keys_message_at] = (option_instrument_keys_message_base + 24 + option_instrument_keys_message_at + 1) % 256; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.minimum_number_of_contracts_per_order[option_instrument_keys_message_at] = (option_instrument_keys_message_base + 30 + option_instrument_keys_message_at + 1) % 256; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.maximum_threshold_price[option_instrument_keys_message_at] = (option_instrument_keys_message_base + 36 + option_instrument_keys_message_at + 1) % 256; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_record.maximum_threshold_price_fraction_indicator = (option_instrument_keys_message_base + 42 + 1) % 256;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.minimum_threshold_price[option_instrument_keys_message_at] = (option_instrument_keys_message_base + 43 + option_instrument_keys_message_at + 1) % 256; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_record.minimum_threshold_price_fraction_indicator = (option_instrument_keys_message_base + 49 + 1) % 256;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.tick_increment[option_instrument_keys_message_at] = (option_instrument_keys_message_base + 50 + option_instrument_keys_message_at + 1) % 256; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_record.tick_increment_fraction_indicator = (option_instrument_keys_message_base + 56 + 1) % 256;
  option_instrument_keys_message_record.option_type = (option_instrument_keys_message_base + 57 + 1) % 256;
  ramp_market_flow_indicator(option_instrument_keys_message_record.market_flow_indicator, option_instrument_keys_message_base + 58);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 2 -> option_instrument_keys_message_record.group_instrument[option_instrument_keys_message_at] = (option_instrument_keys_message_base + 60 + option_instrument_keys_message_at + 1) % 256; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 4 -> option_instrument_keys_message_record.instrument[option_instrument_keys_message_at] = (option_instrument_keys_message_base + 62 + option_instrument_keys_message_at + 1) % 256; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 30 -> option_instrument_keys_message_record.instrument_external_code[option_instrument_keys_message_at] = (option_instrument_keys_message_base + 66 + option_instrument_keys_message_at + 1) % 256; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  ramp_option_marker(option_instrument_keys_message_record.option_marker, option_instrument_keys_message_base + 96);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 10 -> option_instrument_keys_message_record.underlying_symbol_root[option_instrument_keys_message_at] = (option_instrument_keys_message_base + 98 + option_instrument_keys_message_at + 1) % 256; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  skip
}

/* Option Instrument Keys Message to the wire, 108 bytes from where the cursor stands */
inline encode_option_instrument_keys_message(option_instrument_keys_message_record) {
  wire[at] = option_instrument_keys_message_record.exchange_id; at = at + 1;
  encode_instrument_description(option_instrument_keys_message_record.instrument_description);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 3 -> wire[at] = option_instrument_keys_message_record.strike_price_currency[option_instrument_keys_message_at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> wire[at] = option_instrument_keys_message_record.maximum_number_of_contracts_per_order[option_instrument_keys_message_at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> wire[at] = option_instrument_keys_message_record.minimum_number_of_contracts_per_order[option_instrument_keys_message_at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> wire[at] = option_instrument_keys_message_record.maximum_threshold_price[option_instrument_keys_message_at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  wire[at] = option_instrument_keys_message_record.maximum_threshold_price_fraction_indicator; at = at + 1;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> wire[at] = option_instrument_keys_message_record.minimum_threshold_price[option_instrument_keys_message_at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  wire[at] = option_instrument_keys_message_record.minimum_threshold_price_fraction_indicator; at = at + 1;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> wire[at] = option_instrument_keys_message_record.tick_increment[option_instrument_keys_message_at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  wire[at] = option_instrument_keys_message_record.tick_increment_fraction_indicator; at = at + 1;
  wire[at] = option_instrument_keys_message_record.option_type; at = at + 1;
  encode_market_flow_indicator(option_instrument_keys_message_record.market_flow_indicator);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 2 -> wire[at] = option_instrument_keys_message_record.group_instrument[option_instrument_keys_message_at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 4 -> wire[at] = option_instrument_keys_message_record.instrument[option_instrument_keys_message_at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 30 -> wire[at] = option_instrument_keys_message_record.instrument_external_code[option_instrument_keys_message_at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  encode_option_marker(option_instrument_keys_message_record.option_marker);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 10 -> wire[at] = option_instrument_keys_message_record.underlying_symbol_root[option_instrument_keys_message_at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  skip
}

/* Option Instrument Keys Message off the wire, 108 bytes from where the cursor stands */
inline decode_option_instrument_keys_message(option_instrument_keys_message_record) {
  option_instrument_keys_message_record.exchange_id = wire[at]; at = at + 1;
  decode_instrument_description(option_instrument_keys_message_record.instrument_description);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 3 -> option_instrument_keys_message_record.strike_price_currency[option_instrument_keys_message_at] = wire[at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.maximum_number_of_contracts_per_order[option_instrument_keys_message_at] = wire[at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.minimum_number_of_contracts_per_order[option_instrument_keys_message_at] = wire[at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.maximum_threshold_price[option_instrument_keys_message_at] = wire[at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_record.maximum_threshold_price_fraction_indicator = wire[at]; at = at + 1;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.minimum_threshold_price[option_instrument_keys_message_at] = wire[at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_record.minimum_threshold_price_fraction_indicator = wire[at]; at = at + 1;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> option_instrument_keys_message_record.tick_increment[option_instrument_keys_message_at] = wire[at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_record.tick_increment_fraction_indicator = wire[at]; at = at + 1;
  option_instrument_keys_message_record.option_type = wire[at]; at = at + 1;
  decode_market_flow_indicator(option_instrument_keys_message_record.market_flow_indicator);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 2 -> option_instrument_keys_message_record.group_instrument[option_instrument_keys_message_at] = wire[at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 4 -> option_instrument_keys_message_record.instrument[option_instrument_keys_message_at] = wire[at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 30 -> option_instrument_keys_message_record.instrument_external_code[option_instrument_keys_message_at] = wire[at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  decode_option_marker(option_instrument_keys_message_record.option_marker);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 10 -> option_instrument_keys_message_record.underlying_symbol_root[option_instrument_keys_message_at] = wire[at]; at = at + 1; option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Option Instrument Keys Message is what was written, byte for byte */
inline equal_option_instrument_keys_message(option_instrument_keys_message_read, option_instrument_keys_message_written) {
  assert(option_instrument_keys_message_read.exchange_id == option_instrument_keys_message_written.exchange_id);
  equal_instrument_description(option_instrument_keys_message_read.instrument_description, option_instrument_keys_message_written.instrument_description);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 3 -> assert(option_instrument_keys_message_read.strike_price_currency[option_instrument_keys_message_at] == option_instrument_keys_message_written.strike_price_currency[option_instrument_keys_message_at]); option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> assert(option_instrument_keys_message_read.maximum_number_of_contracts_per_order[option_instrument_keys_message_at] == option_instrument_keys_message_written.maximum_number_of_contracts_per_order[option_instrument_keys_message_at]); option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> assert(option_instrument_keys_message_read.minimum_number_of_contracts_per_order[option_instrument_keys_message_at] == option_instrument_keys_message_written.minimum_number_of_contracts_per_order[option_instrument_keys_message_at]); option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> assert(option_instrument_keys_message_read.maximum_threshold_price[option_instrument_keys_message_at] == option_instrument_keys_message_written.maximum_threshold_price[option_instrument_keys_message_at]); option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  assert(option_instrument_keys_message_read.maximum_threshold_price_fraction_indicator == option_instrument_keys_message_written.maximum_threshold_price_fraction_indicator);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> assert(option_instrument_keys_message_read.minimum_threshold_price[option_instrument_keys_message_at] == option_instrument_keys_message_written.minimum_threshold_price[option_instrument_keys_message_at]); option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  assert(option_instrument_keys_message_read.minimum_threshold_price_fraction_indicator == option_instrument_keys_message_written.minimum_threshold_price_fraction_indicator);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 6 -> assert(option_instrument_keys_message_read.tick_increment[option_instrument_keys_message_at] == option_instrument_keys_message_written.tick_increment[option_instrument_keys_message_at]); option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  assert(option_instrument_keys_message_read.tick_increment_fraction_indicator == option_instrument_keys_message_written.tick_increment_fraction_indicator);
  assert(option_instrument_keys_message_read.option_type == option_instrument_keys_message_written.option_type);
  equal_market_flow_indicator(option_instrument_keys_message_read.market_flow_indicator, option_instrument_keys_message_written.market_flow_indicator);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 2 -> assert(option_instrument_keys_message_read.group_instrument[option_instrument_keys_message_at] == option_instrument_keys_message_written.group_instrument[option_instrument_keys_message_at]); option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 4 -> assert(option_instrument_keys_message_read.instrument[option_instrument_keys_message_at] == option_instrument_keys_message_written.instrument[option_instrument_keys_message_at]); option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 30 -> assert(option_instrument_keys_message_read.instrument_external_code[option_instrument_keys_message_at] == option_instrument_keys_message_written.instrument_external_code[option_instrument_keys_message_at]); option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  equal_option_marker(option_instrument_keys_message_read.option_marker, option_instrument_keys_message_written.option_marker);
  option_instrument_keys_message_at = 0;
  do
  :: option_instrument_keys_message_at < 10 -> assert(option_instrument_keys_message_read.underlying_symbol_root[option_instrument_keys_message_at] == option_instrument_keys_message_written.underlying_symbol_root[option_instrument_keys_message_at]); option_instrument_keys_message_at = option_instrument_keys_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Beginning Of Options Summary Message: 1 bytes --------------------------- */

/* This message indicates that the beginning and the end of day option summaries */
typedef BeginningOfOptionsSummaryMessage {
  byte exchange_id
};

/* every byte of Beginning Of Options Summary Message set to one value */
inline fill_beginning_of_options_summary_message(beginning_of_options_summary_message_record, beginning_of_options_summary_message_value) {
  beginning_of_options_summary_message_record.exchange_id = beginning_of_options_summary_message_value;
  skip
}

/* each byte of Beginning Of Options Summary Message set to where it lies, so a field read out of place says so */
inline ramp_beginning_of_options_summary_message(beginning_of_options_summary_message_record, beginning_of_options_summary_message_base) {
  beginning_of_options_summary_message_record.exchange_id = (beginning_of_options_summary_message_base + 0 + 1) % 256;
  skip
}

/* Beginning Of Options Summary Message to the wire, 1 bytes from where the cursor stands */
inline encode_beginning_of_options_summary_message(beginning_of_options_summary_message_record) {
  wire[at] = beginning_of_options_summary_message_record.exchange_id; at = at + 1;
  skip
}

/* Beginning Of Options Summary Message off the wire, 1 bytes from where the cursor stands */
inline decode_beginning_of_options_summary_message(beginning_of_options_summary_message_record) {
  beginning_of_options_summary_message_record.exchange_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Beginning Of Options Summary Message is what was written, byte for byte */
inline equal_beginning_of_options_summary_message(beginning_of_options_summary_message_read, beginning_of_options_summary_message_written) {
  assert(beginning_of_options_summary_message_read.exchange_id == beginning_of_options_summary_message_written.exchange_id);
  skip
}

/* ---- Beginning Of Complex Order Summary Message: 1 bytes --------------------- */

/* This message indicates that the beginning and the end of day Complex Order summaries */
typedef BeginningOfComplexOrderSummaryMessage {
  byte exchange_id
};

/* every byte of Beginning Of Complex Order Summary Message set to one value */
inline fill_beginning_of_complex_order_summary_message(beginning_of_complex_order_summary_message_record, beginning_of_complex_order_summary_message_value) {
  beginning_of_complex_order_summary_message_record.exchange_id = beginning_of_complex_order_summary_message_value;
  skip
}

/* each byte of Beginning Of Complex Order Summary Message set to where it lies, so a field read out of place says so */
inline ramp_beginning_of_complex_order_summary_message(beginning_of_complex_order_summary_message_record, beginning_of_complex_order_summary_message_base) {
  beginning_of_complex_order_summary_message_record.exchange_id = (beginning_of_complex_order_summary_message_base + 0 + 1) % 256;
  skip
}

/* Beginning Of Complex Order Summary Message to the wire, 1 bytes from where the cursor stands */
inline encode_beginning_of_complex_order_summary_message(beginning_of_complex_order_summary_message_record) {
  wire[at] = beginning_of_complex_order_summary_message_record.exchange_id; at = at + 1;
  skip
}

/* Beginning Of Complex Order Summary Message off the wire, 1 bytes from where the cursor stands */
inline decode_beginning_of_complex_order_summary_message(beginning_of_complex_order_summary_message_record) {
  beginning_of_complex_order_summary_message_record.exchange_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Beginning Of Complex Order Summary Message is what was written, byte for byte */
inline equal_beginning_of_complex_order_summary_message(beginning_of_complex_order_summary_message_read, beginning_of_complex_order_summary_message_written) {
  assert(beginning_of_complex_order_summary_message_read.exchange_id == beginning_of_complex_order_summary_message_written.exchange_id);
  skip
}

/* ---- End Of Sales Message: 7 bytes ------------------------------------------- */

/* This message is sent when there is no more trading activity to be transmitted */
typedef EndOfSalesMessage {
  byte reserved;
  byte time[6]
};

int end_of_sales_message_at;

/* every byte of End Of Sales Message set to one value */
inline fill_end_of_sales_message(end_of_sales_message_record, end_of_sales_message_value) {
  end_of_sales_message_record.reserved = end_of_sales_message_value;
  end_of_sales_message_at = 0;
  do
  :: end_of_sales_message_at < 6 -> end_of_sales_message_record.time[end_of_sales_message_at] = end_of_sales_message_value; end_of_sales_message_at = end_of_sales_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Sales Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_sales_message(end_of_sales_message_record, end_of_sales_message_base) {
  end_of_sales_message_record.reserved = (end_of_sales_message_base + 0 + 1) % 256;
  end_of_sales_message_at = 0;
  do
  :: end_of_sales_message_at < 6 -> end_of_sales_message_record.time[end_of_sales_message_at] = (end_of_sales_message_base + 1 + end_of_sales_message_at + 1) % 256; end_of_sales_message_at = end_of_sales_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Sales Message to the wire, 7 bytes from where the cursor stands */
inline encode_end_of_sales_message(end_of_sales_message_record) {
  wire[at] = end_of_sales_message_record.reserved; at = at + 1;
  end_of_sales_message_at = 0;
  do
  :: end_of_sales_message_at < 6 -> wire[at] = end_of_sales_message_record.time[end_of_sales_message_at]; at = at + 1; end_of_sales_message_at = end_of_sales_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Sales Message off the wire, 7 bytes from where the cursor stands */
inline decode_end_of_sales_message(end_of_sales_message_record) {
  end_of_sales_message_record.reserved = wire[at]; at = at + 1;
  end_of_sales_message_at = 0;
  do
  :: end_of_sales_message_at < 6 -> end_of_sales_message_record.time[end_of_sales_message_at] = wire[at]; at = at + 1; end_of_sales_message_at = end_of_sales_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Sales Message is what was written, byte for byte */
inline equal_end_of_sales_message(end_of_sales_message_read, end_of_sales_message_written) {
  assert(end_of_sales_message_read.reserved == end_of_sales_message_written.reserved);
  end_of_sales_message_at = 0;
  do
  :: end_of_sales_message_at < 6 -> assert(end_of_sales_message_read.time[end_of_sales_message_at] == end_of_sales_message_written.time[end_of_sales_message_at]); end_of_sales_message_at = end_of_sales_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Auction On Option Message: 73 bytes ---------------------------- */

/* Start of Auction on Option */
typedef StartOfAuctionOnOptionMessage {
  byte exchange_id;
  InstrumentDescription instrument_description;
  byte improvement_phase_sequential_number[6];
  byte initial_order_price[6];
  byte initial_order_price_fraction_indicator;
  byte initial_order_quantity[8];
  byte initial_order_side;
  byte improvement_phase_expiry_time[8];
  byte filler_4[4];
  byte minimum_quantity_for_improvement_order[8];
  byte percentage_assured_to_initial_order[8];
  byte auction_type;
  byte filler_1
};

int start_of_auction_on_option_message_at;

/* every byte of Start Of Auction On Option Message set to one value */
inline fill_start_of_auction_on_option_message(start_of_auction_on_option_message_record, start_of_auction_on_option_message_value) {
  start_of_auction_on_option_message_record.exchange_id = start_of_auction_on_option_message_value;
  fill_instrument_description(start_of_auction_on_option_message_record.instrument_description, start_of_auction_on_option_message_value);
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 6 -> start_of_auction_on_option_message_record.improvement_phase_sequential_number[start_of_auction_on_option_message_at] = start_of_auction_on_option_message_value; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 6 -> start_of_auction_on_option_message_record.initial_order_price[start_of_auction_on_option_message_at] = start_of_auction_on_option_message_value; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_record.initial_order_price_fraction_indicator = start_of_auction_on_option_message_value;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> start_of_auction_on_option_message_record.initial_order_quantity[start_of_auction_on_option_message_at] = start_of_auction_on_option_message_value; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_record.initial_order_side = start_of_auction_on_option_message_value;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> start_of_auction_on_option_message_record.improvement_phase_expiry_time[start_of_auction_on_option_message_at] = start_of_auction_on_option_message_value; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 4 -> start_of_auction_on_option_message_record.filler_4[start_of_auction_on_option_message_at] = start_of_auction_on_option_message_value; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> start_of_auction_on_option_message_record.minimum_quantity_for_improvement_order[start_of_auction_on_option_message_at] = start_of_auction_on_option_message_value; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> start_of_auction_on_option_message_record.percentage_assured_to_initial_order[start_of_auction_on_option_message_at] = start_of_auction_on_option_message_value; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_record.auction_type = start_of_auction_on_option_message_value;
  start_of_auction_on_option_message_record.filler_1 = start_of_auction_on_option_message_value;
  skip
}

/* each byte of Start Of Auction On Option Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_auction_on_option_message(start_of_auction_on_option_message_record, start_of_auction_on_option_message_base) {
  start_of_auction_on_option_message_record.exchange_id = (start_of_auction_on_option_message_base + 0 + 1) % 256;
  ramp_instrument_description(start_of_auction_on_option_message_record.instrument_description, start_of_auction_on_option_message_base + 1);
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 6 -> start_of_auction_on_option_message_record.improvement_phase_sequential_number[start_of_auction_on_option_message_at] = (start_of_auction_on_option_message_base + 21 + start_of_auction_on_option_message_at + 1) % 256; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 6 -> start_of_auction_on_option_message_record.initial_order_price[start_of_auction_on_option_message_at] = (start_of_auction_on_option_message_base + 27 + start_of_auction_on_option_message_at + 1) % 256; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_record.initial_order_price_fraction_indicator = (start_of_auction_on_option_message_base + 33 + 1) % 256;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> start_of_auction_on_option_message_record.initial_order_quantity[start_of_auction_on_option_message_at] = (start_of_auction_on_option_message_base + 34 + start_of_auction_on_option_message_at + 1) % 256; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_record.initial_order_side = (start_of_auction_on_option_message_base + 42 + 1) % 256;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> start_of_auction_on_option_message_record.improvement_phase_expiry_time[start_of_auction_on_option_message_at] = (start_of_auction_on_option_message_base + 43 + start_of_auction_on_option_message_at + 1) % 256; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 4 -> start_of_auction_on_option_message_record.filler_4[start_of_auction_on_option_message_at] = (start_of_auction_on_option_message_base + 51 + start_of_auction_on_option_message_at + 1) % 256; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> start_of_auction_on_option_message_record.minimum_quantity_for_improvement_order[start_of_auction_on_option_message_at] = (start_of_auction_on_option_message_base + 55 + start_of_auction_on_option_message_at + 1) % 256; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> start_of_auction_on_option_message_record.percentage_assured_to_initial_order[start_of_auction_on_option_message_at] = (start_of_auction_on_option_message_base + 63 + start_of_auction_on_option_message_at + 1) % 256; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_record.auction_type = (start_of_auction_on_option_message_base + 71 + 1) % 256;
  start_of_auction_on_option_message_record.filler_1 = (start_of_auction_on_option_message_base + 72 + 1) % 256;
  skip
}

/* Start Of Auction On Option Message to the wire, 73 bytes from where the cursor stands */
inline encode_start_of_auction_on_option_message(start_of_auction_on_option_message_record) {
  wire[at] = start_of_auction_on_option_message_record.exchange_id; at = at + 1;
  encode_instrument_description(start_of_auction_on_option_message_record.instrument_description);
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 6 -> wire[at] = start_of_auction_on_option_message_record.improvement_phase_sequential_number[start_of_auction_on_option_message_at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 6 -> wire[at] = start_of_auction_on_option_message_record.initial_order_price[start_of_auction_on_option_message_at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_auction_on_option_message_record.initial_order_price_fraction_indicator; at = at + 1;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> wire[at] = start_of_auction_on_option_message_record.initial_order_quantity[start_of_auction_on_option_message_at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_auction_on_option_message_record.initial_order_side; at = at + 1;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> wire[at] = start_of_auction_on_option_message_record.improvement_phase_expiry_time[start_of_auction_on_option_message_at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 4 -> wire[at] = start_of_auction_on_option_message_record.filler_4[start_of_auction_on_option_message_at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> wire[at] = start_of_auction_on_option_message_record.minimum_quantity_for_improvement_order[start_of_auction_on_option_message_at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> wire[at] = start_of_auction_on_option_message_record.percentage_assured_to_initial_order[start_of_auction_on_option_message_at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_auction_on_option_message_record.auction_type; at = at + 1;
  wire[at] = start_of_auction_on_option_message_record.filler_1; at = at + 1;
  skip
}

/* Start Of Auction On Option Message off the wire, 73 bytes from where the cursor stands */
inline decode_start_of_auction_on_option_message(start_of_auction_on_option_message_record) {
  start_of_auction_on_option_message_record.exchange_id = wire[at]; at = at + 1;
  decode_instrument_description(start_of_auction_on_option_message_record.instrument_description);
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 6 -> start_of_auction_on_option_message_record.improvement_phase_sequential_number[start_of_auction_on_option_message_at] = wire[at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 6 -> start_of_auction_on_option_message_record.initial_order_price[start_of_auction_on_option_message_at] = wire[at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_record.initial_order_price_fraction_indicator = wire[at]; at = at + 1;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> start_of_auction_on_option_message_record.initial_order_quantity[start_of_auction_on_option_message_at] = wire[at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_record.initial_order_side = wire[at]; at = at + 1;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> start_of_auction_on_option_message_record.improvement_phase_expiry_time[start_of_auction_on_option_message_at] = wire[at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 4 -> start_of_auction_on_option_message_record.filler_4[start_of_auction_on_option_message_at] = wire[at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> start_of_auction_on_option_message_record.minimum_quantity_for_improvement_order[start_of_auction_on_option_message_at] = wire[at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> start_of_auction_on_option_message_record.percentage_assured_to_initial_order[start_of_auction_on_option_message_at] = wire[at]; at = at + 1; start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_record.auction_type = wire[at]; at = at + 1;
  start_of_auction_on_option_message_record.filler_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Start Of Auction On Option Message is what was written, byte for byte */
inline equal_start_of_auction_on_option_message(start_of_auction_on_option_message_read, start_of_auction_on_option_message_written) {
  assert(start_of_auction_on_option_message_read.exchange_id == start_of_auction_on_option_message_written.exchange_id);
  equal_instrument_description(start_of_auction_on_option_message_read.instrument_description, start_of_auction_on_option_message_written.instrument_description);
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 6 -> assert(start_of_auction_on_option_message_read.improvement_phase_sequential_number[start_of_auction_on_option_message_at] == start_of_auction_on_option_message_written.improvement_phase_sequential_number[start_of_auction_on_option_message_at]); start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 6 -> assert(start_of_auction_on_option_message_read.initial_order_price[start_of_auction_on_option_message_at] == start_of_auction_on_option_message_written.initial_order_price[start_of_auction_on_option_message_at]); start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  assert(start_of_auction_on_option_message_read.initial_order_price_fraction_indicator == start_of_auction_on_option_message_written.initial_order_price_fraction_indicator);
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> assert(start_of_auction_on_option_message_read.initial_order_quantity[start_of_auction_on_option_message_at] == start_of_auction_on_option_message_written.initial_order_quantity[start_of_auction_on_option_message_at]); start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  assert(start_of_auction_on_option_message_read.initial_order_side == start_of_auction_on_option_message_written.initial_order_side);
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> assert(start_of_auction_on_option_message_read.improvement_phase_expiry_time[start_of_auction_on_option_message_at] == start_of_auction_on_option_message_written.improvement_phase_expiry_time[start_of_auction_on_option_message_at]); start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 4 -> assert(start_of_auction_on_option_message_read.filler_4[start_of_auction_on_option_message_at] == start_of_auction_on_option_message_written.filler_4[start_of_auction_on_option_message_at]); start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> assert(start_of_auction_on_option_message_read.minimum_quantity_for_improvement_order[start_of_auction_on_option_message_at] == start_of_auction_on_option_message_written.minimum_quantity_for_improvement_order[start_of_auction_on_option_message_at]); start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_option_message_at = 0;
  do
  :: start_of_auction_on_option_message_at < 8 -> assert(start_of_auction_on_option_message_read.percentage_assured_to_initial_order[start_of_auction_on_option_message_at] == start_of_auction_on_option_message_written.percentage_assured_to_initial_order[start_of_auction_on_option_message_at]); start_of_auction_on_option_message_at = start_of_auction_on_option_message_at + 1
  :: else -> break
  od;
  assert(start_of_auction_on_option_message_read.auction_type == start_of_auction_on_option_message_written.auction_type);
  assert(start_of_auction_on_option_message_read.filler_1 == start_of_auction_on_option_message_written.filler_1);
  skip
}

/* ---- Start Of Auction On Complex Order Message: 83 bytes --------------------- */

/* Start of Auction on Complex Order */
typedef StartOfAuctionOnComplexOrderMessage {
  byte exchange_id;
  byte complex_order_instrument_symbol[30];
  byte improvement_phase_sequential_number[6];
  byte initial_order_price_sign;
  byte initial_order_price[6];
  byte initial_order_price_fraction_indicator;
  byte initial_order_quantity[8];
  byte initial_order_side;
  byte improvement_phase_expiry_time[8];
  byte filler_4[4];
  byte minimum_quantity_for_improvement_order[8];
  byte percentage_assured_to_initial_order[8];
  byte auction_type
};

int start_of_auction_on_complex_order_message_at;

/* every byte of Start Of Auction On Complex Order Message set to one value */
inline fill_start_of_auction_on_complex_order_message(start_of_auction_on_complex_order_message_record, start_of_auction_on_complex_order_message_value) {
  start_of_auction_on_complex_order_message_record.exchange_id = start_of_auction_on_complex_order_message_value;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 30 -> start_of_auction_on_complex_order_message_record.complex_order_instrument_symbol[start_of_auction_on_complex_order_message_at] = start_of_auction_on_complex_order_message_value; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 6 -> start_of_auction_on_complex_order_message_record.improvement_phase_sequential_number[start_of_auction_on_complex_order_message_at] = start_of_auction_on_complex_order_message_value; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_record.initial_order_price_sign = start_of_auction_on_complex_order_message_value;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 6 -> start_of_auction_on_complex_order_message_record.initial_order_price[start_of_auction_on_complex_order_message_at] = start_of_auction_on_complex_order_message_value; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_record.initial_order_price_fraction_indicator = start_of_auction_on_complex_order_message_value;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> start_of_auction_on_complex_order_message_record.initial_order_quantity[start_of_auction_on_complex_order_message_at] = start_of_auction_on_complex_order_message_value; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_record.initial_order_side = start_of_auction_on_complex_order_message_value;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> start_of_auction_on_complex_order_message_record.improvement_phase_expiry_time[start_of_auction_on_complex_order_message_at] = start_of_auction_on_complex_order_message_value; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 4 -> start_of_auction_on_complex_order_message_record.filler_4[start_of_auction_on_complex_order_message_at] = start_of_auction_on_complex_order_message_value; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> start_of_auction_on_complex_order_message_record.minimum_quantity_for_improvement_order[start_of_auction_on_complex_order_message_at] = start_of_auction_on_complex_order_message_value; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> start_of_auction_on_complex_order_message_record.percentage_assured_to_initial_order[start_of_auction_on_complex_order_message_at] = start_of_auction_on_complex_order_message_value; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_record.auction_type = start_of_auction_on_complex_order_message_value;
  skip
}

/* each byte of Start Of Auction On Complex Order Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_auction_on_complex_order_message(start_of_auction_on_complex_order_message_record, start_of_auction_on_complex_order_message_base) {
  start_of_auction_on_complex_order_message_record.exchange_id = (start_of_auction_on_complex_order_message_base + 0 + 1) % 256;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 30 -> start_of_auction_on_complex_order_message_record.complex_order_instrument_symbol[start_of_auction_on_complex_order_message_at] = (start_of_auction_on_complex_order_message_base + 1 + start_of_auction_on_complex_order_message_at + 1) % 256; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 6 -> start_of_auction_on_complex_order_message_record.improvement_phase_sequential_number[start_of_auction_on_complex_order_message_at] = (start_of_auction_on_complex_order_message_base + 31 + start_of_auction_on_complex_order_message_at + 1) % 256; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_record.initial_order_price_sign = (start_of_auction_on_complex_order_message_base + 37 + 1) % 256;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 6 -> start_of_auction_on_complex_order_message_record.initial_order_price[start_of_auction_on_complex_order_message_at] = (start_of_auction_on_complex_order_message_base + 38 + start_of_auction_on_complex_order_message_at + 1) % 256; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_record.initial_order_price_fraction_indicator = (start_of_auction_on_complex_order_message_base + 44 + 1) % 256;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> start_of_auction_on_complex_order_message_record.initial_order_quantity[start_of_auction_on_complex_order_message_at] = (start_of_auction_on_complex_order_message_base + 45 + start_of_auction_on_complex_order_message_at + 1) % 256; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_record.initial_order_side = (start_of_auction_on_complex_order_message_base + 53 + 1) % 256;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> start_of_auction_on_complex_order_message_record.improvement_phase_expiry_time[start_of_auction_on_complex_order_message_at] = (start_of_auction_on_complex_order_message_base + 54 + start_of_auction_on_complex_order_message_at + 1) % 256; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 4 -> start_of_auction_on_complex_order_message_record.filler_4[start_of_auction_on_complex_order_message_at] = (start_of_auction_on_complex_order_message_base + 62 + start_of_auction_on_complex_order_message_at + 1) % 256; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> start_of_auction_on_complex_order_message_record.minimum_quantity_for_improvement_order[start_of_auction_on_complex_order_message_at] = (start_of_auction_on_complex_order_message_base + 66 + start_of_auction_on_complex_order_message_at + 1) % 256; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> start_of_auction_on_complex_order_message_record.percentage_assured_to_initial_order[start_of_auction_on_complex_order_message_at] = (start_of_auction_on_complex_order_message_base + 74 + start_of_auction_on_complex_order_message_at + 1) % 256; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_record.auction_type = (start_of_auction_on_complex_order_message_base + 82 + 1) % 256;
  skip
}

/* Start Of Auction On Complex Order Message to the wire, 83 bytes from where the cursor stands */
inline encode_start_of_auction_on_complex_order_message(start_of_auction_on_complex_order_message_record) {
  wire[at] = start_of_auction_on_complex_order_message_record.exchange_id; at = at + 1;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 30 -> wire[at] = start_of_auction_on_complex_order_message_record.complex_order_instrument_symbol[start_of_auction_on_complex_order_message_at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 6 -> wire[at] = start_of_auction_on_complex_order_message_record.improvement_phase_sequential_number[start_of_auction_on_complex_order_message_at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_auction_on_complex_order_message_record.initial_order_price_sign; at = at + 1;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 6 -> wire[at] = start_of_auction_on_complex_order_message_record.initial_order_price[start_of_auction_on_complex_order_message_at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_auction_on_complex_order_message_record.initial_order_price_fraction_indicator; at = at + 1;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> wire[at] = start_of_auction_on_complex_order_message_record.initial_order_quantity[start_of_auction_on_complex_order_message_at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_auction_on_complex_order_message_record.initial_order_side; at = at + 1;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> wire[at] = start_of_auction_on_complex_order_message_record.improvement_phase_expiry_time[start_of_auction_on_complex_order_message_at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 4 -> wire[at] = start_of_auction_on_complex_order_message_record.filler_4[start_of_auction_on_complex_order_message_at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> wire[at] = start_of_auction_on_complex_order_message_record.minimum_quantity_for_improvement_order[start_of_auction_on_complex_order_message_at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> wire[at] = start_of_auction_on_complex_order_message_record.percentage_assured_to_initial_order[start_of_auction_on_complex_order_message_at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_auction_on_complex_order_message_record.auction_type; at = at + 1;
  skip
}

/* Start Of Auction On Complex Order Message off the wire, 83 bytes from where the cursor stands */
inline decode_start_of_auction_on_complex_order_message(start_of_auction_on_complex_order_message_record) {
  start_of_auction_on_complex_order_message_record.exchange_id = wire[at]; at = at + 1;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 30 -> start_of_auction_on_complex_order_message_record.complex_order_instrument_symbol[start_of_auction_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 6 -> start_of_auction_on_complex_order_message_record.improvement_phase_sequential_number[start_of_auction_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_record.initial_order_price_sign = wire[at]; at = at + 1;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 6 -> start_of_auction_on_complex_order_message_record.initial_order_price[start_of_auction_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_record.initial_order_price_fraction_indicator = wire[at]; at = at + 1;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> start_of_auction_on_complex_order_message_record.initial_order_quantity[start_of_auction_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_record.initial_order_side = wire[at]; at = at + 1;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> start_of_auction_on_complex_order_message_record.improvement_phase_expiry_time[start_of_auction_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 4 -> start_of_auction_on_complex_order_message_record.filler_4[start_of_auction_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> start_of_auction_on_complex_order_message_record.minimum_quantity_for_improvement_order[start_of_auction_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> start_of_auction_on_complex_order_message_record.percentage_assured_to_initial_order[start_of_auction_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_record.auction_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Start Of Auction On Complex Order Message is what was written, byte for byte */
inline equal_start_of_auction_on_complex_order_message(start_of_auction_on_complex_order_message_read, start_of_auction_on_complex_order_message_written) {
  assert(start_of_auction_on_complex_order_message_read.exchange_id == start_of_auction_on_complex_order_message_written.exchange_id);
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 30 -> assert(start_of_auction_on_complex_order_message_read.complex_order_instrument_symbol[start_of_auction_on_complex_order_message_at] == start_of_auction_on_complex_order_message_written.complex_order_instrument_symbol[start_of_auction_on_complex_order_message_at]); start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 6 -> assert(start_of_auction_on_complex_order_message_read.improvement_phase_sequential_number[start_of_auction_on_complex_order_message_at] == start_of_auction_on_complex_order_message_written.improvement_phase_sequential_number[start_of_auction_on_complex_order_message_at]); start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  assert(start_of_auction_on_complex_order_message_read.initial_order_price_sign == start_of_auction_on_complex_order_message_written.initial_order_price_sign);
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 6 -> assert(start_of_auction_on_complex_order_message_read.initial_order_price[start_of_auction_on_complex_order_message_at] == start_of_auction_on_complex_order_message_written.initial_order_price[start_of_auction_on_complex_order_message_at]); start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  assert(start_of_auction_on_complex_order_message_read.initial_order_price_fraction_indicator == start_of_auction_on_complex_order_message_written.initial_order_price_fraction_indicator);
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> assert(start_of_auction_on_complex_order_message_read.initial_order_quantity[start_of_auction_on_complex_order_message_at] == start_of_auction_on_complex_order_message_written.initial_order_quantity[start_of_auction_on_complex_order_message_at]); start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  assert(start_of_auction_on_complex_order_message_read.initial_order_side == start_of_auction_on_complex_order_message_written.initial_order_side);
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> assert(start_of_auction_on_complex_order_message_read.improvement_phase_expiry_time[start_of_auction_on_complex_order_message_at] == start_of_auction_on_complex_order_message_written.improvement_phase_expiry_time[start_of_auction_on_complex_order_message_at]); start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 4 -> assert(start_of_auction_on_complex_order_message_read.filler_4[start_of_auction_on_complex_order_message_at] == start_of_auction_on_complex_order_message_written.filler_4[start_of_auction_on_complex_order_message_at]); start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> assert(start_of_auction_on_complex_order_message_read.minimum_quantity_for_improvement_order[start_of_auction_on_complex_order_message_at] == start_of_auction_on_complex_order_message_written.minimum_quantity_for_improvement_order[start_of_auction_on_complex_order_message_at]); start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_auction_on_complex_order_message_at = 0;
  do
  :: start_of_auction_on_complex_order_message_at < 8 -> assert(start_of_auction_on_complex_order_message_read.percentage_assured_to_initial_order[start_of_auction_on_complex_order_message_at] == start_of_auction_on_complex_order_message_written.percentage_assured_to_initial_order[start_of_auction_on_complex_order_message_at]); start_of_auction_on_complex_order_message_at = start_of_auction_on_complex_order_message_at + 1
  :: else -> break
  od;
  assert(start_of_auction_on_complex_order_message_read.auction_type == start_of_auction_on_complex_order_message_written.auction_type);
  skip
}

/* ---- Start Of Exposition On Option Message: 69 bytes ------------------------- */

/* Start of Exposition on Option */
typedef StartOfExpositionOnOptionMessage {
  byte exchange_id;
  InstrumentDescription instrument_description;
  byte order_side;
  byte type_of_order;
  byte limit_entered_for_an_order[6];
  byte limit_fraction_indicator;
  byte order_quantity[8];
  byte order_sequence_number[6];
  byte filler_6[6];
  byte type_of_clearing_account;
  byte filler_1;
  byte end_of_the_exposition[8];
  byte auction_type;
  byte firm_id[4];
  byte cmta[4]
};

int start_of_exposition_on_option_message_at;

/* every byte of Start Of Exposition On Option Message set to one value */
inline fill_start_of_exposition_on_option_message(start_of_exposition_on_option_message_record, start_of_exposition_on_option_message_value) {
  start_of_exposition_on_option_message_record.exchange_id = start_of_exposition_on_option_message_value;
  fill_instrument_description(start_of_exposition_on_option_message_record.instrument_description, start_of_exposition_on_option_message_value);
  start_of_exposition_on_option_message_record.order_side = start_of_exposition_on_option_message_value;
  start_of_exposition_on_option_message_record.type_of_order = start_of_exposition_on_option_message_value;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> start_of_exposition_on_option_message_record.limit_entered_for_an_order[start_of_exposition_on_option_message_at] = start_of_exposition_on_option_message_value; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_record.limit_fraction_indicator = start_of_exposition_on_option_message_value;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 8 -> start_of_exposition_on_option_message_record.order_quantity[start_of_exposition_on_option_message_at] = start_of_exposition_on_option_message_value; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> start_of_exposition_on_option_message_record.order_sequence_number[start_of_exposition_on_option_message_at] = start_of_exposition_on_option_message_value; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> start_of_exposition_on_option_message_record.filler_6[start_of_exposition_on_option_message_at] = start_of_exposition_on_option_message_value; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_record.type_of_clearing_account = start_of_exposition_on_option_message_value;
  start_of_exposition_on_option_message_record.filler_1 = start_of_exposition_on_option_message_value;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 8 -> start_of_exposition_on_option_message_record.end_of_the_exposition[start_of_exposition_on_option_message_at] = start_of_exposition_on_option_message_value; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_record.auction_type = start_of_exposition_on_option_message_value;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 4 -> start_of_exposition_on_option_message_record.firm_id[start_of_exposition_on_option_message_at] = start_of_exposition_on_option_message_value; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 4 -> start_of_exposition_on_option_message_record.cmta[start_of_exposition_on_option_message_at] = start_of_exposition_on_option_message_value; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Exposition On Option Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_exposition_on_option_message(start_of_exposition_on_option_message_record, start_of_exposition_on_option_message_base) {
  start_of_exposition_on_option_message_record.exchange_id = (start_of_exposition_on_option_message_base + 0 + 1) % 256;
  ramp_instrument_description(start_of_exposition_on_option_message_record.instrument_description, start_of_exposition_on_option_message_base + 1);
  start_of_exposition_on_option_message_record.order_side = (start_of_exposition_on_option_message_base + 21 + 1) % 256;
  start_of_exposition_on_option_message_record.type_of_order = (start_of_exposition_on_option_message_base + 22 + 1) % 256;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> start_of_exposition_on_option_message_record.limit_entered_for_an_order[start_of_exposition_on_option_message_at] = (start_of_exposition_on_option_message_base + 23 + start_of_exposition_on_option_message_at + 1) % 256; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_record.limit_fraction_indicator = (start_of_exposition_on_option_message_base + 29 + 1) % 256;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 8 -> start_of_exposition_on_option_message_record.order_quantity[start_of_exposition_on_option_message_at] = (start_of_exposition_on_option_message_base + 30 + start_of_exposition_on_option_message_at + 1) % 256; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> start_of_exposition_on_option_message_record.order_sequence_number[start_of_exposition_on_option_message_at] = (start_of_exposition_on_option_message_base + 38 + start_of_exposition_on_option_message_at + 1) % 256; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> start_of_exposition_on_option_message_record.filler_6[start_of_exposition_on_option_message_at] = (start_of_exposition_on_option_message_base + 44 + start_of_exposition_on_option_message_at + 1) % 256; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_record.type_of_clearing_account = (start_of_exposition_on_option_message_base + 50 + 1) % 256;
  start_of_exposition_on_option_message_record.filler_1 = (start_of_exposition_on_option_message_base + 51 + 1) % 256;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 8 -> start_of_exposition_on_option_message_record.end_of_the_exposition[start_of_exposition_on_option_message_at] = (start_of_exposition_on_option_message_base + 52 + start_of_exposition_on_option_message_at + 1) % 256; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_record.auction_type = (start_of_exposition_on_option_message_base + 60 + 1) % 256;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 4 -> start_of_exposition_on_option_message_record.firm_id[start_of_exposition_on_option_message_at] = (start_of_exposition_on_option_message_base + 61 + start_of_exposition_on_option_message_at + 1) % 256; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 4 -> start_of_exposition_on_option_message_record.cmta[start_of_exposition_on_option_message_at] = (start_of_exposition_on_option_message_base + 65 + start_of_exposition_on_option_message_at + 1) % 256; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Exposition On Option Message to the wire, 69 bytes from where the cursor stands */
inline encode_start_of_exposition_on_option_message(start_of_exposition_on_option_message_record) {
  wire[at] = start_of_exposition_on_option_message_record.exchange_id; at = at + 1;
  encode_instrument_description(start_of_exposition_on_option_message_record.instrument_description);
  wire[at] = start_of_exposition_on_option_message_record.order_side; at = at + 1;
  wire[at] = start_of_exposition_on_option_message_record.type_of_order; at = at + 1;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> wire[at] = start_of_exposition_on_option_message_record.limit_entered_for_an_order[start_of_exposition_on_option_message_at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_exposition_on_option_message_record.limit_fraction_indicator; at = at + 1;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 8 -> wire[at] = start_of_exposition_on_option_message_record.order_quantity[start_of_exposition_on_option_message_at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> wire[at] = start_of_exposition_on_option_message_record.order_sequence_number[start_of_exposition_on_option_message_at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> wire[at] = start_of_exposition_on_option_message_record.filler_6[start_of_exposition_on_option_message_at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_exposition_on_option_message_record.type_of_clearing_account; at = at + 1;
  wire[at] = start_of_exposition_on_option_message_record.filler_1; at = at + 1;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 8 -> wire[at] = start_of_exposition_on_option_message_record.end_of_the_exposition[start_of_exposition_on_option_message_at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_exposition_on_option_message_record.auction_type; at = at + 1;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 4 -> wire[at] = start_of_exposition_on_option_message_record.firm_id[start_of_exposition_on_option_message_at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 4 -> wire[at] = start_of_exposition_on_option_message_record.cmta[start_of_exposition_on_option_message_at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Exposition On Option Message off the wire, 69 bytes from where the cursor stands */
inline decode_start_of_exposition_on_option_message(start_of_exposition_on_option_message_record) {
  start_of_exposition_on_option_message_record.exchange_id = wire[at]; at = at + 1;
  decode_instrument_description(start_of_exposition_on_option_message_record.instrument_description);
  start_of_exposition_on_option_message_record.order_side = wire[at]; at = at + 1;
  start_of_exposition_on_option_message_record.type_of_order = wire[at]; at = at + 1;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> start_of_exposition_on_option_message_record.limit_entered_for_an_order[start_of_exposition_on_option_message_at] = wire[at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_record.limit_fraction_indicator = wire[at]; at = at + 1;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 8 -> start_of_exposition_on_option_message_record.order_quantity[start_of_exposition_on_option_message_at] = wire[at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> start_of_exposition_on_option_message_record.order_sequence_number[start_of_exposition_on_option_message_at] = wire[at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> start_of_exposition_on_option_message_record.filler_6[start_of_exposition_on_option_message_at] = wire[at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_record.type_of_clearing_account = wire[at]; at = at + 1;
  start_of_exposition_on_option_message_record.filler_1 = wire[at]; at = at + 1;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 8 -> start_of_exposition_on_option_message_record.end_of_the_exposition[start_of_exposition_on_option_message_at] = wire[at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_record.auction_type = wire[at]; at = at + 1;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 4 -> start_of_exposition_on_option_message_record.firm_id[start_of_exposition_on_option_message_at] = wire[at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 4 -> start_of_exposition_on_option_message_record.cmta[start_of_exposition_on_option_message_at] = wire[at]; at = at + 1; start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Exposition On Option Message is what was written, byte for byte */
inline equal_start_of_exposition_on_option_message(start_of_exposition_on_option_message_read, start_of_exposition_on_option_message_written) {
  assert(start_of_exposition_on_option_message_read.exchange_id == start_of_exposition_on_option_message_written.exchange_id);
  equal_instrument_description(start_of_exposition_on_option_message_read.instrument_description, start_of_exposition_on_option_message_written.instrument_description);
  assert(start_of_exposition_on_option_message_read.order_side == start_of_exposition_on_option_message_written.order_side);
  assert(start_of_exposition_on_option_message_read.type_of_order == start_of_exposition_on_option_message_written.type_of_order);
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> assert(start_of_exposition_on_option_message_read.limit_entered_for_an_order[start_of_exposition_on_option_message_at] == start_of_exposition_on_option_message_written.limit_entered_for_an_order[start_of_exposition_on_option_message_at]); start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  assert(start_of_exposition_on_option_message_read.limit_fraction_indicator == start_of_exposition_on_option_message_written.limit_fraction_indicator);
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 8 -> assert(start_of_exposition_on_option_message_read.order_quantity[start_of_exposition_on_option_message_at] == start_of_exposition_on_option_message_written.order_quantity[start_of_exposition_on_option_message_at]); start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> assert(start_of_exposition_on_option_message_read.order_sequence_number[start_of_exposition_on_option_message_at] == start_of_exposition_on_option_message_written.order_sequence_number[start_of_exposition_on_option_message_at]); start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 6 -> assert(start_of_exposition_on_option_message_read.filler_6[start_of_exposition_on_option_message_at] == start_of_exposition_on_option_message_written.filler_6[start_of_exposition_on_option_message_at]); start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  assert(start_of_exposition_on_option_message_read.type_of_clearing_account == start_of_exposition_on_option_message_written.type_of_clearing_account);
  assert(start_of_exposition_on_option_message_read.filler_1 == start_of_exposition_on_option_message_written.filler_1);
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 8 -> assert(start_of_exposition_on_option_message_read.end_of_the_exposition[start_of_exposition_on_option_message_at] == start_of_exposition_on_option_message_written.end_of_the_exposition[start_of_exposition_on_option_message_at]); start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  assert(start_of_exposition_on_option_message_read.auction_type == start_of_exposition_on_option_message_written.auction_type);
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 4 -> assert(start_of_exposition_on_option_message_read.firm_id[start_of_exposition_on_option_message_at] == start_of_exposition_on_option_message_written.firm_id[start_of_exposition_on_option_message_at]); start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_option_message_at = 0;
  do
  :: start_of_exposition_on_option_message_at < 4 -> assert(start_of_exposition_on_option_message_read.cmta[start_of_exposition_on_option_message_at] == start_of_exposition_on_option_message_written.cmta[start_of_exposition_on_option_message_at]); start_of_exposition_on_option_message_at = start_of_exposition_on_option_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Exposition On Complex Order Message: 80 bytes ------------------ */

/* Start of Exposition on Complex Order */
typedef StartOfExpositionOnComplexOrderMessage {
  byte exchange_id;
  byte complex_order_instrument_symbol[30];
  byte order_side;
  byte type_of_order;
  byte limit_entered_for_an_order_sign;
  byte limit_entered_for_an_order[6];
  byte limit_fraction_indicator;
  byte order_quantity[8];
  byte order_sequence_number[6];
  byte filler_6[6];
  byte type_of_clearing_account;
  byte filler_1;
  byte end_of_the_exposition[8];
  byte auction_type;
  byte firm_id[4];
  byte cmta[4]
};

int start_of_exposition_on_complex_order_message_at;

/* every byte of Start Of Exposition On Complex Order Message set to one value */
inline fill_start_of_exposition_on_complex_order_message(start_of_exposition_on_complex_order_message_record, start_of_exposition_on_complex_order_message_value) {
  start_of_exposition_on_complex_order_message_record.exchange_id = start_of_exposition_on_complex_order_message_value;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 30 -> start_of_exposition_on_complex_order_message_record.complex_order_instrument_symbol[start_of_exposition_on_complex_order_message_at] = start_of_exposition_on_complex_order_message_value; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_record.order_side = start_of_exposition_on_complex_order_message_value;
  start_of_exposition_on_complex_order_message_record.type_of_order = start_of_exposition_on_complex_order_message_value;
  start_of_exposition_on_complex_order_message_record.limit_entered_for_an_order_sign = start_of_exposition_on_complex_order_message_value;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> start_of_exposition_on_complex_order_message_record.limit_entered_for_an_order[start_of_exposition_on_complex_order_message_at] = start_of_exposition_on_complex_order_message_value; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_record.limit_fraction_indicator = start_of_exposition_on_complex_order_message_value;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 8 -> start_of_exposition_on_complex_order_message_record.order_quantity[start_of_exposition_on_complex_order_message_at] = start_of_exposition_on_complex_order_message_value; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> start_of_exposition_on_complex_order_message_record.order_sequence_number[start_of_exposition_on_complex_order_message_at] = start_of_exposition_on_complex_order_message_value; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> start_of_exposition_on_complex_order_message_record.filler_6[start_of_exposition_on_complex_order_message_at] = start_of_exposition_on_complex_order_message_value; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_record.type_of_clearing_account = start_of_exposition_on_complex_order_message_value;
  start_of_exposition_on_complex_order_message_record.filler_1 = start_of_exposition_on_complex_order_message_value;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 8 -> start_of_exposition_on_complex_order_message_record.end_of_the_exposition[start_of_exposition_on_complex_order_message_at] = start_of_exposition_on_complex_order_message_value; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_record.auction_type = start_of_exposition_on_complex_order_message_value;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 4 -> start_of_exposition_on_complex_order_message_record.firm_id[start_of_exposition_on_complex_order_message_at] = start_of_exposition_on_complex_order_message_value; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 4 -> start_of_exposition_on_complex_order_message_record.cmta[start_of_exposition_on_complex_order_message_at] = start_of_exposition_on_complex_order_message_value; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Exposition On Complex Order Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_exposition_on_complex_order_message(start_of_exposition_on_complex_order_message_record, start_of_exposition_on_complex_order_message_base) {
  start_of_exposition_on_complex_order_message_record.exchange_id = (start_of_exposition_on_complex_order_message_base + 0 + 1) % 256;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 30 -> start_of_exposition_on_complex_order_message_record.complex_order_instrument_symbol[start_of_exposition_on_complex_order_message_at] = (start_of_exposition_on_complex_order_message_base + 1 + start_of_exposition_on_complex_order_message_at + 1) % 256; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_record.order_side = (start_of_exposition_on_complex_order_message_base + 31 + 1) % 256;
  start_of_exposition_on_complex_order_message_record.type_of_order = (start_of_exposition_on_complex_order_message_base + 32 + 1) % 256;
  start_of_exposition_on_complex_order_message_record.limit_entered_for_an_order_sign = (start_of_exposition_on_complex_order_message_base + 33 + 1) % 256;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> start_of_exposition_on_complex_order_message_record.limit_entered_for_an_order[start_of_exposition_on_complex_order_message_at] = (start_of_exposition_on_complex_order_message_base + 34 + start_of_exposition_on_complex_order_message_at + 1) % 256; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_record.limit_fraction_indicator = (start_of_exposition_on_complex_order_message_base + 40 + 1) % 256;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 8 -> start_of_exposition_on_complex_order_message_record.order_quantity[start_of_exposition_on_complex_order_message_at] = (start_of_exposition_on_complex_order_message_base + 41 + start_of_exposition_on_complex_order_message_at + 1) % 256; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> start_of_exposition_on_complex_order_message_record.order_sequence_number[start_of_exposition_on_complex_order_message_at] = (start_of_exposition_on_complex_order_message_base + 49 + start_of_exposition_on_complex_order_message_at + 1) % 256; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> start_of_exposition_on_complex_order_message_record.filler_6[start_of_exposition_on_complex_order_message_at] = (start_of_exposition_on_complex_order_message_base + 55 + start_of_exposition_on_complex_order_message_at + 1) % 256; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_record.type_of_clearing_account = (start_of_exposition_on_complex_order_message_base + 61 + 1) % 256;
  start_of_exposition_on_complex_order_message_record.filler_1 = (start_of_exposition_on_complex_order_message_base + 62 + 1) % 256;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 8 -> start_of_exposition_on_complex_order_message_record.end_of_the_exposition[start_of_exposition_on_complex_order_message_at] = (start_of_exposition_on_complex_order_message_base + 63 + start_of_exposition_on_complex_order_message_at + 1) % 256; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_record.auction_type = (start_of_exposition_on_complex_order_message_base + 71 + 1) % 256;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 4 -> start_of_exposition_on_complex_order_message_record.firm_id[start_of_exposition_on_complex_order_message_at] = (start_of_exposition_on_complex_order_message_base + 72 + start_of_exposition_on_complex_order_message_at + 1) % 256; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 4 -> start_of_exposition_on_complex_order_message_record.cmta[start_of_exposition_on_complex_order_message_at] = (start_of_exposition_on_complex_order_message_base + 76 + start_of_exposition_on_complex_order_message_at + 1) % 256; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Exposition On Complex Order Message to the wire, 80 bytes from where the cursor stands */
inline encode_start_of_exposition_on_complex_order_message(start_of_exposition_on_complex_order_message_record) {
  wire[at] = start_of_exposition_on_complex_order_message_record.exchange_id; at = at + 1;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 30 -> wire[at] = start_of_exposition_on_complex_order_message_record.complex_order_instrument_symbol[start_of_exposition_on_complex_order_message_at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_exposition_on_complex_order_message_record.order_side; at = at + 1;
  wire[at] = start_of_exposition_on_complex_order_message_record.type_of_order; at = at + 1;
  wire[at] = start_of_exposition_on_complex_order_message_record.limit_entered_for_an_order_sign; at = at + 1;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> wire[at] = start_of_exposition_on_complex_order_message_record.limit_entered_for_an_order[start_of_exposition_on_complex_order_message_at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_exposition_on_complex_order_message_record.limit_fraction_indicator; at = at + 1;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 8 -> wire[at] = start_of_exposition_on_complex_order_message_record.order_quantity[start_of_exposition_on_complex_order_message_at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> wire[at] = start_of_exposition_on_complex_order_message_record.order_sequence_number[start_of_exposition_on_complex_order_message_at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> wire[at] = start_of_exposition_on_complex_order_message_record.filler_6[start_of_exposition_on_complex_order_message_at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_exposition_on_complex_order_message_record.type_of_clearing_account; at = at + 1;
  wire[at] = start_of_exposition_on_complex_order_message_record.filler_1; at = at + 1;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 8 -> wire[at] = start_of_exposition_on_complex_order_message_record.end_of_the_exposition[start_of_exposition_on_complex_order_message_at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  wire[at] = start_of_exposition_on_complex_order_message_record.auction_type; at = at + 1;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 4 -> wire[at] = start_of_exposition_on_complex_order_message_record.firm_id[start_of_exposition_on_complex_order_message_at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 4 -> wire[at] = start_of_exposition_on_complex_order_message_record.cmta[start_of_exposition_on_complex_order_message_at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Exposition On Complex Order Message off the wire, 80 bytes from where the cursor stands */
inline decode_start_of_exposition_on_complex_order_message(start_of_exposition_on_complex_order_message_record) {
  start_of_exposition_on_complex_order_message_record.exchange_id = wire[at]; at = at + 1;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 30 -> start_of_exposition_on_complex_order_message_record.complex_order_instrument_symbol[start_of_exposition_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_record.order_side = wire[at]; at = at + 1;
  start_of_exposition_on_complex_order_message_record.type_of_order = wire[at]; at = at + 1;
  start_of_exposition_on_complex_order_message_record.limit_entered_for_an_order_sign = wire[at]; at = at + 1;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> start_of_exposition_on_complex_order_message_record.limit_entered_for_an_order[start_of_exposition_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_record.limit_fraction_indicator = wire[at]; at = at + 1;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 8 -> start_of_exposition_on_complex_order_message_record.order_quantity[start_of_exposition_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> start_of_exposition_on_complex_order_message_record.order_sequence_number[start_of_exposition_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> start_of_exposition_on_complex_order_message_record.filler_6[start_of_exposition_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_record.type_of_clearing_account = wire[at]; at = at + 1;
  start_of_exposition_on_complex_order_message_record.filler_1 = wire[at]; at = at + 1;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 8 -> start_of_exposition_on_complex_order_message_record.end_of_the_exposition[start_of_exposition_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_record.auction_type = wire[at]; at = at + 1;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 4 -> start_of_exposition_on_complex_order_message_record.firm_id[start_of_exposition_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 4 -> start_of_exposition_on_complex_order_message_record.cmta[start_of_exposition_on_complex_order_message_at] = wire[at]; at = at + 1; start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Exposition On Complex Order Message is what was written, byte for byte */
inline equal_start_of_exposition_on_complex_order_message(start_of_exposition_on_complex_order_message_read, start_of_exposition_on_complex_order_message_written) {
  assert(start_of_exposition_on_complex_order_message_read.exchange_id == start_of_exposition_on_complex_order_message_written.exchange_id);
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 30 -> assert(start_of_exposition_on_complex_order_message_read.complex_order_instrument_symbol[start_of_exposition_on_complex_order_message_at] == start_of_exposition_on_complex_order_message_written.complex_order_instrument_symbol[start_of_exposition_on_complex_order_message_at]); start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  assert(start_of_exposition_on_complex_order_message_read.order_side == start_of_exposition_on_complex_order_message_written.order_side);
  assert(start_of_exposition_on_complex_order_message_read.type_of_order == start_of_exposition_on_complex_order_message_written.type_of_order);
  assert(start_of_exposition_on_complex_order_message_read.limit_entered_for_an_order_sign == start_of_exposition_on_complex_order_message_written.limit_entered_for_an_order_sign);
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> assert(start_of_exposition_on_complex_order_message_read.limit_entered_for_an_order[start_of_exposition_on_complex_order_message_at] == start_of_exposition_on_complex_order_message_written.limit_entered_for_an_order[start_of_exposition_on_complex_order_message_at]); start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  assert(start_of_exposition_on_complex_order_message_read.limit_fraction_indicator == start_of_exposition_on_complex_order_message_written.limit_fraction_indicator);
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 8 -> assert(start_of_exposition_on_complex_order_message_read.order_quantity[start_of_exposition_on_complex_order_message_at] == start_of_exposition_on_complex_order_message_written.order_quantity[start_of_exposition_on_complex_order_message_at]); start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> assert(start_of_exposition_on_complex_order_message_read.order_sequence_number[start_of_exposition_on_complex_order_message_at] == start_of_exposition_on_complex_order_message_written.order_sequence_number[start_of_exposition_on_complex_order_message_at]); start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 6 -> assert(start_of_exposition_on_complex_order_message_read.filler_6[start_of_exposition_on_complex_order_message_at] == start_of_exposition_on_complex_order_message_written.filler_6[start_of_exposition_on_complex_order_message_at]); start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  assert(start_of_exposition_on_complex_order_message_read.type_of_clearing_account == start_of_exposition_on_complex_order_message_written.type_of_clearing_account);
  assert(start_of_exposition_on_complex_order_message_read.filler_1 == start_of_exposition_on_complex_order_message_written.filler_1);
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 8 -> assert(start_of_exposition_on_complex_order_message_read.end_of_the_exposition[start_of_exposition_on_complex_order_message_at] == start_of_exposition_on_complex_order_message_written.end_of_the_exposition[start_of_exposition_on_complex_order_message_at]); start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  assert(start_of_exposition_on_complex_order_message_read.auction_type == start_of_exposition_on_complex_order_message_written.auction_type);
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 4 -> assert(start_of_exposition_on_complex_order_message_read.firm_id[start_of_exposition_on_complex_order_message_at] == start_of_exposition_on_complex_order_message_written.firm_id[start_of_exposition_on_complex_order_message_at]); start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  start_of_exposition_on_complex_order_message_at = 0;
  do
  :: start_of_exposition_on_complex_order_message_at < 4 -> assert(start_of_exposition_on_complex_order_message_read.cmta[start_of_exposition_on_complex_order_message_at] == start_of_exposition_on_complex_order_message_written.cmta[start_of_exposition_on_complex_order_message_at]); start_of_exposition_on_complex_order_message_at = start_of_exposition_on_complex_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Auction Or Exposition On Option Message: 36 bytes ---------------- */

/* End of Auction or Exposition on Option */
typedef EndOfAuctionOrExpositionOnOptionMessage {
  byte exchange_id;
  InstrumentDescription instrument_description;
  byte deletion_type;
  byte order_sequence_number[6];
  byte improvement_order_side;
  byte improvement_phase_sequential_number[6];
  byte auction_type
};

int end_of_auction_or_exposition_on_option_message_at;

/* every byte of End Of Auction Or Exposition On Option Message set to one value */
inline fill_end_of_auction_or_exposition_on_option_message(end_of_auction_or_exposition_on_option_message_record, end_of_auction_or_exposition_on_option_message_value) {
  end_of_auction_or_exposition_on_option_message_record.exchange_id = end_of_auction_or_exposition_on_option_message_value;
  fill_instrument_description(end_of_auction_or_exposition_on_option_message_record.instrument_description, end_of_auction_or_exposition_on_option_message_value);
  end_of_auction_or_exposition_on_option_message_record.deletion_type = end_of_auction_or_exposition_on_option_message_value;
  end_of_auction_or_exposition_on_option_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_option_message_at < 6 -> end_of_auction_or_exposition_on_option_message_record.order_sequence_number[end_of_auction_or_exposition_on_option_message_at] = end_of_auction_or_exposition_on_option_message_value; end_of_auction_or_exposition_on_option_message_at = end_of_auction_or_exposition_on_option_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_option_message_record.improvement_order_side = end_of_auction_or_exposition_on_option_message_value;
  end_of_auction_or_exposition_on_option_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_option_message_at < 6 -> end_of_auction_or_exposition_on_option_message_record.improvement_phase_sequential_number[end_of_auction_or_exposition_on_option_message_at] = end_of_auction_or_exposition_on_option_message_value; end_of_auction_or_exposition_on_option_message_at = end_of_auction_or_exposition_on_option_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_option_message_record.auction_type = end_of_auction_or_exposition_on_option_message_value;
  skip
}

/* each byte of End Of Auction Or Exposition On Option Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_auction_or_exposition_on_option_message(end_of_auction_or_exposition_on_option_message_record, end_of_auction_or_exposition_on_option_message_base) {
  end_of_auction_or_exposition_on_option_message_record.exchange_id = (end_of_auction_or_exposition_on_option_message_base + 0 + 1) % 256;
  ramp_instrument_description(end_of_auction_or_exposition_on_option_message_record.instrument_description, end_of_auction_or_exposition_on_option_message_base + 1);
  end_of_auction_or_exposition_on_option_message_record.deletion_type = (end_of_auction_or_exposition_on_option_message_base + 21 + 1) % 256;
  end_of_auction_or_exposition_on_option_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_option_message_at < 6 -> end_of_auction_or_exposition_on_option_message_record.order_sequence_number[end_of_auction_or_exposition_on_option_message_at] = (end_of_auction_or_exposition_on_option_message_base + 22 + end_of_auction_or_exposition_on_option_message_at + 1) % 256; end_of_auction_or_exposition_on_option_message_at = end_of_auction_or_exposition_on_option_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_option_message_record.improvement_order_side = (end_of_auction_or_exposition_on_option_message_base + 28 + 1) % 256;
  end_of_auction_or_exposition_on_option_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_option_message_at < 6 -> end_of_auction_or_exposition_on_option_message_record.improvement_phase_sequential_number[end_of_auction_or_exposition_on_option_message_at] = (end_of_auction_or_exposition_on_option_message_base + 29 + end_of_auction_or_exposition_on_option_message_at + 1) % 256; end_of_auction_or_exposition_on_option_message_at = end_of_auction_or_exposition_on_option_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_option_message_record.auction_type = (end_of_auction_or_exposition_on_option_message_base + 35 + 1) % 256;
  skip
}

/* End Of Auction Or Exposition On Option Message to the wire, 36 bytes from where the cursor stands */
inline encode_end_of_auction_or_exposition_on_option_message(end_of_auction_or_exposition_on_option_message_record) {
  wire[at] = end_of_auction_or_exposition_on_option_message_record.exchange_id; at = at + 1;
  encode_instrument_description(end_of_auction_or_exposition_on_option_message_record.instrument_description);
  wire[at] = end_of_auction_or_exposition_on_option_message_record.deletion_type; at = at + 1;
  end_of_auction_or_exposition_on_option_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_option_message_at < 6 -> wire[at] = end_of_auction_or_exposition_on_option_message_record.order_sequence_number[end_of_auction_or_exposition_on_option_message_at]; at = at + 1; end_of_auction_or_exposition_on_option_message_at = end_of_auction_or_exposition_on_option_message_at + 1
  :: else -> break
  od;
  wire[at] = end_of_auction_or_exposition_on_option_message_record.improvement_order_side; at = at + 1;
  end_of_auction_or_exposition_on_option_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_option_message_at < 6 -> wire[at] = end_of_auction_or_exposition_on_option_message_record.improvement_phase_sequential_number[end_of_auction_or_exposition_on_option_message_at]; at = at + 1; end_of_auction_or_exposition_on_option_message_at = end_of_auction_or_exposition_on_option_message_at + 1
  :: else -> break
  od;
  wire[at] = end_of_auction_or_exposition_on_option_message_record.auction_type; at = at + 1;
  skip
}

/* End Of Auction Or Exposition On Option Message off the wire, 36 bytes from where the cursor stands */
inline decode_end_of_auction_or_exposition_on_option_message(end_of_auction_or_exposition_on_option_message_record) {
  end_of_auction_or_exposition_on_option_message_record.exchange_id = wire[at]; at = at + 1;
  decode_instrument_description(end_of_auction_or_exposition_on_option_message_record.instrument_description);
  end_of_auction_or_exposition_on_option_message_record.deletion_type = wire[at]; at = at + 1;
  end_of_auction_or_exposition_on_option_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_option_message_at < 6 -> end_of_auction_or_exposition_on_option_message_record.order_sequence_number[end_of_auction_or_exposition_on_option_message_at] = wire[at]; at = at + 1; end_of_auction_or_exposition_on_option_message_at = end_of_auction_or_exposition_on_option_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_option_message_record.improvement_order_side = wire[at]; at = at + 1;
  end_of_auction_or_exposition_on_option_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_option_message_at < 6 -> end_of_auction_or_exposition_on_option_message_record.improvement_phase_sequential_number[end_of_auction_or_exposition_on_option_message_at] = wire[at]; at = at + 1; end_of_auction_or_exposition_on_option_message_at = end_of_auction_or_exposition_on_option_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_option_message_record.auction_type = wire[at]; at = at + 1;
  skip
}

/* what was read of End Of Auction Or Exposition On Option Message is what was written, byte for byte */
inline equal_end_of_auction_or_exposition_on_option_message(end_of_auction_or_exposition_on_option_message_read, end_of_auction_or_exposition_on_option_message_written) {
  assert(end_of_auction_or_exposition_on_option_message_read.exchange_id == end_of_auction_or_exposition_on_option_message_written.exchange_id);
  equal_instrument_description(end_of_auction_or_exposition_on_option_message_read.instrument_description, end_of_auction_or_exposition_on_option_message_written.instrument_description);
  assert(end_of_auction_or_exposition_on_option_message_read.deletion_type == end_of_auction_or_exposition_on_option_message_written.deletion_type);
  end_of_auction_or_exposition_on_option_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_option_message_at < 6 -> assert(end_of_auction_or_exposition_on_option_message_read.order_sequence_number[end_of_auction_or_exposition_on_option_message_at] == end_of_auction_or_exposition_on_option_message_written.order_sequence_number[end_of_auction_or_exposition_on_option_message_at]); end_of_auction_or_exposition_on_option_message_at = end_of_auction_or_exposition_on_option_message_at + 1
  :: else -> break
  od;
  assert(end_of_auction_or_exposition_on_option_message_read.improvement_order_side == end_of_auction_or_exposition_on_option_message_written.improvement_order_side);
  end_of_auction_or_exposition_on_option_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_option_message_at < 6 -> assert(end_of_auction_or_exposition_on_option_message_read.improvement_phase_sequential_number[end_of_auction_or_exposition_on_option_message_at] == end_of_auction_or_exposition_on_option_message_written.improvement_phase_sequential_number[end_of_auction_or_exposition_on_option_message_at]); end_of_auction_or_exposition_on_option_message_at = end_of_auction_or_exposition_on_option_message_at + 1
  :: else -> break
  od;
  assert(end_of_auction_or_exposition_on_option_message_read.auction_type == end_of_auction_or_exposition_on_option_message_written.auction_type);
  skip
}

/* ---- End Of Auction Or Exposition On Complex Instruments Message: 46 bytes ---- */

/* End of Auction or Exposition on Complex Instruments */
typedef EndOfAuctionOrExpositionOnComplexInstrumentsMessage {
  byte exchange_id;
  byte complex_order_instrument_symbol[30];
  byte deletion_type;
  byte order_sequence_number[6];
  byte order_side;
  byte improvement_phase_sequential_number[6];
  byte auction_type
};

int end_of_auction_or_exposition_on_complex_instruments_message_at;

/* every byte of End Of Auction Or Exposition On Complex Instruments Message set to one value */
inline fill_end_of_auction_or_exposition_on_complex_instruments_message(end_of_auction_or_exposition_on_complex_instruments_message_record, end_of_auction_or_exposition_on_complex_instruments_message_value) {
  end_of_auction_or_exposition_on_complex_instruments_message_record.exchange_id = end_of_auction_or_exposition_on_complex_instruments_message_value;
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 30 -> end_of_auction_or_exposition_on_complex_instruments_message_record.complex_order_instrument_symbol[end_of_auction_or_exposition_on_complex_instruments_message_at] = end_of_auction_or_exposition_on_complex_instruments_message_value; end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_complex_instruments_message_record.deletion_type = end_of_auction_or_exposition_on_complex_instruments_message_value;
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 6 -> end_of_auction_or_exposition_on_complex_instruments_message_record.order_sequence_number[end_of_auction_or_exposition_on_complex_instruments_message_at] = end_of_auction_or_exposition_on_complex_instruments_message_value; end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_complex_instruments_message_record.order_side = end_of_auction_or_exposition_on_complex_instruments_message_value;
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 6 -> end_of_auction_or_exposition_on_complex_instruments_message_record.improvement_phase_sequential_number[end_of_auction_or_exposition_on_complex_instruments_message_at] = end_of_auction_or_exposition_on_complex_instruments_message_value; end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_complex_instruments_message_record.auction_type = end_of_auction_or_exposition_on_complex_instruments_message_value;
  skip
}

/* each byte of End Of Auction Or Exposition On Complex Instruments Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_auction_or_exposition_on_complex_instruments_message(end_of_auction_or_exposition_on_complex_instruments_message_record, end_of_auction_or_exposition_on_complex_instruments_message_base) {
  end_of_auction_or_exposition_on_complex_instruments_message_record.exchange_id = (end_of_auction_or_exposition_on_complex_instruments_message_base + 0 + 1) % 256;
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 30 -> end_of_auction_or_exposition_on_complex_instruments_message_record.complex_order_instrument_symbol[end_of_auction_or_exposition_on_complex_instruments_message_at] = (end_of_auction_or_exposition_on_complex_instruments_message_base + 1 + end_of_auction_or_exposition_on_complex_instruments_message_at + 1) % 256; end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_complex_instruments_message_record.deletion_type = (end_of_auction_or_exposition_on_complex_instruments_message_base + 31 + 1) % 256;
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 6 -> end_of_auction_or_exposition_on_complex_instruments_message_record.order_sequence_number[end_of_auction_or_exposition_on_complex_instruments_message_at] = (end_of_auction_or_exposition_on_complex_instruments_message_base + 32 + end_of_auction_or_exposition_on_complex_instruments_message_at + 1) % 256; end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_complex_instruments_message_record.order_side = (end_of_auction_or_exposition_on_complex_instruments_message_base + 38 + 1) % 256;
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 6 -> end_of_auction_or_exposition_on_complex_instruments_message_record.improvement_phase_sequential_number[end_of_auction_or_exposition_on_complex_instruments_message_at] = (end_of_auction_or_exposition_on_complex_instruments_message_base + 39 + end_of_auction_or_exposition_on_complex_instruments_message_at + 1) % 256; end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_complex_instruments_message_record.auction_type = (end_of_auction_or_exposition_on_complex_instruments_message_base + 45 + 1) % 256;
  skip
}

/* End Of Auction Or Exposition On Complex Instruments Message to the wire, 46 bytes from where the cursor stands */
inline encode_end_of_auction_or_exposition_on_complex_instruments_message(end_of_auction_or_exposition_on_complex_instruments_message_record) {
  wire[at] = end_of_auction_or_exposition_on_complex_instruments_message_record.exchange_id; at = at + 1;
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 30 -> wire[at] = end_of_auction_or_exposition_on_complex_instruments_message_record.complex_order_instrument_symbol[end_of_auction_or_exposition_on_complex_instruments_message_at]; at = at + 1; end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  wire[at] = end_of_auction_or_exposition_on_complex_instruments_message_record.deletion_type; at = at + 1;
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 6 -> wire[at] = end_of_auction_or_exposition_on_complex_instruments_message_record.order_sequence_number[end_of_auction_or_exposition_on_complex_instruments_message_at]; at = at + 1; end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  wire[at] = end_of_auction_or_exposition_on_complex_instruments_message_record.order_side; at = at + 1;
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 6 -> wire[at] = end_of_auction_or_exposition_on_complex_instruments_message_record.improvement_phase_sequential_number[end_of_auction_or_exposition_on_complex_instruments_message_at]; at = at + 1; end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  wire[at] = end_of_auction_or_exposition_on_complex_instruments_message_record.auction_type; at = at + 1;
  skip
}

/* End Of Auction Or Exposition On Complex Instruments Message off the wire, 46 bytes from where the cursor stands */
inline decode_end_of_auction_or_exposition_on_complex_instruments_message(end_of_auction_or_exposition_on_complex_instruments_message_record) {
  end_of_auction_or_exposition_on_complex_instruments_message_record.exchange_id = wire[at]; at = at + 1;
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 30 -> end_of_auction_or_exposition_on_complex_instruments_message_record.complex_order_instrument_symbol[end_of_auction_or_exposition_on_complex_instruments_message_at] = wire[at]; at = at + 1; end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_complex_instruments_message_record.deletion_type = wire[at]; at = at + 1;
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 6 -> end_of_auction_or_exposition_on_complex_instruments_message_record.order_sequence_number[end_of_auction_or_exposition_on_complex_instruments_message_at] = wire[at]; at = at + 1; end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_complex_instruments_message_record.order_side = wire[at]; at = at + 1;
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 6 -> end_of_auction_or_exposition_on_complex_instruments_message_record.improvement_phase_sequential_number[end_of_auction_or_exposition_on_complex_instruments_message_at] = wire[at]; at = at + 1; end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  end_of_auction_or_exposition_on_complex_instruments_message_record.auction_type = wire[at]; at = at + 1;
  skip
}

/* what was read of End Of Auction Or Exposition On Complex Instruments Message is what was written, byte for byte */
inline equal_end_of_auction_or_exposition_on_complex_instruments_message(end_of_auction_or_exposition_on_complex_instruments_message_read, end_of_auction_or_exposition_on_complex_instruments_message_written) {
  assert(end_of_auction_or_exposition_on_complex_instruments_message_read.exchange_id == end_of_auction_or_exposition_on_complex_instruments_message_written.exchange_id);
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 30 -> assert(end_of_auction_or_exposition_on_complex_instruments_message_read.complex_order_instrument_symbol[end_of_auction_or_exposition_on_complex_instruments_message_at] == end_of_auction_or_exposition_on_complex_instruments_message_written.complex_order_instrument_symbol[end_of_auction_or_exposition_on_complex_instruments_message_at]); end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  assert(end_of_auction_or_exposition_on_complex_instruments_message_read.deletion_type == end_of_auction_or_exposition_on_complex_instruments_message_written.deletion_type);
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 6 -> assert(end_of_auction_or_exposition_on_complex_instruments_message_read.order_sequence_number[end_of_auction_or_exposition_on_complex_instruments_message_at] == end_of_auction_or_exposition_on_complex_instruments_message_written.order_sequence_number[end_of_auction_or_exposition_on_complex_instruments_message_at]); end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  assert(end_of_auction_or_exposition_on_complex_instruments_message_read.order_side == end_of_auction_or_exposition_on_complex_instruments_message_written.order_side);
  end_of_auction_or_exposition_on_complex_instruments_message_at = 0;
  do
  :: end_of_auction_or_exposition_on_complex_instruments_message_at < 6 -> assert(end_of_auction_or_exposition_on_complex_instruments_message_read.improvement_phase_sequential_number[end_of_auction_or_exposition_on_complex_instruments_message_at] == end_of_auction_or_exposition_on_complex_instruments_message_written.improvement_phase_sequential_number[end_of_auction_or_exposition_on_complex_instruments_message_at]); end_of_auction_or_exposition_on_complex_instruments_message_at = end_of_auction_or_exposition_on_complex_instruments_message_at + 1
  :: else -> break
  od;
  assert(end_of_auction_or_exposition_on_complex_instruments_message_read.auction_type == end_of_auction_or_exposition_on_complex_instruments_message_written.auction_type);
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
    assert(at == 11);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 11);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* End Of Transmission Message: encoded, read back, and compared */
proctype check_end_of_transmission_message() {
  EndOfTransmissionMessage end_of_transmission_message_sent;
  EndOfTransmissionMessage end_of_transmission_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_transmission_message(end_of_transmission_message_sent, 0)
  :: pattern == 1 -> fill_end_of_transmission_message(end_of_transmission_message_sent, 32)
  :: pattern == 2 -> fill_end_of_transmission_message(end_of_transmission_message_sent, 255)
  :: else -> ramp_end_of_transmission_message(end_of_transmission_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_transmission_message(end_of_transmission_message_sent);
    assert(at == 7);
    at = 0;
    decode_end_of_transmission_message(end_of_transmission_message_got);
    assert(at == 7);
    equal_end_of_transmission_message(end_of_transmission_message_got, end_of_transmission_message_sent)
  }
}

/* Circuit Assurance Message: encoded, read back, and compared */
proctype check_circuit_assurance_message() {
  CircuitAssuranceMessage circuit_assurance_message_sent;
  CircuitAssuranceMessage circuit_assurance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_circuit_assurance_message(circuit_assurance_message_sent, 0)
  :: pattern == 1 -> fill_circuit_assurance_message(circuit_assurance_message_sent, 32)
  :: pattern == 2 -> fill_circuit_assurance_message(circuit_assurance_message_sent, 255)
  :: else -> ramp_circuit_assurance_message(circuit_assurance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_circuit_assurance_message(circuit_assurance_message_sent);
    assert(at == 6);
    at = 0;
    decode_circuit_assurance_message(circuit_assurance_message_got);
    assert(at == 6);
    equal_circuit_assurance_message(circuit_assurance_message_got, circuit_assurance_message_sent)
  }
}

/* System Timestamp Message: encoded, read back, and compared */
proctype check_system_timestamp_message() {
  SystemTimestampMessage system_timestamp_message_sent;
  SystemTimestampMessage system_timestamp_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_timestamp_message(system_timestamp_message_sent, 0)
  :: pattern == 1 -> fill_system_timestamp_message(system_timestamp_message_sent, 32)
  :: pattern == 2 -> fill_system_timestamp_message(system_timestamp_message_sent, 255)
  :: else -> ramp_system_timestamp_message(system_timestamp_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_timestamp_message(system_timestamp_message_sent);
    assert(at == 9);
    at = 0;
    decode_system_timestamp_message(system_timestamp_message_got);
    assert(at == 9);
    equal_system_timestamp_message(system_timestamp_message_got, system_timestamp_message_sent)
  }
}

/* Instrument Description: encoded, read back, and compared */
proctype check_instrument_description() {
  InstrumentDescription instrument_description_sent;
  InstrumentDescription instrument_description_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_description(instrument_description_sent, 0)
  :: pattern == 1 -> fill_instrument_description(instrument_description_sent, 32)
  :: pattern == 2 -> fill_instrument_description(instrument_description_sent, 255)
  :: else -> ramp_instrument_description(instrument_description_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_description(instrument_description_sent);
    assert(at == 20);
    at = 0;
    decode_instrument_description(instrument_description_got);
    assert(at == 20);
    equal_instrument_description(instrument_description_got, instrument_description_sent)
  }
}

/* Group Opening Time Message: encoded, read back, and compared */
proctype check_group_opening_time_message() {
  GroupOpeningTimeMessage group_opening_time_message_sent;
  GroupOpeningTimeMessage group_opening_time_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_opening_time_message(group_opening_time_message_sent, 0)
  :: pattern == 1 -> fill_group_opening_time_message(group_opening_time_message_sent, 32)
  :: pattern == 2 -> fill_group_opening_time_message(group_opening_time_message_sent, 255)
  :: else -> ramp_group_opening_time_message(group_opening_time_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_opening_time_message(group_opening_time_message_sent);
    assert(at == 14);
    at = 0;
    decode_group_opening_time_message(group_opening_time_message_got);
    assert(at == 14);
    equal_group_opening_time_message(group_opening_time_message_got, group_opening_time_message_sent)
  }
}

/* Group Status Message: encoded, read back, and compared */
proctype check_group_status_message() {
  GroupStatusMessage group_status_message_sent;
  GroupStatusMessage group_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_status_message(group_status_message_sent, 0)
  :: pattern == 1 -> fill_group_status_message(group_status_message_sent, 32)
  :: pattern == 2 -> fill_group_status_message(group_status_message_sent, 255)
  :: else -> ramp_group_status_message(group_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_status_message(group_status_message_sent);
    assert(at == 8);
    at = 0;
    decode_group_status_message(group_status_message_got);
    assert(at == 8);
    equal_group_status_message(group_status_message_got, group_status_message_sent)
  }
}

/* Strategies Group Status Message: encoded, read back, and compared */
proctype check_strategies_group_status_message() {
  StrategiesGroupStatusMessage strategies_group_status_message_sent;
  StrategiesGroupStatusMessage strategies_group_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_strategies_group_status_message(strategies_group_status_message_sent, 0)
  :: pattern == 1 -> fill_strategies_group_status_message(strategies_group_status_message_sent, 32)
  :: pattern == 2 -> fill_strategies_group_status_message(strategies_group_status_message_sent, 255)
  :: else -> ramp_strategies_group_status_message(strategies_group_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_strategies_group_status_message(strategies_group_status_message_sent);
    assert(at == 4);
    at = 0;
    decode_strategies_group_status_message(strategies_group_status_message_got);
    assert(at == 4);
    equal_strategies_group_status_message(strategies_group_status_message_got, strategies_group_status_message_sent)
  }
}

/* Market Flow Indicator: encoded, read back, and compared */
proctype check_market_flow_indicator() {
  MarketFlowIndicator market_flow_indicator_sent;
  MarketFlowIndicator market_flow_indicator_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_flow_indicator(market_flow_indicator_sent, 0)
  :: pattern == 1 -> fill_market_flow_indicator(market_flow_indicator_sent, 32)
  :: pattern == 2 -> fill_market_flow_indicator(market_flow_indicator_sent, 255)
  :: else -> ramp_market_flow_indicator(market_flow_indicator_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_flow_indicator(market_flow_indicator_sent);
    assert(at == 2);
    at = 0;
    decode_market_flow_indicator(market_flow_indicator_got);
    assert(at == 2);
    equal_market_flow_indicator(market_flow_indicator_got, market_flow_indicator_sent)
  }
}

/* Option Marker: encoded, read back, and compared */
proctype check_option_marker() {
  OptionMarker option_marker_sent;
  OptionMarker option_marker_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_option_marker(option_marker_sent, 0)
  :: pattern == 1 -> fill_option_marker(option_marker_sent, 32)
  :: pattern == 2 -> fill_option_marker(option_marker_sent, 255)
  :: else -> ramp_option_marker(option_marker_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_option_marker(option_marker_sent);
    assert(at == 2);
    at = 0;
    decode_option_marker(option_marker_got);
    assert(at == 2);
    equal_option_marker(option_marker_got, option_marker_sent)
  }
}

/* Option Instrument Keys Message: encoded, read back, and compared */
proctype check_option_instrument_keys_message() {
  OptionInstrumentKeysMessage option_instrument_keys_message_sent;
  OptionInstrumentKeysMessage option_instrument_keys_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_option_instrument_keys_message(option_instrument_keys_message_sent, 0)
  :: pattern == 1 -> fill_option_instrument_keys_message(option_instrument_keys_message_sent, 32)
  :: pattern == 2 -> fill_option_instrument_keys_message(option_instrument_keys_message_sent, 255)
  :: else -> ramp_option_instrument_keys_message(option_instrument_keys_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_option_instrument_keys_message(option_instrument_keys_message_sent);
    assert(at == 108);
    at = 0;
    decode_option_instrument_keys_message(option_instrument_keys_message_got);
    assert(at == 108);
    equal_option_instrument_keys_message(option_instrument_keys_message_got, option_instrument_keys_message_sent)
  }
}

/* Beginning Of Options Summary Message: encoded, read back, and compared */
proctype check_beginning_of_options_summary_message() {
  BeginningOfOptionsSummaryMessage beginning_of_options_summary_message_sent;
  BeginningOfOptionsSummaryMessage beginning_of_options_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_beginning_of_options_summary_message(beginning_of_options_summary_message_sent, 0)
  :: pattern == 1 -> fill_beginning_of_options_summary_message(beginning_of_options_summary_message_sent, 32)
  :: pattern == 2 -> fill_beginning_of_options_summary_message(beginning_of_options_summary_message_sent, 255)
  :: else -> ramp_beginning_of_options_summary_message(beginning_of_options_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_beginning_of_options_summary_message(beginning_of_options_summary_message_sent);
    assert(at == 1);
    at = 0;
    decode_beginning_of_options_summary_message(beginning_of_options_summary_message_got);
    assert(at == 1);
    equal_beginning_of_options_summary_message(beginning_of_options_summary_message_got, beginning_of_options_summary_message_sent)
  }
}

/* Beginning Of Complex Order Summary Message: encoded, read back, and compared */
proctype check_beginning_of_complex_order_summary_message() {
  BeginningOfComplexOrderSummaryMessage beginning_of_complex_order_summary_message_sent;
  BeginningOfComplexOrderSummaryMessage beginning_of_complex_order_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_beginning_of_complex_order_summary_message(beginning_of_complex_order_summary_message_sent, 0)
  :: pattern == 1 -> fill_beginning_of_complex_order_summary_message(beginning_of_complex_order_summary_message_sent, 32)
  :: pattern == 2 -> fill_beginning_of_complex_order_summary_message(beginning_of_complex_order_summary_message_sent, 255)
  :: else -> ramp_beginning_of_complex_order_summary_message(beginning_of_complex_order_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_beginning_of_complex_order_summary_message(beginning_of_complex_order_summary_message_sent);
    assert(at == 1);
    at = 0;
    decode_beginning_of_complex_order_summary_message(beginning_of_complex_order_summary_message_got);
    assert(at == 1);
    equal_beginning_of_complex_order_summary_message(beginning_of_complex_order_summary_message_got, beginning_of_complex_order_summary_message_sent)
  }
}

/* End Of Sales Message: encoded, read back, and compared */
proctype check_end_of_sales_message() {
  EndOfSalesMessage end_of_sales_message_sent;
  EndOfSalesMessage end_of_sales_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_sales_message(end_of_sales_message_sent, 0)
  :: pattern == 1 -> fill_end_of_sales_message(end_of_sales_message_sent, 32)
  :: pattern == 2 -> fill_end_of_sales_message(end_of_sales_message_sent, 255)
  :: else -> ramp_end_of_sales_message(end_of_sales_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_sales_message(end_of_sales_message_sent);
    assert(at == 7);
    at = 0;
    decode_end_of_sales_message(end_of_sales_message_got);
    assert(at == 7);
    equal_end_of_sales_message(end_of_sales_message_got, end_of_sales_message_sent)
  }
}

/* Start Of Auction On Option Message: encoded, read back, and compared */
proctype check_start_of_auction_on_option_message() {
  StartOfAuctionOnOptionMessage start_of_auction_on_option_message_sent;
  StartOfAuctionOnOptionMessage start_of_auction_on_option_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_auction_on_option_message(start_of_auction_on_option_message_sent, 0)
  :: pattern == 1 -> fill_start_of_auction_on_option_message(start_of_auction_on_option_message_sent, 32)
  :: pattern == 2 -> fill_start_of_auction_on_option_message(start_of_auction_on_option_message_sent, 255)
  :: else -> ramp_start_of_auction_on_option_message(start_of_auction_on_option_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_auction_on_option_message(start_of_auction_on_option_message_sent);
    assert(at == 73);
    at = 0;
    decode_start_of_auction_on_option_message(start_of_auction_on_option_message_got);
    assert(at == 73);
    equal_start_of_auction_on_option_message(start_of_auction_on_option_message_got, start_of_auction_on_option_message_sent)
  }
}

/* Start Of Auction On Complex Order Message: encoded, read back, and compared */
proctype check_start_of_auction_on_complex_order_message() {
  StartOfAuctionOnComplexOrderMessage start_of_auction_on_complex_order_message_sent;
  StartOfAuctionOnComplexOrderMessage start_of_auction_on_complex_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_auction_on_complex_order_message(start_of_auction_on_complex_order_message_sent, 0)
  :: pattern == 1 -> fill_start_of_auction_on_complex_order_message(start_of_auction_on_complex_order_message_sent, 32)
  :: pattern == 2 -> fill_start_of_auction_on_complex_order_message(start_of_auction_on_complex_order_message_sent, 255)
  :: else -> ramp_start_of_auction_on_complex_order_message(start_of_auction_on_complex_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_auction_on_complex_order_message(start_of_auction_on_complex_order_message_sent);
    assert(at == 83);
    at = 0;
    decode_start_of_auction_on_complex_order_message(start_of_auction_on_complex_order_message_got);
    assert(at == 83);
    equal_start_of_auction_on_complex_order_message(start_of_auction_on_complex_order_message_got, start_of_auction_on_complex_order_message_sent)
  }
}

/* Start Of Exposition On Option Message: encoded, read back, and compared */
proctype check_start_of_exposition_on_option_message() {
  StartOfExpositionOnOptionMessage start_of_exposition_on_option_message_sent;
  StartOfExpositionOnOptionMessage start_of_exposition_on_option_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_exposition_on_option_message(start_of_exposition_on_option_message_sent, 0)
  :: pattern == 1 -> fill_start_of_exposition_on_option_message(start_of_exposition_on_option_message_sent, 32)
  :: pattern == 2 -> fill_start_of_exposition_on_option_message(start_of_exposition_on_option_message_sent, 255)
  :: else -> ramp_start_of_exposition_on_option_message(start_of_exposition_on_option_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_exposition_on_option_message(start_of_exposition_on_option_message_sent);
    assert(at == 69);
    at = 0;
    decode_start_of_exposition_on_option_message(start_of_exposition_on_option_message_got);
    assert(at == 69);
    equal_start_of_exposition_on_option_message(start_of_exposition_on_option_message_got, start_of_exposition_on_option_message_sent)
  }
}

/* Start Of Exposition On Complex Order Message: encoded, read back, and compared */
proctype check_start_of_exposition_on_complex_order_message() {
  StartOfExpositionOnComplexOrderMessage start_of_exposition_on_complex_order_message_sent;
  StartOfExpositionOnComplexOrderMessage start_of_exposition_on_complex_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_exposition_on_complex_order_message(start_of_exposition_on_complex_order_message_sent, 0)
  :: pattern == 1 -> fill_start_of_exposition_on_complex_order_message(start_of_exposition_on_complex_order_message_sent, 32)
  :: pattern == 2 -> fill_start_of_exposition_on_complex_order_message(start_of_exposition_on_complex_order_message_sent, 255)
  :: else -> ramp_start_of_exposition_on_complex_order_message(start_of_exposition_on_complex_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_exposition_on_complex_order_message(start_of_exposition_on_complex_order_message_sent);
    assert(at == 80);
    at = 0;
    decode_start_of_exposition_on_complex_order_message(start_of_exposition_on_complex_order_message_got);
    assert(at == 80);
    equal_start_of_exposition_on_complex_order_message(start_of_exposition_on_complex_order_message_got, start_of_exposition_on_complex_order_message_sent)
  }
}

/* End Of Auction Or Exposition On Option Message: encoded, read back, and compared */
proctype check_end_of_auction_or_exposition_on_option_message() {
  EndOfAuctionOrExpositionOnOptionMessage end_of_auction_or_exposition_on_option_message_sent;
  EndOfAuctionOrExpositionOnOptionMessage end_of_auction_or_exposition_on_option_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_auction_or_exposition_on_option_message(end_of_auction_or_exposition_on_option_message_sent, 0)
  :: pattern == 1 -> fill_end_of_auction_or_exposition_on_option_message(end_of_auction_or_exposition_on_option_message_sent, 32)
  :: pattern == 2 -> fill_end_of_auction_or_exposition_on_option_message(end_of_auction_or_exposition_on_option_message_sent, 255)
  :: else -> ramp_end_of_auction_or_exposition_on_option_message(end_of_auction_or_exposition_on_option_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_auction_or_exposition_on_option_message(end_of_auction_or_exposition_on_option_message_sent);
    assert(at == 36);
    at = 0;
    decode_end_of_auction_or_exposition_on_option_message(end_of_auction_or_exposition_on_option_message_got);
    assert(at == 36);
    equal_end_of_auction_or_exposition_on_option_message(end_of_auction_or_exposition_on_option_message_got, end_of_auction_or_exposition_on_option_message_sent)
  }
}

/* End Of Auction Or Exposition On Complex Instruments Message: encoded, read back, and compared */
proctype check_end_of_auction_or_exposition_on_complex_instruments_message() {
  EndOfAuctionOrExpositionOnComplexInstrumentsMessage end_of_auction_or_exposition_on_complex_instruments_message_sent;
  EndOfAuctionOrExpositionOnComplexInstrumentsMessage end_of_auction_or_exposition_on_complex_instruments_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_auction_or_exposition_on_complex_instruments_message(end_of_auction_or_exposition_on_complex_instruments_message_sent, 0)
  :: pattern == 1 -> fill_end_of_auction_or_exposition_on_complex_instruments_message(end_of_auction_or_exposition_on_complex_instruments_message_sent, 32)
  :: pattern == 2 -> fill_end_of_auction_or_exposition_on_complex_instruments_message(end_of_auction_or_exposition_on_complex_instruments_message_sent, 255)
  :: else -> ramp_end_of_auction_or_exposition_on_complex_instruments_message(end_of_auction_or_exposition_on_complex_instruments_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_auction_or_exposition_on_complex_instruments_message(end_of_auction_or_exposition_on_complex_instruments_message_sent);
    assert(at == 46);
    at = 0;
    decode_end_of_auction_or_exposition_on_complex_instruments_message(end_of_auction_or_exposition_on_complex_instruments_message_got);
    assert(at == 46);
    equal_end_of_auction_or_exposition_on_complex_instruments_message(end_of_auction_or_exposition_on_complex_instruments_message_got, end_of_auction_or_exposition_on_complex_instruments_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_end_of_transmission_message()
  :: run check_circuit_assurance_message()
  :: run check_system_timestamp_message()
  :: run check_instrument_description()
  :: run check_group_opening_time_message()
  :: run check_group_status_message()
  :: run check_strategies_group_status_message()
  :: run check_market_flow_indicator()
  :: run check_option_marker()
  :: run check_option_instrument_keys_message()
  :: run check_beginning_of_options_summary_message()
  :: run check_beginning_of_complex_order_summary_message()
  :: run check_end_of_sales_message()
  :: run check_start_of_auction_on_option_message()
  :: run check_start_of_auction_on_complex_order_message()
  :: run check_start_of_exposition_on_option_message()
  :: run check_start_of_exposition_on_complex_order_message()
  :: run check_end_of_auction_or_exposition_on_option_message()
  :: run check_end_of_auction_or_exposition_on_complex_instruments_message()
  fi
}
