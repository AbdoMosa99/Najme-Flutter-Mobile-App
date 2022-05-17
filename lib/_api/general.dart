final List<String> levelsList = [
  'KG1',
  'KG2'
];

final List<String> countriesList = [
  "القاهرة",
  "الجيزة", 
  "الشرقية", 
  "الدقهلية", 
  "البحيرة",
  "المنيا", 
  "القليوبية", 
  "الإسكندرية", 
  "الغربية",
  "سوهاج", 
  "أسيوط", 
  "المنوفية", 
  "كفر الشيخ", 
  "الفيوم", 
  "قنا",
  "بني سويف", 
  "أسوان", 
  "دمياط",
  "الإسماعيلية", 
  "الأقصر", 
  "بور سعيد", 
  "السويس",
  "مطروح", 
  "شمال سيناء", 
  "البحر الاحمر", 
  "الوادي الجديد", 
  "جنوب سيناء",
];

Future<List> cities_api() 
async {

  return countriesList;
}

Future<List> levels_api() async {
  
  return levelsList;
}