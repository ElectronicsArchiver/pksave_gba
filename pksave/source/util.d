module util;

import std.utf;
import std.string;
import std.array;
import libspec;

wchar[] decode_gba_text(ubyte[] gba_text) {
    auto text_len = gba_text.length;
    ushort[] decoded_buf;
    decoded_buf.length = text_len; // allocate space in buffer
    gba_text_to_ucs2(cast(ushort*) decoded_buf, cast(ubyte*) gba_text, text_len);

    return cast(wchar[]) decoded_buf;
}

string gba_time_to_string(gba_time_t time) {
    return format("%02d:%02d:%02d (%d)", time.hours, time.minutes, time.seconds, time.frames);
}

string format_hex(ubyte[] data) {
    auto sb = appender!string;
    foreach (ch; data) {
        sb ~= format(" %02X", ch);
    }
    return sb[];
}