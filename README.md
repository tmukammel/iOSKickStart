# iOSKickStart

[![CI Status](http://img.shields.io/travis/Twaha Mukammel/iOSKickStart.svg?style=flat)](https://travis-ci.org/Twaha Mukammel/iOSKickStart)
[![Version](https://img.shields.io/cocoapods/v/iOSKickStart.svg?style=flat)](http://cocoapods.org/pods/iOSKickStart)
[![License](https://img.shields.io/cocoapods/l/iOSKickStart.svg?style=flat)](http://cocoapods.org/pods/iOSKickStart)
[![Platform](https://img.shields.io/cocoapods/p/iOSKickStart.svg?style=flat)](http://cocoapods.org/pods/iOSKickStart)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## About

A beautiful project template to kick start any iOS project. The target is to avoid recoding for features like UIView rounded rect designables or a simple scrolling form. Please contribute to this project to fill up with a standard set of features frequently needed.

## Current Features

1. Crossdissolve and reverse push pop navigation.
2. UIColor init with hex value.
3. UIView corner-radius and colored-border IBInspectables.
4. Text localization with key string from interface builder.
5. Define once user everywhere global constants.
6. Navigationbar set solid color and line shadow visibility on/off.
7. Scrollview input form by just enabling actAsInputForm in interface builder. Use Scrollview's customFirstRespnder property to focus on specif view over keyboard.
8. Dismiss keyboard on tap with enabling UIView extension var endEditingOnTap.
9. Check login history with global var isFirstLogin.
10. Default keyboard config enum in interfacebuilder to choose easily and avoid keyboard config mistakes.

## Limitations

1. You have to extend or use sub classes declared here against Apple's base classes.

THis is just a basic work. Please contribute, expand and Enjoy...

## Installation

iOSKickStart is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "iOSKickStart"
```

## Author

Twaha Mukammel, t.mukammel@aol.com

## License

iOSKickStart is available under the MIT license. See the LICENSE file for more info.
