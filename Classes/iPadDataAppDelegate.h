//
//  iPad_Split_View_Based_No_Core_DataAppDelegate.h
//  iPad_Split_View_Based_No_Core_Data
//
//  Created by Randy on 10/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RootViewControlleriPad;

@interface iPadDataAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    
    UISplitViewController *splitViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;

@end
