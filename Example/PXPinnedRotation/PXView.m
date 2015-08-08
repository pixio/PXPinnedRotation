//
//  PXView.m
//  PXPinnedRotation
//
//  Created by Calvin Kern on 6/15/15.
//  Copyright (c) 2015 Daniel Blakemore. All rights reserved.
//

#import "PXView.h"

@implementation PXView
{
    NSMutableArray* _constraints;
    
    UIImageView* _animatedView;
    UIImageView* _nonAnimatedView;
    
    UIView* _bspacer1;
    UIView* _bspacer2;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self == nil) {
        return nil;
    }
    
    _constraints = [NSMutableArray array];

    _bspacer1 = [[UIView alloc] init];
    [_bspacer1 setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [self addSubview:_bspacer1];
    
    _bspacer2 = [[UIView alloc] init];
    [_bspacer2 setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [self addSubview:_bspacer2];
    
    _animatedView = [[UIImageView alloc] init];
    [_animatedView setImage:[UIImage imageNamed:@"cupcake"]];
    [_animatedView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [self addSubview:_animatedView];
    [self addViewToAnimate:_animatedView];

    _nonAnimatedView = [[UIImageView alloc] init];
    [_nonAnimatedView setImage:[UIImage imageNamed:@"x"]];
    [_nonAnimatedView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [self addSubview:_nonAnimatedView];
//    [self addViewToAnimate:_bottomLabel]; // No animation looks better with radially symetrical buttons
    
    // Start layout
    [super manuallyStartLayoutPass];
    return self;
}

- (NSArray *)calculateBaseConstraintsBeforeLayoutPass
{
    [_constraints removeAllObjects];
    
    NSDictionary* views = NSDictionaryOfVariableBindings(_animatedView, _nonAnimatedView, _bspacer1, _bspacer2);
    NSDictionary* metrics = @{@"sp":@10, @"vsp":@40};
    
    [_constraints addObject:[NSLayoutConstraint constraintWithItem:_animatedView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [_constraints addObject:[NSLayoutConstraint constraintWithItem:_animatedView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_bspacer1(_bspacer2)][_nonAnimatedView][_bspacer2]|" options:0 metrics:metrics views:views]];
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vsp-[_nonAnimatedView]" options:0 metrics:metrics views:views]];
    
    return _constraints;
}

@end
