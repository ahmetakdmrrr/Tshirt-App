import 'package:flutter/material.dart';
import 'package:t_shirt_app/repository/t_shirt_list.dart';

class TshirtCard extends StatelessWidget {
  const TshirtCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        itemCount: registeredTshirt.length,
        itemBuilder: (context, index) {
          const SizedBox(
            height: 15,
          );
          return Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(registeredTshirt[index].name),
                      content: Text(registeredTshirt[index].description),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Okay'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    registeredTshirt[index].imagePath,
                    fit: BoxFit.cover,
                    height: 180,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${registeredTshirt[index].name}\n${registeredTshirt[index].price}",
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
