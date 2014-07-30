//
//  ALDAutoHeightLabel.m
//  Auto Layout Demo
//
//  Created by Samuel Grossberg on 7/30/14.
//
//

#import "ALDAutoHeightLabel.h"

@implementation ALDAutoHeightLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.numberOfLines = 0;
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    self.preferredMaxLayoutWidth = bounds.size.width;
}

@end
