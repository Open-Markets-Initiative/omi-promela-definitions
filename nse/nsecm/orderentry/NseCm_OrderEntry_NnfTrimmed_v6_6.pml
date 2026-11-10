/*
 * National Stock Exchange of India Ltd Order Entry
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
 *   - a Composite rule
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 22

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Sec Info: 12 bytes ------------------------------------------------------ */

/* SEC_INFO */
typedef SecInfo {
  byte symbol[10];
  byte series[2]
};

int sec_info_at;

/* every byte of Sec Info set to one value */
inline fill_sec_info(sec_info_record, sec_info_value) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> sec_info_record.symbol[sec_info_at] = sec_info_value; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.series[sec_info_at] = sec_info_value; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sec Info set to where it lies, so a field read out of place says so */
inline ramp_sec_info(sec_info_record, sec_info_base) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> sec_info_record.symbol[sec_info_at] = (sec_info_base + 0 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.series[sec_info_at] = (sec_info_base + 10 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info to the wire, 12 bytes from where the cursor stands */
inline encode_sec_info(sec_info_record) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> wire[at] = sec_info_record.symbol[sec_info_at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> wire[at] = sec_info_record.series[sec_info_at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info off the wire, 12 bytes from where the cursor stands */
inline decode_sec_info(sec_info_record) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> sec_info_record.symbol[sec_info_at] = wire[at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.series[sec_info_at] = wire[at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sec Info is what was written, byte for byte */
inline equal_sec_info(sec_info_read, sec_info_written) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> assert(sec_info_read.symbol[sec_info_at] == sec_info_written.symbol[sec_info_at]); sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> assert(sec_info_read.series[sec_info_at] == sec_info_written.series[sec_info_at]); sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quick Acknowledgement Message: 22 bytes --------------------------------- */

/* Immediate acknowledgement of a trimmed order entry, modification or cancellation request, answered on the separate port of the gateway router server */
typedef QuickAcknowledgementMessage {
  byte transaction_code[2];
  byte trader_id[4];
  byte timestamp[8];
  byte reference[4];
  byte error_code[2];
  byte message_length[2]
};

int quick_acknowledgement_message_at;

/* every byte of Quick Acknowledgement Message set to one value */
inline fill_quick_acknowledgement_message(quick_acknowledgement_message_record, quick_acknowledgement_message_value) {
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> quick_acknowledgement_message_record.transaction_code[quick_acknowledgement_message_at] = quick_acknowledgement_message_value; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 4 -> quick_acknowledgement_message_record.trader_id[quick_acknowledgement_message_at] = quick_acknowledgement_message_value; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 8 -> quick_acknowledgement_message_record.timestamp[quick_acknowledgement_message_at] = quick_acknowledgement_message_value; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 4 -> quick_acknowledgement_message_record.reference[quick_acknowledgement_message_at] = quick_acknowledgement_message_value; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> quick_acknowledgement_message_record.error_code[quick_acknowledgement_message_at] = quick_acknowledgement_message_value; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> quick_acknowledgement_message_record.message_length[quick_acknowledgement_message_at] = quick_acknowledgement_message_value; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quick Acknowledgement Message set to where it lies, so a field read out of place says so */
inline ramp_quick_acknowledgement_message(quick_acknowledgement_message_record, quick_acknowledgement_message_base) {
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> quick_acknowledgement_message_record.transaction_code[quick_acknowledgement_message_at] = (quick_acknowledgement_message_base + 0 + quick_acknowledgement_message_at + 1) % 256; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 4 -> quick_acknowledgement_message_record.trader_id[quick_acknowledgement_message_at] = (quick_acknowledgement_message_base + 2 + quick_acknowledgement_message_at + 1) % 256; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 8 -> quick_acknowledgement_message_record.timestamp[quick_acknowledgement_message_at] = (quick_acknowledgement_message_base + 6 + quick_acknowledgement_message_at + 1) % 256; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 4 -> quick_acknowledgement_message_record.reference[quick_acknowledgement_message_at] = (quick_acknowledgement_message_base + 14 + quick_acknowledgement_message_at + 1) % 256; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> quick_acknowledgement_message_record.error_code[quick_acknowledgement_message_at] = (quick_acknowledgement_message_base + 18 + quick_acknowledgement_message_at + 1) % 256; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> quick_acknowledgement_message_record.message_length[quick_acknowledgement_message_at] = (quick_acknowledgement_message_base + 20 + quick_acknowledgement_message_at + 1) % 256; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quick Acknowledgement Message to the wire, 22 bytes from where the cursor stands */
inline encode_quick_acknowledgement_message(quick_acknowledgement_message_record) {
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> wire[at] = quick_acknowledgement_message_record.transaction_code[quick_acknowledgement_message_at]; at = at + 1; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 4 -> wire[at] = quick_acknowledgement_message_record.trader_id[quick_acknowledgement_message_at]; at = at + 1; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 8 -> wire[at] = quick_acknowledgement_message_record.timestamp[quick_acknowledgement_message_at]; at = at + 1; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 4 -> wire[at] = quick_acknowledgement_message_record.reference[quick_acknowledgement_message_at]; at = at + 1; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> wire[at] = quick_acknowledgement_message_record.error_code[quick_acknowledgement_message_at]; at = at + 1; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> wire[at] = quick_acknowledgement_message_record.message_length[quick_acknowledgement_message_at]; at = at + 1; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quick Acknowledgement Message off the wire, 22 bytes from where the cursor stands */
inline decode_quick_acknowledgement_message(quick_acknowledgement_message_record) {
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> quick_acknowledgement_message_record.transaction_code[quick_acknowledgement_message_at] = wire[at]; at = at + 1; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 4 -> quick_acknowledgement_message_record.trader_id[quick_acknowledgement_message_at] = wire[at]; at = at + 1; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 8 -> quick_acknowledgement_message_record.timestamp[quick_acknowledgement_message_at] = wire[at]; at = at + 1; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 4 -> quick_acknowledgement_message_record.reference[quick_acknowledgement_message_at] = wire[at]; at = at + 1; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> quick_acknowledgement_message_record.error_code[quick_acknowledgement_message_at] = wire[at]; at = at + 1; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> quick_acknowledgement_message_record.message_length[quick_acknowledgement_message_at] = wire[at]; at = at + 1; quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quick Acknowledgement Message is what was written, byte for byte */
inline equal_quick_acknowledgement_message(quick_acknowledgement_message_read, quick_acknowledgement_message_written) {
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> assert(quick_acknowledgement_message_read.transaction_code[quick_acknowledgement_message_at] == quick_acknowledgement_message_written.transaction_code[quick_acknowledgement_message_at]); quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 4 -> assert(quick_acknowledgement_message_read.trader_id[quick_acknowledgement_message_at] == quick_acknowledgement_message_written.trader_id[quick_acknowledgement_message_at]); quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 8 -> assert(quick_acknowledgement_message_read.timestamp[quick_acknowledgement_message_at] == quick_acknowledgement_message_written.timestamp[quick_acknowledgement_message_at]); quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 4 -> assert(quick_acknowledgement_message_read.reference[quick_acknowledgement_message_at] == quick_acknowledgement_message_written.reference[quick_acknowledgement_message_at]); quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> assert(quick_acknowledgement_message_read.error_code[quick_acknowledgement_message_at] == quick_acknowledgement_message_written.error_code[quick_acknowledgement_message_at]); quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  quick_acknowledgement_message_at = 0;
  do
  :: quick_acknowledgement_message_at < 2 -> assert(quick_acknowledgement_message_read.message_length[quick_acknowledgement_message_at] == quick_acknowledgement_message_written.message_length[quick_acknowledgement_message_at]); quick_acknowledgement_message_at = quick_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Sec Info: encoded, read back, and compared */
proctype check_sec_info() {
  SecInfo sec_info_sent;
  SecInfo sec_info_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sec_info(sec_info_sent, 0)
  :: pattern == 1 -> fill_sec_info(sec_info_sent, 32)
  :: pattern == 2 -> fill_sec_info(sec_info_sent, 255)
  :: else -> ramp_sec_info(sec_info_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sec_info(sec_info_sent);
    assert(at == 12);
    at = 0;
    decode_sec_info(sec_info_got);
    assert(at == 12);
    equal_sec_info(sec_info_got, sec_info_sent)
  }
}

/* Quick Acknowledgement Message: encoded, read back, and compared */
proctype check_quick_acknowledgement_message() {
  QuickAcknowledgementMessage quick_acknowledgement_message_sent;
  QuickAcknowledgementMessage quick_acknowledgement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quick_acknowledgement_message(quick_acknowledgement_message_sent, 0)
  :: pattern == 1 -> fill_quick_acknowledgement_message(quick_acknowledgement_message_sent, 32)
  :: pattern == 2 -> fill_quick_acknowledgement_message(quick_acknowledgement_message_sent, 255)
  :: else -> ramp_quick_acknowledgement_message(quick_acknowledgement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quick_acknowledgement_message(quick_acknowledgement_message_sent);
    assert(at == 22);
    at = 0;
    decode_quick_acknowledgement_message(quick_acknowledgement_message_got);
    assert(at == 22);
    equal_quick_acknowledgement_message(quick_acknowledgement_message_got, quick_acknowledgement_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_sec_info()
  :: run check_quick_acknowledgement_message()
  fi
}
