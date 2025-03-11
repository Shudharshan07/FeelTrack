import 'package:application/widgets.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("A B O U T"),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Text("     Project Details"),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SelectableText(
                      '''This project was developed using the Naive Bayes Algorithm from scratch, without relying on frameworks like TensorFlow or PyTorch. I built the model entirely on my own to understand the inner workings of machine learning algorithms.
                          
The app was created using Flutter, with Provider as the state management solution and Hive for local storage. If you’re interested in exploring the source code for both the model and the app, feel free to visit my GitHub repository below.
                          
GitHub Repository: https://github.com/Shudharshan07/FeelTrack.git'''),
                ),
              ),
              decoration: general(context),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Text("      Possible Issues"),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SelectableText(
                      '''If you're trying to analyze for the first time after a period of inactivity, the process may take longer than usual. This delay is due to server-related issues. Please be patient, as it may take anywhere from 30 to 90 seconds for the analysis to complete in such cases.

Additionally, ensure that your internet connection is enabled, as this app requires an active internet connection to function properly.

Thank you for your understanding!'''),
                ),
              ),
              decoration: general(context),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Text("     Developer's Details"),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SelectableText(
                      '''Hello! I'm Shudharshan, the developer behind this application. I’m passionate about building solutions that are both functional and user-friendly. This app was created with a focus on providing a seamless experience, and I hope you find it helpful and easy to use.

If you'd like to connect, collaborate, or just have a conversation about technology, feel free to reach out! I’m always open to learning new things and discussing ideas.

You can connect with me on LinkedIn:

LinkedIn: https://www.linkedin.com/in/shudharshan-p-54546a315/'''),
                ),
              ),
              decoration: general(context),
            ),
          ),
        ],
      ),
    );
  }
}
