//
//  BookViewController.h
//  Read
//
//  Created by Matt Weight on 8/20/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadAppDelegate.h"


@interface BookViewController : UIViewController <UITextViewDelegate> {
	IBOutlet UITextView* textView;
	ReadAppDelegate* appDelegate;
}

@property (nonatomic, retain) UITextView* textView;

- (void)loadBook:(NSString*)bookPath;

- (IBAction)back:(id)sender;

@end
