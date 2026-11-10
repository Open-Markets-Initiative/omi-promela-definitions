/*
 * Long-Term Stock Exchange Member Order Information Record Last Sale
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
 *   - a length prefix framing what follows
 *   - a block whose stated length holds more than its fields
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 50

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Common Header: 18 bytes ------------------------------------------------- */

/* Memx Udp Common Header */
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

/* ---- Trade Report Message: 34 bytes ------------------------------------------ */

/* TradeReportMessage */
typedef TradeReportMessage {
  byte timestamp[8];
  byte security_id[2];
  byte trade_id[8];
  byte trade_qty[4];
  byte trade_price[8];
  byte sale_condition_1;
  byte sale_condition_2;
  byte sale_condition_3;
  byte sale_condition_4
};

int trade_report_message_at;

/* every byte of Trade Report Message set to one value */
inline fill_trade_report_message(trade_report_message_record, trade_report_message_value) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.timestamp[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.security_id[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_id[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_qty[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_price[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.sale_condition_1 = trade_report_message_value;
  trade_report_message_record.sale_condition_2 = trade_report_message_value;
  trade_report_message_record.sale_condition_3 = trade_report_message_value;
  trade_report_message_record.sale_condition_4 = trade_report_message_value;
  skip
}

/* each byte of Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_message(trade_report_message_record, trade_report_message_base) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.timestamp[trade_report_message_at] = (trade_report_message_base + 0 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.security_id[trade_report_message_at] = (trade_report_message_base + 8 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_id[trade_report_message_at] = (trade_report_message_base + 10 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_qty[trade_report_message_at] = (trade_report_message_base + 18 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_price[trade_report_message_at] = (trade_report_message_base + 22 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.sale_condition_1 = (trade_report_message_base + 30 + 1) % 256;
  trade_report_message_record.sale_condition_2 = (trade_report_message_base + 31 + 1) % 256;
  trade_report_message_record.sale_condition_3 = (trade_report_message_base + 32 + 1) % 256;
  trade_report_message_record.sale_condition_4 = (trade_report_message_base + 33 + 1) % 256;
  skip
}

/* Trade Report Message to the wire, 34 bytes from where the cursor stands */
inline encode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.timestamp[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> wire[at] = trade_report_message_record.security_id[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.trade_id[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.trade_qty[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.trade_price[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_record.sale_condition_1; at = at + 1;
  wire[at] = trade_report_message_record.sale_condition_2; at = at + 1;
  wire[at] = trade_report_message_record.sale_condition_3; at = at + 1;
  wire[at] = trade_report_message_record.sale_condition_4; at = at + 1;
  skip
}

/* Trade Report Message off the wire, 34 bytes from where the cursor stands */
inline decode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.timestamp[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.security_id[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_id[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_qty[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_price[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.sale_condition_1 = wire[at]; at = at + 1;
  trade_report_message_record.sale_condition_2 = wire[at]; at = at + 1;
  trade_report_message_record.sale_condition_3 = wire[at]; at = at + 1;
  trade_report_message_record.sale_condition_4 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Report Message is what was written, byte for byte */
inline equal_trade_report_message(trade_report_message_read, trade_report_message_written) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.timestamp[trade_report_message_at] == trade_report_message_written.timestamp[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> assert(trade_report_message_read.security_id[trade_report_message_at] == trade_report_message_written.security_id[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.trade_id[trade_report_message_at] == trade_report_message_written.trade_id[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.trade_qty[trade_report_message_at] == trade_report_message_written.trade_qty[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.trade_price[trade_report_message_at] == trade_report_message_written.trade_price[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_read.sale_condition_1 == trade_report_message_written.sale_condition_1);
  assert(trade_report_message_read.sale_condition_2 == trade_report_message_written.sale_condition_2);
  assert(trade_report_message_read.sale_condition_3 == trade_report_message_written.sale_condition_3);
  assert(trade_report_message_read.sale_condition_4 == trade_report_message_written.sale_condition_4);
  skip
}

/* ---- Trade Cancel Message: 34 bytes ------------------------------------------ */

/* TradeCancelMessage */
typedef TradeCancelMessage {
  byte timestamp[8];
  byte security_id[2];
  byte trade_id[8];
  byte trade_qty[4];
  byte last_price[8];
  byte sale_condition_1;
  byte sale_condition_2;
  byte sale_condition_3;
  byte sale_condition_4
};

int trade_cancel_message_at;

/* every byte of Trade Cancel Message set to one value */
inline fill_trade_cancel_message(trade_cancel_message_record, trade_cancel_message_value) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.timestamp[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 2 -> trade_cancel_message_record.security_id[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_qty[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.last_price[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.sale_condition_1 = trade_cancel_message_value;
  trade_cancel_message_record.sale_condition_2 = trade_cancel_message_value;
  trade_cancel_message_record.sale_condition_3 = trade_cancel_message_value;
  trade_cancel_message_record.sale_condition_4 = trade_cancel_message_value;
  skip
}

/* each byte of Trade Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_message(trade_cancel_message_record, trade_cancel_message_base) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.timestamp[trade_cancel_message_at] = (trade_cancel_message_base + 0 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 2 -> trade_cancel_message_record.security_id[trade_cancel_message_at] = (trade_cancel_message_base + 8 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = (trade_cancel_message_base + 10 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_qty[trade_cancel_message_at] = (trade_cancel_message_base + 18 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.last_price[trade_cancel_message_at] = (trade_cancel_message_base + 22 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.sale_condition_1 = (trade_cancel_message_base + 30 + 1) % 256;
  trade_cancel_message_record.sale_condition_2 = (trade_cancel_message_base + 31 + 1) % 256;
  trade_cancel_message_record.sale_condition_3 = (trade_cancel_message_base + 32 + 1) % 256;
  trade_cancel_message_record.sale_condition_4 = (trade_cancel_message_base + 33 + 1) % 256;
  skip
}

/* Trade Cancel Message to the wire, 34 bytes from where the cursor stands */
inline encode_trade_cancel_message(trade_cancel_message_record) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> wire[at] = trade_cancel_message_record.timestamp[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 2 -> wire[at] = trade_cancel_message_record.security_id[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> wire[at] = trade_cancel_message_record.trade_id[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.trade_qty[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> wire[at] = trade_cancel_message_record.last_price[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_message_record.sale_condition_1; at = at + 1;
  wire[at] = trade_cancel_message_record.sale_condition_2; at = at + 1;
  wire[at] = trade_cancel_message_record.sale_condition_3; at = at + 1;
  wire[at] = trade_cancel_message_record.sale_condition_4; at = at + 1;
  skip
}

/* Trade Cancel Message off the wire, 34 bytes from where the cursor stands */
inline decode_trade_cancel_message(trade_cancel_message_record) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.timestamp[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 2 -> trade_cancel_message_record.security_id[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_qty[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.last_price[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.sale_condition_1 = wire[at]; at = at + 1;
  trade_cancel_message_record.sale_condition_2 = wire[at]; at = at + 1;
  trade_cancel_message_record.sale_condition_3 = wire[at]; at = at + 1;
  trade_cancel_message_record.sale_condition_4 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Cancel Message is what was written, byte for byte */
inline equal_trade_cancel_message(trade_cancel_message_read, trade_cancel_message_written) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> assert(trade_cancel_message_read.timestamp[trade_cancel_message_at] == trade_cancel_message_written.timestamp[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 2 -> assert(trade_cancel_message_read.security_id[trade_cancel_message_at] == trade_cancel_message_written.security_id[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> assert(trade_cancel_message_read.trade_id[trade_cancel_message_at] == trade_cancel_message_written.trade_id[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.trade_qty[trade_cancel_message_at] == trade_cancel_message_written.trade_qty[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> assert(trade_cancel_message_read.last_price[trade_cancel_message_at] == trade_cancel_message_written.last_price[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_message_read.sale_condition_1 == trade_cancel_message_written.sale_condition_1);
  assert(trade_cancel_message_read.sale_condition_2 == trade_cancel_message_written.sale_condition_2);
  assert(trade_cancel_message_read.sale_condition_3 == trade_cancel_message_written.sale_condition_3);
  assert(trade_cancel_message_read.sale_condition_4 == trade_cancel_message_written.sale_condition_4);
  skip
}

/* ---- Trade Correct Message: 50 bytes ----------------------------------------- */

/* TradeCorrectMessage */
typedef TradeCorrectMessage {
  byte timestamp[8];
  byte security_id[2];
  byte trade_id[8];
  byte original_trade_qty[4];
  byte original_trade_price[8];
  byte original_sale_condition_1;
  byte original_sale_condition_2;
  byte original_sale_condition_3;
  byte original_sale_condition_4;
  byte corrected_trade_qty[4];
  byte corrected_trade_price[8];
  byte corrected_sale_condition_1;
  byte corrected_sale_condition_2;
  byte corrected_sale_condition_3;
  byte corrected_sale_condition_4
};

int trade_correct_message_at;

/* every byte of Trade Correct Message set to one value */
inline fill_trade_correct_message(trade_correct_message_record, trade_correct_message_value) {
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> trade_correct_message_record.timestamp[trade_correct_message_at] = trade_correct_message_value; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 2 -> trade_correct_message_record.security_id[trade_correct_message_at] = trade_correct_message_value; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> trade_correct_message_record.trade_id[trade_correct_message_at] = trade_correct_message_value; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 4 -> trade_correct_message_record.original_trade_qty[trade_correct_message_at] = trade_correct_message_value; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> trade_correct_message_record.original_trade_price[trade_correct_message_at] = trade_correct_message_value; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_record.original_sale_condition_1 = trade_correct_message_value;
  trade_correct_message_record.original_sale_condition_2 = trade_correct_message_value;
  trade_correct_message_record.original_sale_condition_3 = trade_correct_message_value;
  trade_correct_message_record.original_sale_condition_4 = trade_correct_message_value;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 4 -> trade_correct_message_record.corrected_trade_qty[trade_correct_message_at] = trade_correct_message_value; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> trade_correct_message_record.corrected_trade_price[trade_correct_message_at] = trade_correct_message_value; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_record.corrected_sale_condition_1 = trade_correct_message_value;
  trade_correct_message_record.corrected_sale_condition_2 = trade_correct_message_value;
  trade_correct_message_record.corrected_sale_condition_3 = trade_correct_message_value;
  trade_correct_message_record.corrected_sale_condition_4 = trade_correct_message_value;
  skip
}

/* each byte of Trade Correct Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correct_message(trade_correct_message_record, trade_correct_message_base) {
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> trade_correct_message_record.timestamp[trade_correct_message_at] = (trade_correct_message_base + 0 + trade_correct_message_at + 1) % 256; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 2 -> trade_correct_message_record.security_id[trade_correct_message_at] = (trade_correct_message_base + 8 + trade_correct_message_at + 1) % 256; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> trade_correct_message_record.trade_id[trade_correct_message_at] = (trade_correct_message_base + 10 + trade_correct_message_at + 1) % 256; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 4 -> trade_correct_message_record.original_trade_qty[trade_correct_message_at] = (trade_correct_message_base + 18 + trade_correct_message_at + 1) % 256; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> trade_correct_message_record.original_trade_price[trade_correct_message_at] = (trade_correct_message_base + 22 + trade_correct_message_at + 1) % 256; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_record.original_sale_condition_1 = (trade_correct_message_base + 30 + 1) % 256;
  trade_correct_message_record.original_sale_condition_2 = (trade_correct_message_base + 31 + 1) % 256;
  trade_correct_message_record.original_sale_condition_3 = (trade_correct_message_base + 32 + 1) % 256;
  trade_correct_message_record.original_sale_condition_4 = (trade_correct_message_base + 33 + 1) % 256;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 4 -> trade_correct_message_record.corrected_trade_qty[trade_correct_message_at] = (trade_correct_message_base + 34 + trade_correct_message_at + 1) % 256; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> trade_correct_message_record.corrected_trade_price[trade_correct_message_at] = (trade_correct_message_base + 38 + trade_correct_message_at + 1) % 256; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_record.corrected_sale_condition_1 = (trade_correct_message_base + 46 + 1) % 256;
  trade_correct_message_record.corrected_sale_condition_2 = (trade_correct_message_base + 47 + 1) % 256;
  trade_correct_message_record.corrected_sale_condition_3 = (trade_correct_message_base + 48 + 1) % 256;
  trade_correct_message_record.corrected_sale_condition_4 = (trade_correct_message_base + 49 + 1) % 256;
  skip
}

/* Trade Correct Message to the wire, 50 bytes from where the cursor stands */
inline encode_trade_correct_message(trade_correct_message_record) {
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> wire[at] = trade_correct_message_record.timestamp[trade_correct_message_at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 2 -> wire[at] = trade_correct_message_record.security_id[trade_correct_message_at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> wire[at] = trade_correct_message_record.trade_id[trade_correct_message_at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 4 -> wire[at] = trade_correct_message_record.original_trade_qty[trade_correct_message_at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> wire[at] = trade_correct_message_record.original_trade_price[trade_correct_message_at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correct_message_record.original_sale_condition_1; at = at + 1;
  wire[at] = trade_correct_message_record.original_sale_condition_2; at = at + 1;
  wire[at] = trade_correct_message_record.original_sale_condition_3; at = at + 1;
  wire[at] = trade_correct_message_record.original_sale_condition_4; at = at + 1;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 4 -> wire[at] = trade_correct_message_record.corrected_trade_qty[trade_correct_message_at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> wire[at] = trade_correct_message_record.corrected_trade_price[trade_correct_message_at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correct_message_record.corrected_sale_condition_1; at = at + 1;
  wire[at] = trade_correct_message_record.corrected_sale_condition_2; at = at + 1;
  wire[at] = trade_correct_message_record.corrected_sale_condition_3; at = at + 1;
  wire[at] = trade_correct_message_record.corrected_sale_condition_4; at = at + 1;
  skip
}

/* Trade Correct Message off the wire, 50 bytes from where the cursor stands */
inline decode_trade_correct_message(trade_correct_message_record) {
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> trade_correct_message_record.timestamp[trade_correct_message_at] = wire[at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 2 -> trade_correct_message_record.security_id[trade_correct_message_at] = wire[at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> trade_correct_message_record.trade_id[trade_correct_message_at] = wire[at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 4 -> trade_correct_message_record.original_trade_qty[trade_correct_message_at] = wire[at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> trade_correct_message_record.original_trade_price[trade_correct_message_at] = wire[at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_record.original_sale_condition_1 = wire[at]; at = at + 1;
  trade_correct_message_record.original_sale_condition_2 = wire[at]; at = at + 1;
  trade_correct_message_record.original_sale_condition_3 = wire[at]; at = at + 1;
  trade_correct_message_record.original_sale_condition_4 = wire[at]; at = at + 1;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 4 -> trade_correct_message_record.corrected_trade_qty[trade_correct_message_at] = wire[at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> trade_correct_message_record.corrected_trade_price[trade_correct_message_at] = wire[at]; at = at + 1; trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_record.corrected_sale_condition_1 = wire[at]; at = at + 1;
  trade_correct_message_record.corrected_sale_condition_2 = wire[at]; at = at + 1;
  trade_correct_message_record.corrected_sale_condition_3 = wire[at]; at = at + 1;
  trade_correct_message_record.corrected_sale_condition_4 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Correct Message is what was written, byte for byte */
inline equal_trade_correct_message(trade_correct_message_read, trade_correct_message_written) {
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> assert(trade_correct_message_read.timestamp[trade_correct_message_at] == trade_correct_message_written.timestamp[trade_correct_message_at]); trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 2 -> assert(trade_correct_message_read.security_id[trade_correct_message_at] == trade_correct_message_written.security_id[trade_correct_message_at]); trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> assert(trade_correct_message_read.trade_id[trade_correct_message_at] == trade_correct_message_written.trade_id[trade_correct_message_at]); trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 4 -> assert(trade_correct_message_read.original_trade_qty[trade_correct_message_at] == trade_correct_message_written.original_trade_qty[trade_correct_message_at]); trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> assert(trade_correct_message_read.original_trade_price[trade_correct_message_at] == trade_correct_message_written.original_trade_price[trade_correct_message_at]); trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  assert(trade_correct_message_read.original_sale_condition_1 == trade_correct_message_written.original_sale_condition_1);
  assert(trade_correct_message_read.original_sale_condition_2 == trade_correct_message_written.original_sale_condition_2);
  assert(trade_correct_message_read.original_sale_condition_3 == trade_correct_message_written.original_sale_condition_3);
  assert(trade_correct_message_read.original_sale_condition_4 == trade_correct_message_written.original_sale_condition_4);
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 4 -> assert(trade_correct_message_read.corrected_trade_qty[trade_correct_message_at] == trade_correct_message_written.corrected_trade_qty[trade_correct_message_at]); trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  trade_correct_message_at = 0;
  do
  :: trade_correct_message_at < 8 -> assert(trade_correct_message_read.corrected_trade_price[trade_correct_message_at] == trade_correct_message_written.corrected_trade_price[trade_correct_message_at]); trade_correct_message_at = trade_correct_message_at + 1
  :: else -> break
  od;
  assert(trade_correct_message_read.corrected_sale_condition_1 == trade_correct_message_written.corrected_sale_condition_1);
  assert(trade_correct_message_read.corrected_sale_condition_2 == trade_correct_message_written.corrected_sale_condition_2);
  assert(trade_correct_message_read.corrected_sale_condition_3 == trade_correct_message_written.corrected_sale_condition_3);
  assert(trade_correct_message_read.corrected_sale_condition_4 == trade_correct_message_written.corrected_sale_condition_4);
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

/* Trade Report Message: encoded, read back, and compared */
proctype check_trade_report_message() {
  TradeReportMessage trade_report_message_sent;
  TradeReportMessage trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_report_message(trade_report_message_sent, 0)
  :: pattern == 1 -> fill_trade_report_message(trade_report_message_sent, 32)
  :: pattern == 2 -> fill_trade_report_message(trade_report_message_sent, 255)
  :: else -> ramp_trade_report_message(trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_report_message(trade_report_message_sent);
    assert(at == 34);
    at = 0;
    decode_trade_report_message(trade_report_message_got);
    assert(at == 34);
    equal_trade_report_message(trade_report_message_got, trade_report_message_sent)
  }
}

/* Trade Cancel Message: encoded, read back, and compared */
proctype check_trade_cancel_message() {
  TradeCancelMessage trade_cancel_message_sent;
  TradeCancelMessage trade_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_message(trade_cancel_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_message(trade_cancel_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_message(trade_cancel_message_sent, 255)
  :: else -> ramp_trade_cancel_message(trade_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_message(trade_cancel_message_sent);
    assert(at == 34);
    at = 0;
    decode_trade_cancel_message(trade_cancel_message_got);
    assert(at == 34);
    equal_trade_cancel_message(trade_cancel_message_got, trade_cancel_message_sent)
  }
}

/* Trade Correct Message: encoded, read back, and compared */
proctype check_trade_correct_message() {
  TradeCorrectMessage trade_correct_message_sent;
  TradeCorrectMessage trade_correct_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_correct_message(trade_correct_message_sent, 0)
  :: pattern == 1 -> fill_trade_correct_message(trade_correct_message_sent, 32)
  :: pattern == 2 -> fill_trade_correct_message(trade_correct_message_sent, 255)
  :: else -> ramp_trade_correct_message(trade_correct_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_correct_message(trade_correct_message_sent);
    assert(at == 50);
    at = 0;
    decode_trade_correct_message(trade_correct_message_got);
    assert(at == 50);
    equal_trade_correct_message(trade_correct_message_got, trade_correct_message_sent)
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
  :: run check_trading_session_status_message()
  :: run check_trade_report_message()
  :: run check_trade_cancel_message()
  :: run check_trade_correct_message()
  fi
}
