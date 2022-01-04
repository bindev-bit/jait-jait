class CategoryModel {
  String? icon, title;

  CategoryModel({this.icon, this.title});
}

List<CategoryModel> listCategory = [
  CategoryModel(
    icon: 'assets/icon/design.png',
    title: 'Design',
  ),
  CategoryModel(
    icon: 'assets/icon/konveksi.png',
    title: 'Konveksi',
  ),
  CategoryModel(
    icon: 'assets/icon/modiste.png',
    title: 'Modiste',
  ),
  CategoryModel(
    icon: 'assets/icon/repair.png',
    title: 'Repair',
  ),
  CategoryModel(
    icon: 'assets/icon/shops.png',
    title: 'Shops',
  ),
  CategoryModel(
    icon: 'assets/icon/tailor.png',
    title: 'Tailor',
  ),
];
