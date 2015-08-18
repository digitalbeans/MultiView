//
//  TabbedViewController.h
//  MultiView
//
//  Created by Dean Thibault on 6/16/14.
//  Copyright (c) 2014 Thibault. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabView.h"
@interface TabbedViewController : UIViewController <UIGestureRecognizerDelegate>


@property (nonatomic, retain) NSMutableArray *tabs;
@property (nonatomic, retain) TabView *currentTab;

- (IBAction) addTab:(id)sender;
- (void)tabSelected:(UITapGestureRecognizer *)recognizer;

@end
