import 'package:flutter/material.dart';
import 'package:movi_app/core/utils/app/styles/app_styles.dart';

class WatchNowHeader extends StatelessWidget {
  const WatchNowHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                const Icon(Icons.circle, color: Colors.green, size: 12),
                const SizedBox(width: 6),
                Text(
                  "Watch Now",
                  style: AppStyles.styleRegular16,
                ),
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.07),
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Icon(
              Icons.watch_later,
              color: Colors.green,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
