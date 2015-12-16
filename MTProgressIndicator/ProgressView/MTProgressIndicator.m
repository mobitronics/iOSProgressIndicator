/*!
 Copyright: Copyright (C) 2015 Mobitronics.in (http://mobitronics.in).  All Rights Reserved.
 
 File Name: MTProgressIndicator.m
 
 Description: This class is used to handle start, stop progress view action.
 
 Created By: Pranay.
 
 Creation Date: 26/08/15.
 
 Modified By:
 
 Modification Date:
 
 Version: 2.0
 */

#import "MTProgressIndicator.h"
#import "MTProgressView.h"

//To get current device height width
#define DEVICE_HEIGHT [ [ UIScreen mainScreen ] bounds ].size.height
#define DEVICE_WIDTH [ [ UIScreen mainScreen ] bounds ].size.width

@interface MTProgressIndicator () {
  MTProgressView *progressView;
}

@end
@implementation MTProgressIndicator

#pragma mark Singleton Methods

/**
 *  This method create the single object of an application and shared throughout the application.
 *
 *  @return shared object of an application
 */
+ (id)sharedIndicator {
  static MTProgressIndicator *sharedIndicator = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedIndicator = [[self alloc] init];
  });
  return sharedIndicator;
}

/**
 *  This method is used to show the Progress View
 */
- (void)showProgressView {
  if (progressView) {
    [progressView removeFromSuperview];
    progressView = nil;
  }
  progressView = [[MTProgressView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
  progressView.indeterminate = TRUE;
  progressView.tintColor = [UIColor whiteColor];
  [progressView.backgroundView setBackgroundColor: [UIColor colorWithRed:(0.0f/255.0f) green:(0.0f/255.0f) blue:(0.0f/255.0f) alpha:0.7f]];
  [[UIApplication sharedApplication].delegate.window addSubview:progressView];
}

/**
 *  This method is used to dismiss the Progress View
 */
- (void)dismissProgressView {
  if (progressView) {
    [progressView removeFromSuperview];
    progressView = nil;
  }
}

/**
 *  This method is used to show the progress view again.
 */
- (void)reappearProgressView {
  if (progressView) {
    [self dismissProgressView];
    [self showProgressView];
  }
}

@end
