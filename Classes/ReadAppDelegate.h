//
//  ReadAppDelegate.h
//  Read
//
//  Created by Matt Weight on 8/20/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReadViewController;

@interface ReadAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet ReadViewController *viewController;
	NSString* currentDoc;
	CGPoint currentPosition;
	NSUserDefaults* defaults;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) ReadViewController *viewController;
@property (nonatomic, retain) NSString* currentDoc;

- (void)setCurrentPosition:(CGPoint)thePoint;
- (CGPoint)getCurrentPosition;

@end

