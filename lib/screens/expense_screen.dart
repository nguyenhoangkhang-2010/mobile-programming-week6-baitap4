import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../database/db_helper.dart';

class ExpenseScreen extends StatefulWidget {
  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List<Expense> danhSach = [];

  final noiDungCtrl = TextEditingController();
  final soTienCtrl = TextEditingController();
  final ghiChuCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    danhSach = await DBHelper.instance.getAll();
    setState(() {});
  }

  void them() async {
    final expense = Expense(
      noiDung: noiDungCtrl.text,
      soTien: double.tryParse(soTienCtrl.text) ?? 0,
      ghiChu: ghiChuCtrl.text,
    );

    await DBHelper.instance.insert(expense);
    loadData();

    noiDungCtrl.clear();
    soTienCtrl.clear();
    ghiChuCtrl.clear();
  }

  void xoa(int id) async {
    await DBHelper.instance.delete(id);
    loadData();
  }

  double tongTien() {
    return danhSach.fold(0, (sum, e) => sum + e.soTien);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chi tiêu")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(controller: noiDungCtrl, decoration: InputDecoration(labelText: "Nội dung")),
            TextField(controller: soTienCtrl, decoration: InputDecoration(labelText: "Số tiền"), keyboardType: TextInputType.number),
            TextField(controller: ghiChuCtrl, decoration: InputDecoration(labelText: "Ghi chú")),

            ElevatedButton(onPressed: them, child: Text("Thêm")),

            Text("Tổng: ${tongTien()} VND"),

            Expanded(
              child: ListView.builder(
                itemCount: danhSach.length,
                itemBuilder: (context, index) {
                  final e = danhSach[index];
                  return ListTile(
                    title: Text(e.noiDung),
                    subtitle: Text("${e.soTien} - ${e.ghiChu}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => xoa(e.id!),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}