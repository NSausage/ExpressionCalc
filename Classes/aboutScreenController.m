//
//  aboutScreenController.m

#import "aboutScreenController.h"

@implementation aboutScreenController

@synthesize navigationBar;

#pragma mark - Managing the popover

- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		[navigationBar.topItem setLeftBarButtonItem:barButtonItem animated:NO];

	} 
}

- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		[navigationBar.topItem setLeftBarButtonItem:nil animated:NO];
	} 
}

- (void)viewDidLoad
{
    self.title = @"About";
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		return YES;
	} else {
		return (interfaceOrientation == UIInterfaceOrientationPortrait ||
				interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown );
	}
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

//- (void)viewDidDisappear:(BOOL)animated {
//	
//	self.navigationBar = nil;
//
//    [super viewDidDisappear:YES];
//    // Release any retained subviews of the main view.
//    // e.g. self.myOutlet = nil;
//}

- (void)dealloc {
	[navigationBar release];

    [super dealloc];
}

@end
