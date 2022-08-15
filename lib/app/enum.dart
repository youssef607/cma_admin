enum OrderStatus {
  INPROGRESS,
  DONE,
  PRE_CANCELED,
  CANCELED,
}

extension TopicString on String {
  OrderStatus toEnum() {
    switch (this) {
      case 'INPROGRESS':
        return OrderStatus.INPROGRESS;
      case 'DONE':
        return OrderStatus.DONE;
      case 'PRE_CANCELED':
        return OrderStatus.PRE_CANCELED;
      case 'CANCELED':
        return OrderStatus.CANCELED;
      default:
        return OrderStatus.INPROGRESS;
    }
  }
}