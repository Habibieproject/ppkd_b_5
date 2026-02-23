import 'package:flutter/material.dart';

class InputWidgetDay12 extends StatefulWidget {
  const InputWidgetDay12({super.key});

  @override
  State<InputWidgetDay12> createState() => _InputWidgetDay12State();
}

class _InputWidgetDay12State extends State<InputWidgetDay12> {
  bool _ischeck = false;
  bool onOff = false;
  String? selectedDropdown;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onOff ? Colors.yellow : Colors.white,
      appBar: AppBar(title: Text("Input Widget")),
      body: Column(
        children: [
          Text("CheckBox"),
          Row(
            children: [
              Checkbox(
                value: _ischeck,
                onChanged: (value) {
                  _ischeck = value ?? false;
                  setState(() {});
                },
              ),
              Text("Apakah anda yakin? ${_ischeck ? "Ya" : "Tidak"}"),
            ],
          ),
          Text("Switch"),
          Switch(
            value: onOff,
            onChanged: (value) {
              onOff = value ?? false;
              setState(() {});
            },
          ),
          Text("Dropdown"),
          DropdownButtonFormField(
            decoration: InputDecoration(fillColor: Colors.grey, filled: true),
            initialValue: selectedDropdown,
            hint: Text("Pilih Warna"),
            items: ["Merah", "Hijau", "Pink"].map((String value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedDropdown = value;
              });
            },
          ),
          Container(
            height: 100,
            width: 100,
            color: selectedDropdown == "Merah"
                ? Colors.red
                : selectedDropdown == "Hijau"
                ? Colors.green
                : Colors.pink,
          ),

          Text("DatePicker"),
          Text(selectedDate.toString()),
          // Text(Dateform),
          ElevatedButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2027),
                initialDate: DateTime.now(),
              );
              if (picked != null) {
                selectedDate = picked;
                setState(() {});
              }
            },
            child: Text("Pilih Tanggal"),
          ),
          Text("TimePicker"),
          Text(selectedTime.toString()),
          // Text(Dateform),
          ElevatedButton(
            onPressed: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,

                initialTime: TimeOfDay.now(),
              );
              if (picked != null) {
                selectedTime = picked;
                setState(() {});
              }
            },
            child: Text("Pilih Jam"),
          ),
        ],
      ),
    );
  }
}
