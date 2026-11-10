/*
 * CIX Trading Inc. CIX Udp Rerequest
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

/* ---- Rerequest Header: 20 bytes ---------------------------------------------- */

/* Aspen Udp rerequest header */
typedef RerequestHeader {
  byte market_day_identifier[9];
  byte feed_identifier;
  byte sequence[8];
  byte count[2]
};

int rerequest_header_at;

/* every byte of Rerequest Header set to one value */
inline fill_rerequest_header(rerequest_header_record, rerequest_header_value) {
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 9 -> rerequest_header_record.market_day_identifier[rerequest_header_at] = rerequest_header_value; rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  rerequest_header_record.feed_identifier = rerequest_header_value;
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 8 -> rerequest_header_record.sequence[rerequest_header_at] = rerequest_header_value; rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 2 -> rerequest_header_record.count[rerequest_header_at] = rerequest_header_value; rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Rerequest Header set to where it lies, so a field read out of place says so */
inline ramp_rerequest_header(rerequest_header_record, rerequest_header_base) {
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 9 -> rerequest_header_record.market_day_identifier[rerequest_header_at] = (rerequest_header_base + 0 + rerequest_header_at + 1) % 256; rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  rerequest_header_record.feed_identifier = (rerequest_header_base + 9 + 1) % 256;
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 8 -> rerequest_header_record.sequence[rerequest_header_at] = (rerequest_header_base + 10 + rerequest_header_at + 1) % 256; rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 2 -> rerequest_header_record.count[rerequest_header_at] = (rerequest_header_base + 18 + rerequest_header_at + 1) % 256; rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  skip
}

/* Rerequest Header to the wire, 20 bytes from where the cursor stands */
inline encode_rerequest_header(rerequest_header_record) {
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 9 -> wire[at] = rerequest_header_record.market_day_identifier[rerequest_header_at]; at = at + 1; rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  wire[at] = rerequest_header_record.feed_identifier; at = at + 1;
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 8 -> wire[at] = rerequest_header_record.sequence[rerequest_header_at]; at = at + 1; rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 2 -> wire[at] = rerequest_header_record.count[rerequest_header_at]; at = at + 1; rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  skip
}

/* Rerequest Header off the wire, 20 bytes from where the cursor stands */
inline decode_rerequest_header(rerequest_header_record) {
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 9 -> rerequest_header_record.market_day_identifier[rerequest_header_at] = wire[at]; at = at + 1; rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  rerequest_header_record.feed_identifier = wire[at]; at = at + 1;
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 8 -> rerequest_header_record.sequence[rerequest_header_at] = wire[at]; at = at + 1; rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 2 -> rerequest_header_record.count[rerequest_header_at] = wire[at]; at = at + 1; rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Rerequest Header is what was written, byte for byte */
inline equal_rerequest_header(rerequest_header_read, rerequest_header_written) {
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 9 -> assert(rerequest_header_read.market_day_identifier[rerequest_header_at] == rerequest_header_written.market_day_identifier[rerequest_header_at]); rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  assert(rerequest_header_read.feed_identifier == rerequest_header_written.feed_identifier);
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 8 -> assert(rerequest_header_read.sequence[rerequest_header_at] == rerequest_header_written.sequence[rerequest_header_at]); rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  rerequest_header_at = 0;
  do
  :: rerequest_header_at < 2 -> assert(rerequest_header_read.count[rerequest_header_at] == rerequest_header_written.count[rerequest_header_at]); rerequest_header_at = rerequest_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Packet: 20 bytes -------------------------------------------------------- */

/* Aspen Udp Rerequest Packet */
typedef Packet {
  RerequestHeader rerequest_header
};

/* every byte of Packet set to one value */
inline fill_packet(packet_record, packet_value) {
  fill_rerequest_header(packet_record.rerequest_header, packet_value);
  skip
}

/* each byte of Packet set to where it lies, so a field read out of place says so */
inline ramp_packet(packet_record, packet_base) {
  ramp_rerequest_header(packet_record.rerequest_header, packet_base + 0);
  skip
}

/* Packet to the wire, 20 bytes from where the cursor stands */
inline encode_packet(packet_record) {
  encode_rerequest_header(packet_record.rerequest_header);
  skip
}

/* Packet off the wire, 20 bytes from where the cursor stands */
inline decode_packet(packet_record) {
  decode_rerequest_header(packet_record.rerequest_header);
  skip
}

/* what was read of Packet is what was written, byte for byte */
inline equal_packet(packet_read, packet_written) {
  equal_rerequest_header(packet_read.rerequest_header, packet_written.rerequest_header);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Rerequest Header: encoded, read back, and compared */
proctype check_rerequest_header() {
  RerequestHeader rerequest_header_sent;
  RerequestHeader rerequest_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rerequest_header(rerequest_header_sent, 0)
  :: pattern == 1 -> fill_rerequest_header(rerequest_header_sent, 32)
  :: pattern == 2 -> fill_rerequest_header(rerequest_header_sent, 255)
  :: else -> ramp_rerequest_header(rerequest_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rerequest_header(rerequest_header_sent);
    assert(at == 20);
    at = 0;
    decode_rerequest_header(rerequest_header_got);
    assert(at == 20);
    equal_rerequest_header(rerequest_header_got, rerequest_header_sent)
  }
}

/* Packet: encoded, read back, and compared */
proctype check_packet() {
  Packet packet_sent;
  Packet packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_packet(packet_sent, 0)
  :: pattern == 1 -> fill_packet(packet_sent, 32)
  :: pattern == 2 -> fill_packet(packet_sent, 255)
  :: else -> ramp_packet(packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_packet(packet_sent);
    assert(at == 20);
    at = 0;
    decode_packet(packet_got);
    assert(at == 20);
    equal_packet(packet_got, packet_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_rerequest_header()
  :: run check_packet()
  fi
}
