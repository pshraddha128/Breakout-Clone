# Breakout-Clone


This repository contains the source code for a Breakout game implemented in Lua using the Love2D framework. The game is based on the classic Breakout arcade game where the player controls a paddle to bounce a ball and break bricks.

## Prerequisites
Love2D must be installed to run the game. Follow the Love2D installation instructions for your operating system.

## Overview
### File Structure
- main.lua: The entry point of the application, includes game setup, initialization, and the Love2D main loop.
- States/: Contains Lua files defining different game states used by the state machine.
- fonts/: Contains font files for text rendering.
- graphics/: Contains image files for game assets.
- sounds/: Directory containing sound files used in the game.
- lib/: Contains Lua libraries used in the game.

### Features
- Paddle and Ball Movement: Control the paddle to bounce the ball and break bricks.
- Collision Detection: Implements collision detection between the ball, paddle, and bricks.
- Score Tracking: The game keeps track of the player's score.
- Health System: Player has three lives represented by hearts.
- Sound Effects: Various sound effects enhance the gaming experience.

## Controls
- Left Arrow: Move the paddle left.
- Right Arrow: Move the paddle right.
- Spacebar: Launch the ball.

## How to Play
- Use the left and right arrow keys to move the paddle.
- Launch the ball by pressing the spacebar.
- Break all the bricks by bouncing the ball with the paddle.
- Avoid letting the ball fall below the paddle to prevent losing a life.


