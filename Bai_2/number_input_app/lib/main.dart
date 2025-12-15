import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: const Practice02(),
    );
  }
}

class Practice02 extends StatefulWidget {
  const Practice02({super.key});

  @override
  State<Practice02> createState() => _Practice02State();
}

class _Practice02State extends State<Practice02> {
  final TextEditingController _controller = TextEditingController();
  List<int> numbers = [];
  String? errorText;

  void generateList() {
    final input = _controller.text.trim();
    final value = int.tryParse(input);

    setState(() {
      if (value == null || value <= 0) {
        errorText = "Dữ liệu bạn nhập không hợp lệ";
        numbers.clear();
      } else {
        errorText = null;
        numbers = List.generate(value, (index) => index + 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Text(
              "Thực hành 02",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            /// Input + Button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Nhập vào số lượng",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: generateList,
                  child: const Text("Tạo"),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// Error text
            if (errorText != null)
              Text(errorText!, style: const TextStyle(color: Colors.red)),

            const SizedBox(height: 20),

            /// List numbers
            Expanded(
              child: ListView.builder(
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      numbers[index].toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
