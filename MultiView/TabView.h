//
//  TabView.h
//  MultiView
//
//  Created by Dean Thibault on 6/16/14.
//  Copyright (c) 2014 Thibault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabView : UIView

@property (nonatomic) BOOL isSelected;
@property (nonatomic, retain) UILabel *title;
@property (nonatomic, retain) UIButton *close;
@property (nonatomic, retain) UIViewController *childViewController;

- (void) setSelected:(BOOL)selected;
- (void) setTitleText:(NSString *)titleText;

@end
