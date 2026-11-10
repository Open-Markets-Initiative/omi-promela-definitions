/*
 * Texas Stock Exchange FEED Full-Depth Market Data
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
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 60

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Udp Header: 19 bytes ---------------------------------------------------- */

/* Rake Udp packet header */
typedef UdpHeader {
  byte session[8];
  byte sequence[8];
  byte message_count[2];
  byte packet_type
};

int udp_header_at;

/* every byte of Udp Header set to one value */
inline fill_udp_header(udp_header_record, udp_header_value) {
  udp_header_at = 0;
  do
  :: udp_header_at < 8 -> udp_header_record.session[udp_header_at] = udp_header_value; udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  udp_header_at = 0;
  do
  :: udp_header_at < 8 -> udp_header_record.sequence[udp_header_at] = udp_header_value; udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  udp_header_at = 0;
  do
  :: udp_header_at < 2 -> udp_header_record.message_count[udp_header_at] = udp_header_value; udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  udp_header_record.packet_type = udp_header_value;
  skip
}

/* each byte of Udp Header set to where it lies, so a field read out of place says so */
inline ramp_udp_header(udp_header_record, udp_header_base) {
  udp_header_at = 0;
  do
  :: udp_header_at < 8 -> udp_header_record.session[udp_header_at] = (udp_header_base + 0 + udp_header_at + 1) % 256; udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  udp_header_at = 0;
  do
  :: udp_header_at < 8 -> udp_header_record.sequence[udp_header_at] = (udp_header_base + 8 + udp_header_at + 1) % 256; udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  udp_header_at = 0;
  do
  :: udp_header_at < 2 -> udp_header_record.message_count[udp_header_at] = (udp_header_base + 16 + udp_header_at + 1) % 256; udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  udp_header_record.packet_type = (udp_header_base + 18 + 1) % 256;
  skip
}

/* Udp Header to the wire, 19 bytes from where the cursor stands */
inline encode_udp_header(udp_header_record) {
  udp_header_at = 0;
  do
  :: udp_header_at < 8 -> wire[at] = udp_header_record.session[udp_header_at]; at = at + 1; udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  udp_header_at = 0;
  do
  :: udp_header_at < 8 -> wire[at] = udp_header_record.sequence[udp_header_at]; at = at + 1; udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  udp_header_at = 0;
  do
  :: udp_header_at < 2 -> wire[at] = udp_header_record.message_count[udp_header_at]; at = at + 1; udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  wire[at] = udp_header_record.packet_type; at = at + 1;
  skip
}

/* Udp Header off the wire, 19 bytes from where the cursor stands */
inline decode_udp_header(udp_header_record) {
  udp_header_at = 0;
  do
  :: udp_header_at < 8 -> udp_header_record.session[udp_header_at] = wire[at]; at = at + 1; udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  udp_header_at = 0;
  do
  :: udp_header_at < 8 -> udp_header_record.sequence[udp_header_at] = wire[at]; at = at + 1; udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  udp_header_at = 0;
  do
  :: udp_header_at < 2 -> udp_header_record.message_count[udp_header_at] = wire[at]; at = at + 1; udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  udp_header_record.packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Udp Header is what was written, byte for byte */
inline equal_udp_header(udp_header_read, udp_header_written) {
  udp_header_at = 0;
  do
  :: udp_header_at < 8 -> assert(udp_header_read.session[udp_header_at] == udp_header_written.session[udp_header_at]); udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  udp_header_at = 0;
  do
  :: udp_header_at < 8 -> assert(udp_header_read.sequence[udp_header_at] == udp_header_written.sequence[udp_header_at]); udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  udp_header_at = 0;
  do
  :: udp_header_at < 2 -> assert(udp_header_read.message_count[udp_header_at] == udp_header_written.message_count[udp_header_at]); udp_header_at = udp_header_at + 1
  :: else -> break
  od;
  assert(udp_header_read.packet_type == udp_header_written.packet_type);
  skip
}

/* ---- Delete Order Message: 18 bytes ------------------------------------------ */

/* Details for an order deleted in its entirety from the TXSE book. */
typedef DeleteOrderMessage {
  byte transact_time[8];
  byte symbol_id[2];
  byte order_id[8]
};

int delete_order_message_at;

/* every byte of Delete Order Message set to one value */
inline fill_delete_order_message(delete_order_message_record, delete_order_message_value) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.transact_time[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> delete_order_message_record.symbol_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Delete Order Message set to where it lies, so a field read out of place says so */
inline ramp_delete_order_message(delete_order_message_record, delete_order_message_base) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.transact_time[delete_order_message_at] = (delete_order_message_base + 0 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> delete_order_message_record.symbol_id[delete_order_message_at] = (delete_order_message_base + 8 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = (delete_order_message_base + 10 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message to the wire, 18 bytes from where the cursor stands */
inline encode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.transact_time[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> wire[at] = delete_order_message_record.symbol_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.order_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message off the wire, 18 bytes from where the cursor stands */
inline decode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.transact_time[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> delete_order_message_record.symbol_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Delete Order Message is what was written, byte for byte */
inline equal_delete_order_message(delete_order_message_read, delete_order_message_written) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.transact_time[delete_order_message_at] == delete_order_message_written.transact_time[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> assert(delete_order_message_read.symbol_id[delete_order_message_at] == delete_order_message_written.symbol_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.order_id[delete_order_message_at] == delete_order_message_written.order_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execute Order Message: 30 bytes ----------------------------------------- */

/* Indicates that an order displayed on the TXSE book has executed in part or in full at its previously displayed price. */
typedef ExecuteOrderMessage {
  byte transact_time[8];
  byte symbol_id[2];
  byte order_id[8];
  byte qty[4];
  byte exec_id[8]
};

int execute_order_message_at;

/* every byte of Execute Order Message set to one value */
inline fill_execute_order_message(execute_order_message_record, execute_order_message_value) {
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> execute_order_message_record.transact_time[execute_order_message_at] = execute_order_message_value; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 2 -> execute_order_message_record.symbol_id[execute_order_message_at] = execute_order_message_value; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> execute_order_message_record.order_id[execute_order_message_at] = execute_order_message_value; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 4 -> execute_order_message_record.qty[execute_order_message_at] = execute_order_message_value; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> execute_order_message_record.exec_id[execute_order_message_at] = execute_order_message_value; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execute Order Message set to where it lies, so a field read out of place says so */
inline ramp_execute_order_message(execute_order_message_record, execute_order_message_base) {
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> execute_order_message_record.transact_time[execute_order_message_at] = (execute_order_message_base + 0 + execute_order_message_at + 1) % 256; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 2 -> execute_order_message_record.symbol_id[execute_order_message_at] = (execute_order_message_base + 8 + execute_order_message_at + 1) % 256; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> execute_order_message_record.order_id[execute_order_message_at] = (execute_order_message_base + 10 + execute_order_message_at + 1) % 256; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 4 -> execute_order_message_record.qty[execute_order_message_at] = (execute_order_message_base + 18 + execute_order_message_at + 1) % 256; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> execute_order_message_record.exec_id[execute_order_message_at] = (execute_order_message_base + 22 + execute_order_message_at + 1) % 256; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execute Order Message to the wire, 30 bytes from where the cursor stands */
inline encode_execute_order_message(execute_order_message_record) {
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> wire[at] = execute_order_message_record.transact_time[execute_order_message_at]; at = at + 1; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 2 -> wire[at] = execute_order_message_record.symbol_id[execute_order_message_at]; at = at + 1; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> wire[at] = execute_order_message_record.order_id[execute_order_message_at]; at = at + 1; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 4 -> wire[at] = execute_order_message_record.qty[execute_order_message_at]; at = at + 1; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> wire[at] = execute_order_message_record.exec_id[execute_order_message_at]; at = at + 1; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execute Order Message off the wire, 30 bytes from where the cursor stands */
inline decode_execute_order_message(execute_order_message_record) {
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> execute_order_message_record.transact_time[execute_order_message_at] = wire[at]; at = at + 1; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 2 -> execute_order_message_record.symbol_id[execute_order_message_at] = wire[at]; at = at + 1; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> execute_order_message_record.order_id[execute_order_message_at] = wire[at]; at = at + 1; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 4 -> execute_order_message_record.qty[execute_order_message_at] = wire[at]; at = at + 1; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> execute_order_message_record.exec_id[execute_order_message_at] = wire[at]; at = at + 1; execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execute Order Message is what was written, byte for byte */
inline equal_execute_order_message(execute_order_message_read, execute_order_message_written) {
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> assert(execute_order_message_read.transact_time[execute_order_message_at] == execute_order_message_written.transact_time[execute_order_message_at]); execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 2 -> assert(execute_order_message_read.symbol_id[execute_order_message_at] == execute_order_message_written.symbol_id[execute_order_message_at]); execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> assert(execute_order_message_read.order_id[execute_order_message_at] == execute_order_message_written.order_id[execute_order_message_at]); execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 4 -> assert(execute_order_message_read.qty[execute_order_message_at] == execute_order_message_written.qty[execute_order_message_at]); execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  execute_order_message_at = 0;
  do
  :: execute_order_message_at < 8 -> assert(execute_order_message_read.exec_id[execute_order_message_at] == execute_order_message_written.exec_id[execute_order_message_at]); execute_order_message_at = execute_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Size Down Message: 22 bytes -------------------------------------- */

/* Modify an order by reducing its size without losing priority on the TXSE book. */
typedef ModifySizeDownMessage {
  byte transact_time[8];
  byte symbol_id[2];
  byte order_id[8];
  byte qty[4]
};

int modify_size_down_message_at;

/* every byte of Modify Size Down Message set to one value */
inline fill_modify_size_down_message(modify_size_down_message_record, modify_size_down_message_value) {
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 8 -> modify_size_down_message_record.transact_time[modify_size_down_message_at] = modify_size_down_message_value; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 2 -> modify_size_down_message_record.symbol_id[modify_size_down_message_at] = modify_size_down_message_value; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 8 -> modify_size_down_message_record.order_id[modify_size_down_message_at] = modify_size_down_message_value; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 4 -> modify_size_down_message_record.qty[modify_size_down_message_at] = modify_size_down_message_value; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Size Down Message set to where it lies, so a field read out of place says so */
inline ramp_modify_size_down_message(modify_size_down_message_record, modify_size_down_message_base) {
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 8 -> modify_size_down_message_record.transact_time[modify_size_down_message_at] = (modify_size_down_message_base + 0 + modify_size_down_message_at + 1) % 256; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 2 -> modify_size_down_message_record.symbol_id[modify_size_down_message_at] = (modify_size_down_message_base + 8 + modify_size_down_message_at + 1) % 256; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 8 -> modify_size_down_message_record.order_id[modify_size_down_message_at] = (modify_size_down_message_base + 10 + modify_size_down_message_at + 1) % 256; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 4 -> modify_size_down_message_record.qty[modify_size_down_message_at] = (modify_size_down_message_base + 18 + modify_size_down_message_at + 1) % 256; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Size Down Message to the wire, 22 bytes from where the cursor stands */
inline encode_modify_size_down_message(modify_size_down_message_record) {
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 8 -> wire[at] = modify_size_down_message_record.transact_time[modify_size_down_message_at]; at = at + 1; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 2 -> wire[at] = modify_size_down_message_record.symbol_id[modify_size_down_message_at]; at = at + 1; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 8 -> wire[at] = modify_size_down_message_record.order_id[modify_size_down_message_at]; at = at + 1; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 4 -> wire[at] = modify_size_down_message_record.qty[modify_size_down_message_at]; at = at + 1; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Size Down Message off the wire, 22 bytes from where the cursor stands */
inline decode_modify_size_down_message(modify_size_down_message_record) {
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 8 -> modify_size_down_message_record.transact_time[modify_size_down_message_at] = wire[at]; at = at + 1; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 2 -> modify_size_down_message_record.symbol_id[modify_size_down_message_at] = wire[at]; at = at + 1; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 8 -> modify_size_down_message_record.order_id[modify_size_down_message_at] = wire[at]; at = at + 1; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 4 -> modify_size_down_message_record.qty[modify_size_down_message_at] = wire[at]; at = at + 1; modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Size Down Message is what was written, byte for byte */
inline equal_modify_size_down_message(modify_size_down_message_read, modify_size_down_message_written) {
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 8 -> assert(modify_size_down_message_read.transact_time[modify_size_down_message_at] == modify_size_down_message_written.transact_time[modify_size_down_message_at]); modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 2 -> assert(modify_size_down_message_read.symbol_id[modify_size_down_message_at] == modify_size_down_message_written.symbol_id[modify_size_down_message_at]); modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 8 -> assert(modify_size_down_message_read.order_id[modify_size_down_message_at] == modify_size_down_message_written.order_id[modify_size_down_message_at]); modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  modify_size_down_message_at = 0;
  do
  :: modify_size_down_message_at < 4 -> assert(modify_size_down_message_read.qty[modify_size_down_message_at] == modify_size_down_message_written.qty[modify_size_down_message_at]); modify_size_down_message_at = modify_size_down_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replace Order Message: 38 bytes ----------------------------------------- */

/* Replace an order, possibly changing price level and size (which can increase), losing priority on the TXSE book. */
typedef ReplaceOrderMessage {
  byte transact_time[8];
  byte symbol_id[2];
  byte old_order_id[8];
  byte new_order_id[8];
  byte price[8];
  byte qty[4]
};

int replace_order_message_at;

/* every byte of Replace Order Message set to one value */
inline fill_replace_order_message(replace_order_message_record, replace_order_message_value) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.transact_time[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 2 -> replace_order_message_record.symbol_id[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.old_order_id[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.new_order_id[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.price[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.qty[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replace Order Message set to where it lies, so a field read out of place says so */
inline ramp_replace_order_message(replace_order_message_record, replace_order_message_base) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.transact_time[replace_order_message_at] = (replace_order_message_base + 0 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 2 -> replace_order_message_record.symbol_id[replace_order_message_at] = (replace_order_message_base + 8 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.old_order_id[replace_order_message_at] = (replace_order_message_base + 10 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.new_order_id[replace_order_message_at] = (replace_order_message_base + 18 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.price[replace_order_message_at] = (replace_order_message_base + 26 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.qty[replace_order_message_at] = (replace_order_message_base + 34 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replace Order Message to the wire, 38 bytes from where the cursor stands */
inline encode_replace_order_message(replace_order_message_record) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> wire[at] = replace_order_message_record.transact_time[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 2 -> wire[at] = replace_order_message_record.symbol_id[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> wire[at] = replace_order_message_record.old_order_id[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> wire[at] = replace_order_message_record.new_order_id[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> wire[at] = replace_order_message_record.price[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.qty[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replace Order Message off the wire, 38 bytes from where the cursor stands */
inline decode_replace_order_message(replace_order_message_record) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.transact_time[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 2 -> replace_order_message_record.symbol_id[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.old_order_id[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.new_order_id[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.price[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.qty[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replace Order Message is what was written, byte for byte */
inline equal_replace_order_message(replace_order_message_read, replace_order_message_written) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> assert(replace_order_message_read.transact_time[replace_order_message_at] == replace_order_message_written.transact_time[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 2 -> assert(replace_order_message_read.symbol_id[replace_order_message_at] == replace_order_message_written.symbol_id[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> assert(replace_order_message_read.old_order_id[replace_order_message_at] == replace_order_message_written.old_order_id[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> assert(replace_order_message_read.new_order_id[replace_order_message_at] == replace_order_message_written.new_order_id[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> assert(replace_order_message_read.price[replace_order_message_at] == replace_order_message_written.price[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.qty[replace_order_message_at] == replace_order_message_written.qty[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 30 bytes ------------------------------------------------- */

/* Execution of non-displayed liquidity. */
typedef TradeMessage {
  byte transact_time[8];
  byte symbol_id[2];
  byte price[8];
  byte qty[4];
  byte exec_id[8]
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.transact_time[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.symbol_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.qty[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.exec_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.transact_time[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.symbol_id[trade_message_at] = (trade_message_base + 8 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = (trade_message_base + 10 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.qty[trade_message_at] = (trade_message_base + 18 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.exec_id[trade_message_at] = (trade_message_base + 22 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 30 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.transact_time[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> wire[at] = trade_message_record.symbol_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.qty[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.exec_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 30 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.transact_time[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.symbol_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.qty[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.exec_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.transact_time[trade_message_at] == trade_message_written.transact_time[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> assert(trade_message_read.symbol_id[trade_message_at] == trade_message_written.symbol_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.qty[trade_message_at] == trade_message_written.qty[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.exec_id[trade_message_at] == trade_message_written.exec_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Break Trade Message: 18 bytes ------------------------------------------- */

/* Break a previous trade or execution by execution identifier. */
typedef BreakTradeMessage {
  byte transact_time[8];
  byte symbol_id[2];
  byte exec_id[8]
};

int break_trade_message_at;

/* every byte of Break Trade Message set to one value */
inline fill_break_trade_message(break_trade_message_record, break_trade_message_value) {
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 8 -> break_trade_message_record.transact_time[break_trade_message_at] = break_trade_message_value; break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 2 -> break_trade_message_record.symbol_id[break_trade_message_at] = break_trade_message_value; break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 8 -> break_trade_message_record.exec_id[break_trade_message_at] = break_trade_message_value; break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Break Trade Message set to where it lies, so a field read out of place says so */
inline ramp_break_trade_message(break_trade_message_record, break_trade_message_base) {
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 8 -> break_trade_message_record.transact_time[break_trade_message_at] = (break_trade_message_base + 0 + break_trade_message_at + 1) % 256; break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 2 -> break_trade_message_record.symbol_id[break_trade_message_at] = (break_trade_message_base + 8 + break_trade_message_at + 1) % 256; break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 8 -> break_trade_message_record.exec_id[break_trade_message_at] = (break_trade_message_base + 10 + break_trade_message_at + 1) % 256; break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Break Trade Message to the wire, 18 bytes from where the cursor stands */
inline encode_break_trade_message(break_trade_message_record) {
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 8 -> wire[at] = break_trade_message_record.transact_time[break_trade_message_at]; at = at + 1; break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 2 -> wire[at] = break_trade_message_record.symbol_id[break_trade_message_at]; at = at + 1; break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 8 -> wire[at] = break_trade_message_record.exec_id[break_trade_message_at]; at = at + 1; break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Break Trade Message off the wire, 18 bytes from where the cursor stands */
inline decode_break_trade_message(break_trade_message_record) {
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 8 -> break_trade_message_record.transact_time[break_trade_message_at] = wire[at]; at = at + 1; break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 2 -> break_trade_message_record.symbol_id[break_trade_message_at] = wire[at]; at = at + 1; break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 8 -> break_trade_message_record.exec_id[break_trade_message_at] = wire[at]; at = at + 1; break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Break Trade Message is what was written, byte for byte */
inline equal_break_trade_message(break_trade_message_read, break_trade_message_written) {
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 8 -> assert(break_trade_message_read.transact_time[break_trade_message_at] == break_trade_message_written.transact_time[break_trade_message_at]); break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 2 -> assert(break_trade_message_read.symbol_id[break_trade_message_at] == break_trade_message_written.symbol_id[break_trade_message_at]); break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  break_trade_message_at = 0;
  do
  :: break_trade_message_at < 8 -> assert(break_trade_message_read.exec_id[break_trade_message_at] == break_trade_message_written.exec_id[break_trade_message_at]); break_trade_message_at = break_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Preamble Message: 32 bytes -------------------------------------- */

/* Published every 5 seconds during the Accumulation Period to indicate projected auction size. Reports the matched volume and excess side that would result if the auction crossed at that moment, considering only Auction-Only orders; the Continuous Book is excluded. Emitted for OPENING and CLOSING auction types only. Not emitted for HALT or IPO auctions, which proceed directly to the Band Window phase at onset (see AuctionBandWindow). */
typedef AuctionPreambleMessage {
  byte transact_time[8];
  byte symbol_id[2];
  byte auction_type;
  byte auction_start[8];
  byte matched_shares[4];
  byte excess_auction_side;
  byte reserved_8[8]
};

int auction_preamble_message_at;

/* every byte of Auction Preamble Message set to one value */
inline fill_auction_preamble_message(auction_preamble_message_record, auction_preamble_message_value) {
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> auction_preamble_message_record.transact_time[auction_preamble_message_at] = auction_preamble_message_value; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 2 -> auction_preamble_message_record.symbol_id[auction_preamble_message_at] = auction_preamble_message_value; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_record.auction_type = auction_preamble_message_value;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> auction_preamble_message_record.auction_start[auction_preamble_message_at] = auction_preamble_message_value; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 4 -> auction_preamble_message_record.matched_shares[auction_preamble_message_at] = auction_preamble_message_value; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_record.excess_auction_side = auction_preamble_message_value;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> auction_preamble_message_record.reserved_8[auction_preamble_message_at] = auction_preamble_message_value; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Preamble Message set to where it lies, so a field read out of place says so */
inline ramp_auction_preamble_message(auction_preamble_message_record, auction_preamble_message_base) {
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> auction_preamble_message_record.transact_time[auction_preamble_message_at] = (auction_preamble_message_base + 0 + auction_preamble_message_at + 1) % 256; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 2 -> auction_preamble_message_record.symbol_id[auction_preamble_message_at] = (auction_preamble_message_base + 8 + auction_preamble_message_at + 1) % 256; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_record.auction_type = (auction_preamble_message_base + 10 + 1) % 256;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> auction_preamble_message_record.auction_start[auction_preamble_message_at] = (auction_preamble_message_base + 11 + auction_preamble_message_at + 1) % 256; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 4 -> auction_preamble_message_record.matched_shares[auction_preamble_message_at] = (auction_preamble_message_base + 19 + auction_preamble_message_at + 1) % 256; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_record.excess_auction_side = (auction_preamble_message_base + 23 + 1) % 256;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> auction_preamble_message_record.reserved_8[auction_preamble_message_at] = (auction_preamble_message_base + 24 + auction_preamble_message_at + 1) % 256; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Preamble Message to the wire, 32 bytes from where the cursor stands */
inline encode_auction_preamble_message(auction_preamble_message_record) {
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> wire[at] = auction_preamble_message_record.transact_time[auction_preamble_message_at]; at = at + 1; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 2 -> wire[at] = auction_preamble_message_record.symbol_id[auction_preamble_message_at]; at = at + 1; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_preamble_message_record.auction_type; at = at + 1;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> wire[at] = auction_preamble_message_record.auction_start[auction_preamble_message_at]; at = at + 1; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 4 -> wire[at] = auction_preamble_message_record.matched_shares[auction_preamble_message_at]; at = at + 1; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_preamble_message_record.excess_auction_side; at = at + 1;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> wire[at] = auction_preamble_message_record.reserved_8[auction_preamble_message_at]; at = at + 1; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Preamble Message off the wire, 32 bytes from where the cursor stands */
inline decode_auction_preamble_message(auction_preamble_message_record) {
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> auction_preamble_message_record.transact_time[auction_preamble_message_at] = wire[at]; at = at + 1; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 2 -> auction_preamble_message_record.symbol_id[auction_preamble_message_at] = wire[at]; at = at + 1; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_record.auction_type = wire[at]; at = at + 1;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> auction_preamble_message_record.auction_start[auction_preamble_message_at] = wire[at]; at = at + 1; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 4 -> auction_preamble_message_record.matched_shares[auction_preamble_message_at] = wire[at]; at = at + 1; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_record.excess_auction_side = wire[at]; at = at + 1;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> auction_preamble_message_record.reserved_8[auction_preamble_message_at] = wire[at]; at = at + 1; auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Preamble Message is what was written, byte for byte */
inline equal_auction_preamble_message(auction_preamble_message_read, auction_preamble_message_written) {
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> assert(auction_preamble_message_read.transact_time[auction_preamble_message_at] == auction_preamble_message_written.transact_time[auction_preamble_message_at]); auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 2 -> assert(auction_preamble_message_read.symbol_id[auction_preamble_message_at] == auction_preamble_message_written.symbol_id[auction_preamble_message_at]); auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  assert(auction_preamble_message_read.auction_type == auction_preamble_message_written.auction_type);
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> assert(auction_preamble_message_read.auction_start[auction_preamble_message_at] == auction_preamble_message_written.auction_start[auction_preamble_message_at]); auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 4 -> assert(auction_preamble_message_read.matched_shares[auction_preamble_message_at] == auction_preamble_message_written.matched_shares[auction_preamble_message_at]); auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  assert(auction_preamble_message_read.excess_auction_side == auction_preamble_message_written.excess_auction_side);
  auction_preamble_message_at = 0;
  do
  :: auction_preamble_message_at < 8 -> assert(auction_preamble_message_read.reserved_8[auction_preamble_message_at] == auction_preamble_message_written.reserved_8[auction_preamble_message_at]); auction_preamble_message_at = auction_preamble_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Band Window Message: 60 bytes ----------------------------------- */

/* Published every 5 seconds during the Band Window to report Auction-Only volume positioned at each Participation Band boundary. The Participation Band is a volatility-based price range; its derivation methodology is described in the Participation Bands specification. Auction-Only orders entered during the Band Window that are priced outside the band have their price adjusted to the nearest boundary. The Continuous Book is excluded. Volume counting at boundaries: a limit order is counted at each boundary price at which it would be eligible to execute; a market order is counted at both boundaries. Example: a limit buy at $10.05 counts at the lower boundary if lower = $10.05, but not at the upper boundary if upper = $10.10. */
typedef AuctionBandWindowMessage {
  byte transact_time[8];
  byte symbol_id[2];
  byte auction_type;
  byte auction_start[8];
  byte extension_cycle_count;
  byte lower_participation_band[8];
  byte buy_shares_at_lower[4];
  byte sell_shares_at_lower[4];
  byte upper_participation_band[8];
  byte buy_shares_at_upper[4];
  byte sell_shares_at_upper[4];
  byte reserved_8[8]
};

int auction_band_window_message_at;

/* every byte of Auction Band Window Message set to one value */
inline fill_auction_band_window_message(auction_band_window_message_record, auction_band_window_message_value) {
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.transact_time[auction_band_window_message_at] = auction_band_window_message_value; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 2 -> auction_band_window_message_record.symbol_id[auction_band_window_message_at] = auction_band_window_message_value; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_record.auction_type = auction_band_window_message_value;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.auction_start[auction_band_window_message_at] = auction_band_window_message_value; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_record.extension_cycle_count = auction_band_window_message_value;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.lower_participation_band[auction_band_window_message_at] = auction_band_window_message_value; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> auction_band_window_message_record.buy_shares_at_lower[auction_band_window_message_at] = auction_band_window_message_value; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> auction_band_window_message_record.sell_shares_at_lower[auction_band_window_message_at] = auction_band_window_message_value; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.upper_participation_band[auction_band_window_message_at] = auction_band_window_message_value; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> auction_band_window_message_record.buy_shares_at_upper[auction_band_window_message_at] = auction_band_window_message_value; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> auction_band_window_message_record.sell_shares_at_upper[auction_band_window_message_at] = auction_band_window_message_value; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.reserved_8[auction_band_window_message_at] = auction_band_window_message_value; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Band Window Message set to where it lies, so a field read out of place says so */
inline ramp_auction_band_window_message(auction_band_window_message_record, auction_band_window_message_base) {
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.transact_time[auction_band_window_message_at] = (auction_band_window_message_base + 0 + auction_band_window_message_at + 1) % 256; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 2 -> auction_band_window_message_record.symbol_id[auction_band_window_message_at] = (auction_band_window_message_base + 8 + auction_band_window_message_at + 1) % 256; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_record.auction_type = (auction_band_window_message_base + 10 + 1) % 256;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.auction_start[auction_band_window_message_at] = (auction_band_window_message_base + 11 + auction_band_window_message_at + 1) % 256; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_record.extension_cycle_count = (auction_band_window_message_base + 19 + 1) % 256;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.lower_participation_band[auction_band_window_message_at] = (auction_band_window_message_base + 20 + auction_band_window_message_at + 1) % 256; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> auction_band_window_message_record.buy_shares_at_lower[auction_band_window_message_at] = (auction_band_window_message_base + 28 + auction_band_window_message_at + 1) % 256; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> auction_band_window_message_record.sell_shares_at_lower[auction_band_window_message_at] = (auction_band_window_message_base + 32 + auction_band_window_message_at + 1) % 256; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.upper_participation_band[auction_band_window_message_at] = (auction_band_window_message_base + 36 + auction_band_window_message_at + 1) % 256; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> auction_band_window_message_record.buy_shares_at_upper[auction_band_window_message_at] = (auction_band_window_message_base + 44 + auction_band_window_message_at + 1) % 256; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> auction_band_window_message_record.sell_shares_at_upper[auction_band_window_message_at] = (auction_band_window_message_base + 48 + auction_band_window_message_at + 1) % 256; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.reserved_8[auction_band_window_message_at] = (auction_band_window_message_base + 52 + auction_band_window_message_at + 1) % 256; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Band Window Message to the wire, 60 bytes from where the cursor stands */
inline encode_auction_band_window_message(auction_band_window_message_record) {
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> wire[at] = auction_band_window_message_record.transact_time[auction_band_window_message_at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 2 -> wire[at] = auction_band_window_message_record.symbol_id[auction_band_window_message_at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_band_window_message_record.auction_type; at = at + 1;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> wire[at] = auction_band_window_message_record.auction_start[auction_band_window_message_at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_band_window_message_record.extension_cycle_count; at = at + 1;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> wire[at] = auction_band_window_message_record.lower_participation_band[auction_band_window_message_at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> wire[at] = auction_band_window_message_record.buy_shares_at_lower[auction_band_window_message_at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> wire[at] = auction_band_window_message_record.sell_shares_at_lower[auction_band_window_message_at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> wire[at] = auction_band_window_message_record.upper_participation_band[auction_band_window_message_at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> wire[at] = auction_band_window_message_record.buy_shares_at_upper[auction_band_window_message_at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> wire[at] = auction_band_window_message_record.sell_shares_at_upper[auction_band_window_message_at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> wire[at] = auction_band_window_message_record.reserved_8[auction_band_window_message_at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Band Window Message off the wire, 60 bytes from where the cursor stands */
inline decode_auction_band_window_message(auction_band_window_message_record) {
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.transact_time[auction_band_window_message_at] = wire[at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 2 -> auction_band_window_message_record.symbol_id[auction_band_window_message_at] = wire[at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_record.auction_type = wire[at]; at = at + 1;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.auction_start[auction_band_window_message_at] = wire[at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_record.extension_cycle_count = wire[at]; at = at + 1;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.lower_participation_band[auction_band_window_message_at] = wire[at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> auction_band_window_message_record.buy_shares_at_lower[auction_band_window_message_at] = wire[at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> auction_band_window_message_record.sell_shares_at_lower[auction_band_window_message_at] = wire[at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.upper_participation_band[auction_band_window_message_at] = wire[at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> auction_band_window_message_record.buy_shares_at_upper[auction_band_window_message_at] = wire[at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> auction_band_window_message_record.sell_shares_at_upper[auction_band_window_message_at] = wire[at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> auction_band_window_message_record.reserved_8[auction_band_window_message_at] = wire[at]; at = at + 1; auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Band Window Message is what was written, byte for byte */
inline equal_auction_band_window_message(auction_band_window_message_read, auction_band_window_message_written) {
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> assert(auction_band_window_message_read.transact_time[auction_band_window_message_at] == auction_band_window_message_written.transact_time[auction_band_window_message_at]); auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 2 -> assert(auction_band_window_message_read.symbol_id[auction_band_window_message_at] == auction_band_window_message_written.symbol_id[auction_band_window_message_at]); auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  assert(auction_band_window_message_read.auction_type == auction_band_window_message_written.auction_type);
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> assert(auction_band_window_message_read.auction_start[auction_band_window_message_at] == auction_band_window_message_written.auction_start[auction_band_window_message_at]); auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  assert(auction_band_window_message_read.extension_cycle_count == auction_band_window_message_written.extension_cycle_count);
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> assert(auction_band_window_message_read.lower_participation_band[auction_band_window_message_at] == auction_band_window_message_written.lower_participation_band[auction_band_window_message_at]); auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> assert(auction_band_window_message_read.buy_shares_at_lower[auction_band_window_message_at] == auction_band_window_message_written.buy_shares_at_lower[auction_band_window_message_at]); auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> assert(auction_band_window_message_read.sell_shares_at_lower[auction_band_window_message_at] == auction_band_window_message_written.sell_shares_at_lower[auction_band_window_message_at]); auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> assert(auction_band_window_message_read.upper_participation_band[auction_band_window_message_at] == auction_band_window_message_written.upper_participation_band[auction_band_window_message_at]); auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> assert(auction_band_window_message_read.buy_shares_at_upper[auction_band_window_message_at] == auction_band_window_message_written.buy_shares_at_upper[auction_band_window_message_at]); auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 4 -> assert(auction_band_window_message_read.sell_shares_at_upper[auction_band_window_message_at] == auction_band_window_message_written.sell_shares_at_upper[auction_band_window_message_at]); auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  auction_band_window_message_at = 0;
  do
  :: auction_band_window_message_at < 8 -> assert(auction_band_window_message_read.reserved_8[auction_band_window_message_at] == auction_band_window_message_written.reserved_8[auction_band_window_message_at]); auction_band_window_message_at = auction_band_window_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Print Message: 31 bytes ----------------------------------------- */

/* Summary of an auction cross. Emitted before any per-order auction execution messages for the same cross. Universal lifecycle terminator — emitted for every auction. Encoding: (a) matchedShares > 0 with a valid auctionPrice indicates a normal cross; (b) matchedShares = 0 with a valid auctionPrice indicates a zero-share completion (e.g., halt-into-close default or demand failure); (c) matchedShares = 0 with auctionPrice = CANCELED_SENTINEL indicates a canceled auction. Where the feed publishes per-order auction executions, those executions share this message's execId. */
typedef AuctionPrintMessage {
  byte transact_time[8];
  byte symbol_id[2];
  byte auction_type;
  byte auction_price[8];
  byte matched_shares[4];
  byte exec_id[8]
};

int auction_print_message_at;

/* every byte of Auction Print Message set to one value */
inline fill_auction_print_message(auction_print_message_record, auction_print_message_value) {
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> auction_print_message_record.transact_time[auction_print_message_at] = auction_print_message_value; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 2 -> auction_print_message_record.symbol_id[auction_print_message_at] = auction_print_message_value; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_record.auction_type = auction_print_message_value;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> auction_print_message_record.auction_price[auction_print_message_at] = auction_print_message_value; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 4 -> auction_print_message_record.matched_shares[auction_print_message_at] = auction_print_message_value; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> auction_print_message_record.exec_id[auction_print_message_at] = auction_print_message_value; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Print Message set to where it lies, so a field read out of place says so */
inline ramp_auction_print_message(auction_print_message_record, auction_print_message_base) {
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> auction_print_message_record.transact_time[auction_print_message_at] = (auction_print_message_base + 0 + auction_print_message_at + 1) % 256; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 2 -> auction_print_message_record.symbol_id[auction_print_message_at] = (auction_print_message_base + 8 + auction_print_message_at + 1) % 256; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_record.auction_type = (auction_print_message_base + 10 + 1) % 256;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> auction_print_message_record.auction_price[auction_print_message_at] = (auction_print_message_base + 11 + auction_print_message_at + 1) % 256; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 4 -> auction_print_message_record.matched_shares[auction_print_message_at] = (auction_print_message_base + 19 + auction_print_message_at + 1) % 256; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> auction_print_message_record.exec_id[auction_print_message_at] = (auction_print_message_base + 23 + auction_print_message_at + 1) % 256; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Print Message to the wire, 31 bytes from where the cursor stands */
inline encode_auction_print_message(auction_print_message_record) {
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> wire[at] = auction_print_message_record.transact_time[auction_print_message_at]; at = at + 1; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 2 -> wire[at] = auction_print_message_record.symbol_id[auction_print_message_at]; at = at + 1; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_print_message_record.auction_type; at = at + 1;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> wire[at] = auction_print_message_record.auction_price[auction_print_message_at]; at = at + 1; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 4 -> wire[at] = auction_print_message_record.matched_shares[auction_print_message_at]; at = at + 1; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> wire[at] = auction_print_message_record.exec_id[auction_print_message_at]; at = at + 1; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Print Message off the wire, 31 bytes from where the cursor stands */
inline decode_auction_print_message(auction_print_message_record) {
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> auction_print_message_record.transact_time[auction_print_message_at] = wire[at]; at = at + 1; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 2 -> auction_print_message_record.symbol_id[auction_print_message_at] = wire[at]; at = at + 1; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_record.auction_type = wire[at]; at = at + 1;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> auction_print_message_record.auction_price[auction_print_message_at] = wire[at]; at = at + 1; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 4 -> auction_print_message_record.matched_shares[auction_print_message_at] = wire[at]; at = at + 1; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> auction_print_message_record.exec_id[auction_print_message_at] = wire[at]; at = at + 1; auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Print Message is what was written, byte for byte */
inline equal_auction_print_message(auction_print_message_read, auction_print_message_written) {
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> assert(auction_print_message_read.transact_time[auction_print_message_at] == auction_print_message_written.transact_time[auction_print_message_at]); auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 2 -> assert(auction_print_message_read.symbol_id[auction_print_message_at] == auction_print_message_written.symbol_id[auction_print_message_at]); auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  assert(auction_print_message_read.auction_type == auction_print_message_written.auction_type);
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> assert(auction_print_message_read.auction_price[auction_print_message_at] == auction_print_message_written.auction_price[auction_print_message_at]); auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 4 -> assert(auction_print_message_read.matched_shares[auction_print_message_at] == auction_print_message_written.matched_shares[auction_print_message_at]); auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  auction_print_message_at = 0;
  do
  :: auction_print_message_at < 8 -> assert(auction_print_message_read.exec_id[auction_print_message_at] == auction_print_message_written.exec_id[auction_print_message_at]); auction_print_message_at = auction_print_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Udp Header: encoded, read back, and compared */
proctype check_udp_header() {
  UdpHeader udp_header_sent;
  UdpHeader udp_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_udp_header(udp_header_sent, 0)
  :: pattern == 1 -> fill_udp_header(udp_header_sent, 32)
  :: pattern == 2 -> fill_udp_header(udp_header_sent, 255)
  :: else -> ramp_udp_header(udp_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_udp_header(udp_header_sent);
    assert(at == 19);
    at = 0;
    decode_udp_header(udp_header_got);
    assert(at == 19);
    equal_udp_header(udp_header_got, udp_header_sent)
  }
}

/* Delete Order Message: encoded, read back, and compared */
proctype check_delete_order_message() {
  DeleteOrderMessage delete_order_message_sent;
  DeleteOrderMessage delete_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_order_message(delete_order_message_sent, 0)
  :: pattern == 1 -> fill_delete_order_message(delete_order_message_sent, 32)
  :: pattern == 2 -> fill_delete_order_message(delete_order_message_sent, 255)
  :: else -> ramp_delete_order_message(delete_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_order_message(delete_order_message_sent);
    assert(at == 18);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 18);
    equal_delete_order_message(delete_order_message_got, delete_order_message_sent)
  }
}

/* Execute Order Message: encoded, read back, and compared */
proctype check_execute_order_message() {
  ExecuteOrderMessage execute_order_message_sent;
  ExecuteOrderMessage execute_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execute_order_message(execute_order_message_sent, 0)
  :: pattern == 1 -> fill_execute_order_message(execute_order_message_sent, 32)
  :: pattern == 2 -> fill_execute_order_message(execute_order_message_sent, 255)
  :: else -> ramp_execute_order_message(execute_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execute_order_message(execute_order_message_sent);
    assert(at == 30);
    at = 0;
    decode_execute_order_message(execute_order_message_got);
    assert(at == 30);
    equal_execute_order_message(execute_order_message_got, execute_order_message_sent)
  }
}

/* Modify Size Down Message: encoded, read back, and compared */
proctype check_modify_size_down_message() {
  ModifySizeDownMessage modify_size_down_message_sent;
  ModifySizeDownMessage modify_size_down_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_size_down_message(modify_size_down_message_sent, 0)
  :: pattern == 1 -> fill_modify_size_down_message(modify_size_down_message_sent, 32)
  :: pattern == 2 -> fill_modify_size_down_message(modify_size_down_message_sent, 255)
  :: else -> ramp_modify_size_down_message(modify_size_down_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_size_down_message(modify_size_down_message_sent);
    assert(at == 22);
    at = 0;
    decode_modify_size_down_message(modify_size_down_message_got);
    assert(at == 22);
    equal_modify_size_down_message(modify_size_down_message_got, modify_size_down_message_sent)
  }
}

/* Replace Order Message: encoded, read back, and compared */
proctype check_replace_order_message() {
  ReplaceOrderMessage replace_order_message_sent;
  ReplaceOrderMessage replace_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replace_order_message(replace_order_message_sent, 0)
  :: pattern == 1 -> fill_replace_order_message(replace_order_message_sent, 32)
  :: pattern == 2 -> fill_replace_order_message(replace_order_message_sent, 255)
  :: else -> ramp_replace_order_message(replace_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replace_order_message(replace_order_message_sent);
    assert(at == 38);
    at = 0;
    decode_replace_order_message(replace_order_message_got);
    assert(at == 38);
    equal_replace_order_message(replace_order_message_got, replace_order_message_sent)
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
    assert(at == 30);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 30);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Break Trade Message: encoded, read back, and compared */
proctype check_break_trade_message() {
  BreakTradeMessage break_trade_message_sent;
  BreakTradeMessage break_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_break_trade_message(break_trade_message_sent, 0)
  :: pattern == 1 -> fill_break_trade_message(break_trade_message_sent, 32)
  :: pattern == 2 -> fill_break_trade_message(break_trade_message_sent, 255)
  :: else -> ramp_break_trade_message(break_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_break_trade_message(break_trade_message_sent);
    assert(at == 18);
    at = 0;
    decode_break_trade_message(break_trade_message_got);
    assert(at == 18);
    equal_break_trade_message(break_trade_message_got, break_trade_message_sent)
  }
}

/* Auction Preamble Message: encoded, read back, and compared */
proctype check_auction_preamble_message() {
  AuctionPreambleMessage auction_preamble_message_sent;
  AuctionPreambleMessage auction_preamble_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_preamble_message(auction_preamble_message_sent, 0)
  :: pattern == 1 -> fill_auction_preamble_message(auction_preamble_message_sent, 32)
  :: pattern == 2 -> fill_auction_preamble_message(auction_preamble_message_sent, 255)
  :: else -> ramp_auction_preamble_message(auction_preamble_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_preamble_message(auction_preamble_message_sent);
    assert(at == 32);
    at = 0;
    decode_auction_preamble_message(auction_preamble_message_got);
    assert(at == 32);
    equal_auction_preamble_message(auction_preamble_message_got, auction_preamble_message_sent)
  }
}

/* Auction Band Window Message: encoded, read back, and compared */
proctype check_auction_band_window_message() {
  AuctionBandWindowMessage auction_band_window_message_sent;
  AuctionBandWindowMessage auction_band_window_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_band_window_message(auction_band_window_message_sent, 0)
  :: pattern == 1 -> fill_auction_band_window_message(auction_band_window_message_sent, 32)
  :: pattern == 2 -> fill_auction_band_window_message(auction_band_window_message_sent, 255)
  :: else -> ramp_auction_band_window_message(auction_band_window_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_band_window_message(auction_band_window_message_sent);
    assert(at == 60);
    at = 0;
    decode_auction_band_window_message(auction_band_window_message_got);
    assert(at == 60);
    equal_auction_band_window_message(auction_band_window_message_got, auction_band_window_message_sent)
  }
}

/* Auction Print Message: encoded, read back, and compared */
proctype check_auction_print_message() {
  AuctionPrintMessage auction_print_message_sent;
  AuctionPrintMessage auction_print_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_print_message(auction_print_message_sent, 0)
  :: pattern == 1 -> fill_auction_print_message(auction_print_message_sent, 32)
  :: pattern == 2 -> fill_auction_print_message(auction_print_message_sent, 255)
  :: else -> ramp_auction_print_message(auction_print_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_print_message(auction_print_message_sent);
    assert(at == 31);
    at = 0;
    decode_auction_print_message(auction_print_message_got);
    assert(at == 31);
    equal_auction_print_message(auction_print_message_got, auction_print_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_udp_header()
  :: run check_delete_order_message()
  :: run check_execute_order_message()
  :: run check_modify_size_down_message()
  :: run check_replace_order_message()
  :: run check_trade_message()
  :: run check_break_trade_message()
  :: run check_auction_preamble_message()
  :: run check_auction_band_window_message()
  :: run check_auction_print_message()
  fi
}
