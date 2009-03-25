//
//  ReadAppDelegate.m
//  Read
//
//  Created by Matt Weight on 8/20/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "ReadAppDelegate.h"
#import "ReadViewController.h"
#import "BookViewController.h"

@implementation ReadAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize currentDoc;


- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	defaults = [NSUserDefaults standardUserDefaults];
	
	NSString* lastDoc = [defaults objectForKey:@"read_current_doc"];
	CGFloat x = [defaults floatForKey:@"read_position_x"];
	CGFloat y = [defaults floatForKey:@"read_position_y"];
	
	NSLog(@"Last doc %@ at position %.03f x %.03f", lastDoc, x, y);
	
	CGPoint lastPosition = CGPointMake(x, y);
	[self setCurrentPosition:lastPosition];
	[self setCurrentDoc:lastDoc];
	
	if (lastDoc != nil) {
		BookViewController* bookController = [[BookViewController alloc] initWithNibName:@"BookView" bundle:nil];
		[bookController loadBook:currentDoc];
		[bookController.textView setContentOffset:currentPosition];
		[viewController.view addSubview:bookController.view];
	}

	// Override point for customization after app launch
    [window addSubview:viewController.view];
	[window makeKeyAndVisible];
}

- (void)setCurrentPosition:(CGPoint)thePoint {
	currentPosition = thePoint;
}

- (CGPoint)getCurrentPosition {
	return currentPosition;
}

- (void)applicationWillTerminate:(UIApplication *)application {
	NSLog(@"Last position for %@ is %.03f x %.03f", currentDoc, currentPosition.x, currentPosition.y);
	[defaults setObject:currentDoc forKey:@"read_current_doc"];
	[defaults setFloat:currentPosition.x forKey:@"read_position_x"];
	[defaults setFloat:currentPosition.y forKey:@"read_position_y"];
}

- (void)dealloc {
    [viewController release];
	[window release];
	[super dealloc];
}


@end
