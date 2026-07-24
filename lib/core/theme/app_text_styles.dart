import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Font Families
  static const String fontFamilyPoppins = 'Poppins';
  static const String fontFamilyOtamaep = 'Otamaep';

  static const Color _c = AppColors.textPrimary;

  // ═══════════════════════════════════════════════════════════════
  // POPPINS (p)
  // ═══════════════════════════════════════════════════════════════

  // ─── 32 ────────────────────────────────────────────────────
  static TextStyle get pB32  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 32.sp, fontWeight: FontWeight.w700, color: _c, letterSpacing: -1);
  static TextStyle get pSB32 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 32.sp, fontWeight: FontWeight.w600, color: _c, letterSpacing: -1);
  static TextStyle get pM32  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 32.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR32  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 32.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 28 ────────────────────────────────────────────────────
  static TextStyle get pB28  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 28.sp, fontWeight: FontWeight.w700, color: _c, letterSpacing: -0.5);
  static TextStyle get pSB28 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 28.sp, fontWeight: FontWeight.w600, color: _c, letterSpacing: -0.5);
  static TextStyle get pM28  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 28.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR28  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 28.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 26 ────────────────────────────────────────────────────
  static TextStyle get pB26  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 26.sp, fontWeight: FontWeight.w700, color: _c, letterSpacing: -0.5);
  static TextStyle get pSB26 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 26.sp, fontWeight: FontWeight.w600, color: _c, letterSpacing: -0.5);
  static TextStyle get pM26  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 26.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR26  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 26.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 24 ────────────────────────────────────────────────────
  static TextStyle get pB24  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 24.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get pSB24 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 24.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get pM24  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 24.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR24  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 24.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 22 ────────────────────────────────────────────────────
  static TextStyle get pB22  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 22.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get pSB22 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 22.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get pM22  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 22.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR22  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 22.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 20 ────────────────────────────────────────────────────
  static TextStyle get pB20  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 20.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get pSB20 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 20.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get pM20  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 20.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR20  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 20.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 18 ────────────────────────────────────────────────────
  static TextStyle get pB18  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 18.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get pSB18 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 18.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get pM18  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 18.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR18  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 18.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 16 ────────────────────────────────────────────────────
  static TextStyle get pB16  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 16.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get pSB16 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 16.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get pM16  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 16.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR16  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 16.sp, fontWeight: FontWeight.w400, color: _c, height: 1.5);

  // ─── 15 ────────────────────────────────────────────────────
  static TextStyle get pB15  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 15.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get pSB15 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 15.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get pM15  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 15.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR15  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 15.sp, fontWeight: FontWeight.w400, color: _c, height: 1.5);

  // ─── 14 ────────────────────────────────────────────────────
  static TextStyle get pB14  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 14.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get pSB14 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 14.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get pM14  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 14.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR14  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 14.sp, fontWeight: FontWeight.w400, color: _c, height: 1.5);

  // ─── 13 ────────────────────────────────────────────────────
  static TextStyle get pB13  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 13.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get pSB13 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 13.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get pM13  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 13.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR13  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 13.sp, fontWeight: FontWeight.w400, color: _c, height: 1.5);

  // ─── 12 ────────────────────────────────────────────────────
  static TextStyle get pB12  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 12.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get pSB12 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 12.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get pM12  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 12.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR12  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 12.sp, fontWeight: FontWeight.w400, color: _c, height: 1.5);

  // ─── 11 ────────────────────────────────────────────────────
  static TextStyle get pB11  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 11.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get pSB11 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 11.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get pM11  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 11.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR11  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 11.sp, fontWeight: FontWeight.w400, color: _c, height: 1.5);

  // ─── 10 ────────────────────────────────────────────────────
  static TextStyle get pB10  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 10.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get pSB10 => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 10.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get pM10  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 10.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get pR10  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 10.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 9 ─────────────────────────────────────────────────────
  static TextStyle get pB9   => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 9.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get pSB9  => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 9.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get pM9   => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 9.sp, fontWeight: FontWeight.w500, color: _c, letterSpacing: 0.3);
  static TextStyle get pR9   => TextStyle(fontFamily: fontFamilyPoppins, fontSize: 9.sp, fontWeight: FontWeight.w400, color: _c);

  // ═══════════════════════════════════════════════════════════════
  // OTAMAEP (o)
  // ═══════════════════════════════════════════════════════════════

  // ─── 32 ────────────────────────────────────────────────────
  static TextStyle get oB32  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 32.sp, fontWeight: FontWeight.w700, color: _c, letterSpacing: -1);
  static TextStyle get oSB32 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 32.sp, fontWeight: FontWeight.w600, color: _c, letterSpacing: -1);
  static TextStyle get oM32  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 32.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR32  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 32.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 28 ────────────────────────────────────────────────────
  static TextStyle get oB28  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 28.sp, fontWeight: FontWeight.w700, color: _c, letterSpacing: -0.5);
  static TextStyle get oSB28 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 28.sp, fontWeight: FontWeight.w600, color: _c, letterSpacing: -0.5);
  static TextStyle get oM28  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 28.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR28  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 28.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 26 ────────────────────────────────────────────────────
  static TextStyle get oB26  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 26.sp, fontWeight: FontWeight.w700, color: _c, letterSpacing: -0.5);
  static TextStyle get oSB26 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 26.sp, fontWeight: FontWeight.w600, color: _c, letterSpacing: -0.5);
  static TextStyle get oM26  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 26.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR26  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 26.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 24 ────────────────────────────────────────────────────
  static TextStyle get oB24  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 24.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get oSB24 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 24.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get oM24  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 24.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR24  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 24.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 22 ────────────────────────────────────────────────────
  static TextStyle get oB22  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 22.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get oSB22 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 22.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get oM22  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 22.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR22  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 22.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 20 ────────────────────────────────────────────────────
  static TextStyle get oB20  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 20.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get oSB20 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 20.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get oM20  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 20.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR20  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 20.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 18 ────────────────────────────────────────────────────
  static TextStyle get oB18  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 18.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get oSB18 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 18.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get oM18  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 18.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR18  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 18.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 16 ────────────────────────────────────────────────────
  static TextStyle get oB16  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 16.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get oSB16 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 16.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get oM16  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 16.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR16  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 16.sp, fontWeight: FontWeight.w400, color: _c, height: 1.5);

  // ─── 15 ────────────────────────────────────────────────────
  static TextStyle get oB15  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 15.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get oSB15 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 15.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get oM15  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 15.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR15  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 15.sp, fontWeight: FontWeight.w400, color: _c, height: 1.5);

  // ─── 14 ────────────────────────────────────────────────────
  static TextStyle get oB14  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 14.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get oSB14 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 14.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get oM14  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 14.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR14  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 14.sp, fontWeight: FontWeight.w400, color: _c, height: 1.5);

  // ─── 13 ────────────────────────────────────────────────────
  static TextStyle get oB13  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 13.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get oSB13 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 13.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get oM13  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 13.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR13  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 13.sp, fontWeight: FontWeight.w400, color: _c, height: 1.5);

  // ─── 12 ────────────────────────────────────────────────────
  static TextStyle get oB12  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 12.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get oSB12 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 12.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get oM12  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 12.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR12  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 12.sp, fontWeight: FontWeight.w400, color: _c, height: 1.5);

  // ─── 11 ────────────────────────────────────────────────────
  static TextStyle get oB11  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 11.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get oSB11 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 11.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get oM11  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 11.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR11  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 11.sp, fontWeight: FontWeight.w400, color: _c, height: 1.5);

  // ─── 10 ────────────────────────────────────────────────────
  static TextStyle get oB10  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 10.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get oSB10 => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 10.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get oM10  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 10.sp, fontWeight: FontWeight.w500, color: _c);
  static TextStyle get oR10  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 10.sp, fontWeight: FontWeight.w400, color: _c);

  // ─── 9 ─────────────────────────────────────────────────────
  static TextStyle get oB9   => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 9.sp, fontWeight: FontWeight.w700, color: _c);
  static TextStyle get oSB9  => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 9.sp, fontWeight: FontWeight.w600, color: _c);
  static TextStyle get oM9   => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 9.sp, fontWeight: FontWeight.w500, color: _c, letterSpacing: 0.3);
  static TextStyle get oR9   => TextStyle(fontFamily: fontFamilyOtamaep, fontSize: 9.sp, fontWeight: FontWeight.w400, color: _c);
}