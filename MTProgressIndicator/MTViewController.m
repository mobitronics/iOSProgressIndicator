/*!
 Copyright: Copyright (C) 2015 Mobitronics.in (http://mobitronics.in).  All Rights Reserved.
 
 File Name: MTViewController.m
 
 Description: This view controller is usd to show the default view forn an application.
 
 Created By: Pranay.
 
 Creation Date: 26/08/15.
 
 Modified By:
 
 Modification Date:
 
 Version: 2.0
 */


#import "MTViewController.h"
#import "MTProgressIndicator.h"
#import "MTInitialProgressIndicator.h"

@interface MTViewController () {
  //IBOutlet
  __weak IBOutlet UILabel *titleLabel;
  __weak IBOutlet UIButton *startProgressOneButton;
  __weak IBOutlet UIButton *startProgressTwoButton;
}

@end

@implementation MTViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //To add the line at the bottom of the label
  CALayer *bottomBorder = [CALayer layer];
  bottomBorder.frame = CGRectMake(0.0f, titleLabel.frame.size.height - 6, titleLabel.frame.size.width, 1.0f);
  bottomBorder.backgroundColor = titleLabel.textColor.CGColor;
  [titleLabel.layer addSublayer:bottomBorder];

  //To addd the corner radius for button
  startProgressOneButton.layer.cornerRadius = 5;
  startProgressOneButton.clipsToBounds = YES;
  startProgressTwoButton.layer.cornerRadius = 5;
  startProgressTwoButton.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

/**
 *  This action is used to show the progress view
 *
 *  @param sender
 */
- (IBAction)showProgressOneView:(id)sender {
  [[MTProgressIndicator sharedIndicator] showProgressView];
  [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(dismissProgressOneView:) userInfo:nil repeats:NO];
}

/**
 *  This action is used to dismiss the progress view
 *
 *  @param sender 
 */
- (IBAction)dismissProgressOneView:(id)sender {
  [[MTProgressIndicator sharedIndicator] dismissProgressView];
}

/**
 *  This action is used to show the progress view
 *
 *  @param sender
 */
- (IBAction)showProgressTwoView:(id)sender {
  [[MTInitialProgressIndicator sharedIndicator] showInitialProgressView];
  [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(dismissProgressTwoView:) userInfo:nil repeats:NO];
}

/**
 *  This action is used to dismiss the progress view
 *
 *  @param sender
 */
- (IBAction)dismissProgressTwoView:(id)sender {
  [[MTInitialProgressIndicator sharedIndicator] dismissInitialProgressView];
}

@end
