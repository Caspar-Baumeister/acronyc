// TEXT STYLES //

// ignore_for_file: constant_identifier_names

import 'package:acronyc_app/utiles/colors.dart';
import 'package:flutter/material.dart';

// TEXT STYLES //

// make 6 standart text styles with names like H14W5, H16W6, H18W7, H20W8, H24W9, H28W10
// H - height, W - weight
const TextStyle H14W5 =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: TEXT_COLOR);
const TextStyle H16W6 =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: TEXT_COLOR);
const TextStyle H18W7 =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: TEXT_COLOR);
const TextStyle H20W8 =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: TEXT_COLOR);
const TextStyle H24W9 =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: TEXT_COLOR);

// TOKENS //

const TextStyle MAIN_TITLE = H24W9;
// filter titles
const TextStyle FILTER_TITLE = H14W5;

const TextStyle CARD_SUBTITLE = H14W5;

const TextStyle SUB_TITLE = H16W6;

const TextStyle STANDART_DESCRIPTION = H14W5;

const TextStyle STANDART_BUTTON_TEXT = H18W7;
