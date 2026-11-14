/*
 * Chicago Board Options Exchange Streaming Market Index
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
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 16

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

typedef PacketHeader {
  byte version;
  byte packet_length[2];
  byte sending_time[8];
  byte message_count;
  byte first_msg_seq_num[4]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_record.version = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sending_time[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.first_msg_seq_num[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_record.version = (packet_header_base + 0 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = (packet_header_base + 1 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sending_time[packet_header_at] = (packet_header_base + 3 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = (packet_header_base + 11 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.first_msg_seq_num[packet_header_at] = (packet_header_base + 12 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  wire[at] = packet_header_record.version; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.packet_length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.sending_time[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.message_count; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.first_msg_seq_num[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_record.version = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sending_time[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.first_msg_seq_num[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  assert(packet_header_read.version == packet_header_written.version);
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.packet_length[packet_header_at] == packet_header_written.packet_length[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.sending_time[packet_header_at] == packet_header_written.sending_time[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.message_count == packet_header_written.message_count);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.first_msg_seq_num[packet_header_at] == packet_header_written.first_msg_seq_num[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 8 bytes ------------------------------------------------- */

typedef MessageHeader {
  byte message_length[2];
  byte template_id;
  byte message_type;
  byte msg_seq_num[4]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.template_id = message_header_value;
  message_header_record.message_type = message_header_value;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_num[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.template_id = (message_header_base + 2 + 1) % 256;
  message_header_record.message_type = (message_header_base + 3 + 1) % 256;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_num[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 8 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.template_id; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.msg_seq_num[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 8 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.template_id = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_num[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.template_id == message_header_written.template_id);
  assert(message_header_read.message_type == message_header_written.message_type);
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.msg_seq_num[message_header_at] == message_header_written.msg_seq_num[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Md Entry Px: 5 bytes ---------------------------------------------------- */

typedef MdEntryPx {
  byte md_entry_px_exponent;
  byte md_entry_px_mantissa[4]
};

int md_entry_px_at;

/* every byte of Md Entry Px set to one value */
inline fill_md_entry_px(md_entry_px_record, md_entry_px_value) {
  md_entry_px_record.md_entry_px_exponent = md_entry_px_value;
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 4 -> md_entry_px_record.md_entry_px_mantissa[md_entry_px_at] = md_entry_px_value; md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Md Entry Px set to where it lies, so a field read out of place says so */
inline ramp_md_entry_px(md_entry_px_record, md_entry_px_base) {
  md_entry_px_record.md_entry_px_exponent = (md_entry_px_base + 0 + 1) % 256;
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 4 -> md_entry_px_record.md_entry_px_mantissa[md_entry_px_at] = (md_entry_px_base + 1 + md_entry_px_at + 1) % 256; md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  skip
}

/* Md Entry Px to the wire, 5 bytes from where the cursor stands */
inline encode_md_entry_px(md_entry_px_record) {
  wire[at] = md_entry_px_record.md_entry_px_exponent; at = at + 1;
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 4 -> wire[at] = md_entry_px_record.md_entry_px_mantissa[md_entry_px_at]; at = at + 1; md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  skip
}

/* Md Entry Px off the wire, 5 bytes from where the cursor stands */
inline decode_md_entry_px(md_entry_px_record) {
  md_entry_px_record.md_entry_px_exponent = wire[at]; at = at + 1;
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 4 -> md_entry_px_record.md_entry_px_mantissa[md_entry_px_at] = wire[at]; at = at + 1; md_entry_px_at = md_entry_px_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Md Entry Px is what was written, byte for byte */
inline equal_md_entry_px(md_entry_px_read, md_entry_px_written) {
  assert(md_entry_px_read.md_entry_px_exponent == md_entry_px_written.md_entry_px_exponent);
  md_entry_px_at = 0;
  do
  :: md_entry_px_at < 4 -> assert(md_entry_px_read.md_entry_px_mantissa[md_entry_px_at] == md_entry_px_written.md_entry_px_mantissa[md_entry_px_at]); md_entry_px_at = md_entry_px_at + 1
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
    assert(at == 8);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 8);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Md Entry Px: encoded, read back, and compared */
proctype check_md_entry_px() {
  MdEntryPx md_entry_px_sent;
  MdEntryPx md_entry_px_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_md_entry_px(md_entry_px_sent, 0)
  :: pattern == 1 -> fill_md_entry_px(md_entry_px_sent, 32)
  :: pattern == 2 -> fill_md_entry_px(md_entry_px_sent, 255)
  :: else -> ramp_md_entry_px(md_entry_px_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_md_entry_px(md_entry_px_sent);
    assert(at == 5);
    at = 0;
    decode_md_entry_px(md_entry_px_got);
    assert(at == 5);
    equal_md_entry_px(md_entry_px_got, md_entry_px_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_md_entry_px()
  fi
}
