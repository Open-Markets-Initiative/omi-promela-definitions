/*
 * The Members Exchange Memoir Top Of Book
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
 *   - a block whose stated length holds more than its fields
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 35

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Common Header: 18 bytes ------------------------------------------------- */

/* Common Header */
typedef CommonHeader {
  byte message_type;
  byte header_length;
  byte session_id[8];
  byte sequence_number[8]
};

int common_header_at;

/* every byte of Common Header set to one value */
inline fill_common_header(common_header_record, common_header_value) {
  common_header_record.message_type = common_header_value;
  common_header_record.header_length = common_header_value;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> common_header_record.session_id[common_header_at] = common_header_value; common_header_at = common_header_at + 1
  :: else -> break
  od;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> common_header_record.sequence_number[common_header_at] = common_header_value; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Common Header set to where it lies, so a field read out of place says so */
inline ramp_common_header(common_header_record, common_header_base) {
  common_header_record.message_type = (common_header_base + 0 + 1) % 256;
  common_header_record.header_length = (common_header_base + 1 + 1) % 256;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> common_header_record.session_id[common_header_at] = (common_header_base + 2 + common_header_at + 1) % 256; common_header_at = common_header_at + 1
  :: else -> break
  od;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> common_header_record.sequence_number[common_header_at] = (common_header_base + 10 + common_header_at + 1) % 256; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* Common Header to the wire, 18 bytes from where the cursor stands */
inline encode_common_header(common_header_record) {
  wire[at] = common_header_record.message_type; at = at + 1;
  wire[at] = common_header_record.header_length; at = at + 1;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> wire[at] = common_header_record.session_id[common_header_at]; at = at + 1; common_header_at = common_header_at + 1
  :: else -> break
  od;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> wire[at] = common_header_record.sequence_number[common_header_at]; at = at + 1; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* Common Header off the wire, 18 bytes from where the cursor stands */
inline decode_common_header(common_header_record) {
  common_header_record.message_type = wire[at]; at = at + 1;
  common_header_record.header_length = wire[at]; at = at + 1;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> common_header_record.session_id[common_header_at] = wire[at]; at = at + 1; common_header_at = common_header_at + 1
  :: else -> break
  od;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> common_header_record.sequence_number[common_header_at] = wire[at]; at = at + 1; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Common Header is what was written, byte for byte */
inline equal_common_header(common_header_read, common_header_written) {
  assert(common_header_read.message_type == common_header_written.message_type);
  assert(common_header_read.header_length == common_header_written.header_length);
  common_header_at = 0;
  do
  :: common_header_at < 8 -> assert(common_header_read.session_id[common_header_at] == common_header_written.session_id[common_header_at]); common_header_at = common_header_at + 1
  :: else -> break
  od;
  common_header_at = 0;
  do
  :: common_header_at < 8 -> assert(common_header_read.sequence_number[common_header_at] == common_header_written.sequence_number[common_header_at]); common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sbe Header: 6 bytes ----------------------------------------------------- */

/* Sbe Header */
typedef SbeHeader {
  byte block_length[2];
  byte template_id;
  byte schema_id;
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
  sbe_header_record.template_id = sbe_header_value;
  sbe_header_record.schema_id = sbe_header_value;
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
  sbe_header_record.template_id = (sbe_header_base + 2 + 1) % 256;
  sbe_header_record.schema_id = (sbe_header_base + 3 + 1) % 256;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = (sbe_header_base + 4 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header to the wire, 6 bytes from where the cursor stands */
inline encode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.block_length[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  wire[at] = sbe_header_record.template_id; at = at + 1;
  wire[at] = sbe_header_record.schema_id; at = at + 1;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.version[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header off the wire, 6 bytes from where the cursor stands */
inline decode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_record.template_id = wire[at]; at = at + 1;
  sbe_header_record.schema_id = wire[at]; at = at + 1;
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
  assert(sbe_header_read.template_id == sbe_header_written.template_id);
  assert(sbe_header_read.schema_id == sbe_header_written.schema_id);
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.version[sbe_header_at] == sbe_header_written.version[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Directory Message: 35 bytes ---------------------------------- */

/* InstrumentDirectoryMessage */
typedef InstrumentDirectoryMessage {
  byte timestamp[8];
  byte security_id[2];
  byte symbol[6];
  byte symbol_sfx[6];
  byte round_lot[4];
  byte is_test_symbol;
  byte mpv[8]
};

int instrument_directory_message_at;

/* every byte of Instrument Directory Message set to one value */
inline fill_instrument_directory_message(instrument_directory_message_record, instrument_directory_message_value) {
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.timestamp[instrument_directory_message_at] = instrument_directory_message_value; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 2 -> instrument_directory_message_record.security_id[instrument_directory_message_at] = instrument_directory_message_value; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> instrument_directory_message_record.symbol[instrument_directory_message_at] = instrument_directory_message_value; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> instrument_directory_message_record.symbol_sfx[instrument_directory_message_at] = instrument_directory_message_value; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 4 -> instrument_directory_message_record.round_lot[instrument_directory_message_at] = instrument_directory_message_value; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.is_test_symbol = instrument_directory_message_value;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.mpv[instrument_directory_message_at] = instrument_directory_message_value; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Directory Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_directory_message(instrument_directory_message_record, instrument_directory_message_base) {
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.timestamp[instrument_directory_message_at] = (instrument_directory_message_base + 0 + instrument_directory_message_at + 1) % 256; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 2 -> instrument_directory_message_record.security_id[instrument_directory_message_at] = (instrument_directory_message_base + 8 + instrument_directory_message_at + 1) % 256; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> instrument_directory_message_record.symbol[instrument_directory_message_at] = (instrument_directory_message_base + 10 + instrument_directory_message_at + 1) % 256; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> instrument_directory_message_record.symbol_sfx[instrument_directory_message_at] = (instrument_directory_message_base + 16 + instrument_directory_message_at + 1) % 256; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 4 -> instrument_directory_message_record.round_lot[instrument_directory_message_at] = (instrument_directory_message_base + 22 + instrument_directory_message_at + 1) % 256; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.is_test_symbol = (instrument_directory_message_base + 26 + 1) % 256;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.mpv[instrument_directory_message_at] = (instrument_directory_message_base + 27 + instrument_directory_message_at + 1) % 256; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Directory Message to the wire, 35 bytes from where the cursor stands */
inline encode_instrument_directory_message(instrument_directory_message_record) {
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> wire[at] = instrument_directory_message_record.timestamp[instrument_directory_message_at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 2 -> wire[at] = instrument_directory_message_record.security_id[instrument_directory_message_at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> wire[at] = instrument_directory_message_record.symbol[instrument_directory_message_at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> wire[at] = instrument_directory_message_record.symbol_sfx[instrument_directory_message_at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 4 -> wire[at] = instrument_directory_message_record.round_lot[instrument_directory_message_at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_directory_message_record.is_test_symbol; at = at + 1;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> wire[at] = instrument_directory_message_record.mpv[instrument_directory_message_at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Directory Message off the wire, 35 bytes from where the cursor stands */
inline decode_instrument_directory_message(instrument_directory_message_record) {
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.timestamp[instrument_directory_message_at] = wire[at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 2 -> instrument_directory_message_record.security_id[instrument_directory_message_at] = wire[at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> instrument_directory_message_record.symbol[instrument_directory_message_at] = wire[at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> instrument_directory_message_record.symbol_sfx[instrument_directory_message_at] = wire[at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 4 -> instrument_directory_message_record.round_lot[instrument_directory_message_at] = wire[at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_record.is_test_symbol = wire[at]; at = at + 1;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> instrument_directory_message_record.mpv[instrument_directory_message_at] = wire[at]; at = at + 1; instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Directory Message is what was written, byte for byte */
inline equal_instrument_directory_message(instrument_directory_message_read, instrument_directory_message_written) {
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> assert(instrument_directory_message_read.timestamp[instrument_directory_message_at] == instrument_directory_message_written.timestamp[instrument_directory_message_at]); instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 2 -> assert(instrument_directory_message_read.security_id[instrument_directory_message_at] == instrument_directory_message_written.security_id[instrument_directory_message_at]); instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> assert(instrument_directory_message_read.symbol[instrument_directory_message_at] == instrument_directory_message_written.symbol[instrument_directory_message_at]); instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 6 -> assert(instrument_directory_message_read.symbol_sfx[instrument_directory_message_at] == instrument_directory_message_written.symbol_sfx[instrument_directory_message_at]); instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 4 -> assert(instrument_directory_message_read.round_lot[instrument_directory_message_at] == instrument_directory_message_written.round_lot[instrument_directory_message_at]); instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  assert(instrument_directory_message_read.is_test_symbol == instrument_directory_message_written.is_test_symbol);
  instrument_directory_message_at = 0;
  do
  :: instrument_directory_message_at < 8 -> assert(instrument_directory_message_read.mpv[instrument_directory_message_at] == instrument_directory_message_written.mpv[instrument_directory_message_at]); instrument_directory_message_at = instrument_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reg Sho Restriction Message: 11 bytes ----------------------------------- */

/* RegSHORestrictionMessage */
typedef RegShoRestrictionMessage {
  byte timestamp[8];
  byte security_id[2];
  byte short_sale_restriction
};

int reg_sho_restriction_message_at;

/* every byte of Reg Sho Restriction Message set to one value */
inline fill_reg_sho_restriction_message(reg_sho_restriction_message_record, reg_sho_restriction_message_value) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.timestamp[reg_sho_restriction_message_at] = reg_sho_restriction_message_value; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 2 -> reg_sho_restriction_message_record.security_id[reg_sho_restriction_message_at] = reg_sho_restriction_message_value; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_record.short_sale_restriction = reg_sho_restriction_message_value;
  skip
}

/* each byte of Reg Sho Restriction Message set to where it lies, so a field read out of place says so */
inline ramp_reg_sho_restriction_message(reg_sho_restriction_message_record, reg_sho_restriction_message_base) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.timestamp[reg_sho_restriction_message_at] = (reg_sho_restriction_message_base + 0 + reg_sho_restriction_message_at + 1) % 256; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 2 -> reg_sho_restriction_message_record.security_id[reg_sho_restriction_message_at] = (reg_sho_restriction_message_base + 8 + reg_sho_restriction_message_at + 1) % 256; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_record.short_sale_restriction = (reg_sho_restriction_message_base + 10 + 1) % 256;
  skip
}

/* Reg Sho Restriction Message to the wire, 11 bytes from where the cursor stands */
inline encode_reg_sho_restriction_message(reg_sho_restriction_message_record) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> wire[at] = reg_sho_restriction_message_record.timestamp[reg_sho_restriction_message_at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 2 -> wire[at] = reg_sho_restriction_message_record.security_id[reg_sho_restriction_message_at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  wire[at] = reg_sho_restriction_message_record.short_sale_restriction; at = at + 1;
  skip
}

/* Reg Sho Restriction Message off the wire, 11 bytes from where the cursor stands */
inline decode_reg_sho_restriction_message(reg_sho_restriction_message_record) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.timestamp[reg_sho_restriction_message_at] = wire[at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 2 -> reg_sho_restriction_message_record.security_id[reg_sho_restriction_message_at] = wire[at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_record.short_sale_restriction = wire[at]; at = at + 1;
  skip
}

/* what was read of Reg Sho Restriction Message is what was written, byte for byte */
inline equal_reg_sho_restriction_message(reg_sho_restriction_message_read, reg_sho_restriction_message_written) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> assert(reg_sho_restriction_message_read.timestamp[reg_sho_restriction_message_at] == reg_sho_restriction_message_written.timestamp[reg_sho_restriction_message_at]); reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 2 -> assert(reg_sho_restriction_message_read.security_id[reg_sho_restriction_message_at] == reg_sho_restriction_message_written.security_id[reg_sho_restriction_message_at]); reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  assert(reg_sho_restriction_message_read.short_sale_restriction == reg_sho_restriction_message_written.short_sale_restriction);
  skip
}

/* ---- Security Trading Status Message: 12 bytes ------------------------------- */

/* SecurityTradingStatusMessage */
typedef SecurityTradingStatusMessage {
  byte timestamp[8];
  byte security_id[2];
  byte security_trading_status;
  byte security_trading_status_reason
};

int security_trading_status_message_at;

/* every byte of Security Trading Status Message set to one value */
inline fill_security_trading_status_message(security_trading_status_message_record, security_trading_status_message_value) {
  security_trading_status_message_at = 0;
  do
  :: security_trading_status_message_at < 8 -> security_trading_status_message_record.timestamp[security_trading_status_message_at] = security_trading_status_message_value; security_trading_status_message_at = security_trading_status_message_at + 1
  :: else -> break
  od;
  security_trading_status_message_at = 0;
  do
  :: security_trading_status_message_at < 2 -> security_trading_status_message_record.security_id[security_trading_status_message_at] = security_trading_status_message_value; security_trading_status_message_at = security_trading_status_message_at + 1
  :: else -> break
  od;
  security_trading_status_message_record.security_trading_status = security_trading_status_message_value;
  security_trading_status_message_record.security_trading_status_reason = security_trading_status_message_value;
  skip
}

/* each byte of Security Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_security_trading_status_message(security_trading_status_message_record, security_trading_status_message_base) {
  security_trading_status_message_at = 0;
  do
  :: security_trading_status_message_at < 8 -> security_trading_status_message_record.timestamp[security_trading_status_message_at] = (security_trading_status_message_base + 0 + security_trading_status_message_at + 1) % 256; security_trading_status_message_at = security_trading_status_message_at + 1
  :: else -> break
  od;
  security_trading_status_message_at = 0;
  do
  :: security_trading_status_message_at < 2 -> security_trading_status_message_record.security_id[security_trading_status_message_at] = (security_trading_status_message_base + 8 + security_trading_status_message_at + 1) % 256; security_trading_status_message_at = security_trading_status_message_at + 1
  :: else -> break
  od;
  security_trading_status_message_record.security_trading_status = (security_trading_status_message_base + 10 + 1) % 256;
  security_trading_status_message_record.security_trading_status_reason = (security_trading_status_message_base + 11 + 1) % 256;
  skip
}

/* Security Trading Status Message to the wire, 12 bytes from where the cursor stands */
inline encode_security_trading_status_message(security_trading_status_message_record) {
  security_trading_status_message_at = 0;
  do
  :: security_trading_status_message_at < 8 -> wire[at] = security_trading_status_message_record.timestamp[security_trading_status_message_at]; at = at + 1; security_trading_status_message_at = security_trading_status_message_at + 1
  :: else -> break
  od;
  security_trading_status_message_at = 0;
  do
  :: security_trading_status_message_at < 2 -> wire[at] = security_trading_status_message_record.security_id[security_trading_status_message_at]; at = at + 1; security_trading_status_message_at = security_trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = security_trading_status_message_record.security_trading_status; at = at + 1;
  wire[at] = security_trading_status_message_record.security_trading_status_reason; at = at + 1;
  skip
}

/* Security Trading Status Message off the wire, 12 bytes from where the cursor stands */
inline decode_security_trading_status_message(security_trading_status_message_record) {
  security_trading_status_message_at = 0;
  do
  :: security_trading_status_message_at < 8 -> security_trading_status_message_record.timestamp[security_trading_status_message_at] = wire[at]; at = at + 1; security_trading_status_message_at = security_trading_status_message_at + 1
  :: else -> break
  od;
  security_trading_status_message_at = 0;
  do
  :: security_trading_status_message_at < 2 -> security_trading_status_message_record.security_id[security_trading_status_message_at] = wire[at]; at = at + 1; security_trading_status_message_at = security_trading_status_message_at + 1
  :: else -> break
  od;
  security_trading_status_message_record.security_trading_status = wire[at]; at = at + 1;
  security_trading_status_message_record.security_trading_status_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Security Trading Status Message is what was written, byte for byte */
inline equal_security_trading_status_message(security_trading_status_message_read, security_trading_status_message_written) {
  security_trading_status_message_at = 0;
  do
  :: security_trading_status_message_at < 8 -> assert(security_trading_status_message_read.timestamp[security_trading_status_message_at] == security_trading_status_message_written.timestamp[security_trading_status_message_at]); security_trading_status_message_at = security_trading_status_message_at + 1
  :: else -> break
  od;
  security_trading_status_message_at = 0;
  do
  :: security_trading_status_message_at < 2 -> assert(security_trading_status_message_read.security_id[security_trading_status_message_at] == security_trading_status_message_written.security_id[security_trading_status_message_at]); security_trading_status_message_at = security_trading_status_message_at + 1
  :: else -> break
  od;
  assert(security_trading_status_message_read.security_trading_status == security_trading_status_message_written.security_trading_status);
  assert(security_trading_status_message_read.security_trading_status_reason == security_trading_status_message_written.security_trading_status_reason);
  skip
}

/* ---- Snapshot Complete Message: 16 bytes ------------------------------------- */

/* SnapshotCompleteMessage */
typedef SnapshotCompleteMessage {
  byte timestamp[8];
  byte as_of_sequence_number[8]
};

int snapshot_complete_message_at;

/* every byte of Snapshot Complete Message set to one value */
inline fill_snapshot_complete_message(snapshot_complete_message_record, snapshot_complete_message_value) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> snapshot_complete_message_record.timestamp[snapshot_complete_message_at] = snapshot_complete_message_value; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> snapshot_complete_message_record.as_of_sequence_number[snapshot_complete_message_at] = snapshot_complete_message_value; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Snapshot Complete Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_complete_message(snapshot_complete_message_record, snapshot_complete_message_base) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> snapshot_complete_message_record.timestamp[snapshot_complete_message_at] = (snapshot_complete_message_base + 0 + snapshot_complete_message_at + 1) % 256; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> snapshot_complete_message_record.as_of_sequence_number[snapshot_complete_message_at] = (snapshot_complete_message_base + 8 + snapshot_complete_message_at + 1) % 256; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Complete Message to the wire, 16 bytes from where the cursor stands */
inline encode_snapshot_complete_message(snapshot_complete_message_record) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> wire[at] = snapshot_complete_message_record.timestamp[snapshot_complete_message_at]; at = at + 1; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> wire[at] = snapshot_complete_message_record.as_of_sequence_number[snapshot_complete_message_at]; at = at + 1; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Complete Message off the wire, 16 bytes from where the cursor stands */
inline decode_snapshot_complete_message(snapshot_complete_message_record) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> snapshot_complete_message_record.timestamp[snapshot_complete_message_at] = wire[at]; at = at + 1; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> snapshot_complete_message_record.as_of_sequence_number[snapshot_complete_message_at] = wire[at]; at = at + 1; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Snapshot Complete Message is what was written, byte for byte */
inline equal_snapshot_complete_message(snapshot_complete_message_read, snapshot_complete_message_written) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> assert(snapshot_complete_message_read.timestamp[snapshot_complete_message_at] == snapshot_complete_message_written.timestamp[snapshot_complete_message_at]); snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 8 -> assert(snapshot_complete_message_read.as_of_sequence_number[snapshot_complete_message_at] == snapshot_complete_message_written.as_of_sequence_number[snapshot_complete_message_at]); snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Session Status Message: 9 bytes --------------------------------- */

/* TradingSessionStatusMessage */
typedef TradingSessionStatusMessage {
  byte timestamp[8];
  byte trading_session
};

int trading_session_status_message_at;

/* every byte of Trading Session Status Message set to one value */
inline fill_trading_session_status_message(trading_session_status_message_record, trading_session_status_message_value) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.timestamp[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trading_session = trading_session_status_message_value;
  skip
}

/* each byte of Trading Session Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_session_status_message(trading_session_status_message_record, trading_session_status_message_base) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.timestamp[trading_session_status_message_at] = (trading_session_status_message_base + 0 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trading_session = (trading_session_status_message_base + 8 + 1) % 256;
  skip
}

/* Trading Session Status Message to the wire, 9 bytes from where the cursor stands */
inline encode_trading_session_status_message(trading_session_status_message_record) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> wire[at] = trading_session_status_message_record.timestamp[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_session_status_message_record.trading_session; at = at + 1;
  skip
}

/* Trading Session Status Message off the wire, 9 bytes from where the cursor stands */
inline decode_trading_session_status_message(trading_session_status_message_record) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.timestamp[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trading_session = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Session Status Message is what was written, byte for byte */
inline equal_trading_session_status_message(trading_session_status_message_read, trading_session_status_message_written) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> assert(trading_session_status_message_read.timestamp[trading_session_status_message_at] == trading_session_status_message_written.timestamp[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  assert(trading_session_status_message_read.trading_session == trading_session_status_message_written.trading_session);
  skip
}

/* ---- Best Bid Offer Message: 34 bytes ---------------------------------------- */

/* BestBidOfferMessage */
typedef BestBidOfferMessage {
  byte timestamp[8];
  byte security_id[2];
  byte bid_size[4];
  byte bid_price[8];
  byte offer_size[4];
  byte offer_price[8]
};

int best_bid_offer_message_at;

/* every byte of Best Bid Offer Message set to one value */
inline fill_best_bid_offer_message(best_bid_offer_message_record, best_bid_offer_message_value) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.timestamp[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 2 -> best_bid_offer_message_record.security_id[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.bid_size[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.bid_price[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.offer_size[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.offer_price[best_bid_offer_message_at] = best_bid_offer_message_value; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Bid Offer Message set to where it lies, so a field read out of place says so */
inline ramp_best_bid_offer_message(best_bid_offer_message_record, best_bid_offer_message_base) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.timestamp[best_bid_offer_message_at] = (best_bid_offer_message_base + 0 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 2 -> best_bid_offer_message_record.security_id[best_bid_offer_message_at] = (best_bid_offer_message_base + 8 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.bid_size[best_bid_offer_message_at] = (best_bid_offer_message_base + 10 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.bid_price[best_bid_offer_message_at] = (best_bid_offer_message_base + 14 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.offer_size[best_bid_offer_message_at] = (best_bid_offer_message_base + 22 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.offer_price[best_bid_offer_message_at] = (best_bid_offer_message_base + 26 + best_bid_offer_message_at + 1) % 256; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Offer Message to the wire, 34 bytes from where the cursor stands */
inline encode_best_bid_offer_message(best_bid_offer_message_record) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> wire[at] = best_bid_offer_message_record.timestamp[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 2 -> wire[at] = best_bid_offer_message_record.security_id[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> wire[at] = best_bid_offer_message_record.bid_size[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> wire[at] = best_bid_offer_message_record.bid_price[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> wire[at] = best_bid_offer_message_record.offer_size[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> wire[at] = best_bid_offer_message_record.offer_price[best_bid_offer_message_at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Offer Message off the wire, 34 bytes from where the cursor stands */
inline decode_best_bid_offer_message(best_bid_offer_message_record) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.timestamp[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 2 -> best_bid_offer_message_record.security_id[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.bid_size[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.bid_price[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> best_bid_offer_message_record.offer_size[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> best_bid_offer_message_record.offer_price[best_bid_offer_message_at] = wire[at]; at = at + 1; best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Bid Offer Message is what was written, byte for byte */
inline equal_best_bid_offer_message(best_bid_offer_message_read, best_bid_offer_message_written) {
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> assert(best_bid_offer_message_read.timestamp[best_bid_offer_message_at] == best_bid_offer_message_written.timestamp[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 2 -> assert(best_bid_offer_message_read.security_id[best_bid_offer_message_at] == best_bid_offer_message_written.security_id[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> assert(best_bid_offer_message_read.bid_size[best_bid_offer_message_at] == best_bid_offer_message_written.bid_size[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> assert(best_bid_offer_message_read.bid_price[best_bid_offer_message_at] == best_bid_offer_message_written.bid_price[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 4 -> assert(best_bid_offer_message_read.offer_size[best_bid_offer_message_at] == best_bid_offer_message_written.offer_size[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  best_bid_offer_message_at = 0;
  do
  :: best_bid_offer_message_at < 8 -> assert(best_bid_offer_message_read.offer_price[best_bid_offer_message_at] == best_bid_offer_message_written.offer_price[best_bid_offer_message_at]); best_bid_offer_message_at = best_bid_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Bid Message: 22 bytes ---------------------------------------------- */

/* BestBidMessage */
typedef BestBidMessage {
  byte timestamp[8];
  byte security_id[2];
  byte bid_size[4];
  byte bid_price[8]
};

int best_bid_message_at;

/* every byte of Best Bid Message set to one value */
inline fill_best_bid_message(best_bid_message_record, best_bid_message_value) {
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.timestamp[best_bid_message_at] = best_bid_message_value; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 2 -> best_bid_message_record.security_id[best_bid_message_at] = best_bid_message_value; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> best_bid_message_record.bid_size[best_bid_message_at] = best_bid_message_value; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.bid_price[best_bid_message_at] = best_bid_message_value; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Bid Message set to where it lies, so a field read out of place says so */
inline ramp_best_bid_message(best_bid_message_record, best_bid_message_base) {
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.timestamp[best_bid_message_at] = (best_bid_message_base + 0 + best_bid_message_at + 1) % 256; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 2 -> best_bid_message_record.security_id[best_bid_message_at] = (best_bid_message_base + 8 + best_bid_message_at + 1) % 256; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> best_bid_message_record.bid_size[best_bid_message_at] = (best_bid_message_base + 10 + best_bid_message_at + 1) % 256; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.bid_price[best_bid_message_at] = (best_bid_message_base + 14 + best_bid_message_at + 1) % 256; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Message to the wire, 22 bytes from where the cursor stands */
inline encode_best_bid_message(best_bid_message_record) {
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> wire[at] = best_bid_message_record.timestamp[best_bid_message_at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 2 -> wire[at] = best_bid_message_record.security_id[best_bid_message_at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> wire[at] = best_bid_message_record.bid_size[best_bid_message_at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> wire[at] = best_bid_message_record.bid_price[best_bid_message_at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Message off the wire, 22 bytes from where the cursor stands */
inline decode_best_bid_message(best_bid_message_record) {
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.timestamp[best_bid_message_at] = wire[at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 2 -> best_bid_message_record.security_id[best_bid_message_at] = wire[at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> best_bid_message_record.bid_size[best_bid_message_at] = wire[at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> best_bid_message_record.bid_price[best_bid_message_at] = wire[at]; at = at + 1; best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Bid Message is what was written, byte for byte */
inline equal_best_bid_message(best_bid_message_read, best_bid_message_written) {
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> assert(best_bid_message_read.timestamp[best_bid_message_at] == best_bid_message_written.timestamp[best_bid_message_at]); best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 2 -> assert(best_bid_message_read.security_id[best_bid_message_at] == best_bid_message_written.security_id[best_bid_message_at]); best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 4 -> assert(best_bid_message_read.bid_size[best_bid_message_at] == best_bid_message_written.bid_size[best_bid_message_at]); best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  best_bid_message_at = 0;
  do
  :: best_bid_message_at < 8 -> assert(best_bid_message_read.bid_price[best_bid_message_at] == best_bid_message_written.bid_price[best_bid_message_at]); best_bid_message_at = best_bid_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Offer Message: 22 bytes -------------------------------------------- */

/* BestOfferMessage */
typedef BestOfferMessage {
  byte timestamp[8];
  byte security_id[2];
  byte offer_size[4];
  byte offer_price[8]
};

int best_offer_message_at;

/* every byte of Best Offer Message set to one value */
inline fill_best_offer_message(best_offer_message_record, best_offer_message_value) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.timestamp[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 2 -> best_offer_message_record.security_id[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.offer_size[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.offer_price[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Offer Message set to where it lies, so a field read out of place says so */
inline ramp_best_offer_message(best_offer_message_record, best_offer_message_base) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.timestamp[best_offer_message_at] = (best_offer_message_base + 0 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 2 -> best_offer_message_record.security_id[best_offer_message_at] = (best_offer_message_base + 8 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.offer_size[best_offer_message_at] = (best_offer_message_base + 10 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.offer_price[best_offer_message_at] = (best_offer_message_base + 14 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Offer Message to the wire, 22 bytes from where the cursor stands */
inline encode_best_offer_message(best_offer_message_record) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> wire[at] = best_offer_message_record.timestamp[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 2 -> wire[at] = best_offer_message_record.security_id[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> wire[at] = best_offer_message_record.offer_size[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> wire[at] = best_offer_message_record.offer_price[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Offer Message off the wire, 22 bytes from where the cursor stands */
inline decode_best_offer_message(best_offer_message_record) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.timestamp[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 2 -> best_offer_message_record.security_id[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.offer_size[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.offer_price[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Offer Message is what was written, byte for byte */
inline equal_best_offer_message(best_offer_message_read, best_offer_message_written) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> assert(best_offer_message_read.timestamp[best_offer_message_at] == best_offer_message_written.timestamp[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 2 -> assert(best_offer_message_read.security_id[best_offer_message_at] == best_offer_message_written.security_id[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> assert(best_offer_message_read.offer_size[best_offer_message_at] == best_offer_message_written.offer_size[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> assert(best_offer_message_read.offer_price[best_offer_message_at] == best_offer_message_written.offer_price[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Bid Short Message: 14 bytes ---------------------------------------- */

/* BestBidShortMessage */
typedef BestBidShortMessage {
  byte timestamp[8];
  byte security_id[2];
  byte bid_size_short[2];
  byte bid_price_short[2]
};

int best_bid_short_message_at;

/* every byte of Best Bid Short Message set to one value */
inline fill_best_bid_short_message(best_bid_short_message_record, best_bid_short_message_value) {
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> best_bid_short_message_record.timestamp[best_bid_short_message_at] = best_bid_short_message_value; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.security_id[best_bid_short_message_at] = best_bid_short_message_value; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.bid_size_short[best_bid_short_message_at] = best_bid_short_message_value; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.bid_price_short[best_bid_short_message_at] = best_bid_short_message_value; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Bid Short Message set to where it lies, so a field read out of place says so */
inline ramp_best_bid_short_message(best_bid_short_message_record, best_bid_short_message_base) {
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> best_bid_short_message_record.timestamp[best_bid_short_message_at] = (best_bid_short_message_base + 0 + best_bid_short_message_at + 1) % 256; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.security_id[best_bid_short_message_at] = (best_bid_short_message_base + 8 + best_bid_short_message_at + 1) % 256; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.bid_size_short[best_bid_short_message_at] = (best_bid_short_message_base + 10 + best_bid_short_message_at + 1) % 256; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.bid_price_short[best_bid_short_message_at] = (best_bid_short_message_base + 12 + best_bid_short_message_at + 1) % 256; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Short Message to the wire, 14 bytes from where the cursor stands */
inline encode_best_bid_short_message(best_bid_short_message_record) {
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> wire[at] = best_bid_short_message_record.timestamp[best_bid_short_message_at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> wire[at] = best_bid_short_message_record.security_id[best_bid_short_message_at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> wire[at] = best_bid_short_message_record.bid_size_short[best_bid_short_message_at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> wire[at] = best_bid_short_message_record.bid_price_short[best_bid_short_message_at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid Short Message off the wire, 14 bytes from where the cursor stands */
inline decode_best_bid_short_message(best_bid_short_message_record) {
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> best_bid_short_message_record.timestamp[best_bid_short_message_at] = wire[at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.security_id[best_bid_short_message_at] = wire[at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.bid_size_short[best_bid_short_message_at] = wire[at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> best_bid_short_message_record.bid_price_short[best_bid_short_message_at] = wire[at]; at = at + 1; best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Bid Short Message is what was written, byte for byte */
inline equal_best_bid_short_message(best_bid_short_message_read, best_bid_short_message_written) {
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 8 -> assert(best_bid_short_message_read.timestamp[best_bid_short_message_at] == best_bid_short_message_written.timestamp[best_bid_short_message_at]); best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> assert(best_bid_short_message_read.security_id[best_bid_short_message_at] == best_bid_short_message_written.security_id[best_bid_short_message_at]); best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> assert(best_bid_short_message_read.bid_size_short[best_bid_short_message_at] == best_bid_short_message_written.bid_size_short[best_bid_short_message_at]); best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  best_bid_short_message_at = 0;
  do
  :: best_bid_short_message_at < 2 -> assert(best_bid_short_message_read.bid_price_short[best_bid_short_message_at] == best_bid_short_message_written.bid_price_short[best_bid_short_message_at]); best_bid_short_message_at = best_bid_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Offer Short Message: 14 bytes -------------------------------------- */

/* BestOfferShortMessage */
typedef BestOfferShortMessage {
  byte timestamp[8];
  byte security_id[2];
  byte offer_size_short[2];
  byte offer_price_short[2]
};

int best_offer_short_message_at;

/* every byte of Best Offer Short Message set to one value */
inline fill_best_offer_short_message(best_offer_short_message_record, best_offer_short_message_value) {
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> best_offer_short_message_record.timestamp[best_offer_short_message_at] = best_offer_short_message_value; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.security_id[best_offer_short_message_at] = best_offer_short_message_value; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.offer_size_short[best_offer_short_message_at] = best_offer_short_message_value; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.offer_price_short[best_offer_short_message_at] = best_offer_short_message_value; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Offer Short Message set to where it lies, so a field read out of place says so */
inline ramp_best_offer_short_message(best_offer_short_message_record, best_offer_short_message_base) {
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> best_offer_short_message_record.timestamp[best_offer_short_message_at] = (best_offer_short_message_base + 0 + best_offer_short_message_at + 1) % 256; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.security_id[best_offer_short_message_at] = (best_offer_short_message_base + 8 + best_offer_short_message_at + 1) % 256; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.offer_size_short[best_offer_short_message_at] = (best_offer_short_message_base + 10 + best_offer_short_message_at + 1) % 256; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.offer_price_short[best_offer_short_message_at] = (best_offer_short_message_base + 12 + best_offer_short_message_at + 1) % 256; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Offer Short Message to the wire, 14 bytes from where the cursor stands */
inline encode_best_offer_short_message(best_offer_short_message_record) {
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> wire[at] = best_offer_short_message_record.timestamp[best_offer_short_message_at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> wire[at] = best_offer_short_message_record.security_id[best_offer_short_message_at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> wire[at] = best_offer_short_message_record.offer_size_short[best_offer_short_message_at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> wire[at] = best_offer_short_message_record.offer_price_short[best_offer_short_message_at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Offer Short Message off the wire, 14 bytes from where the cursor stands */
inline decode_best_offer_short_message(best_offer_short_message_record) {
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> best_offer_short_message_record.timestamp[best_offer_short_message_at] = wire[at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.security_id[best_offer_short_message_at] = wire[at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.offer_size_short[best_offer_short_message_at] = wire[at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> best_offer_short_message_record.offer_price_short[best_offer_short_message_at] = wire[at]; at = at + 1; best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Offer Short Message is what was written, byte for byte */
inline equal_best_offer_short_message(best_offer_short_message_read, best_offer_short_message_written) {
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 8 -> assert(best_offer_short_message_read.timestamp[best_offer_short_message_at] == best_offer_short_message_written.timestamp[best_offer_short_message_at]); best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> assert(best_offer_short_message_read.security_id[best_offer_short_message_at] == best_offer_short_message_written.security_id[best_offer_short_message_at]); best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> assert(best_offer_short_message_read.offer_size_short[best_offer_short_message_at] == best_offer_short_message_written.offer_size_short[best_offer_short_message_at]); best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  best_offer_short_message_at = 0;
  do
  :: best_offer_short_message_at < 2 -> assert(best_offer_short_message_read.offer_price_short[best_offer_short_message_at] == best_offer_short_message_written.offer_price_short[best_offer_short_message_at]); best_offer_short_message_at = best_offer_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Clear Book Message: 10 bytes -------------------------------------------- */

/* ClearBookMessage */
typedef ClearBookMessage {
  byte timestamp[8];
  byte security_id[2]
};

int clear_book_message_at;

/* every byte of Clear Book Message set to one value */
inline fill_clear_book_message(clear_book_message_record, clear_book_message_value) {
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> clear_book_message_record.timestamp[clear_book_message_at] = clear_book_message_value; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 2 -> clear_book_message_record.security_id[clear_book_message_at] = clear_book_message_value; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Clear Book Message set to where it lies, so a field read out of place says so */
inline ramp_clear_book_message(clear_book_message_record, clear_book_message_base) {
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> clear_book_message_record.timestamp[clear_book_message_at] = (clear_book_message_base + 0 + clear_book_message_at + 1) % 256; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 2 -> clear_book_message_record.security_id[clear_book_message_at] = (clear_book_message_base + 8 + clear_book_message_at + 1) % 256; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Clear Book Message to the wire, 10 bytes from where the cursor stands */
inline encode_clear_book_message(clear_book_message_record) {
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> wire[at] = clear_book_message_record.timestamp[clear_book_message_at]; at = at + 1; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 2 -> wire[at] = clear_book_message_record.security_id[clear_book_message_at]; at = at + 1; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Clear Book Message off the wire, 10 bytes from where the cursor stands */
inline decode_clear_book_message(clear_book_message_record) {
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> clear_book_message_record.timestamp[clear_book_message_at] = wire[at]; at = at + 1; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 2 -> clear_book_message_record.security_id[clear_book_message_at] = wire[at]; at = at + 1; clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Clear Book Message is what was written, byte for byte */
inline equal_clear_book_message(clear_book_message_read, clear_book_message_written) {
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 8 -> assert(clear_book_message_read.timestamp[clear_book_message_at] == clear_book_message_written.timestamp[clear_book_message_at]); clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  clear_book_message_at = 0;
  do
  :: clear_book_message_at < 2 -> assert(clear_book_message_read.security_id[clear_book_message_at] == clear_book_message_written.security_id[clear_book_message_at]); clear_book_message_at = clear_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Common Header: encoded, read back, and compared */
proctype check_common_header() {
  CommonHeader common_header_sent;
  CommonHeader common_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_common_header(common_header_sent, 0)
  :: pattern == 1 -> fill_common_header(common_header_sent, 32)
  :: pattern == 2 -> fill_common_header(common_header_sent, 255)
  :: else -> ramp_common_header(common_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_common_header(common_header_sent);
    assert(at == 18);
    at = 0;
    decode_common_header(common_header_got);
    assert(at == 18);
    equal_common_header(common_header_got, common_header_sent)
  }
}

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
    assert(at == 6);
    at = 0;
    decode_sbe_header(sbe_header_got);
    assert(at == 6);
    equal_sbe_header(sbe_header_got, sbe_header_sent)
  }
}

/* Instrument Directory Message: encoded, read back, and compared */
proctype check_instrument_directory_message() {
  InstrumentDirectoryMessage instrument_directory_message_sent;
  InstrumentDirectoryMessage instrument_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_directory_message(instrument_directory_message_sent, 0)
  :: pattern == 1 -> fill_instrument_directory_message(instrument_directory_message_sent, 32)
  :: pattern == 2 -> fill_instrument_directory_message(instrument_directory_message_sent, 255)
  :: else -> ramp_instrument_directory_message(instrument_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_directory_message(instrument_directory_message_sent);
    assert(at == 35);
    at = 0;
    decode_instrument_directory_message(instrument_directory_message_got);
    assert(at == 35);
    equal_instrument_directory_message(instrument_directory_message_got, instrument_directory_message_sent)
  }
}

/* Reg Sho Restriction Message: encoded, read back, and compared */
proctype check_reg_sho_restriction_message() {
  RegShoRestrictionMessage reg_sho_restriction_message_sent;
  RegShoRestrictionMessage reg_sho_restriction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reg_sho_restriction_message(reg_sho_restriction_message_sent, 0)
  :: pattern == 1 -> fill_reg_sho_restriction_message(reg_sho_restriction_message_sent, 32)
  :: pattern == 2 -> fill_reg_sho_restriction_message(reg_sho_restriction_message_sent, 255)
  :: else -> ramp_reg_sho_restriction_message(reg_sho_restriction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reg_sho_restriction_message(reg_sho_restriction_message_sent);
    assert(at == 11);
    at = 0;
    decode_reg_sho_restriction_message(reg_sho_restriction_message_got);
    assert(at == 11);
    equal_reg_sho_restriction_message(reg_sho_restriction_message_got, reg_sho_restriction_message_sent)
  }
}

/* Security Trading Status Message: encoded, read back, and compared */
proctype check_security_trading_status_message() {
  SecurityTradingStatusMessage security_trading_status_message_sent;
  SecurityTradingStatusMessage security_trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_trading_status_message(security_trading_status_message_sent, 0)
  :: pattern == 1 -> fill_security_trading_status_message(security_trading_status_message_sent, 32)
  :: pattern == 2 -> fill_security_trading_status_message(security_trading_status_message_sent, 255)
  :: else -> ramp_security_trading_status_message(security_trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_trading_status_message(security_trading_status_message_sent);
    assert(at == 12);
    at = 0;
    decode_security_trading_status_message(security_trading_status_message_got);
    assert(at == 12);
    equal_security_trading_status_message(security_trading_status_message_got, security_trading_status_message_sent)
  }
}

/* Snapshot Complete Message: encoded, read back, and compared */
proctype check_snapshot_complete_message() {
  SnapshotCompleteMessage snapshot_complete_message_sent;
  SnapshotCompleteMessage snapshot_complete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_complete_message(snapshot_complete_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_complete_message(snapshot_complete_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_complete_message(snapshot_complete_message_sent, 255)
  :: else -> ramp_snapshot_complete_message(snapshot_complete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_complete_message(snapshot_complete_message_sent);
    assert(at == 16);
    at = 0;
    decode_snapshot_complete_message(snapshot_complete_message_got);
    assert(at == 16);
    equal_snapshot_complete_message(snapshot_complete_message_got, snapshot_complete_message_sent)
  }
}

/* Trading Session Status Message: encoded, read back, and compared */
proctype check_trading_session_status_message() {
  TradingSessionStatusMessage trading_session_status_message_sent;
  TradingSessionStatusMessage trading_session_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_session_status_message(trading_session_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_session_status_message(trading_session_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_session_status_message(trading_session_status_message_sent, 255)
  :: else -> ramp_trading_session_status_message(trading_session_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_session_status_message(trading_session_status_message_sent);
    assert(at == 9);
    at = 0;
    decode_trading_session_status_message(trading_session_status_message_got);
    assert(at == 9);
    equal_trading_session_status_message(trading_session_status_message_got, trading_session_status_message_sent)
  }
}

/* Best Bid Offer Message: encoded, read back, and compared */
proctype check_best_bid_offer_message() {
  BestBidOfferMessage best_bid_offer_message_sent;
  BestBidOfferMessage best_bid_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_bid_offer_message(best_bid_offer_message_sent, 0)
  :: pattern == 1 -> fill_best_bid_offer_message(best_bid_offer_message_sent, 32)
  :: pattern == 2 -> fill_best_bid_offer_message(best_bid_offer_message_sent, 255)
  :: else -> ramp_best_bid_offer_message(best_bid_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_bid_offer_message(best_bid_offer_message_sent);
    assert(at == 34);
    at = 0;
    decode_best_bid_offer_message(best_bid_offer_message_got);
    assert(at == 34);
    equal_best_bid_offer_message(best_bid_offer_message_got, best_bid_offer_message_sent)
  }
}

/* Best Bid Message: encoded, read back, and compared */
proctype check_best_bid_message() {
  BestBidMessage best_bid_message_sent;
  BestBidMessage best_bid_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_bid_message(best_bid_message_sent, 0)
  :: pattern == 1 -> fill_best_bid_message(best_bid_message_sent, 32)
  :: pattern == 2 -> fill_best_bid_message(best_bid_message_sent, 255)
  :: else -> ramp_best_bid_message(best_bid_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_bid_message(best_bid_message_sent);
    assert(at == 22);
    at = 0;
    decode_best_bid_message(best_bid_message_got);
    assert(at == 22);
    equal_best_bid_message(best_bid_message_got, best_bid_message_sent)
  }
}

/* Best Offer Message: encoded, read back, and compared */
proctype check_best_offer_message() {
  BestOfferMessage best_offer_message_sent;
  BestOfferMessage best_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_offer_message(best_offer_message_sent, 0)
  :: pattern == 1 -> fill_best_offer_message(best_offer_message_sent, 32)
  :: pattern == 2 -> fill_best_offer_message(best_offer_message_sent, 255)
  :: else -> ramp_best_offer_message(best_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_offer_message(best_offer_message_sent);
    assert(at == 22);
    at = 0;
    decode_best_offer_message(best_offer_message_got);
    assert(at == 22);
    equal_best_offer_message(best_offer_message_got, best_offer_message_sent)
  }
}

/* Best Bid Short Message: encoded, read back, and compared */
proctype check_best_bid_short_message() {
  BestBidShortMessage best_bid_short_message_sent;
  BestBidShortMessage best_bid_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_bid_short_message(best_bid_short_message_sent, 0)
  :: pattern == 1 -> fill_best_bid_short_message(best_bid_short_message_sent, 32)
  :: pattern == 2 -> fill_best_bid_short_message(best_bid_short_message_sent, 255)
  :: else -> ramp_best_bid_short_message(best_bid_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_bid_short_message(best_bid_short_message_sent);
    assert(at == 14);
    at = 0;
    decode_best_bid_short_message(best_bid_short_message_got);
    assert(at == 14);
    equal_best_bid_short_message(best_bid_short_message_got, best_bid_short_message_sent)
  }
}

/* Best Offer Short Message: encoded, read back, and compared */
proctype check_best_offer_short_message() {
  BestOfferShortMessage best_offer_short_message_sent;
  BestOfferShortMessage best_offer_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_offer_short_message(best_offer_short_message_sent, 0)
  :: pattern == 1 -> fill_best_offer_short_message(best_offer_short_message_sent, 32)
  :: pattern == 2 -> fill_best_offer_short_message(best_offer_short_message_sent, 255)
  :: else -> ramp_best_offer_short_message(best_offer_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_offer_short_message(best_offer_short_message_sent);
    assert(at == 14);
    at = 0;
    decode_best_offer_short_message(best_offer_short_message_got);
    assert(at == 14);
    equal_best_offer_short_message(best_offer_short_message_got, best_offer_short_message_sent)
  }
}

/* Clear Book Message: encoded, read back, and compared */
proctype check_clear_book_message() {
  ClearBookMessage clear_book_message_sent;
  ClearBookMessage clear_book_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clear_book_message(clear_book_message_sent, 0)
  :: pattern == 1 -> fill_clear_book_message(clear_book_message_sent, 32)
  :: pattern == 2 -> fill_clear_book_message(clear_book_message_sent, 255)
  :: else -> ramp_clear_book_message(clear_book_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clear_book_message(clear_book_message_sent);
    assert(at == 10);
    at = 0;
    decode_clear_book_message(clear_book_message_got);
    assert(at == 10);
    equal_clear_book_message(clear_book_message_got, clear_book_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_common_header()
  :: run check_sbe_header()
  :: run check_instrument_directory_message()
  :: run check_reg_sho_restriction_message()
  :: run check_security_trading_status_message()
  :: run check_snapshot_complete_message()
  :: run check_trading_session_status_message()
  :: run check_best_bid_offer_message()
  :: run check_best_bid_message()
  :: run check_best_offer_message()
  :: run check_best_bid_short_message()
  :: run check_best_offer_short_message()
  :: run check_clear_book_message()
  fi
}
