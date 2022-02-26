struct ANSICode
    open::String
    close::String
end

"""
    ANSICode(color; bg::Bool=false)

Given an AbstractColor, create the appropriate ANSI tag, 
for both foreground and background colors.
"""
function ANSICode(color; bg::Bool=false)
    ctype = split(string(typeof(color)), ".")[end]

    if ctype == "NamedColor"
        Δ = bg ? 40 : 30
        v = CODES[color.color]
        return ANSICode("\e[$(Δ + v)m", "\e[$(Δ+9)m")
    elseif ctype == "BitColor"
        Δ = bg ? 48 : 38
        v = CODES_16BIT_COLORS[color.color]
        return ANSICode("\e[$Δ;5;$(v)m", "\e[$(Δ+1)m")
    elseif ctype == "RGBColor"
        Δ = bg ? 48 : 38
        rgb = "$(color.r);$(color.g);$(color.b)"
        return ANSICode("\e[$Δ;2;$(rgb)m", "\e[$(Δ+1)m")
    end
end

reset_code(code::ANSICode) = ANSICode(code.close, code.close)


const CODES = Dict(
    :default =>  ANSICode("\e[22m", "\e[22m"),    
    :bold =>  ANSICode("\e[1m", "\e[22m"),
    :b =>  ANSICode("\e[1m", "\e[22m"),
    :dim => ANSICode("\e[2m", "\e[22m"),
    :italic => ANSICode("\e[3m", "\e[23m"),
    :i => ANSICode("\e[3m", "\e[23m"),
    :underline => ANSICode("\e[4m", "\e[24m"),
    :u => ANSICode("\e[4m", "\e[24m"),
    :blink => ANSICode("\e[5m", "\e[25m"),
    :inverse => ANSICode("\e[7m", "\e[27m"),
    :hidden => ANSICode("\e[8m", "\e[28m"),
    :striked => ANSICode("\e[9m", "\e[29m"),

    "black"=> 0,
    "red"=> 1,
    "green"=> 2,
    "yellow"=> 3,
    "blue"=> 4,
    "magenta"=> 5,
    "cyan"=> 6,
    "white"=> 7,
    "default"=>9,
)

const CODES_16BIT_COLORS = Dict(
    "bright_black"=> 8,
    "bright_red"=> 9,
    "bright_green"=> 10,
    "bright_yellow"=> 11,
    "bright_blue"=> 12,
    "bright_magenta"=> 13,
    "bright_cyan"=> 14,
    "bright_white"=> 15,
    "grey0"=> 16,
    "navy_blue"=> 17,
    "dark_blue"=> 18,
    "blue3"=> 20,
    "blue1"=> 21,
    "dark_green"=> 22,
    "deep_sky_blue4"=> 25,
    "dodger_blue3"=> 26,
    "dodger_blue2"=> 27,
    "green4"=> 28,
    "spring_green4"=> 29,
    "turquoise4"=> 30,
    "deep_sky_blue3"=> 32,
    "dodger_blue1"=> 33,
    "green3"=> 40,
    "spring_green3"=> 41,
    "dark_cyan"=> 36,
    "light_sea_green"=> 37,
    "deep_sky_blue2"=> 38,
    "deep_sky_blue1"=> 39,
    "spring_green2"=> 47,
    "cyan3"=> 43,
    "dark_turquoise"=> 44,
    "turquoise2"=> 45,
    "green1"=> 46,
    "spring_green1"=> 48,
    "medium_spring_green"=> 49,
    "cyan2"=> 50,
    "cyan1"=> 51,
    "dark_red"=> 88,
    "deep_pink4"=> 125,
    "purple4"=> 55,
    "purple3"=> 56,
    "blue_violet"=> 57,
    "orange4"=> 94,
    "grey37"=> 59,
    "gray37"=> 59,
    "medium_purple4"=> 60,
    "slate_blue3"=> 62,
    "royal_blue1"=> 63,
    "chartreuse4"=> 64,
    "dark_sea_green4"=> 71,
    "pale_turquoise4"=> 66,
    "steel_blue"=> 67,
    "steel_blue3"=> 68,
    "cornflower_blue"=> 69,
    "chartreuse3"=> 76,
    "cadet_blue"=> 73,
    "sky_blue3"=> 74,
    "steel_blue1"=> 81,
    "pale_green3"=> 114,
    "sea_green3"=> 78,
    "aquamarine3"=> 79,
    "medium_turquoise"=> 80,
    "chartreuse2"=> 112,
    "sea_green2"=> 83,
    "sea_green1"=> 85,
    "aquamarine1"=> 122,
    "dark_slate_gray2"=> 87,
    "dark_magenta"=> 91,
    "dark_violet"=> 128,
    "purple"=> 129,
    "light_pink4"=> 95,
    "plum4"=> 96,
    "medium_purple3"=> 98,
    "slate_blue1"=> 99,
    "yellow4"=> 106,
    "wheat4"=> 101,
    "grey53"=> 102,
    "gray53"=> 102,
    "light_slate_grey"=> 103,
    "light_slate_gray"=> 103,
    "medium_purple"=> 104,
    "light_slate_blue"=> 105,
    "dark_olive_green3"=> 149,
    "dark_sea_green"=> 108,
    "light_sky_blue3"=> 110,
    "sky_blue2"=> 111,
    "dark_sea_green3"=> 150,
    "dark_slate_gray3"=> 116,
    "sky_blue1"=> 117,
    "chartreuse1"=> 118,
    "light_green"=> 120,
    "pale_green1"=> 156,
    "dark_slate_gray1"=> 123,
    "red3"=> 160,
    "medium_violet_red"=> 126,
    "magenta3"=> 164,
    "dark_orange3"=> 166,
    "indian_red"=> 167,
    "hot_pink3"=> 168,
    "medium_orchid3"=> 133,
    "medium_orchid"=> 134,
    "medium_purple2"=> 140,
    "dark_goldenrod"=> 136,
    "light_salmon3"=> 173,
    "rosy_brown"=> 138,
    "grey63"=> 139,
    "gray63"=> 139,
    "medium_purple1"=> 141,
    "gold3"=> 178,
    "dark_khaki"=> 143,
    "navajo_white3"=> 144,
    "grey69"=> 145,
    "gray69"=> 145,
    "light_steel_blue3"=> 146,
    "light_steel_blue"=> 147,
    "yellow3"=> 184,
    "dark_sea_green2"=> 157,
    "light_cyan3"=> 152,
    "light_sky_blue1"=> 153,
    "green_yellow"=> 154,
    "dark_olive_green2"=> 155,
    "dark_sea_green1"=> 193,
    "pale_turquoise1"=> 159,
    "deep_pink3"=> 162,
    "magenta2"=> 200,
    "hot_pink2"=> 169,
    "orchid"=> 170,
    "medium_orchid1"=> 207,
    "orange3"=> 172,
    "light_pink3"=> 174,
    "pink3"=> 175,
    "plum3"=> 176,
    "violet"=> 177,
    "light_goldenrod3"=> 179,
    "tan"=> 180,
    "misty_rose3"=> 181,
    "thistle3"=> 182,
    "plum2"=> 183,
    "khaki3"=> 185,
    "light_goldenrod2"=> 222,
    "light_yellow3"=> 187,
    "grey84"=> 188,
    "gray84"=> 188,
    "light_steel_blue1"=> 189,
    "yellow2"=> 190,
    "dark_olive_green1"=> 192,
    "honeydew2"=> 194,
    "light_cyan1"=> 195,
    "red1"=> 196,
    "deep_pink2"=> 197,
    "deep_pink1"=> 199,
    "magenta1"=> 201,
    "orange_red1"=> 202,
    "indian_red1"=> 204,
    "hot_pink"=> 206,
    "dark_orange"=> 208,
    "salmon1"=> 209,
    "light_coral"=> 210,
    "pale_violet_red1"=> 211,
    "orchid2"=> 212,
    "orchid1"=> 213,
    "orange1"=> 214,
    "sandy_brown"=> 215,
    "light_salmon1"=> 216,
    "light_pink1"=> 217,
    "pink1"=> 218,
    "plum1"=> 219,
    "gold1"=> 220,
    "navajo_white1"=> 223,
    "misty_rose1"=> 224,
    "thistle1"=> 225,
    "yellow1"=> 226,
    "light_goldenrod1"=> 227,
    "khaki1"=> 228,
    "wheat1"=> 229,
    "cornsilk1"=> 230,
    "grey100"=> 231,
    "gray100"=> 231,
    "grey3"=> 232,
    "gray3"=> 232,
    "grey7"=> 233,
    "gray7"=> 233,
    "grey11"=> 234,
    "gray11"=> 234,
    "grey15"=> 235,
    "gray15"=> 235,
    "grey19"=> 236,
    "gray19"=> 236,
    "grey23"=> 237,
    "gray23"=> 237,
    "grey27"=> 238,
    "gray27"=> 238,
    "grey30"=> 239,
    "gray30"=> 239,
    "grey35"=> 240,
    "gray35"=> 240,
    "grey39"=> 241,
    "gray39"=> 241,
    "grey42"=> 242,
    "gray42"=> 242,
    "grey46"=> 243,
    "gray46"=> 243,
    "grey50"=> 244,
    "gray50"=> 244,
    "grey54"=> 245,
    "gray54"=> 245,
    "grey58"=> 246,
    "gray58"=> 246,
    "grey62"=> 247,
    "gray62"=> 247,
    "grey66"=> 248,
    "gray66"=> 248,
    "grey70"=> 249,
    "gray70"=> 249,
    "grey74"=> 250,
    "gray74"=> 250,
    "grey78"=> 251,
    "gray78"=> 251,
    "grey82"=> 252,
    "gray82"=> 252,
    "grey85"=> 253,
    "gray85"=> 253,
    "grey89"=> 254,
    "gray89"=> 254,
    "grey93"=> 255,
    "gray93"=> 255,
)


# ---------------------------------------------------------------------------- #
#                                    COLORS                                    #
# ---------------------------------------------------------------------------- #
const NAMED_COLORS = [
    "default",
    "black",
    "red",
    "green",
    "yellow",
    "blue",
    "magenta",
    "cyan",
    "white",
]

const COLORS_16b = vcat([
    "bright_black",
    "bright_red",
    "bright_green",
    "bright_yellow",
    "bright_blue",
    "bright_magenta",
    "bright_cyan",
    "bright_white",
    "grey0",
    "navy_blue",
    "dark_blue",
    "blue3",
    "blue1",
    "dark_green",
    "deep_sky_blue4",
    "dodger_blue3",
    "dodger_blue2",
    "green4",
    "spring_green4",
    "turquoise4",
    "deep_sky_blue3",
    "dodger_blue1",
    "green3",
    "spring_green3",
    "dark_cyan",
    "light_sea_green",
    "deep_sky_blue2",
    "deep_sky_blue1",
    "spring_green2",
    "cyan3",
    "dark_turquoise",
    "turquoise2",
    "green1",
    "spring_green1",
    "medium_spring_green",
    "cyan2",
    "cyan1",
    "dark_red",
    "deep_pink4",
    "purple4",
    "purple3",
    "blue_violet",
    "orange4",
    "grey37",
    "gray37",
    "medium_purple4",
    "slate_blue3",
    "royal_blue1",
    "chartreuse4",
    "dark_sea_green4",
    "pale_turquoise4",
    "steel_blue",
    "steel_blue3",
    "cornflower_blue",
    "chartreuse3",
    "cadet_blue",
    "sky_blue3",
    "steel_blue1",
    "pale_green3",
    "sea_green3",
    "aquamarine3",
    "medium_turquoise",
    "chartreuse2",
    "sea_green2",
    "sea_green1",
    "aquamarine1",
    "dark_slate_gray2",
    "dark_magenta",
    "dark_violet",
    "purple",
    "light_pink4",
    "plum4",
    "medium_purple3",
    "slate_blue1",
    "yellow4",
    "wheat4",
    "grey53",
    "gray53",
    "light_slate_grey",
    "light_slate_gray",
    "medium_purple",
    "light_slate_blue",
    "dark_olive_green3",
    "dark_sea_green",
    "light_sky_blue3",
    "sky_blue2",
    "dark_sea_green3",
    "dark_slate_gray3",
    "sky_blue1",
    "chartreuse1",
    "light_green",
    "pale_green1",
    "dark_slate_gray1",
    "red3",
    "medium_violet_red",
    "magenta3",
    "dark_orange3",
    "indian_red",
    "hot_pink3",
    "medium_orchid3",
    "medium_orchid",
    "medium_purple2",
    "dark_goldenrod",
    "light_salmon3",
    "rosy_brown",
    "grey63",
    "gray63",
    "medium_purple1",
    "gold3",
    "dark_khaki",
    "navajo_white3",
    "grey69",
    "gray69",
    "light_steel_blue3",
    "light_steel_blue",
    "yellow3",
    "dark_sea_green2",
    "light_cyan3",
    "light_sky_blue1",
    "green_yellow",
    "dark_olive_green2",
    "dark_sea_green1",
    "pale_turquoise1",
    "deep_pink3",
    "magenta2",
    "hot_pink2",
    "orchid",
    "medium_orchid1",
    "orange3",
    "light_pink3",
    "pink3",
    "plum3",
    "violet",
    "light_goldenrod3",
    "tan",
    "misty_rose3",
    "thistle3",
    "plum2",
    "khaki3",
    "light_goldenrod2",
    "light_yellow3",
    "grey84",
    "gray84",
    "light_steel_blue1",
    "yellow2",
    "dark_olive_green1",
    "honeydew2",
    "light_cyan1",
    "red1",
    "deep_pink2",
    "deep_pink1",
    "magenta1",
    "orange_red1",
    "indian_red1",
    "hot_pink",
    "dark_orange",
    "salmon1",
    "light_coral",
    "pale_violet_red1",
    "orchid2",
    "orchid1",
    "orange1",
    "sandy_brown",
    "light_salmon1",
    "light_pink1",
    "pink1",
    "plum1",
    "gold1",
    "navajo_white1",
    "misty_rose1",
    "thistle1",
    "yellow1",
    "light_goldenrod1",
    "khaki1",
    "wheat1",
    "cornsilk1",
    "grey100",
    "gray100",
    "grey3",
    "gray3",
    "grey7",
    "gray7",
    "grey11",
    "gray11",
    "grey15",
    "gray15",
    "grey19",
    "gray19",
    "grey23",
    "gray23",
    "grey27",
    "gray27",
    "grey30",
    "gray30",
    "grey35",
    "gray35",
    "grey39",
    "gray39",
    "grey42",
    "gray42",
    "grey46",
    "gray46",
    "grey50",
    "gray50",
    "grey54",
    "gray54",
    "grey58",
    "gray58",
    "grey62",
    "gray62",
    "grey66",
    "gray66",
    "grey70",
    "gray70",
    "grey74",
    "gray74",
    "grey78",
    "gray78",
    "grey82",
    "gray82",
    "grey85",
    "gray85",
    "grey89",
    "gray89",
    "grey93",
    "gray93",
],
[string(i) for i in 1:255]
)

# ---------------------------------------------------------------------------- #
#                                     MODES                                    #
# ---------------------------------------------------------------------------- #
const NAMED_MODES = [
    "default",
    "bold",
    "b",
    "dim",
    "italic",
    "i",
    "underline",
    "u",
    "blink",
    "inverse",
    "hidden",
    "striked",
]