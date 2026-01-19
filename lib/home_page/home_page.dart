import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page/infor_widget.dart';
import 'package:flutter_application_1/home_page/model_data.dart';
import 'package:flutter_application_1/home_page/response_data.dart';
import 'package:flutter_application_1/home_page/why_give_me_widget.dart';
import 'package:flutter_application_1/list_page/list_page.dart';
import 'package:flutter_application_1/profile_page/profile_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ModelData> cardData = ResponseData().getData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: Colors.transparent, //transparent màu trong suốt
        elevation: 0, // không đổ bóng
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Chào Bạn!👋", style: TextStyle(fontSize: 18)),
            Text(
              "Nuôi Tôi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                child: Icon(Icons.person, size: 35),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //card kê khai
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2575FC).withValues(alpha: 0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Tổng đã nhận được",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "590.250 đ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(color: Colors.white24, thickness: 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // cột thu
                      Column(
                        children: [
                          Text(
                            "Thu",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "590k",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      // Cột chi
                      Column(
                        children: [
                          Text(
                            "Chi",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "1.1M",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      // cột còn lại
                      Column(
                        children: [
                          Text(
                            "Còn lại",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "490k",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //thanh tiến trình
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mục Tiêu Tháng",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  SizedBox(height: 20),
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    value: 0.6,
                    minHeight: 8,
                    backgroundColor: Color(0xFFF0F0F0),
                  ),
                ],
              ),
            ),
            // tiêu đề card whyGiveMeMoney
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 20, 15),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Tại Sao Nên Nuôi Tôi ?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: cardData.map((data) {
                return WhyGiveMeWidget(modelData: data);
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                height: 160,
                autoPlayInterval: Duration(seconds: 5),
                enlargeFactor: 0.5,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2563EB),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ListPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Xem Sao Kê Chi Tiết",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
