import 'dart:math';
import 'package:flame/components.dart';
import 'package:najme/games/dino_game/game/dino_run.dart';
import 'package:najme/games/dino_game/game/friend.dart';
import 'package:najme/games/dino_game/models/friend_data.dart';

// This class is responsible for spawning random enemies at certain
// interval of time depending upon players current score.
class FriendManager extends Component with HasGameRef<DinoRun> {
  // A list to hold data for all the enemies.
  // final List _data = [];
  final List<FriendData> _dataf = [];
  // Random generator required for randomly selecting enemy type.
  final Random _random = Random();

  // Timer to decide when to spawn next enemy.
  final Timer _timer = Timer(3.5, repeat: true);

  FriendManager() {
    _timer.onTick = spawnRandomFriend;
  }

  // This method is responsible for spawning a random enemy.
  void spawnRandomFriend() {
    /// Generate a random index within [_data] and get an [EnemyData].
    final randomIndex = _random.nextInt(_dataf.length);
    final friendData = _dataf.elementAt(randomIndex);
    final friend = Friend(friendData);
    

    // Help in setting all enemies on ground.
    friend.anchor = Anchor.bottomLeft;
    friend.position = Vector2(
      gameRef.size.x + 32,
      gameRef.size.y - 24,
    );

    // If this enemy can fly, set its y position randomly.
    if (friendData.canFly) {
      final newHeight = _random.nextDouble() * 2 * friendData.textureSize.y;
      friend.position.y -= newHeight;
    }

    // Due to the size of our viewport, we can
    // use textureSize as size for the components.
    friend.size = friendData.textureSize;
    gameRef.add(friend);
  }

  @override
  void onMount() {
    
    if (isMounted) {
      shouldRemove = false;
    }

    // Don't fill list again and again on every mount.
    if (_dataf.isEmpty) {
      // As soon as this component is mounted, initilize all the data.
      _dataf.addAll([
        FriendData(
          image: gameRef.images.fromCache('AngryPig/a.png'),
          nFrames: 16,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          speedX: 100,
          canFly: false,
        ),
        FriendData(
          image: gameRef.images.fromCache('AngryPig/letter-a (1).png'),
          nFrames: 16,
          stepTime: 0.1,
          textureSize: Vector2(32,32),
          speedX: 110,
          canFly: false,
        ),
        FriendData(
          image: gameRef.images.fromCache('AngryPig/a2.png'),
          nFrames: 16,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          speedX: 110,
          canFly: true,
        ),
      ]);
    }
    _timer.start();
    super.onMount();
  }

  @override
  void update(double dt) {
    _timer.update(dt);
    super.update(dt);
  }

  void removeAllFriends() {
    final friends = gameRef.children.whereType<Friend>();
    for (var friend in friends) {
      friend.removeFromParent();
    }
  }
}
