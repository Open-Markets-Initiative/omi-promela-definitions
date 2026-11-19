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
 *   - the dispatch that chooses a message by its type
 *   - a field read in bits
 *   - a Composite rule
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 26

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Contract Desc Tr: 26 bytes ---------------------------------------------- */

/* CONTRACT_DESC_TR */
typedef ContractDescTr {
  byte instrument_name[6];
  byte symbol[10];
  byte expiry_date[4];
  byte strike_price[4];
  byte option_type[2]
};

int contract_desc_tr_at;

/* every byte of Contract Desc Tr set to one value */
inline fill_contract_desc_tr(contract_desc_tr_record, contract_desc_tr_value) {
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 6 -> contract_desc_tr_record.instrument_name[contract_desc_tr_at] = contract_desc_tr_value; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 10 -> contract_desc_tr_record.symbol[contract_desc_tr_at] = contract_desc_tr_value; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 4 -> contract_desc_tr_record.expiry_date[contract_desc_tr_at] = contract_desc_tr_value; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 4 -> contract_desc_tr_record.strike_price[contract_desc_tr_at] = contract_desc_tr_value; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 2 -> contract_desc_tr_record.option_type[contract_desc_tr_at] = contract_desc_tr_value; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Contract Desc Tr set to where it lies, so a field read out of place says so */
inline ramp_contract_desc_tr(contract_desc_tr_record, contract_desc_tr_base) {
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 6 -> contract_desc_tr_record.instrument_name[contract_desc_tr_at] = (contract_desc_tr_base + 0 + contract_desc_tr_at + 1) % 256; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 10 -> contract_desc_tr_record.symbol[contract_desc_tr_at] = (contract_desc_tr_base + 6 + contract_desc_tr_at + 1) % 256; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 4 -> contract_desc_tr_record.expiry_date[contract_desc_tr_at] = (contract_desc_tr_base + 16 + contract_desc_tr_at + 1) % 256; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 4 -> contract_desc_tr_record.strike_price[contract_desc_tr_at] = (contract_desc_tr_base + 20 + contract_desc_tr_at + 1) % 256; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 2 -> contract_desc_tr_record.option_type[contract_desc_tr_at] = (contract_desc_tr_base + 24 + contract_desc_tr_at + 1) % 256; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  skip
}

/* Contract Desc Tr to the wire, 26 bytes from where the cursor stands */
inline encode_contract_desc_tr(contract_desc_tr_record) {
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 6 -> wire[at] = contract_desc_tr_record.instrument_name[contract_desc_tr_at]; at = at + 1; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 10 -> wire[at] = contract_desc_tr_record.symbol[contract_desc_tr_at]; at = at + 1; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 4 -> wire[at] = contract_desc_tr_record.expiry_date[contract_desc_tr_at]; at = at + 1; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 4 -> wire[at] = contract_desc_tr_record.strike_price[contract_desc_tr_at]; at = at + 1; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 2 -> wire[at] = contract_desc_tr_record.option_type[contract_desc_tr_at]; at = at + 1; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  skip
}

/* Contract Desc Tr off the wire, 26 bytes from where the cursor stands */
inline decode_contract_desc_tr(contract_desc_tr_record) {
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 6 -> contract_desc_tr_record.instrument_name[contract_desc_tr_at] = wire[at]; at = at + 1; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 10 -> contract_desc_tr_record.symbol[contract_desc_tr_at] = wire[at]; at = at + 1; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 4 -> contract_desc_tr_record.expiry_date[contract_desc_tr_at] = wire[at]; at = at + 1; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 4 -> contract_desc_tr_record.strike_price[contract_desc_tr_at] = wire[at]; at = at + 1; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 2 -> contract_desc_tr_record.option_type[contract_desc_tr_at] = wire[at]; at = at + 1; contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Contract Desc Tr is what was written, byte for byte */
inline equal_contract_desc_tr(contract_desc_tr_read, contract_desc_tr_written) {
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 6 -> assert(contract_desc_tr_read.instrument_name[contract_desc_tr_at] == contract_desc_tr_written.instrument_name[contract_desc_tr_at]); contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 10 -> assert(contract_desc_tr_read.symbol[contract_desc_tr_at] == contract_desc_tr_written.symbol[contract_desc_tr_at]); contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 4 -> assert(contract_desc_tr_read.expiry_date[contract_desc_tr_at] == contract_desc_tr_written.expiry_date[contract_desc_tr_at]); contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 4 -> assert(contract_desc_tr_read.strike_price[contract_desc_tr_at] == contract_desc_tr_written.strike_price[contract_desc_tr_at]); contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  contract_desc_tr_at = 0;
  do
  :: contract_desc_tr_at < 2 -> assert(contract_desc_tr_read.option_type[contract_desc_tr_at] == contract_desc_tr_written.option_type[contract_desc_tr_at]); contract_desc_tr_at = contract_desc_tr_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Contract Desc Tr: encoded, read back, and compared */
proctype check_contract_desc_tr() {
  ContractDescTr contract_desc_tr_sent;
  ContractDescTr contract_desc_tr_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contract_desc_tr(contract_desc_tr_sent, 0)
  :: pattern == 1 -> fill_contract_desc_tr(contract_desc_tr_sent, 32)
  :: pattern == 2 -> fill_contract_desc_tr(contract_desc_tr_sent, 255)
  :: else -> ramp_contract_desc_tr(contract_desc_tr_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contract_desc_tr(contract_desc_tr_sent);
    assert(at == 26);
    at = 0;
    decode_contract_desc_tr(contract_desc_tr_got);
    assert(at == 26);
    equal_contract_desc_tr(contract_desc_tr_got, contract_desc_tr_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_contract_desc_tr()
  fi
}
