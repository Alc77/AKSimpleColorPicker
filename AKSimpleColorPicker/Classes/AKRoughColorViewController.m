//
//  AKRoughColorViewController.m
//  AKSimpleColorPicker
//
//  Created by Alex Korabl'ov on 17.05.2018.
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "AKRoughColorViewController.h"
#import "AKRoughColorPickerShader.h"

@interface AKRoughColorViewController ()

@end

@implementation AKRoughColorViewController
{
	AKRoughColorPickerShader *roughColorShader;
	GLKVector3 roughColor;
	CGPoint roughPoint;
    BOOL needRedraw;
}

- (void)loadView {
	[super loadView];
	
	roughPoint = CGPointZero;
	
	// Set up context
	EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
	[EAGLContext setCurrentContext:context];
	
	// Set up views
	GLKView *glkView = (GLKView *)self.view;
	glkView.context = context;
	
	// add gesture
	UIPanGestureRecognizer *roughGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(roughPanGesture:)];
	[self.view addGestureRecognizer:roughGesture];
	
	// set shader
	roughColorShader = [[AKRoughColorPickerShader alloc] initWithVertexShader:@"AKVertexShader" fragmentShader:@"AKRoughColorPickerShader"];
    needRedraw = YES;
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    if (needRedraw) {
        needRedraw = NO;
        glClear(GL_COLOR_BUFFER_BIT);
        [roughColorShader renderInRect:rect withPos:roughPoint];
    }
}

- (void)redrawShader {
    needRedraw = YES;
}

#pragma mark - gestures

- (void)roughPanGesture:(UIPanGestureRecognizer*)gr {
    needRedraw = YES;
	if (gr.state == UIGestureRecognizerStateBegan) {
		roughPoint = [gr locationInView:self.view];
	}
	else {
		CGPoint translation = [gr translationInView:self.view];
		roughPoint = CGPointMake(roughPoint.x + translation.x, roughPoint.y + translation.y);
		[gr setTranslation:CGPointZero inView:self.view];
	}
	UIColor *color = [UIColor colorWithHue:roughPoint.x / self.view.frame.size.width saturation:1.0 brightness:1.0 alpha:1.0];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"didChangeRoughColor" object:nil userInfo:@{@"roughColor" : color}];
}

@end
