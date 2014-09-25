//
//  RootViewControlleriPad.m

#import "RootViewControlleriPad.h"

#import "aboutScreenController.h"
#import "ExpressionWithSearchReCalc.h"

@implementation RootViewControlleriPad

@synthesize popoverController, splitViewController, rootPopoverButtonItem;

int r = 0;
int s = 0;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];

//    self.contentSizeForViewInPopover = CGSizeMake(310.0, self.tableView.rowHeight*12.0);
	self.preferredContentSize = CGSizeMake(310.0, self.tableView.rowHeight*12.0);
	listOfItems = [[NSMutableArray alloc] init];
  
	NSArray *firstArray = [NSArray arrayWithObjects:
                            @"Expression with Search & Replace",
                            nil];
    
    NSDictionary *firstDict = [NSDictionary dictionaryWithObject:firstArray forKey:@"Shapes"];
    
	NSArray *helpArray = [NSArray arrayWithObjects: @"About",nil];
	NSDictionary *helpDict = [NSDictionary dictionaryWithObject:helpArray forKey:@"Shapes"];
	
	[listOfItems addObject:firstDict];
	[listOfItems addObject:helpDict];
	
	self.navigationItem.title = @"Time Calculators";
	self.clearsSelectionOnViewWillAppear = NO;
}

#pragma mark - Rotation support

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow: r
												inSection: s];
    [self.tableView selectRowAtIndexPath:indexPath
								animated: YES
						  scrollPosition: UITableViewScrollPositionNone];
    return YES;
}


- (void)splitViewController:(UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController:(UIPopoverController*)pc {
    
		// Keep references to the popover controller and the popover button, and tell the detail view controller to show the button.
    barButtonItem.title = @"Calculators & Converters";
    self.popoverController = pc;
    self.rootPopoverButtonItem = barButtonItem;
    UIViewController <SubstitutableDetailViewController> *detailViewController = [splitViewController.viewControllers objectAtIndex:1];
    [detailViewController showRootPopoverButtonItem:rootPopoverButtonItem];
}


- (void)splitViewController:(UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
	
		// Nil out references to the popover controller and the popover button, and tell the detail view controller to hide the button.
    UIViewController <SubstitutableDetailViewController> *detailViewController = [splitViewController.viewControllers objectAtIndex:1];
    [detailViewController invalidateRootPopoverButtonItem:rootPopoverButtonItem];
    self.popoverController = nil;
    self.rootPopoverButtonItem = nil;
}


#pragma mark - Table view data source
	// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
		// Configure the cell.
	NSDictionary *myDict = [listOfItems objectAtIndex:indexPath.section];
	NSArray *myArray = [myDict objectForKey:@"Shapes"];
	NSString *cellValue = [myArray objectAtIndex:indexPath.row];
	cell.textLabel.text = cellValue;
    return cell;
}

	// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [listOfItems count];
}

	// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)atableView numberOfRowsInSection:(NSInteger)section {
	NSDictionary *myDictionary = [listOfItems objectAtIndex:section];
	NSArray *myArray = [myDictionary objectForKey:@"Shapes"];
    return [myArray count];
}

#pragma mark - Table view selection

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	r = (int)indexPath.row;
	s = (int)indexPath.section;
	
    NSUInteger row = indexPath.row;
    NSUInteger sec = indexPath.section;
	
    UIViewController <SubstitutableDetailViewController> *detailViewController = nil;
	if (sec == 0) {
		if (row == 0) {
			ExpressionWithSearchReCalc *newDetailViewController2 = [[ExpressionWithSearchReCalc alloc] initWithNibName:@"ExpressionWithSearchReCalciPad" bundle:nil];
			detailViewController = newDetailViewController2;
		}
    }
    if (sec == 3) {
		if (row == 0) {
			aboutScreenController *newDetailViewController1 = [[aboutScreenController alloc] initWithNibName:@"aboutScreenControlleriPad" bundle:nil];
			detailViewController = newDetailViewController1;
		}
	}
	
		// Update the split view controller's view controllers array.
    NSArray *viewControllers = [[NSArray alloc] initWithObjects:self.navigationController, detailViewController, nil];
    splitViewController.viewControllers = viewControllers;
    [viewControllers release];
    
		// Dismiss the popover if it's present.
    if (popoverController != nil) {
        [popoverController dismissPopoverAnimated:YES];
    }
	
		// Configure the new view controller's popover button (after the view has been displayed and its toolbar/navigation bar has been created).
    if (rootPopoverButtonItem != nil) {
        [detailViewController showRootPopoverButtonItem:self.rootPopoverButtonItem];
    }
	
    [detailViewController release];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    int y2 = 0;
	if (section == y2++) {
		return @"Expression Calculator";
	}
	else if (section == y2++) {
		return @"Information";
	}
	else {
        // SOMETHING IS BROKEN BECAUSE THIS SHOULDN'T HAPPEN !!!!
		return 0;
	}
}

#pragma mark - Memory management

-(void) viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:YES];
	
	self.splitViewController = nil;
	self.rootPopoverButtonItem = nil;
}

- (void)dealloc {
	[listOfItems release];
	
    [popoverController release];
    [rootPopoverButtonItem release];
	
    [super dealloc];
}

@end
