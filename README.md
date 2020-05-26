Poem and Strings
================
> My first mobile application playground that attempt to gain exposure on Flutter's SDK, expressive and flexible Material's API, understand the concept of Reactive Programming with Dart's programming language and it's CLI to perform build and release to an Android application.

Table Of Contents 
=================

  * [About This Project](#about-this-project)
  * [Motivation](#motivation)
  * [Technical Discussion](#technical-discussion)
  * [Getting Started](#getting-started)
    * [Installation](#installation)
  * [Tools and Technologies](#tool-and-technologies)
  * [About](#about)
    * [Author](#author)
    * [License](#license)


Motivation
========== 
Poem and Strings is an Game-based learning application **that help recite ancient poems correctly and understand the content and creative background of ancient poems**. Player is required to complete the game by rearrange the characters initialize in wrong orders intocorrect sequences to form a poem within a given amount of steps based on the stage difficulty. Player can use hints in order to assist on rearrange the poems. 

Upon complete the stage, player can understand the meaning of the full poems, background stories of the poems with Youtube videos. The application attempts to help student acquire desired chinese poem knowledge through **meaning to action**. 

Technical Discussion
====================

The project *pub package manager* to integrate game background musics and Youtube videos to improve the game experiences and interaction. Material design system and it's component are widely use throughout the containers and components to build an consistent user interface. Last but not least, Redux is selected and implemented into the architecture to manage the global store within the application. 

Getting Started
===============

Installation
------------
1. Clone the repository
```git
git clone https://github.com/CodesAreHonest/poem-and-strings.git
```

2. Fetch all the packages into the directory
```pub
flutter pub get
```

3. Show the information and verify the status about the installed tooling
```pub
flutter doctor
```

4. Run the flutter application in debug mode
```pub
flutter run
```

Tools and Technologies
======================
1. Linux Ubuntu 20.04 LTS (Focal Fossa) AMD64 Desktop OS
2. Flutter 1.17.1 SDK
3. Dart 2.8.2 Programming Language

About
=====

Application available in play store:    
https://play.google.com/store/apps/details?id=com.yinghua.poem_and_strings

Author
-----------
- **Yinghua Chai**

License
-------
This project does not contain any license.
