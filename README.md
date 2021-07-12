# iOSKickStart

A set of extended UIKit features to kickstart any iOS project.

[![GitHub latest stable releases](https://badgen.net/github/release/tmukammel/iOSKickStart/stable)](https://github.com/tmukammel/iOSKickStart/releases/latest)
[![GitHub forks](https://img.shields.io/github/forks/tmukammel/iOSKickStart)](https://github.com/tmukammel/iOSKickStart/network/members)
[![GitHub stars](https://img.shields.io/github/stars/tmukammel/iOSKickStart)](https://github.com/tmukammel/iOSKickStart/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/tmukammel/iOSKickStart)](https://github.com/tmukammel/iOSKickStart/issues)

[![Version](https://img.shields.io/cocoapods/v/iOSKickStart.svg?style=flat)](http://cocoapods.org/pods/iOSKickStart)
[![License](https://img.shields.io/cocoapods/l/iOSKickStart.svg?style=flat)](http://cocoapods.org/pods/iOSKickStart)
[![Platform](https://img.shields.io/cocoapods/p/iOSKickStart.svg?style=flat)](http://cocoapods.org/pods/iOSKickStart)

[![Twitter share](https://img.shields.io/twitter/url?url=https%3A%2F%2Fgithub.com%2Ftmukammel%2FiOSKickStart)](http://www.twitter.com/share?url=https://github.com/tmukammel/iOSKickStart)

## Example Project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## About

A beautiful project template to kick start any iOS project. The target is to avoid recoding for features like UIView rounded rect designables or a simple scrolling form. Please contribute to this project to fill up with a standard set of features frequently needed.

## Features & Implementations

### 1. Localization

#### **(a)** Set Language

> **(1)** Set and Switch application locale programmetically.

```swift
// Bundle.setLanguage(language: String!)
Bundle.setLanguage("bn")
```

> **(2)** Get application locale programmetically.

```swift
// Bundle.getLanguage()
let currentLanguage = Bundle.getLanguage()
```

> **(3)** Update current view with changed locale.

> > You will have to reload `Main` storyboard

> > or,  
> > Reload current viewing `ViewController`

```swift
func forceReload() {
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let destVC = storyBoard.instantiateViewController(withIdentifier: <"ViewControllerIdentifier">) as! <ViewControllerClass>
    let navC = self.navigationController;
    navC?.popToRootViewController(animated: true)
    navC?.pushViewController(destVC, animated: true)
}
```

#### **(b)** Localization from storyboard

> With Localizable.strings (Locale) key sting into interface builder.

> **(1)** UILabel
>
> > `.localizedTextKey = <localizableKey>`

> **(2)** UITextField
>
> > `.localizedPlaceholderKey = <localizableKey>`

> **(3)** UIBUtton
>
> > `.localizedTitleKey = <localizableKey>`

> **(4)** UITabBarItem
>
> > `.localizedTitleKey = <localizableKey>`

> **(5)** UIViewController.title
>
> > `.localizedTitleKey = <localizableKey>`

### 2. User intput form (Scrollview)

#### **(a)** Label bounds.height to font ratio

> `fontToHeightRatio = <fractionLessThanZero>`

#### **(b)** TextField left, right padding

> `textField.leftPadding = <paddingInPoints>`  
> `textField.rightPadding = <paddingInPoints>`

#### **(c)** Keyboard configuration

> Default keyboard config enum in interfacebuilder to choose easily and avoid keyboard config mistakes.

> Configuration options

```swift
private enum TextFieldKeyboardConfig: String {
    case email
    case name
    case password
    case comment
}
```

> To set keyboard configuration
>
> > `keyboardConfig = <option>`

#### **(d)** CodeInputTextField Code input

> **(1)** Set length and code placeholder  
> `codeLengthAndChar = <length,placeholder>`
>
> > e.g: `codeLengthAndChar = "6,●"`

> **(2)** Implement UITextFieldDelegate

```swift
// MARK: - UITextFieldDelegate

func textFieldDidBeginEditing(_ textField: UITextField) {
    if let textFld = (textField as? CodeInputTextField) {
        textFld.observeCodeInputDidBegin()
    }
}

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    // Code ...

    if let textFld = (textField as? CodeInputTextField) {
        return textFld.observeCodeInput(shouldChangeCharactersIn: range, replacementString: string)
    }

    return true
}
```

> > This is how it looks
>
> > > <img src="https://dl.dropboxusercontent.com/s/mmk8vppaf8jdp5a/codeTextField.png?dl=0" />

#### **(e)** Input form scrollview behavior

> **Step 01**

> To make scrollview to act as an input form  
> Set `scrollview` user defined runtime attributes

```swift
// User defined runtime attributes
actAsInputForm = true
```

> To dismiss keyboard on tap  
> Set `scrollview.view` (view under scrollview on wich the form fields resided) user defined runtime attributes

```swift
// User defined runtime attributes
endEditingOnTap = true
```

> **Step 02**

> Send actions to scrollview

```swift
@IBOutlet weak var scrollView: ScrollView!

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    scrollView.parentViewControllerWillAppear()
}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    scrollView.parentViewControllerWillDisappear()
}

// MARK: - UITextFieldDelegate

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    scrollView.scrollControlRectToVisible(textField)

    return true
}
```

### 2. UINavigationController

#### UINavigationController+Extension

isNavBarHidden IBInspectable.

### 5. Define once use everywhere global constants.

### 1. Navigation: Cross dissolve and reverse push pop

### 2. UIColor init with hex value.

### 3. UIView corner-radius and colored-border IBInspectables.

#### UIView+Extension

> bgColorKey
> cornerRadius
> applyStandardCornerRadius
> makeRoundedCorners
> borderWidth
> borderColor
> endEditingOnTap
> gradHexColors

### 11. UIBUtton+Extension

> localizedTitleKey  
> keyNormalTxtColor  
> keyDisabledTxtColor  
> UIButton adoptive font size
>
> > fontToHeightRatio  
> > numberOfLines  
> > adjustFontSize `// adjustsFontSizeToFitWidth`

<img src="https://dl.dropboxusercontent.com/s/cet4cjctq2ba1xa/buttonCustomClass.png?dl=0" /> <img src="https://dl.dropboxusercontent.com/s/mqpgilyfet1d1ms/adoptiveButtonFont.png?dl=0" />

OR

```swift
button.fontToHeightRatio = 0.35
button.numberOfLines = 1
button.adjustFontSize = true
```

### 13. UILabel bounds.height to font size ratio

<img src="https://dl.dropboxusercontent.com/s/mr4luizt1n4zgxy/labelCustomClass.png?dl=0" /> <img src="https://dl.dropboxusercontent.com/s/fhpt9tm61enm4et/labelFontToHeightRatio.png?dl=0" />

OR

```swift
label.fontToHeightRatio = 0.6
```

### 14. UIViewController titleImage IBInspectable

<img src="https://dl.dropboxusercontent.com/s/24rs0dnadfzwv6m/ViewControllerTitleImage.png?dl=0" />

OR

```swift
viewController.titleImage = UIImage(named: "image_name")
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
