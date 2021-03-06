## blizzard_demo

A demo application to show the use of various techniques, including:
- Local and external assets
- Packages
- API requests
- Managing state
- Dogs

### Reflection
To focus on the idea of controlling lights, I made one page a simple color picker. Color picker 
packages already exist, but I wanted to use this as an opportunity to learn. It helped me gain
experience with different color models. Notably, LED lighting is controlled by RGB channels, but 
creating a realistic spectrum is difficult with RGB. I used HSV instead to create the gradient
of available colors, which could later be converted to RGB to access each channel.

I've been wanting to try a neumorphic UI design for a while now, and the
[flutter_neumorphic](https://pub.dev/packages/flutter_neumorphic) package made it easy to try out.
It was fun working in a new style, especially since I wouldn't use it in a more serious project
due to its issues with accessibility.

### Packages
- [Dart http](https://pub.dev/packages/http)
- [Flutter Spinkit](https://pub.dev/packages/flutter_spinkit)
- [Flutter url_launcher](https://pub.dev/packages/url_launcher)
- [flutter_neumorphic](https://pub.dev/packages/flutter_neumorphic)

### Resources
- Icon by [Freepik](https://www.freekpik.com)
- Neumorphism library courtesy of [idean](www.idean.com)
- Dog images from the [Dog API](https://dog.ceo/dog-api/)

### References
- [Photoshop Color Picker in Flutter](https://youtu.be/HURA4DKjA1c) by [SuperDeclarative!](https://www.youtube.com/channel/UCw2IfXRCHaYryORhBICp8QA)
- [Flutter TextField Validation](https://codewithandrea.com/articles/flutter-text-field-form-validation/) by Code With Andrea