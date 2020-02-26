# Camera subnet fixer for the Vistek cameras

## Current issue
After start some devices have the wrong subnet. Changing this is manual labor and has to be automated.

## Projected solution
exe with hotkey, which will
* start SVCapture
* select the current camera (device discovery)
* click the "ok" button in the menu
* press "ok" for the "Camera unreachable dialog"
* Press "Automatic" in "Force IP adress"-dialog
* wait two seconds (to check if images can be fetched from the camera)
* closes SVCapture
