import 'package:Star_Wars/helper/extensions.dart';
import 'package:Star_Wars/theme/colors.dart';
import 'package:flutter/material.dart';


class CommonButtonCetak extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final double? width;
  final double? fontSize;

  const CommonButtonCetak({
    Key? key,
    this.onTap,
    required this.text,
    this.width,
    this.fontSize,
  }) : super(key: key);

  @override
  _CommonButtonCetakState createState() => _CommonButtonCetakState();
}

class _CommonButtonCetakState extends State<CommonButtonCetak> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? context.deviceWidth(),
      child: ButtonTheme(
        child: TextButton(
          onPressed: widget.onTap,
          style: cetakStyle(widget.onTap != null),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              widget.text,
              style: TextStyle(
                  fontSize: context.scaleFont(widget.fontSize ?? 14),
                  color: widget.onTap != null ? TrustPostWhite : TrustPostBlack,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class CommonButtonConfirm extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final double? width;
  final double? fontSize;

  const CommonButtonConfirm({
    Key? key,
    this.onTap,
    required this.text,
    this.width,
    this.fontSize,
  }) : super(key: key);

  @override
  _CommonButtonConfirmState createState() => _CommonButtonConfirmState();
}

class _CommonButtonConfirmState extends State<CommonButtonConfirm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? context.deviceWidth(),
      child: ButtonTheme(
        child: TextButton(
          onPressed: widget.onTap,
          style: confirmStyle(widget.onTap != null),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              widget.text,
              style: TextStyle(
                  fontSize: context.scaleFont(widget.fontSize ?? 14),
                  color: widget.onTap != null ? TrustPostWhite : TrustPostBlack,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class CommonButtonSignIn extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final double? width;
  final double? fontSize;

  const CommonButtonSignIn({
    Key? key,
    this.onTap,
    required this.text,
    this.width,
    this.fontSize,
  }) : super(key: key);

  @override
  _CommonButtonSignInState createState() => _CommonButtonSignInState();
}

class _CommonButtonSignInState extends State<CommonButtonSignIn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? context.deviceWidth(),
      child: ButtonTheme(
        child: TextButton(
          onPressed: widget.onTap,
          style: signInStyle(widget.onTap != null),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              widget.text,
              style: TextStyle(
                  fontSize: context.scaleFont(widget.fontSize ?? 12),
                  color: widget.onTap != null ? TrustPostBlack : TrustPostWhite,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class CommonButtonCancel extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final double? width;
  final double? fontSize;

  const CommonButtonCancel({
    Key? key,
    this.onTap,
    required this.text,
    this.width,
    this.fontSize,
  }) : super(key: key);

  @override
  _CommonButtonCancelState createState() => _CommonButtonCancelState();
}

class _CommonButtonCancelState extends State<CommonButtonCancel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? context.deviceWidth(),
      child: ButtonTheme(
        child: TextButton(
          onPressed: widget.onTap,
          style: cancelStyle(widget.onTap != null),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              widget.text,
              style: TextStyle(
                  fontSize: context.scaleFont(widget.fontSize ?? 12),
                  color:
                      widget.onTap != null ? TrustPostPrimary : TrustPostBlack,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class CommonButtonRevisi extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final double? width;
  final double? fontSize;

  const CommonButtonRevisi({
    Key? key,
    this.onTap,
    required this.text,
    this.width,
    this.fontSize,
  }) : super(key: key);

  @override
  _CommonButtonRevisiState createState() => _CommonButtonRevisiState();
}

class _CommonButtonRevisiState extends State<CommonButtonRevisi> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? context.deviceWidth(),
      child: ButtonTheme(
        child: TextButton(
          onPressed: widget.onTap,
          style: revisiStyle(widget.onTap != null),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              widget.text,
              style: TextStyle(
                  fontSize: context.scaleFont(widget.fontSize ?? 12),
                  color: widget.onTap != null ? TrustPostWhite : TrustPostBlack,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}

//import 'package:flutter/material.dart';
//import 'package:si_pekan/theme/colors.dart';

ButtonStyle confirmStyle(bool? isNull) {
  return TextButton.styleFrom(
    foregroundColor: TrustPostWhite,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isNull! ? TrustPostPrimary : TrustPostDarkGray,
          width: 1.8,
        ),
        borderRadius: BorderRadius.circular(4)),
    backgroundColor: TrustPostPrimary,
  );
}

ButtonStyle signInStyle(bool? isNull) {
  return TextButton.styleFrom(
    foregroundColor: TrustPostWhite,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isNull! ? TrustPostGray : TrustPostDarkGray,
          width: 1.8,
        ),
        borderRadius: BorderRadius.circular(4)),
    backgroundColor: TrustPostGray,
  );
}

// ButtonStyle signInStyle(bool? isNull) {
//   return TextButton.styleFrom(
//     primary: TrustPostWhite,
//     minimumSize: const Size(88, 44),
//     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//     shape: RoundedRectangleBorder(
//         side: BorderSide(
//           color: isNull! ? TrustPostGray : TrustPostDarkGray,
//           width: 22,
//         ),
//         borderRadius: BorderRadius.circular(20)),
//     backgroundColor: TrustPostGray,
//   );
// }

ButtonStyle cetakStyle(bool? isNull) {
  return TextButton.styleFrom(
    foregroundColor: TrustPostWhite,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isNull! ? TrustPostPrimary : TrustPostDarkGray,
          width: 1.8,
        ),
        borderRadius: BorderRadius.circular(4)),
    backgroundColor: TrustPostSuccess,
  );
}

ButtonStyle cancelStyle(bool? isNull) {
  return TextButton.styleFrom(
    foregroundColor: TrustPostPrimary,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: isNull! ? TrustPostPrimary : TrustPostDarkGray,
        width: 0.8,
      ),
      borderRadius: BorderRadius.circular(4),
    ),
    backgroundColor: TrustPostWhite,
  );
}

ButtonStyle revisiStyle(bool? isNull) {
  return TextButton.styleFrom(
    foregroundColor: TrustPostWhite,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: isNull! ? TrustPostPrimary : TrustPostDarkGray,
        width: 0.8,
      ),
      borderRadius: BorderRadius.circular(4),
    ),
    backgroundColor: TrustPostDanger,
  );
}
