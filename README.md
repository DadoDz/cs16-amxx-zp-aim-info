# [ZP] Aim Info

A simple aim information plugin for **Zombie Plague** servers in **Counter-Strike 1.6**.
The plugin displays real-time HUD information about the player you are aiming at, including name, class, health, and armor.

## Plugin Information

  - **Name**: [ZP] Aim Info
  - **Version**: 1.0
  - **Author**: DadoDz
  - **Game**: Counter-Strike 1.6
  - **Mod**: Zombie Plague

## Requirements

- AMX Mod X **1.9+**
- Zombie Plague Mod

## Installation
1. Place ```add_commas.inc``` in: **addons/amxmodx/scripting/include/zombie_plague**
2. Place ```zp_aim_info.sma``` in: **addons/amxmodx/scripting/**
3. Compile it with your AMXX compiler.
4. Place the compiled .amxx file in: **addons/amxmodx/plugins/**
5. Add this line to your plugins.ini: ```zp_aim_info.amxx```
6. Restart your server.

## Required Natives
This plugin uses custom natives, you must change these natives based on your zombie plague version.
- ```native zp_get_user_zombie(index)```
- ```native zp_get_user_zombie_classname(index, classname[], len);```

## Notice
> This plugin was originally created for my own server.
The concept already exists and I do not claim the original idea.
I previously saw similar aim info systems and decided to recreate my own lightweight implementation adapted for Zombie Plague servers.
