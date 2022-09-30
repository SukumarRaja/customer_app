import '../../../utility/enum.dart';

class NotificationRes {
  NotificationRes({
    this.notificationType,
    this.orderId,
    this.adminId,
    this.deliverymanId,
    this.restaurantId,
    this.type,
    this.conversationId,
  });

  NotificationType? notificationType;
  dynamic orderId;
  dynamic adminId;
  dynamic deliverymanId;
  dynamic restaurantId;
  dynamic type;
  dynamic conversationId;

  factory NotificationRes.fromMap(Map<String, dynamic> json) => NotificationRes(
        notificationType: convertToEnum(json['order_notification']),
        orderId: json["order_id"] == null ? null : json["order_id"],
        adminId: json["admin_id"] == null ? null : json["admin_id"],
        deliverymanId:
            json["deliveryman_id"] == null ? null : json["deliveryman_id"],
        restaurantId:
            json["restaurant_id"] == null ? null : json["restaurant_id"],
        type: json["type"] == null ? null : json["type"],
        conversationId:
            json["conversation_id"] == null ? null : json["conversation_id"],
      );

  Map<String, dynamic> toMap() => {
        "order_notification":
            notificationType == null ? null : notificationType.toString(),
        "order_id": orderId == null ? null : orderId,
        "admin_id": adminId == null ? null : adminId,
        "deliveryman_id": deliverymanId == null ? null : deliverymanId,
        "restaurant_id": restaurantId == null ? null : restaurantId,
        "type": type == null ? null : type,
        "conversation_id": conversationId == null ? null : conversationId,
      };
}

NotificationType convertToEnum(String enumString) {
  if (enumString == NotificationType.general.toString()) {
    return NotificationType.general;
  } else if (enumString == NotificationType.order.toString()) {
    return NotificationType.order;
  } else if (enumString == NotificationType.message.toString()) {
    return NotificationType.message;
  }
  return NotificationType.general;
}
