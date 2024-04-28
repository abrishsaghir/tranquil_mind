import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  final String userName;
  final int? meditationProgress;
  final int? breathingProgress;

  UserProfilePage({
    required this.userName,
    this.meditationProgress,
    this.breathingProgress,
  });

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController meditationController = TextEditingController();
  TextEditingController breathingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "User Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Enter your name:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              SizedBox(height: 20),
              Text(
                'Enter meditation progress (%):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: meditationController,
                decoration: InputDecoration(hintText: 'Meditation Progress'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Text(
                'Enter breathing progress (%):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: breathingController,
                decoration: InputDecoration(hintText: 'Breathing Progress'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final String userName = nameController.text;
                  final int? meditationProgress =
                  int.tryParse(meditationController.text);
                  final int? breathingProgress =
                  int.tryParse(breathingController.text);
                  // Perform any additional validation or processing if needed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfilePage(
                        userName: userName,
                        meditationProgress: meditationProgress,
                        breathingProgress: breathingProgress,
                      ),
                    ),
                  );
                },
                child: Text('Save'),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Welcome ${widget.userName}!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Meditation Progress:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              LinearProgressIndicator(
                value: widget.meditationProgress != null
                    ? widget.meditationProgress! / 100
                    : 0,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              SizedBox(height: 10),
              Text('${widget.meditationProgress}% Completed'),
              SizedBox(height: 20),
              Text(
                'Breathing Progress:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              LinearProgressIndicator(
                value: widget.breathingProgress != null
                    ? widget.breathingProgress! / 100
                    : 0,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              SizedBox(height: 10),
              Text('${widget.breathingProgress}% Completed'),
            ],
          ),
        ),
      ),
    );
  }
}
