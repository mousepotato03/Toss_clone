import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/notification_type.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

final notificationDummies = <TossNotification>[
  TossNotification(
    NotificationType.tossPay,
    "영화 쿠폰 도착",
    DateTime.now().subtract(27.minutes),
  ),
  TossNotification(
    NotificationType.stock,
    "인적분할에 대해 알려드릴게요.",
    DateTime.now().subtract(1.hours),
  ),
  TossNotification(
    NotificationType.walk,
    "1000걸음 이상 걸었다면 포인트를 받으세요.",
    DateTime.now().subtract(1.hours),
  ),
  TossNotification(
    NotificationType.moneyTip,
    "유럽 식품 물가가 치솟고 있어요.",
    DateTime.now().subtract(8.minutes),
  ),
  TossNotification(
    NotificationType.walk,
    "영화 쿠폰 도착",
    DateTime.now().subtract(27.minutes),
  ),
  TossNotification(
    NotificationType.luck,
    "7월 29일, 행운 복권이 도착했어요.",
    DateTime.now().subtract(12.hours),
  ),
  TossNotification(
    NotificationType.people,
    "띵동! 월요일 공동구매 보러가기",
    DateTime.now().subtract(1.days),
  ),
];
