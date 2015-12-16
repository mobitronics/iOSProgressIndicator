/*!
 Copyright: Copyright (C) 2015 Mobitronics.in (http://mobitronics.in).  All Rights Reserved.
 
 File Name: MTProgressView.h
 
 Description: This class is used to create progress view.
 
 Created By: Pranay.
 
 Creation Date: 15/07/15.
 
 Modified By:
 
 Modification Date:
 
 Version: 2.0
 */

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface MTProgressView : UIView

@property (nonatomic) IBInspectable BOOL indeterminate;
@property (nonatomic) IBInspectable CGFloat progress;
@property (nonatomic) IBInspectable BOOL showsText;
@property (nonatomic) IBInspectable CGFloat lineWidth;
@property (nonatomic) IBInspectable CGFloat radius;
@property (nonatomic) IBInspectable UIColor *tintColor;
@property (nonatomic) UIView *backgroundView;
@property (nonatomic, readonly) UILabel *textLabel;
@property (nonatomic) IBInspectable UIColor *textColor;
@property (nonatomic) IBInspectable CGFloat textSize;
@property (nonatomic) UIBlurEffect *blurEffect NS_AVAILABLE_IOS(8_0);
@property (nonatomic) IBInspectable BOOL usesVibrancyEffect;
@property (nonatomic, copy) void(^animationDidStopBlock)();

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
