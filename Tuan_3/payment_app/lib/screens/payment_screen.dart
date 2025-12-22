import 'package:flutter/material.dart';
import '../models/payment_method.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedId;

  final List<Map<String, dynamic>> methods = [
    {'id': 'paypal', 'name': 'PayPal', 'logo': 'assets/paypal.png'},
    {'id': 'google', 'name': 'Google Pay', 'logo': 'assets/googlepay.png'},
    {'id': 'apple', 'name': 'Apple Pay', 'logo': 'assets/applepay.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn hình thức thanh toán'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Hiển thị logo lớn và tên khi đã chọn
          if (selectedId == null)
            Icon(
              Icons.account_balance_wallet,
              size: 80,
              color: Colors.grey.shade700,
            )
          else ...[
            Builder(
              builder: (context) {
                final selected = methods.firstWhere(
                  (m) => m['id'] == selectedId,
                );
                double logoHeight = 60;
                if (selected['id'] == 'paypal' || selected['id'] == 'apple') {
                  logoHeight = 90;
                }
                return Column(
                  children: [
                    Image.asset(selected['logo'], height: logoHeight),
                    const SizedBox(height: 8),
                    Text(
                      selected['name'],
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],

          const SizedBox(height: 20),

          // LIST PAYMENT
          ...methods.map((method) => _buildItem(method)),

          const Spacer(),

          // CONTINUE BUTTON
          if (selectedId != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Continue', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildItem(Map<String, dynamic> method) {
    final bool isSelected = selectedId == method['id'];

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedId = method['id'];
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5)],
        ),
        child: Row(
          children: [
            Radio<String>(
              value: method['id'],
              groupValue: selectedId,
              onChanged: (value) {
                setState(() {
                  selectedId = value;
                });
              },
            ),
            Text(method['name'], style: const TextStyle(fontSize: 16)),
            const Spacer(),
            Image.asset(method['logo'], height: 28),
          ],
        ),
      ),
    );
  }
}
