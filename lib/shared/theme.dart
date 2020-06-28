part of 'shared.dart';

const double defaultMargin = 24;
Color mainColor = Color(0xFF1c768f);
Color secondaryColor = Color(0xFF503E9D);

Color accentColor1 = Color(0xFF032539);
Color accentColor2 = Color(0xFFfa991c);
Color accentColor3 = Color(0xFFADADAD);

TextStyle blackText = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteText = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle purpleText = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyText = GoogleFonts.raleway()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);

TextStyle whiteNumber = GoogleFonts.openSans().copyWith(color: Colors.white);
TextStyle yellowNumber = GoogleFonts.openSans().copyWith(color: accentColor2);
