//
//  iPad_Split_View_Based_No_Core_DataAppDelegate.m
//  iPad_Split_View_Based_No_Core_Data

#import "iPadDataAppDelegate.h"
#import "RootViewControlleriPad.h"

@implementation iPadDataAppDelegate

@synthesize window, splitViewController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
       
	[window addSubview:splitViewController.view];
    [window makeKeyAndVisible];
    
    return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
}

- (void)dealloc {
    [splitViewController release];
    [window release];
    [super dealloc];
}


@end

