part of '../rate_app.dart';

class CustomClipPath extends StatelessWidget {
  const CustomClipPath({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // clipper: MyCustomClipper(),
      child: Container(
        width: 266, // Width of the original SVG
        height: 60, // Height of the original SVG
        decoration:  BoxDecoration(
          color: GlobalColors.container2,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(132.877, 54.5896);
    path.cubicTo(
      158.559,
      54.5896,
      180.035,
      36.5731,
      185.352,
      12.4892,
    );
    path.cubicTo(
      186.748,
      6.16629,
      191.864,
      0.85302,
      198.34,
      0.852946,
    );
    path.lineTo(254.031, 0.852307);
    path.cubicTo(
      260.507,
      0.852233,
      265.756,
      6.1015,
      265.756,
      12.5768,
    );
    path.lineTo(265.756, 256.975);
    path.cubicTo(
      265.756,
      263.451,
      260.507,
      268.7,
      254.031,
      268.7,
    );
    path.lineTo(11.7245, 268.7);
    path.cubicTo(
      5.24924,
      268.7,
      0,
      263.451,
      0,
      256.975,
    );
    path.lineTo(0, 12.5767);
    path.cubicTo(
      0,
      6.10141,
      5.24925,
      0.852173,
      11.7245,
      0.852173,
    );
    path.lineTo(67.416, 0.852173);
    path.cubicTo(
      73.8913,
      0.852173,
      79.0078,
      6.16407,
      80.4036,
      12.4871,
    );
    path.cubicTo(
      84.2133,
      29.7448,
      96.32,
      43.8879,
      112.326,
      50.5183,
    );
    path.cubicTo(
      118.657,
      53.142,
      125.597,
      54.5896,
      132.877,
      54.5896,
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
