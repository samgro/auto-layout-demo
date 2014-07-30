//
//  UIView+ALDAutoLayout.m
//  Auto Layout Demo
//
//  Created by Samuel Grossberg on 7/30/14.
//
//

#import "UIView+ALDAutoLayout.h"

@implementation UIView (ALDAutoLayout)

- (void)requireExactIntrinsicContentSize {
    [self setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

@end
