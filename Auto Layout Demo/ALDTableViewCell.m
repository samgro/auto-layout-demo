//
//  ALDTableViewCell.m
//  Auto Layout Demo
//
//  Created by Samuel Grossberg on 7/30/14.
//
//

#import "ALDTableViewCell.h"

#import "ALDAutoHeightLabel.h"

#import <Masonry/Masonry.h>

@interface ALDTableViewCell ()

@property (nonatomic) ALDAutoHeightLabel *label;

@end

@implementation ALDTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label = [ALDAutoHeightLabel new];
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_label.superview).with.offset(20);
            make.trailing.equalTo(_label.superview).with.offset(-10);
            make.top.equalTo(_label.superview).with.offset(10);
        }];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_label).with.offset(10);
            make.leading.equalTo(self.contentView.superview);
            make.trailing.equalTo(self.contentView.superview).priorityHigh();
            make.top.equalTo(self.contentView.superview);
            make.width.equalTo(self);
        }];
    }
    return self;
}

- (void)setText:(NSString *)text {
    _text = text;
    self.label.text = text;
}

@end
