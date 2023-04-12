class Meal {
  final String id;
  final String title;
  final List<String> imageUrls;
  final String description;
  final int preparingTime;
  final double price;
  final List<String> ingredients;
  final String categoryId;
  // bool islike;

  Meal({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.categoryId,
    required this.price,
    required this.preparingTime,
    required this.ingredients,
    // this.islike = false,
  });
}

class Meals {
  List<Meal> _list = [
    Meal(
        id: "m1",
        title: "lavash",
        description: "Ajoyib lavash",
        imageUrls: [
          'assets/image/lavash1.jpg',
          'assets/image/lavash2.jpg',
          'assets/image/lavash3.jpg',
          'assets/image/lavash4.jpg'
        ],
        categoryId: "c5",
        price: 11,
        ingredients: [
          "go'sht",
          "pomidor",
          "bodirng",
          "sir",
        ],
        preparingTime: 16),
    Meal(
        id: "m2",
        title: "Burger",
        description: "Ajyib va Mazali tuyimli burger",
        imageUrls: [
          'assets/image/burger1.jpg',
          'assets/image/burger2.jpg',
          'assets/image/burger3.jpg',
          'assets/image/burger4.jpg',
        ],
        categoryId: "c5",
        ingredients: [
          "go'shtli katlet",
          "karam",
          "pomidor",
          "bodirng",
          "sir",
        ],
        price: 20,
        preparingTime: 8),
    Meal(
        id: "m3",
        title: "Osh",
        description: """Kerakli massalliqlar:
             \n- 500 gr pirjizlanmagan gosht 
             \n- 2 ta qovoq sabzi (sabzi, qovun, qizil sabzi) 
             \n- 2 ta piyoz \n- 2-3 ta pomidor \n- 2 ta murch 
             \n- 1 xarorat qoshi \n - 3-4 zirishniq tuxum \
             n- Zirishniq yoki choy suvi (tayyorlanish usuli ko'rsatilgan)
             \n- Qalampir (tayyorlanish usuli ko'rsatilgan) 
             \n- Tuz va zira \n
              \nTayyorlash usuli: 
   
   \n 1. Goshtni toza suvda yuvib, suvini olib tashlang. 
    \n2. Piyozi to\'g\'ri to\'rtburchak shaklida kesing. 
    \n3. Pomidorlarni kichkina parcalarga kesing. 
    \n4. Murchlarni uzunlashgan holda kesing. 
    \n5. Qalampirni yuvib, tuxumlarni solib tashlang.
     \n6. Palov piyozda kuydirilib, gosht qo'shiladi va rangi oq-qora bo'lishiga qadar qaynatiladi. 
     \n7. Sabzilar kiyim chiqarib palovga qo\'shiladi va bir necha minut davomida pishiriladi. 
     \n8. Tuxum va qoshi ham palovga solib, pastki og\'i bilan bir necha minut pishiriladi.
     \n9. Choy suvi yoki zirishniq suvi qo\'shiladi, tuz va zira qo\'shiladi va choy suvi oq bo\'lishiga qadar pishiriladi.
      \n10. Palovga qalampir solib, pastki og'i bilan bir necha minut davomida pishiriladi, keyin palov tovushini eslatib,
       \n20-25 daqiqa davomida xamri oq-yo'q qilib tayyorlanadi. \nPalov servis qilinadigan paytda zirishniq tuxumlarini va qoshi ni ham damlalab ustidan joylashtirish mumkin.""",
        imageUrls: [
          'assets/image/osh1.jpg',
          'assets/image/osh2.jpg',
          'assets/image/osh3.jpg',
          'assets/image/osh4.jpg',
          'assets/image/osh5.jpg',
        ],
        categoryId: "c2",
        ingredients: [
          "Guruch",
          "Sabzi",
          "nuxat",
          "mayiz",
          "gosht",
          "Sarimsoq",
          "piyoz"
        ],
        price: 22,
        preparingTime: 26),
    Meal(
        id: "m4",
        title: "Coca Cola",
        description: "Juda shirin va Energitk ichimlklar",
        ingredients: ["Suv"],
        imageUrls: [
          'assets/image/sc2.jpg',
          'assets/image/sc3.jpg',
        ],
        categoryId: "c4",
        price: 32,
        preparingTime: 2),
    Meal(
        id: "m5",
        title: "Pitsa ",
        description: "Yoqimlin va tuyimli",
        imageUrls: [
          'assets/image/p1.jpg',
          'assets/image/p2.jpg',
          'assets/image/p3.jpg',
        ],
        categoryId: "c1",
        ingredients: [
          "go'sht",
          "pomidor",
          " bodirng",
          "sir",
        ],
        price: 16,
        preparingTime: 18),
    Meal(
        id: "m6",
        title: "Salat ",
        description: "Bahor salati",
        ingredients: [
          "Pamidor",
          "bodiring",
          "sabzi",
          "ziravorlar",
        ],
        imageUrls: [
          'assets/image/salad1.jpg',
          'assets/image/salad2.jpg',
          'assets/image/salad3.jpg',
          'assets/image/salad4.jpg',
          'assets/image/salad5.jpg',
        ],
        categoryId: "c3",
        price: 9,
        preparingTime: 6),
    Meal(
        id: "m7",
        title: "Shirinliklar ",
        description: "Mazali va Mevali shirinliklar ",
        imageUrls: [
          'assets/image/sh3.jpg',
          'assets/image/sh1.jpg',
          'assets/image/sh2.jpg',
          'assets/image/sh4.jpg',
        ],
        categoryId: "c6",
        ingredients: [
          "tuxum",
          "qaymoq",
          "meva",
          "limon",
          "sharbati",
          "saryoq",
        ],
        price: 26,
        preparingTime: 8),
    Meal(
        id: "m8",
        title: "Pepsi ",
        description: " Mazali suv",
        imageUrls: [
          'assets/image/sp1.jpg',
          'assets/image/sp2.jpg',
          'assets/image/sp3.jpg',
          'assets/image/sp4.jpg',
        ],
        categoryId: "c4",
        price: 10,
        ingredients: ["Suv"],
        preparingTime: 2),
    Meal(
        id: "m9",
        title: "Mevali Shirinliklar ",
        description: "Mazali va Mevali shirinliklar ",
        imageUrls: [
          'assets/image/wirins1.jpg',
          'assets/image/wirins2.jpg',
          'assets/image/wirins3.jpg',
          'assets/image/wirins4.jpg',
        ],
        categoryId: "c6",
        price: 26,
        ingredients: [
          "qaymoq",
          "sut",
          "saryog",
          "maloko",
        ],
        preparingTime: 8),
  ];

  List<Meal> _favorites = [];

  List<Meal> get list {
    return _list;
  }

  List<Meal> get favorites {
    return _favorites;
  }

  void toggleLike(String mealId) {
    final mealIndex = _favorites.indexWhere((meal) => meal.id == mealId);
    if (mealIndex < 0) {
      _favorites.add(list.firstWhere((meal) => meal.id == mealId));
    } else {
      _favorites.removeWhere((meal) => meal.id == mealId);
    }
  }

  void addNewMeal(Meal meal) {
    _list.add(meal);
  }

  void deletedMeal(String id) {
    _list.removeWhere((meal) => meal.id == id);
  }
}
