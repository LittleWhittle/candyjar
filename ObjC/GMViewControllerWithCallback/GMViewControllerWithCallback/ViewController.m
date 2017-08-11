//
//  ViewController.m
//  GMViewControllerWithCallback
//
//  Created by Manoharan Velayutham on 8/8/17.
//  Copyright © 2017 Manoharan Velayutham. All rights reserved.
//

#import "ViewController.h"
#import "GMModelViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ClickMe:(id)sender {
    NSLog(@"Click Me😊");
    GMModelViewController * gmViewController = [[GMModelViewController alloc] init];
    
    gmViewController.completion = ^(NSString * pickupDate) {
        if (pickupDate.length > 0) {
            NSLog(@"Your Pickup Date:: %@", pickupDate);
        } else {
            NSLog(@"Oops! Does not have enough data to present UI");
        }
    };
    
    UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:gmViewController];
    [self presentViewController:navController animated:YES completion:^{
        NSLog(@"Hey, Its a Completion");
    }];
}

@end
