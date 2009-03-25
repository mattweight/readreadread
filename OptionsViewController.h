//
//  OptionsViewController.h
//  Read
//
//  Created by Matt Weight on 9/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OptionsViewController : UIViewController {
	IBOutlet UILabel* bookLabel;
}

@property(nonatomic, retain) UILabel* bookLabel;

- (IBAction)back:(id)sender;


@end
