import 'package:flutter/material.dart';

class PrescripitonPage extends StatelessWidget {
  final String symptoms;
  final String disease;
  final String remarks;
  final String medicines;
  final String consultationDate;
  const PrescripitonPage(
      {super.key,
      required this.symptoms,
      required this.disease,
      required this.remarks,
      required this.medicines,
      required this.consultationDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Prescription Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Symptoms:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(symptoms, style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Text('Disease Identified:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(disease, style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Text('Remarks:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(remarks, style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Text('Medicines:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(medicines, style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Text('Consultation Date:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(consultationDate, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
