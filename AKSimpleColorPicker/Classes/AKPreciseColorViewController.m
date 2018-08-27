//
//  AKPreciseColorViewController.m
//  AKSimpleColorPicker
//
//  Created by Alex Korabl'ov on 17.05.2018.
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "AKPreciseColorViewController.h"
#import "AKPreciseColorPickerShader.h"

@interface AKPreciseColorViewController ()

@end

@implementation AKPreciseColorViewController
{
	AKPreciseColorPickerShader *preciseColorShader;
	GLKVector3 clearColor;
	CGPoint precisePoint;
	CGFloat scale;
    BOOL needRedraw;
}

- (void)loadView {
	[super loadView];
	
	scale = 1.0;
	if([[UIScreen mainScreen]respondsToSelector:@selector(scale)]) {
		scale = [[UIScreen mainScreen] scale];
	}
	
	clearColor = GLKVector3Make(1.0, 0.0, 0.0);
	
	// Set up context
	EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
	[EAGLContext setCurrentContext:context];
	
	// Set up views
	GLKView *glkView = (GLKView *)self.view;
	glkView.context = context;
	
	UIPanGestureRecognizer *preciseGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(precisePanGesture:)];
	[self.view addGestureRecognizer:preciseGesture];
	
	preciseColorShader = [[AKPreciseColorPickerShader alloc] initWithVertexShader:@"AKVertexShader" fragmentShader:@"AKPreciseColorPickerShader"];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeRoughColor:) name:@"didChangeRoughColor" object:nil];
    needRedraw = YES;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	precisePoint = CGPointMake(self.view.frame.size.width - 1.0, 1.0);
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    if (needRedraw) {
        needRedraw = NO;
        glClear(GL_COLOR_BUFFER_BIT);
        [preciseColorShader renderInRect:rect withColor:clearColor position:precisePoint];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"didChangeRoughColor" object:nil];
}

- (void)redrawShader {
    needRedraw = YES;
}

#pragma mark - gesture

- (void)precisePanGesture:(UIPanGestureRecognizer*)gr {
    needRedraw = YES;
	if (gr.state == UIGestureRecognizerStateBegan) {
		precisePoint = [gr locationInView:self.view];
	}
	else {
		CGPoint translation = [gr translationInView:self.view];
		if ((precisePoint.y > 0.0 || translation.y > 0.0) &&
			(precisePoint.y < self.view.frame.size.height || translation.y < 0.0)) {
			precisePoint = CGPointMake(precisePoint.x + translation.x, precisePoint.y + translation.y);
			[gr setTranslation:CGPointZero inView:self.view];
		}
	}
	[self pickColorAtPosition:precisePoint];
}

#pragma mark - service methods

- (void)didChangeRoughColor:(NSNotification*)n {
    needRedraw = YES;
	UIColor *color = n.userInfo[@"roughColor"];
	const CGFloat* components = CGColorGetComponents(color.CGColor);
	clearColor = GLKVector3Make(components[0], components[1], components[2]);
	[self pickColorAtPosition:precisePoint];
}

- (void)pickColorAtPosition:(CGPoint)pos {
    CGPoint normalPos = CGPointMake(pos.x / self.view.frame.size.width, pos.y / self.view.frame.size.height);
    CGFloat r = normalPos.x * (clearColor.r + normalPos.y * (1.0 - clearColor.r));
    CGFloat g = normalPos.x * (clearColor.g + normalPos.y * (1.0 - clearColor.g));
    CGFloat b = normalPos.x * (clearColor.b + normalPos.y * (1.0 - clearColor.b));
    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
	if (color) {
		[[NSNotificationCenter defaultCenter] postNotificationName:@"colorChanged" object:nil userInfo:@{@"color" : color}];
	}
}

@end
