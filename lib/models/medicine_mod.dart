class MedicineModel {
  final int? id;
  final String name;
  final int amount;
  final int timesPerDay;
  final List<String> timeSlots;
  final Map<String, String> timeStrings;
  final String relation;
  final String note;
  final String reminder;
  final DateTime date;
  final String status;

  MedicineModel({
    this.id,
    required this.name,
    required this.amount,
    required this.timesPerDay,
    required this.timeSlots,
    required this.timeStrings,
    required this.relation,
    required this.note,
    required this.reminder,
    required this.date,
    this.status = 'pending',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'times_per_day': timesPerDay,
      'time_slots': timeSlots.join(','),
      'time_strings': timeStrings.entries.map((e) => '${e.key}:${e.value}').join(','),
      'relation': relation,
      'note': note,
      'reminder': reminder,
      'date': date.toIso8601String(),
      'status': status,
    };
  }

  factory MedicineModel.fromMap(Map<String, dynamic> map) {
    final timeStringsMap = <String, String>{};
    if (map['time_strings'] != null && map['time_strings'] != "") {
      final entries = (map['time_strings'] as String).split(',');
      for (var entry in entries) {
        final kv = entry.split(':');
        if (kv.length == 2) timeStringsMap[kv[0]] = kv[1];
      }
    }

    return MedicineModel(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
      timesPerDay: map['times_per_day'],
      timeSlots: (map['time_slots'] as String).split(','),
      timeStrings: timeStringsMap,
      relation: map['relation'],
      note: map['note'],
      reminder: map['reminder'],
      date: DateTime.parse(map['date']),
      status: map['status'],
    );
  }
}
