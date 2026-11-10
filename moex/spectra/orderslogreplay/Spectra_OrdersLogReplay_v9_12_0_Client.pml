/*
 * Moscow Exchange SIMBA Spectra Orders Log Historical Replay
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
 *   - a field read in bits
 *   - the dispatch that chooses a message by its type
 *   - a block whose stated length holds more than its fields
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 256

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Sbe Header: 8 bytes ----------------------------------------------------- */

/* Root block length, message template id, message schema id and schema version */
typedef SbeHeader {
  byte block_length[2];
  byte template_id[2];
  byte schema_id[2];
  byte version[2]
};

int sbe_header_at;

/* every byte of Sbe Header set to one value */
inline fill_sbe_header(sbe_header_record, sbe_header_value) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.template_id[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.schema_id[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sbe Header set to where it lies, so a field read out of place says so */
inline ramp_sbe_header(sbe_header_record, sbe_header_base) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = (sbe_header_base + 0 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.template_id[sbe_header_at] = (sbe_header_base + 2 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.schema_id[sbe_header_at] = (sbe_header_base + 4 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = (sbe_header_base + 6 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header to the wire, 8 bytes from where the cursor stands */
inline encode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.block_length[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.template_id[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.schema_id[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.version[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header off the wire, 8 bytes from where the cursor stands */
inline decode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.template_id[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.schema_id[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sbe Header is what was written, byte for byte */
inline equal_sbe_header(sbe_header_read, sbe_header_written) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.block_length[sbe_header_at] == sbe_header_written.block_length[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.template_id[sbe_header_at] == sbe_header_written.template_id[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.schema_id[sbe_header_at] == sbe_header_written.schema_id[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.version[sbe_header_at] == sbe_header_written.version[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout Message: 256 bytes ----------------------------------------------- */

/* LogoutMessage */
typedef LogoutMessage {
  byte text[256]
};

int logout_message_at;

/* every byte of Logout Message set to one value */
inline fill_logout_message(logout_message_record, logout_message_value) {
  logout_message_at = 0;
  do
  :: logout_message_at < 256 -> logout_message_record.text[logout_message_at] = logout_message_value; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logout Message set to where it lies, so a field read out of place says so */
inline ramp_logout_message(logout_message_record, logout_message_base) {
  logout_message_at = 0;
  do
  :: logout_message_at < 256 -> logout_message_record.text[logout_message_at] = (logout_message_base + 0 + logout_message_at + 1) % 256; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message to the wire, 256 bytes from where the cursor stands */
inline encode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 256 -> wire[at] = logout_message_record.text[logout_message_at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message off the wire, 256 bytes from where the cursor stands */
inline decode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 256 -> logout_message_record.text[logout_message_at] = wire[at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logout Message is what was written, byte for byte */
inline equal_logout_message(logout_message_read, logout_message_written) {
  logout_message_at = 0;
  do
  :: logout_message_at < 256 -> assert(logout_message_read.text[logout_message_at] == logout_message_written.text[logout_message_at]); logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Data Request Message: 8 bytes ------------------------------------ */

/* MarketDataRequestMessage */
typedef MarketDataRequestMessage {
  byte appl_beg_seq_num[4];
  byte appl_end_seq_num[4]
};

int market_data_request_message_at;

/* every byte of Market Data Request Message set to one value */
inline fill_market_data_request_message(market_data_request_message_record, market_data_request_message_value) {
  market_data_request_message_at = 0;
  do
  :: market_data_request_message_at < 4 -> market_data_request_message_record.appl_beg_seq_num[market_data_request_message_at] = market_data_request_message_value; market_data_request_message_at = market_data_request_message_at + 1
  :: else -> break
  od;
  market_data_request_message_at = 0;
  do
  :: market_data_request_message_at < 4 -> market_data_request_message_record.appl_end_seq_num[market_data_request_message_at] = market_data_request_message_value; market_data_request_message_at = market_data_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Data Request Message set to where it lies, so a field read out of place says so */
inline ramp_market_data_request_message(market_data_request_message_record, market_data_request_message_base) {
  market_data_request_message_at = 0;
  do
  :: market_data_request_message_at < 4 -> market_data_request_message_record.appl_beg_seq_num[market_data_request_message_at] = (market_data_request_message_base + 0 + market_data_request_message_at + 1) % 256; market_data_request_message_at = market_data_request_message_at + 1
  :: else -> break
  od;
  market_data_request_message_at = 0;
  do
  :: market_data_request_message_at < 4 -> market_data_request_message_record.appl_end_seq_num[market_data_request_message_at] = (market_data_request_message_base + 4 + market_data_request_message_at + 1) % 256; market_data_request_message_at = market_data_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Data Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_market_data_request_message(market_data_request_message_record) {
  market_data_request_message_at = 0;
  do
  :: market_data_request_message_at < 4 -> wire[at] = market_data_request_message_record.appl_beg_seq_num[market_data_request_message_at]; at = at + 1; market_data_request_message_at = market_data_request_message_at + 1
  :: else -> break
  od;
  market_data_request_message_at = 0;
  do
  :: market_data_request_message_at < 4 -> wire[at] = market_data_request_message_record.appl_end_seq_num[market_data_request_message_at]; at = at + 1; market_data_request_message_at = market_data_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Data Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_market_data_request_message(market_data_request_message_record) {
  market_data_request_message_at = 0;
  do
  :: market_data_request_message_at < 4 -> market_data_request_message_record.appl_beg_seq_num[market_data_request_message_at] = wire[at]; at = at + 1; market_data_request_message_at = market_data_request_message_at + 1
  :: else -> break
  od;
  market_data_request_message_at = 0;
  do
  :: market_data_request_message_at < 4 -> market_data_request_message_record.appl_end_seq_num[market_data_request_message_at] = wire[at]; at = at + 1; market_data_request_message_at = market_data_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Data Request Message is what was written, byte for byte */
inline equal_market_data_request_message(market_data_request_message_read, market_data_request_message_written) {
  market_data_request_message_at = 0;
  do
  :: market_data_request_message_at < 4 -> assert(market_data_request_message_read.appl_beg_seq_num[market_data_request_message_at] == market_data_request_message_written.appl_beg_seq_num[market_data_request_message_at]); market_data_request_message_at = market_data_request_message_at + 1
  :: else -> break
  od;
  market_data_request_message_at = 0;
  do
  :: market_data_request_message_at < 4 -> assert(market_data_request_message_read.appl_end_seq_num[market_data_request_message_at] == market_data_request_message_written.appl_end_seq_num[market_data_request_message_at]); market_data_request_message_at = market_data_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Sbe Header: encoded, read back, and compared */
proctype check_sbe_header() {
  SbeHeader sbe_header_sent;
  SbeHeader sbe_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sbe_header(sbe_header_sent, 0)
  :: pattern == 1 -> fill_sbe_header(sbe_header_sent, 32)
  :: pattern == 2 -> fill_sbe_header(sbe_header_sent, 255)
  :: else -> ramp_sbe_header(sbe_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sbe_header(sbe_header_sent);
    assert(at == 8);
    at = 0;
    decode_sbe_header(sbe_header_got);
    assert(at == 8);
    equal_sbe_header(sbe_header_got, sbe_header_sent)
  }
}

/* Logout Message: encoded, read back, and compared */
proctype check_logout_message() {
  LogoutMessage logout_message_sent;
  LogoutMessage logout_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logout_message(logout_message_sent, 0)
  :: pattern == 1 -> fill_logout_message(logout_message_sent, 32)
  :: pattern == 2 -> fill_logout_message(logout_message_sent, 255)
  :: else -> ramp_logout_message(logout_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logout_message(logout_message_sent);
    assert(at == 256);
    at = 0;
    decode_logout_message(logout_message_got);
    assert(at == 256);
    equal_logout_message(logout_message_got, logout_message_sent)
  }
}

/* Market Data Request Message: encoded, read back, and compared */
proctype check_market_data_request_message() {
  MarketDataRequestMessage market_data_request_message_sent;
  MarketDataRequestMessage market_data_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_data_request_message(market_data_request_message_sent, 0)
  :: pattern == 1 -> fill_market_data_request_message(market_data_request_message_sent, 32)
  :: pattern == 2 -> fill_market_data_request_message(market_data_request_message_sent, 255)
  :: else -> ramp_market_data_request_message(market_data_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_data_request_message(market_data_request_message_sent);
    assert(at == 8);
    at = 0;
    decode_market_data_request_message(market_data_request_message_got);
    assert(at == 8);
    equal_market_data_request_message(market_data_request_message_got, market_data_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_sbe_header()
  :: run check_logout_message()
  :: run check_market_data_request_message()
  fi
}
