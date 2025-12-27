import 'package:flutter/material.dart';
import '../models/book.dart';
import '../models/user.dart';
import '../widgets/book_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User user = User("Nguyen Van A");
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _bookController = TextEditingController();

  final List<Book> books = [Book(name: "Sách 01"), Book(name: "Sách 02")];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hệ thống Quản lý Thư viện"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nhân viên"),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _userController..text = user.name,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final newName = await showDialog<String>(
                      context: context,
                      builder: (context) {
                        final controller = TextEditingController(
                          text: user.name,
                        );
                        return AlertDialog(
                          title: const Text('Đổi tên nhân viên'),
                          content: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              labelText: 'Tên mới',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Hủy'),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  Navigator.pop(context, controller.text),
                              child: const Text('Lưu'),
                            ),
                          ],
                        );
                      },
                    );
                    if (newName != null && newName.trim().isNotEmpty) {
                      setState(() {
                        user.name = newName.trim();
                        _userController.text = user.name;
                      });
                    }
                  },
                  child: const Text("Đổi"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Danh sách sách",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: books.map((book) {
                  return BookItem(
                    book: book,
                    onChanged: () {
                      setState(() {
                        book.toggleBorrow();
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final newBookName = await showDialog<String>(
                    context: context,
                    builder: (context) {
                      final controller = TextEditingController();
                      return AlertDialog(
                        title: const Text('Thêm sách mới'),
                        content: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            labelText: 'Tên sách',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Hủy'),
                          ),
                          ElevatedButton(
                            onPressed: () =>
                                Navigator.pop(context, controller.text),
                            child: const Text('Thêm'),
                          ),
                        ],
                      );
                    },
                  );
                  if (newBookName != null && newBookName.trim().isNotEmpty) {
                    setState(() {
                      books.add(Book(name: newBookName.trim()));
                    });
                  }
                },
                child: const Text("Thêm"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Quản lý"),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "DS Sách",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Nhân viên"),
        ],
      ),
    );
  }
}
