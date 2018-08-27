//
//  AKColorPickerViewController.h
//  AKSimpleColorPicker
//
//  Created by Alex Korabl'ov on 17.05.2018.
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <UIKit/UIKit.h>

/*!
 * @abstract Create a view controller with two subordinate OpenGL view controllers
 */
@interface AKColorPickerViewController : UIViewController

/*!
 * @abstract Hight of the bottom OpenGL view controller relative to device screen height.
 * It should be no less than 0.1, and summary height of two view controllers should be no more than 0.75.
 */
@property (nonatomic) CGFloat glRoughViewRelativeHeight;

/*!
 * @abstract Hight of the top OpenGL view controller relative to device screen height.
 * It should be no less than 0.1, and summary height of two view controllers should be no more than 0.75.
 */
@property (nonatomic) CGFloat glPreciseViewRelativeHeight;

@end
