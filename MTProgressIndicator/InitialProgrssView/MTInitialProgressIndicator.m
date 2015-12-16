/*!
 Copyright: Copyright (C) 2015 Mobitronics.in (http://mobitronics.in).  All Rights Reserved.
 
 File Name: MTInitialProgressIndicator.m
 
 Description: This class is used to handle start, stop progress view action shaon at the start of the application.
 
 Created By: Pranay.
 
 Creation Date: 26/08/15.
 
 Modified By:
 
 Modification Date:
 
 Version: 2.0
 */

#import "MTInitialProgressIndicator.h"
#import "MTInitialProgressView.h"

//To get current device height width
#define DEVICE_HEIGHT [ [ UIScreen mainScreen ] bounds ].size.height
#define DEVICE_WIDTH [ [ UIScreen mainScreen ] bounds ].size.width

@interface MTInitialProgressIndicator () {
  MTInitialProgressView *initialProgressView;
  UIView *blurBGView;
}

@end
@implementation MTInitialProgressIndicator

#pragma mark Singleton Methods

/**
 *  This method create the single object of an application and shared throughout the application.
 *
 *  @return shared object of an application
 */
+ (id)sharedIndicator {
  static MTInitialProgressIndicator *sharedIndicator = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedIndicator = [[self alloc] init];
  });
  return sharedIndicator;
}

/**
 *  This method is used to show the Progress View
 */
- (void)showInitialProgressView {
  [self dismissInitialProgressView];

  blurBGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
  [blurBGView setBackgroundColor:[UIColor grayColor]];

  if (!UIAccessibilityIsReduceTransparencyEnabled()) {
    blurBGView.backgroundColor = [UIColor clearColor];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.frame = blurBGView.bounds;
    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [blurBGView addSubview:blurEffectView];
  }
  else {
    blurBGView.backgroundColor = [UIColor blackColor];
  }
//  UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, blurBGView.frame.size.width, 20)];
//  [statusBarView setBackgroundColor:kBlueThemeColor];
//  [blurBGView addSubview:statusBarView];
  
  initialProgressView = [[MTInitialProgressView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
  [blurBGView addSubview:initialProgressView];
  initialProgressView.center = blurBGView.center;
  [initialProgressView startProgrss];
  
  [[UIApplication sharedApplication].delegate.window addSubview:blurBGView];
}

/**
 *  This method is used to dismiss the Progress View
 */
- (void)dismissInitialProgressView {

    if (initialProgressView) {
      [initialProgressView stopProgress];
      [initialProgressView removeFromSuperview];
    }
    if (blurBGView) {
      [blurBGView removeFromSuperview];
      blurBGView = nil;
    }
}

/**
 *  This method is used to show the progress view again.
 */
- (void)reappearInitialProgressView {
  if (initialProgressView) {
    [self dismissInitialProgressView];
    [self showInitialProgressView];
  }
}

@end
