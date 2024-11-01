#Finance News App
An app targeted at getting news related to finance

##App Features
App Features:

* Splash
* Login
* Dashboard
* Routing
* Theme
* Http(For making network calls)
* Database(Sqflite)
* GetX(State Management)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we are using in this project

```
lib/
|- core/
|- style/
|- nav/
|- ui/
|- main.dart
```

### Dependency Injection(DI)
Contains all our Dependency Injection logic which is built up at run-time, it is sub-module into
different packages by functionality.

```
app/
    |- locator.dart

```

### Views
This directory contains all the ui of your application. All the screen specific
widgets will be placed in `widgets` directory as shown in the example below:

```
ui/
|- widget
   |- custom_textfield.dart
   

|- views/
    |- login_view.dart

```

### Styles
Contains common files like colors, theme and dimensions used all around the projects

### Models
Contains Model classes like custom exceptions, server error models and a custom state class

### Routes
This file contains all the routes for our application.

### Main
This is the starting point of the application. All the application level configurations are defined
in this file i.e, theme, routes, title, orientation etc.

### ScreenShots
