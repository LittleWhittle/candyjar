//
//  GMModelViewController.m
//  GMViewControllerWithCallback
//
//  Created by Manoharan Velayutham on 8/8/17.
//  Copyright © 2017 Manoharan Velayutham. All rights reserved.
//

#import "GMModelViewController.h"

@interface GMModelViewController ()
@end

@implementation GMModelViewController

- (void)viewDidLoad {
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    UILabel * myLabel = [[UILabel alloc] init];
    myLabel.translatesAutoresizingMaskIntoConstraints = NO;
    myLabel.text = @"Hello, Mr. Happy Coding";
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:myLabel];
    [myLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20].active = YES;
    [myLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:20].active = YES;
    [myLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    
    // Left nav bar button
    UIBarButtonItem * leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(Cancel:)];
    self.navigationItem.title = @"Hello";
    self.navigationItem.leftBarButtonItem = leftBarButton;

    // Right nav bar button
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Update" style:UIBarButtonItemStyleDone target:self action:@selector(Update:)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    NSLog(@"dealloc");
}

- (IBAction)Cancel:(id)sender {
    NSLog(@"Cancel");
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Oops! Dismissed from GMViewController");
        self.completion(@"Hello Mr.Happy will see you soon.!!! 😊");
    }];
}

- (IBAction)Update:(id)sender {
    NSLog(@"Update");
}


@end
