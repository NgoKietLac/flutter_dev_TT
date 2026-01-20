import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Hồ Sơ Của Tôi"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Color(0xFF0D253F),
                child: Icon(Icons.person, size: 80, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Nguyễn Đăng Thuận",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text("NuoiToi@gmail.com"),
            // card Thống kê tài chính
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.fromLTRB(50, 20, 50, 30),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                ),
                borderRadius: BorderRadius.circular(20),
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
                    "Tổng Quan Tài Chính",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1),
                    child: Divider(color: Colors.white24, thickness: 1),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Đã Chi: ",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            "1.1M",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 50, // Bạn tự định nghĩa chiều cao tại đây
                        width: 1,
                        color: Colors.white24,
                      ),
                      Column(
                        children: [
                          Text(
                            "Số Dư:",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            "490K",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Thông tin Cài Đặt
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  MenuItem(iconData: Icons.person, title: "Thông tin cá nhân"),
                  MenuItem(iconData: Icons.settings, title: "Cài đặt ứng dụng"),
                  MenuItem(iconData: Icons.history, title: "Lịch Sử Giao Dịch"),
                  MenuItem(iconData: Icons.logout, title: "Đăng Xuất"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.iconData, required this.title});
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}
