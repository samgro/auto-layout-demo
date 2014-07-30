//
//  ALDLabelsViewController.m
//  Auto Layout Demo
//
//  Created by Samuel Grossberg on 7/30/14.
//
//

#import "ALDLabelsViewController.h"

#import "ALDAutoHeightLabel.h"

#import <Masonry/Masonry.h>

@interface ALDLabelsViewController ()
@property (nonatomic) ALDAutoHeightLabel *label1;
@property (nonatomic) ALDAutoHeightLabel *label2;
@end

@implementation ALDLabelsViewController

- (void)loadView {
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor colorWithRed:0.8f green:0.9f blue:1.f alpha:1.f];
    
    [self createSubviews];
    [self addSubviews];
    [self addConstraints];
}

- (void)createSubviews {
    _label1 = [ALDAutoHeightLabel new];
    _label1.text = @"You think water moves fast? You should see ice. It moves like it has a mind. Like it knows it killed the world once and got a taste for murder. After the avalanche, it took us a week to climb out. Now, I don't know exactly when we turned on each other, but I know that seven of us survived the slide... and only five made it out. Now we took an oath, that I'm breaking now. We said we'd say it was the snow that killed the other two, but it wasn't. Nature is lethal but it doesn't hold a candle to man.";
    
    _label2 = [ALDAutoHeightLabel new];
    _label2.text = @"Do you see any Teletubbies in here? Do you see a slender plastic tag clipped to my shirt with my name printed on it?";
}

- (void)addSubviews {
    [self.view addSubview:_label1];
    [self.view addSubview:_label2];
}

- (void)addConstraints {
    for (UIView *view in @[_label1, _label2]) {
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.view).with.offset(10);
            make.trailing.equalTo(self.view).with.offset(-10);
        }];
    }
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(74);
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label1.mas_bottom).with.offset(10);
    }];
}

@end
