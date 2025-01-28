#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

// Configuration
const LIGHT_START = 7;  // 7 AM
const LIGHT_END = 17;   // 6 PM
const CONFIG_PATH = '/home/vladleontescu/dotfiles/alacritty/alacritty.toml';
const LIGHT_THEME = './themes/themes/github_light_colorblind.toml';
const DARK_THEME = './themes/themes/everforest_dark.toml';

// Get current hour
const currentHour = new Date().getHours();

// Choose theme based on time
const theme = (currentHour >= LIGHT_START && currentHour < LIGHT_END) 
    ? LIGHT_THEME 
    : DARK_THEME;

try {
    // Read the config file
    let config = fs.readFileSync(CONFIG_PATH, 'utf8');
    
    // Replace the import line
    config = config.replace(
        /^import\s*=\s*\[.*\]/m,
        `import = ["${theme}"]`
    );
    
    // Write the updated config
    fs.writeFileSync(CONFIG_PATH, config);
    
} catch (error) {
    console.error('Error updating Alacritty config:', error);
}