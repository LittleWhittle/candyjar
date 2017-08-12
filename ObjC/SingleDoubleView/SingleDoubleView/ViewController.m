//
//  ViewController.m
//  SingleDoubleView
//
//  Created by Manoharan Velayutham on 8/11/17.
//  Copyright © 2017 Manoharan Velayutham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (UIColor *)myRandomBackgroundColor {
    NSArray * allColors = @[[UIColor yellowColor], [UIColor blueColor], [UIColor purpleColor], [UIColor orangeColor]];
    int index = arc4random_uniform((int)allColors.count);
    return allColors[index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)DoubleOrNothing:(id)sender {
    NSLog(@"Double Or Nothing");
    NSLog(@"All Subviews :: %@", self.view.subviews);
    UIView * viewToFind = [self.view viewWithTag:10];
    
    // Remove already added view
    UIView * previoudDoubleView = [self.view viewWithTag:20];
    if (previoudDoubleView) {
        [previoudDoubleView removeFromSuperview];
    }
    
    // Double the view
    UIView * doubleView = [[UIView alloc] init];
    doubleView.tag = 20;
    doubleView.backgroundColor = [self myRandomBackgroundColor];
    doubleView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:doubleView];
    
    [doubleView.leadingAnchor constraintEqualToAnchor:viewToFind.leadingAnchor].active = YES;
    [doubleView.trailingAnchor constraintEqualToAnchor:viewToFind.trailingAnchor].active = YES;
    [doubleView.topAnchor constraintEqualToAnchor:viewToFind.bottomAnchor constant:22].active = YES;
    [doubleView.heightAnchor constraintEqualToConstant:viewToFind.frame.size.height * 2].active = YES;

    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

@end
