# Color Blocks Game 🎮

A fun and addictive puzzle game built with Godot where players place colored blocks on an 8×8 grid to clear rows and columns.

## Game Overview

**Grid Size:** 8×8  
**Main Goal:** Place blocks to complete rows and columns for points!

### How to Play
1. You get 3 random blocks at a time
2. Drag and drop blocks onto the grid
3. Complete a full row or column to clear it
4. Build combos for bonus points
5. Game ends when no blocks can fit

---

## Features

### ✅ Must-Have Features (Version 1.0)

#### 1. Grid System
- 8×8 empty grid with clear cell visualization
- Distinct appearance for empty vs filled cells

#### 2. Block System
- 3 random blocks displayed simultaneously
- Multiple shapes: Square, Rectangle, L-shape, Line
- Different colors for each block

#### 3. Placement Mechanics
- Drag and drop block placement
- Ghost preview before placement (optional)
- Blocks can only be placed on empty cells

#### 4. Clearing System
- Automatic row clearing when complete
- Automatic column clearing when complete
- Smooth disappearance animation

#### 5. Score System
- Points awarded for each cleared row/column
- Basic scoring: 10 points per row/column

#### 6. Combo System
- Track consecutive clears
- Display combo counter on screen
- Bonus points based on combo multiplier

#### 7. Game Over
- Game ends when no current block can be placed
- Game Over screen with final score
- Restart button to play again

#### 8. Basic UI
- Score display
- Combo counter
- Restart button
- Current 3 blocks preview

---

### 🚀 Future Features (Later Versions)

- [ ] Sound effects and music
- [ ] Clear animations and particle effects
- [ ] High score saving and leaderboard
- [ ] Multiple themes/skins
- [ ] Daily challenges
- [ ] Ads integration
- [ ] Power-ups
- [ ] Different difficulty levels

---

## Project Structure

```
color-blocks-game/
├── scenes/
│   ├── game/
│   │   ├── GameScene.tscn
│   │   └── Grid.tscn
│   ├── ui/
│   │   ├── MainMenu.tscn
│   │   ├── GameUI.tscn
│   │   └── GameOverScreen.tscn
│   └── blocks/
│       ├── Block.tscn
│       └── BlockPreview.tscn
├── scripts/
│   ├── game/
│   │   ├── GameManager.gd
│   │   └── GridManager.gd
│   ├── blocks/
│   │   ├── Block.gd
│   │   └── BlockSpawner.gd
│   ├── ui/
│   │   ├── UIManager.gd
│   │   └── GameOverScreen.gd
│   └── systems/
│       ├── ScoreManager.gd
│       ├── ComboManager.gd
│       └── InputManager.gd
├── assets/
│   ├── sprites/
│   ├── sounds/
│   └── fonts/
├── .gitignore
├── project.godot
└── README.md
```

---

## Getting Started

### Prerequisites
- Godot 4.x or higher
- Git

### Installation
1. Clone the repository
   ```bash
   git clone https://github.com/fakrushaikh/color-blocks-game.git
   cd color-blocks-game
   ```

2. Open in Godot
   - Launch Godot
   - Import and open the project

3. Run the game
   - Press `F5` or click the Play button

---

## Development Roadmap

### Phase 1: Core Systems
- [ ] Grid System
- [ ] Block System & Shapes
- [ ] Block Placement Mechanics
- [ ] Clearing Logic

### Phase 2: Game Logic
- [ ] Score System
- [ ] Combo System
- [ ] Game Over Detection

### Phase 3: Polish
- [ ] UI & Menus
- [ ] Visual Improvements
- [ ] Animations

### Phase 4: Enhancement
- [ ] Sound Effects
- [ ] High Score Saving
- [ ] Additional Features

---

## Contributing

Contributions are welcome! Feel free to fork this project and submit pull requests.

---

## License

This project is open source and available under the MIT License.

---

## Author

Created by **@fakrushaikh**

---

**Happy Coding! 🚀**
