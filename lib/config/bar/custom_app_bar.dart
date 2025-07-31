import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final isPremium = ref.watch(isPremiumProvider);
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: kToolbarHeight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                children: [
                  Text(
                    'Image to PDF',
                    style: CustomTheme.textTheme(context).bodyLarge,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => context.go('/settings'),
                    child: Icon(
                      CupertinoIcons.settings,
                      color: CustomTheme.accentColor,
                      size: width * 0.07,
                    ),
                  ),

                  // if (!isPremium)
                  // GestureDetector(
                  //   // onTap: () => adaptyFunction(isPremium, 'placement-pro'),
                  //   child: Container(
                  //     width: width * 0.24,
                  //     height: height * 0.042,
                  //     decoration: BoxDecoration(
                  //       color: const Color.fromARGB(255, 48, 44, 44),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         SizedBox(width: width * 0.02),
                  //         Image.asset(
                  //           'assets/icons/pro.png',
                  //           width: width * 0.07,
                  //         ),
                  //         SizedBox(width: width * 0.01),
                  //         Text(
                  //           'PRO',
                  //           style: CustomTheme.textTheme(context)
                  //               .bodyMedium
                  //               ?.copyWith(
                  //                 fontSize: height * 0.022,
                  //               ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // IconButton(
                  //   icon: Icon(Icons.settings, color: CustomTheme.accentColor),
                  //   onPressed: () => context.go('/settings'),
                  // ),
                ],
              ),
            ),
          ),
          Container(height: width * 0.0005, color: CustomTheme.primaryColor),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
