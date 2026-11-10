/*
 * Texas Stock Exchange Session Enabled Entry Daemon
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
 *   - a field read in bits
 *   - a field present only on a condition
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 32

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Rake Message Header: 3 bytes -------------------------------------------- */

/* Rake Tcp per-message header carrying the frame length and packet-level dispatch byte */
typedef RakeMessageHeader {
  byte message_length[2];
  byte packet_type
};

int rake_message_header_at;

/* every byte of Rake Message Header set to one value */
inline fill_rake_message_header(rake_message_header_record, rake_message_header_value) {
  rake_message_header_at = 0;
  do
  :: rake_message_header_at < 2 -> rake_message_header_record.message_length[rake_message_header_at] = rake_message_header_value; rake_message_header_at = rake_message_header_at + 1
  :: else -> break
  od;
  rake_message_header_record.packet_type = rake_message_header_value;
  skip
}

/* each byte of Rake Message Header set to where it lies, so a field read out of place says so */
inline ramp_rake_message_header(rake_message_header_record, rake_message_header_base) {
  rake_message_header_at = 0;
  do
  :: rake_message_header_at < 2 -> rake_message_header_record.message_length[rake_message_header_at] = (rake_message_header_base + 0 + rake_message_header_at + 1) % 256; rake_message_header_at = rake_message_header_at + 1
  :: else -> break
  od;
  rake_message_header_record.packet_type = (rake_message_header_base + 2 + 1) % 256;
  skip
}

/* Rake Message Header to the wire, 3 bytes from where the cursor stands */
inline encode_rake_message_header(rake_message_header_record) {
  rake_message_header_at = 0;
  do
  :: rake_message_header_at < 2 -> wire[at] = rake_message_header_record.message_length[rake_message_header_at]; at = at + 1; rake_message_header_at = rake_message_header_at + 1
  :: else -> break
  od;
  wire[at] = rake_message_header_record.packet_type; at = at + 1;
  skip
}

/* Rake Message Header off the wire, 3 bytes from where the cursor stands */
inline decode_rake_message_header(rake_message_header_record) {
  rake_message_header_at = 0;
  do
  :: rake_message_header_at < 2 -> rake_message_header_record.message_length[rake_message_header_at] = wire[at]; at = at + 1; rake_message_header_at = rake_message_header_at + 1
  :: else -> break
  od;
  rake_message_header_record.packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Rake Message Header is what was written, byte for byte */
inline equal_rake_message_header(rake_message_header_read, rake_message_header_written) {
  rake_message_header_at = 0;
  do
  :: rake_message_header_at < 2 -> assert(rake_message_header_read.message_length[rake_message_header_at] == rake_message_header_written.message_length[rake_message_header_at]); rake_message_header_at = rake_message_header_at + 1
  :: else -> break
  od;
  assert(rake_message_header_read.packet_type == rake_message_header_written.packet_type);
  skip
}

/* ---- Logon Request Packet: 32 bytes ------------------------------------------ */

/* Must be the first message a Member sends to the Exchange after establishing a TCP/IP connection */
typedef LogonRequestPacket {
  byte session[8];
  byte sender_comp[8];
  byte token[8];
  byte next_sequence_number[8]
};

int logon_request_packet_at;

/* every byte of Logon Request Packet set to one value */
inline fill_logon_request_packet(logon_request_packet_record, logon_request_packet_value) {
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> logon_request_packet_record.session[logon_request_packet_at] = logon_request_packet_value; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> logon_request_packet_record.sender_comp[logon_request_packet_at] = logon_request_packet_value; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> logon_request_packet_record.token[logon_request_packet_at] = logon_request_packet_value; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> logon_request_packet_record.next_sequence_number[logon_request_packet_at] = logon_request_packet_value; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Request Packet set to where it lies, so a field read out of place says so */
inline ramp_logon_request_packet(logon_request_packet_record, logon_request_packet_base) {
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> logon_request_packet_record.session[logon_request_packet_at] = (logon_request_packet_base + 0 + logon_request_packet_at + 1) % 256; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> logon_request_packet_record.sender_comp[logon_request_packet_at] = (logon_request_packet_base + 8 + logon_request_packet_at + 1) % 256; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> logon_request_packet_record.token[logon_request_packet_at] = (logon_request_packet_base + 16 + logon_request_packet_at + 1) % 256; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> logon_request_packet_record.next_sequence_number[logon_request_packet_at] = (logon_request_packet_base + 24 + logon_request_packet_at + 1) % 256; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Request Packet to the wire, 32 bytes from where the cursor stands */
inline encode_logon_request_packet(logon_request_packet_record) {
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> wire[at] = logon_request_packet_record.session[logon_request_packet_at]; at = at + 1; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> wire[at] = logon_request_packet_record.sender_comp[logon_request_packet_at]; at = at + 1; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> wire[at] = logon_request_packet_record.token[logon_request_packet_at]; at = at + 1; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> wire[at] = logon_request_packet_record.next_sequence_number[logon_request_packet_at]; at = at + 1; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Request Packet off the wire, 32 bytes from where the cursor stands */
inline decode_logon_request_packet(logon_request_packet_record) {
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> logon_request_packet_record.session[logon_request_packet_at] = wire[at]; at = at + 1; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> logon_request_packet_record.sender_comp[logon_request_packet_at] = wire[at]; at = at + 1; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> logon_request_packet_record.token[logon_request_packet_at] = wire[at]; at = at + 1; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> logon_request_packet_record.next_sequence_number[logon_request_packet_at] = wire[at]; at = at + 1; logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Request Packet is what was written, byte for byte */
inline equal_logon_request_packet(logon_request_packet_read, logon_request_packet_written) {
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> assert(logon_request_packet_read.session[logon_request_packet_at] == logon_request_packet_written.session[logon_request_packet_at]); logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> assert(logon_request_packet_read.sender_comp[logon_request_packet_at] == logon_request_packet_written.sender_comp[logon_request_packet_at]); logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> assert(logon_request_packet_read.token[logon_request_packet_at] == logon_request_packet_written.token[logon_request_packet_at]); logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  logon_request_packet_at = 0;
  do
  :: logon_request_packet_at < 8 -> assert(logon_request_packet_read.next_sequence_number[logon_request_packet_at] == logon_request_packet_written.next_sequence_number[logon_request_packet_at]); logon_request_packet_at = logon_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order Message: 8 bytes ------------------------------------------- */

/* Cancel all outstanding shares of an order. */
typedef CancelOrderMessage {
  byte orig_cl_ord_id[8]
};

int cancel_order_message_at;

/* every byte of Cancel Order Message set to one value */
inline fill_cancel_order_message(cancel_order_message_record, cancel_order_message_value) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> cancel_order_message_record.orig_cl_ord_id[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_message(cancel_order_message_record, cancel_order_message_base) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> cancel_order_message_record.orig_cl_ord_id[cancel_order_message_at] = (cancel_order_message_base + 0 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message to the wire, 8 bytes from where the cursor stands */
inline encode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> wire[at] = cancel_order_message_record.orig_cl_ord_id[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message off the wire, 8 bytes from where the cursor stands */
inline decode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> cancel_order_message_record.orig_cl_ord_id[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Message is what was written, byte for byte */
inline equal_cancel_order_message(cancel_order_message_read, cancel_order_message_written) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> assert(cancel_order_message_read.orig_cl_ord_id[cancel_order_message_at] == cancel_order_message_written.orig_cl_ord_id[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Rake Message Header: encoded, read back, and compared */
proctype check_rake_message_header() {
  RakeMessageHeader rake_message_header_sent;
  RakeMessageHeader rake_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rake_message_header(rake_message_header_sent, 0)
  :: pattern == 1 -> fill_rake_message_header(rake_message_header_sent, 32)
  :: pattern == 2 -> fill_rake_message_header(rake_message_header_sent, 255)
  :: else -> ramp_rake_message_header(rake_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rake_message_header(rake_message_header_sent);
    assert(at == 3);
    at = 0;
    decode_rake_message_header(rake_message_header_got);
    assert(at == 3);
    equal_rake_message_header(rake_message_header_got, rake_message_header_sent)
  }
}

/* Logon Request Packet: encoded, read back, and compared */
proctype check_logon_request_packet() {
  LogonRequestPacket logon_request_packet_sent;
  LogonRequestPacket logon_request_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_request_packet(logon_request_packet_sent, 0)
  :: pattern == 1 -> fill_logon_request_packet(logon_request_packet_sent, 32)
  :: pattern == 2 -> fill_logon_request_packet(logon_request_packet_sent, 255)
  :: else -> ramp_logon_request_packet(logon_request_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_request_packet(logon_request_packet_sent);
    assert(at == 32);
    at = 0;
    decode_logon_request_packet(logon_request_packet_got);
    assert(at == 32);
    equal_logon_request_packet(logon_request_packet_got, logon_request_packet_sent)
  }
}

/* Cancel Order Message: encoded, read back, and compared */
proctype check_cancel_order_message() {
  CancelOrderMessage cancel_order_message_sent;
  CancelOrderMessage cancel_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_message(cancel_order_message_sent, 0)
  :: pattern == 1 -> fill_cancel_order_message(cancel_order_message_sent, 32)
  :: pattern == 2 -> fill_cancel_order_message(cancel_order_message_sent, 255)
  :: else -> ramp_cancel_order_message(cancel_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_message(cancel_order_message_sent);
    assert(at == 8);
    at = 0;
    decode_cancel_order_message(cancel_order_message_got);
    assert(at == 8);
    equal_cancel_order_message(cancel_order_message_got, cancel_order_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_rake_message_header()
  :: run check_logon_request_packet()
  :: run check_cancel_order_message()
  fi
}
