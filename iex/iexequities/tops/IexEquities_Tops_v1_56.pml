/*
 * Investors Exchange Top Of Book
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
 *   - a run counted by a field
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 40

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Iextp Header: 40 bytes -------------------------------------------------- */

/* IexTp packet header */
typedef IextpHeader {
  byte version;
  byte reserved;
  byte message_protocol_id[2];
  byte channel_id[4];
  byte session_id[4];
  byte payload_length[2];
  byte message_count[2];
  byte stream_offset[8];
  byte first_message_sequence_number[8];
  byte send_time[8]
};

int iextp_header_at;

/* every byte of Iextp Header set to one value */
inline fill_iextp_header(iextp_header_record, iextp_header_value) {
  iextp_header_record.version = iextp_header_value;
  iextp_header_record.reserved = iextp_header_value;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.message_protocol_id[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> iextp_header_record.channel_id[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> iextp_header_record.session_id[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.payload_length[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.message_count[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.stream_offset[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.first_message_sequence_number[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.send_time[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Iextp Header set to where it lies, so a field read out of place says so */
inline ramp_iextp_header(iextp_header_record, iextp_header_base) {
  iextp_header_record.version = (iextp_header_base + 0 + 1) % 256;
  iextp_header_record.reserved = (iextp_header_base + 1 + 1) % 256;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.message_protocol_id[iextp_header_at] = (iextp_header_base + 2 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> iextp_header_record.channel_id[iextp_header_at] = (iextp_header_base + 4 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> iextp_header_record.session_id[iextp_header_at] = (iextp_header_base + 8 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.payload_length[iextp_header_at] = (iextp_header_base + 12 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.message_count[iextp_header_at] = (iextp_header_base + 14 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.stream_offset[iextp_header_at] = (iextp_header_base + 16 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.first_message_sequence_number[iextp_header_at] = (iextp_header_base + 24 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.send_time[iextp_header_at] = (iextp_header_base + 32 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  skip
}

/* Iextp Header to the wire, 40 bytes from where the cursor stands */
inline encode_iextp_header(iextp_header_record) {
  wire[at] = iextp_header_record.version; at = at + 1;
  wire[at] = iextp_header_record.reserved; at = at + 1;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> wire[at] = iextp_header_record.message_protocol_id[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> wire[at] = iextp_header_record.channel_id[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> wire[at] = iextp_header_record.session_id[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> wire[at] = iextp_header_record.payload_length[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> wire[at] = iextp_header_record.message_count[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> wire[at] = iextp_header_record.stream_offset[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> wire[at] = iextp_header_record.first_message_sequence_number[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> wire[at] = iextp_header_record.send_time[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  skip
}

/* Iextp Header off the wire, 40 bytes from where the cursor stands */
inline decode_iextp_header(iextp_header_record) {
  iextp_header_record.version = wire[at]; at = at + 1;
  iextp_header_record.reserved = wire[at]; at = at + 1;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.message_protocol_id[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> iextp_header_record.channel_id[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> iextp_header_record.session_id[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.payload_length[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.message_count[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.stream_offset[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.first_message_sequence_number[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.send_time[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Iextp Header is what was written, byte for byte */
inline equal_iextp_header(iextp_header_read, iextp_header_written) {
  assert(iextp_header_read.version == iextp_header_written.version);
  assert(iextp_header_read.reserved == iextp_header_written.reserved);
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> assert(iextp_header_read.message_protocol_id[iextp_header_at] == iextp_header_written.message_protocol_id[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> assert(iextp_header_read.channel_id[iextp_header_at] == iextp_header_written.channel_id[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> assert(iextp_header_read.session_id[iextp_header_at] == iextp_header_written.session_id[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> assert(iextp_header_read.payload_length[iextp_header_at] == iextp_header_written.payload_length[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> assert(iextp_header_read.message_count[iextp_header_at] == iextp_header_written.message_count[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> assert(iextp_header_read.stream_offset[iextp_header_at] == iextp_header_written.stream_offset[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> assert(iextp_header_read.first_message_sequence_number[iextp_header_at] == iextp_header_written.first_message_sequence_number[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> assert(iextp_header_read.send_time[iextp_header_at] == iextp_header_written.send_time[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* IexTp message header */
typedef MessageHeader {
  byte message_length[2];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 2 + 1) % 256;
  skip
}

/* Message Header to the wire, 3 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 3 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Iextp Header: encoded, read back, and compared */
proctype check_iextp_header() {
  IextpHeader iextp_header_sent;
  IextpHeader iextp_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_iextp_header(iextp_header_sent, 0)
  :: pattern == 1 -> fill_iextp_header(iextp_header_sent, 32)
  :: pattern == 2 -> fill_iextp_header(iextp_header_sent, 255)
  :: else -> ramp_iextp_header(iextp_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_iextp_header(iextp_header_sent);
    assert(at == 40);
    at = 0;
    decode_iextp_header(iextp_header_got);
    assert(at == 40);
    equal_iextp_header(iextp_header_got, iextp_header_sent)
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
    assert(at == 3);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 3);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_iextp_header()
  :: run check_message_header()
  fi
}
