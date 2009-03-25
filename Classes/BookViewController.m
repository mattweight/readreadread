//
//  BookViewController.m
//  Read
//
//  Created by Matt Weight on 8/20/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "BookViewController.h"
#import "OptionsViewController.h"

@implementation BookViewController

@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Initialization code
		//if (self.interfaceOrientation == UIInterfaceOrientationPortrait) {
			//[[UIApplication sharedApplication] setStatusBarHidden:YES];
			//textView = [[UITextView alloc] initWithFrame:CGRectMake(0, -20, 480, 320)];
			//NSLog(@"Going to portrait");
		appDelegate = (ReadAppDelegate*)[[UIApplication sharedApplication] delegate];
		textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
		[textView setEditable:NO];
		[textView setScrollsToTop:NO];
		
		[textView setDelegate:self];
		/*
		}
		else {
			NSLog(@"Going to landscape");
		}
		*/
		[textView setEditable:NO];
		[textView setTextColor:[UIColor blackColor]];
		[self.view addSubview:textView];

		UIButton* backButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
		[backButton setFrame:CGRectMake(298, 435, 18, 19)];
		[backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchDown];
		[self.view addSubview:backButton];
		//[backButton release];
	}
	return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	[appDelegate setCurrentPosition:[textView contentOffset]];
}

- (IBAction)back:(id)sender {
	//[self.view removeFromSuperview];
	OptionsViewController* options = [[OptionsViewController alloc] initWithNibName:@"OptionsView" bundle:nil];
	[self presentModalViewController:options animated:YES];
}

/*
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	NSLog(@"About to change orientation");
	if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
		[[UIApplication sharedApplication] setStatusBarHidden:NO];
		[textView setFrame:CGRectMake(0, 0, 320, 460)];
	}
	else {
		[[UIApplication sharedApplication] setStatusBarHidden:YES];
		[textView setFrame:CGRectMake(0, 0, 480, 320)];
	}
}
*/

- (void)loadBook:(NSString*)bookPath {	
	NSString* fullPath = [[NSString alloc] initWithFormat:@"%@/%@", NSHomeDirectory(), bookPath];
	[textView setFont:[UIFont fontWithName:@"Arial" size:22]];
	[textView setText:[NSString stringWithContentsOfFile:fullPath]];
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
	//return YES;
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}

- (void)viewDidDisappear:(BOOL)animated {
	NSLog(@"View did disappear");
}

- (void)dealloc {
	[textView release];
	[super dealloc];
}


@end
