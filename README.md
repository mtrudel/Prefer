# Prefer 

Prefer is a droplet-esque OS X app that does one thing; write preferences. Essentially, Prefer lets you use .plist files the same way .reg files are used in Windows. You build a .plist file that contains the preferences you want to set, and Prefer will set them for you when it opens the file

## Merging vs. replacing

Prefer merges settings by default. That is, where settings A and B exist for an application, running a property list which sets properties A' and C will leave the application with settings A', B, and C. If you do actually want a plist to nullify a setting, you can do so by leaving the right hand side of the preference empty in the plist file. 
