//
//  TabbedViewController.m
//  MultiView
//
//  Created by Dean Thibault on 6/16/14.
//  Copyright (c) 2014 Thibault. All rights reserved.
//

#import "TabbedViewController.h"
#import "TestViewController.h"
#import "TabView.h"

@implementation TabbedViewController

@synthesize tabs;

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
	
	tabs = [NSMutableArray arrayWithCapacity:1];
	
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTab:)];
	[self.navigationItem setRightBarButtonItem:addButton];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	[self layoutSubviews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) addTab:(id)sender {

	if ([self.tabs count] < 2) {
		for (int i=0; i<[tabs count]; i++) {
			[[tabs objectAtIndex:i] setSelected:NO];
		}
		
		CGRect newFrame = CGRectMake(0, 100, 100, 40);
		TabView *tab = [[TabView alloc] initWithFrame:newFrame];
		[tab.close addTarget:self action:@selector(removeTab:) forControlEvents:UIControlEventTouchUpInside];
		[tab setSelected:YES];
		
		TestViewController *vc = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
		[tab setChildViewController:vc];
	
		[tab setTitleText: [NSString stringWithFormat:@"Some Title %d", [self.tabs count]+1]];
		[tabs addObject:tab];
		
		UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabSelected:)];
		tapGesture.delegate = self;
		[tab addGestureRecognizer:tapGesture];
		
		[self.view addSubview:tab];
		
		[vc willMoveToParentViewController:self];
		[self addChildViewController: vc];
		[self.view addSubview: vc.view];
		[self.view bringSubviewToFront:vc.view];
		[vc didMoveToParentViewController:self];


		[self layoutSubviews];
	}
}

- (void)tabSelected:(UITapGestureRecognizer *)recognizer {
	TabView *tab = (TabView *)recognizer.view;
	[self selectTab:tab];
	[self.view bringSubviewToFront:[tab childViewController].view];

}

- (void)selectTab:(TabView *)aTab {
		for (int i=0; i<[tabs count]; i++) {
			[[tabs objectAtIndex:i] setSelected:NO];
		}
		[aTab setSelected:YES];
	
}

- (IBAction)removeTab:(id)sender {
	[tabs removeObject:[sender superview]];
	[[sender superview] removeFromSuperview];
	
	// ********************* need clean up memory here  ***********************************
	
	
	[self selectTab:[tabs lastObject]];
	[self layoutSubviews];
}

- (void)layoutSubviews {

	int minWidth = 125;
	int maxTabs = self.view.frame.size.width / minWidth;
	int numTabs = [self.tabs count];
	if (numTabs > maxTabs) {
	    numTabs = maxTabs;
	}
	
	int tabWidth = self.view.frame.size.width / numTabs;
//	if (UIInterfaceOrientationIsPortrait([[UIDevice currentDevice] orientation])) {
//	} else {
//	}
	
	CGRect tabFrame = CGRectMake(0, 75, tabWidth, 40);
	int x = 0;
	for (int i=0; i<numTabs; i++) {
    	TabView* tab = [self.tabs objectAtIndex:i];
		[tab setFrame:tabFrame];
		[tab setNeedsLayout];
		x = x + tabWidth;
		tabFrame.origin.x = x;
		
		CGRect newViewFrame = CGRectMake(0, CGRectGetMaxY(tabFrame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(tabFrame));
		UIView *view = [tab childViewController].view;
		[view setFrame:newViewFrame];

	}
	
//	x = 0;
//	int y =tabFrame.size.height;
//	int	width = self.view.frame.size.width;
//	int height = self.view.frame.size.height - tabFrame.size.height;
//	
//	CGRect viewFrame = CGRectMake(x, y, width, height);
	
	
}

@end
