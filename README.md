# goeuro
GoEuro iOS mobile development task
============
![Language](https://img.shields.io/badge/language-objec%202-orange.svg)
![License](https://img.shields.io/badge/goeuro-testing-red.svg)



**Table of Contents**  
- [Goeuro iOS development task](#)
- [Required Task](#)
- [How to build](#)
- [Notices](#)
- [Screenshots](#)
- [Requirements](#)

# Required Task
Goeuro app assignment
Implement an autocompleting travel search form

On the form, the user is required to enter the start and end location and the date of their trip. The start and end location need to be automatically completed using a list of known locations that can be requested through a JSON API invocation. When displaying matches, they should be ordered by distance to the user's current location. Date entry should be facilitated by a date entry widget. A "search" button should be available when the form has been completely filled out. Tapping the "search" button should display a "Search is not yet implemented" message to the user.

**Note:**
Please implement your solution as an App that we can try out. For Android we need 4.4 compatibility or for iOS 8 compatibility. Also send us the source code to your solution. We use GitHub, so if you put your source code into a GitHub repository, it will make our life easy.


# How to build

1) Clone the repository
```bash
$ git clone https://github.com/digwey/goeuro.git
```

2) Install pods

```bash
$ cd FirstInterviewTask
$ pod install
```

3) Open the workspace in Xcode

```bash
$ open "FirstInterviewTask.xcworkspace"
```
4) Compile and run the app in your simulator or your iOS device

5) If you don't see any data, please check internet connection as the application doesn't check the connectivity status.


# Notices
The current version is working with Xcode Version 7.3. If you are using different Xcode version, please check out the previous versions.

# Screenshots
![Screenshot1]
(https://raw.githubusercontent.com/digwey/goeuro/master/screenshots/Screen Shot 2016-06-13 at 2.50.14 AM.png)
!
**Gif file using Xcode Emulator**
![Gif1]
(https://raw.githubusercontent.com/digwey/goeuro/master/screenshots/go_gif.gif)


# Requirements

* Xcode 7
* iOS 9
