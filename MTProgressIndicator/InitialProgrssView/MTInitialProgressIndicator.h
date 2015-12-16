/*!
 Copyright: Copyright (C) 2015 Mobitronics.in (http://mobitronics.in).  All Rights Reserved.
 
 File Name: MTInitialProgressIndicator.h
 
 Description: This class is used to handle start, stop progress view action shaon at the start of the application.
 
 Created By: Pranay.
 
 Creation Date: 26/08/15.
 
 Modified By:
 
 Modification Date:
 
 Version: 2.0
 */

#import <Foundation/Foundation.h>

@interface MTInitialProgressIndicator : NSObject

/**
 *  This method create the single object of an application and shared throughout the application.
 *
 *  @return shared object of an application
 */
+ (id)sharedIndicator;

/**
 *  This method is used to show the Progress View
 */
- (void)showInitialProgressView;

/**
 *  This method is used to dismiss the Progress View
 */
- (void)dismissInitialProgressView;

/**
 *  This method is used to show the progress view again.
 */
- (void)reappearInitialProgressView;

@end
