//
//  AKColorPickerViewController.m
//  AKSimpleColorPicker
//
//  Created by Alex Korabl'ov on 17.05.2018.
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "AKColorPickerViewController.h"
#import "AKRoughColorViewController.h"
#import "AKPreciseColorViewController.h"

@implementation AKColorPickerViewController
{
    UIView *roughContainerView;
    AKRoughColorViewController *roughVC;
    UIView *preciseContainerView;
    AKPreciseColorViewController *preciseVC;
    UIEdgeInsets safeAreaInsets;
}

- (void)loadView {
    [super loadView];
	
	[self initConstants];
	[self initUI];	
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self prepareViewsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void)initConstants {
	if (self.glRoughViewRelativeHeight < 0.1) {
		self.glRoughViewRelativeHeight = 0.1;
	}
	if (self.glPreciseViewRelativeHeight < 0.1) {
		self.glPreciseViewRelativeHeight = 0.1;
	}
	if (self.glPreciseViewRelativeHeight + self.glRoughViewRelativeHeight > 0.75) {
		self.glRoughViewRelativeHeight = 0.15;
		self.glPreciseViewRelativeHeight = 0.6;
	}
    
    safeAreaInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    if (@available(iOS 11.0, *)) {
        safeAreaInsets = UIApplication.sharedApplication.keyWindow.safeAreaInsets;
    }
}

- (void)initUI {
	UIControl *controlView = [[UIControl alloc] init];
	[controlView addTarget:self action:@selector(backgroundTapped:) forControlEvents:UIControlEventTouchUpInside];
	controlView.backgroundColor = [UIColor clearColor];
	self.view = controlView;
	
	CGSize screenSize = [UIScreen mainScreen].bounds.size;
	
	roughContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, screenSize.height * (1.0 - self.glRoughViewRelativeHeight) - safeAreaInsets.bottom, screenSize.width, screenSize.height * self.glRoughViewRelativeHeight)];
	[self.view addSubview:roughContainerView];
	roughVC = [[AKRoughColorViewController alloc] init];
	[self addChildViewController:roughVC];
	roughVC.view.frame = CGRectMake(0, 0, roughContainerView.bounds.size.width, roughContainerView.bounds.size.height);
	[roughContainerView addSubview:roughVC.view];
	[roughVC didMoveToParentViewController:self];
	
    preciseContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, screenSize.height * (1.0 - (self.glPreciseViewRelativeHeight + self.glRoughViewRelativeHeight)) - safeAreaInsets.bottom, screenSize.width, screenSize.height * self.glPreciseViewRelativeHeight)];
	[self.view addSubview:preciseContainerView];
	preciseVC = [[AKPreciseColorViewController alloc] init];
	[self addChildViewController:preciseVC];
	preciseVC.view.frame = CGRectMake(0, 0, preciseContainerView.bounds.size.width, preciseContainerView.bounds.size.height);
	[preciseContainerView addSubview:preciseVC.view];
	[preciseVC didMoveToParentViewController:self];
}

#pragma mark - button handlers

- (IBAction)backgroundTapped:(UIControl*)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - screen rotation

-(void)prepareViewsForOrientation:(UIInterfaceOrientation)orientation
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    roughContainerView.frame = CGRectMake(0, screenSize.height * (1.0 - self.glRoughViewRelativeHeight) - safeAreaInsets.bottom, screenSize.width, screenSize.height * self.glRoughViewRelativeHeight);
    preciseContainerView.frame = CGRectMake(0, screenSize.height * (1.0 - (self.glPreciseViewRelativeHeight + self.glRoughViewRelativeHeight)) - safeAreaInsets.bottom, screenSize.width, screenSize.height * self.glPreciseViewRelativeHeight);
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        roughVC.view.frame = CGRectMake(0, 0, roughContainerView.bounds.size.width, roughContainerView.bounds.size.height);
        preciseVC.view.frame = CGRectMake(0, 0, preciseContainerView.bounds.size.width, preciseContainerView.bounds.size.height);
    }
    else
    {
        roughVC.view.frame = CGRectMake(0, 0, roughContainerView.bounds.size.width, roughContainerView.bounds.size.height);
        preciseVC.view.frame = CGRectMake(0, 0, preciseContainerView.bounds.size.width, preciseContainerView.bounds.size.height);
    }
    [self.view updateConstraints];
    [roughContainerView updateConstraints];
    [preciseContainerView updateConstraints];
    [roughVC.view updateConstraints];
    [preciseVC.view updateConstraints];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self->roughVC redrawShader];
        [self->preciseVC redrawShader];
    });
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
         [self prepareViewsForOrientation:orientation];
     } completion:nil];
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

@end
