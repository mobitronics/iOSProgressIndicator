
/*!
 Copyright: Copyright (C) 2015 DMI (http://dminc.com).  All Rights Reserved.
 
 File Name:  NNInitialProgressView.h
 
 Description: This is class is used to display the initial progrss indicator view.
 
 Created By: Pranay U.
 
 Creation Date: 10/20/15.
 
 Modified By:
 
 Modification Date:
 
 Version: 2.0.0
 */

#import <UIKit/UIKit.h>

@interface MTInitialProgressView : UIView

@property(nonatomic, strong) UIColor *trackTintColor UI_APPEARANCE_SELECTOR;
@property(nonatomic, strong) UIColor *progressTintColor UI_APPEARANCE_SELECTOR;
@property(nonatomic, strong) UIColor *innerTintColor UI_APPEARANCE_SELECTOR;
@property(nonatomic, strong) NSTimer *timer; //Progrss timer
@property(nonatomic) NSInteger roundedCorners UI_APPEARANCE_SELECTOR; // Can not use BOOL with UI_APPEARANCE_SELECTOR :-(
@property(nonatomic) CGFloat thicknessRatio UI_APPEARANCE_SELECTOR;
@property(nonatomic) NSInteger clockwiseProgress UI_APPEARANCE_SELECTOR; // Can not use BOOL with UI_APPEARANCE_SELECTOR :-(
@property(nonatomic) CGFloat progress;
@property(nonatomic) CGFloat indeterminateDuration UI_APPEARANCE_SELECTOR;
@property(nonatomic) NSInteger indeterminate UI_APPEARANCE_SELECTOR; // Can not use BOOL with UI_APPEARANCE_SELECTOR :-(

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated initialDelay:(CFTimeInterval)initialDelay;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated initialDelay:(CFTimeInterval)initialDelay withDuration:(CFTimeInterval)duration;
- (void)startProgrss;
- (void)stopProgress;

@end
