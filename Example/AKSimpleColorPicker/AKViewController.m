//
//  AKViewController.m
//  AKSimpleColorPicker
//
//  Created by Alc77 on 07/11/2018.
//  Copyright (c) 2018 Alc77. All rights reserved.
//

#import "AKViewController.h"
#import <AKSimpleColorPicker/AKSimpleColorPicker.h>

@interface AKViewController ()

@property (nonatomic, weak) IBOutlet UILabel *exampleLabel;

@end

@implementation AKViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeColor:) name:@"colorChanged" object:nil];
}

- (IBAction)changeColorPressed:(UIButton*)sender {
	AKColorPickerViewController *changeColorVC = [[AKColorPickerViewController alloc] init];
	changeColorVC.glRoughViewRelativeHeight = 0.1;
	changeColorVC.glPreciseViewRelativeHeight = 0.3;
	changeColorVC.providesPresentationContextTransitionStyle = YES;
	changeColorVC.definesPresentationContext = YES;
	changeColorVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
	[self presentViewController:changeColorVC animated:YES completion:nil];
}

- (void)didChangeColor:(NSNotification*)n {
	UIColor *color = n.userInfo[@"color"];
	[self.exampleLabel setTextColor:color];
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
