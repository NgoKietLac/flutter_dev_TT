import 'package:flutter_application_1/home_page/model_data.dart';

class ResponseData {
  List<ModelData> getData() {
    return [
      ModelData(
        title: "Sao Kê Realtime",
        description:
            "Cập nhật từng giây! Còn nhanh hơn cả tốc độ bạn chuyển tiền!",
        icon: "📊",
      ),
      ModelData(
        title: "Minh Bạch 300%",
        description: "Hơn cả 100%! Tôi còn báo cáo cả việc mua ly trà sữa!",
        icon: "🔍",
      ),
      ModelData(
        title: "Chi Tiêu Hợp lý",
        description: "Không mua xe hơi, nhà cửa. Chỉ ăn cơm với mì tôm!",
        icon: "💸",
      ),
      ModelData(
        title: "AppTracking",
        description:
            "Theo dõi 24/7 tôi ăn gì,uống gì, đi đâu. Như Big Brother vậy!",
        icon: "📱",
      ),
    ];
  }
}
