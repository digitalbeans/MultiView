//
//  ViewController.m
//  MultiView
//
//  Created by Dean Thibault on 6/14/14.
//  Copyright (c) 2014 Thibault. All rights reserved.
//

#import "ViewController.h"
#import "MultiViewViewController.h"
#import "TabbedViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
//	MultiViewViewController *mv = [[MultiViewViewController alloc] initWithNibName:@"MultiViewViewController" bundle:nil];
//	[self pushViewController:mv animated:YES];
	
	TabbedViewController *tv = [[TabbedViewController alloc] initWithNibName:@"TabbedViewController" bundle:nil];
	
	[self pushViewController:tv animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
