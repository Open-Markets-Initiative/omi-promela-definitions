/*
 * Miami International Holdings Headers Only
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
 *   - a run counted by a field
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

/* ---- Esesm Packet Header: 3 bytes -------------------------------------------- */

/* ESesM packet header */
typedef EsesmPacketHeader {
  byte esesm_packet_length[2];
  byte esesm_packet_type
};

int esesm_packet_header_at;

/* every byte of Esesm Packet Header set to one value */
inline fill_esesm_packet_header(esesm_packet_header_record, esesm_packet_header_value) {
  esesm_packet_header_at = 0;
  do
  :: esesm_packet_header_at < 2 -> esesm_packet_header_record.esesm_packet_length[esesm_packet_header_at] = esesm_packet_header_value; esesm_packet_header_at = esesm_packet_header_at + 1
  :: else -> break
  od;
  esesm_packet_header_record.esesm_packet_type = esesm_packet_header_value;
  skip
}

/* each byte of Esesm Packet Header set to where it lies, so a field read out of place says so */
inline ramp_esesm_packet_header(esesm_packet_header_record, esesm_packet_header_base) {
  esesm_packet_header_at = 0;
  do
  :: esesm_packet_header_at < 2 -> esesm_packet_header_record.esesm_packet_length[esesm_packet_header_at] = (esesm_packet_header_base + 0 + esesm_packet_header_at + 1) % 256; esesm_packet_header_at = esesm_packet_header_at + 1
  :: else -> break
  od;
  esesm_packet_header_record.esesm_packet_type = (esesm_packet_header_base + 2 + 1) % 256;
  skip
}

/* Esesm Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_esesm_packet_header(esesm_packet_header_record) {
  esesm_packet_header_at = 0;
  do
  :: esesm_packet_header_at < 2 -> wire[at] = esesm_packet_header_record.esesm_packet_length[esesm_packet_header_at]; at = at + 1; esesm_packet_header_at = esesm_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = esesm_packet_header_record.esesm_packet_type; at = at + 1;
  skip
}

/* Esesm Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_esesm_packet_header(esesm_packet_header_record) {
  esesm_packet_header_at = 0;
  do
  :: esesm_packet_header_at < 2 -> esesm_packet_header_record.esesm_packet_length[esesm_packet_header_at] = wire[at]; at = at + 1; esesm_packet_header_at = esesm_packet_header_at + 1
  :: else -> break
  od;
  esesm_packet_header_record.esesm_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Esesm Packet Header is what was written, byte for byte */
inline equal_esesm_packet_header(esesm_packet_header_read, esesm_packet_header_written) {
  esesm_packet_header_at = 0;
  do
  :: esesm_packet_header_at < 2 -> assert(esesm_packet_header_read.esesm_packet_length[esesm_packet_header_at] == esesm_packet_header_written.esesm_packet_length[esesm_packet_header_at]); esesm_packet_header_at = esesm_packet_header_at + 1
  :: else -> break
  od;
  assert(esesm_packet_header_read.esesm_packet_type == esesm_packet_header_written.esesm_packet_type);
  skip
}

/* ---- Synchronization Complete: 1 bytes --------------------------------------- */

/* The ESesM server sends a Synchronization complete packet when it is done replaying all the old packets and is ready to start sending new packets from the Matching Engine */
typedef SynchronizationComplete {
  byte matching_engine_id
};

/* every byte of Synchronization Complete set to one value */
inline fill_synchronization_complete(synchronization_complete_record, synchronization_complete_value) {
  synchronization_complete_record.matching_engine_id = synchronization_complete_value;
  skip
}

/* each byte of Synchronization Complete set to where it lies, so a field read out of place says so */
inline ramp_synchronization_complete(synchronization_complete_record, synchronization_complete_base) {
  synchronization_complete_record.matching_engine_id = (synchronization_complete_base + 0 + 1) % 256;
  skip
}

/* Synchronization Complete to the wire, 1 bytes from where the cursor stands */
inline encode_synchronization_complete(synchronization_complete_record) {
  wire[at] = synchronization_complete_record.matching_engine_id; at = at + 1;
  skip
}

/* Synchronization Complete off the wire, 1 bytes from where the cursor stands */
inline decode_synchronization_complete(synchronization_complete_record) {
  synchronization_complete_record.matching_engine_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Synchronization Complete is what was written, byte for byte */
inline equal_synchronization_complete(synchronization_complete_read, synchronization_complete_written) {
  assert(synchronization_complete_read.matching_engine_id == synchronization_complete_written.matching_engine_id);
  skip
}

/* ---- Retransmission Request: 16 bytes ---------------------------------------- */

/* The ESesM client uses this packet to request a retransmission server to retransmit a range of packets */
typedef RetransmissionRequest {
  byte start_sequence_number[8];
  byte end_sequence_number[8]
};

int retransmission_request_at;

/* every byte of Retransmission Request set to one value */
inline fill_retransmission_request(retransmission_request_record, retransmission_request_value) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = retransmission_request_value; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = retransmission_request_value; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Request set to where it lies, so a field read out of place says so */
inline ramp_retransmission_request(retransmission_request_record, retransmission_request_base) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = (retransmission_request_base + 0 + retransmission_request_at + 1) % 256; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = (retransmission_request_base + 8 + retransmission_request_at + 1) % 256; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request to the wire, 16 bytes from where the cursor stands */
inline encode_retransmission_request(retransmission_request_record) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> wire[at] = retransmission_request_record.start_sequence_number[retransmission_request_at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> wire[at] = retransmission_request_record.end_sequence_number[retransmission_request_at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request off the wire, 16 bytes from where the cursor stands */
inline decode_retransmission_request(retransmission_request_record) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = wire[at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = wire[at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Request is what was written, byte for byte */
inline equal_retransmission_request(retransmission_request_read, retransmission_request_written) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> assert(retransmission_request_read.start_sequence_number[retransmission_request_at] == retransmission_request_written.start_sequence_number[retransmission_request_at]); retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> assert(retransmission_request_read.end_sequence_number[retransmission_request_at] == retransmission_request_written.end_sequence_number[retransmission_request_at]); retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Session Update: 2 bytes ----------------------------------------- */

/* The ESesM server sends a Trading Session Update packet to inform the client that a new trading session is starting on the specified Matching Engine */
typedef TradingSessionUpdate {
  byte matching_engine_id;
  byte trading_session_id
};

/* every byte of Trading Session Update set to one value */
inline fill_trading_session_update(trading_session_update_record, trading_session_update_value) {
  trading_session_update_record.matching_engine_id = trading_session_update_value;
  trading_session_update_record.trading_session_id = trading_session_update_value;
  skip
}

/* each byte of Trading Session Update set to where it lies, so a field read out of place says so */
inline ramp_trading_session_update(trading_session_update_record, trading_session_update_base) {
  trading_session_update_record.matching_engine_id = (trading_session_update_base + 0 + 1) % 256;
  trading_session_update_record.trading_session_id = (trading_session_update_base + 1 + 1) % 256;
  skip
}

/* Trading Session Update to the wire, 2 bytes from where the cursor stands */
inline encode_trading_session_update(trading_session_update_record) {
  wire[at] = trading_session_update_record.matching_engine_id; at = at + 1;
  wire[at] = trading_session_update_record.trading_session_id; at = at + 1;
  skip
}

/* Trading Session Update off the wire, 2 bytes from where the cursor stands */
inline decode_trading_session_update(trading_session_update_record) {
  trading_session_update_record.matching_engine_id = wire[at]; at = at + 1;
  trading_session_update_record.trading_session_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Session Update is what was written, byte for byte */
inline equal_trading_session_update(trading_session_update_read, trading_session_update_written) {
  assert(trading_session_update_read.matching_engine_id == trading_session_update_written.matching_engine_id);
  assert(trading_session_update_read.trading_session_id == trading_session_update_written.trading_session_id);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Esesm Packet Header: encoded, read back, and compared */
proctype check_esesm_packet_header() {
  EsesmPacketHeader esesm_packet_header_sent;
  EsesmPacketHeader esesm_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_esesm_packet_header(esesm_packet_header_sent, 0)
  :: pattern == 1 -> fill_esesm_packet_header(esesm_packet_header_sent, 32)
  :: pattern == 2 -> fill_esesm_packet_header(esesm_packet_header_sent, 255)
  :: else -> ramp_esesm_packet_header(esesm_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_esesm_packet_header(esesm_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_esesm_packet_header(esesm_packet_header_got);
    assert(at == 3);
    equal_esesm_packet_header(esesm_packet_header_got, esesm_packet_header_sent)
  }
}

/* Synchronization Complete: encoded, read back, and compared */
proctype check_synchronization_complete() {
  SynchronizationComplete synchronization_complete_sent;
  SynchronizationComplete synchronization_complete_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_synchronization_complete(synchronization_complete_sent, 0)
  :: pattern == 1 -> fill_synchronization_complete(synchronization_complete_sent, 32)
  :: pattern == 2 -> fill_synchronization_complete(synchronization_complete_sent, 255)
  :: else -> ramp_synchronization_complete(synchronization_complete_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_synchronization_complete(synchronization_complete_sent);
    assert(at == 1);
    at = 0;
    decode_synchronization_complete(synchronization_complete_got);
    assert(at == 1);
    equal_synchronization_complete(synchronization_complete_got, synchronization_complete_sent)
  }
}

/* Retransmission Request: encoded, read back, and compared */
proctype check_retransmission_request() {
  RetransmissionRequest retransmission_request_sent;
  RetransmissionRequest retransmission_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_request(retransmission_request_sent, 0)
  :: pattern == 1 -> fill_retransmission_request(retransmission_request_sent, 32)
  :: pattern == 2 -> fill_retransmission_request(retransmission_request_sent, 255)
  :: else -> ramp_retransmission_request(retransmission_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_request(retransmission_request_sent);
    assert(at == 16);
    at = 0;
    decode_retransmission_request(retransmission_request_got);
    assert(at == 16);
    equal_retransmission_request(retransmission_request_got, retransmission_request_sent)
  }
}

/* Trading Session Update: encoded, read back, and compared */
proctype check_trading_session_update() {
  TradingSessionUpdate trading_session_update_sent;
  TradingSessionUpdate trading_session_update_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_session_update(trading_session_update_sent, 0)
  :: pattern == 1 -> fill_trading_session_update(trading_session_update_sent, 32)
  :: pattern == 2 -> fill_trading_session_update(trading_session_update_sent, 255)
  :: else -> ramp_trading_session_update(trading_session_update_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_session_update(trading_session_update_sent);
    assert(at == 2);
    at = 0;
    decode_trading_session_update(trading_session_update_got);
    assert(at == 2);
    equal_trading_session_update(trading_session_update_got, trading_session_update_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_esesm_packet_header()
  :: run check_synchronization_complete()
  :: run check_retransmission_request()
  :: run check_trading_session_update()
  fi
}
