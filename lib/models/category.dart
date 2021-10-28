class Category {
  int id;
  String url;
  String name;
  int question;
  int answers;

  Category(this.id, this.name, this.answers, this.question, this.url);
}

final List<Category> categories = [
  Category(9, "Activities & Event", 33, 152, ""),
  Category(10, "Choices",0,65,""),
  Category(14, "Television",0,62,""),
  Category(15, "Video Games",0,63,""),
  Category(16, "Board Games",0,64,""),
  Category(17, "Science & Nature",0,60,""),
  Category(18, "Computer",0,67,""),
  Category(19, "Maths",0,69,""),
  Category(20, "Mythology",0,25,""),
// Category(21,"Sports", icon: FontAwesomeIcons.footballBall),
// Category(22,"Geography", icon: FontAwesomeIcons.mountain),
// Category(23,"History", icon: FontAwesomeIcons.monument),
// Category(24,"Politics"),
// Category(25,"Art", icon: FontAwesomeIcons.paintBrush),
// Category(26,"Celebrities"),
// Category(27,"Animals", icon: FontAwesomeIcons.dog),
// Category(28,"Vehicles", icon: FontAwesomeIcons.carAlt),
// Category(29,"Comics"),
// Category(30,"Gadgets", icon: FontAwesomeIcons.mobileAlt),
// Category(31,"Japanese Anime & Manga"),
// Category(32,"Cartoon & Animation")
];
