import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter/cupertino.dart';

class NotificationItemWidget extends StatefulWidget {
  final TossNotification notification;

  const NotificationItemWidget({super.key, required this.notification});

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Image.asset(widget.notification.type.iconPath)],
          
        ),
        widget.notification.description.text.make(),
      ],
    );
  }
}
