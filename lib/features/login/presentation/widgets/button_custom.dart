import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;



  const ButtonCustom({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red,
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: .w600,
                color: AppColors.white,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Icon(Icons.arrow_forward, color: AppColors.white, size: 26),
        ],
      ),
    );
  }
}
