enum Priority {
  highest,
  high,
  medium,
  low,
  lowest,
}

String priorityToString(Priority priority) {
  switch (priority) {
    case Priority.highest:
      return 'highest';
    case Priority.high:
      return 'high';
    case Priority.medium:
      return 'medium';
    case Priority.low:
      return 'low';
    case Priority.lowest:
      return 'lowest';
  }
}

Priority priorityFromString(String priority) {
  switch (priority) {
    case 'highest':
      return Priority.highest;
    case 'high':
      return Priority.high;
    case 'medium':
      return Priority.medium;
    case 'low':
      return Priority.low;
    case 'lowest':
      return Priority.lowest;
    default:
      return Priority.medium;
  }
}
