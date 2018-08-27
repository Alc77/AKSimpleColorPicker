# AKSimpleColorPicker

[![language](https://img.shields.io/badge/Language-Objective--C-7D6FFF.svg)](https://developer.apple.com/documentation/objectivec)&nbsp;
[![CI Status](https://img.shields.io/travis/Alc77/AKSimpleColorPicker.svg?branch=master)](https://travis-ci.org/Alc77/AKSimpleColorPicker)&nbsp;
[![Version](https://img.shields.io/cocoapods/v/AKSimpleColorPicker.svg?style=flat)](https://cocoapods.org/pods/AKSimpleColorPicker)&nbsp;
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/Alc77/AKSimpleColorPicker/master/AKSimpleColorPicker/LICENSE)&nbsp;
[![Platform](https://img.shields.io/badge/support-iOS%209%2B%20-orange.svg?style=flat)](https://www.apple.com/ios/)&nbsp;

# Why Choose AKSimpleColorPicker?

It's an simple Photoshop-like color picker based on OpenGL.

![Objective-C](Resources/AKSimpleColorPickerDemo.gif)&nbsp;

## Example

To run the example project, clone the repo, and run `AKSimpleColorPicker.xcworkspace` from the `AKSimpleColorPicker/Example` directory first.

## Requirements

AKSimpleColorPicker works on iOS 9.0 and above and is compatible with ARC projects. It depends on the following Apple frameworks:

* Foundation.framework
* UIKit.framework
* GLKit.framework

## Installation

### Manually

You can directly add the source files to your project.

1. Download the latest zip from github or clone the source in your desired directory.
2. Open your project in Xcode, then drag and drop the folder `AKSimpleColorPicker/AKSimpleColorPicker/Classes` onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project. 
3. Include AKSimpleColorPicker with `#import "AKSimpleColorPicker.h"` in the view controller in which you intend to use AKSimpleColorPicker.


### Using Cocoapods
[CocoaPods](http://cocoapods.org) is the recommended way to add AKSimpleColorPicker to your project.

1. Add a pod entry for AKSimpleColorPicker to your Podfile `pod 'AKSimpleColorPicker'`
2. Install the pod(s) by running `pod install`.
3. Include AKSimpleColorPicker with `#import <AKSimpleColorPicker/AKSimpleColorPicker.h>` in the view controller in which you intend to use AKSimpleColorPicker.

## Usage

1. After including the AKSimpleColorPicker in the desired view controller create `AKColorPickerViewController` instance which contains the picker views.
Suppose you create it in some button handler:

**Objective-c**:
```objective-c
- (IBAction)changeColorPressed:(UIButton*)sender {
	AKColorPickerViewController *changeColorVC = [[AKColorPickerViewController alloc] init];
	changeColorVC.glRoughViewRelativeHeight = 0.1; // not mandratory parameter
	changeColorVC.glPreciseViewRelativeHeight = 0.4; // not mandratory parameter
	changeColorVC.providesPresentationContextTransitionStyle = YES;
	changeColorVC.definesPresentationContext = YES;
	changeColorVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
	[self presentViewController:changeColorVC animated:YES completion:nil];
}
```

2. Subscribe to the `colorChanged` notification in the `viewDidLoad`:

**Objective-c**:
```objective-c
- (void)viewDidLoad {
	[super viewDidLoad];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeColor:) name:@"colorChanged" object:nil];
	
	// add your settings
}
```

3. Create the notification handler and receive the color from the notification dictionary:

**Objective-c**:
```objective-c
- (void)didChangeColor:(NSNotification*)n {
	UIColor *color = n.userInfo[@"color"];
	// Do whatever you want with the received color.
}
```

## Customization

There is a two parameters for customisation the color picker:

**Objective-c**:
```objective-c
@property (nonatomic) CGFloat glRoughViewRelativeHeight;
@property (nonatomic) CGFloat glPreciseViewRelativeHeight;
```

They both affect the height of the corresponding picker. Each of them can not be less than 0.1 screen height, and their total height should not exceed 0.75 of the screen height. 
You can tune it after AKColorPickerViewController creation, as described in paragraph 1.

## License

AKSimpleColorPicker is available under the MIT license. See the LICENSE file for more info.
