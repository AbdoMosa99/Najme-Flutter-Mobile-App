
class Settings {
  bool bgMusic;
  bool sounds;
  bool notifications;
  bool vibration;

  Settings({
    this.bgMusic = true,
    this.sounds = true,
    this.notifications = true,
    this.vibration = false,
  });
}
