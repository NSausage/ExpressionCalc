//
//  SelectController.m
//  Aquarium
//
//  Created by Randy on 12/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SelectController.h"

#import "aboutScreenController.h"
#import "ExpressionWithSearchReCalc.h"

@implementation SelectController

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		return YES;
	} else {
		return (interfaceOrientation == UIInterfaceOrientationPortrait ||
				interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown );
	}
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
	listOfItems = [[NSMutableArray alloc] init];
    
	NSArray *firstArray2 = [NSArray arrayWithObjects:
                            @"Expression with Search & Replace",
                            nil];
    
    NSDictionary *firstDict2 = [NSDictionary dictionaryWithObject:firstArray2 forKey:@"Shapes"];
    
	NSArray *helpArray = [NSArray arrayWithObjects: @"About",nil];
    
	NSDictionary *helpDict = [NSDictionary dictionaryWithObject:helpArray forKey:@"Shapes"];
	
    [listOfItems addObject:firstDict2];
    
	[listOfItems addObject:helpDict];
	
	self.navigationItem.title = @"Calculator";
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	int y1 = 0;
	if (indexPath.section == y1++) {
        int x1 = 0;
		if (indexPath.row == x1++) {
			ExpressionWithSearchReCalc *dvController = [[ExpressionWithSearchReCalc alloc]
                                                    initWithNibName:@"ExpressionWithSearchReCalc" bundle:[NSBundle mainBundle]];
			
			[self.navigationController pushViewController:dvController animated:YES];
			[dvController release];
			dvController = nil;
		}
    }
	if (indexPath.section == y1++) {
        int x1 = 0;

        if (indexPath.row == x1++) {
			aboutScreenController *dvController = [[aboutScreenController alloc]
												   initWithNibName:@"aboutScreenController" bundle:[NSBundle mainBundle]];
			
			[self.navigationController pushViewController:dvController animated:YES];
			[dvController release];
			dvController = nil;
		}
	}
	
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - Table view data source

	// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [listOfItems count];
}

	// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSDictionary *myDictionary = [listOfItems objectAtIndex:section];
	NSArray *myArray = [myDictionary objectForKey:@"Shapes"];
    return [myArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    int y2 = 0;
	if (section == y2++) {
		return @"Number Calculator";
	}
	else if (section == y2++) {
		return @"Information";
	}
	else {
			// SOMETHING IS BROKEN BECAUSE THIS SHOULDN'T HAPPEN !!!!
		return 0;
	}
}


#pragma mark - Table view delegate

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


-(UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryType:(NSIndexPath *)indexPath {
	return UITableViewCellAccessoryDisclosureIndicator;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	[self tableView:tableView didSelectRowAtIndexPath:indexPath];
	
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidDisappear:(BOOL)animated {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
    [super viewDidDisappear:YES];
}


- (void)dealloc {
	[listOfItems release];
    [super dealloc];
}


@end

