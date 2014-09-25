
#import "iPadDataAppDelegate.h"
#import "RootViewControlleriPad.h"

@implementation iPadDataAppDelegate

@synthesize window, splitViewController;

#pragma mark - Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	self.window.rootViewController = self.splitViewController;

	[window addSubview:splitViewController.view];
    [window makeKeyAndVisible];
	
    return YES;
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
}

#pragma mark - Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
}

- (void)dealloc {
    [splitViewController release];
    [window release];
    [super dealloc];
}


@end

