//
//  GMModelViewController.h
//  GMViewControllerWithCallback
//
//  Created by Manoharan Velayutham on 8/8/17.
//  Copyright © 2017 Manoharan Velayutham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMModelViewController : UIViewController

typedef void (^MyCompletionBlock)(NSString *);
@property(nonatomic, copy) MyCompletionBlock completion;

- (IBAction)Cancel:(id)sender;

- (IBAction)Update:(id)sender;

@end
