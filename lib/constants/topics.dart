// Topics
class Gats{
  static const String shishu = "शिशु गट";
  static const String bal1 = "बाल गट-1";
  static const String bal2 = "बाल गट-2";
}

class TopicsShishu{
  static const String sub1 = "संस्कार व स्वास्थ्य";
  static const String sub2 = "शारीरिक एवं हस्तशिल्प";
  static const String sub3 = "भाषा, गणित एवं सामान्य ज्ञान विज्ञान";
}

class TopicsBal1{
  static const String sub1 = "संस्कार शिक्षा";
  static const String sub2 = "स्वास्थ्य शिक्षा";
  static const String sub3 = "शारीरिक शिक्षा";
  static const String sub4 = "हस्तशिल्प (सृजन)";
  static const String sub5 = "भाषा";
  static const String sub6 = "गणित";
  static const String sub7 = "सामान्य ज्ञान विज्ञान";
}

class TopicsBal2{
  static const String sub1 = "संस्कार शिक्षा";
  static const String sub2 = "स्वास्थ्य शिक्षा";
  static const String sub3 = "शारीरिक शिक्षा";
  static const String sub4 = "हस्तशिल्प (सृजन)";
  static const String sub5 = "भाषा ज्ञान";
  static const String sub6 = "गणित";
  static const String sub7 = "सामान्य ज्ञान विज्ञान";
}

class Topics{
  static const Map<String, dynamic> items = {
    Gats.shishu: ["Select Topic", TopicsShishu.sub1, TopicsShishu.sub2, TopicsShishu.sub3],
    Gats.bal1: ["Select Topic", TopicsBal1.sub1, TopicsBal1.sub2, TopicsBal1.sub3, TopicsBal1.sub4, TopicsBal1.sub5, TopicsBal1.sub6, TopicsBal1.sub7],
    Gats.bal2: ["Select Topic", TopicsBal2.sub1, TopicsBal2.sub2, TopicsBal2.sub3, TopicsBal2.sub4, TopicsBal2.sub5, TopicsBal2.sub6, TopicsBal2.sub7],
  };
}