
const PumpkinBulb = {
    SHAPE_VERSION: 1.1,

    width: 76,
    height: 70,

    colors:
        [ "None", "black", "white",
          "BRIGHT", "NORMAL", "DARK" ],

    colorsIndex:
        [ " ", ".", ";", "#", "@", "+" ],

    bitmap: [
        "                                                                            ",
        "                                                                            ",
        "                                       ..                                   ",
        "                                      ....                                  ",
        "                                     ......                                 ",
        "                                     .....                                  ",
        "                                     ....                                   ",
        "                                      ...                                   ",
        "                                      ...                                   ",
        "                  .......            ....                                   ",
        "              ..................   .......   .............                  ",
        "            ....++++++++++++++++........... ..++++++++++++..                ",
        "           ..+++++++++++++++++++....@@@.....++++++++++++++++.               ",
        "         ..+++++++++++++++++++####@@@@@@.....++++++++++++++++.              ",
        "        ..+++++++++++++++++######@@@@@@@@@##.+++++++++++++++++..            ",
        "       ..++++++++++++++++#######@@@@@@@@@@@####++++++++++++++++..           ",
        "      ..++++++++++++++++#######@@@@@@@@@@@@@#####+++++++++++++++..          ",
        "     ..+++++++++++++++########@@@@@@@@@@@@@@######+++++++++++++++..         ",
        "     .+++++++++++++++########@@@@@@@@@@@@@@@@######+++++++++++++++..        ",
        "    ..+++++++++++++##########@@@@@@@@@@@@@@@@@#######++++++++++++++.        ",
        "    .+++++++++++++#########@@@@@@@@@@@@@@@@@@@########++++++++++++++.       ",
        "   ..+++++++++++++#########@@@@@@@@@@@@@@@@@@@@########+++++++++++++..      ",
        "   .+++++++++++++##########@@@@@@@@@@@@@@@@@@@@#########+++++++++++++.      ",
        "  .+++++++++++++##########@@@@@@@@@@@@@@@@@@@@@##########++++++++++++..     ",
        "  .++++++++++++###########@@@@@@@@@@@@@@@@@@@@@@#########+++++++++++++.     ",
        "  .++++++++++++#########;@@@@@@@@@;@@@@@@@@;@@@@#####;####++++++++++++.     ",
        "  .+++++++++++##########;;@@@@@@;;;@@@@@@@@;;@@@###;;;#####+++++++++++..    ",
        "  .++++++++++###########@;;;@@@;;;@@@@@@@@@@;;;@##;;;######++++++++++++.    ",
        "  .++++++++++###########@;;;;;;;;;@@@@@@@@@@;;;;;;;;;#######+++++++++++.    ",
        " .+++++++++++###########@;;;;;;;;;@@@@@@@@@@;;;;;;;;;########++++++++++.    ",
        " .+++++++++++###########@;;;;;;;;;@@@@@@@@@@;;;;;;;;;########++++++++++.    ",
        " .++++++++++############@;;;;;;;;;@@@@@@@@@@;;;;;;;;;########++++++++++.    ",
        " .++++++++++###########@;;;;;;;;;;;@@@@@@@@;;;;;;;;;;;#######++++++++++.    ",
        " .++++++++++###########;;;;;;;;;;;;;@@@@@@;;;;;;;;;;;;;######+++++++++++.   ",
        " .++++++++++##########;;;;;;;;;;;;;;;@@@@;;;;;;;;;;;;;;;######++++++++++.   ",
        " .++++++++++#########;;;;;;;;;;;;;;;@@@@;;;;;;;;;;;;;;;#######++++++++++.   ",
        " .+++++++++############@@@@;;;;;@@@@@@@@@@@@@@;;;;;###########++++++++++.   ",
        " .+++++++++############@@@@@;;;@@@@@@@@@@@@@@@@;;;############++++++++++.   ",
        " .+++++++++############@@@@@;;;@@@@@@@@@@@@@@@@;;;############++++++++++.   ",
        "  .++++++++############@@@@@@;;@@@@@@@;@@@@@@@@@;;############++++++++++.   ",
        "  .++++++++############@@@@@@;@@@@@@@;;;@@@@@@@@;#############++++++++++.   ",
        "  .+++++++++###########@@@@@@;@@@@@@;;;;;@@@@@@@;#############++++++++++.   ",
        "  .+++++++++###########@@@@@@@@@@@@@;;;;;@@@@@@@@############+++++++++++.   ",
        "  .+++++++++############@@@@@@@@@@@;;;;;;;@@@@@@@############+++++++++++.   ",
        "  .+++++++++############@@@@@@@@@@@@@@@@@@@@@@@@@############+++++++++++.   ",
        "  ..+++++++++###########@@@@@@@@@@@@@@@@@@@@@@@@#############+++++++++++.   ",
        "   .+++++++++#######;;;##@@@@@@@@@@@@@@@@@@@@@@@#############++++++++++.    ",
        "   .+++++++++####;;;;;;;;;;;;;;;@@@@@@@@@@@@@@@@############+++++++++++.    ",
        "   ..+++++++++###;;;#;;;;;;;;;;;;;;;;;;@@@@@@@@@############+++++++++++.    ",
        "    .+++++++++####;##;#;##;@;@;;;;;;;;;;;;;;;;@@###########++++++++++++.    ",
        "    .++++++++++###;####;##;@;@;@;@@;@;;;;;;;;;;;;;;;#######+++++++++++.     ",
        "     .+++++++++############@@@@@;@@;@;@;@;@@;;;;;;;;;;;;;##+++++++++++.     ",
        "     .++++++++++###########@@@@@@@@@@@@;@;@@;@;#;#;#;;;;;#++++++++++++.     ",
        "      .+++++++++###########@@@@@@@@@@@@@@@@@@+;#;#;##;#;##+++++++++++.      ",
        "      .++++++++++###########@@@@@@@@@@@@@@@@@@@######;#;#++++++++++++.      ",
        "       .++++++++++##########@@@@@@@@@@@@@@@@@@##########++++++++++++.       ",
        "       .+++++++++++##########@@@@@@@@@@@@@@@@@#########++++++++++++..       ",
        "        .+++++++++++#########@@@@@@@@@@@@@@@@#########+++++++++++++.        ",
        "        .++++++++++++#########@@@@@@@@@@@@@@#########+++++++++++++.         ",
        "         .++++++++++++########@@@@@@@@@@@@@@########++++++++++++..          ",
        "          .+++++++++++++#######@@@@@@@@@@@@#######+++++++++++++..           ",
        "           .+++++++++++++######@@@@@@@@@@@#######++++++++++++..             ",
        "            .++++++++++++++#####@@@@@@@@@######+++++++++++++.               ",
        "             ..++++++++++++++++##@@@@@@......+++++++++++++...               ",
        "               ..+++++++++++++.........      .............                  ",
        "                 .............                                              ",
        "                                                                            ",
        "                                                                            ",
        "                                                                            ",
        "                                                                            "
    ]
}
