import 'package:flutter/material.dart';

class KonsultasiScreen extends StatelessWidget {
  const KonsultasiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Jadwal(date: 'Senin - Rabu', time: '16.00 - 20.00'),
          Jadwal(date: 'Kamus - Sabtu', time: '14.00 - 20.00'),
          Jadwal(date: 'Minggu', time: '08.00 - 15.00'),
        ]
            .map(
              (e) => ListTile(
                title: Text(e.date!),
                trailing: Text(e.time!),
              ),
            )
            .toList(),
      ),
    );
  }
}

class Jadwal {
  String? date;
  String? time;

  Jadwal({this.date, this.time});
}
