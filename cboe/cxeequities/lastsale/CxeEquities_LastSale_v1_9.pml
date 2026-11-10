/*
 * Chicago Board Options Exchange Last Sale
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
 *   - a field filling what is left of what holds it
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 239

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Debug Packet: 1 bytes --------------------------------------------------- */

/* Debug packets are intended to provide human readable text that may aid in debugging problems. */
typedef DebugPacket {
  byte text
};

/* every byte of Debug Packet set to one value */
inline fill_debug_packet(debug_packet_record, debug_packet_value) {
  debug_packet_record.text = debug_packet_value;
  skip
}

/* each byte of Debug Packet set to where it lies, so a field read out of place says so */
inline ramp_debug_packet(debug_packet_record, debug_packet_base) {
  debug_packet_record.text = (debug_packet_base + 0 + 1) % 256;
  skip
}

/* Debug Packet to the wire, 1 bytes from where the cursor stands */
inline encode_debug_packet(debug_packet_record) {
  wire[at] = debug_packet_record.text; at = at + 1;
  skip
}

/* Debug Packet off the wire, 1 bytes from where the cursor stands */
inline decode_debug_packet(debug_packet_record) {
  debug_packet_record.text = wire[at]; at = at + 1;
  skip
}

/* what was read of Debug Packet is what was written, byte for byte */
inline equal_debug_packet(debug_packet_read, debug_packet_written) {
  assert(debug_packet_read.text == debug_packet_written.text);
  skip
}

/* ---- Login Accepted Packet: 20 bytes ----------------------------------------- */

/* The Soup 2.0 server sends a Login Accepted Packet in response to receiving a valid Login Request  from the client. */
typedef LoginAcceptedPacket {
  byte session[10];
  byte sequence_number[10]
};

int login_accepted_packet_at;

/* every byte of Login Accepted Packet set to one value */
inline fill_login_accepted_packet(login_accepted_packet_record, login_accepted_packet_value) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.session[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.sequence_number[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Accepted Packet set to where it lies, so a field read out of place says so */
inline ramp_login_accepted_packet(login_accepted_packet_record, login_accepted_packet_base) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.session[login_accepted_packet_at] = (login_accepted_packet_base + 0 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.sequence_number[login_accepted_packet_at] = (login_accepted_packet_base + 10 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet to the wire, 20 bytes from where the cursor stands */
inline encode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> wire[at] = login_accepted_packet_record.session[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> wire[at] = login_accepted_packet_record.sequence_number[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet off the wire, 20 bytes from where the cursor stands */
inline decode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.session[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.sequence_number[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Accepted Packet is what was written, byte for byte */
inline equal_login_accepted_packet(login_accepted_packet_read, login_accepted_packet_written) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> assert(login_accepted_packet_read.session[login_accepted_packet_at] == login_accepted_packet_written.session[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> assert(login_accepted_packet_read.sequence_number[login_accepted_packet_at] == login_accepted_packet_written.sequence_number[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Rejected Packet: 1 bytes ------------------------------------------ */

/* The Soup 2.0 server sends this packet in response to an invalid Login Request Packet from the client. */
typedef LoginRejectedPacket {
  byte reject_reason_code
};

/* every byte of Login Rejected Packet set to one value */
inline fill_login_rejected_packet(login_rejected_packet_record, login_rejected_packet_value) {
  login_rejected_packet_record.reject_reason_code = login_rejected_packet_value;
  skip
}

/* each byte of Login Rejected Packet set to where it lies, so a field read out of place says so */
inline ramp_login_rejected_packet(login_rejected_packet_record, login_rejected_packet_base) {
  login_rejected_packet_record.reject_reason_code = (login_rejected_packet_base + 0 + 1) % 256;
  skip
}

/* Login Rejected Packet to the wire, 1 bytes from where the cursor stands */
inline encode_login_rejected_packet(login_rejected_packet_record) {
  wire[at] = login_rejected_packet_record.reject_reason_code; at = at + 1;
  skip
}

/* Login Rejected Packet off the wire, 1 bytes from where the cursor stands */
inline decode_login_rejected_packet(login_rejected_packet_record) {
  login_rejected_packet_record.reject_reason_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Rejected Packet is what was written, byte for byte */
inline equal_login_rejected_packet(login_rejected_packet_read, login_rejected_packet_written) {
  assert(login_rejected_packet_read.reject_reason_code == login_rejected_packet_written.reject_reason_code);
  skip
}

/* ---- Sequenced Message Header: 9 bytes --------------------------------------- */

/* Sequenced Message Header */
typedef SequencedMessageHeader {
  byte timestamp[8];
  byte sequenced_message_type
};

int sequenced_message_header_at;

/* every byte of Sequenced Message Header set to one value */
inline fill_sequenced_message_header(sequenced_message_header_record, sequenced_message_header_value) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = sequenced_message_header_value; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.sequenced_message_type = sequenced_message_header_value;
  skip
}

/* each byte of Sequenced Message Header set to where it lies, so a field read out of place says so */
inline ramp_sequenced_message_header(sequenced_message_header_record, sequenced_message_header_base) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = (sequenced_message_header_base + 0 + sequenced_message_header_at + 1) % 256; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.sequenced_message_type = (sequenced_message_header_base + 8 + 1) % 256;
  skip
}

/* Sequenced Message Header to the wire, 9 bytes from where the cursor stands */
inline encode_sequenced_message_header(sequenced_message_header_record) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> wire[at] = sequenced_message_header_record.timestamp[sequenced_message_header_at]; at = at + 1; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  wire[at] = sequenced_message_header_record.sequenced_message_type; at = at + 1;
  skip
}

/* Sequenced Message Header off the wire, 9 bytes from where the cursor stands */
inline decode_sequenced_message_header(sequenced_message_header_record) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = wire[at]; at = at + 1; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.sequenced_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Sequenced Message Header is what was written, byte for byte */
inline equal_sequenced_message_header(sequenced_message_header_read, sequenced_message_header_written) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> assert(sequenced_message_header_read.timestamp[sequenced_message_header_at] == sequenced_message_header_written.timestamp[sequenced_message_header_at]); sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  assert(sequenced_message_header_read.sequenced_message_type == sequenced_message_header_written.sequenced_message_type);
  skip
}

/* ---- Last Sale Europe Message: 157 bytes ------------------------------------- */

/* Last Sale Europe Messages are sent when an order on a Cboe order book is executed in whole or in part, or when a reported trade is submitted to Cboe */
typedef LastSaleEuropeMessage {
  byte trading_date_time[27];
  byte symbol[12];
  byte price[18];
  byte price_currency[3];
  byte executed_shares[12];
  byte execution_venue[4];
  byte publication_date_time[27];
  byte trade_id[12];
  byte transaction_category[4];
  byte negotiation_flag[4];
  byte agency_cross_trade[4];
  byte modification_indicator[4];
  byte benchmark_reference_indicator[4];
  byte special_dividend[4];
  byte price_discovery_process[4];
  byte algorithmic_indicator[4];
  byte post_trade_deferral_reason[4];
  byte duplicative_indicator[4];
  byte jurisdiction[2]
};

int last_sale_europe_message_at;

/* every byte of Last Sale Europe Message set to one value */
inline fill_last_sale_europe_message(last_sale_europe_message_record, last_sale_europe_message_value) {
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 27 -> last_sale_europe_message_record.trading_date_time[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> last_sale_europe_message_record.symbol[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 18 -> last_sale_europe_message_record.price[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 3 -> last_sale_europe_message_record.price_currency[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> last_sale_europe_message_record.executed_shares[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.execution_venue[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 27 -> last_sale_europe_message_record.publication_date_time[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> last_sale_europe_message_record.trade_id[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.transaction_category[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.negotiation_flag[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.agency_cross_trade[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.modification_indicator[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.benchmark_reference_indicator[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.special_dividend[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.price_discovery_process[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.algorithmic_indicator[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.post_trade_deferral_reason[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.duplicative_indicator[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 2 -> last_sale_europe_message_record.jurisdiction[last_sale_europe_message_at] = last_sale_europe_message_value; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Last Sale Europe Message set to where it lies, so a field read out of place says so */
inline ramp_last_sale_europe_message(last_sale_europe_message_record, last_sale_europe_message_base) {
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 27 -> last_sale_europe_message_record.trading_date_time[last_sale_europe_message_at] = (last_sale_europe_message_base + 0 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> last_sale_europe_message_record.symbol[last_sale_europe_message_at] = (last_sale_europe_message_base + 27 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 18 -> last_sale_europe_message_record.price[last_sale_europe_message_at] = (last_sale_europe_message_base + 39 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 3 -> last_sale_europe_message_record.price_currency[last_sale_europe_message_at] = (last_sale_europe_message_base + 57 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> last_sale_europe_message_record.executed_shares[last_sale_europe_message_at] = (last_sale_europe_message_base + 60 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.execution_venue[last_sale_europe_message_at] = (last_sale_europe_message_base + 72 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 27 -> last_sale_europe_message_record.publication_date_time[last_sale_europe_message_at] = (last_sale_europe_message_base + 76 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> last_sale_europe_message_record.trade_id[last_sale_europe_message_at] = (last_sale_europe_message_base + 103 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.transaction_category[last_sale_europe_message_at] = (last_sale_europe_message_base + 115 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.negotiation_flag[last_sale_europe_message_at] = (last_sale_europe_message_base + 119 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.agency_cross_trade[last_sale_europe_message_at] = (last_sale_europe_message_base + 123 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.modification_indicator[last_sale_europe_message_at] = (last_sale_europe_message_base + 127 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.benchmark_reference_indicator[last_sale_europe_message_at] = (last_sale_europe_message_base + 131 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.special_dividend[last_sale_europe_message_at] = (last_sale_europe_message_base + 135 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.price_discovery_process[last_sale_europe_message_at] = (last_sale_europe_message_base + 139 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.algorithmic_indicator[last_sale_europe_message_at] = (last_sale_europe_message_base + 143 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.post_trade_deferral_reason[last_sale_europe_message_at] = (last_sale_europe_message_base + 147 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.duplicative_indicator[last_sale_europe_message_at] = (last_sale_europe_message_base + 151 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 2 -> last_sale_europe_message_record.jurisdiction[last_sale_europe_message_at] = (last_sale_europe_message_base + 155 + last_sale_europe_message_at + 1) % 256; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  skip
}

/* Last Sale Europe Message to the wire, 157 bytes from where the cursor stands */
inline encode_last_sale_europe_message(last_sale_europe_message_record) {
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 27 -> wire[at] = last_sale_europe_message_record.trading_date_time[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> wire[at] = last_sale_europe_message_record.symbol[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 18 -> wire[at] = last_sale_europe_message_record.price[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 3 -> wire[at] = last_sale_europe_message_record.price_currency[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> wire[at] = last_sale_europe_message_record.executed_shares[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> wire[at] = last_sale_europe_message_record.execution_venue[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 27 -> wire[at] = last_sale_europe_message_record.publication_date_time[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> wire[at] = last_sale_europe_message_record.trade_id[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> wire[at] = last_sale_europe_message_record.transaction_category[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> wire[at] = last_sale_europe_message_record.negotiation_flag[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> wire[at] = last_sale_europe_message_record.agency_cross_trade[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> wire[at] = last_sale_europe_message_record.modification_indicator[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> wire[at] = last_sale_europe_message_record.benchmark_reference_indicator[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> wire[at] = last_sale_europe_message_record.special_dividend[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> wire[at] = last_sale_europe_message_record.price_discovery_process[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> wire[at] = last_sale_europe_message_record.algorithmic_indicator[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> wire[at] = last_sale_europe_message_record.post_trade_deferral_reason[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> wire[at] = last_sale_europe_message_record.duplicative_indicator[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 2 -> wire[at] = last_sale_europe_message_record.jurisdiction[last_sale_europe_message_at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  skip
}

/* Last Sale Europe Message off the wire, 157 bytes from where the cursor stands */
inline decode_last_sale_europe_message(last_sale_europe_message_record) {
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 27 -> last_sale_europe_message_record.trading_date_time[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> last_sale_europe_message_record.symbol[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 18 -> last_sale_europe_message_record.price[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 3 -> last_sale_europe_message_record.price_currency[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> last_sale_europe_message_record.executed_shares[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.execution_venue[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 27 -> last_sale_europe_message_record.publication_date_time[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> last_sale_europe_message_record.trade_id[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.transaction_category[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.negotiation_flag[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.agency_cross_trade[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.modification_indicator[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.benchmark_reference_indicator[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.special_dividend[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.price_discovery_process[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.algorithmic_indicator[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.post_trade_deferral_reason[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> last_sale_europe_message_record.duplicative_indicator[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 2 -> last_sale_europe_message_record.jurisdiction[last_sale_europe_message_at] = wire[at]; at = at + 1; last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Last Sale Europe Message is what was written, byte for byte */
inline equal_last_sale_europe_message(last_sale_europe_message_read, last_sale_europe_message_written) {
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 27 -> assert(last_sale_europe_message_read.trading_date_time[last_sale_europe_message_at] == last_sale_europe_message_written.trading_date_time[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> assert(last_sale_europe_message_read.symbol[last_sale_europe_message_at] == last_sale_europe_message_written.symbol[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 18 -> assert(last_sale_europe_message_read.price[last_sale_europe_message_at] == last_sale_europe_message_written.price[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 3 -> assert(last_sale_europe_message_read.price_currency[last_sale_europe_message_at] == last_sale_europe_message_written.price_currency[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> assert(last_sale_europe_message_read.executed_shares[last_sale_europe_message_at] == last_sale_europe_message_written.executed_shares[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> assert(last_sale_europe_message_read.execution_venue[last_sale_europe_message_at] == last_sale_europe_message_written.execution_venue[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 27 -> assert(last_sale_europe_message_read.publication_date_time[last_sale_europe_message_at] == last_sale_europe_message_written.publication_date_time[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 12 -> assert(last_sale_europe_message_read.trade_id[last_sale_europe_message_at] == last_sale_europe_message_written.trade_id[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> assert(last_sale_europe_message_read.transaction_category[last_sale_europe_message_at] == last_sale_europe_message_written.transaction_category[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> assert(last_sale_europe_message_read.negotiation_flag[last_sale_europe_message_at] == last_sale_europe_message_written.negotiation_flag[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> assert(last_sale_europe_message_read.agency_cross_trade[last_sale_europe_message_at] == last_sale_europe_message_written.agency_cross_trade[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> assert(last_sale_europe_message_read.modification_indicator[last_sale_europe_message_at] == last_sale_europe_message_written.modification_indicator[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> assert(last_sale_europe_message_read.benchmark_reference_indicator[last_sale_europe_message_at] == last_sale_europe_message_written.benchmark_reference_indicator[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> assert(last_sale_europe_message_read.special_dividend[last_sale_europe_message_at] == last_sale_europe_message_written.special_dividend[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> assert(last_sale_europe_message_read.price_discovery_process[last_sale_europe_message_at] == last_sale_europe_message_written.price_discovery_process[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> assert(last_sale_europe_message_read.algorithmic_indicator[last_sale_europe_message_at] == last_sale_europe_message_written.algorithmic_indicator[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> assert(last_sale_europe_message_read.post_trade_deferral_reason[last_sale_europe_message_at] == last_sale_europe_message_written.post_trade_deferral_reason[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 4 -> assert(last_sale_europe_message_read.duplicative_indicator[last_sale_europe_message_at] == last_sale_europe_message_written.duplicative_indicator[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  last_sale_europe_message_at = 0;
  do
  :: last_sale_europe_message_at < 2 -> assert(last_sale_europe_message_read.jurisdiction[last_sale_europe_message_at] == last_sale_europe_message_written.jurisdiction[last_sale_europe_message_at]); last_sale_europe_message_at = last_sale_europe_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Last Sale Europe Message New: 239 bytes --------------------------------- */

/* Last Sale Europe Messages are sent when an order on a Cboe order book is executed in whole or in part, or when a reported trade is submitted to Cboe */
typedef LastSaleEuropeMessageNew {
  byte trading_date_time[27];
  byte symbol[12];
  byte price[18];
  byte price_notation[4];
  byte price_currency[3];
  byte executed_shares[12];
  byte notional_amount[18];
  byte notional_currency[3];
  byte execution_venue[4];
  byte third_country_trading_venue[4];
  byte publication_date_time[27];
  byte trade_id[12];
  byte transaction_to_be_cleared[5];
  byte market_mechanism[4];
  byte trading_mode[4];
  byte transaction_category[4];
  byte negotiation_flag[4];
  byte agency_cross_trade[4];
  byte modification_indicator[4];
  byte benchmark_indicator[4];
  byte special_dividend[4];
  byte off_book_automated[4];
  byte price_discovery_process[4];
  byte algorithmic_indicator[4];
  byte pre_trade_transparency_waiver[4];
  byte portfolio_flag[4];
  byte contingent_flag[4];
  byte give_up_flag[4];
  byte post_trade_deferral_reason[4];
  byte deferral_or_enrichment_type[4];
  byte deferral_illiquid_instrument[4];
  byte deferral_size_specific[4];
  byte duplicative_within_jurisdiction[4];
  byte duplicative_across_jurisdiction[4];
  byte intra_group_indicator[4];
  byte jurisdiction[2]
};

int last_sale_europe_message_new_at;

/* every byte of Last Sale Europe Message New set to one value */
inline fill_last_sale_europe_message_new(last_sale_europe_message_new_record, last_sale_europe_message_new_value) {
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 27 -> last_sale_europe_message_new_record.trading_date_time[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> last_sale_europe_message_new_record.symbol[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 18 -> last_sale_europe_message_new_record.price[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.price_notation[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 3 -> last_sale_europe_message_new_record.price_currency[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> last_sale_europe_message_new_record.executed_shares[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 18 -> last_sale_europe_message_new_record.notional_amount[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 3 -> last_sale_europe_message_new_record.notional_currency[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.execution_venue[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.third_country_trading_venue[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 27 -> last_sale_europe_message_new_record.publication_date_time[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> last_sale_europe_message_new_record.trade_id[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 5 -> last_sale_europe_message_new_record.transaction_to_be_cleared[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.market_mechanism[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.trading_mode[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.transaction_category[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.negotiation_flag[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.agency_cross_trade[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.modification_indicator[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.benchmark_indicator[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.special_dividend[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.off_book_automated[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.price_discovery_process[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.algorithmic_indicator[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.pre_trade_transparency_waiver[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.portfolio_flag[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.contingent_flag[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.give_up_flag[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.post_trade_deferral_reason[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.deferral_or_enrichment_type[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.deferral_illiquid_instrument[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.deferral_size_specific[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.duplicative_within_jurisdiction[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.duplicative_across_jurisdiction[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.intra_group_indicator[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 2 -> last_sale_europe_message_new_record.jurisdiction[last_sale_europe_message_new_at] = last_sale_europe_message_new_value; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Last Sale Europe Message New set to where it lies, so a field read out of place says so */
inline ramp_last_sale_europe_message_new(last_sale_europe_message_new_record, last_sale_europe_message_new_base) {
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 27 -> last_sale_europe_message_new_record.trading_date_time[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 0 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> last_sale_europe_message_new_record.symbol[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 27 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 18 -> last_sale_europe_message_new_record.price[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 39 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.price_notation[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 57 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 3 -> last_sale_europe_message_new_record.price_currency[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 61 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> last_sale_europe_message_new_record.executed_shares[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 64 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 18 -> last_sale_europe_message_new_record.notional_amount[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 76 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 3 -> last_sale_europe_message_new_record.notional_currency[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 94 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.execution_venue[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 97 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.third_country_trading_venue[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 101 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 27 -> last_sale_europe_message_new_record.publication_date_time[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 105 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> last_sale_europe_message_new_record.trade_id[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 132 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 5 -> last_sale_europe_message_new_record.transaction_to_be_cleared[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 144 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.market_mechanism[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 149 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.trading_mode[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 153 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.transaction_category[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 157 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.negotiation_flag[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 161 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.agency_cross_trade[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 165 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.modification_indicator[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 169 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.benchmark_indicator[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 173 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.special_dividend[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 177 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.off_book_automated[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 181 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.price_discovery_process[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 185 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.algorithmic_indicator[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 189 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.pre_trade_transparency_waiver[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 193 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.portfolio_flag[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 197 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.contingent_flag[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 201 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.give_up_flag[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 205 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.post_trade_deferral_reason[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 209 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.deferral_or_enrichment_type[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 213 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.deferral_illiquid_instrument[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 217 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.deferral_size_specific[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 221 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.duplicative_within_jurisdiction[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 225 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.duplicative_across_jurisdiction[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 229 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.intra_group_indicator[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 233 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 2 -> last_sale_europe_message_new_record.jurisdiction[last_sale_europe_message_new_at] = (last_sale_europe_message_new_base + 237 + last_sale_europe_message_new_at + 1) % 256; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  skip
}

/* Last Sale Europe Message New to the wire, 239 bytes from where the cursor stands */
inline encode_last_sale_europe_message_new(last_sale_europe_message_new_record) {
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 27 -> wire[at] = last_sale_europe_message_new_record.trading_date_time[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> wire[at] = last_sale_europe_message_new_record.symbol[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 18 -> wire[at] = last_sale_europe_message_new_record.price[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.price_notation[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 3 -> wire[at] = last_sale_europe_message_new_record.price_currency[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> wire[at] = last_sale_europe_message_new_record.executed_shares[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 18 -> wire[at] = last_sale_europe_message_new_record.notional_amount[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 3 -> wire[at] = last_sale_europe_message_new_record.notional_currency[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.execution_venue[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.third_country_trading_venue[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 27 -> wire[at] = last_sale_europe_message_new_record.publication_date_time[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> wire[at] = last_sale_europe_message_new_record.trade_id[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 5 -> wire[at] = last_sale_europe_message_new_record.transaction_to_be_cleared[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.market_mechanism[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.trading_mode[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.transaction_category[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.negotiation_flag[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.agency_cross_trade[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.modification_indicator[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.benchmark_indicator[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.special_dividend[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.off_book_automated[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.price_discovery_process[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.algorithmic_indicator[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.pre_trade_transparency_waiver[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.portfolio_flag[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.contingent_flag[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.give_up_flag[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.post_trade_deferral_reason[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.deferral_or_enrichment_type[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.deferral_illiquid_instrument[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.deferral_size_specific[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.duplicative_within_jurisdiction[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.duplicative_across_jurisdiction[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> wire[at] = last_sale_europe_message_new_record.intra_group_indicator[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 2 -> wire[at] = last_sale_europe_message_new_record.jurisdiction[last_sale_europe_message_new_at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  skip
}

/* Last Sale Europe Message New off the wire, 239 bytes from where the cursor stands */
inline decode_last_sale_europe_message_new(last_sale_europe_message_new_record) {
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 27 -> last_sale_europe_message_new_record.trading_date_time[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> last_sale_europe_message_new_record.symbol[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 18 -> last_sale_europe_message_new_record.price[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.price_notation[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 3 -> last_sale_europe_message_new_record.price_currency[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> last_sale_europe_message_new_record.executed_shares[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 18 -> last_sale_europe_message_new_record.notional_amount[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 3 -> last_sale_europe_message_new_record.notional_currency[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.execution_venue[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.third_country_trading_venue[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 27 -> last_sale_europe_message_new_record.publication_date_time[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> last_sale_europe_message_new_record.trade_id[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 5 -> last_sale_europe_message_new_record.transaction_to_be_cleared[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.market_mechanism[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.trading_mode[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.transaction_category[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.negotiation_flag[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.agency_cross_trade[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.modification_indicator[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.benchmark_indicator[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.special_dividend[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.off_book_automated[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.price_discovery_process[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.algorithmic_indicator[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.pre_trade_transparency_waiver[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.portfolio_flag[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.contingent_flag[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.give_up_flag[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.post_trade_deferral_reason[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.deferral_or_enrichment_type[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.deferral_illiquid_instrument[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.deferral_size_specific[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.duplicative_within_jurisdiction[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.duplicative_across_jurisdiction[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> last_sale_europe_message_new_record.intra_group_indicator[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 2 -> last_sale_europe_message_new_record.jurisdiction[last_sale_europe_message_new_at] = wire[at]; at = at + 1; last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Last Sale Europe Message New is what was written, byte for byte */
inline equal_last_sale_europe_message_new(last_sale_europe_message_new_read, last_sale_europe_message_new_written) {
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 27 -> assert(last_sale_europe_message_new_read.trading_date_time[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.trading_date_time[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> assert(last_sale_europe_message_new_read.symbol[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.symbol[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 18 -> assert(last_sale_europe_message_new_read.price[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.price[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.price_notation[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.price_notation[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 3 -> assert(last_sale_europe_message_new_read.price_currency[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.price_currency[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> assert(last_sale_europe_message_new_read.executed_shares[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.executed_shares[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 18 -> assert(last_sale_europe_message_new_read.notional_amount[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.notional_amount[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 3 -> assert(last_sale_europe_message_new_read.notional_currency[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.notional_currency[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.execution_venue[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.execution_venue[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.third_country_trading_venue[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.third_country_trading_venue[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 27 -> assert(last_sale_europe_message_new_read.publication_date_time[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.publication_date_time[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 12 -> assert(last_sale_europe_message_new_read.trade_id[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.trade_id[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 5 -> assert(last_sale_europe_message_new_read.transaction_to_be_cleared[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.transaction_to_be_cleared[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.market_mechanism[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.market_mechanism[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.trading_mode[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.trading_mode[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.transaction_category[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.transaction_category[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.negotiation_flag[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.negotiation_flag[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.agency_cross_trade[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.agency_cross_trade[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.modification_indicator[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.modification_indicator[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.benchmark_indicator[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.benchmark_indicator[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.special_dividend[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.special_dividend[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.off_book_automated[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.off_book_automated[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.price_discovery_process[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.price_discovery_process[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.algorithmic_indicator[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.algorithmic_indicator[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.pre_trade_transparency_waiver[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.pre_trade_transparency_waiver[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.portfolio_flag[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.portfolio_flag[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.contingent_flag[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.contingent_flag[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.give_up_flag[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.give_up_flag[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.post_trade_deferral_reason[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.post_trade_deferral_reason[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.deferral_or_enrichment_type[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.deferral_or_enrichment_type[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.deferral_illiquid_instrument[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.deferral_illiquid_instrument[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.deferral_size_specific[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.deferral_size_specific[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.duplicative_within_jurisdiction[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.duplicative_within_jurisdiction[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.duplicative_across_jurisdiction[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.duplicative_across_jurisdiction[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 4 -> assert(last_sale_europe_message_new_read.intra_group_indicator[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.intra_group_indicator[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  last_sale_europe_message_new_at = 0;
  do
  :: last_sale_europe_message_new_at < 2 -> assert(last_sale_europe_message_new_read.jurisdiction[last_sale_europe_message_new_at] == last_sale_europe_message_new_written.jurisdiction[last_sale_europe_message_new_at]); last_sale_europe_message_new_at = last_sale_europe_message_new_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Request Packet: 36 bytes ------------------------------------------ */

/* The Soup 2.0 client must send a Login Request Packet immediately upon establishing a new TCP/IP socket connection to the server. */
typedef LoginRequestPacket {
  byte username[6];
  byte password[10];
  byte requested_session[10];
  byte requested_sequence_number[10]
};

int login_request_packet_at;

/* every byte of Login Request Packet set to one value */
inline fill_login_request_packet(login_request_packet_record, login_request_packet_value) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> login_request_packet_record.username[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.password[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_session[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_sequence_number[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request Packet set to where it lies, so a field read out of place says so */
inline ramp_login_request_packet(login_request_packet_record, login_request_packet_base) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> login_request_packet_record.username[login_request_packet_at] = (login_request_packet_base + 0 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.password[login_request_packet_at] = (login_request_packet_base + 6 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_session[login_request_packet_at] = (login_request_packet_base + 16 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_sequence_number[login_request_packet_at] = (login_request_packet_base + 26 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Packet to the wire, 36 bytes from where the cursor stands */
inline encode_login_request_packet(login_request_packet_record) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> wire[at] = login_request_packet_record.username[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> wire[at] = login_request_packet_record.password[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> wire[at] = login_request_packet_record.requested_session[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> wire[at] = login_request_packet_record.requested_sequence_number[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Packet off the wire, 36 bytes from where the cursor stands */
inline decode_login_request_packet(login_request_packet_record) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> login_request_packet_record.username[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.password[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_session[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_sequence_number[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request Packet is what was written, byte for byte */
inline equal_login_request_packet(login_request_packet_read, login_request_packet_written) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> assert(login_request_packet_read.username[login_request_packet_at] == login_request_packet_written.username[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> assert(login_request_packet_read.password[login_request_packet_at] == login_request_packet_written.password[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> assert(login_request_packet_read.requested_session[login_request_packet_at] == login_request_packet_written.requested_session[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> assert(login_request_packet_read.requested_sequence_number[login_request_packet_at] == login_request_packet_written.requested_sequence_number[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Debug Packet: encoded, read back, and compared */
proctype check_debug_packet() {
  DebugPacket debug_packet_sent;
  DebugPacket debug_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_debug_packet(debug_packet_sent, 0)
  :: pattern == 1 -> fill_debug_packet(debug_packet_sent, 32)
  :: pattern == 2 -> fill_debug_packet(debug_packet_sent, 255)
  :: else -> ramp_debug_packet(debug_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_debug_packet(debug_packet_sent);
    assert(at == 1);
    at = 0;
    decode_debug_packet(debug_packet_got);
    assert(at == 1);
    equal_debug_packet(debug_packet_got, debug_packet_sent)
  }
}

/* Login Accepted Packet: encoded, read back, and compared */
proctype check_login_accepted_packet() {
  LoginAcceptedPacket login_accepted_packet_sent;
  LoginAcceptedPacket login_accepted_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_accepted_packet(login_accepted_packet_sent, 0)
  :: pattern == 1 -> fill_login_accepted_packet(login_accepted_packet_sent, 32)
  :: pattern == 2 -> fill_login_accepted_packet(login_accepted_packet_sent, 255)
  :: else -> ramp_login_accepted_packet(login_accepted_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_accepted_packet(login_accepted_packet_sent);
    assert(at == 20);
    at = 0;
    decode_login_accepted_packet(login_accepted_packet_got);
    assert(at == 20);
    equal_login_accepted_packet(login_accepted_packet_got, login_accepted_packet_sent)
  }
}

/* Login Rejected Packet: encoded, read back, and compared */
proctype check_login_rejected_packet() {
  LoginRejectedPacket login_rejected_packet_sent;
  LoginRejectedPacket login_rejected_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_rejected_packet(login_rejected_packet_sent, 0)
  :: pattern == 1 -> fill_login_rejected_packet(login_rejected_packet_sent, 32)
  :: pattern == 2 -> fill_login_rejected_packet(login_rejected_packet_sent, 255)
  :: else -> ramp_login_rejected_packet(login_rejected_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_rejected_packet(login_rejected_packet_sent);
    assert(at == 1);
    at = 0;
    decode_login_rejected_packet(login_rejected_packet_got);
    assert(at == 1);
    equal_login_rejected_packet(login_rejected_packet_got, login_rejected_packet_sent)
  }
}

/* Sequenced Message Header: encoded, read back, and compared */
proctype check_sequenced_message_header() {
  SequencedMessageHeader sequenced_message_header_sent;
  SequencedMessageHeader sequenced_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequenced_message_header(sequenced_message_header_sent, 0)
  :: pattern == 1 -> fill_sequenced_message_header(sequenced_message_header_sent, 32)
  :: pattern == 2 -> fill_sequenced_message_header(sequenced_message_header_sent, 255)
  :: else -> ramp_sequenced_message_header(sequenced_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequenced_message_header(sequenced_message_header_sent);
    assert(at == 9);
    at = 0;
    decode_sequenced_message_header(sequenced_message_header_got);
    assert(at == 9);
    equal_sequenced_message_header(sequenced_message_header_got, sequenced_message_header_sent)
  }
}

/* Last Sale Europe Message: encoded, read back, and compared */
proctype check_last_sale_europe_message() {
  LastSaleEuropeMessage last_sale_europe_message_sent;
  LastSaleEuropeMessage last_sale_europe_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_last_sale_europe_message(last_sale_europe_message_sent, 0)
  :: pattern == 1 -> fill_last_sale_europe_message(last_sale_europe_message_sent, 32)
  :: pattern == 2 -> fill_last_sale_europe_message(last_sale_europe_message_sent, 255)
  :: else -> ramp_last_sale_europe_message(last_sale_europe_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_last_sale_europe_message(last_sale_europe_message_sent);
    assert(at == 157);
    at = 0;
    decode_last_sale_europe_message(last_sale_europe_message_got);
    assert(at == 157);
    equal_last_sale_europe_message(last_sale_europe_message_got, last_sale_europe_message_sent)
  }
}

/* Last Sale Europe Message New: encoded, read back, and compared */
proctype check_last_sale_europe_message_new() {
  LastSaleEuropeMessageNew last_sale_europe_message_new_sent;
  LastSaleEuropeMessageNew last_sale_europe_message_new_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_last_sale_europe_message_new(last_sale_europe_message_new_sent, 0)
  :: pattern == 1 -> fill_last_sale_europe_message_new(last_sale_europe_message_new_sent, 32)
  :: pattern == 2 -> fill_last_sale_europe_message_new(last_sale_europe_message_new_sent, 255)
  :: else -> ramp_last_sale_europe_message_new(last_sale_europe_message_new_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_last_sale_europe_message_new(last_sale_europe_message_new_sent);
    assert(at == 239);
    at = 0;
    decode_last_sale_europe_message_new(last_sale_europe_message_new_got);
    assert(at == 239);
    equal_last_sale_europe_message_new(last_sale_europe_message_new_got, last_sale_europe_message_new_sent)
  }
}

/* Login Request Packet: encoded, read back, and compared */
proctype check_login_request_packet() {
  LoginRequestPacket login_request_packet_sent;
  LoginRequestPacket login_request_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_request_packet(login_request_packet_sent, 0)
  :: pattern == 1 -> fill_login_request_packet(login_request_packet_sent, 32)
  :: pattern == 2 -> fill_login_request_packet(login_request_packet_sent, 255)
  :: else -> ramp_login_request_packet(login_request_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_request_packet(login_request_packet_sent);
    assert(at == 36);
    at = 0;
    decode_login_request_packet(login_request_packet_got);
    assert(at == 36);
    equal_login_request_packet(login_request_packet_got, login_request_packet_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_debug_packet()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_sequenced_message_header()
  :: run check_last_sale_europe_message()
  :: run check_last_sale_europe_message_new()
  :: run check_login_request_packet()
  fi
}
