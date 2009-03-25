//
//  OptionsViewController.m
//  Read
//
//  Created by Matt Weight on 9/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "OptionsViewController.h"
#import "ReadAppDelegate.h"

@implementation OptionsViewController

@synthesize bookLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Initialization code
		bookLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 383, 280, 21)];
		[bookLabel setBackgroundColor:[UIColor clearColor]];
		[bookLabel setTextColor:[UIColor blackColor]];
		[bookLabel setTextAlignment:UITextAlignmentCenter];
		[bookLabel setFont:[UIFont fontWithName:@"Arial" size:12]];
		[self.view addSubview:bookLabel];
	}
	return self;
}

- (IBAction)back:(id)sender {
	[[self.view superview] removeFromSuperview];
	[self.view removeFromSuperview];
}

- (void)viewWillAppear:(BOOL)animated {
	ReadAppDelegate* appDelegate = (ReadAppDelegate*)[[UIApplication sharedApplication] delegate];
	[bookLabel setText:appDelegate.currentDoc];
	NSLog(@"View will appear! %@", appDelegate.currentDoc);
}

/*
 Implement loadView if you want to create a view hierarchy programmatically
- (void)loadView {
}
 */

/*
 If you need to do additional setup after loading the view, override viewDidLoad.
- (void)viewDidLoad {
}
 */


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[super dealloc];
}


@end
