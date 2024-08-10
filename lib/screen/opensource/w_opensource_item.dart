import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/opensource/vo_package.dart';
import 'package:flutter/material.dart';

class OpensourceItem extends StatelessWidget {
  final Package package;

  const OpensourceItem(this.package, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.appBackground,
      margin: const EdgeInsets.only(
        top: 40,
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          package.name.text.white.size(20).bold.make().pOnly(left: 20, bottom: 8),
          package.description.text.white
              .size(14)
              .make()
              .pOnly(left: 20, bottom: 8, right: 20),
          if (package.authors.isNotEmpty)
            (package.authors.join(", "))
                .text
                .white
                .size(14)
                .make()
                .pOnly(left: 20, top: 12),
          if (isNotBlank(package.homepage))
            (package.homepage ?? "").text.white.make().pOnly(left: 20, top: 15),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade900,
                border: Border.all(color: context.appColors.divider),
                borderRadius: BorderRadius.circular(4)),
            margin: const EdgeInsets.only(left: 20, top: 15, right: 20),
            height: 230,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  (package.license ?? "").text.white.make(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
