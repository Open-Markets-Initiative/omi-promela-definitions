/*
 * Hong Kong Exchanges and Clearing Orion Market Data Cash Standard Refresh
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
 *   - a run counted by a field
 *   - the dispatch that chooses a message by its type
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 48

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* Omd packet header (no payload compression; byte 3 is Filler) */
typedef PacketHeader {
  byte pkt_size[2];
  byte msg_count;
  byte filler;
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
  packet_header_record.filler = packet_header_value;
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
  packet_header_record.filler = (packet_header_base + 3 + 1) % 256;
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
  wire[at] = packet_header_record.filler; at = at + 1;
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
  packet_header_record.filler = wire[at]; at = at + 1;
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
  assert(packet_header_read.filler == packet_header_written.filler);
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

/* ---- Closing Price Message: 12 bytes ----------------------------------------- */

/* The Closing Price message is generated near the end of the business day for each security. If the closing price is not available, ClosingPrice is set to 0. NumberOfTrades is not populated for SS (OMD Securities Standard) clients. */
typedef ClosingPriceMessage {
  byte security_code[4];
  byte closing_price[4];
  byte number_of_trades[4]
};

int closing_price_message_at;

/* every byte of Closing Price Message set to one value */
inline fill_closing_price_message(closing_price_message_record, closing_price_message_value) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.security_code[closing_price_message_at] = closing_price_message_value; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.closing_price[closing_price_message_at] = closing_price_message_value; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.number_of_trades[closing_price_message_at] = closing_price_message_value; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_closing_price_message(closing_price_message_record, closing_price_message_base) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.security_code[closing_price_message_at] = (closing_price_message_base + 0 + closing_price_message_at + 1) % 256; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.closing_price[closing_price_message_at] = (closing_price_message_base + 4 + closing_price_message_at + 1) % 256; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.number_of_trades[closing_price_message_at] = (closing_price_message_base + 8 + closing_price_message_at + 1) % 256; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Closing Price Message to the wire, 12 bytes from where the cursor stands */
inline encode_closing_price_message(closing_price_message_record) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> wire[at] = closing_price_message_record.security_code[closing_price_message_at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> wire[at] = closing_price_message_record.closing_price[closing_price_message_at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> wire[at] = closing_price_message_record.number_of_trades[closing_price_message_at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Closing Price Message off the wire, 12 bytes from where the cursor stands */
inline decode_closing_price_message(closing_price_message_record) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.security_code[closing_price_message_at] = wire[at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.closing_price[closing_price_message_at] = wire[at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> closing_price_message_record.number_of_trades[closing_price_message_at] = wire[at]; at = at + 1; closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Closing Price Message is what was written, byte for byte */
inline equal_closing_price_message(closing_price_message_read, closing_price_message_written) {
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> assert(closing_price_message_read.security_code[closing_price_message_at] == closing_price_message_written.security_code[closing_price_message_at]); closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> assert(closing_price_message_read.closing_price[closing_price_message_at] == closing_price_message_written.closing_price[closing_price_message_at]); closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  closing_price_message_at = 0;
  do
  :: closing_price_message_at < 4 -> assert(closing_price_message_read.number_of_trades[closing_price_message_at] == closing_price_message_written.number_of_trades[closing_price_message_at]); closing_price_message_at = closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indicative Equilibrium Price Message: 16 bytes -------------------------- */

/* The Indicative Equilibrium Price (IEP) message is generated whenever there is change of the IEP or Indicative Equilibrium Volume (IEV) during Pre-Opening Session (POS) or Closing Auction Session (CAS). The IEP is 0 when IEP does not exist. */
typedef IndicativeEquilibriumPriceMessage {
  byte security_code[4];
  byte price[4];
  byte aggregate_quantity[8]
};

int indicative_equilibrium_price_message_at;

/* every byte of Indicative Equilibrium Price Message set to one value */
inline fill_indicative_equilibrium_price_message(indicative_equilibrium_price_message_record, indicative_equilibrium_price_message_value) {
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> indicative_equilibrium_price_message_record.security_code[indicative_equilibrium_price_message_at] = indicative_equilibrium_price_message_value; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> indicative_equilibrium_price_message_record.price[indicative_equilibrium_price_message_at] = indicative_equilibrium_price_message_value; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 8 -> indicative_equilibrium_price_message_record.aggregate_quantity[indicative_equilibrium_price_message_at] = indicative_equilibrium_price_message_value; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indicative Equilibrium Price Message set to where it lies, so a field read out of place says so */
inline ramp_indicative_equilibrium_price_message(indicative_equilibrium_price_message_record, indicative_equilibrium_price_message_base) {
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> indicative_equilibrium_price_message_record.security_code[indicative_equilibrium_price_message_at] = (indicative_equilibrium_price_message_base + 0 + indicative_equilibrium_price_message_at + 1) % 256; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> indicative_equilibrium_price_message_record.price[indicative_equilibrium_price_message_at] = (indicative_equilibrium_price_message_base + 4 + indicative_equilibrium_price_message_at + 1) % 256; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 8 -> indicative_equilibrium_price_message_record.aggregate_quantity[indicative_equilibrium_price_message_at] = (indicative_equilibrium_price_message_base + 8 + indicative_equilibrium_price_message_at + 1) % 256; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Equilibrium Price Message to the wire, 16 bytes from where the cursor stands */
inline encode_indicative_equilibrium_price_message(indicative_equilibrium_price_message_record) {
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> wire[at] = indicative_equilibrium_price_message_record.security_code[indicative_equilibrium_price_message_at]; at = at + 1; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> wire[at] = indicative_equilibrium_price_message_record.price[indicative_equilibrium_price_message_at]; at = at + 1; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 8 -> wire[at] = indicative_equilibrium_price_message_record.aggregate_quantity[indicative_equilibrium_price_message_at]; at = at + 1; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Equilibrium Price Message off the wire, 16 bytes from where the cursor stands */
inline decode_indicative_equilibrium_price_message(indicative_equilibrium_price_message_record) {
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> indicative_equilibrium_price_message_record.security_code[indicative_equilibrium_price_message_at] = wire[at]; at = at + 1; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> indicative_equilibrium_price_message_record.price[indicative_equilibrium_price_message_at] = wire[at]; at = at + 1; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 8 -> indicative_equilibrium_price_message_record.aggregate_quantity[indicative_equilibrium_price_message_at] = wire[at]; at = at + 1; indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indicative Equilibrium Price Message is what was written, byte for byte */
inline equal_indicative_equilibrium_price_message(indicative_equilibrium_price_message_read, indicative_equilibrium_price_message_written) {
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> assert(indicative_equilibrium_price_message_read.security_code[indicative_equilibrium_price_message_at] == indicative_equilibrium_price_message_written.security_code[indicative_equilibrium_price_message_at]); indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 4 -> assert(indicative_equilibrium_price_message_read.price[indicative_equilibrium_price_message_at] == indicative_equilibrium_price_message_written.price[indicative_equilibrium_price_message_at]); indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  indicative_equilibrium_price_message_at = 0;
  do
  :: indicative_equilibrium_price_message_at < 8 -> assert(indicative_equilibrium_price_message_read.aggregate_quantity[indicative_equilibrium_price_message_at] == indicative_equilibrium_price_message_written.aggregate_quantity[indicative_equilibrium_price_message_at]); indicative_equilibrium_price_message_at = indicative_equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Nominal Price Message: 8 bytes ------------------------------------------ */

/* The Nominal message may be generated when an order is added, deleted or modified in a book or when trade or trade cancel is performed. Before the first Nominal Price message, the nominal price should be the same as the previous closing price provided in Security Definition (11). */
typedef NominalPriceMessage {
  byte security_code[4];
  byte nominal_price[4]
};

int nominal_price_message_at;

/* every byte of Nominal Price Message set to one value */
inline fill_nominal_price_message(nominal_price_message_record, nominal_price_message_value) {
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> nominal_price_message_record.security_code[nominal_price_message_at] = nominal_price_message_value; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> nominal_price_message_record.nominal_price[nominal_price_message_at] = nominal_price_message_value; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Nominal Price Message set to where it lies, so a field read out of place says so */
inline ramp_nominal_price_message(nominal_price_message_record, nominal_price_message_base) {
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> nominal_price_message_record.security_code[nominal_price_message_at] = (nominal_price_message_base + 0 + nominal_price_message_at + 1) % 256; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> nominal_price_message_record.nominal_price[nominal_price_message_at] = (nominal_price_message_base + 4 + nominal_price_message_at + 1) % 256; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Nominal Price Message to the wire, 8 bytes from where the cursor stands */
inline encode_nominal_price_message(nominal_price_message_record) {
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> wire[at] = nominal_price_message_record.security_code[nominal_price_message_at]; at = at + 1; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> wire[at] = nominal_price_message_record.nominal_price[nominal_price_message_at]; at = at + 1; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Nominal Price Message off the wire, 8 bytes from where the cursor stands */
inline decode_nominal_price_message(nominal_price_message_record) {
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> nominal_price_message_record.security_code[nominal_price_message_at] = wire[at]; at = at + 1; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> nominal_price_message_record.nominal_price[nominal_price_message_at] = wire[at]; at = at + 1; nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Nominal Price Message is what was written, byte for byte */
inline equal_nominal_price_message(nominal_price_message_read, nominal_price_message_written) {
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> assert(nominal_price_message_read.security_code[nominal_price_message_at] == nominal_price_message_written.security_code[nominal_price_message_at]); nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  nominal_price_message_at = 0;
  do
  :: nominal_price_message_at < 4 -> assert(nominal_price_message_read.nominal_price[nominal_price_message_at] == nominal_price_message_written.nominal_price[nominal_price_message_at]); nominal_price_message_at = nominal_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Imbalance Message: 16 bytes --------------------------------------- */

/* The Order Imbalance message provides order imbalance information at the Indicative Equilibrium Price (IEP) during the Pre-Opening Session (POS) and Closing Auction Session (CAS). */
typedef OrderImbalanceMessage {
  byte security_code[4];
  byte order_imbalance_direction;
  byte filler_1;
  byte order_imbalance_quantity[8];
  byte filler_2[2]
};

int order_imbalance_message_at;

/* every byte of Order Imbalance Message set to one value */
inline fill_order_imbalance_message(order_imbalance_message_record, order_imbalance_message_value) {
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 4 -> order_imbalance_message_record.security_code[order_imbalance_message_at] = order_imbalance_message_value; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_record.order_imbalance_direction = order_imbalance_message_value;
  order_imbalance_message_record.filler_1 = order_imbalance_message_value;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 8 -> order_imbalance_message_record.order_imbalance_quantity[order_imbalance_message_at] = order_imbalance_message_value; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 2 -> order_imbalance_message_record.filler_2[order_imbalance_message_at] = order_imbalance_message_value; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Imbalance Message set to where it lies, so a field read out of place says so */
inline ramp_order_imbalance_message(order_imbalance_message_record, order_imbalance_message_base) {
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 4 -> order_imbalance_message_record.security_code[order_imbalance_message_at] = (order_imbalance_message_base + 0 + order_imbalance_message_at + 1) % 256; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_record.order_imbalance_direction = (order_imbalance_message_base + 4 + 1) % 256;
  order_imbalance_message_record.filler_1 = (order_imbalance_message_base + 5 + 1) % 256;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 8 -> order_imbalance_message_record.order_imbalance_quantity[order_imbalance_message_at] = (order_imbalance_message_base + 6 + order_imbalance_message_at + 1) % 256; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 2 -> order_imbalance_message_record.filler_2[order_imbalance_message_at] = (order_imbalance_message_base + 14 + order_imbalance_message_at + 1) % 256; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Imbalance Message to the wire, 16 bytes from where the cursor stands */
inline encode_order_imbalance_message(order_imbalance_message_record) {
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 4 -> wire[at] = order_imbalance_message_record.security_code[order_imbalance_message_at]; at = at + 1; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = order_imbalance_message_record.order_imbalance_direction; at = at + 1;
  wire[at] = order_imbalance_message_record.filler_1; at = at + 1;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 8 -> wire[at] = order_imbalance_message_record.order_imbalance_quantity[order_imbalance_message_at]; at = at + 1; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 2 -> wire[at] = order_imbalance_message_record.filler_2[order_imbalance_message_at]; at = at + 1; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Imbalance Message off the wire, 16 bytes from where the cursor stands */
inline decode_order_imbalance_message(order_imbalance_message_record) {
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 4 -> order_imbalance_message_record.security_code[order_imbalance_message_at] = wire[at]; at = at + 1; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_record.order_imbalance_direction = wire[at]; at = at + 1;
  order_imbalance_message_record.filler_1 = wire[at]; at = at + 1;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 8 -> order_imbalance_message_record.order_imbalance_quantity[order_imbalance_message_at] = wire[at]; at = at + 1; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 2 -> order_imbalance_message_record.filler_2[order_imbalance_message_at] = wire[at]; at = at + 1; order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Imbalance Message is what was written, byte for byte */
inline equal_order_imbalance_message(order_imbalance_message_read, order_imbalance_message_written) {
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 4 -> assert(order_imbalance_message_read.security_code[order_imbalance_message_at] == order_imbalance_message_written.security_code[order_imbalance_message_at]); order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  assert(order_imbalance_message_read.order_imbalance_direction == order_imbalance_message_written.order_imbalance_direction);
  assert(order_imbalance_message_read.filler_1 == order_imbalance_message_written.filler_1);
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 8 -> assert(order_imbalance_message_read.order_imbalance_quantity[order_imbalance_message_at] == order_imbalance_message_written.order_imbalance_quantity[order_imbalance_message_at]); order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  order_imbalance_message_at = 0;
  do
  :: order_imbalance_message_at < 2 -> assert(order_imbalance_message_read.filler_2[order_imbalance_message_at] == order_imbalance_message_written.filler_2[order_imbalance_message_at]); order_imbalance_message_at = order_imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Definition Message: 36 bytes ------------------------------------- */

/* The Market Definition message is generated at the start of the business day for each market segment. */
typedef MarketDefinitionMessage {
  byte market_code[4];
  byte market_name[25];
  byte currency_code[3];
  byte number_of_securities[4]
};

int market_definition_message_at;

/* every byte of Market Definition Message set to one value */
inline fill_market_definition_message(market_definition_message_record, market_definition_message_value) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.market_code[market_definition_message_at] = market_definition_message_value; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> market_definition_message_record.market_name[market_definition_message_at] = market_definition_message_value; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> market_definition_message_record.currency_code[market_definition_message_at] = market_definition_message_value; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.number_of_securities[market_definition_message_at] = market_definition_message_value; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Definition Message set to where it lies, so a field read out of place says so */
inline ramp_market_definition_message(market_definition_message_record, market_definition_message_base) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.market_code[market_definition_message_at] = (market_definition_message_base + 0 + market_definition_message_at + 1) % 256; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> market_definition_message_record.market_name[market_definition_message_at] = (market_definition_message_base + 4 + market_definition_message_at + 1) % 256; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> market_definition_message_record.currency_code[market_definition_message_at] = (market_definition_message_base + 29 + market_definition_message_at + 1) % 256; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.number_of_securities[market_definition_message_at] = (market_definition_message_base + 32 + market_definition_message_at + 1) % 256; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Definition Message to the wire, 36 bytes from where the cursor stands */
inline encode_market_definition_message(market_definition_message_record) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> wire[at] = market_definition_message_record.market_code[market_definition_message_at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> wire[at] = market_definition_message_record.market_name[market_definition_message_at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> wire[at] = market_definition_message_record.currency_code[market_definition_message_at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> wire[at] = market_definition_message_record.number_of_securities[market_definition_message_at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Definition Message off the wire, 36 bytes from where the cursor stands */
inline decode_market_definition_message(market_definition_message_record) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.market_code[market_definition_message_at] = wire[at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> market_definition_message_record.market_name[market_definition_message_at] = wire[at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> market_definition_message_record.currency_code[market_definition_message_at] = wire[at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.number_of_securities[market_definition_message_at] = wire[at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Definition Message is what was written, byte for byte */
inline equal_market_definition_message(market_definition_message_read, market_definition_message_written) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> assert(market_definition_message_read.market_code[market_definition_message_at] == market_definition_message_written.market_code[market_definition_message_at]); market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> assert(market_definition_message_read.market_name[market_definition_message_at] == market_definition_message_written.market_name[market_definition_message_at]); market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> assert(market_definition_message_read.currency_code[market_definition_message_at] == market_definition_message_written.currency_code[market_definition_message_at]); market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> assert(market_definition_message_read.number_of_securities[market_definition_message_at] == market_definition_message_written.number_of_securities[market_definition_message_at]); market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Face Value Composite: 9 bytes ------------------------------------------- */

/* Bond face value scaled at runtime by DecimalsInFaceValue. 0 mantissa means Not available. */
typedef FaceValueComposite {
  byte face_value[8];
  byte decimals_in_face_value
};

int face_value_composite_at;

/* every byte of Face Value Composite set to one value */
inline fill_face_value_composite(face_value_composite_record, face_value_composite_value) {
  face_value_composite_at = 0;
  do
  :: face_value_composite_at < 8 -> face_value_composite_record.face_value[face_value_composite_at] = face_value_composite_value; face_value_composite_at = face_value_composite_at + 1
  :: else -> break
  od;
  face_value_composite_record.decimals_in_face_value = face_value_composite_value;
  skip
}

/* each byte of Face Value Composite set to where it lies, so a field read out of place says so */
inline ramp_face_value_composite(face_value_composite_record, face_value_composite_base) {
  face_value_composite_at = 0;
  do
  :: face_value_composite_at < 8 -> face_value_composite_record.face_value[face_value_composite_at] = (face_value_composite_base + 0 + face_value_composite_at + 1) % 256; face_value_composite_at = face_value_composite_at + 1
  :: else -> break
  od;
  face_value_composite_record.decimals_in_face_value = (face_value_composite_base + 8 + 1) % 256;
  skip
}

/* Face Value Composite to the wire, 9 bytes from where the cursor stands */
inline encode_face_value_composite(face_value_composite_record) {
  face_value_composite_at = 0;
  do
  :: face_value_composite_at < 8 -> wire[at] = face_value_composite_record.face_value[face_value_composite_at]; at = at + 1; face_value_composite_at = face_value_composite_at + 1
  :: else -> break
  od;
  wire[at] = face_value_composite_record.decimals_in_face_value; at = at + 1;
  skip
}

/* Face Value Composite off the wire, 9 bytes from where the cursor stands */
inline decode_face_value_composite(face_value_composite_record) {
  face_value_composite_at = 0;
  do
  :: face_value_composite_at < 8 -> face_value_composite_record.face_value[face_value_composite_at] = wire[at]; at = at + 1; face_value_composite_at = face_value_composite_at + 1
  :: else -> break
  od;
  face_value_composite_record.decimals_in_face_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Face Value Composite is what was written, byte for byte */
inline equal_face_value_composite(face_value_composite_read, face_value_composite_written) {
  face_value_composite_at = 0;
  do
  :: face_value_composite_at < 8 -> assert(face_value_composite_read.face_value[face_value_composite_at] == face_value_composite_written.face_value[face_value_composite_at]); face_value_composite_at = face_value_composite_at + 1
  :: else -> break
  od;
  assert(face_value_composite_read.decimals_in_face_value == face_value_composite_written.decimals_in_face_value);
  skip
}

/* ---- Call Price Composite: 5 bytes ------------------------------------------- */

/* CBBC call price scaled at runtime by DecimalsInCallPrice. 0 mantissa means Not available. */
typedef CallPriceComposite {
  byte call_price[4];
  byte decimals_in_call_price
};

int call_price_composite_at;

/* every byte of Call Price Composite set to one value */
inline fill_call_price_composite(call_price_composite_record, call_price_composite_value) {
  call_price_composite_at = 0;
  do
  :: call_price_composite_at < 4 -> call_price_composite_record.call_price[call_price_composite_at] = call_price_composite_value; call_price_composite_at = call_price_composite_at + 1
  :: else -> break
  od;
  call_price_composite_record.decimals_in_call_price = call_price_composite_value;
  skip
}

/* each byte of Call Price Composite set to where it lies, so a field read out of place says so */
inline ramp_call_price_composite(call_price_composite_record, call_price_composite_base) {
  call_price_composite_at = 0;
  do
  :: call_price_composite_at < 4 -> call_price_composite_record.call_price[call_price_composite_at] = (call_price_composite_base + 0 + call_price_composite_at + 1) % 256; call_price_composite_at = call_price_composite_at + 1
  :: else -> break
  od;
  call_price_composite_record.decimals_in_call_price = (call_price_composite_base + 4 + 1) % 256;
  skip
}

/* Call Price Composite to the wire, 5 bytes from where the cursor stands */
inline encode_call_price_composite(call_price_composite_record) {
  call_price_composite_at = 0;
  do
  :: call_price_composite_at < 4 -> wire[at] = call_price_composite_record.call_price[call_price_composite_at]; at = at + 1; call_price_composite_at = call_price_composite_at + 1
  :: else -> break
  od;
  wire[at] = call_price_composite_record.decimals_in_call_price; at = at + 1;
  skip
}

/* Call Price Composite off the wire, 5 bytes from where the cursor stands */
inline decode_call_price_composite(call_price_composite_record) {
  call_price_composite_at = 0;
  do
  :: call_price_composite_at < 4 -> call_price_composite_record.call_price[call_price_composite_at] = wire[at]; at = at + 1; call_price_composite_at = call_price_composite_at + 1
  :: else -> break
  od;
  call_price_composite_record.decimals_in_call_price = wire[at]; at = at + 1;
  skip
}

/* what was read of Call Price Composite is what was written, byte for byte */
inline equal_call_price_composite(call_price_composite_read, call_price_composite_written) {
  call_price_composite_at = 0;
  do
  :: call_price_composite_at < 4 -> assert(call_price_composite_read.call_price[call_price_composite_at] == call_price_composite_written.call_price[call_price_composite_at]); call_price_composite_at = call_price_composite_at + 1
  :: else -> break
  od;
  assert(call_price_composite_read.decimals_in_call_price == call_price_composite_written.decimals_in_call_price);
  skip
}

/* ---- Entitlement Composite: 5 bytes ------------------------------------------ */

/* Warrant entitlement scaled at runtime by DecimalsInEntitlement. 0 mantissa means Not available. */
typedef EntitlementComposite {
  byte entitlement[4];
  byte decimals_in_entitlement
};

int entitlement_composite_at;

/* every byte of Entitlement Composite set to one value */
inline fill_entitlement_composite(entitlement_composite_record, entitlement_composite_value) {
  entitlement_composite_at = 0;
  do
  :: entitlement_composite_at < 4 -> entitlement_composite_record.entitlement[entitlement_composite_at] = entitlement_composite_value; entitlement_composite_at = entitlement_composite_at + 1
  :: else -> break
  od;
  entitlement_composite_record.decimals_in_entitlement = entitlement_composite_value;
  skip
}

/* each byte of Entitlement Composite set to where it lies, so a field read out of place says so */
inline ramp_entitlement_composite(entitlement_composite_record, entitlement_composite_base) {
  entitlement_composite_at = 0;
  do
  :: entitlement_composite_at < 4 -> entitlement_composite_record.entitlement[entitlement_composite_at] = (entitlement_composite_base + 0 + entitlement_composite_at + 1) % 256; entitlement_composite_at = entitlement_composite_at + 1
  :: else -> break
  od;
  entitlement_composite_record.decimals_in_entitlement = (entitlement_composite_base + 4 + 1) % 256;
  skip
}

/* Entitlement Composite to the wire, 5 bytes from where the cursor stands */
inline encode_entitlement_composite(entitlement_composite_record) {
  entitlement_composite_at = 0;
  do
  :: entitlement_composite_at < 4 -> wire[at] = entitlement_composite_record.entitlement[entitlement_composite_at]; at = at + 1; entitlement_composite_at = entitlement_composite_at + 1
  :: else -> break
  od;
  wire[at] = entitlement_composite_record.decimals_in_entitlement; at = at + 1;
  skip
}

/* Entitlement Composite off the wire, 5 bytes from where the cursor stands */
inline decode_entitlement_composite(entitlement_composite_record) {
  entitlement_composite_at = 0;
  do
  :: entitlement_composite_at < 4 -> entitlement_composite_record.entitlement[entitlement_composite_at] = wire[at]; at = at + 1; entitlement_composite_at = entitlement_composite_at + 1
  :: else -> break
  od;
  entitlement_composite_record.decimals_in_entitlement = wire[at]; at = at + 1;
  skip
}

/* what was read of Entitlement Composite is what was written, byte for byte */
inline equal_entitlement_composite(entitlement_composite_read, entitlement_composite_written) {
  entitlement_composite_at = 0;
  do
  :: entitlement_composite_at < 4 -> assert(entitlement_composite_read.entitlement[entitlement_composite_at] == entitlement_composite_written.entitlement[entitlement_composite_at]); entitlement_composite_at = entitlement_composite_at + 1
  :: else -> break
  od;
  assert(entitlement_composite_read.decimals_in_entitlement == entitlement_composite_written.decimals_in_entitlement);
  skip
}

/* ---- Currency Rate Message: 12 bytes ----------------------------------------- */

/* The Currency Rate message provides the foreign exchange conversion rates between various foreign currencies and the Hong Kong dollar. */
typedef CurrencyRateMessage {
  byte currency_code[3];
  byte filler_1;
  byte currency_factor[2];
  byte filler_2[2];
  byte currency_rate[4]
};

int currency_rate_message_at;

/* every byte of Currency Rate Message set to one value */
inline fill_currency_rate_message(currency_rate_message_record, currency_rate_message_value) {
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 3 -> currency_rate_message_record.currency_code[currency_rate_message_at] = currency_rate_message_value; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_record.filler_1 = currency_rate_message_value;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> currency_rate_message_record.currency_factor[currency_rate_message_at] = currency_rate_message_value; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> currency_rate_message_record.filler_2[currency_rate_message_at] = currency_rate_message_value; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 4 -> currency_rate_message_record.currency_rate[currency_rate_message_at] = currency_rate_message_value; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Currency Rate Message set to where it lies, so a field read out of place says so */
inline ramp_currency_rate_message(currency_rate_message_record, currency_rate_message_base) {
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 3 -> currency_rate_message_record.currency_code[currency_rate_message_at] = (currency_rate_message_base + 0 + currency_rate_message_at + 1) % 256; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_record.filler_1 = (currency_rate_message_base + 3 + 1) % 256;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> currency_rate_message_record.currency_factor[currency_rate_message_at] = (currency_rate_message_base + 4 + currency_rate_message_at + 1) % 256; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> currency_rate_message_record.filler_2[currency_rate_message_at] = (currency_rate_message_base + 6 + currency_rate_message_at + 1) % 256; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 4 -> currency_rate_message_record.currency_rate[currency_rate_message_at] = (currency_rate_message_base + 8 + currency_rate_message_at + 1) % 256; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* Currency Rate Message to the wire, 12 bytes from where the cursor stands */
inline encode_currency_rate_message(currency_rate_message_record) {
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 3 -> wire[at] = currency_rate_message_record.currency_code[currency_rate_message_at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  wire[at] = currency_rate_message_record.filler_1; at = at + 1;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> wire[at] = currency_rate_message_record.currency_factor[currency_rate_message_at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> wire[at] = currency_rate_message_record.filler_2[currency_rate_message_at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 4 -> wire[at] = currency_rate_message_record.currency_rate[currency_rate_message_at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* Currency Rate Message off the wire, 12 bytes from where the cursor stands */
inline decode_currency_rate_message(currency_rate_message_record) {
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 3 -> currency_rate_message_record.currency_code[currency_rate_message_at] = wire[at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_record.filler_1 = wire[at]; at = at + 1;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> currency_rate_message_record.currency_factor[currency_rate_message_at] = wire[at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> currency_rate_message_record.filler_2[currency_rate_message_at] = wire[at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 4 -> currency_rate_message_record.currency_rate[currency_rate_message_at] = wire[at]; at = at + 1; currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Currency Rate Message is what was written, byte for byte */
inline equal_currency_rate_message(currency_rate_message_read, currency_rate_message_written) {
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 3 -> assert(currency_rate_message_read.currency_code[currency_rate_message_at] == currency_rate_message_written.currency_code[currency_rate_message_at]); currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  assert(currency_rate_message_read.filler_1 == currency_rate_message_written.filler_1);
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> assert(currency_rate_message_read.currency_factor[currency_rate_message_at] == currency_rate_message_written.currency_factor[currency_rate_message_at]); currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 2 -> assert(currency_rate_message_read.filler_2[currency_rate_message_at] == currency_rate_message_written.filler_2[currency_rate_message_at]); currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  currency_rate_message_at = 0;
  do
  :: currency_rate_message_at < 4 -> assert(currency_rate_message_read.currency_rate[currency_rate_message_at] == currency_rate_message_written.currency_rate[currency_rate_message_at]); currency_rate_message_at = currency_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reference Price Message: 16 bytes --------------------------------------- */

/* Reference price, lower and upper price limits for order input during an applicable auction session (POS or CAS). Sent again when there is any change. */
typedef ReferencePriceMessage {
  byte security_code[4];
  byte reference_price[4];
  byte lower_price[4];
  byte upper_price[4]
};

int reference_price_message_at;

/* every byte of Reference Price Message set to one value */
inline fill_reference_price_message(reference_price_message_record, reference_price_message_value) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.security_code[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.reference_price[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.lower_price[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.upper_price[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reference Price Message set to where it lies, so a field read out of place says so */
inline ramp_reference_price_message(reference_price_message_record, reference_price_message_base) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.security_code[reference_price_message_at] = (reference_price_message_base + 0 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.reference_price[reference_price_message_at] = (reference_price_message_base + 4 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.lower_price[reference_price_message_at] = (reference_price_message_base + 8 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.upper_price[reference_price_message_at] = (reference_price_message_base + 12 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reference Price Message to the wire, 16 bytes from where the cursor stands */
inline encode_reference_price_message(reference_price_message_record) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.security_code[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.reference_price[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.lower_price[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.upper_price[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reference Price Message off the wire, 16 bytes from where the cursor stands */
inline decode_reference_price_message(reference_price_message_record) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.security_code[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.reference_price[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.lower_price[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.upper_price[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reference Price Message is what was written, byte for byte */
inline equal_reference_price_message(reference_price_message_read, reference_price_message_written) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.security_code[reference_price_message_at] == reference_price_message_written.security_code[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.reference_price[reference_price_message_at] == reference_price_message_written.reference_price[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.lower_price[reference_price_message_at] == reference_price_message_written.lower_price[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.upper_price[reference_price_message_at] == reference_price_message_written.upper_price[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Refresh Complete Message: 4 bytes --------------------------------------- */

/* This message is published to mark the end of a refresh. */
typedef RefreshCompleteMessage {
  byte last_seq_num[4]
};

int refresh_complete_message_at;

/* every byte of Refresh Complete Message set to one value */
inline fill_refresh_complete_message(refresh_complete_message_record, refresh_complete_message_value) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> refresh_complete_message_record.last_seq_num[refresh_complete_message_at] = refresh_complete_message_value; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Complete Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_complete_message(refresh_complete_message_record, refresh_complete_message_base) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> refresh_complete_message_record.last_seq_num[refresh_complete_message_at] = (refresh_complete_message_base + 0 + refresh_complete_message_at + 1) % 256; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complete Message to the wire, 4 bytes from where the cursor stands */
inline encode_refresh_complete_message(refresh_complete_message_record) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> wire[at] = refresh_complete_message_record.last_seq_num[refresh_complete_message_at]; at = at + 1; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complete Message off the wire, 4 bytes from where the cursor stands */
inline decode_refresh_complete_message(refresh_complete_message_record) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> refresh_complete_message_record.last_seq_num[refresh_complete_message_at] = wire[at]; at = at + 1; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Complete Message is what was written, byte for byte */
inline equal_refresh_complete_message(refresh_complete_message_read, refresh_complete_message_written) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> assert(refresh_complete_message_read.last_seq_num[refresh_complete_message_at] == refresh_complete_message_written.last_seq_num[refresh_complete_message_at]); refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Statistics Message: 48 bytes -------------------------------------------- */

/* The Statistics message provides statistics including volume-weighted average price and turnover. Generated (excluding overseas trades) once after CTS/auction match, manual trade, odd lot trade, or trade cancel. VWAP is not populated for SS (OMD Securities Standard) clients. */
typedef StatisticsMessage {
  byte security_code[4];
  byte shares_traded[8];
  byte turnover[8];
  byte high_price[4];
  byte low_price[4];
  byte last_price[4];
  byte vwap[4];
  byte short_sell_shares_traded[4];
  byte short_sell_turnover[8]
};

int statistics_message_at;

/* every byte of Statistics Message set to one value */
inline fill_statistics_message(statistics_message_record, statistics_message_value) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.security_code[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.shares_traded[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.high_price[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.low_price[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.last_price[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.vwap[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.short_sell_shares_traded[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.short_sell_turnover[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_statistics_message(statistics_message_record, statistics_message_base) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.security_code[statistics_message_at] = (statistics_message_base + 0 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.shares_traded[statistics_message_at] = (statistics_message_base + 4 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = (statistics_message_base + 12 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.high_price[statistics_message_at] = (statistics_message_base + 20 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.low_price[statistics_message_at] = (statistics_message_base + 24 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.last_price[statistics_message_at] = (statistics_message_base + 28 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.vwap[statistics_message_at] = (statistics_message_base + 32 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.short_sell_shares_traded[statistics_message_at] = (statistics_message_base + 36 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.short_sell_turnover[statistics_message_at] = (statistics_message_base + 40 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Message to the wire, 48 bytes from where the cursor stands */
inline encode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.security_code[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.shares_traded[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.turnover[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.high_price[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.low_price[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.last_price[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.vwap[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.short_sell_shares_traded[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.short_sell_turnover[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Message off the wire, 48 bytes from where the cursor stands */
inline decode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.security_code[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.shares_traded[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.high_price[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.low_price[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.last_price[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.vwap[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.short_sell_shares_traded[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.short_sell_turnover[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Statistics Message is what was written, byte for byte */
inline equal_statistics_message(statistics_message_read, statistics_message_written) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.security_code[statistics_message_at] == statistics_message_written.security_code[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.shares_traded[statistics_message_at] == statistics_message_written.shares_traded[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.turnover[statistics_message_at] == statistics_message_written.turnover[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.high_price[statistics_message_at] == statistics_message_written.high_price[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.low_price[statistics_message_at] == statistics_message_written.low_price[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.last_price[statistics_message_at] == statistics_message_written.last_price[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.vwap[statistics_message_at] == statistics_message_written.vwap[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.short_sell_shares_traded[statistics_message_at] == statistics_message_written.short_sell_shares_traded[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.short_sell_turnover[statistics_message_at] == statistics_message_written.short_sell_turnover[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Turnover Message: 16 bytes --------------------------------------- */

/* The Market Turnover message contains the total turnover (excluding overseas trades) for all securities on a given market segment for a given trading currency. When CurrencyCode is blank, the turnover represents the total for all trading currencies, expressed in HKD. Updates disseminated around every 2 seconds during trading hours. */
typedef MarketTurnoverMessage {
  byte market_code[4];
  byte currency_code[3];
  byte filler_1;
  byte turnover[8]
};

int market_turnover_message_at;

/* every byte of Market Turnover Message set to one value */
inline fill_market_turnover_message(market_turnover_message_record, market_turnover_message_value) {
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 4 -> market_turnover_message_record.market_code[market_turnover_message_at] = market_turnover_message_value; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 3 -> market_turnover_message_record.currency_code[market_turnover_message_at] = market_turnover_message_value; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_record.filler_1 = market_turnover_message_value;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 8 -> market_turnover_message_record.turnover[market_turnover_message_at] = market_turnover_message_value; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Turnover Message set to where it lies, so a field read out of place says so */
inline ramp_market_turnover_message(market_turnover_message_record, market_turnover_message_base) {
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 4 -> market_turnover_message_record.market_code[market_turnover_message_at] = (market_turnover_message_base + 0 + market_turnover_message_at + 1) % 256; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 3 -> market_turnover_message_record.currency_code[market_turnover_message_at] = (market_turnover_message_base + 4 + market_turnover_message_at + 1) % 256; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_record.filler_1 = (market_turnover_message_base + 7 + 1) % 256;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 8 -> market_turnover_message_record.turnover[market_turnover_message_at] = (market_turnover_message_base + 8 + market_turnover_message_at + 1) % 256; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Turnover Message to the wire, 16 bytes from where the cursor stands */
inline encode_market_turnover_message(market_turnover_message_record) {
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 4 -> wire[at] = market_turnover_message_record.market_code[market_turnover_message_at]; at = at + 1; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 3 -> wire[at] = market_turnover_message_record.currency_code[market_turnover_message_at]; at = at + 1; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  wire[at] = market_turnover_message_record.filler_1; at = at + 1;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 8 -> wire[at] = market_turnover_message_record.turnover[market_turnover_message_at]; at = at + 1; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Turnover Message off the wire, 16 bytes from where the cursor stands */
inline decode_market_turnover_message(market_turnover_message_record) {
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 4 -> market_turnover_message_record.market_code[market_turnover_message_at] = wire[at]; at = at + 1; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 3 -> market_turnover_message_record.currency_code[market_turnover_message_at] = wire[at]; at = at + 1; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_record.filler_1 = wire[at]; at = at + 1;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 8 -> market_turnover_message_record.turnover[market_turnover_message_at] = wire[at]; at = at + 1; market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Turnover Message is what was written, byte for byte */
inline equal_market_turnover_message(market_turnover_message_read, market_turnover_message_written) {
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 4 -> assert(market_turnover_message_read.market_code[market_turnover_message_at] == market_turnover_message_written.market_code[market_turnover_message_at]); market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 3 -> assert(market_turnover_message_read.currency_code[market_turnover_message_at] == market_turnover_message_written.currency_code[market_turnover_message_at]); market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  assert(market_turnover_message_read.filler_1 == market_turnover_message_written.filler_1);
  market_turnover_message_at = 0;
  do
  :: market_turnover_message_at < 8 -> assert(market_turnover_message_read.turnover[market_turnover_message_at] == market_turnover_message_written.turnover[market_turnover_message_at]); market_turnover_message_at = market_turnover_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Yield Message: 8 bytes -------------------------------------------------- */

/* The Yield message is generated for bond securities when their yield percentage changes. */
typedef YieldMessage {
  byte security_code[4];
  byte yield[4]
};

int yield_message_at;

/* every byte of Yield Message set to one value */
inline fill_yield_message(yield_message_record, yield_message_value) {
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> yield_message_record.security_code[yield_message_at] = yield_message_value; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> yield_message_record.yield[yield_message_at] = yield_message_value; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Yield Message set to where it lies, so a field read out of place says so */
inline ramp_yield_message(yield_message_record, yield_message_base) {
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> yield_message_record.security_code[yield_message_at] = (yield_message_base + 0 + yield_message_at + 1) % 256; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> yield_message_record.yield[yield_message_at] = (yield_message_base + 4 + yield_message_at + 1) % 256; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  skip
}

/* Yield Message to the wire, 8 bytes from where the cursor stands */
inline encode_yield_message(yield_message_record) {
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> wire[at] = yield_message_record.security_code[yield_message_at]; at = at + 1; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> wire[at] = yield_message_record.yield[yield_message_at]; at = at + 1; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  skip
}

/* Yield Message off the wire, 8 bytes from where the cursor stands */
inline decode_yield_message(yield_message_record) {
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> yield_message_record.security_code[yield_message_at] = wire[at]; at = at + 1; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> yield_message_record.yield[yield_message_at] = wire[at]; at = at + 1; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Yield Message is what was written, byte for byte */
inline equal_yield_message(yield_message_read, yield_message_written) {
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> assert(yield_message_read.security_code[yield_message_at] == yield_message_written.security_code[yield_message_at]); yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  yield_message_at = 0;
  do
  :: yield_message_at < 4 -> assert(yield_message_read.yield[yield_message_at] == yield_message_written.yield[yield_message_at]); yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Session Status Message: 28 bytes -------------------------------- */

/* The Trading Session Status provides information on the status of a market segment. It is sent whenever there is change of trading session. This message may be sent on a separate multicast channel from order and trade data and therefore may not be synchronized. */
typedef TradingSessionStatusMessage {
  byte market_code[4];
  byte filler_1;
  byte trading_session_sub_id;
  byte trading_ses_status;
  byte trading_ses_control_flag;
  byte filler_4[4];
  byte start_date_time[8];
  byte end_date_time[8]
};

int trading_session_status_message_at;

/* every byte of Trading Session Status Message set to one value */
inline fill_trading_session_status_message(trading_session_status_message_record, trading_session_status_message_value) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.market_code[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.filler_1 = trading_session_status_message_value;
  trading_session_status_message_record.trading_session_sub_id = trading_session_status_message_value;
  trading_session_status_message_record.trading_ses_status = trading_session_status_message_value;
  trading_session_status_message_record.trading_ses_control_flag = trading_session_status_message_value;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.filler_4[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.start_date_time[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.end_date_time[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Session Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_session_status_message(trading_session_status_message_record, trading_session_status_message_base) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.market_code[trading_session_status_message_at] = (trading_session_status_message_base + 0 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.filler_1 = (trading_session_status_message_base + 4 + 1) % 256;
  trading_session_status_message_record.trading_session_sub_id = (trading_session_status_message_base + 5 + 1) % 256;
  trading_session_status_message_record.trading_ses_status = (trading_session_status_message_base + 6 + 1) % 256;
  trading_session_status_message_record.trading_ses_control_flag = (trading_session_status_message_base + 7 + 1) % 256;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.filler_4[trading_session_status_message_at] = (trading_session_status_message_base + 8 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.start_date_time[trading_session_status_message_at] = (trading_session_status_message_base + 12 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.end_date_time[trading_session_status_message_at] = (trading_session_status_message_base + 20 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Session Status Message to the wire, 28 bytes from where the cursor stands */
inline encode_trading_session_status_message(trading_session_status_message_record) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> wire[at] = trading_session_status_message_record.market_code[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_session_status_message_record.filler_1; at = at + 1;
  wire[at] = trading_session_status_message_record.trading_session_sub_id; at = at + 1;
  wire[at] = trading_session_status_message_record.trading_ses_status; at = at + 1;
  wire[at] = trading_session_status_message_record.trading_ses_control_flag; at = at + 1;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> wire[at] = trading_session_status_message_record.filler_4[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> wire[at] = trading_session_status_message_record.start_date_time[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> wire[at] = trading_session_status_message_record.end_date_time[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Session Status Message off the wire, 28 bytes from where the cursor stands */
inline decode_trading_session_status_message(trading_session_status_message_record) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.market_code[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.filler_1 = wire[at]; at = at + 1;
  trading_session_status_message_record.trading_session_sub_id = wire[at]; at = at + 1;
  trading_session_status_message_record.trading_ses_status = wire[at]; at = at + 1;
  trading_session_status_message_record.trading_ses_control_flag = wire[at]; at = at + 1;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.filler_4[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.start_date_time[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.end_date_time[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Session Status Message is what was written, byte for byte */
inline equal_trading_session_status_message(trading_session_status_message_read, trading_session_status_message_written) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> assert(trading_session_status_message_read.market_code[trading_session_status_message_at] == trading_session_status_message_written.market_code[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  assert(trading_session_status_message_read.filler_1 == trading_session_status_message_written.filler_1);
  assert(trading_session_status_message_read.trading_session_sub_id == trading_session_status_message_written.trading_session_sub_id);
  assert(trading_session_status_message_read.trading_ses_status == trading_session_status_message_written.trading_ses_status);
  assert(trading_session_status_message_read.trading_ses_control_flag == trading_session_status_message_written.trading_ses_control_flag);
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> assert(trading_session_status_message_read.filler_4[trading_session_status_message_at] == trading_session_status_message_written.filler_4[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> assert(trading_session_status_message_read.start_date_time[trading_session_status_message_at] == trading_session_status_message_written.start_date_time[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> assert(trading_session_status_message_read.end_date_time[trading_session_status_message_at] == trading_session_status_message_written.end_date_time[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Status Message: 8 bytes ---------------------------------------- */

/* The Security Status message is generated at the start of the business day if the security is not available for trading, and whenever a security state changes. */
typedef SecurityStatusMessage {
  byte security_code[4];
  byte suspension_indicator;
  byte filler_3[3]
};

int security_status_message_at;

/* every byte of Security Status Message set to one value */
inline fill_security_status_message(security_status_message_record, security_status_message_value) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.security_code[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.suspension_indicator = security_status_message_value;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> security_status_message_record.filler_3[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Status Message set to where it lies, so a field read out of place says so */
inline ramp_security_status_message(security_status_message_record, security_status_message_base) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.security_code[security_status_message_at] = (security_status_message_base + 0 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.suspension_indicator = (security_status_message_base + 4 + 1) % 256;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> security_status_message_record.filler_3[security_status_message_at] = (security_status_message_base + 5 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Status Message to the wire, 8 bytes from where the cursor stands */
inline encode_security_status_message(security_status_message_record) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.security_code[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  wire[at] = security_status_message_record.suspension_indicator; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> wire[at] = security_status_message_record.filler_3[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Status Message off the wire, 8 bytes from where the cursor stands */
inline decode_security_status_message(security_status_message_record) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.security_code[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.suspension_indicator = wire[at]; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> security_status_message_record.filler_3[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Status Message is what was written, byte for byte */
inline equal_security_status_message(security_status_message_read, security_status_message_written) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.security_code[security_status_message_at] == security_status_message_written.security_code[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  assert(security_status_message_read.suspension_indicator == security_status_message_written.suspension_indicator);
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> assert(security_status_message_read.filler_3[security_status_message_at] == security_status_message_written.filler_3[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Vcm Trigger Message: 32 bytes ------------------------------------------- */

/* The VCM Trigger message is generated whenever a cooling off period is triggered by Volatility Control Mechanism (VCM). */
typedef VcmTriggerMessage {
  byte security_code[4];
  byte cooling_off_start_time[8];
  byte cooling_off_end_time[8];
  byte vcm_reference_price[4];
  byte vcm_lower_price[4];
  byte vcm_upper_price[4]
};

int vcm_trigger_message_at;

/* every byte of Vcm Trigger Message set to one value */
inline fill_vcm_trigger_message(vcm_trigger_message_record, vcm_trigger_message_value) {
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.security_code[vcm_trigger_message_at] = vcm_trigger_message_value; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> vcm_trigger_message_record.cooling_off_start_time[vcm_trigger_message_at] = vcm_trigger_message_value; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> vcm_trigger_message_record.cooling_off_end_time[vcm_trigger_message_at] = vcm_trigger_message_value; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_reference_price[vcm_trigger_message_at] = vcm_trigger_message_value; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_lower_price[vcm_trigger_message_at] = vcm_trigger_message_value; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_upper_price[vcm_trigger_message_at] = vcm_trigger_message_value; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Vcm Trigger Message set to where it lies, so a field read out of place says so */
inline ramp_vcm_trigger_message(vcm_trigger_message_record, vcm_trigger_message_base) {
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.security_code[vcm_trigger_message_at] = (vcm_trigger_message_base + 0 + vcm_trigger_message_at + 1) % 256; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> vcm_trigger_message_record.cooling_off_start_time[vcm_trigger_message_at] = (vcm_trigger_message_base + 4 + vcm_trigger_message_at + 1) % 256; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> vcm_trigger_message_record.cooling_off_end_time[vcm_trigger_message_at] = (vcm_trigger_message_base + 12 + vcm_trigger_message_at + 1) % 256; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_reference_price[vcm_trigger_message_at] = (vcm_trigger_message_base + 20 + vcm_trigger_message_at + 1) % 256; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_lower_price[vcm_trigger_message_at] = (vcm_trigger_message_base + 24 + vcm_trigger_message_at + 1) % 256; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_upper_price[vcm_trigger_message_at] = (vcm_trigger_message_base + 28 + vcm_trigger_message_at + 1) % 256; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  skip
}

/* Vcm Trigger Message to the wire, 32 bytes from where the cursor stands */
inline encode_vcm_trigger_message(vcm_trigger_message_record) {
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> wire[at] = vcm_trigger_message_record.security_code[vcm_trigger_message_at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> wire[at] = vcm_trigger_message_record.cooling_off_start_time[vcm_trigger_message_at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> wire[at] = vcm_trigger_message_record.cooling_off_end_time[vcm_trigger_message_at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> wire[at] = vcm_trigger_message_record.vcm_reference_price[vcm_trigger_message_at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> wire[at] = vcm_trigger_message_record.vcm_lower_price[vcm_trigger_message_at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> wire[at] = vcm_trigger_message_record.vcm_upper_price[vcm_trigger_message_at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  skip
}

/* Vcm Trigger Message off the wire, 32 bytes from where the cursor stands */
inline decode_vcm_trigger_message(vcm_trigger_message_record) {
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.security_code[vcm_trigger_message_at] = wire[at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> vcm_trigger_message_record.cooling_off_start_time[vcm_trigger_message_at] = wire[at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> vcm_trigger_message_record.cooling_off_end_time[vcm_trigger_message_at] = wire[at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_reference_price[vcm_trigger_message_at] = wire[at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_lower_price[vcm_trigger_message_at] = wire[at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> vcm_trigger_message_record.vcm_upper_price[vcm_trigger_message_at] = wire[at]; at = at + 1; vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Vcm Trigger Message is what was written, byte for byte */
inline equal_vcm_trigger_message(vcm_trigger_message_read, vcm_trigger_message_written) {
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> assert(vcm_trigger_message_read.security_code[vcm_trigger_message_at] == vcm_trigger_message_written.security_code[vcm_trigger_message_at]); vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> assert(vcm_trigger_message_read.cooling_off_start_time[vcm_trigger_message_at] == vcm_trigger_message_written.cooling_off_start_time[vcm_trigger_message_at]); vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 8 -> assert(vcm_trigger_message_read.cooling_off_end_time[vcm_trigger_message_at] == vcm_trigger_message_written.cooling_off_end_time[vcm_trigger_message_at]); vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> assert(vcm_trigger_message_read.vcm_reference_price[vcm_trigger_message_at] == vcm_trigger_message_written.vcm_reference_price[vcm_trigger_message_at]); vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> assert(vcm_trigger_message_read.vcm_lower_price[vcm_trigger_message_at] == vcm_trigger_message_written.vcm_lower_price[vcm_trigger_message_at]); vcm_trigger_message_at = vcm_trigger_message_at + 1
  :: else -> break
  od;
  vcm_trigger_message_at = 0;
  do
  :: vcm_trigger_message_at < 4 -> assert(vcm_trigger_message_read.vcm_upper_price[vcm_trigger_message_at] == vcm_trigger_message_written.vcm_upper_price[vcm_trigger_message_at]); vcm_trigger_message_at = vcm_trigger_message_at + 1
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

/* Closing Price Message: encoded, read back, and compared */
proctype check_closing_price_message() {
  ClosingPriceMessage closing_price_message_sent;
  ClosingPriceMessage closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_closing_price_message(closing_price_message_sent, 0)
  :: pattern == 1 -> fill_closing_price_message(closing_price_message_sent, 32)
  :: pattern == 2 -> fill_closing_price_message(closing_price_message_sent, 255)
  :: else -> ramp_closing_price_message(closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_closing_price_message(closing_price_message_sent);
    assert(at == 12);
    at = 0;
    decode_closing_price_message(closing_price_message_got);
    assert(at == 12);
    equal_closing_price_message(closing_price_message_got, closing_price_message_sent)
  }
}

/* Indicative Equilibrium Price Message: encoded, read back, and compared */
proctype check_indicative_equilibrium_price_message() {
  IndicativeEquilibriumPriceMessage indicative_equilibrium_price_message_sent;
  IndicativeEquilibriumPriceMessage indicative_equilibrium_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indicative_equilibrium_price_message(indicative_equilibrium_price_message_sent, 0)
  :: pattern == 1 -> fill_indicative_equilibrium_price_message(indicative_equilibrium_price_message_sent, 32)
  :: pattern == 2 -> fill_indicative_equilibrium_price_message(indicative_equilibrium_price_message_sent, 255)
  :: else -> ramp_indicative_equilibrium_price_message(indicative_equilibrium_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indicative_equilibrium_price_message(indicative_equilibrium_price_message_sent);
    assert(at == 16);
    at = 0;
    decode_indicative_equilibrium_price_message(indicative_equilibrium_price_message_got);
    assert(at == 16);
    equal_indicative_equilibrium_price_message(indicative_equilibrium_price_message_got, indicative_equilibrium_price_message_sent)
  }
}

/* Nominal Price Message: encoded, read back, and compared */
proctype check_nominal_price_message() {
  NominalPriceMessage nominal_price_message_sent;
  NominalPriceMessage nominal_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_nominal_price_message(nominal_price_message_sent, 0)
  :: pattern == 1 -> fill_nominal_price_message(nominal_price_message_sent, 32)
  :: pattern == 2 -> fill_nominal_price_message(nominal_price_message_sent, 255)
  :: else -> ramp_nominal_price_message(nominal_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_nominal_price_message(nominal_price_message_sent);
    assert(at == 8);
    at = 0;
    decode_nominal_price_message(nominal_price_message_got);
    assert(at == 8);
    equal_nominal_price_message(nominal_price_message_got, nominal_price_message_sent)
  }
}

/* Order Imbalance Message: encoded, read back, and compared */
proctype check_order_imbalance_message() {
  OrderImbalanceMessage order_imbalance_message_sent;
  OrderImbalanceMessage order_imbalance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_imbalance_message(order_imbalance_message_sent, 0)
  :: pattern == 1 -> fill_order_imbalance_message(order_imbalance_message_sent, 32)
  :: pattern == 2 -> fill_order_imbalance_message(order_imbalance_message_sent, 255)
  :: else -> ramp_order_imbalance_message(order_imbalance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_imbalance_message(order_imbalance_message_sent);
    assert(at == 16);
    at = 0;
    decode_order_imbalance_message(order_imbalance_message_got);
    assert(at == 16);
    equal_order_imbalance_message(order_imbalance_message_got, order_imbalance_message_sent)
  }
}

/* Market Definition Message: encoded, read back, and compared */
proctype check_market_definition_message() {
  MarketDefinitionMessage market_definition_message_sent;
  MarketDefinitionMessage market_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_definition_message(market_definition_message_sent, 0)
  :: pattern == 1 -> fill_market_definition_message(market_definition_message_sent, 32)
  :: pattern == 2 -> fill_market_definition_message(market_definition_message_sent, 255)
  :: else -> ramp_market_definition_message(market_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_definition_message(market_definition_message_sent);
    assert(at == 36);
    at = 0;
    decode_market_definition_message(market_definition_message_got);
    assert(at == 36);
    equal_market_definition_message(market_definition_message_got, market_definition_message_sent)
  }
}

/* Face Value Composite: encoded, read back, and compared */
proctype check_face_value_composite() {
  FaceValueComposite face_value_composite_sent;
  FaceValueComposite face_value_composite_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_face_value_composite(face_value_composite_sent, 0)
  :: pattern == 1 -> fill_face_value_composite(face_value_composite_sent, 32)
  :: pattern == 2 -> fill_face_value_composite(face_value_composite_sent, 255)
  :: else -> ramp_face_value_composite(face_value_composite_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_face_value_composite(face_value_composite_sent);
    assert(at == 9);
    at = 0;
    decode_face_value_composite(face_value_composite_got);
    assert(at == 9);
    equal_face_value_composite(face_value_composite_got, face_value_composite_sent)
  }
}

/* Call Price Composite: encoded, read back, and compared */
proctype check_call_price_composite() {
  CallPriceComposite call_price_composite_sent;
  CallPriceComposite call_price_composite_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_call_price_composite(call_price_composite_sent, 0)
  :: pattern == 1 -> fill_call_price_composite(call_price_composite_sent, 32)
  :: pattern == 2 -> fill_call_price_composite(call_price_composite_sent, 255)
  :: else -> ramp_call_price_composite(call_price_composite_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_call_price_composite(call_price_composite_sent);
    assert(at == 5);
    at = 0;
    decode_call_price_composite(call_price_composite_got);
    assert(at == 5);
    equal_call_price_composite(call_price_composite_got, call_price_composite_sent)
  }
}

/* Entitlement Composite: encoded, read back, and compared */
proctype check_entitlement_composite() {
  EntitlementComposite entitlement_composite_sent;
  EntitlementComposite entitlement_composite_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_entitlement_composite(entitlement_composite_sent, 0)
  :: pattern == 1 -> fill_entitlement_composite(entitlement_composite_sent, 32)
  :: pattern == 2 -> fill_entitlement_composite(entitlement_composite_sent, 255)
  :: else -> ramp_entitlement_composite(entitlement_composite_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_entitlement_composite(entitlement_composite_sent);
    assert(at == 5);
    at = 0;
    decode_entitlement_composite(entitlement_composite_got);
    assert(at == 5);
    equal_entitlement_composite(entitlement_composite_got, entitlement_composite_sent)
  }
}

/* Currency Rate Message: encoded, read back, and compared */
proctype check_currency_rate_message() {
  CurrencyRateMessage currency_rate_message_sent;
  CurrencyRateMessage currency_rate_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_currency_rate_message(currency_rate_message_sent, 0)
  :: pattern == 1 -> fill_currency_rate_message(currency_rate_message_sent, 32)
  :: pattern == 2 -> fill_currency_rate_message(currency_rate_message_sent, 255)
  :: else -> ramp_currency_rate_message(currency_rate_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_currency_rate_message(currency_rate_message_sent);
    assert(at == 12);
    at = 0;
    decode_currency_rate_message(currency_rate_message_got);
    assert(at == 12);
    equal_currency_rate_message(currency_rate_message_got, currency_rate_message_sent)
  }
}

/* Reference Price Message: encoded, read back, and compared */
proctype check_reference_price_message() {
  ReferencePriceMessage reference_price_message_sent;
  ReferencePriceMessage reference_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reference_price_message(reference_price_message_sent, 0)
  :: pattern == 1 -> fill_reference_price_message(reference_price_message_sent, 32)
  :: pattern == 2 -> fill_reference_price_message(reference_price_message_sent, 255)
  :: else -> ramp_reference_price_message(reference_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reference_price_message(reference_price_message_sent);
    assert(at == 16);
    at = 0;
    decode_reference_price_message(reference_price_message_got);
    assert(at == 16);
    equal_reference_price_message(reference_price_message_got, reference_price_message_sent)
  }
}

/* Refresh Complete Message: encoded, read back, and compared */
proctype check_refresh_complete_message() {
  RefreshCompleteMessage refresh_complete_message_sent;
  RefreshCompleteMessage refresh_complete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_complete_message(refresh_complete_message_sent, 0)
  :: pattern == 1 -> fill_refresh_complete_message(refresh_complete_message_sent, 32)
  :: pattern == 2 -> fill_refresh_complete_message(refresh_complete_message_sent, 255)
  :: else -> ramp_refresh_complete_message(refresh_complete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_complete_message(refresh_complete_message_sent);
    assert(at == 4);
    at = 0;
    decode_refresh_complete_message(refresh_complete_message_got);
    assert(at == 4);
    equal_refresh_complete_message(refresh_complete_message_got, refresh_complete_message_sent)
  }
}

/* Statistics Message: encoded, read back, and compared */
proctype check_statistics_message() {
  StatisticsMessage statistics_message_sent;
  StatisticsMessage statistics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_statistics_message(statistics_message_sent, 0)
  :: pattern == 1 -> fill_statistics_message(statistics_message_sent, 32)
  :: pattern == 2 -> fill_statistics_message(statistics_message_sent, 255)
  :: else -> ramp_statistics_message(statistics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_statistics_message(statistics_message_sent);
    assert(at == 48);
    at = 0;
    decode_statistics_message(statistics_message_got);
    assert(at == 48);
    equal_statistics_message(statistics_message_got, statistics_message_sent)
  }
}

/* Market Turnover Message: encoded, read back, and compared */
proctype check_market_turnover_message() {
  MarketTurnoverMessage market_turnover_message_sent;
  MarketTurnoverMessage market_turnover_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_turnover_message(market_turnover_message_sent, 0)
  :: pattern == 1 -> fill_market_turnover_message(market_turnover_message_sent, 32)
  :: pattern == 2 -> fill_market_turnover_message(market_turnover_message_sent, 255)
  :: else -> ramp_market_turnover_message(market_turnover_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_turnover_message(market_turnover_message_sent);
    assert(at == 16);
    at = 0;
    decode_market_turnover_message(market_turnover_message_got);
    assert(at == 16);
    equal_market_turnover_message(market_turnover_message_got, market_turnover_message_sent)
  }
}

/* Yield Message: encoded, read back, and compared */
proctype check_yield_message() {
  YieldMessage yield_message_sent;
  YieldMessage yield_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_yield_message(yield_message_sent, 0)
  :: pattern == 1 -> fill_yield_message(yield_message_sent, 32)
  :: pattern == 2 -> fill_yield_message(yield_message_sent, 255)
  :: else -> ramp_yield_message(yield_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_yield_message(yield_message_sent);
    assert(at == 8);
    at = 0;
    decode_yield_message(yield_message_got);
    assert(at == 8);
    equal_yield_message(yield_message_got, yield_message_sent)
  }
}

/* Trading Session Status Message: encoded, read back, and compared */
proctype check_trading_session_status_message() {
  TradingSessionStatusMessage trading_session_status_message_sent;
  TradingSessionStatusMessage trading_session_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_session_status_message(trading_session_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_session_status_message(trading_session_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_session_status_message(trading_session_status_message_sent, 255)
  :: else -> ramp_trading_session_status_message(trading_session_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_session_status_message(trading_session_status_message_sent);
    assert(at == 28);
    at = 0;
    decode_trading_session_status_message(trading_session_status_message_got);
    assert(at == 28);
    equal_trading_session_status_message(trading_session_status_message_got, trading_session_status_message_sent)
  }
}

/* Security Status Message: encoded, read back, and compared */
proctype check_security_status_message() {
  SecurityStatusMessage security_status_message_sent;
  SecurityStatusMessage security_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_status_message(security_status_message_sent, 0)
  :: pattern == 1 -> fill_security_status_message(security_status_message_sent, 32)
  :: pattern == 2 -> fill_security_status_message(security_status_message_sent, 255)
  :: else -> ramp_security_status_message(security_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_status_message(security_status_message_sent);
    assert(at == 8);
    at = 0;
    decode_security_status_message(security_status_message_got);
    assert(at == 8);
    equal_security_status_message(security_status_message_got, security_status_message_sent)
  }
}

/* Vcm Trigger Message: encoded, read back, and compared */
proctype check_vcm_trigger_message() {
  VcmTriggerMessage vcm_trigger_message_sent;
  VcmTriggerMessage vcm_trigger_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_vcm_trigger_message(vcm_trigger_message_sent, 0)
  :: pattern == 1 -> fill_vcm_trigger_message(vcm_trigger_message_sent, 32)
  :: pattern == 2 -> fill_vcm_trigger_message(vcm_trigger_message_sent, 255)
  :: else -> ramp_vcm_trigger_message(vcm_trigger_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_vcm_trigger_message(vcm_trigger_message_sent);
    assert(at == 32);
    at = 0;
    decode_vcm_trigger_message(vcm_trigger_message_got);
    assert(at == 32);
    equal_vcm_trigger_message(vcm_trigger_message_got, vcm_trigger_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_msg_header()
  :: run check_closing_price_message()
  :: run check_indicative_equilibrium_price_message()
  :: run check_nominal_price_message()
  :: run check_order_imbalance_message()
  :: run check_market_definition_message()
  :: run check_face_value_composite()
  :: run check_call_price_composite()
  :: run check_entitlement_composite()
  :: run check_currency_rate_message()
  :: run check_reference_price_message()
  :: run check_refresh_complete_message()
  :: run check_statistics_message()
  :: run check_market_turnover_message()
  :: run check_yield_message()
  :: run check_trading_session_status_message()
  :: run check_security_status_message()
  :: run check_vcm_trigger_message()
  fi
}
