# Godot Prototypes

This is a collection of simple Godot projects which will help you to kickstart your games.
The code is completely generic and simplyfied so you can easily use it in your games and specially in Game Jams.

Feel free to [open new issues](https://github.com/rteijeiro/Godot-Prototypes/issues) requesting anything special and I'll try to work on it.
You can always send a [Pull Request](https://github.com/rteijeiro/Godot-Prototypes/pulls) with your proposed game and I'll be glad to review it and integrate in the project.

This is a list of the games prototypes included:

## 2D

### [Shape Characters](https://github.com/rteijeiro/Godot-Prototypes/tree/main/2D/shape_characters)

<img src="/2D/media/shape_characters.png" alt="Shape Characters" width="830" />

Prototype for easily generate random characters giving a base character.
The different characters inherit properties from the base character makeing it easy to extend.

### [Shooter Platformer](https://github.com/rteijeiro/Godot-Prototypes/tree/main/2D/shooter_platformer)

<img src="/2D/media/shooter_platformer.gif" alt="Shooter Platformer" width="830" />

A simple platformer game protoype including a Character2D which can move left and right and jump.
It also includes a weapong that can be controlled with the mouse.
The weapong shoots projectiles which collide with the world environment and display the impact.

### [Shooting Gallery](https://github.com/rteijeiro/Godot-Prototypes/tree/main/2D/shooting_gallery)

<img src="/2D/media/shooting_gallery.gif" alt="Shooting Gallery" width="830" />

A simple prototype that generates targets which move horizontally with a random speed.
It allows to point and shoot with the mouse.

### [Side Racing](https://github.com/rteijeiro/Godot-Prototypes/tree/main/2D/side_racing)

<img src="/2D/media/side_racing.gif" alt="Side Racing" width="830" />

Simple racing game which simulates horizontal movement using Parallax2D.
It automatically generates random cars which are instantiated on the road as obstacles.
The car slows down when colliding with other cars.

### [Side Tanks](https://github.com/rteijeiro/Godot-Prototypes/tree/main/2D/side_tanks)

<img src="/2D/media/side_tanks.gif" alt="Side Tanks" width="830" />

Prototype which allows to move a tank horizontally and aim its turrent 90 degrees.
A Line2D is generated representing the projectile trajectory when holding the left mouse button.
When the left mouse button is released a projectile is shooted and it explodes when colliding.

### [Space Shooter](https://github.com/rteijeiro/Godot-Prototypes/tree/main/2D/space_shooter)

<img src="/2D/media/space_shooter.gif" alt="Space Shooter" width="830" />

Simple space shooter game prototype similar to the famous Asteroids.
It allows to move a space ship using a smooth movement and rotation.
The space ship shoots laser beams when pressing space.
Asteroids are randomly generated floating across the screen with different speeds.

### [Tappy Plane](https://github.com/rteijeiro/Godot-Prototypes/tree/main/2D/tappy_plane)

<img src="/2D/media/tappy_plane.gif" alt="Tappy Plane" width="830" />

A clone of the famous Flappy Bird game.
The plane flies up when the left mouse button is pressed and flies down when it's released.
Random rocks are generated up and down which make the plane crash when colliding.

### [Tower Defense](https://github.com/rteijeiro/Godot-Prototypes/tree/main/2D/tower_defense)

<img src="/2D/media/tower_defense.gif" alt="Tower Defense" width="830" />

Tower Defense game prototype which allows you to position a new tower holding the left mouse button
and create it releasing the mouse button. The towers automatically shoot at the soldiers which are
spawned using a timer and follow a path using Path2D and PathFollow2D nodes.

### [Vampire Survivor](https://github.com/rteijeiro/Godot-Prototypes/tree/main/2D/vampire_survivor)

<img src="/2D/media/vampire_survivor.gif" alt="Vampire Survivor" width="830" />

Prototype of a simple Vampire Survivor game clone.
The player can move horizontally and vertically in a top-down perspective.
The mouse allows to aim rotating the player and shoot when pressing the left mouse button.
Zombies are randomly generated around the screen moving to the player position.

## 3D

(Coming soon!)

## Multiplayer

(Coming soon!)
