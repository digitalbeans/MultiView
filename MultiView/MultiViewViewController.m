//
//  MultiViewViewController.m
//  MultiView
//
//  Created by Dean Thibault on 6/14/14.
//  Copyright (c) 2014 Thibault. All rights reserved.
//

#import "MultiViewViewController.h"
#import "TestViewController.h"

@implementation MultiViewViewController

@synthesize views;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	views = [NSMutableArray arrayWithCapacity:1];
	
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addWindow:)];
	[self.navigationItem setRightBarButtonItem:addButton];
	
//	for (int i=0; i<6; i++) {
//		TestViewController *v = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
//		[views addObject:v];
//	}
	
//	int x =0;
//	int y =0;
//	int	width = self.view.frame.size.width/3;
//	int height = self.view.frame.size.height/2;
//	
//	for (int j=0; j< [views count]; j++) {
//    	CGRect frame = CGRectMake(x, y, width, height);
//		UIViewController *vc = [views objectAtIndex:j];
//		UIView *view = vc.view;
//		[view setFrame:frame];
//		[vc willMoveToParentViewController:self];
//		[self addChildViewController: vc];
//		[self.view addSubview: vc.view];
//		[vc didMoveToParentViewController:self];
//		
//		x = x + width;
//		if (x >= self.view.frame.size.width) {
//			x = 0;
//			y = y + height;
//		}
//	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) addWindow:(id)sender {
	if ([self.views count] <=6) {
//		for (int i=0; i<6; i++) {
			TestViewController *v = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
			[views addObject:v];
//		}

		[self layoutSubviews];
	}
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	[self layoutSubviews];
}

- (void)layoutSubviews {

	int horizNum = 0;
	int vertNum = 0;
	if (UIInterfaceOrientationIsPortrait([[UIDevice currentDevice] orientation])) {
    	horizNum = 2;
		vertNum = 3;
	} else {
		horizNum = 3;
		vertNum = 2;
	}
	
	int x =0;
	int y =0;
	int	width = self.view.frame.size.width/horizNum;
	int height = self.view.frame.size.height/vertNum;
	
	for (int j=0; j< [views count]; j++) {
    	CGRect frame = CGRectMake(x, y, width, height);
		UIViewController *vc = [views objectAtIndex:j];
		UIView *view = vc.view;
		[view setFrame:frame];
		[vc willMoveToParentViewController:self];
		[self addChildViewController: vc];
		[self.view addSubview: vc.view];
		[vc didMoveToParentViewController:self];
		
		x = x + width;
		if (x >= self.view.frame.size.width) {
			x = 0;
			y = y + height;
		}
	}

}

@end
