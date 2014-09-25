//
//  RootViewControlleriPad.h

#import <UIKit/UIKit.h>

@protocol SubstitutableDetailViewController
- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem;
@end


@interface RootViewControlleriPad : UITableViewController <UISplitViewControllerDelegate>
{
	UISplitViewController *splitViewController;
	
	NSMutableArray *listOfItems;

    UIPopoverController *popoverController;    
    UIBarButtonItem *rootPopoverButtonItem;
}

@property (nonatomic, assign) IBOutlet UISplitViewController *splitViewController;

@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) UIBarButtonItem *rootPopoverButtonItem;

@end
