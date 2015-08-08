//
//  PXViewController.m
//  PXPinnedRotation
//
//  Created by Daniel Blakemore on 05/01/2015.
//  Copyright (c) 2014 Daniel Blakemore. All rights reserved.
//

#import "PXView.h"
#import "PXViewController.h"

@interface PXViewController ()

@end

@implementation PXViewController

- (PXView *)contentView
{
    return (PXView*)[self view];
}

- (void)loadView
{
    [self setView:[[PXView alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

@end
