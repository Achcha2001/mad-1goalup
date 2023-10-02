import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  // List to store uploaded files
  List<String> allFiles = [];
  List<String> sharedFiles = [];
  List<String> privateFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploads'),
        backgroundColor: Color.fromARGB(255, 14, 14, 106),
      ),
      body: Container(
        color: Colors.deepPurple,
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Shared'),
                  Tab(text: 'Private'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildTabContent(allFiles),
                    _buildTabContent(sharedFiles),
                    _buildTabContent(privateFiles),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(List<String> files) {
    // Check if there are uploaded files
    bool filesExist = files.isNotEmpty;

    return Center(
      child: filesExist
          ? ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(files[index]),
                  // Add more details or actions if needed
                );
              },
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.description, size: 64, color: Colors.white),
                SizedBox(height: 16),
                Text(
                  "Couldn't find any uploaded file",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // Handle upload action
                    _selectFile();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 64, vertical: 32), // Larger padding
                  ),
                  child: Text('Upload', style: TextStyle(color: Colors.deepPurple)),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DocCreationPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 64, vertical: 32), // Larger padding
                  ),
                  child: Text('Create New Doc', style: TextStyle(color: Colors.deepPurple)),
                ),
              ],
            ),
    );
  }

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      print('Selected file: ${file.name}');

      // Add the selected file to the relevant list based on the current tab
      if (DefaultTabController.of(context)!.index == 0) {
        setState(() {
          allFiles.add(file.name);
        });
      } else if (DefaultTabController.of(context)!.index == 1) {
        setState(() {
          sharedFiles.add(file.name);
        });
      } else if (DefaultTabController.of(context)!.index == 2) {
        setState(() {
          privateFiles.add(file.name);
        });
      }
    } else {
      // User canceled the file picker
      print('File selection canceled');
    }
  }
}

class DocCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Doc'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Color.fromARGB(255, 79, 18, 101),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Start writing here...',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle save action
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Text('Save', style: TextStyle(color: Colors.deepPurple)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
