/*
 * Japan Exchange Group Rewind
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

/* ---- Rewind Request Packet: 20 bytes ----------------------------------------- */

/* Sent by the Itch user to the Itch server to request resend of lost multicast data */
typedef RewindRequestPacket {
  byte session[10];
  byte sequence_number[8];
  byte requested_message_count[2]
};

int rewind_request_packet_at;

/* every byte of Rewind Request Packet set to one value */
inline fill_rewind_request_packet(rewind_request_packet_record, rewind_request_packet_value) {
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 10 -> rewind_request_packet_record.session[rewind_request_packet_at] = rewind_request_packet_value; rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 8 -> rewind_request_packet_record.sequence_number[rewind_request_packet_at] = rewind_request_packet_value; rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 2 -> rewind_request_packet_record.requested_message_count[rewind_request_packet_at] = rewind_request_packet_value; rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Rewind Request Packet set to where it lies, so a field read out of place says so */
inline ramp_rewind_request_packet(rewind_request_packet_record, rewind_request_packet_base) {
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 10 -> rewind_request_packet_record.session[rewind_request_packet_at] = (rewind_request_packet_base + 0 + rewind_request_packet_at + 1) % 256; rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 8 -> rewind_request_packet_record.sequence_number[rewind_request_packet_at] = (rewind_request_packet_base + 10 + rewind_request_packet_at + 1) % 256; rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 2 -> rewind_request_packet_record.requested_message_count[rewind_request_packet_at] = (rewind_request_packet_base + 18 + rewind_request_packet_at + 1) % 256; rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Rewind Request Packet to the wire, 20 bytes from where the cursor stands */
inline encode_rewind_request_packet(rewind_request_packet_record) {
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 10 -> wire[at] = rewind_request_packet_record.session[rewind_request_packet_at]; at = at + 1; rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 8 -> wire[at] = rewind_request_packet_record.sequence_number[rewind_request_packet_at]; at = at + 1; rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 2 -> wire[at] = rewind_request_packet_record.requested_message_count[rewind_request_packet_at]; at = at + 1; rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Rewind Request Packet off the wire, 20 bytes from where the cursor stands */
inline decode_rewind_request_packet(rewind_request_packet_record) {
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 10 -> rewind_request_packet_record.session[rewind_request_packet_at] = wire[at]; at = at + 1; rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 8 -> rewind_request_packet_record.sequence_number[rewind_request_packet_at] = wire[at]; at = at + 1; rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 2 -> rewind_request_packet_record.requested_message_count[rewind_request_packet_at] = wire[at]; at = at + 1; rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Rewind Request Packet is what was written, byte for byte */
inline equal_rewind_request_packet(rewind_request_packet_read, rewind_request_packet_written) {
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 10 -> assert(rewind_request_packet_read.session[rewind_request_packet_at] == rewind_request_packet_written.session[rewind_request_packet_at]); rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 8 -> assert(rewind_request_packet_read.sequence_number[rewind_request_packet_at] == rewind_request_packet_written.sequence_number[rewind_request_packet_at]); rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  rewind_request_packet_at = 0;
  do
  :: rewind_request_packet_at < 2 -> assert(rewind_request_packet_read.requested_message_count[rewind_request_packet_at] == rewind_request_packet_written.requested_message_count[rewind_request_packet_at]); rewind_request_packet_at = rewind_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Rewind Request Packet: encoded, read back, and compared */
proctype check_rewind_request_packet() {
  RewindRequestPacket rewind_request_packet_sent;
  RewindRequestPacket rewind_request_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rewind_request_packet(rewind_request_packet_sent, 0)
  :: pattern == 1 -> fill_rewind_request_packet(rewind_request_packet_sent, 32)
  :: pattern == 2 -> fill_rewind_request_packet(rewind_request_packet_sent, 255)
  :: else -> ramp_rewind_request_packet(rewind_request_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rewind_request_packet(rewind_request_packet_sent);
    assert(at == 20);
    at = 0;
    decode_rewind_request_packet(rewind_request_packet_got);
    assert(at == 20);
    equal_rewind_request_packet(rewind_request_packet_got, rewind_request_packet_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_rewind_request_packet()
  fi
}
