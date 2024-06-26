# foodapp_new

# 1. Asynchronus Porgramming
Pada aplikasi ini, pemrograman asynchronus digunakan ketika data dari api dipanggil ke tampilan
![image](https://github.com/Adyatmaa/food-app-new/assets/139423303/ae346643-9151-48dc-81a8-1549f082c570)
Data yang dipanggil tidak langsung tampil pada halaman, tetapi data akan berjalan dibalik layar 
![image](https://github.com/Adyatmaa/food-app-new/assets/139423303/e400cbf1-2e2d-47b5-8447-411b304d045d)


# 2. Shared Preferences
Pada aplikasi ini, shared preference digunakan untuk menymipan nilai boolean yang akan digunakan untuk key pada tema aplikasi yang digunakan. Ketika user memilih tema gelap, maka aplikasi akan menampilkan tema gelap. Tema tersebut akan disimpan pada boolean yang disimpan pada shared preferences. Jadi ketika aplikasi ditutup kemudian dibuka kembali, tema yang akan tampil adalah tema gelap.
Berikut adalah tampilan dari tema gelap dan terang.
![Screenshot_1714581762](https://github.com/Adyatmaa/food-app-new/assets/139423303/16fe4373-1896-4d53-a289-d10d4f41e6ce)
![Screenshot_1714581785](https://github.com/Adyatmaa/food-app-new/assets/139423303/88e5c941-0817-4575-8c54-bc2137826f8d)


# 3. SQF Lite
Pada aplikasi ini, SQF LIte digunakan untuk menyimpan makanan favorit yang diambiln dari API. Ketika user memilih makanan yang disukai atau di favoritkan, aplikasi akan menyimpan makanan tersebut pada database lokal menggunakan SQF Lite. User kemudian bisa melihat makanan yang di favoritkan pada halaman bookmark.
![image](https://github.com/Adyatmaa/food-app-new/assets/139423303/4997303e-4a9c-46f0-a0f0-e6000da0123d)

Berikut adalah halaman bookmark makanan.
![Screenshot_1714581785](https://github.com/Adyatmaa/food-app-new/assets/139423303/68ae6684-c803-4ee2-8d06-923f6d07ecd5)



Paket yang digunakan
cupertino_icons: ^1.0.6
http: ^1.2.1 
google_fonts: ^6.2.1 
flutter_feather_icons: ^2.0.0+1
sqflite: ^2.3.3
shared_preferences: ^2.2.3
path: ^1.9.0

API yang digunakan
https://www.themealdb.com/api.php 

