rule EXT_EXPL_ZTH_LNK_EXPLOIT_A
{
    meta:
        author = "Peter Girnus"
        description = "This YARA file detects padded LNK files designed to exploit ZDI-CAN-25373."
        reference = "https://www.trendmicro.com/en_us/research/25/c/windows-shortcut-zero-day-exploit.html"
        date = "2025-03-18"
        score = 80
        id = "14788504-64e3-533b-ad21-00a3462a33cc"
    strings:
        $spoof_a = {20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00 20 00}
        $spoof_b = {09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00 09 00}
        $spoof_c = {0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00}
        $spoof_d = {0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00 0D 00}
        $spoof_e = {11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00 11 00}
        $spoof_f = {12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00 12 00}
        $spoof_g = {13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00 13 00}
        $spoof_h = {0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00 0D 00 0A 00}
    
    condition:
        uint32(0) == 0x4C and uint32(4) == 0x21401
        and any of ($spoof_*)
}