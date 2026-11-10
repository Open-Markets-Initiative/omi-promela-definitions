/*
 * Chicago Board Options Exchange OOF Multicast Depth Of Book
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
 *   - a run filling what frames it
 *   - a run counted by a field
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 58

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 8 bytes -------------------------------------------------- */

typedef PacketHeader {
  byte length[2];
  byte message_count;
  byte unit;
  byte sequence[4]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = packet_header_value;
  packet_header_record.unit = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = (packet_header_base + 2 + 1) % 256;
  packet_header_record.unit = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 8 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.message_count; at = at + 1;
  wire[at] = packet_header_record.unit; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 8 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = wire[at]; at = at + 1;
  packet_header_record.unit = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.length[packet_header_at] == packet_header_written.length[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.message_count == packet_header_written.message_count);
  assert(packet_header_read.unit == packet_header_written.unit);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence[packet_header_at] == packet_header_written.sequence[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 2 bytes ------------------------------------------------- */

typedef MessageHeader {
  byte message_length;
  byte message_type
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.message_length = message_header_value;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.message_length = (message_header_base + 0 + 1) % 256;
  message_header_record.message_type = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.message_length; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.message_length = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.message_length == message_header_written.message_length);
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Time Reference Message: 16 bytes ---------------------------------------- */

/* The Time Reference message is used to provide a midnight reference point for recipients of the feed. It is sent whenever the system starts up and when the system crosses a midnight boundary. All subsequent Time messages for the same unit will the use the last Midnight Reference until another Time Reference message is received for that unit. The Time Reference message includes the Trade Date, so most other sequenced messages will not include that information. Time Reference messages will be included in a spin response. */
typedef TimeReferenceMessage {
  byte midnight_reference[4];
  byte time_reference[4];
  byte time_offset[4];
  byte trade_date[4]
};

int time_reference_message_at;

/* every byte of Time Reference Message set to one value */
inline fill_time_reference_message(time_reference_message_record, time_reference_message_value) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.midnight_reference[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_reference[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_offset[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.trade_date[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Reference Message set to where it lies, so a field read out of place says so */
inline ramp_time_reference_message(time_reference_message_record, time_reference_message_base) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.midnight_reference[time_reference_message_at] = (time_reference_message_base + 0 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_reference[time_reference_message_at] = (time_reference_message_base + 4 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_offset[time_reference_message_at] = (time_reference_message_base + 8 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.trade_date[time_reference_message_at] = (time_reference_message_base + 12 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Reference Message to the wire, 16 bytes from where the cursor stands */
inline encode_time_reference_message(time_reference_message_record) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.midnight_reference[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.time_reference[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.time_offset[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.trade_date[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Reference Message off the wire, 16 bytes from where the cursor stands */
inline decode_time_reference_message(time_reference_message_record) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.midnight_reference[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_reference[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_offset[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.trade_date[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Reference Message is what was written, byte for byte */
inline equal_time_reference_message(time_reference_message_read, time_reference_message_written) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.midnight_reference[time_reference_message_at] == time_reference_message_written.midnight_reference[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.time_reference[time_reference_message_at] == time_reference_message_written.time_reference[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.time_offset[time_reference_message_at] == time_reference_message_written.time_offset[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.trade_date[time_reference_message_at] == time_reference_message_written.trade_date[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Time Message: 8 bytes --------------------------------------------------- */

/* A Time message is immediately generated and sent when there is a PITCH event for a given clock second. If there is no PITCH event for a given clock second, then no Time message is sent for that second. All subsequent Time Offset fields for the same unit will use the new Time message value as the base until another Time message is received for the same unit. The Time field is the number of seconds relative to midnight Central Time, which is provided in the Time Reference message. The Time message also includes the Epoch Time field, which is the current time represented as the number of whole seconds since the Epoch (Midnight January 1, 1970). */
typedef TimeMessage {
  byte time_reference[4];
  byte epoch_time[4]
};

int time_message_at;

/* every byte of Time Message set to one value */
inline fill_time_message(time_message_record, time_message_value) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time_reference[time_message_at] = time_message_value; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.epoch_time[time_message_at] = time_message_value; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Message set to where it lies, so a field read out of place says so */
inline ramp_time_message(time_message_record, time_message_base) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time_reference[time_message_at] = (time_message_base + 0 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.epoch_time[time_message_at] = (time_message_base + 4 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message to the wire, 8 bytes from where the cursor stands */
inline encode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> wire[at] = time_message_record.time_reference[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> wire[at] = time_message_record.epoch_time[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message off the wire, 8 bytes from where the cursor stands */
inline decode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time_reference[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.epoch_time[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Message is what was written, byte for byte */
inline equal_time_message(time_message_read, time_message_written) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> assert(time_message_read.time_reference[time_message_at] == time_message_written.time_reference[time_message_at]); time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> assert(time_message_read.epoch_time[time_message_at] == time_message_written.epoch_time[time_message_at]); time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Unit Clear Message: 4 bytes --------------------------------------------- */

/* The Unit Clear message instructs feed recipients to clear all orders for the CFE book in the unit specified in the Sequenced Unit Header message header. It would be distributed in rare recovery events such as a data center fail-over. */
typedef UnitClearMessage {
  byte time_offset[4]
};

int unit_clear_message_at;

/* every byte of Unit Clear Message set to one value */
inline fill_unit_clear_message(unit_clear_message_record, unit_clear_message_value) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.time_offset[unit_clear_message_at] = unit_clear_message_value; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Unit Clear Message set to where it lies, so a field read out of place says so */
inline ramp_unit_clear_message(unit_clear_message_record, unit_clear_message_base) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.time_offset[unit_clear_message_at] = (unit_clear_message_base + 0 + unit_clear_message_at + 1) % 256; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Clear Message to the wire, 4 bytes from where the cursor stands */
inline encode_unit_clear_message(unit_clear_message_record) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> wire[at] = unit_clear_message_record.time_offset[unit_clear_message_at]; at = at + 1; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Clear Message off the wire, 4 bytes from where the cursor stands */
inline decode_unit_clear_message(unit_clear_message_record) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.time_offset[unit_clear_message_at] = wire[at]; at = at + 1; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Unit Clear Message is what was written, byte for byte */
inline equal_unit_clear_message(unit_clear_message_read, unit_clear_message_written) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> assert(unit_clear_message_read.time_offset[unit_clear_message_at] == unit_clear_message_written.time_offset[unit_clear_message_at]); unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transaction Begin Message: 4 bytes -------------------------------------- */

/* The Transaction Begin message indicates any subsequent messages, up to the accompanying Transaction End message, are all part of the same transaction block. One example of where this might be used is when a single aggressive order executes against several resting orders. All PITCH messages corresponding to such an event would be included between a Transaction Begin message and Transaction End message. It is important to note that any PITCH Message Type may be included in a transaction block and there is no guarantee that the messages apply to the same price level or even the same Symbol. Transaction Begin messages do not alter the book and can be ignored if messages are being used solely to build a book. Feed processors can use a transaction block as a trigger to postpone publishing a quote update until the end of the transaction block. In the prior example of a single aggressive order executing against multiple resting orders, a top of book feed would be able to publish a single trade message and quote update resulting from multiple Order Executed messages once it finished processing all of the messages within the transaction block. */
typedef TransactionBeginMessage {
  byte time_offset[4]
};

int transaction_begin_message_at;

/* every byte of Transaction Begin Message set to one value */
inline fill_transaction_begin_message(transaction_begin_message_record, transaction_begin_message_value) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> transaction_begin_message_record.time_offset[transaction_begin_message_at] = transaction_begin_message_value; transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transaction Begin Message set to where it lies, so a field read out of place says so */
inline ramp_transaction_begin_message(transaction_begin_message_record, transaction_begin_message_base) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> transaction_begin_message_record.time_offset[transaction_begin_message_at] = (transaction_begin_message_base + 0 + transaction_begin_message_at + 1) % 256; transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Begin Message to the wire, 4 bytes from where the cursor stands */
inline encode_transaction_begin_message(transaction_begin_message_record) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> wire[at] = transaction_begin_message_record.time_offset[transaction_begin_message_at]; at = at + 1; transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Begin Message off the wire, 4 bytes from where the cursor stands */
inline decode_transaction_begin_message(transaction_begin_message_record) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> transaction_begin_message_record.time_offset[transaction_begin_message_at] = wire[at]; at = at + 1; transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transaction Begin Message is what was written, byte for byte */
inline equal_transaction_begin_message(transaction_begin_message_read, transaction_begin_message_written) {
  transaction_begin_message_at = 0;
  do
  :: transaction_begin_message_at < 4 -> assert(transaction_begin_message_read.time_offset[transaction_begin_message_at] == transaction_begin_message_written.time_offset[transaction_begin_message_at]); transaction_begin_message_at = transaction_begin_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transaction End Message: 4 bytes ---------------------------------------- */

/* The Transaction End message indicates that a transaction indicated by a previous Transaction Begin message has completed. Transaction End messages do not alter the book and can be ignored if messages are being used solely to build a book. */
typedef TransactionEndMessage {
  byte time_offset[4]
};

int transaction_end_message_at;

/* every byte of Transaction End Message set to one value */
inline fill_transaction_end_message(transaction_end_message_record, transaction_end_message_value) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> transaction_end_message_record.time_offset[transaction_end_message_at] = transaction_end_message_value; transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transaction End Message set to where it lies, so a field read out of place says so */
inline ramp_transaction_end_message(transaction_end_message_record, transaction_end_message_base) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> transaction_end_message_record.time_offset[transaction_end_message_at] = (transaction_end_message_base + 0 + transaction_end_message_at + 1) % 256; transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction End Message to the wire, 4 bytes from where the cursor stands */
inline encode_transaction_end_message(transaction_end_message_record) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> wire[at] = transaction_end_message_record.time_offset[transaction_end_message_at]; at = at + 1; transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction End Message off the wire, 4 bytes from where the cursor stands */
inline decode_transaction_end_message(transaction_end_message_record) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> transaction_end_message_record.time_offset[transaction_end_message_at] = wire[at]; at = at + 1; transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transaction End Message is what was written, byte for byte */
inline equal_transaction_end_message(transaction_end_message_read, transaction_end_message_written) {
  transaction_end_message_at = 0;
  do
  :: transaction_end_message_at < 4 -> assert(transaction_end_message_read.time_offset[transaction_end_message_at] == transaction_end_message_written.time_offset[transaction_end_message_at]); transaction_end_message_at = transaction_end_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Oof Symbol Mapping Message: 58 bytes ------------------------------------ */

/* An OOF Symbol Mapping message is used to map the 6 character multicast feed symbol field and options on futures name to the option contract and future underlying. The option contract is comprised of the strike price, put/call flag, options expiration date, and future underlying. The future underlying is comprised of the futures product and futures expiration date, which map to a futures symbol. This message can be sent either as a sequenced message or as an unsequenced message. It is sent as a sequenced message at system startup upon the beginning of a trading session or if an instrument is created or modified during a trading day. A new sequenced message may also be sent for a symbol that does not visibly change any attribute. A continuous loop of unsequenced symbol mapping messages (sequence = 0) is sent throughout the day at variable rates as bandwidth allows. The Time Offset field should be ignored on unsequenced messages. OOF Symbol Mapping messages are included in a spin response and will be disseminated before Complex Instrument Definition Expanded messages. */
typedef OofSymbolMappingMessage {
  byte time_offset[4];
  byte feed_symbol[6];
  byte futures_product[8];
  byte futures_expiration[4];
  byte futures_symbol[6];
  byte strike_price[8];
  byte call_put_indicator;
  byte options_expiration[4];
  byte options_on_futures_name[16];
  byte symbol_condition
};

int oof_symbol_mapping_message_at;

/* every byte of Oof Symbol Mapping Message set to one value */
inline fill_oof_symbol_mapping_message(oof_symbol_mapping_message_record, oof_symbol_mapping_message_value) {
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.time_offset[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> oof_symbol_mapping_message_record.feed_symbol[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> oof_symbol_mapping_message_record.futures_product[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.futures_expiration[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> oof_symbol_mapping_message_record.futures_symbol[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> oof_symbol_mapping_message_record.strike_price[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_record.call_put_indicator = oof_symbol_mapping_message_value;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.options_expiration[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 16 -> oof_symbol_mapping_message_record.options_on_futures_name[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_record.symbol_condition = oof_symbol_mapping_message_value;
  skip
}

/* each byte of Oof Symbol Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_oof_symbol_mapping_message(oof_symbol_mapping_message_record, oof_symbol_mapping_message_base) {
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.time_offset[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 0 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> oof_symbol_mapping_message_record.feed_symbol[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 4 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> oof_symbol_mapping_message_record.futures_product[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 10 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.futures_expiration[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 18 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> oof_symbol_mapping_message_record.futures_symbol[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 22 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> oof_symbol_mapping_message_record.strike_price[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 28 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_record.call_put_indicator = (oof_symbol_mapping_message_base + 36 + 1) % 256;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.options_expiration[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 37 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 16 -> oof_symbol_mapping_message_record.options_on_futures_name[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 41 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_record.symbol_condition = (oof_symbol_mapping_message_base + 57 + 1) % 256;
  skip
}

/* Oof Symbol Mapping Message to the wire, 58 bytes from where the cursor stands */
inline encode_oof_symbol_mapping_message(oof_symbol_mapping_message_record) {
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> wire[at] = oof_symbol_mapping_message_record.time_offset[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> wire[at] = oof_symbol_mapping_message_record.feed_symbol[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> wire[at] = oof_symbol_mapping_message_record.futures_product[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> wire[at] = oof_symbol_mapping_message_record.futures_expiration[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> wire[at] = oof_symbol_mapping_message_record.futures_symbol[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> wire[at] = oof_symbol_mapping_message_record.strike_price[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = oof_symbol_mapping_message_record.call_put_indicator; at = at + 1;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> wire[at] = oof_symbol_mapping_message_record.options_expiration[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 16 -> wire[at] = oof_symbol_mapping_message_record.options_on_futures_name[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = oof_symbol_mapping_message_record.symbol_condition; at = at + 1;
  skip
}

/* Oof Symbol Mapping Message off the wire, 58 bytes from where the cursor stands */
inline decode_oof_symbol_mapping_message(oof_symbol_mapping_message_record) {
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.time_offset[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> oof_symbol_mapping_message_record.feed_symbol[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> oof_symbol_mapping_message_record.futures_product[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.futures_expiration[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> oof_symbol_mapping_message_record.futures_symbol[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> oof_symbol_mapping_message_record.strike_price[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_record.call_put_indicator = wire[at]; at = at + 1;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.options_expiration[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 16 -> oof_symbol_mapping_message_record.options_on_futures_name[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_record.symbol_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Oof Symbol Mapping Message is what was written, byte for byte */
inline equal_oof_symbol_mapping_message(oof_symbol_mapping_message_read, oof_symbol_mapping_message_written) {
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> assert(oof_symbol_mapping_message_read.time_offset[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.time_offset[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> assert(oof_symbol_mapping_message_read.feed_symbol[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.feed_symbol[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> assert(oof_symbol_mapping_message_read.futures_product[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.futures_product[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> assert(oof_symbol_mapping_message_read.futures_expiration[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.futures_expiration[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> assert(oof_symbol_mapping_message_read.futures_symbol[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.futures_symbol[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> assert(oof_symbol_mapping_message_read.strike_price[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.strike_price[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  assert(oof_symbol_mapping_message_read.call_put_indicator == oof_symbol_mapping_message_written.call_put_indicator);
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> assert(oof_symbol_mapping_message_read.options_expiration[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.options_expiration[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 16 -> assert(oof_symbol_mapping_message_read.options_on_futures_name[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.options_on_futures_name[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  assert(oof_symbol_mapping_message_read.symbol_condition == oof_symbol_mapping_message_written.symbol_condition);
  skip
}

/* ---- Trading Status Message: 16 bytes ---------------------------------------- */

/* The Trading Status message is used to indicate the current trading status of a symbol. A Trading Status message will be sent for all symbols as they transition through various trading states. If a Trading Status message has not been received for a symbol, then the Trading Status for the symbol should be assumed to be H = Halted. The following summarizes the Trading Status values for options in the CFE system: H = Halted state. This state is used for Supervisory Halts initiated by the Trade Desk. Orders are not being accepted in this state. Q = Queuing state. This state is used when orders are being accepted for queuing. The Queuing state is used during the pre-open for all symbols. It is also used for spread instruments that may not be tradeable due to Threshold Width. T = Trading state. This state is used when the symbol is available for trading. CFE will send a Trading Status of Q once orders can be accepted for queuing in preparation for the open. At or after the opening time, CFE will send a Trading Status of T as symbols are opened for trading. Once trading is done for the day CFE will send a Trading Status of H indicating the symbol is Halted. */
typedef TradingStatusMessage {
  byte time_offset[4];
  byte symbol[6];
  byte reserved_2[2];
  byte trading_status;
  byte reserved_3[3]
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_offset[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> trading_status_message_record.reserved_2[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = trading_status_message_value;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved_3[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_offset[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = (trading_status_message_base + 4 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> trading_status_message_record.reserved_2[trading_status_message_at] = (trading_status_message_base + 10 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = (trading_status_message_base + 12 + 1) % 256;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved_3[trading_status_message_at] = (trading_status_message_base + 13 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message to the wire, 16 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.time_offset[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> wire[at] = trading_status_message_record.symbol[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> wire[at] = trading_status_message_record.reserved_2[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.trading_status; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> wire[at] = trading_status_message_record.reserved_3[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message off the wire, 16 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_offset[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> trading_status_message_record.reserved_2[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = wire[at]; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved_3[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> assert(trading_status_message_read.time_offset[trading_status_message_at] == trading_status_message_written.time_offset[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> assert(trading_status_message_read.symbol[trading_status_message_at] == trading_status_message_written.symbol[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> assert(trading_status_message_read.reserved_2[trading_status_message_at] == trading_status_message_written.reserved_2[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.trading_status == trading_status_message_written.trading_status);
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> assert(trading_status_message_read.reserved_3[trading_status_message_at] == trading_status_message_written.reserved_3[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Long Message: 31 bytes ---------------------------------------- */

/* An Add Order message represents a newly accepted visible order on the CFE book. It includes a day- specific Order Id assigned by CFE to the order. */
typedef AddOrderLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_long[4];
  byte symbol[6];
  byte price_long[8]
};

int add_order_long_message_at;

/* every byte of Add Order Long Message set to one value */
inline fill_add_order_long_message(add_order_long_message_record, add_order_long_message_value) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.time_offset[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.order_id[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.side_indicator = add_order_long_message_value;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.quantity_long[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> add_order_long_message_record.symbol[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.price_long[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Long Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_long_message(add_order_long_message_record, add_order_long_message_base) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.time_offset[add_order_long_message_at] = (add_order_long_message_base + 0 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.order_id[add_order_long_message_at] = (add_order_long_message_base + 4 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.side_indicator = (add_order_long_message_base + 12 + 1) % 256;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.quantity_long[add_order_long_message_at] = (add_order_long_message_base + 13 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> add_order_long_message_record.symbol[add_order_long_message_at] = (add_order_long_message_base + 17 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.price_long[add_order_long_message_at] = (add_order_long_message_base + 23 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Message to the wire, 31 bytes from where the cursor stands */
inline encode_add_order_long_message(add_order_long_message_record) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.time_offset[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> wire[at] = add_order_long_message_record.order_id[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_long_message_record.side_indicator; at = at + 1;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.quantity_long[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> wire[at] = add_order_long_message_record.symbol[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> wire[at] = add_order_long_message_record.price_long[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Message off the wire, 31 bytes from where the cursor stands */
inline decode_add_order_long_message(add_order_long_message_record) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.time_offset[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.order_id[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.side_indicator = wire[at]; at = at + 1;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.quantity_long[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> add_order_long_message_record.symbol[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.price_long[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Long Message is what was written, byte for byte */
inline equal_add_order_long_message(add_order_long_message_read, add_order_long_message_written) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.time_offset[add_order_long_message_at] == add_order_long_message_written.time_offset[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> assert(add_order_long_message_read.order_id[add_order_long_message_at] == add_order_long_message_written.order_id[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  assert(add_order_long_message_read.side_indicator == add_order_long_message_written.side_indicator);
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.quantity_long[add_order_long_message_at] == add_order_long_message_written.quantity_long[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> assert(add_order_long_message_read.symbol[add_order_long_message_at] == add_order_long_message_written.symbol[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> assert(add_order_long_message_read.price_long[add_order_long_message_at] == add_order_long_message_written.price_long[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Short Message: 23 bytes --------------------------------------- */

/* An Add Order message represents a newly accepted visible order on the CFE book. It includes a day- specific Order Id assigned by CFE to the order. */
typedef AddOrderShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_short[2];
  byte symbol[6];
  byte price_short[2]
};

int add_order_short_message_at;

/* every byte of Add Order Short Message set to one value */
inline fill_add_order_short_message(add_order_short_message_record, add_order_short_message_value) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.time_offset[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> add_order_short_message_record.order_id[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.side_indicator = add_order_short_message_value;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.quantity_short[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.price_short[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Short Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_short_message(add_order_short_message_record, add_order_short_message_base) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.time_offset[add_order_short_message_at] = (add_order_short_message_base + 0 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> add_order_short_message_record.order_id[add_order_short_message_at] = (add_order_short_message_base + 4 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.side_indicator = (add_order_short_message_base + 12 + 1) % 256;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.quantity_short[add_order_short_message_at] = (add_order_short_message_base + 13 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol[add_order_short_message_at] = (add_order_short_message_base + 15 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.price_short[add_order_short_message_at] = (add_order_short_message_base + 21 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Message to the wire, 23 bytes from where the cursor stands */
inline encode_add_order_short_message(add_order_short_message_record) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> wire[at] = add_order_short_message_record.time_offset[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> wire[at] = add_order_short_message_record.order_id[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_short_message_record.side_indicator; at = at + 1;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> wire[at] = add_order_short_message_record.quantity_short[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> wire[at] = add_order_short_message_record.symbol[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> wire[at] = add_order_short_message_record.price_short[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Message off the wire, 23 bytes from where the cursor stands */
inline decode_add_order_short_message(add_order_short_message_record) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> add_order_short_message_record.time_offset[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> add_order_short_message_record.order_id[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.side_indicator = wire[at]; at = at + 1;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.quantity_short[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.symbol[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> add_order_short_message_record.price_short[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Short Message is what was written, byte for byte */
inline equal_add_order_short_message(add_order_short_message_read, add_order_short_message_written) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 4 -> assert(add_order_short_message_read.time_offset[add_order_short_message_at] == add_order_short_message_written.time_offset[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 8 -> assert(add_order_short_message_read.order_id[add_order_short_message_at] == add_order_short_message_written.order_id[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  assert(add_order_short_message_read.side_indicator == add_order_short_message_written.side_indicator);
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> assert(add_order_short_message_read.quantity_short[add_order_short_message_at] == add_order_short_message_written.quantity_short[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> assert(add_order_short_message_read.symbol[add_order_short_message_at] == add_order_short_message_written.symbol[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 2 -> assert(add_order_short_message_read.price_short[add_order_short_message_at] == add_order_short_message_written.price_short[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message: 25 bytes ---------------------------------------- */

/* Order Executed messages are sent when an order on the CFE book is executed in whole or in part. The execution price equals the limit order price found in the original Add Order message or the limit order price in the latest Modify Order message referencing the Order Id. */
typedef OrderExecutedMessage {
  byte time_offset[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte execution_id[8];
  byte trade_condition
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_offset[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_condition = order_executed_message_value;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_offset[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = (order_executed_message_base + 16 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_condition = (order_executed_message_base + 24 + 1) % 256;
  skip
}

/* Order Executed Message to the wire, 25 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.time_offset[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.execution_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.trade_condition; at = at + 1;
  skip
}

/* Order Executed Message off the wire, 25 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.time_offset[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.time_offset[order_executed_message_at] == order_executed_message_written.time_offset[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_id[order_executed_message_at] == order_executed_message_written.order_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.execution_id[order_executed_message_at] == order_executed_message_written.execution_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.trade_condition == order_executed_message_written.trade_condition);
  skip
}

/* ---- Reduce Size Long Message: 16 bytes -------------------------------------- */

/* Reduce Size messages are sent when a visible order on the CFE book is partially reduced. */
typedef ReduceSizeLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte canceled_quantity_long[4]
};

int reduce_size_long_message_at;

/* every byte of Reduce Size Long Message set to one value */
inline fill_reduce_size_long_message(reduce_size_long_message_record, reduce_size_long_message_value) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.time_offset[reduce_size_long_message_at] = reduce_size_long_message_value; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> reduce_size_long_message_record.order_id[reduce_size_long_message_at] = reduce_size_long_message_value; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.canceled_quantity_long[reduce_size_long_message_at] = reduce_size_long_message_value; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reduce Size Long Message set to where it lies, so a field read out of place says so */
inline ramp_reduce_size_long_message(reduce_size_long_message_record, reduce_size_long_message_base) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.time_offset[reduce_size_long_message_at] = (reduce_size_long_message_base + 0 + reduce_size_long_message_at + 1) % 256; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> reduce_size_long_message_record.order_id[reduce_size_long_message_at] = (reduce_size_long_message_base + 4 + reduce_size_long_message_at + 1) % 256; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.canceled_quantity_long[reduce_size_long_message_at] = (reduce_size_long_message_base + 12 + reduce_size_long_message_at + 1) % 256; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Long Message to the wire, 16 bytes from where the cursor stands */
inline encode_reduce_size_long_message(reduce_size_long_message_record) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> wire[at] = reduce_size_long_message_record.time_offset[reduce_size_long_message_at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> wire[at] = reduce_size_long_message_record.order_id[reduce_size_long_message_at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> wire[at] = reduce_size_long_message_record.canceled_quantity_long[reduce_size_long_message_at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Long Message off the wire, 16 bytes from where the cursor stands */
inline decode_reduce_size_long_message(reduce_size_long_message_record) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.time_offset[reduce_size_long_message_at] = wire[at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> reduce_size_long_message_record.order_id[reduce_size_long_message_at] = wire[at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> reduce_size_long_message_record.canceled_quantity_long[reduce_size_long_message_at] = wire[at]; at = at + 1; reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reduce Size Long Message is what was written, byte for byte */
inline equal_reduce_size_long_message(reduce_size_long_message_read, reduce_size_long_message_written) {
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> assert(reduce_size_long_message_read.time_offset[reduce_size_long_message_at] == reduce_size_long_message_written.time_offset[reduce_size_long_message_at]); reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 8 -> assert(reduce_size_long_message_read.order_id[reduce_size_long_message_at] == reduce_size_long_message_written.order_id[reduce_size_long_message_at]); reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  reduce_size_long_message_at = 0;
  do
  :: reduce_size_long_message_at < 4 -> assert(reduce_size_long_message_read.canceled_quantity_long[reduce_size_long_message_at] == reduce_size_long_message_written.canceled_quantity_long[reduce_size_long_message_at]); reduce_size_long_message_at = reduce_size_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reduce Size Short Message: 14 bytes ------------------------------------- */

/* Reduce Size messages are sent when a visible order on the CFE book is partially reduced. */
typedef ReduceSizeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte canceled_quantity_short[2]
};

int reduce_size_short_message_at;

/* every byte of Reduce Size Short Message set to one value */
inline fill_reduce_size_short_message(reduce_size_short_message_record, reduce_size_short_message_value) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> reduce_size_short_message_record.time_offset[reduce_size_short_message_at] = reduce_size_short_message_value; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> reduce_size_short_message_record.order_id[reduce_size_short_message_at] = reduce_size_short_message_value; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.canceled_quantity_short[reduce_size_short_message_at] = reduce_size_short_message_value; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reduce Size Short Message set to where it lies, so a field read out of place says so */
inline ramp_reduce_size_short_message(reduce_size_short_message_record, reduce_size_short_message_base) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> reduce_size_short_message_record.time_offset[reduce_size_short_message_at] = (reduce_size_short_message_base + 0 + reduce_size_short_message_at + 1) % 256; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> reduce_size_short_message_record.order_id[reduce_size_short_message_at] = (reduce_size_short_message_base + 4 + reduce_size_short_message_at + 1) % 256; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.canceled_quantity_short[reduce_size_short_message_at] = (reduce_size_short_message_base + 12 + reduce_size_short_message_at + 1) % 256; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Short Message to the wire, 14 bytes from where the cursor stands */
inline encode_reduce_size_short_message(reduce_size_short_message_record) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> wire[at] = reduce_size_short_message_record.time_offset[reduce_size_short_message_at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> wire[at] = reduce_size_short_message_record.order_id[reduce_size_short_message_at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> wire[at] = reduce_size_short_message_record.canceled_quantity_short[reduce_size_short_message_at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reduce Size Short Message off the wire, 14 bytes from where the cursor stands */
inline decode_reduce_size_short_message(reduce_size_short_message_record) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> reduce_size_short_message_record.time_offset[reduce_size_short_message_at] = wire[at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> reduce_size_short_message_record.order_id[reduce_size_short_message_at] = wire[at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> reduce_size_short_message_record.canceled_quantity_short[reduce_size_short_message_at] = wire[at]; at = at + 1; reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reduce Size Short Message is what was written, byte for byte */
inline equal_reduce_size_short_message(reduce_size_short_message_read, reduce_size_short_message_written) {
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 4 -> assert(reduce_size_short_message_read.time_offset[reduce_size_short_message_at] == reduce_size_short_message_written.time_offset[reduce_size_short_message_at]); reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 8 -> assert(reduce_size_short_message_read.order_id[reduce_size_short_message_at] == reduce_size_short_message_written.order_id[reduce_size_short_message_at]); reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  reduce_size_short_message_at = 0;
  do
  :: reduce_size_short_message_at < 2 -> assert(reduce_size_short_message_read.canceled_quantity_short[reduce_size_short_message_at] == reduce_size_short_message_written.canceled_quantity_short[reduce_size_short_message_at]); reduce_size_short_message_at = reduce_size_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Long Message: 24 bytes ------------------------------------- */

/* The Modify Order message is sent whenever an open order is visibly modified. The Order Id refers to the Order Id of the original Add Order message. Note that Modify Order messages that appear to be "no ops" (i.e. they do not appear to modify any relevant fields) will still lose priority. */
typedef ModifyOrderLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte quantity_long[4];
  byte price_long[8]
};

int modify_order_long_message_at;

/* every byte of Modify Order Long Message set to one value */
inline fill_modify_order_long_message(modify_order_long_message_record, modify_order_long_message_value) {
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.time_offset[modify_order_long_message_at] = modify_order_long_message_value; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> modify_order_long_message_record.order_id[modify_order_long_message_at] = modify_order_long_message_value; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.quantity_long[modify_order_long_message_at] = modify_order_long_message_value; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> modify_order_long_message_record.price_long[modify_order_long_message_at] = modify_order_long_message_value; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order Long Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_long_message(modify_order_long_message_record, modify_order_long_message_base) {
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.time_offset[modify_order_long_message_at] = (modify_order_long_message_base + 0 + modify_order_long_message_at + 1) % 256; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> modify_order_long_message_record.order_id[modify_order_long_message_at] = (modify_order_long_message_base + 4 + modify_order_long_message_at + 1) % 256; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.quantity_long[modify_order_long_message_at] = (modify_order_long_message_base + 12 + modify_order_long_message_at + 1) % 256; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> modify_order_long_message_record.price_long[modify_order_long_message_at] = (modify_order_long_message_base + 16 + modify_order_long_message_at + 1) % 256; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Long Message to the wire, 24 bytes from where the cursor stands */
inline encode_modify_order_long_message(modify_order_long_message_record) {
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> wire[at] = modify_order_long_message_record.time_offset[modify_order_long_message_at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> wire[at] = modify_order_long_message_record.order_id[modify_order_long_message_at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> wire[at] = modify_order_long_message_record.quantity_long[modify_order_long_message_at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> wire[at] = modify_order_long_message_record.price_long[modify_order_long_message_at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Long Message off the wire, 24 bytes from where the cursor stands */
inline decode_modify_order_long_message(modify_order_long_message_record) {
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.time_offset[modify_order_long_message_at] = wire[at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> modify_order_long_message_record.order_id[modify_order_long_message_at] = wire[at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> modify_order_long_message_record.quantity_long[modify_order_long_message_at] = wire[at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> modify_order_long_message_record.price_long[modify_order_long_message_at] = wire[at]; at = at + 1; modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order Long Message is what was written, byte for byte */
inline equal_modify_order_long_message(modify_order_long_message_read, modify_order_long_message_written) {
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> assert(modify_order_long_message_read.time_offset[modify_order_long_message_at] == modify_order_long_message_written.time_offset[modify_order_long_message_at]); modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> assert(modify_order_long_message_read.order_id[modify_order_long_message_at] == modify_order_long_message_written.order_id[modify_order_long_message_at]); modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 4 -> assert(modify_order_long_message_read.quantity_long[modify_order_long_message_at] == modify_order_long_message_written.quantity_long[modify_order_long_message_at]); modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  modify_order_long_message_at = 0;
  do
  :: modify_order_long_message_at < 8 -> assert(modify_order_long_message_read.price_long[modify_order_long_message_at] == modify_order_long_message_written.price_long[modify_order_long_message_at]); modify_order_long_message_at = modify_order_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Short Message: 16 bytes ------------------------------------ */

/* The Modify Order message is sent whenever an open order is visibly modified. The Order Id refers to the Order Id of the original Add Order message. Note that Modify Order messages that appear to be "no ops" (i.e. they do not appear to modify any relevant fields) will still lose priority. */
typedef ModifyOrderShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte quantity_short[2];
  byte price_short[2]
};

int modify_order_short_message_at;

/* every byte of Modify Order Short Message set to one value */
inline fill_modify_order_short_message(modify_order_short_message_record, modify_order_short_message_value) {
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 4 -> modify_order_short_message_record.time_offset[modify_order_short_message_at] = modify_order_short_message_value; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 8 -> modify_order_short_message_record.order_id[modify_order_short_message_at] = modify_order_short_message_value; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.quantity_short[modify_order_short_message_at] = modify_order_short_message_value; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.price_short[modify_order_short_message_at] = modify_order_short_message_value; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order Short Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_short_message(modify_order_short_message_record, modify_order_short_message_base) {
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 4 -> modify_order_short_message_record.time_offset[modify_order_short_message_at] = (modify_order_short_message_base + 0 + modify_order_short_message_at + 1) % 256; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 8 -> modify_order_short_message_record.order_id[modify_order_short_message_at] = (modify_order_short_message_base + 4 + modify_order_short_message_at + 1) % 256; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.quantity_short[modify_order_short_message_at] = (modify_order_short_message_base + 12 + modify_order_short_message_at + 1) % 256; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.price_short[modify_order_short_message_at] = (modify_order_short_message_base + 14 + modify_order_short_message_at + 1) % 256; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Short Message to the wire, 16 bytes from where the cursor stands */
inline encode_modify_order_short_message(modify_order_short_message_record) {
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 4 -> wire[at] = modify_order_short_message_record.time_offset[modify_order_short_message_at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 8 -> wire[at] = modify_order_short_message_record.order_id[modify_order_short_message_at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> wire[at] = modify_order_short_message_record.quantity_short[modify_order_short_message_at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> wire[at] = modify_order_short_message_record.price_short[modify_order_short_message_at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Short Message off the wire, 16 bytes from where the cursor stands */
inline decode_modify_order_short_message(modify_order_short_message_record) {
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 4 -> modify_order_short_message_record.time_offset[modify_order_short_message_at] = wire[at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 8 -> modify_order_short_message_record.order_id[modify_order_short_message_at] = wire[at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.quantity_short[modify_order_short_message_at] = wire[at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> modify_order_short_message_record.price_short[modify_order_short_message_at] = wire[at]; at = at + 1; modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order Short Message is what was written, byte for byte */
inline equal_modify_order_short_message(modify_order_short_message_read, modify_order_short_message_written) {
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 4 -> assert(modify_order_short_message_read.time_offset[modify_order_short_message_at] == modify_order_short_message_written.time_offset[modify_order_short_message_at]); modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 8 -> assert(modify_order_short_message_read.order_id[modify_order_short_message_at] == modify_order_short_message_written.order_id[modify_order_short_message_at]); modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> assert(modify_order_short_message_read.quantity_short[modify_order_short_message_at] == modify_order_short_message_written.quantity_short[modify_order_short_message_at]); modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  modify_order_short_message_at = 0;
  do
  :: modify_order_short_message_at < 2 -> assert(modify_order_short_message_read.price_short[modify_order_short_message_at] == modify_order_short_message_written.price_short[modify_order_short_message_at]); modify_order_short_message_at = modify_order_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Delete Order Message: 12 bytes ------------------------------------------ */

/* The Delete Order message is sent whenever a booked order is cancelled or leaves the order book. The Order Id refers to the Order Id of the original Add Order message. An order that is deleted from the book may return to the book later under certain circumstances. Therefore, a Delete Order message does not indicate that a given Order Id will not be sent again on a subsequent Add Order message. */
typedef DeleteOrderMessage {
  byte time_offset[4];
  byte order_id[8]
};

int delete_order_message_at;

/* every byte of Delete Order Message set to one value */
inline fill_delete_order_message(delete_order_message_record, delete_order_message_value) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.time_offset[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
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
  :: delete_order_message_at < 4 -> delete_order_message_record.time_offset[delete_order_message_at] = (delete_order_message_base + 0 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = (delete_order_message_base + 4 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message to the wire, 12 bytes from where the cursor stands */
inline encode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.time_offset[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.order_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message off the wire, 12 bytes from where the cursor stands */
inline decode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.time_offset[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
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
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.time_offset[delete_order_message_at] == delete_order_message_written.time_offset[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.order_id[delete_order_message_at] == delete_order_message_written.order_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Long Message: 40 bytes -------------------------------------------- */

/* The Trade message provides information about executions that occur off of the CFE book (such as Block trades). Trade messages are necessary to calculate CFE execution data. Trade messages do not alter the book and can be ignored if messages are being used solely to build a book. The Order Id sent in a Trade message is obfuscated and will not tie back to any real Order Id sent back via a FIX or BOE order entry session. */
typedef TradeLongMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_long[4];
  byte symbol[6];
  byte price_long[8];
  byte execution_id[8];
  byte trade_condition
};

int trade_long_message_at;

/* every byte of Trade Long Message set to one value */
inline fill_trade_long_message(trade_long_message_record, trade_long_message_value) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.time_offset[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.order_id[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.side_indicator = trade_long_message_value;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.quantity_long[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> trade_long_message_record.symbol[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.price_long[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.execution_id[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.trade_condition = trade_long_message_value;
  skip
}

/* each byte of Trade Long Message set to where it lies, so a field read out of place says so */
inline ramp_trade_long_message(trade_long_message_record, trade_long_message_base) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.time_offset[trade_long_message_at] = (trade_long_message_base + 0 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.order_id[trade_long_message_at] = (trade_long_message_base + 4 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.side_indicator = (trade_long_message_base + 12 + 1) % 256;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.quantity_long[trade_long_message_at] = (trade_long_message_base + 13 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> trade_long_message_record.symbol[trade_long_message_at] = (trade_long_message_base + 17 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.price_long[trade_long_message_at] = (trade_long_message_base + 23 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.execution_id[trade_long_message_at] = (trade_long_message_base + 31 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.trade_condition = (trade_long_message_base + 39 + 1) % 256;
  skip
}

/* Trade Long Message to the wire, 40 bytes from where the cursor stands */
inline encode_trade_long_message(trade_long_message_record) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> wire[at] = trade_long_message_record.time_offset[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> wire[at] = trade_long_message_record.order_id[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_long_message_record.side_indicator; at = at + 1;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> wire[at] = trade_long_message_record.quantity_long[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> wire[at] = trade_long_message_record.symbol[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> wire[at] = trade_long_message_record.price_long[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> wire[at] = trade_long_message_record.execution_id[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_long_message_record.trade_condition; at = at + 1;
  skip
}

/* Trade Long Message off the wire, 40 bytes from where the cursor stands */
inline decode_trade_long_message(trade_long_message_record) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.time_offset[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.order_id[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.side_indicator = wire[at]; at = at + 1;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> trade_long_message_record.quantity_long[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> trade_long_message_record.symbol[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.price_long[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.execution_id[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Long Message is what was written, byte for byte */
inline equal_trade_long_message(trade_long_message_read, trade_long_message_written) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> assert(trade_long_message_read.time_offset[trade_long_message_at] == trade_long_message_written.time_offset[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> assert(trade_long_message_read.order_id[trade_long_message_at] == trade_long_message_written.order_id[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  assert(trade_long_message_read.side_indicator == trade_long_message_written.side_indicator);
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 4 -> assert(trade_long_message_read.quantity_long[trade_long_message_at] == trade_long_message_written.quantity_long[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> assert(trade_long_message_read.symbol[trade_long_message_at] == trade_long_message_written.symbol[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> assert(trade_long_message_read.price_long[trade_long_message_at] == trade_long_message_written.price_long[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> assert(trade_long_message_read.execution_id[trade_long_message_at] == trade_long_message_written.execution_id[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  assert(trade_long_message_read.trade_condition == trade_long_message_written.trade_condition);
  skip
}

/* ---- Trade Short Message: 32 bytes ------------------------------------------- */

/* The Trade message provides information about executions that occur off of the CFE book (such as Block trades). Trade messages are necessary to calculate CFE execution data. Trade messages do not alter the book and can be ignored if messages are being used solely to build a book. The Order Id sent in a Trade message is obfuscated and will not tie back to any real Order Id sent back via a FIX or BOE order entry session. */
typedef TradeShortMessage {
  byte time_offset[4];
  byte order_id[8];
  byte side_indicator;
  byte quantity_short[2];
  byte symbol[6];
  byte price_short[2];
  byte execution_id[8];
  byte trade_condition
};

int trade_short_message_at;

/* every byte of Trade Short Message set to one value */
inline fill_trade_short_message(trade_short_message_record, trade_short_message_value) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> trade_short_message_record.time_offset[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.order_id[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.side_indicator = trade_short_message_value;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.quantity_short[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.symbol[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.price_short[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.execution_id[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.trade_condition = trade_short_message_value;
  skip
}

/* each byte of Trade Short Message set to where it lies, so a field read out of place says so */
inline ramp_trade_short_message(trade_short_message_record, trade_short_message_base) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> trade_short_message_record.time_offset[trade_short_message_at] = (trade_short_message_base + 0 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.order_id[trade_short_message_at] = (trade_short_message_base + 4 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.side_indicator = (trade_short_message_base + 12 + 1) % 256;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.quantity_short[trade_short_message_at] = (trade_short_message_base + 13 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.symbol[trade_short_message_at] = (trade_short_message_base + 15 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.price_short[trade_short_message_at] = (trade_short_message_base + 21 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.execution_id[trade_short_message_at] = (trade_short_message_base + 23 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.trade_condition = (trade_short_message_base + 31 + 1) % 256;
  skip
}

/* Trade Short Message to the wire, 32 bytes from where the cursor stands */
inline encode_trade_short_message(trade_short_message_record) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> wire[at] = trade_short_message_record.time_offset[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> wire[at] = trade_short_message_record.order_id[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_short_message_record.side_indicator; at = at + 1;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> wire[at] = trade_short_message_record.quantity_short[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> wire[at] = trade_short_message_record.symbol[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> wire[at] = trade_short_message_record.price_short[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> wire[at] = trade_short_message_record.execution_id[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_short_message_record.trade_condition; at = at + 1;
  skip
}

/* Trade Short Message off the wire, 32 bytes from where the cursor stands */
inline decode_trade_short_message(trade_short_message_record) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> trade_short_message_record.time_offset[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.order_id[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.side_indicator = wire[at]; at = at + 1;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.quantity_short[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.symbol[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> trade_short_message_record.price_short[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> trade_short_message_record.execution_id[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Short Message is what was written, byte for byte */
inline equal_trade_short_message(trade_short_message_read, trade_short_message_written) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 4 -> assert(trade_short_message_read.time_offset[trade_short_message_at] == trade_short_message_written.time_offset[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> assert(trade_short_message_read.order_id[trade_short_message_at] == trade_short_message_written.order_id[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  assert(trade_short_message_read.side_indicator == trade_short_message_written.side_indicator);
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> assert(trade_short_message_read.quantity_short[trade_short_message_at] == trade_short_message_written.quantity_short[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> assert(trade_short_message_read.symbol[trade_short_message_at] == trade_short_message_written.symbol[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 2 -> assert(trade_short_message_read.price_short[trade_short_message_at] == trade_short_message_written.price_short[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 8 -> assert(trade_short_message_read.execution_id[trade_short_message_at] == trade_short_message_written.execution_id[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  assert(trade_short_message_read.trade_condition == trade_short_message_written.trade_condition);
  skip
}

/* ---- Trade Break Message: 12 bytes ------------------------------------------- */

/* The Trade Break message is sent whenever an execution on CFE is broken. Trade breaks are rare and only affect applications that rely upon CFE execution-based data. A Trade Break message followed immediately be a new Trade message with the same Execution Id indicates that a trade correction has occurred. Applications that simply build a CFE book can ignore Trade Break messages. */
typedef TradeBreakMessage {
  byte time_offset[4];
  byte execution_id[8]
};

int trade_break_message_at;

/* every byte of Trade Break Message set to one value */
inline fill_trade_break_message(trade_break_message_record, trade_break_message_value) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.time_offset[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_trade_break_message(trade_break_message_record, trade_break_message_base) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.time_offset[trade_break_message_at] = (trade_break_message_base + 0 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = (trade_break_message_base + 4 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Break Message to the wire, 12 bytes from where the cursor stands */
inline encode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> wire[at] = trade_break_message_record.time_offset[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.execution_id[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Break Message off the wire, 12 bytes from where the cursor stands */
inline decode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.time_offset[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Break Message is what was written, byte for byte */
inline equal_trade_break_message(trade_break_message_read, trade_break_message_written) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> assert(trade_break_message_read.time_offset[trade_break_message_at] == trade_break_message_written.time_offset[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.execution_id[trade_break_message_at] == trade_break_message_written.execution_id[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Settlement Message: 23 bytes -------------------------------------------- */

/* Settlement messages are used to provide information concerning indicative, approved, or corrected daily and final settlement prices for CFE products. An indicative daily settlement price (Issue = I) is calculated by the system and sent immediately after an instrument closes trading but before the settlement price is approved. An approved settlement price (Issue = S) is sent once the CFE Trade Desk approves a settlement price for an instrument. If there is an error in the approved settlement price, then it may be re-issued (Issue = R). */
typedef SettlementMessage {
  byte time_offset[4];
  byte symbol[6];
  byte trade_date[4];
  byte settlement_price[8];
  byte issue
};

int settlement_message_at;

/* every byte of Settlement Message set to one value */
inline fill_settlement_message(settlement_message_record, settlement_message_value) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.time_offset[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> settlement_message_record.symbol[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.trade_date[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> settlement_message_record.settlement_price[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_record.issue = settlement_message_value;
  skip
}

/* each byte of Settlement Message set to where it lies, so a field read out of place says so */
inline ramp_settlement_message(settlement_message_record, settlement_message_base) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.time_offset[settlement_message_at] = (settlement_message_base + 0 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> settlement_message_record.symbol[settlement_message_at] = (settlement_message_base + 4 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.trade_date[settlement_message_at] = (settlement_message_base + 10 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> settlement_message_record.settlement_price[settlement_message_at] = (settlement_message_base + 14 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_record.issue = (settlement_message_base + 22 + 1) % 256;
  skip
}

/* Settlement Message to the wire, 23 bytes from where the cursor stands */
inline encode_settlement_message(settlement_message_record) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> wire[at] = settlement_message_record.time_offset[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> wire[at] = settlement_message_record.symbol[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> wire[at] = settlement_message_record.trade_date[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> wire[at] = settlement_message_record.settlement_price[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  wire[at] = settlement_message_record.issue; at = at + 1;
  skip
}

/* Settlement Message off the wire, 23 bytes from where the cursor stands */
inline decode_settlement_message(settlement_message_record) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.time_offset[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> settlement_message_record.symbol[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.trade_date[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> settlement_message_record.settlement_price[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_record.issue = wire[at]; at = at + 1;
  skip
}

/* what was read of Settlement Message is what was written, byte for byte */
inline equal_settlement_message(settlement_message_read, settlement_message_written) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> assert(settlement_message_read.time_offset[settlement_message_at] == settlement_message_written.time_offset[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> assert(settlement_message_read.symbol[settlement_message_at] == settlement_message_written.symbol[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> assert(settlement_message_read.trade_date[settlement_message_at] == settlement_message_written.trade_date[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> assert(settlement_message_read.settlement_price[settlement_message_at] == settlement_message_written.settlement_price[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  assert(settlement_message_read.issue == settlement_message_written.issue);
  skip
}

/* ---- End Of Session Message: 4 bytes ----------------------------------------- */

/* The End of Session message is sent for each unit when the unit shuts down. No more sequenced messages will be delivered for this unit, but heartbeats from the unit may be received. */
typedef EndOfSessionMessage {
  byte time_offset[4]
};

int end_of_session_message_at;

/* every byte of End Of Session Message set to one value */
inline fill_end_of_session_message(end_of_session_message_record, end_of_session_message_value) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.time_offset[end_of_session_message_at] = end_of_session_message_value; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Session Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_session_message(end_of_session_message_record, end_of_session_message_base) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.time_offset[end_of_session_message_at] = (end_of_session_message_base + 0 + end_of_session_message_at + 1) % 256; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session Message to the wire, 4 bytes from where the cursor stands */
inline encode_end_of_session_message(end_of_session_message_record) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> wire[at] = end_of_session_message_record.time_offset[end_of_session_message_at]; at = at + 1; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session Message off the wire, 4 bytes from where the cursor stands */
inline decode_end_of_session_message(end_of_session_message_record) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.time_offset[end_of_session_message_at] = wire[at]; at = at + 1; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Session Message is what was written, byte for byte */
inline equal_end_of_session_message(end_of_session_message_read, end_of_session_message_written) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> assert(end_of_session_message_read.time_offset[end_of_session_message_at] == end_of_session_message_written.time_offset[end_of_session_message_at]); end_of_session_message_at = end_of_session_message_at + 1
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
    assert(at == 8);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 8);
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
    assert(at == 2);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 2);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Time Reference Message: encoded, read back, and compared */
proctype check_time_reference_message() {
  TimeReferenceMessage time_reference_message_sent;
  TimeReferenceMessage time_reference_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time_reference_message(time_reference_message_sent, 0)
  :: pattern == 1 -> fill_time_reference_message(time_reference_message_sent, 32)
  :: pattern == 2 -> fill_time_reference_message(time_reference_message_sent, 255)
  :: else -> ramp_time_reference_message(time_reference_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time_reference_message(time_reference_message_sent);
    assert(at == 16);
    at = 0;
    decode_time_reference_message(time_reference_message_got);
    assert(at == 16);
    equal_time_reference_message(time_reference_message_got, time_reference_message_sent)
  }
}

/* Time Message: encoded, read back, and compared */
proctype check_time_message() {
  TimeMessage time_message_sent;
  TimeMessage time_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time_message(time_message_sent, 0)
  :: pattern == 1 -> fill_time_message(time_message_sent, 32)
  :: pattern == 2 -> fill_time_message(time_message_sent, 255)
  :: else -> ramp_time_message(time_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time_message(time_message_sent);
    assert(at == 8);
    at = 0;
    decode_time_message(time_message_got);
    assert(at == 8);
    equal_time_message(time_message_got, time_message_sent)
  }
}

/* Unit Clear Message: encoded, read back, and compared */
proctype check_unit_clear_message() {
  UnitClearMessage unit_clear_message_sent;
  UnitClearMessage unit_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unit_clear_message(unit_clear_message_sent, 0)
  :: pattern == 1 -> fill_unit_clear_message(unit_clear_message_sent, 32)
  :: pattern == 2 -> fill_unit_clear_message(unit_clear_message_sent, 255)
  :: else -> ramp_unit_clear_message(unit_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unit_clear_message(unit_clear_message_sent);
    assert(at == 4);
    at = 0;
    decode_unit_clear_message(unit_clear_message_got);
    assert(at == 4);
    equal_unit_clear_message(unit_clear_message_got, unit_clear_message_sent)
  }
}

/* Transaction Begin Message: encoded, read back, and compared */
proctype check_transaction_begin_message() {
  TransactionBeginMessage transaction_begin_message_sent;
  TransactionBeginMessage transaction_begin_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transaction_begin_message(transaction_begin_message_sent, 0)
  :: pattern == 1 -> fill_transaction_begin_message(transaction_begin_message_sent, 32)
  :: pattern == 2 -> fill_transaction_begin_message(transaction_begin_message_sent, 255)
  :: else -> ramp_transaction_begin_message(transaction_begin_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transaction_begin_message(transaction_begin_message_sent);
    assert(at == 4);
    at = 0;
    decode_transaction_begin_message(transaction_begin_message_got);
    assert(at == 4);
    equal_transaction_begin_message(transaction_begin_message_got, transaction_begin_message_sent)
  }
}

/* Transaction End Message: encoded, read back, and compared */
proctype check_transaction_end_message() {
  TransactionEndMessage transaction_end_message_sent;
  TransactionEndMessage transaction_end_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transaction_end_message(transaction_end_message_sent, 0)
  :: pattern == 1 -> fill_transaction_end_message(transaction_end_message_sent, 32)
  :: pattern == 2 -> fill_transaction_end_message(transaction_end_message_sent, 255)
  :: else -> ramp_transaction_end_message(transaction_end_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transaction_end_message(transaction_end_message_sent);
    assert(at == 4);
    at = 0;
    decode_transaction_end_message(transaction_end_message_got);
    assert(at == 4);
    equal_transaction_end_message(transaction_end_message_got, transaction_end_message_sent)
  }
}

/* Oof Symbol Mapping Message: encoded, read back, and compared */
proctype check_oof_symbol_mapping_message() {
  OofSymbolMappingMessage oof_symbol_mapping_message_sent;
  OofSymbolMappingMessage oof_symbol_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_oof_symbol_mapping_message(oof_symbol_mapping_message_sent, 0)
  :: pattern == 1 -> fill_oof_symbol_mapping_message(oof_symbol_mapping_message_sent, 32)
  :: pattern == 2 -> fill_oof_symbol_mapping_message(oof_symbol_mapping_message_sent, 255)
  :: else -> ramp_oof_symbol_mapping_message(oof_symbol_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_oof_symbol_mapping_message(oof_symbol_mapping_message_sent);
    assert(at == 58);
    at = 0;
    decode_oof_symbol_mapping_message(oof_symbol_mapping_message_got);
    assert(at == 58);
    equal_oof_symbol_mapping_message(oof_symbol_mapping_message_got, oof_symbol_mapping_message_sent)
  }
}

/* Trading Status Message: encoded, read back, and compared */
proctype check_trading_status_message() {
  TradingStatusMessage trading_status_message_sent;
  TradingStatusMessage trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_status_message(trading_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_status_message(trading_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_status_message(trading_status_message_sent, 255)
  :: else -> ramp_trading_status_message(trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_status_message(trading_status_message_sent);
    assert(at == 16);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 16);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
  }
}

/* Add Order Long Message: encoded, read back, and compared */
proctype check_add_order_long_message() {
  AddOrderLongMessage add_order_long_message_sent;
  AddOrderLongMessage add_order_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_long_message(add_order_long_message_sent, 0)
  :: pattern == 1 -> fill_add_order_long_message(add_order_long_message_sent, 32)
  :: pattern == 2 -> fill_add_order_long_message(add_order_long_message_sent, 255)
  :: else -> ramp_add_order_long_message(add_order_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_long_message(add_order_long_message_sent);
    assert(at == 31);
    at = 0;
    decode_add_order_long_message(add_order_long_message_got);
    assert(at == 31);
    equal_add_order_long_message(add_order_long_message_got, add_order_long_message_sent)
  }
}

/* Add Order Short Message: encoded, read back, and compared */
proctype check_add_order_short_message() {
  AddOrderShortMessage add_order_short_message_sent;
  AddOrderShortMessage add_order_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_short_message(add_order_short_message_sent, 0)
  :: pattern == 1 -> fill_add_order_short_message(add_order_short_message_sent, 32)
  :: pattern == 2 -> fill_add_order_short_message(add_order_short_message_sent, 255)
  :: else -> ramp_add_order_short_message(add_order_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_short_message(add_order_short_message_sent);
    assert(at == 23);
    at = 0;
    decode_add_order_short_message(add_order_short_message_got);
    assert(at == 23);
    equal_add_order_short_message(add_order_short_message_got, add_order_short_message_sent)
  }
}

/* Order Executed Message: encoded, read back, and compared */
proctype check_order_executed_message() {
  OrderExecutedMessage order_executed_message_sent;
  OrderExecutedMessage order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_message(order_executed_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_message(order_executed_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_message(order_executed_message_sent, 255)
  :: else -> ramp_order_executed_message(order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_message(order_executed_message_sent);
    assert(at == 25);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 25);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Reduce Size Long Message: encoded, read back, and compared */
proctype check_reduce_size_long_message() {
  ReduceSizeLongMessage reduce_size_long_message_sent;
  ReduceSizeLongMessage reduce_size_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reduce_size_long_message(reduce_size_long_message_sent, 0)
  :: pattern == 1 -> fill_reduce_size_long_message(reduce_size_long_message_sent, 32)
  :: pattern == 2 -> fill_reduce_size_long_message(reduce_size_long_message_sent, 255)
  :: else -> ramp_reduce_size_long_message(reduce_size_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reduce_size_long_message(reduce_size_long_message_sent);
    assert(at == 16);
    at = 0;
    decode_reduce_size_long_message(reduce_size_long_message_got);
    assert(at == 16);
    equal_reduce_size_long_message(reduce_size_long_message_got, reduce_size_long_message_sent)
  }
}

/* Reduce Size Short Message: encoded, read back, and compared */
proctype check_reduce_size_short_message() {
  ReduceSizeShortMessage reduce_size_short_message_sent;
  ReduceSizeShortMessage reduce_size_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reduce_size_short_message(reduce_size_short_message_sent, 0)
  :: pattern == 1 -> fill_reduce_size_short_message(reduce_size_short_message_sent, 32)
  :: pattern == 2 -> fill_reduce_size_short_message(reduce_size_short_message_sent, 255)
  :: else -> ramp_reduce_size_short_message(reduce_size_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reduce_size_short_message(reduce_size_short_message_sent);
    assert(at == 14);
    at = 0;
    decode_reduce_size_short_message(reduce_size_short_message_got);
    assert(at == 14);
    equal_reduce_size_short_message(reduce_size_short_message_got, reduce_size_short_message_sent)
  }
}

/* Modify Order Long Message: encoded, read back, and compared */
proctype check_modify_order_long_message() {
  ModifyOrderLongMessage modify_order_long_message_sent;
  ModifyOrderLongMessage modify_order_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_long_message(modify_order_long_message_sent, 0)
  :: pattern == 1 -> fill_modify_order_long_message(modify_order_long_message_sent, 32)
  :: pattern == 2 -> fill_modify_order_long_message(modify_order_long_message_sent, 255)
  :: else -> ramp_modify_order_long_message(modify_order_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_long_message(modify_order_long_message_sent);
    assert(at == 24);
    at = 0;
    decode_modify_order_long_message(modify_order_long_message_got);
    assert(at == 24);
    equal_modify_order_long_message(modify_order_long_message_got, modify_order_long_message_sent)
  }
}

/* Modify Order Short Message: encoded, read back, and compared */
proctype check_modify_order_short_message() {
  ModifyOrderShortMessage modify_order_short_message_sent;
  ModifyOrderShortMessage modify_order_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_short_message(modify_order_short_message_sent, 0)
  :: pattern == 1 -> fill_modify_order_short_message(modify_order_short_message_sent, 32)
  :: pattern == 2 -> fill_modify_order_short_message(modify_order_short_message_sent, 255)
  :: else -> ramp_modify_order_short_message(modify_order_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_short_message(modify_order_short_message_sent);
    assert(at == 16);
    at = 0;
    decode_modify_order_short_message(modify_order_short_message_got);
    assert(at == 16);
    equal_modify_order_short_message(modify_order_short_message_got, modify_order_short_message_sent)
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
    assert(at == 12);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 12);
    equal_delete_order_message(delete_order_message_got, delete_order_message_sent)
  }
}

/* Trade Long Message: encoded, read back, and compared */
proctype check_trade_long_message() {
  TradeLongMessage trade_long_message_sent;
  TradeLongMessage trade_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_long_message(trade_long_message_sent, 0)
  :: pattern == 1 -> fill_trade_long_message(trade_long_message_sent, 32)
  :: pattern == 2 -> fill_trade_long_message(trade_long_message_sent, 255)
  :: else -> ramp_trade_long_message(trade_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_long_message(trade_long_message_sent);
    assert(at == 40);
    at = 0;
    decode_trade_long_message(trade_long_message_got);
    assert(at == 40);
    equal_trade_long_message(trade_long_message_got, trade_long_message_sent)
  }
}

/* Trade Short Message: encoded, read back, and compared */
proctype check_trade_short_message() {
  TradeShortMessage trade_short_message_sent;
  TradeShortMessage trade_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_short_message(trade_short_message_sent, 0)
  :: pattern == 1 -> fill_trade_short_message(trade_short_message_sent, 32)
  :: pattern == 2 -> fill_trade_short_message(trade_short_message_sent, 255)
  :: else -> ramp_trade_short_message(trade_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_short_message(trade_short_message_sent);
    assert(at == 32);
    at = 0;
    decode_trade_short_message(trade_short_message_got);
    assert(at == 32);
    equal_trade_short_message(trade_short_message_got, trade_short_message_sent)
  }
}

/* Trade Break Message: encoded, read back, and compared */
proctype check_trade_break_message() {
  TradeBreakMessage trade_break_message_sent;
  TradeBreakMessage trade_break_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_break_message(trade_break_message_sent, 0)
  :: pattern == 1 -> fill_trade_break_message(trade_break_message_sent, 32)
  :: pattern == 2 -> fill_trade_break_message(trade_break_message_sent, 255)
  :: else -> ramp_trade_break_message(trade_break_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_break_message(trade_break_message_sent);
    assert(at == 12);
    at = 0;
    decode_trade_break_message(trade_break_message_got);
    assert(at == 12);
    equal_trade_break_message(trade_break_message_got, trade_break_message_sent)
  }
}

/* Settlement Message: encoded, read back, and compared */
proctype check_settlement_message() {
  SettlementMessage settlement_message_sent;
  SettlementMessage settlement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_settlement_message(settlement_message_sent, 0)
  :: pattern == 1 -> fill_settlement_message(settlement_message_sent, 32)
  :: pattern == 2 -> fill_settlement_message(settlement_message_sent, 255)
  :: else -> ramp_settlement_message(settlement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_settlement_message(settlement_message_sent);
    assert(at == 23);
    at = 0;
    decode_settlement_message(settlement_message_got);
    assert(at == 23);
    equal_settlement_message(settlement_message_got, settlement_message_sent)
  }
}

/* End Of Session Message: encoded, read back, and compared */
proctype check_end_of_session_message() {
  EndOfSessionMessage end_of_session_message_sent;
  EndOfSessionMessage end_of_session_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_session_message(end_of_session_message_sent, 0)
  :: pattern == 1 -> fill_end_of_session_message(end_of_session_message_sent, 32)
  :: pattern == 2 -> fill_end_of_session_message(end_of_session_message_sent, 255)
  :: else -> ramp_end_of_session_message(end_of_session_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_session_message(end_of_session_message_sent);
    assert(at == 4);
    at = 0;
    decode_end_of_session_message(end_of_session_message_got);
    assert(at == 4);
    equal_end_of_session_message(end_of_session_message_got, end_of_session_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_time_reference_message()
  :: run check_time_message()
  :: run check_unit_clear_message()
  :: run check_transaction_begin_message()
  :: run check_transaction_end_message()
  :: run check_oof_symbol_mapping_message()
  :: run check_trading_status_message()
  :: run check_add_order_long_message()
  :: run check_add_order_short_message()
  :: run check_order_executed_message()
  :: run check_reduce_size_long_message()
  :: run check_reduce_size_short_message()
  :: run check_modify_order_long_message()
  :: run check_modify_order_short_message()
  :: run check_delete_order_message()
  :: run check_trade_long_message()
  :: run check_trade_short_message()
  :: run check_trade_break_message()
  :: run check_settlement_message()
  :: run check_end_of_session_message()
  fi
}
