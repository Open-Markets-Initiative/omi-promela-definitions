/*
 * Tradelogiq Markets Inc. Lynx Multicast Level 1
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
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 20

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Request Packet: 20 bytes ------------------------------------------------ */

/* Sent to a Re-request server to request the retransmission of a particular message or group of messages */
typedef RequestPacket {
  byte request_session[10];
  byte request_sequence_number[8];
  byte requested_message_count[2]
};

int request_packet_at;

/* every byte of Request Packet set to one value */
inline fill_request_packet(request_packet_record, request_packet_value) {
  request_packet_at = 0;
  do
  :: request_packet_at < 10 -> request_packet_record.request_session[request_packet_at] = request_packet_value; request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  request_packet_at = 0;
  do
  :: request_packet_at < 8 -> request_packet_record.request_sequence_number[request_packet_at] = request_packet_value; request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  request_packet_at = 0;
  do
  :: request_packet_at < 2 -> request_packet_record.requested_message_count[request_packet_at] = request_packet_value; request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Request Packet set to where it lies, so a field read out of place says so */
inline ramp_request_packet(request_packet_record, request_packet_base) {
  request_packet_at = 0;
  do
  :: request_packet_at < 10 -> request_packet_record.request_session[request_packet_at] = (request_packet_base + 0 + request_packet_at + 1) % 256; request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  request_packet_at = 0;
  do
  :: request_packet_at < 8 -> request_packet_record.request_sequence_number[request_packet_at] = (request_packet_base + 10 + request_packet_at + 1) % 256; request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  request_packet_at = 0;
  do
  :: request_packet_at < 2 -> request_packet_record.requested_message_count[request_packet_at] = (request_packet_base + 18 + request_packet_at + 1) % 256; request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Request Packet to the wire, 20 bytes from where the cursor stands */
inline encode_request_packet(request_packet_record) {
  request_packet_at = 0;
  do
  :: request_packet_at < 10 -> wire[at] = request_packet_record.request_session[request_packet_at]; at = at + 1; request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  request_packet_at = 0;
  do
  :: request_packet_at < 8 -> wire[at] = request_packet_record.request_sequence_number[request_packet_at]; at = at + 1; request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  request_packet_at = 0;
  do
  :: request_packet_at < 2 -> wire[at] = request_packet_record.requested_message_count[request_packet_at]; at = at + 1; request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Request Packet off the wire, 20 bytes from where the cursor stands */
inline decode_request_packet(request_packet_record) {
  request_packet_at = 0;
  do
  :: request_packet_at < 10 -> request_packet_record.request_session[request_packet_at] = wire[at]; at = at + 1; request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  request_packet_at = 0;
  do
  :: request_packet_at < 8 -> request_packet_record.request_sequence_number[request_packet_at] = wire[at]; at = at + 1; request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  request_packet_at = 0;
  do
  :: request_packet_at < 2 -> request_packet_record.requested_message_count[request_packet_at] = wire[at]; at = at + 1; request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Request Packet is what was written, byte for byte */
inline equal_request_packet(request_packet_read, request_packet_written) {
  request_packet_at = 0;
  do
  :: request_packet_at < 10 -> assert(request_packet_read.request_session[request_packet_at] == request_packet_written.request_session[request_packet_at]); request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  request_packet_at = 0;
  do
  :: request_packet_at < 8 -> assert(request_packet_read.request_sequence_number[request_packet_at] == request_packet_written.request_sequence_number[request_packet_at]); request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  request_packet_at = 0;
  do
  :: request_packet_at < 2 -> assert(request_packet_read.requested_message_count[request_packet_at] == request_packet_written.requested_message_count[request_packet_at]); request_packet_at = request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Request Packet: encoded, read back, and compared */
proctype check_request_packet() {
  RequestPacket request_packet_sent;
  RequestPacket request_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_packet(request_packet_sent, 0)
  :: pattern == 1 -> fill_request_packet(request_packet_sent, 32)
  :: pattern == 2 -> fill_request_packet(request_packet_sent, 255)
  :: else -> ramp_request_packet(request_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_packet(request_packet_sent);
    assert(at == 20);
    at = 0;
    decode_request_packet(request_packet_got);
    assert(at == 20);
    equal_request_packet(request_packet_got, request_packet_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_request_packet()
  fi
}
