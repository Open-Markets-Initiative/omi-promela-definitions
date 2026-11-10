/*
 * Texas Stock Exchange 
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 19

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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_udp_header()
  fi
}
