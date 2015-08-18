//
//  MultiViewViewController.h
//  MultiView
//
//  Created by Dean Thibault on 6/14/14.
//  Copyright (c) 2014 Thibault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiViewViewController : UIViewController

@property (nonatomic, retain) NSMutableArray *views;

- (IBAction) addWindow:(id)sender;


@end
