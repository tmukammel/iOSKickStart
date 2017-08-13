# iOSKickStart

[![CI Status](http://img.shields.io/travis/tmukammel/iOSKickStart.svg?style=flat)](https://travis-ci.org/tmukammel/iOSKickStart)
[![Version](https://img.shields.io/cocoapods/v/iOSKickStart.svg?style=flat)](http://cocoapods.org/pods/iOSKickStart)
[![License](https://img.shields.io/cocoapods/l/iOSKickStart.svg?style=flat)](http://cocoapods.org/pods/iOSKickStart)
[![Platform](https://img.shields.io/cocoapods/p/iOSKickStart.svg?style=flat)](http://cocoapods.org/pods/iOSKickStart)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## About

A beautiful project template to kick start any iOS project. The target is to avoid recoding for features like UIView rounded rect designables or a simple scrolling form. Please contribute to this project to fill up with a standard set of features frequently needed.

## Features & Implementations

#### 1. Cross dissolve and reverse push pop navigation.

#### 2. UIColor init with hex value.

#### 3. UIView corner-radius and colored-border IBInspectables.

#### 4. Text localization with key string from interface builder.

#### 5. Define once use everywhere global constants.

#### 6. Navigationbar set solid color and line shadow visibility on/off.

#### 7. Scrollview actAsInputForm.

#### 8. Dismiss keyboard on tap with enabling UIView extension var endEditingOnTap.

#### 9. Default keyboard config enum in interfacebuilder to choose easily and avoid keyboard config mistakes.

#### 10. UITextField left/right padding

<img src="https://dl.dropboxusercontent.com/s/u7ujzhkegwovw23/textFieldCustomClass.png?dl=0" />	<img src="https://dl.dropboxusercontent.com/s/hn4yf7g3t31ed65/leftRightPadding.png?dl=0" />

OR

```swift
textField.leftPadding = 8.0
textField.rightPadding = 8.0
```

#### 11. UIButton adoptive font size

<img src="https://dl.dropboxusercontent.com/s/cet4cjctq2ba1xa/buttonCustomClass.png?dl=0" />	<img src="https://dl.dropboxusercontent.com/s/mqpgilyfet1d1ms/adoptiveButtonFont.png?dl=0" />

OR

```swift
button.fontToHeightRatio = 0.35
button.numberOfLines = 1
button.adjustFontSize = true
```

#### 12. Code input TextField

##### Demo:
<img src="https://dl.dropboxusercontent.com/s/mmk8vppaf8jdp5a/codeTextField.png?dl=0" />

##### Implementation:
<img src="https://dl.dropboxusercontent.com/s/u7ujzhkegwovw23/textFieldCustomClass.png?dl=0" />	<img src="https://dl.dropboxusercontent.com/s/ircwuxlqtt091no/codeInputTextField.png?dl=0" />

OR

```swift
textField.codeLengthAndChar = "4,●"
```

AND

```swift
// MARK: - UITextFieldDelegate

func textFieldDidBeginEditing(_ textField: UITextField) {
    if let textFld = (textField as? TextField), let _ = textFld.codeLength {
        textFld.observeCodeInputDidBegin()
    }
}

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if let textFld = (textField as? TextField), let _ = textFld.codeLength {
        return textFld.observeCodeInput(shouldChangeCharactersIn: range, replacementString: string)
    }
    return true
}
```

#### 13. UILabel bounds.height to font size ratio

<img src="https://dl.dropboxusercontent.com/s/mr4luizt1n4zgxy/labelCustomClass.png?dl=0" />	<img src="https://dl.dropboxusercontent.com/s/fhpt9tm61enm4et/labelFontToHeightRatio.png?dl=0" />

OR

```swift
label.fontToHeightRatio = 0.6
```

## Limitations

1. You have to extend or use sub classes declared here against Apple's base classes.

This is just a basic work. Please contribute, expand and Enjoy...

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
