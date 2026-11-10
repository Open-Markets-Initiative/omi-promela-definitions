/*
 * Hong Kong Exchanges and Clearing Orion Market Data Derivatives Standard
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
 *   - a field filling what is left of what holds it
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 114

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* Omd packet header (byte 3 is Compression Mode indicator) */
typedef PacketHeader {
  byte pkt_size[2];
  byte msg_count;
  byte compression_mode;
  byte seq_num[4];
  byte send_time[8]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.msg_count = packet_header_value;
  packet_header_record.compression_mode = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.send_time[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.msg_count = (packet_header_base + 2 + 1) % 256;
  packet_header_record.compression_mode = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.send_time[packet_header_at] = (packet_header_base + 8 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.pkt_size[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.msg_count; at = at + 1;
  wire[at] = packet_header_record.compression_mode; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.seq_num[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.send_time[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.msg_count = wire[at]; at = at + 1;
  packet_header_record.compression_mode = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.send_time[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.pkt_size[packet_header_at] == packet_header_written.pkt_size[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.msg_count == packet_header_written.msg_count);
  assert(packet_header_read.compression_mode == packet_header_written.compression_mode);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.seq_num[packet_header_at] == packet_header_written.seq_num[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.send_time[packet_header_at] == packet_header_written.send_time[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Msg Header: 4 bytes ----------------------------------------------------- */

/* Omd message header */
typedef MsgHeader {
  byte msg_size[2];
  byte msg_type[2]
};

int msg_header_at;

/* every byte of Msg Header set to one value */
inline fill_msg_header(msg_header_record, msg_header_value) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_size[msg_header_at] = msg_header_value; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = msg_header_value; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Msg Header set to where it lies, so a field read out of place says so */
inline ramp_msg_header(msg_header_record, msg_header_base) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_size[msg_header_at] = (msg_header_base + 0 + msg_header_at + 1) % 256; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = (msg_header_base + 2 + msg_header_at + 1) % 256; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Msg Header to the wire, 4 bytes from where the cursor stands */
inline encode_msg_header(msg_header_record) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> wire[at] = msg_header_record.msg_size[msg_header_at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> wire[at] = msg_header_record.msg_type[msg_header_at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Msg Header off the wire, 4 bytes from where the cursor stands */
inline decode_msg_header(msg_header_record) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_size[msg_header_at] = wire[at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = wire[at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Msg Header is what was written, byte for byte */
inline equal_msg_header(msg_header_read, msg_header_written) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> assert(msg_header_read.msg_size[msg_header_at] == msg_header_written.msg_size[msg_header_at]); msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> assert(msg_header_read.msg_type[msg_header_at] == msg_header_written.msg_type[msg_header_at]); msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Calculated Opening Price Message: 20 bytes ------------------------------ */

/* The Calculated Opening Price (COP) message indicates an instrument's theoretical opening price during the pre-opening phases of the market prior to an auction */
typedef CalculatedOpeningPriceMessage {
  byte orderbook_id[4];
  byte calculated_opening_price[4];
  byte filler_4[4];
  byte quantity[8]
};

int calculated_opening_price_message_at;

/* every byte of Calculated Opening Price Message set to one value */
inline fill_calculated_opening_price_message(calculated_opening_price_message_record, calculated_opening_price_message_value) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.orderbook_id[calculated_opening_price_message_at] = calculated_opening_price_message_value; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.calculated_opening_price[calculated_opening_price_message_at] = calculated_opening_price_message_value; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.filler_4[calculated_opening_price_message_at] = calculated_opening_price_message_value; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> calculated_opening_price_message_record.quantity[calculated_opening_price_message_at] = calculated_opening_price_message_value; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Calculated Opening Price Message set to where it lies, so a field read out of place says so */
inline ramp_calculated_opening_price_message(calculated_opening_price_message_record, calculated_opening_price_message_base) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.orderbook_id[calculated_opening_price_message_at] = (calculated_opening_price_message_base + 0 + calculated_opening_price_message_at + 1) % 256; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.calculated_opening_price[calculated_opening_price_message_at] = (calculated_opening_price_message_base + 4 + calculated_opening_price_message_at + 1) % 256; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.filler_4[calculated_opening_price_message_at] = (calculated_opening_price_message_base + 8 + calculated_opening_price_message_at + 1) % 256; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> calculated_opening_price_message_record.quantity[calculated_opening_price_message_at] = (calculated_opening_price_message_base + 12 + calculated_opening_price_message_at + 1) % 256; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Calculated Opening Price Message to the wire, 20 bytes from where the cursor stands */
inline encode_calculated_opening_price_message(calculated_opening_price_message_record) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> wire[at] = calculated_opening_price_message_record.orderbook_id[calculated_opening_price_message_at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> wire[at] = calculated_opening_price_message_record.calculated_opening_price[calculated_opening_price_message_at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> wire[at] = calculated_opening_price_message_record.filler_4[calculated_opening_price_message_at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> wire[at] = calculated_opening_price_message_record.quantity[calculated_opening_price_message_at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Calculated Opening Price Message off the wire, 20 bytes from where the cursor stands */
inline decode_calculated_opening_price_message(calculated_opening_price_message_record) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.orderbook_id[calculated_opening_price_message_at] = wire[at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.calculated_opening_price[calculated_opening_price_message_at] = wire[at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> calculated_opening_price_message_record.filler_4[calculated_opening_price_message_at] = wire[at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> calculated_opening_price_message_record.quantity[calculated_opening_price_message_at] = wire[at]; at = at + 1; calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Calculated Opening Price Message is what was written, byte for byte */
inline equal_calculated_opening_price_message(calculated_opening_price_message_read, calculated_opening_price_message_written) {
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> assert(calculated_opening_price_message_read.orderbook_id[calculated_opening_price_message_at] == calculated_opening_price_message_written.orderbook_id[calculated_opening_price_message_at]); calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> assert(calculated_opening_price_message_read.calculated_opening_price[calculated_opening_price_message_at] == calculated_opening_price_message_written.calculated_opening_price[calculated_opening_price_message_at]); calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 4 -> assert(calculated_opening_price_message_read.filler_4[calculated_opening_price_message_at] == calculated_opening_price_message_written.filler_4[calculated_opening_price_message_at]); calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  calculated_opening_price_message_at = 0;
  do
  :: calculated_opening_price_message_at < 8 -> assert(calculated_opening_price_message_read.quantity[calculated_opening_price_message_at] == calculated_opening_price_message_written.quantity[calculated_opening_price_message_at]); calculated_opening_price_message_at = calculated_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Reset: 4 bytes ------------------------------------------------- */

/* The Sequence Reset message is sent on each multicast channel at start of day */
typedef SequenceReset {
  byte new_seq_no[4]
};

int sequence_reset_at;

/* every byte of Sequence Reset set to one value */
inline fill_sequence_reset(sequence_reset_record, sequence_reset_value) {
  sequence_reset_at = 0;
  do
  :: sequence_reset_at < 4 -> sequence_reset_record.new_seq_no[sequence_reset_at] = sequence_reset_value; sequence_reset_at = sequence_reset_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Reset set to where it lies, so a field read out of place says so */
inline ramp_sequence_reset(sequence_reset_record, sequence_reset_base) {
  sequence_reset_at = 0;
  do
  :: sequence_reset_at < 4 -> sequence_reset_record.new_seq_no[sequence_reset_at] = (sequence_reset_base + 0 + sequence_reset_at + 1) % 256; sequence_reset_at = sequence_reset_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Reset to the wire, 4 bytes from where the cursor stands */
inline encode_sequence_reset(sequence_reset_record) {
  sequence_reset_at = 0;
  do
  :: sequence_reset_at < 4 -> wire[at] = sequence_reset_record.new_seq_no[sequence_reset_at]; at = at + 1; sequence_reset_at = sequence_reset_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Reset off the wire, 4 bytes from where the cursor stands */
inline decode_sequence_reset(sequence_reset_record) {
  sequence_reset_at = 0;
  do
  :: sequence_reset_at < 4 -> sequence_reset_record.new_seq_no[sequence_reset_at] = wire[at]; at = at + 1; sequence_reset_at = sequence_reset_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Reset is what was written, byte for byte */
inline equal_sequence_reset(sequence_reset_read, sequence_reset_written) {
  sequence_reset_at = 0;
  do
  :: sequence_reset_at < 4 -> assert(sequence_reset_read.new_seq_no[sequence_reset_at] == sequence_reset_written.new_seq_no[sequence_reset_at]); sequence_reset_at = sequence_reset_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Disaster Recovery Signal Message: 4 bytes ------------------------------- */

/* The Disaster Recovery Signal message is sent on a dedicated multicast channel whenever a site failover scenario is triggered */
typedef DisasterRecoverySignalMessage {
  byte dr_status[4]
};

int disaster_recovery_signal_message_at;

/* every byte of Disaster Recovery Signal Message set to one value */
inline fill_disaster_recovery_signal_message(disaster_recovery_signal_message_record, disaster_recovery_signal_message_value) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> disaster_recovery_signal_message_record.dr_status[disaster_recovery_signal_message_at] = disaster_recovery_signal_message_value; disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Disaster Recovery Signal Message set to where it lies, so a field read out of place says so */
inline ramp_disaster_recovery_signal_message(disaster_recovery_signal_message_record, disaster_recovery_signal_message_base) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> disaster_recovery_signal_message_record.dr_status[disaster_recovery_signal_message_at] = (disaster_recovery_signal_message_base + 0 + disaster_recovery_signal_message_at + 1) % 256; disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* Disaster Recovery Signal Message to the wire, 4 bytes from where the cursor stands */
inline encode_disaster_recovery_signal_message(disaster_recovery_signal_message_record) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> wire[at] = disaster_recovery_signal_message_record.dr_status[disaster_recovery_signal_message_at]; at = at + 1; disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* Disaster Recovery Signal Message off the wire, 4 bytes from where the cursor stands */
inline decode_disaster_recovery_signal_message(disaster_recovery_signal_message_record) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> disaster_recovery_signal_message_record.dr_status[disaster_recovery_signal_message_at] = wire[at]; at = at + 1; disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Disaster Recovery Signal Message is what was written, byte for byte */
inline equal_disaster_recovery_signal_message(disaster_recovery_signal_message_read, disaster_recovery_signal_message_written) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> assert(disaster_recovery_signal_message_read.dr_status[disaster_recovery_signal_message_at] == disaster_recovery_signal_message_written.dr_status[disaster_recovery_signal_message_at]); disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Open Interest Message: 36 bytes ----------------------------------------- */

/* Issued to show the Previous Day settlement price and open interest */
typedef OpenInterestMessage {
  byte day_indicator[2];
  byte filler_6[6];
  byte orderbook_id[4];
  byte settlement[4];
  byte deal_count[4];
  byte gross_oi[4];
  byte net_oi[4];
  byte turnover[8]
};

int open_interest_message_at;

/* every byte of Open Interest Message set to one value */
inline fill_open_interest_message(open_interest_message_record, open_interest_message_value) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> open_interest_message_record.day_indicator[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> open_interest_message_record.filler_6[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.orderbook_id[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.settlement[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.deal_count[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.gross_oi[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.net_oi[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.turnover[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_open_interest_message(open_interest_message_record, open_interest_message_base) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> open_interest_message_record.day_indicator[open_interest_message_at] = (open_interest_message_base + 0 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> open_interest_message_record.filler_6[open_interest_message_at] = (open_interest_message_base + 2 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.orderbook_id[open_interest_message_at] = (open_interest_message_base + 8 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.settlement[open_interest_message_at] = (open_interest_message_base + 12 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.deal_count[open_interest_message_at] = (open_interest_message_base + 16 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.gross_oi[open_interest_message_at] = (open_interest_message_base + 20 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.net_oi[open_interest_message_at] = (open_interest_message_base + 24 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.turnover[open_interest_message_at] = (open_interest_message_base + 28 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message to the wire, 36 bytes from where the cursor stands */
inline encode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> wire[at] = open_interest_message_record.day_indicator[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> wire[at] = open_interest_message_record.filler_6[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.orderbook_id[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.settlement[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.deal_count[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.gross_oi[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.net_oi[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> wire[at] = open_interest_message_record.turnover[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message off the wire, 36 bytes from where the cursor stands */
inline decode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> open_interest_message_record.day_indicator[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> open_interest_message_record.filler_6[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.orderbook_id[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.settlement[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.deal_count[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.gross_oi[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.net_oi[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.turnover[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open Interest Message is what was written, byte for byte */
inline equal_open_interest_message(open_interest_message_read, open_interest_message_written) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> assert(open_interest_message_read.day_indicator[open_interest_message_at] == open_interest_message_written.day_indicator[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> assert(open_interest_message_read.filler_6[open_interest_message_at] == open_interest_message_written.filler_6[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.orderbook_id[open_interest_message_at] == open_interest_message_written.orderbook_id[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.settlement[open_interest_message_at] == open_interest_message_written.settlement[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.deal_count[open_interest_message_at] == open_interest_message_written.deal_count[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.gross_oi[open_interest_message_at] == open_interest_message_written.gross_oi[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.net_oi[open_interest_message_at] == open_interest_message_written.net_oi[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> assert(open_interest_message_read.turnover[open_interest_message_at] == open_interest_message_written.turnover[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Request: 12 bytes ------------------------------------------------- */

/* The Quote Request message is generated whenever market participants request a new quotation */
typedef QuoteRequest {
  byte orderbook_id[4];
  byte number_of_lots[4];
  byte bid_ask_flag;
  byte filler_3[3]
};

int quote_request_at;

/* every byte of Quote Request set to one value */
inline fill_quote_request(quote_request_record, quote_request_value) {
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.orderbook_id[quote_request_at] = quote_request_value; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.number_of_lots[quote_request_at] = quote_request_value; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_record.bid_ask_flag = quote_request_value;
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> quote_request_record.filler_3[quote_request_at] = quote_request_value; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Request set to where it lies, so a field read out of place says so */
inline ramp_quote_request(quote_request_record, quote_request_base) {
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.orderbook_id[quote_request_at] = (quote_request_base + 0 + quote_request_at + 1) % 256; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.number_of_lots[quote_request_at] = (quote_request_base + 4 + quote_request_at + 1) % 256; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_record.bid_ask_flag = (quote_request_base + 8 + 1) % 256;
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> quote_request_record.filler_3[quote_request_at] = (quote_request_base + 9 + quote_request_at + 1) % 256; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request to the wire, 12 bytes from where the cursor stands */
inline encode_quote_request(quote_request_record) {
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> wire[at] = quote_request_record.orderbook_id[quote_request_at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> wire[at] = quote_request_record.number_of_lots[quote_request_at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  wire[at] = quote_request_record.bid_ask_flag; at = at + 1;
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> wire[at] = quote_request_record.filler_3[quote_request_at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request off the wire, 12 bytes from where the cursor stands */
inline decode_quote_request(quote_request_record) {
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.orderbook_id[quote_request_at] = wire[at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> quote_request_record.number_of_lots[quote_request_at] = wire[at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_record.bid_ask_flag = wire[at]; at = at + 1;
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> quote_request_record.filler_3[quote_request_at] = wire[at]; at = at + 1; quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Request is what was written, byte for byte */
inline equal_quote_request(quote_request_read, quote_request_written) {
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> assert(quote_request_read.orderbook_id[quote_request_at] == quote_request_written.orderbook_id[quote_request_at]); quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  quote_request_at = 0;
  do
  :: quote_request_at < 4 -> assert(quote_request_read.number_of_lots[quote_request_at] == quote_request_written.number_of_lots[quote_request_at]); quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  assert(quote_request_read.bid_ask_flag == quote_request_written.bid_ask_flag);
  quote_request_at = 0;
  do
  :: quote_request_at < 3 -> assert(quote_request_read.filler_3[quote_request_at] == quote_request_written.filler_3[quote_request_at]); quote_request_at = quote_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Commodity Definition Message: 90 bytes ---------------------------------- */

/* Describes individual commodities available from the OMD-D system */
typedef CommodityDefinitionMessage {
  byte commodity_code[2];
  byte decimal_in_underlying_price[2];
  byte isin_code[12];
  byte base_currency[3];
  byte underlying_price_unit;
  byte commodity_name[32];
  byte nominal_value[8];
  byte underlying_code[20];
  byte underlying_type;
  byte effective_tomorrow;
  byte commodity_id[6];
  byte filler_2[2]
};

int commodity_definition_message_at;

/* every byte of Commodity Definition Message set to one value */
inline fill_commodity_definition_message(commodity_definition_message_record, commodity_definition_message_value) {
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> commodity_definition_message_record.commodity_code[commodity_definition_message_at] = commodity_definition_message_value; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> commodity_definition_message_record.decimal_in_underlying_price[commodity_definition_message_at] = commodity_definition_message_value; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 12 -> commodity_definition_message_record.isin_code[commodity_definition_message_at] = commodity_definition_message_value; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 3 -> commodity_definition_message_record.base_currency[commodity_definition_message_at] = commodity_definition_message_value; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_record.underlying_price_unit = commodity_definition_message_value;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 32 -> commodity_definition_message_record.commodity_name[commodity_definition_message_at] = commodity_definition_message_value; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 8 -> commodity_definition_message_record.nominal_value[commodity_definition_message_at] = commodity_definition_message_value; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 20 -> commodity_definition_message_record.underlying_code[commodity_definition_message_at] = commodity_definition_message_value; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_record.underlying_type = commodity_definition_message_value;
  commodity_definition_message_record.effective_tomorrow = commodity_definition_message_value;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 6 -> commodity_definition_message_record.commodity_id[commodity_definition_message_at] = commodity_definition_message_value; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> commodity_definition_message_record.filler_2[commodity_definition_message_at] = commodity_definition_message_value; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Commodity Definition Message set to where it lies, so a field read out of place says so */
inline ramp_commodity_definition_message(commodity_definition_message_record, commodity_definition_message_base) {
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> commodity_definition_message_record.commodity_code[commodity_definition_message_at] = (commodity_definition_message_base + 0 + commodity_definition_message_at + 1) % 256; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> commodity_definition_message_record.decimal_in_underlying_price[commodity_definition_message_at] = (commodity_definition_message_base + 2 + commodity_definition_message_at + 1) % 256; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 12 -> commodity_definition_message_record.isin_code[commodity_definition_message_at] = (commodity_definition_message_base + 4 + commodity_definition_message_at + 1) % 256; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 3 -> commodity_definition_message_record.base_currency[commodity_definition_message_at] = (commodity_definition_message_base + 16 + commodity_definition_message_at + 1) % 256; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_record.underlying_price_unit = (commodity_definition_message_base + 19 + 1) % 256;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 32 -> commodity_definition_message_record.commodity_name[commodity_definition_message_at] = (commodity_definition_message_base + 20 + commodity_definition_message_at + 1) % 256; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 8 -> commodity_definition_message_record.nominal_value[commodity_definition_message_at] = (commodity_definition_message_base + 52 + commodity_definition_message_at + 1) % 256; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 20 -> commodity_definition_message_record.underlying_code[commodity_definition_message_at] = (commodity_definition_message_base + 60 + commodity_definition_message_at + 1) % 256; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_record.underlying_type = (commodity_definition_message_base + 80 + 1) % 256;
  commodity_definition_message_record.effective_tomorrow = (commodity_definition_message_base + 81 + 1) % 256;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 6 -> commodity_definition_message_record.commodity_id[commodity_definition_message_at] = (commodity_definition_message_base + 82 + commodity_definition_message_at + 1) % 256; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> commodity_definition_message_record.filler_2[commodity_definition_message_at] = (commodity_definition_message_base + 88 + commodity_definition_message_at + 1) % 256; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Commodity Definition Message to the wire, 90 bytes from where the cursor stands */
inline encode_commodity_definition_message(commodity_definition_message_record) {
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> wire[at] = commodity_definition_message_record.commodity_code[commodity_definition_message_at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> wire[at] = commodity_definition_message_record.decimal_in_underlying_price[commodity_definition_message_at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 12 -> wire[at] = commodity_definition_message_record.isin_code[commodity_definition_message_at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 3 -> wire[at] = commodity_definition_message_record.base_currency[commodity_definition_message_at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = commodity_definition_message_record.underlying_price_unit; at = at + 1;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 32 -> wire[at] = commodity_definition_message_record.commodity_name[commodity_definition_message_at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 8 -> wire[at] = commodity_definition_message_record.nominal_value[commodity_definition_message_at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 20 -> wire[at] = commodity_definition_message_record.underlying_code[commodity_definition_message_at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = commodity_definition_message_record.underlying_type; at = at + 1;
  wire[at] = commodity_definition_message_record.effective_tomorrow; at = at + 1;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 6 -> wire[at] = commodity_definition_message_record.commodity_id[commodity_definition_message_at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> wire[at] = commodity_definition_message_record.filler_2[commodity_definition_message_at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Commodity Definition Message off the wire, 90 bytes from where the cursor stands */
inline decode_commodity_definition_message(commodity_definition_message_record) {
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> commodity_definition_message_record.commodity_code[commodity_definition_message_at] = wire[at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> commodity_definition_message_record.decimal_in_underlying_price[commodity_definition_message_at] = wire[at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 12 -> commodity_definition_message_record.isin_code[commodity_definition_message_at] = wire[at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 3 -> commodity_definition_message_record.base_currency[commodity_definition_message_at] = wire[at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_record.underlying_price_unit = wire[at]; at = at + 1;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 32 -> commodity_definition_message_record.commodity_name[commodity_definition_message_at] = wire[at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 8 -> commodity_definition_message_record.nominal_value[commodity_definition_message_at] = wire[at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 20 -> commodity_definition_message_record.underlying_code[commodity_definition_message_at] = wire[at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_record.underlying_type = wire[at]; at = at + 1;
  commodity_definition_message_record.effective_tomorrow = wire[at]; at = at + 1;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 6 -> commodity_definition_message_record.commodity_id[commodity_definition_message_at] = wire[at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> commodity_definition_message_record.filler_2[commodity_definition_message_at] = wire[at]; at = at + 1; commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Commodity Definition Message is what was written, byte for byte */
inline equal_commodity_definition_message(commodity_definition_message_read, commodity_definition_message_written) {
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> assert(commodity_definition_message_read.commodity_code[commodity_definition_message_at] == commodity_definition_message_written.commodity_code[commodity_definition_message_at]); commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> assert(commodity_definition_message_read.decimal_in_underlying_price[commodity_definition_message_at] == commodity_definition_message_written.decimal_in_underlying_price[commodity_definition_message_at]); commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 12 -> assert(commodity_definition_message_read.isin_code[commodity_definition_message_at] == commodity_definition_message_written.isin_code[commodity_definition_message_at]); commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 3 -> assert(commodity_definition_message_read.base_currency[commodity_definition_message_at] == commodity_definition_message_written.base_currency[commodity_definition_message_at]); commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  assert(commodity_definition_message_read.underlying_price_unit == commodity_definition_message_written.underlying_price_unit);
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 32 -> assert(commodity_definition_message_read.commodity_name[commodity_definition_message_at] == commodity_definition_message_written.commodity_name[commodity_definition_message_at]); commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 8 -> assert(commodity_definition_message_read.nominal_value[commodity_definition_message_at] == commodity_definition_message_written.nominal_value[commodity_definition_message_at]); commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 20 -> assert(commodity_definition_message_read.underlying_code[commodity_definition_message_at] == commodity_definition_message_written.underlying_code[commodity_definition_message_at]); commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  assert(commodity_definition_message_read.underlying_type == commodity_definition_message_written.underlying_type);
  assert(commodity_definition_message_read.effective_tomorrow == commodity_definition_message_written.effective_tomorrow);
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 6 -> assert(commodity_definition_message_read.commodity_id[commodity_definition_message_at] == commodity_definition_message_written.commodity_id[commodity_definition_message_at]); commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  commodity_definition_message_at = 0;
  do
  :: commodity_definition_message_at < 2 -> assert(commodity_definition_message_read.filler_2[commodity_definition_message_at] == commodity_definition_message_written.filler_2[commodity_definition_message_at]); commodity_definition_message_at = commodity_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Class Definition Message: 114 bytes ------------------------------------- */

/* Describes individual instrument classes available from the OMD-D system */
typedef ClassDefinitionMessage {
  byte country;
  byte market;
  byte instrument_group;
  byte modifier;
  byte commodity_code[2];
  byte filler_2[2];
  byte price_quotation_factor[4];
  byte contract_size[4];
  byte decimal_in_strike_price[2];
  byte decimal_in_contract_size[2];
  byte decimal_in_premium[2];
  byte ranking_type[2];
  byte tradable;
  byte premium_unit_4_price;
  byte base_currency[3];
  byte instrument_class_id[14];
  byte instrument_class_name[32];
  byte is_fractions;
  byte settlement_currency_id[32];
  byte effective_tomorrow;
  byte tick_step_size[4];
  byte filler_1
};

int class_definition_message_at;

/* every byte of Class Definition Message set to one value */
inline fill_class_definition_message(class_definition_message_record, class_definition_message_value) {
  class_definition_message_record.country = class_definition_message_value;
  class_definition_message_record.market = class_definition_message_value;
  class_definition_message_record.instrument_group = class_definition_message_value;
  class_definition_message_record.modifier = class_definition_message_value;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.commodity_code[class_definition_message_at] = class_definition_message_value; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.filler_2[class_definition_message_at] = class_definition_message_value; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> class_definition_message_record.price_quotation_factor[class_definition_message_at] = class_definition_message_value; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> class_definition_message_record.contract_size[class_definition_message_at] = class_definition_message_value; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.decimal_in_strike_price[class_definition_message_at] = class_definition_message_value; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.decimal_in_contract_size[class_definition_message_at] = class_definition_message_value; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.decimal_in_premium[class_definition_message_at] = class_definition_message_value; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.ranking_type[class_definition_message_at] = class_definition_message_value; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_record.tradable = class_definition_message_value;
  class_definition_message_record.premium_unit_4_price = class_definition_message_value;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 3 -> class_definition_message_record.base_currency[class_definition_message_at] = class_definition_message_value; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 14 -> class_definition_message_record.instrument_class_id[class_definition_message_at] = class_definition_message_value; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 32 -> class_definition_message_record.instrument_class_name[class_definition_message_at] = class_definition_message_value; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_record.is_fractions = class_definition_message_value;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 32 -> class_definition_message_record.settlement_currency_id[class_definition_message_at] = class_definition_message_value; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_record.effective_tomorrow = class_definition_message_value;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> class_definition_message_record.tick_step_size[class_definition_message_at] = class_definition_message_value; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_record.filler_1 = class_definition_message_value;
  skip
}

/* each byte of Class Definition Message set to where it lies, so a field read out of place says so */
inline ramp_class_definition_message(class_definition_message_record, class_definition_message_base) {
  class_definition_message_record.country = (class_definition_message_base + 0 + 1) % 256;
  class_definition_message_record.market = (class_definition_message_base + 1 + 1) % 256;
  class_definition_message_record.instrument_group = (class_definition_message_base + 2 + 1) % 256;
  class_definition_message_record.modifier = (class_definition_message_base + 3 + 1) % 256;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.commodity_code[class_definition_message_at] = (class_definition_message_base + 4 + class_definition_message_at + 1) % 256; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.filler_2[class_definition_message_at] = (class_definition_message_base + 6 + class_definition_message_at + 1) % 256; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> class_definition_message_record.price_quotation_factor[class_definition_message_at] = (class_definition_message_base + 8 + class_definition_message_at + 1) % 256; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> class_definition_message_record.contract_size[class_definition_message_at] = (class_definition_message_base + 12 + class_definition_message_at + 1) % 256; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.decimal_in_strike_price[class_definition_message_at] = (class_definition_message_base + 16 + class_definition_message_at + 1) % 256; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.decimal_in_contract_size[class_definition_message_at] = (class_definition_message_base + 18 + class_definition_message_at + 1) % 256; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.decimal_in_premium[class_definition_message_at] = (class_definition_message_base + 20 + class_definition_message_at + 1) % 256; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.ranking_type[class_definition_message_at] = (class_definition_message_base + 22 + class_definition_message_at + 1) % 256; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_record.tradable = (class_definition_message_base + 24 + 1) % 256;
  class_definition_message_record.premium_unit_4_price = (class_definition_message_base + 25 + 1) % 256;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 3 -> class_definition_message_record.base_currency[class_definition_message_at] = (class_definition_message_base + 26 + class_definition_message_at + 1) % 256; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 14 -> class_definition_message_record.instrument_class_id[class_definition_message_at] = (class_definition_message_base + 29 + class_definition_message_at + 1) % 256; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 32 -> class_definition_message_record.instrument_class_name[class_definition_message_at] = (class_definition_message_base + 43 + class_definition_message_at + 1) % 256; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_record.is_fractions = (class_definition_message_base + 75 + 1) % 256;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 32 -> class_definition_message_record.settlement_currency_id[class_definition_message_at] = (class_definition_message_base + 76 + class_definition_message_at + 1) % 256; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_record.effective_tomorrow = (class_definition_message_base + 108 + 1) % 256;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> class_definition_message_record.tick_step_size[class_definition_message_at] = (class_definition_message_base + 109 + class_definition_message_at + 1) % 256; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_record.filler_1 = (class_definition_message_base + 113 + 1) % 256;
  skip
}

/* Class Definition Message to the wire, 114 bytes from where the cursor stands */
inline encode_class_definition_message(class_definition_message_record) {
  wire[at] = class_definition_message_record.country; at = at + 1;
  wire[at] = class_definition_message_record.market; at = at + 1;
  wire[at] = class_definition_message_record.instrument_group; at = at + 1;
  wire[at] = class_definition_message_record.modifier; at = at + 1;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> wire[at] = class_definition_message_record.commodity_code[class_definition_message_at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> wire[at] = class_definition_message_record.filler_2[class_definition_message_at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> wire[at] = class_definition_message_record.price_quotation_factor[class_definition_message_at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> wire[at] = class_definition_message_record.contract_size[class_definition_message_at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> wire[at] = class_definition_message_record.decimal_in_strike_price[class_definition_message_at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> wire[at] = class_definition_message_record.decimal_in_contract_size[class_definition_message_at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> wire[at] = class_definition_message_record.decimal_in_premium[class_definition_message_at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> wire[at] = class_definition_message_record.ranking_type[class_definition_message_at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = class_definition_message_record.tradable; at = at + 1;
  wire[at] = class_definition_message_record.premium_unit_4_price; at = at + 1;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 3 -> wire[at] = class_definition_message_record.base_currency[class_definition_message_at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 14 -> wire[at] = class_definition_message_record.instrument_class_id[class_definition_message_at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 32 -> wire[at] = class_definition_message_record.instrument_class_name[class_definition_message_at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = class_definition_message_record.is_fractions; at = at + 1;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 32 -> wire[at] = class_definition_message_record.settlement_currency_id[class_definition_message_at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = class_definition_message_record.effective_tomorrow; at = at + 1;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> wire[at] = class_definition_message_record.tick_step_size[class_definition_message_at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = class_definition_message_record.filler_1; at = at + 1;
  skip
}

/* Class Definition Message off the wire, 114 bytes from where the cursor stands */
inline decode_class_definition_message(class_definition_message_record) {
  class_definition_message_record.country = wire[at]; at = at + 1;
  class_definition_message_record.market = wire[at]; at = at + 1;
  class_definition_message_record.instrument_group = wire[at]; at = at + 1;
  class_definition_message_record.modifier = wire[at]; at = at + 1;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.commodity_code[class_definition_message_at] = wire[at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.filler_2[class_definition_message_at] = wire[at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> class_definition_message_record.price_quotation_factor[class_definition_message_at] = wire[at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> class_definition_message_record.contract_size[class_definition_message_at] = wire[at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.decimal_in_strike_price[class_definition_message_at] = wire[at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.decimal_in_contract_size[class_definition_message_at] = wire[at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.decimal_in_premium[class_definition_message_at] = wire[at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> class_definition_message_record.ranking_type[class_definition_message_at] = wire[at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_record.tradable = wire[at]; at = at + 1;
  class_definition_message_record.premium_unit_4_price = wire[at]; at = at + 1;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 3 -> class_definition_message_record.base_currency[class_definition_message_at] = wire[at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 14 -> class_definition_message_record.instrument_class_id[class_definition_message_at] = wire[at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 32 -> class_definition_message_record.instrument_class_name[class_definition_message_at] = wire[at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_record.is_fractions = wire[at]; at = at + 1;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 32 -> class_definition_message_record.settlement_currency_id[class_definition_message_at] = wire[at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_record.effective_tomorrow = wire[at]; at = at + 1;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> class_definition_message_record.tick_step_size[class_definition_message_at] = wire[at]; at = at + 1; class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_record.filler_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Class Definition Message is what was written, byte for byte */
inline equal_class_definition_message(class_definition_message_read, class_definition_message_written) {
  assert(class_definition_message_read.country == class_definition_message_written.country);
  assert(class_definition_message_read.market == class_definition_message_written.market);
  assert(class_definition_message_read.instrument_group == class_definition_message_written.instrument_group);
  assert(class_definition_message_read.modifier == class_definition_message_written.modifier);
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> assert(class_definition_message_read.commodity_code[class_definition_message_at] == class_definition_message_written.commodity_code[class_definition_message_at]); class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> assert(class_definition_message_read.filler_2[class_definition_message_at] == class_definition_message_written.filler_2[class_definition_message_at]); class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> assert(class_definition_message_read.price_quotation_factor[class_definition_message_at] == class_definition_message_written.price_quotation_factor[class_definition_message_at]); class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> assert(class_definition_message_read.contract_size[class_definition_message_at] == class_definition_message_written.contract_size[class_definition_message_at]); class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> assert(class_definition_message_read.decimal_in_strike_price[class_definition_message_at] == class_definition_message_written.decimal_in_strike_price[class_definition_message_at]); class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> assert(class_definition_message_read.decimal_in_contract_size[class_definition_message_at] == class_definition_message_written.decimal_in_contract_size[class_definition_message_at]); class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> assert(class_definition_message_read.decimal_in_premium[class_definition_message_at] == class_definition_message_written.decimal_in_premium[class_definition_message_at]); class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 2 -> assert(class_definition_message_read.ranking_type[class_definition_message_at] == class_definition_message_written.ranking_type[class_definition_message_at]); class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  assert(class_definition_message_read.tradable == class_definition_message_written.tradable);
  assert(class_definition_message_read.premium_unit_4_price == class_definition_message_written.premium_unit_4_price);
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 3 -> assert(class_definition_message_read.base_currency[class_definition_message_at] == class_definition_message_written.base_currency[class_definition_message_at]); class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 14 -> assert(class_definition_message_read.instrument_class_id[class_definition_message_at] == class_definition_message_written.instrument_class_id[class_definition_message_at]); class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 32 -> assert(class_definition_message_read.instrument_class_name[class_definition_message_at] == class_definition_message_written.instrument_class_name[class_definition_message_at]); class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  assert(class_definition_message_read.is_fractions == class_definition_message_written.is_fractions);
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 32 -> assert(class_definition_message_read.settlement_currency_id[class_definition_message_at] == class_definition_message_written.settlement_currency_id[class_definition_message_at]); class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  assert(class_definition_message_read.effective_tomorrow == class_definition_message_written.effective_tomorrow);
  class_definition_message_at = 0;
  do
  :: class_definition_message_at < 4 -> assert(class_definition_message_read.tick_step_size[class_definition_message_at] == class_definition_message_written.tick_step_size[class_definition_message_at]); class_definition_message_at = class_definition_message_at + 1
  :: else -> break
  od;
  assert(class_definition_message_read.filler_1 == class_definition_message_written.filler_1);
  skip
}

/* ---- Series Definition Base Message: 56 bytes -------------------------------- */

/* Describes basic series information */
typedef SeriesDefinitionBaseMessage {
  byte orderbook_id[4];
  byte symbol[32];
  byte financial_product;
  byte number_of_decimals_price[2];
  byte number_of_legs;
  byte strike_price[4];
  byte expiration_date[8];
  byte decimal_in_strike_price[2];
  byte put_or_call;
  byte filler_1
};

int series_definition_base_message_at;

/* every byte of Series Definition Base Message set to one value */
inline fill_series_definition_base_message(series_definition_base_message_record, series_definition_base_message_value) {
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 4 -> series_definition_base_message_record.orderbook_id[series_definition_base_message_at] = series_definition_base_message_value; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 32 -> series_definition_base_message_record.symbol[series_definition_base_message_at] = series_definition_base_message_value; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_record.financial_product = series_definition_base_message_value;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 2 -> series_definition_base_message_record.number_of_decimals_price[series_definition_base_message_at] = series_definition_base_message_value; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_record.number_of_legs = series_definition_base_message_value;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 4 -> series_definition_base_message_record.strike_price[series_definition_base_message_at] = series_definition_base_message_value; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 8 -> series_definition_base_message_record.expiration_date[series_definition_base_message_at] = series_definition_base_message_value; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 2 -> series_definition_base_message_record.decimal_in_strike_price[series_definition_base_message_at] = series_definition_base_message_value; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_record.put_or_call = series_definition_base_message_value;
  series_definition_base_message_record.filler_1 = series_definition_base_message_value;
  skip
}

/* each byte of Series Definition Base Message set to where it lies, so a field read out of place says so */
inline ramp_series_definition_base_message(series_definition_base_message_record, series_definition_base_message_base) {
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 4 -> series_definition_base_message_record.orderbook_id[series_definition_base_message_at] = (series_definition_base_message_base + 0 + series_definition_base_message_at + 1) % 256; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 32 -> series_definition_base_message_record.symbol[series_definition_base_message_at] = (series_definition_base_message_base + 4 + series_definition_base_message_at + 1) % 256; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_record.financial_product = (series_definition_base_message_base + 36 + 1) % 256;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 2 -> series_definition_base_message_record.number_of_decimals_price[series_definition_base_message_at] = (series_definition_base_message_base + 37 + series_definition_base_message_at + 1) % 256; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_record.number_of_legs = (series_definition_base_message_base + 39 + 1) % 256;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 4 -> series_definition_base_message_record.strike_price[series_definition_base_message_at] = (series_definition_base_message_base + 40 + series_definition_base_message_at + 1) % 256; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 8 -> series_definition_base_message_record.expiration_date[series_definition_base_message_at] = (series_definition_base_message_base + 44 + series_definition_base_message_at + 1) % 256; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 2 -> series_definition_base_message_record.decimal_in_strike_price[series_definition_base_message_at] = (series_definition_base_message_base + 52 + series_definition_base_message_at + 1) % 256; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_record.put_or_call = (series_definition_base_message_base + 54 + 1) % 256;
  series_definition_base_message_record.filler_1 = (series_definition_base_message_base + 55 + 1) % 256;
  skip
}

/* Series Definition Base Message to the wire, 56 bytes from where the cursor stands */
inline encode_series_definition_base_message(series_definition_base_message_record) {
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 4 -> wire[at] = series_definition_base_message_record.orderbook_id[series_definition_base_message_at]; at = at + 1; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 32 -> wire[at] = series_definition_base_message_record.symbol[series_definition_base_message_at]; at = at + 1; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  wire[at] = series_definition_base_message_record.financial_product; at = at + 1;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 2 -> wire[at] = series_definition_base_message_record.number_of_decimals_price[series_definition_base_message_at]; at = at + 1; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  wire[at] = series_definition_base_message_record.number_of_legs; at = at + 1;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 4 -> wire[at] = series_definition_base_message_record.strike_price[series_definition_base_message_at]; at = at + 1; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 8 -> wire[at] = series_definition_base_message_record.expiration_date[series_definition_base_message_at]; at = at + 1; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 2 -> wire[at] = series_definition_base_message_record.decimal_in_strike_price[series_definition_base_message_at]; at = at + 1; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  wire[at] = series_definition_base_message_record.put_or_call; at = at + 1;
  wire[at] = series_definition_base_message_record.filler_1; at = at + 1;
  skip
}

/* Series Definition Base Message off the wire, 56 bytes from where the cursor stands */
inline decode_series_definition_base_message(series_definition_base_message_record) {
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 4 -> series_definition_base_message_record.orderbook_id[series_definition_base_message_at] = wire[at]; at = at + 1; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 32 -> series_definition_base_message_record.symbol[series_definition_base_message_at] = wire[at]; at = at + 1; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_record.financial_product = wire[at]; at = at + 1;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 2 -> series_definition_base_message_record.number_of_decimals_price[series_definition_base_message_at] = wire[at]; at = at + 1; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_record.number_of_legs = wire[at]; at = at + 1;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 4 -> series_definition_base_message_record.strike_price[series_definition_base_message_at] = wire[at]; at = at + 1; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 8 -> series_definition_base_message_record.expiration_date[series_definition_base_message_at] = wire[at]; at = at + 1; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 2 -> series_definition_base_message_record.decimal_in_strike_price[series_definition_base_message_at] = wire[at]; at = at + 1; series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_record.put_or_call = wire[at]; at = at + 1;
  series_definition_base_message_record.filler_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Series Definition Base Message is what was written, byte for byte */
inline equal_series_definition_base_message(series_definition_base_message_read, series_definition_base_message_written) {
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 4 -> assert(series_definition_base_message_read.orderbook_id[series_definition_base_message_at] == series_definition_base_message_written.orderbook_id[series_definition_base_message_at]); series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 32 -> assert(series_definition_base_message_read.symbol[series_definition_base_message_at] == series_definition_base_message_written.symbol[series_definition_base_message_at]); series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  assert(series_definition_base_message_read.financial_product == series_definition_base_message_written.financial_product);
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 2 -> assert(series_definition_base_message_read.number_of_decimals_price[series_definition_base_message_at] == series_definition_base_message_written.number_of_decimals_price[series_definition_base_message_at]); series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  assert(series_definition_base_message_read.number_of_legs == series_definition_base_message_written.number_of_legs);
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 4 -> assert(series_definition_base_message_read.strike_price[series_definition_base_message_at] == series_definition_base_message_written.strike_price[series_definition_base_message_at]); series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 8 -> assert(series_definition_base_message_read.expiration_date[series_definition_base_message_at] == series_definition_base_message_written.expiration_date[series_definition_base_message_at]); series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  series_definition_base_message_at = 0;
  do
  :: series_definition_base_message_at < 2 -> assert(series_definition_base_message_read.decimal_in_strike_price[series_definition_base_message_at] == series_definition_base_message_written.decimal_in_strike_price[series_definition_base_message_at]); series_definition_base_message_at = series_definition_base_message_at + 1
  :: else -> break
  od;
  assert(series_definition_base_message_read.put_or_call == series_definition_base_message_written.put_or_call);
  assert(series_definition_base_message_read.filler_1 == series_definition_base_message_written.filler_1);
  skip
}

/* ---- Series Definition Extended Message: 100 bytes --------------------------- */

/* Describes series static data */
typedef SeriesDefinitionExtendedMessage {
  byte orderbook_id[4];
  byte symbol[32];
  byte country;
  byte market;
  byte instrument_group;
  byte modifier;
  byte commodity_code[2];
  byte expiry_date[2];
  byte strike_price[4];
  byte contract_size_extended[8];
  byte isin_code[12];
  byte series_status;
  byte effective_tomorrow;
  byte price_quotation_factor[4];
  byte price_method;
  byte filler_1;
  byte effective_exp_date[8];
  byte date_time_last_trading[8];
  byte date_time_first_trading[8]
};

int series_definition_extended_message_at;

/* every byte of Series Definition Extended Message set to one value */
inline fill_series_definition_extended_message(series_definition_extended_message_record, series_definition_extended_message_value) {
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> series_definition_extended_message_record.orderbook_id[series_definition_extended_message_at] = series_definition_extended_message_value; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 32 -> series_definition_extended_message_record.symbol[series_definition_extended_message_at] = series_definition_extended_message_value; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_record.country = series_definition_extended_message_value;
  series_definition_extended_message_record.market = series_definition_extended_message_value;
  series_definition_extended_message_record.instrument_group = series_definition_extended_message_value;
  series_definition_extended_message_record.modifier = series_definition_extended_message_value;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 2 -> series_definition_extended_message_record.commodity_code[series_definition_extended_message_at] = series_definition_extended_message_value; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 2 -> series_definition_extended_message_record.expiry_date[series_definition_extended_message_at] = series_definition_extended_message_value; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> series_definition_extended_message_record.strike_price[series_definition_extended_message_at] = series_definition_extended_message_value; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> series_definition_extended_message_record.contract_size_extended[series_definition_extended_message_at] = series_definition_extended_message_value; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 12 -> series_definition_extended_message_record.isin_code[series_definition_extended_message_at] = series_definition_extended_message_value; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_record.series_status = series_definition_extended_message_value;
  series_definition_extended_message_record.effective_tomorrow = series_definition_extended_message_value;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> series_definition_extended_message_record.price_quotation_factor[series_definition_extended_message_at] = series_definition_extended_message_value; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_record.price_method = series_definition_extended_message_value;
  series_definition_extended_message_record.filler_1 = series_definition_extended_message_value;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> series_definition_extended_message_record.effective_exp_date[series_definition_extended_message_at] = series_definition_extended_message_value; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> series_definition_extended_message_record.date_time_last_trading[series_definition_extended_message_at] = series_definition_extended_message_value; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> series_definition_extended_message_record.date_time_first_trading[series_definition_extended_message_at] = series_definition_extended_message_value; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Series Definition Extended Message set to where it lies, so a field read out of place says so */
inline ramp_series_definition_extended_message(series_definition_extended_message_record, series_definition_extended_message_base) {
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> series_definition_extended_message_record.orderbook_id[series_definition_extended_message_at] = (series_definition_extended_message_base + 0 + series_definition_extended_message_at + 1) % 256; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 32 -> series_definition_extended_message_record.symbol[series_definition_extended_message_at] = (series_definition_extended_message_base + 4 + series_definition_extended_message_at + 1) % 256; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_record.country = (series_definition_extended_message_base + 36 + 1) % 256;
  series_definition_extended_message_record.market = (series_definition_extended_message_base + 37 + 1) % 256;
  series_definition_extended_message_record.instrument_group = (series_definition_extended_message_base + 38 + 1) % 256;
  series_definition_extended_message_record.modifier = (series_definition_extended_message_base + 39 + 1) % 256;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 2 -> series_definition_extended_message_record.commodity_code[series_definition_extended_message_at] = (series_definition_extended_message_base + 40 + series_definition_extended_message_at + 1) % 256; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 2 -> series_definition_extended_message_record.expiry_date[series_definition_extended_message_at] = (series_definition_extended_message_base + 42 + series_definition_extended_message_at + 1) % 256; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> series_definition_extended_message_record.strike_price[series_definition_extended_message_at] = (series_definition_extended_message_base + 44 + series_definition_extended_message_at + 1) % 256; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> series_definition_extended_message_record.contract_size_extended[series_definition_extended_message_at] = (series_definition_extended_message_base + 48 + series_definition_extended_message_at + 1) % 256; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 12 -> series_definition_extended_message_record.isin_code[series_definition_extended_message_at] = (series_definition_extended_message_base + 56 + series_definition_extended_message_at + 1) % 256; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_record.series_status = (series_definition_extended_message_base + 68 + 1) % 256;
  series_definition_extended_message_record.effective_tomorrow = (series_definition_extended_message_base + 69 + 1) % 256;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> series_definition_extended_message_record.price_quotation_factor[series_definition_extended_message_at] = (series_definition_extended_message_base + 70 + series_definition_extended_message_at + 1) % 256; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_record.price_method = (series_definition_extended_message_base + 74 + 1) % 256;
  series_definition_extended_message_record.filler_1 = (series_definition_extended_message_base + 75 + 1) % 256;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> series_definition_extended_message_record.effective_exp_date[series_definition_extended_message_at] = (series_definition_extended_message_base + 76 + series_definition_extended_message_at + 1) % 256; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> series_definition_extended_message_record.date_time_last_trading[series_definition_extended_message_at] = (series_definition_extended_message_base + 84 + series_definition_extended_message_at + 1) % 256; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> series_definition_extended_message_record.date_time_first_trading[series_definition_extended_message_at] = (series_definition_extended_message_base + 92 + series_definition_extended_message_at + 1) % 256; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* Series Definition Extended Message to the wire, 100 bytes from where the cursor stands */
inline encode_series_definition_extended_message(series_definition_extended_message_record) {
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> wire[at] = series_definition_extended_message_record.orderbook_id[series_definition_extended_message_at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 32 -> wire[at] = series_definition_extended_message_record.symbol[series_definition_extended_message_at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = series_definition_extended_message_record.country; at = at + 1;
  wire[at] = series_definition_extended_message_record.market; at = at + 1;
  wire[at] = series_definition_extended_message_record.instrument_group; at = at + 1;
  wire[at] = series_definition_extended_message_record.modifier; at = at + 1;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 2 -> wire[at] = series_definition_extended_message_record.commodity_code[series_definition_extended_message_at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 2 -> wire[at] = series_definition_extended_message_record.expiry_date[series_definition_extended_message_at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> wire[at] = series_definition_extended_message_record.strike_price[series_definition_extended_message_at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> wire[at] = series_definition_extended_message_record.contract_size_extended[series_definition_extended_message_at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 12 -> wire[at] = series_definition_extended_message_record.isin_code[series_definition_extended_message_at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = series_definition_extended_message_record.series_status; at = at + 1;
  wire[at] = series_definition_extended_message_record.effective_tomorrow; at = at + 1;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> wire[at] = series_definition_extended_message_record.price_quotation_factor[series_definition_extended_message_at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = series_definition_extended_message_record.price_method; at = at + 1;
  wire[at] = series_definition_extended_message_record.filler_1; at = at + 1;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> wire[at] = series_definition_extended_message_record.effective_exp_date[series_definition_extended_message_at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> wire[at] = series_definition_extended_message_record.date_time_last_trading[series_definition_extended_message_at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> wire[at] = series_definition_extended_message_record.date_time_first_trading[series_definition_extended_message_at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* Series Definition Extended Message off the wire, 100 bytes from where the cursor stands */
inline decode_series_definition_extended_message(series_definition_extended_message_record) {
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> series_definition_extended_message_record.orderbook_id[series_definition_extended_message_at] = wire[at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 32 -> series_definition_extended_message_record.symbol[series_definition_extended_message_at] = wire[at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_record.country = wire[at]; at = at + 1;
  series_definition_extended_message_record.market = wire[at]; at = at + 1;
  series_definition_extended_message_record.instrument_group = wire[at]; at = at + 1;
  series_definition_extended_message_record.modifier = wire[at]; at = at + 1;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 2 -> series_definition_extended_message_record.commodity_code[series_definition_extended_message_at] = wire[at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 2 -> series_definition_extended_message_record.expiry_date[series_definition_extended_message_at] = wire[at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> series_definition_extended_message_record.strike_price[series_definition_extended_message_at] = wire[at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> series_definition_extended_message_record.contract_size_extended[series_definition_extended_message_at] = wire[at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 12 -> series_definition_extended_message_record.isin_code[series_definition_extended_message_at] = wire[at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_record.series_status = wire[at]; at = at + 1;
  series_definition_extended_message_record.effective_tomorrow = wire[at]; at = at + 1;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> series_definition_extended_message_record.price_quotation_factor[series_definition_extended_message_at] = wire[at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_record.price_method = wire[at]; at = at + 1;
  series_definition_extended_message_record.filler_1 = wire[at]; at = at + 1;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> series_definition_extended_message_record.effective_exp_date[series_definition_extended_message_at] = wire[at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> series_definition_extended_message_record.date_time_last_trading[series_definition_extended_message_at] = wire[at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> series_definition_extended_message_record.date_time_first_trading[series_definition_extended_message_at] = wire[at]; at = at + 1; series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Series Definition Extended Message is what was written, byte for byte */
inline equal_series_definition_extended_message(series_definition_extended_message_read, series_definition_extended_message_written) {
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> assert(series_definition_extended_message_read.orderbook_id[series_definition_extended_message_at] == series_definition_extended_message_written.orderbook_id[series_definition_extended_message_at]); series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 32 -> assert(series_definition_extended_message_read.symbol[series_definition_extended_message_at] == series_definition_extended_message_written.symbol[series_definition_extended_message_at]); series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  assert(series_definition_extended_message_read.country == series_definition_extended_message_written.country);
  assert(series_definition_extended_message_read.market == series_definition_extended_message_written.market);
  assert(series_definition_extended_message_read.instrument_group == series_definition_extended_message_written.instrument_group);
  assert(series_definition_extended_message_read.modifier == series_definition_extended_message_written.modifier);
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 2 -> assert(series_definition_extended_message_read.commodity_code[series_definition_extended_message_at] == series_definition_extended_message_written.commodity_code[series_definition_extended_message_at]); series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 2 -> assert(series_definition_extended_message_read.expiry_date[series_definition_extended_message_at] == series_definition_extended_message_written.expiry_date[series_definition_extended_message_at]); series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> assert(series_definition_extended_message_read.strike_price[series_definition_extended_message_at] == series_definition_extended_message_written.strike_price[series_definition_extended_message_at]); series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> assert(series_definition_extended_message_read.contract_size_extended[series_definition_extended_message_at] == series_definition_extended_message_written.contract_size_extended[series_definition_extended_message_at]); series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 12 -> assert(series_definition_extended_message_read.isin_code[series_definition_extended_message_at] == series_definition_extended_message_written.isin_code[series_definition_extended_message_at]); series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  assert(series_definition_extended_message_read.series_status == series_definition_extended_message_written.series_status);
  assert(series_definition_extended_message_read.effective_tomorrow == series_definition_extended_message_written.effective_tomorrow);
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 4 -> assert(series_definition_extended_message_read.price_quotation_factor[series_definition_extended_message_at] == series_definition_extended_message_written.price_quotation_factor[series_definition_extended_message_at]); series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  assert(series_definition_extended_message_read.price_method == series_definition_extended_message_written.price_method);
  assert(series_definition_extended_message_read.filler_1 == series_definition_extended_message_written.filler_1);
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> assert(series_definition_extended_message_read.effective_exp_date[series_definition_extended_message_at] == series_definition_extended_message_written.effective_exp_date[series_definition_extended_message_at]); series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> assert(series_definition_extended_message_read.date_time_last_trading[series_definition_extended_message_at] == series_definition_extended_message_written.date_time_last_trading[series_definition_extended_message_at]); series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  series_definition_extended_message_at = 0;
  do
  :: series_definition_extended_message_at < 8 -> assert(series_definition_extended_message_read.date_time_first_trading[series_definition_extended_message_at] == series_definition_extended_message_written.date_time_first_trading[series_definition_extended_message_at]); series_definition_extended_message_at = series_definition_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Combination Definition Message: 16 bytes -------------------------------- */

/* Describes a combination orderbook */
typedef CombinationDefinitionMessage {
  byte combo_orderbook_id[4];
  byte leg_orderbook_id[4];
  byte filler_3[3];
  byte leg_side;
  byte leg_ratio[4]
};

int combination_definition_message_at;

/* every byte of Combination Definition Message set to one value */
inline fill_combination_definition_message(combination_definition_message_record, combination_definition_message_value) {
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> combination_definition_message_record.combo_orderbook_id[combination_definition_message_at] = combination_definition_message_value; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> combination_definition_message_record.leg_orderbook_id[combination_definition_message_at] = combination_definition_message_value; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 3 -> combination_definition_message_record.filler_3[combination_definition_message_at] = combination_definition_message_value; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  combination_definition_message_record.leg_side = combination_definition_message_value;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> combination_definition_message_record.leg_ratio[combination_definition_message_at] = combination_definition_message_value; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Combination Definition Message set to where it lies, so a field read out of place says so */
inline ramp_combination_definition_message(combination_definition_message_record, combination_definition_message_base) {
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> combination_definition_message_record.combo_orderbook_id[combination_definition_message_at] = (combination_definition_message_base + 0 + combination_definition_message_at + 1) % 256; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> combination_definition_message_record.leg_orderbook_id[combination_definition_message_at] = (combination_definition_message_base + 4 + combination_definition_message_at + 1) % 256; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 3 -> combination_definition_message_record.filler_3[combination_definition_message_at] = (combination_definition_message_base + 8 + combination_definition_message_at + 1) % 256; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  combination_definition_message_record.leg_side = (combination_definition_message_base + 11 + 1) % 256;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> combination_definition_message_record.leg_ratio[combination_definition_message_at] = (combination_definition_message_base + 12 + combination_definition_message_at + 1) % 256; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Definition Message to the wire, 16 bytes from where the cursor stands */
inline encode_combination_definition_message(combination_definition_message_record) {
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> wire[at] = combination_definition_message_record.combo_orderbook_id[combination_definition_message_at]; at = at + 1; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> wire[at] = combination_definition_message_record.leg_orderbook_id[combination_definition_message_at]; at = at + 1; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 3 -> wire[at] = combination_definition_message_record.filler_3[combination_definition_message_at]; at = at + 1; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = combination_definition_message_record.leg_side; at = at + 1;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> wire[at] = combination_definition_message_record.leg_ratio[combination_definition_message_at]; at = at + 1; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Definition Message off the wire, 16 bytes from where the cursor stands */
inline decode_combination_definition_message(combination_definition_message_record) {
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> combination_definition_message_record.combo_orderbook_id[combination_definition_message_at] = wire[at]; at = at + 1; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> combination_definition_message_record.leg_orderbook_id[combination_definition_message_at] = wire[at]; at = at + 1; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 3 -> combination_definition_message_record.filler_3[combination_definition_message_at] = wire[at]; at = at + 1; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  combination_definition_message_record.leg_side = wire[at]; at = at + 1;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> combination_definition_message_record.leg_ratio[combination_definition_message_at] = wire[at]; at = at + 1; combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Combination Definition Message is what was written, byte for byte */
inline equal_combination_definition_message(combination_definition_message_read, combination_definition_message_written) {
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> assert(combination_definition_message_read.combo_orderbook_id[combination_definition_message_at] == combination_definition_message_written.combo_orderbook_id[combination_definition_message_at]); combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> assert(combination_definition_message_read.leg_orderbook_id[combination_definition_message_at] == combination_definition_message_written.leg_orderbook_id[combination_definition_message_at]); combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 3 -> assert(combination_definition_message_read.filler_3[combination_definition_message_at] == combination_definition_message_written.filler_3[combination_definition_message_at]); combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  assert(combination_definition_message_read.leg_side == combination_definition_message_written.leg_side);
  combination_definition_message_at = 0;
  do
  :: combination_definition_message_at < 4 -> assert(combination_definition_message_read.leg_ratio[combination_definition_message_at] == combination_definition_message_written.leg_ratio[combination_definition_message_at]); combination_definition_message_at = combination_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Refresh Complete: 4 bytes ----------------------------------------------- */

/* This message is published to mark the end of a refresh cycle */
typedef RefreshComplete {
  byte last_seq_num[4]
};

int refresh_complete_at;

/* every byte of Refresh Complete set to one value */
inline fill_refresh_complete(refresh_complete_record, refresh_complete_value) {
  refresh_complete_at = 0;
  do
  :: refresh_complete_at < 4 -> refresh_complete_record.last_seq_num[refresh_complete_at] = refresh_complete_value; refresh_complete_at = refresh_complete_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Complete set to where it lies, so a field read out of place says so */
inline ramp_refresh_complete(refresh_complete_record, refresh_complete_base) {
  refresh_complete_at = 0;
  do
  :: refresh_complete_at < 4 -> refresh_complete_record.last_seq_num[refresh_complete_at] = (refresh_complete_base + 0 + refresh_complete_at + 1) % 256; refresh_complete_at = refresh_complete_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complete to the wire, 4 bytes from where the cursor stands */
inline encode_refresh_complete(refresh_complete_record) {
  refresh_complete_at = 0;
  do
  :: refresh_complete_at < 4 -> wire[at] = refresh_complete_record.last_seq_num[refresh_complete_at]; at = at + 1; refresh_complete_at = refresh_complete_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complete off the wire, 4 bytes from where the cursor stands */
inline decode_refresh_complete(refresh_complete_record) {
  refresh_complete_at = 0;
  do
  :: refresh_complete_at < 4 -> refresh_complete_record.last_seq_num[refresh_complete_at] = wire[at]; at = at + 1; refresh_complete_at = refresh_complete_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Complete is what was written, byte for byte */
inline equal_refresh_complete(refresh_complete_read, refresh_complete_written) {
  refresh_complete_at = 0;
  do
  :: refresh_complete_at < 4 -> assert(refresh_complete_read.last_seq_num[refresh_complete_at] == refresh_complete_written.last_seq_num[refresh_complete_at]); refresh_complete_at = refresh_complete_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Status Message: 48 bytes ----------------------------------------- */

/* The Market Status message can be used to derive the active state of a series */
typedef MarketStatusMessage {
  byte state_level[2];
  byte market;
  byte instrument;
  byte orderbook_id[4];
  byte commodity_code[2];
  byte filler_2[2];
  byte actual_start_date[8];
  byte actual_start_time[6];
  byte planned_start_date[8];
  byte planned_start_time[6];
  byte seconds_to_state_change[2];
  byte state[2];
  byte priority_;
  byte filler_3[3]
};

int market_status_message_at;

/* every byte of Market Status Message set to one value */
inline fill_market_status_message(market_status_message_record, market_status_message_value) {
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.state_level[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_record.market = market_status_message_value;
  market_status_message_record.instrument = market_status_message_value;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 4 -> market_status_message_record.orderbook_id[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.commodity_code[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.filler_2[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> market_status_message_record.actual_start_date[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> market_status_message_record.actual_start_time[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> market_status_message_record.planned_start_date[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> market_status_message_record.planned_start_time[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.seconds_to_state_change[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.state[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_record.priority_ = market_status_message_value;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 3 -> market_status_message_record.filler_3[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Status Message set to where it lies, so a field read out of place says so */
inline ramp_market_status_message(market_status_message_record, market_status_message_base) {
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.state_level[market_status_message_at] = (market_status_message_base + 0 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_record.market = (market_status_message_base + 2 + 1) % 256;
  market_status_message_record.instrument = (market_status_message_base + 3 + 1) % 256;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 4 -> market_status_message_record.orderbook_id[market_status_message_at] = (market_status_message_base + 4 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.commodity_code[market_status_message_at] = (market_status_message_base + 8 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.filler_2[market_status_message_at] = (market_status_message_base + 10 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> market_status_message_record.actual_start_date[market_status_message_at] = (market_status_message_base + 12 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> market_status_message_record.actual_start_time[market_status_message_at] = (market_status_message_base + 20 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> market_status_message_record.planned_start_date[market_status_message_at] = (market_status_message_base + 26 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> market_status_message_record.planned_start_time[market_status_message_at] = (market_status_message_base + 34 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.seconds_to_state_change[market_status_message_at] = (market_status_message_base + 40 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.state[market_status_message_at] = (market_status_message_base + 42 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_record.priority_ = (market_status_message_base + 44 + 1) % 256;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 3 -> market_status_message_record.filler_3[market_status_message_at] = (market_status_message_base + 45 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Status Message to the wire, 48 bytes from where the cursor stands */
inline encode_market_status_message(market_status_message_record) {
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> wire[at] = market_status_message_record.state_level[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  wire[at] = market_status_message_record.market; at = at + 1;
  wire[at] = market_status_message_record.instrument; at = at + 1;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 4 -> wire[at] = market_status_message_record.orderbook_id[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> wire[at] = market_status_message_record.commodity_code[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> wire[at] = market_status_message_record.filler_2[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> wire[at] = market_status_message_record.actual_start_date[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> wire[at] = market_status_message_record.actual_start_time[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> wire[at] = market_status_message_record.planned_start_date[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> wire[at] = market_status_message_record.planned_start_time[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> wire[at] = market_status_message_record.seconds_to_state_change[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> wire[at] = market_status_message_record.state[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  wire[at] = market_status_message_record.priority_; at = at + 1;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 3 -> wire[at] = market_status_message_record.filler_3[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Status Message off the wire, 48 bytes from where the cursor stands */
inline decode_market_status_message(market_status_message_record) {
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.state_level[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_record.market = wire[at]; at = at + 1;
  market_status_message_record.instrument = wire[at]; at = at + 1;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 4 -> market_status_message_record.orderbook_id[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.commodity_code[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.filler_2[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> market_status_message_record.actual_start_date[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> market_status_message_record.actual_start_time[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> market_status_message_record.planned_start_date[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> market_status_message_record.planned_start_time[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.seconds_to_state_change[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> market_status_message_record.state[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_record.priority_ = wire[at]; at = at + 1;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 3 -> market_status_message_record.filler_3[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Status Message is what was written, byte for byte */
inline equal_market_status_message(market_status_message_read, market_status_message_written) {
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> assert(market_status_message_read.state_level[market_status_message_at] == market_status_message_written.state_level[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  assert(market_status_message_read.market == market_status_message_written.market);
  assert(market_status_message_read.instrument == market_status_message_written.instrument);
  market_status_message_at = 0;
  do
  :: market_status_message_at < 4 -> assert(market_status_message_read.orderbook_id[market_status_message_at] == market_status_message_written.orderbook_id[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> assert(market_status_message_read.commodity_code[market_status_message_at] == market_status_message_written.commodity_code[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> assert(market_status_message_read.filler_2[market_status_message_at] == market_status_message_written.filler_2[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> assert(market_status_message_read.actual_start_date[market_status_message_at] == market_status_message_written.actual_start_date[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> assert(market_status_message_read.actual_start_time[market_status_message_at] == market_status_message_written.actual_start_time[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> assert(market_status_message_read.planned_start_date[market_status_message_at] == market_status_message_written.planned_start_date[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 6 -> assert(market_status_message_read.planned_start_time[market_status_message_at] == market_status_message_written.planned_start_time[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> assert(market_status_message_read.seconds_to_state_change[market_status_message_at] == market_status_message_written.seconds_to_state_change[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 2 -> assert(market_status_message_read.state[market_status_message_at] == market_status_message_written.state[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  assert(market_status_message_read.priority_ == market_status_message_written.priority_);
  market_status_message_at = 0;
  do
  :: market_status_message_at < 3 -> assert(market_status_message_read.filler_3[market_status_message_at] == market_status_message_written.filler_3[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Series Status Message: 8 bytes ------------------------------------------ */

/* The Series Status message is generated whenever there is a change to suspension indicator or series status, or when the date/time of last trading is changed */
typedef SeriesStatusMessage {
  byte orderbook_id[4];
  byte suspension_indicator;
  byte series_status;
  byte filler_2[2]
};

int series_status_message_at;

/* every byte of Series Status Message set to one value */
inline fill_series_status_message(series_status_message_record, series_status_message_value) {
  series_status_message_at = 0;
  do
  :: series_status_message_at < 4 -> series_status_message_record.orderbook_id[series_status_message_at] = series_status_message_value; series_status_message_at = series_status_message_at + 1
  :: else -> break
  od;
  series_status_message_record.suspension_indicator = series_status_message_value;
  series_status_message_record.series_status = series_status_message_value;
  series_status_message_at = 0;
  do
  :: series_status_message_at < 2 -> series_status_message_record.filler_2[series_status_message_at] = series_status_message_value; series_status_message_at = series_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Series Status Message set to where it lies, so a field read out of place says so */
inline ramp_series_status_message(series_status_message_record, series_status_message_base) {
  series_status_message_at = 0;
  do
  :: series_status_message_at < 4 -> series_status_message_record.orderbook_id[series_status_message_at] = (series_status_message_base + 0 + series_status_message_at + 1) % 256; series_status_message_at = series_status_message_at + 1
  :: else -> break
  od;
  series_status_message_record.suspension_indicator = (series_status_message_base + 4 + 1) % 256;
  series_status_message_record.series_status = (series_status_message_base + 5 + 1) % 256;
  series_status_message_at = 0;
  do
  :: series_status_message_at < 2 -> series_status_message_record.filler_2[series_status_message_at] = (series_status_message_base + 6 + series_status_message_at + 1) % 256; series_status_message_at = series_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Series Status Message to the wire, 8 bytes from where the cursor stands */
inline encode_series_status_message(series_status_message_record) {
  series_status_message_at = 0;
  do
  :: series_status_message_at < 4 -> wire[at] = series_status_message_record.orderbook_id[series_status_message_at]; at = at + 1; series_status_message_at = series_status_message_at + 1
  :: else -> break
  od;
  wire[at] = series_status_message_record.suspension_indicator; at = at + 1;
  wire[at] = series_status_message_record.series_status; at = at + 1;
  series_status_message_at = 0;
  do
  :: series_status_message_at < 2 -> wire[at] = series_status_message_record.filler_2[series_status_message_at]; at = at + 1; series_status_message_at = series_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Series Status Message off the wire, 8 bytes from where the cursor stands */
inline decode_series_status_message(series_status_message_record) {
  series_status_message_at = 0;
  do
  :: series_status_message_at < 4 -> series_status_message_record.orderbook_id[series_status_message_at] = wire[at]; at = at + 1; series_status_message_at = series_status_message_at + 1
  :: else -> break
  od;
  series_status_message_record.suspension_indicator = wire[at]; at = at + 1;
  series_status_message_record.series_status = wire[at]; at = at + 1;
  series_status_message_at = 0;
  do
  :: series_status_message_at < 2 -> series_status_message_record.filler_2[series_status_message_at] = wire[at]; at = at + 1; series_status_message_at = series_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Series Status Message is what was written, byte for byte */
inline equal_series_status_message(series_status_message_read, series_status_message_written) {
  series_status_message_at = 0;
  do
  :: series_status_message_at < 4 -> assert(series_status_message_read.orderbook_id[series_status_message_at] == series_status_message_written.orderbook_id[series_status_message_at]); series_status_message_at = series_status_message_at + 1
  :: else -> break
  od;
  assert(series_status_message_read.suspension_indicator == series_status_message_written.suspension_indicator);
  assert(series_status_message_read.series_status == series_status_message_written.series_status);
  series_status_message_at = 0;
  do
  :: series_status_message_at < 2 -> assert(series_status_message_read.filler_2[series_status_message_at] == series_status_message_written.filler_2[series_status_message_at]); series_status_message_at = series_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Commodity Status Message: 4 bytes --------------------------------------- */

/* The Commodity Status message is generated whenever a commodity status changes */
typedef CommodityStatusMessage {
  byte commodity_code[2];
  byte suspended;
  byte locked
};

int commodity_status_message_at;

/* every byte of Commodity Status Message set to one value */
inline fill_commodity_status_message(commodity_status_message_record, commodity_status_message_value) {
  commodity_status_message_at = 0;
  do
  :: commodity_status_message_at < 2 -> commodity_status_message_record.commodity_code[commodity_status_message_at] = commodity_status_message_value; commodity_status_message_at = commodity_status_message_at + 1
  :: else -> break
  od;
  commodity_status_message_record.suspended = commodity_status_message_value;
  commodity_status_message_record.locked = commodity_status_message_value;
  skip
}

/* each byte of Commodity Status Message set to where it lies, so a field read out of place says so */
inline ramp_commodity_status_message(commodity_status_message_record, commodity_status_message_base) {
  commodity_status_message_at = 0;
  do
  :: commodity_status_message_at < 2 -> commodity_status_message_record.commodity_code[commodity_status_message_at] = (commodity_status_message_base + 0 + commodity_status_message_at + 1) % 256; commodity_status_message_at = commodity_status_message_at + 1
  :: else -> break
  od;
  commodity_status_message_record.suspended = (commodity_status_message_base + 2 + 1) % 256;
  commodity_status_message_record.locked = (commodity_status_message_base + 3 + 1) % 256;
  skip
}

/* Commodity Status Message to the wire, 4 bytes from where the cursor stands */
inline encode_commodity_status_message(commodity_status_message_record) {
  commodity_status_message_at = 0;
  do
  :: commodity_status_message_at < 2 -> wire[at] = commodity_status_message_record.commodity_code[commodity_status_message_at]; at = at + 1; commodity_status_message_at = commodity_status_message_at + 1
  :: else -> break
  od;
  wire[at] = commodity_status_message_record.suspended; at = at + 1;
  wire[at] = commodity_status_message_record.locked; at = at + 1;
  skip
}

/* Commodity Status Message off the wire, 4 bytes from where the cursor stands */
inline decode_commodity_status_message(commodity_status_message_record) {
  commodity_status_message_at = 0;
  do
  :: commodity_status_message_at < 2 -> commodity_status_message_record.commodity_code[commodity_status_message_at] = wire[at]; at = at + 1; commodity_status_message_at = commodity_status_message_at + 1
  :: else -> break
  od;
  commodity_status_message_record.suspended = wire[at]; at = at + 1;
  commodity_status_message_record.locked = wire[at]; at = at + 1;
  skip
}

/* what was read of Commodity Status Message is what was written, byte for byte */
inline equal_commodity_status_message(commodity_status_message_read, commodity_status_message_written) {
  commodity_status_message_at = 0;
  do
  :: commodity_status_message_at < 2 -> assert(commodity_status_message_read.commodity_code[commodity_status_message_at] == commodity_status_message_written.commodity_code[commodity_status_message_at]); commodity_status_message_at = commodity_status_message_at + 1
  :: else -> break
  od;
  assert(commodity_status_message_read.suspended == commodity_status_message_written.suspended);
  assert(commodity_status_message_read.locked == commodity_status_message_written.locked);
  skip
}

/* ---- Trade Statistics Message: 56 bytes -------------------------------------- */

/* Trade information for completed deals */
typedef TradeStatisticsMessage {
  byte orderbook_id[4];
  byte price[4];
  byte deal_source;
  byte session;
  byte filler_2[2];
  byte statistics_aggregate_quantity[8];
  byte open[4];
  byte high[4];
  byte low[4];
  byte filler_4[4];
  byte trade_report_volume[8];
  byte deal_count[4];
  byte turnover[8]
};

int trade_statistics_message_at;

/* every byte of Trade Statistics Message set to one value */
inline fill_trade_statistics_message(trade_statistics_message_record, trade_statistics_message_value) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.orderbook_id[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.price[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_record.deal_source = trade_statistics_message_value;
  trade_statistics_message_record.session = trade_statistics_message_value;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 2 -> trade_statistics_message_record.filler_2[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.statistics_aggregate_quantity[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.open[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.high[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.low[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.filler_4[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.trade_report_volume[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.deal_count[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.turnover[trade_statistics_message_at] = trade_statistics_message_value; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_trade_statistics_message(trade_statistics_message_record, trade_statistics_message_base) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.orderbook_id[trade_statistics_message_at] = (trade_statistics_message_base + 0 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.price[trade_statistics_message_at] = (trade_statistics_message_base + 4 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_record.deal_source = (trade_statistics_message_base + 8 + 1) % 256;
  trade_statistics_message_record.session = (trade_statistics_message_base + 9 + 1) % 256;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 2 -> trade_statistics_message_record.filler_2[trade_statistics_message_at] = (trade_statistics_message_base + 10 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.statistics_aggregate_quantity[trade_statistics_message_at] = (trade_statistics_message_base + 12 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.open[trade_statistics_message_at] = (trade_statistics_message_base + 20 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.high[trade_statistics_message_at] = (trade_statistics_message_base + 24 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.low[trade_statistics_message_at] = (trade_statistics_message_base + 28 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.filler_4[trade_statistics_message_at] = (trade_statistics_message_base + 32 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.trade_report_volume[trade_statistics_message_at] = (trade_statistics_message_base + 36 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.deal_count[trade_statistics_message_at] = (trade_statistics_message_base + 44 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.turnover[trade_statistics_message_at] = (trade_statistics_message_base + 48 + trade_statistics_message_at + 1) % 256; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Statistics Message to the wire, 56 bytes from where the cursor stands */
inline encode_trade_statistics_message(trade_statistics_message_record) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> wire[at] = trade_statistics_message_record.orderbook_id[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> wire[at] = trade_statistics_message_record.price[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_statistics_message_record.deal_source; at = at + 1;
  wire[at] = trade_statistics_message_record.session; at = at + 1;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 2 -> wire[at] = trade_statistics_message_record.filler_2[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.statistics_aggregate_quantity[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> wire[at] = trade_statistics_message_record.open[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> wire[at] = trade_statistics_message_record.high[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> wire[at] = trade_statistics_message_record.low[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> wire[at] = trade_statistics_message_record.filler_4[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.trade_report_volume[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> wire[at] = trade_statistics_message_record.deal_count[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> wire[at] = trade_statistics_message_record.turnover[trade_statistics_message_at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Statistics Message off the wire, 56 bytes from where the cursor stands */
inline decode_trade_statistics_message(trade_statistics_message_record) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.orderbook_id[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.price[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_record.deal_source = wire[at]; at = at + 1;
  trade_statistics_message_record.session = wire[at]; at = at + 1;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 2 -> trade_statistics_message_record.filler_2[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.statistics_aggregate_quantity[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.open[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.high[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.low[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.filler_4[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.trade_report_volume[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> trade_statistics_message_record.deal_count[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> trade_statistics_message_record.turnover[trade_statistics_message_at] = wire[at]; at = at + 1; trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Statistics Message is what was written, byte for byte */
inline equal_trade_statistics_message(trade_statistics_message_read, trade_statistics_message_written) {
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> assert(trade_statistics_message_read.orderbook_id[trade_statistics_message_at] == trade_statistics_message_written.orderbook_id[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> assert(trade_statistics_message_read.price[trade_statistics_message_at] == trade_statistics_message_written.price[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  assert(trade_statistics_message_read.deal_source == trade_statistics_message_written.deal_source);
  assert(trade_statistics_message_read.session == trade_statistics_message_written.session);
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 2 -> assert(trade_statistics_message_read.filler_2[trade_statistics_message_at] == trade_statistics_message_written.filler_2[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.statistics_aggregate_quantity[trade_statistics_message_at] == trade_statistics_message_written.statistics_aggregate_quantity[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> assert(trade_statistics_message_read.open[trade_statistics_message_at] == trade_statistics_message_written.open[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> assert(trade_statistics_message_read.high[trade_statistics_message_at] == trade_statistics_message_written.high[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> assert(trade_statistics_message_read.low[trade_statistics_message_at] == trade_statistics_message_written.low[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> assert(trade_statistics_message_read.filler_4[trade_statistics_message_at] == trade_statistics_message_written.filler_4[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.trade_report_volume[trade_statistics_message_at] == trade_statistics_message_written.trade_report_volume[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 4 -> assert(trade_statistics_message_read.deal_count[trade_statistics_message_at] == trade_statistics_message_written.deal_count[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
  :: else -> break
  od;
  trade_statistics_message_at = 0;
  do
  :: trade_statistics_message_at < 8 -> assert(trade_statistics_message_read.turnover[trade_statistics_message_at] == trade_statistics_message_written.turnover[trade_statistics_message_at]); trade_statistics_message_at = trade_statistics_message_at + 1
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

/* Msg Header: encoded, read back, and compared */
proctype check_msg_header() {
  MsgHeader msg_header_sent;
  MsgHeader msg_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_msg_header(msg_header_sent, 0)
  :: pattern == 1 -> fill_msg_header(msg_header_sent, 32)
  :: pattern == 2 -> fill_msg_header(msg_header_sent, 255)
  :: else -> ramp_msg_header(msg_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_msg_header(msg_header_sent);
    assert(at == 4);
    at = 0;
    decode_msg_header(msg_header_got);
    assert(at == 4);
    equal_msg_header(msg_header_got, msg_header_sent)
  }
}

/* Calculated Opening Price Message: encoded, read back, and compared */
proctype check_calculated_opening_price_message() {
  CalculatedOpeningPriceMessage calculated_opening_price_message_sent;
  CalculatedOpeningPriceMessage calculated_opening_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_calculated_opening_price_message(calculated_opening_price_message_sent, 0)
  :: pattern == 1 -> fill_calculated_opening_price_message(calculated_opening_price_message_sent, 32)
  :: pattern == 2 -> fill_calculated_opening_price_message(calculated_opening_price_message_sent, 255)
  :: else -> ramp_calculated_opening_price_message(calculated_opening_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_calculated_opening_price_message(calculated_opening_price_message_sent);
    assert(at == 20);
    at = 0;
    decode_calculated_opening_price_message(calculated_opening_price_message_got);
    assert(at == 20);
    equal_calculated_opening_price_message(calculated_opening_price_message_got, calculated_opening_price_message_sent)
  }
}

/* Sequence Reset: encoded, read back, and compared */
proctype check_sequence_reset() {
  SequenceReset sequence_reset_sent;
  SequenceReset sequence_reset_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_reset(sequence_reset_sent, 0)
  :: pattern == 1 -> fill_sequence_reset(sequence_reset_sent, 32)
  :: pattern == 2 -> fill_sequence_reset(sequence_reset_sent, 255)
  :: else -> ramp_sequence_reset(sequence_reset_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_reset(sequence_reset_sent);
    assert(at == 4);
    at = 0;
    decode_sequence_reset(sequence_reset_got);
    assert(at == 4);
    equal_sequence_reset(sequence_reset_got, sequence_reset_sent)
  }
}

/* Disaster Recovery Signal Message: encoded, read back, and compared */
proctype check_disaster_recovery_signal_message() {
  DisasterRecoverySignalMessage disaster_recovery_signal_message_sent;
  DisasterRecoverySignalMessage disaster_recovery_signal_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_disaster_recovery_signal_message(disaster_recovery_signal_message_sent, 0)
  :: pattern == 1 -> fill_disaster_recovery_signal_message(disaster_recovery_signal_message_sent, 32)
  :: pattern == 2 -> fill_disaster_recovery_signal_message(disaster_recovery_signal_message_sent, 255)
  :: else -> ramp_disaster_recovery_signal_message(disaster_recovery_signal_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_disaster_recovery_signal_message(disaster_recovery_signal_message_sent);
    assert(at == 4);
    at = 0;
    decode_disaster_recovery_signal_message(disaster_recovery_signal_message_got);
    assert(at == 4);
    equal_disaster_recovery_signal_message(disaster_recovery_signal_message_got, disaster_recovery_signal_message_sent)
  }
}

/* Open Interest Message: encoded, read back, and compared */
proctype check_open_interest_message() {
  OpenInterestMessage open_interest_message_sent;
  OpenInterestMessage open_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_interest_message(open_interest_message_sent, 0)
  :: pattern == 1 -> fill_open_interest_message(open_interest_message_sent, 32)
  :: pattern == 2 -> fill_open_interest_message(open_interest_message_sent, 255)
  :: else -> ramp_open_interest_message(open_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_interest_message(open_interest_message_sent);
    assert(at == 36);
    at = 0;
    decode_open_interest_message(open_interest_message_got);
    assert(at == 36);
    equal_open_interest_message(open_interest_message_got, open_interest_message_sent)
  }
}

/* Quote Request: encoded, read back, and compared */
proctype check_quote_request() {
  QuoteRequest quote_request_sent;
  QuoteRequest quote_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_request(quote_request_sent, 0)
  :: pattern == 1 -> fill_quote_request(quote_request_sent, 32)
  :: pattern == 2 -> fill_quote_request(quote_request_sent, 255)
  :: else -> ramp_quote_request(quote_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_request(quote_request_sent);
    assert(at == 12);
    at = 0;
    decode_quote_request(quote_request_got);
    assert(at == 12);
    equal_quote_request(quote_request_got, quote_request_sent)
  }
}

/* Commodity Definition Message: encoded, read back, and compared */
proctype check_commodity_definition_message() {
  CommodityDefinitionMessage commodity_definition_message_sent;
  CommodityDefinitionMessage commodity_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_commodity_definition_message(commodity_definition_message_sent, 0)
  :: pattern == 1 -> fill_commodity_definition_message(commodity_definition_message_sent, 32)
  :: pattern == 2 -> fill_commodity_definition_message(commodity_definition_message_sent, 255)
  :: else -> ramp_commodity_definition_message(commodity_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_commodity_definition_message(commodity_definition_message_sent);
    assert(at == 90);
    at = 0;
    decode_commodity_definition_message(commodity_definition_message_got);
    assert(at == 90);
    equal_commodity_definition_message(commodity_definition_message_got, commodity_definition_message_sent)
  }
}

/* Class Definition Message: encoded, read back, and compared */
proctype check_class_definition_message() {
  ClassDefinitionMessage class_definition_message_sent;
  ClassDefinitionMessage class_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_class_definition_message(class_definition_message_sent, 0)
  :: pattern == 1 -> fill_class_definition_message(class_definition_message_sent, 32)
  :: pattern == 2 -> fill_class_definition_message(class_definition_message_sent, 255)
  :: else -> ramp_class_definition_message(class_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_class_definition_message(class_definition_message_sent);
    assert(at == 114);
    at = 0;
    decode_class_definition_message(class_definition_message_got);
    assert(at == 114);
    equal_class_definition_message(class_definition_message_got, class_definition_message_sent)
  }
}

/* Series Definition Base Message: encoded, read back, and compared */
proctype check_series_definition_base_message() {
  SeriesDefinitionBaseMessage series_definition_base_message_sent;
  SeriesDefinitionBaseMessage series_definition_base_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_series_definition_base_message(series_definition_base_message_sent, 0)
  :: pattern == 1 -> fill_series_definition_base_message(series_definition_base_message_sent, 32)
  :: pattern == 2 -> fill_series_definition_base_message(series_definition_base_message_sent, 255)
  :: else -> ramp_series_definition_base_message(series_definition_base_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_series_definition_base_message(series_definition_base_message_sent);
    assert(at == 56);
    at = 0;
    decode_series_definition_base_message(series_definition_base_message_got);
    assert(at == 56);
    equal_series_definition_base_message(series_definition_base_message_got, series_definition_base_message_sent)
  }
}

/* Series Definition Extended Message: encoded, read back, and compared */
proctype check_series_definition_extended_message() {
  SeriesDefinitionExtendedMessage series_definition_extended_message_sent;
  SeriesDefinitionExtendedMessage series_definition_extended_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_series_definition_extended_message(series_definition_extended_message_sent, 0)
  :: pattern == 1 -> fill_series_definition_extended_message(series_definition_extended_message_sent, 32)
  :: pattern == 2 -> fill_series_definition_extended_message(series_definition_extended_message_sent, 255)
  :: else -> ramp_series_definition_extended_message(series_definition_extended_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_series_definition_extended_message(series_definition_extended_message_sent);
    assert(at == 100);
    at = 0;
    decode_series_definition_extended_message(series_definition_extended_message_got);
    assert(at == 100);
    equal_series_definition_extended_message(series_definition_extended_message_got, series_definition_extended_message_sent)
  }
}

/* Combination Definition Message: encoded, read back, and compared */
proctype check_combination_definition_message() {
  CombinationDefinitionMessage combination_definition_message_sent;
  CombinationDefinitionMessage combination_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_combination_definition_message(combination_definition_message_sent, 0)
  :: pattern == 1 -> fill_combination_definition_message(combination_definition_message_sent, 32)
  :: pattern == 2 -> fill_combination_definition_message(combination_definition_message_sent, 255)
  :: else -> ramp_combination_definition_message(combination_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_combination_definition_message(combination_definition_message_sent);
    assert(at == 16);
    at = 0;
    decode_combination_definition_message(combination_definition_message_got);
    assert(at == 16);
    equal_combination_definition_message(combination_definition_message_got, combination_definition_message_sent)
  }
}

/* Refresh Complete: encoded, read back, and compared */
proctype check_refresh_complete() {
  RefreshComplete refresh_complete_sent;
  RefreshComplete refresh_complete_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_complete(refresh_complete_sent, 0)
  :: pattern == 1 -> fill_refresh_complete(refresh_complete_sent, 32)
  :: pattern == 2 -> fill_refresh_complete(refresh_complete_sent, 255)
  :: else -> ramp_refresh_complete(refresh_complete_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_complete(refresh_complete_sent);
    assert(at == 4);
    at = 0;
    decode_refresh_complete(refresh_complete_got);
    assert(at == 4);
    equal_refresh_complete(refresh_complete_got, refresh_complete_sent)
  }
}

/* Market Status Message: encoded, read back, and compared */
proctype check_market_status_message() {
  MarketStatusMessage market_status_message_sent;
  MarketStatusMessage market_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_status_message(market_status_message_sent, 0)
  :: pattern == 1 -> fill_market_status_message(market_status_message_sent, 32)
  :: pattern == 2 -> fill_market_status_message(market_status_message_sent, 255)
  :: else -> ramp_market_status_message(market_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_status_message(market_status_message_sent);
    assert(at == 48);
    at = 0;
    decode_market_status_message(market_status_message_got);
    assert(at == 48);
    equal_market_status_message(market_status_message_got, market_status_message_sent)
  }
}

/* Series Status Message: encoded, read back, and compared */
proctype check_series_status_message() {
  SeriesStatusMessage series_status_message_sent;
  SeriesStatusMessage series_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_series_status_message(series_status_message_sent, 0)
  :: pattern == 1 -> fill_series_status_message(series_status_message_sent, 32)
  :: pattern == 2 -> fill_series_status_message(series_status_message_sent, 255)
  :: else -> ramp_series_status_message(series_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_series_status_message(series_status_message_sent);
    assert(at == 8);
    at = 0;
    decode_series_status_message(series_status_message_got);
    assert(at == 8);
    equal_series_status_message(series_status_message_got, series_status_message_sent)
  }
}

/* Commodity Status Message: encoded, read back, and compared */
proctype check_commodity_status_message() {
  CommodityStatusMessage commodity_status_message_sent;
  CommodityStatusMessage commodity_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_commodity_status_message(commodity_status_message_sent, 0)
  :: pattern == 1 -> fill_commodity_status_message(commodity_status_message_sent, 32)
  :: pattern == 2 -> fill_commodity_status_message(commodity_status_message_sent, 255)
  :: else -> ramp_commodity_status_message(commodity_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_commodity_status_message(commodity_status_message_sent);
    assert(at == 4);
    at = 0;
    decode_commodity_status_message(commodity_status_message_got);
    assert(at == 4);
    equal_commodity_status_message(commodity_status_message_got, commodity_status_message_sent)
  }
}

/* Trade Statistics Message: encoded, read back, and compared */
proctype check_trade_statistics_message() {
  TradeStatisticsMessage trade_statistics_message_sent;
  TradeStatisticsMessage trade_statistics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_statistics_message(trade_statistics_message_sent, 0)
  :: pattern == 1 -> fill_trade_statistics_message(trade_statistics_message_sent, 32)
  :: pattern == 2 -> fill_trade_statistics_message(trade_statistics_message_sent, 255)
  :: else -> ramp_trade_statistics_message(trade_statistics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_statistics_message(trade_statistics_message_sent);
    assert(at == 56);
    at = 0;
    decode_trade_statistics_message(trade_statistics_message_got);
    assert(at == 56);
    equal_trade_statistics_message(trade_statistics_message_got, trade_statistics_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_msg_header()
  :: run check_calculated_opening_price_message()
  :: run check_sequence_reset()
  :: run check_disaster_recovery_signal_message()
  :: run check_open_interest_message()
  :: run check_quote_request()
  :: run check_commodity_definition_message()
  :: run check_class_definition_message()
  :: run check_series_definition_base_message()
  :: run check_series_definition_extended_message()
  :: run check_combination_definition_message()
  :: run check_refresh_complete()
  :: run check_market_status_message()
  :: run check_series_status_message()
  :: run check_commodity_status_message()
  :: run check_trade_statistics_message()
  fi
}
