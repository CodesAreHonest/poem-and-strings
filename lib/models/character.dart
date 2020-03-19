class Character {
  String character;
  bool selected;
  bool completed;
  int location;
  bool special = false;

  Character(this.character, this.selected, this.completed, this.location);

  void setSelected(bool selected) {
    this.selected = selected;
  }

  void setCharacter(String character) {
    this.character = character;
  }

  void setLocation(int location) {
    this.location = location;
  }

  void setCompleted(bool completed) {
    this.completed = completed;
  }

  void setSpecial(bool special) {
    this.special = special;
  }

  int getLocation() => this.location;

  String getCharacter() => this.character;

  bool getSelected() => this.selected;

  bool getCompleted() => this.completed;

  bool getSpecial() => this.special;
}
