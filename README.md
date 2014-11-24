#Ghoul
Ghoul is a simple GUI-based environmental variable manager.

###Usage
It writes to `~/.ghoul_profile` 
It also detects if the file is being sourced in `~/.profile`. If not, it adds it.

###Development requirements: 

- OSX
- JRuby
- Shoes4 gem

To run from command line:
`ruby -J-XstartOnFirstThread app.rb`