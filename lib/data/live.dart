class LiveSession {
  final int id;
  final bool isLive;
  final String title;
  final Instructor instructor;
  final SessionDetails sessionDetails;
  final String action;

  LiveSession({
    required this.id,
    required this.isLive,
    required this.title,
    required this.instructor,
    required this.sessionDetails,
    required this.action,
  });

  factory LiveSession.fromJson(Map<String, dynamic> json) {
    return LiveSession(
      id: json['id'],
      isLive: json['is_live'],
      title: json['title'],
      instructor: Instructor.fromJson(json['instructor']),
      sessionDetails: SessionDetails.fromJson(json['session_details']),
      action: json['action'],
    );
  }
}

class Instructor {
  final String name;

  Instructor({required this.name});

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(name: json['name']);
  }
}

class SessionDetails {
  final int sessionNumber;
  final String date;
  final String time;

  SessionDetails({
    required this.sessionNumber,
    required this.date,
    required this.time,
  });

  factory SessionDetails.fromJson(Map<String, dynamic> json) {
    return SessionDetails(
      sessionNumber: json['session_number'],
      date: json['date'],
      time: json['time'],
    );
  }
}
