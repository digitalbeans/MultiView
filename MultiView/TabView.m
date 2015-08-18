//
//  TabView.m
//  MultiView
//
//  Created by Dean Thibault on 6/16/14.
//  Copyright (c) 2014 Thibault. All rights reserved.
//

#import "TabView.h"

@implementation TabView

@synthesize title;
@synthesize close;
@synthesize childViewController;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		CGRect frm = CGRectMake(5, (frame.size.height - 30)/2, 40, 30);
		close = [[UIButton alloc] initWithFrame:frm];
		[close setTitle:@"X" forState:UIControlStateNormal];
		[close setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[self addSubview:close];


		frm = CGRectMake(frame.size.width/4, (frame.size.height - 30)/2, frame.size.width*0.75, 30);
		title = [[UILabel alloc] initWithFrame:frm];
		[title setText:@"New Title"];
		[title setTintColor:[UIColor blueColor]];
		[self addSubview:title];

		[self setBackgroundColor:[UIColor greenColor]];
    }
    return self;
}

- (void)layoutSubviews {
	CGRect closeFrame = CGRectMake(5, (self.frame.size.height - 30)/2, 30, 30);
	[close setFrame:closeFrame];
	
	CGRect titleFrame = CGRectMake(CGRectGetMaxX(closeFrame) + 10, (self.frame.size.height - 30)/2, self.frame.size.width - (CGRectGetMaxX(closeFrame) + 10) , 30);
	[title setFrame:titleFrame];
	 
}


- (void) setSelected:(BOOL)newValue {
	self.isSelected = newValue;
	
	if (self.isSelected) {
    	[self setBackgroundColor: [UIColor whiteColor]];
		self.layer.borderWidth = 0.0f;
	} else {
		[self setBackgroundColor:[UIColor lightGrayColor]];
		self.layer.borderColor = [UIColor darkGrayColor].CGColor;
		self.layer.borderWidth = 1.0f;
	}

}

- (void) setTitleText:(NSString *)titleText {
	[self.title setText:titleText];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
