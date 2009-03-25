//
//  ReadAppDelegate.m
//  Read
//
//  Created by Matt Weight on 8/20/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "ReadViewController.h"
#import "BookViewController.h"
#import "ReadAppDelegate.h"

@implementation ReadViewController

/*
 Implement loadView if you want to create a view hierarchy programmatically
- (void)loadView {
}
 */

- (void)viewDidLoad {
	[super viewDidLoad];
	[bookTable setRowHeight:42];
	bookArray = [[NSMutableArray alloc] init];
	
	NSString *file;
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:NSHomeDirectory()];
	while (file = [dirEnum nextObject]) {
		//NSArray *pathComponents = [file pathComponents];
		if ([[file pathExtension] isEqualToString: @"txt"]) {
			[bookArray addObject:file];
		}
	}
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [bookArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {	
	static NSString *MyIdentifier = @"MyIdentifier";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
	}
	// Configure the cell

	/*
	UILabel* cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 280, 80)];
	[cellLabel setNumberOfLines:3];
	[cellLabel setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0]];
	[cellLabel setFont:[UIFont systemFontOfSize:16]];
	[cellLabel setText:[bookArray objectAtIndex:indexPath.row]];
	*/

	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	[cell setFont:[UIFont systemFontOfSize:18]];
	NSArray* titlePieces = [[bookArray objectAtIndex:indexPath.row] componentsSeparatedByString:@"/"];
	[cell setText:[titlePieces objectAtIndex:1]];
	//[titlePieces release];
	//[cell.contentView addSubview:cellLabel];

	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	BookViewController* bookController = [[BookViewController alloc] initWithNibName:@"BookView" bundle:nil];
	[bookController loadBook:[bookArray objectAtIndex:indexPath.row]];
	ReadAppDelegate* appDelegate = (ReadAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appDelegate setCurrentDoc:[bookArray objectAtIndex:indexPath.row]];
	[self.view addSubview:bookController.view];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[bookArray release];
	[super dealloc];
}

@end
