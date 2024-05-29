import 'package:flutter/material.dart';
import 'package:rikandmorty/theme/app_colors.dart';

class InputBorders {
  static OutlineInputBorder outlineBorderColorE5E5E5Width1Radius10 =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorE5E5E5.withOpacity(0),
      width: 0,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(26),
    ),
  );

  static OutlineInputBorder outlineBorderColorGreenWidth2Radius10 =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorE5E5E5.withOpacity(0),
      width: 2,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(26),
    ),
  );
  static const OutlineInputBorder outlineBordercolorF68080Width2Radius10 =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorF68080,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(
        10,
      ),
    ),
  );

  static const UnderlineInputBorder unOutlineBorderColorE5E5E5Width1 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorE5E5E5,
      width: 1,
    ),
  );
  static const UnderlineInputBorder unOutlineBorderColorGreenWidth2 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.green,
      width: 2,
    ),
  );
  static const UnderlineInputBorder unOutlineBordercolorF68080Width2 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorF68080,
      width: 2,
    ),
  );
}
