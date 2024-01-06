import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            children: [],
          ),
        ),
      ),
    );
  }

  Widget _bottomBar(
    
    IconData icon,
    int page,
  ) {
    return Column(
      children: [
        Icon(icon),
      ],
    );
  }
}
