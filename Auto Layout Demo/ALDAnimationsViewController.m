//
//  ALDAnimationsViewController.m
//  Auto Layout Demo
//
//  Created by Samuel Grossberg on 7/30/14.
//
//

#import "ALDAnimationsViewController.h"

#import <Masonry/Masonry.h>

static const CGFloat kCollapsedHeight = 100.f;
static const CGFloat kExpandedHeight = 300.f;

@interface ALDAnimationsViewController ()
@property (nonatomic) UIButton *button;
@property (nonatomic) UIView *box;
@property (nonatomic) BOOL expanded;
@end

@implementation ALDAnimationsViewController

- (void)loadView {
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createSubviews];
    [self addSubviews];
    [self addConstraints];
}

- (void)createSubviews {
    [self createButton];
    [self createBox];
}

- (void)addSubviews {
    [self.view addSubview:self.button];
    [self.view addSubview:self.box];
}

- (void)addConstraints {
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(70);
        make.centerX.equalTo(self.view);
    }];
    
    [_box mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_button.mas_bottom).offset(20);
        make.width.equalTo(@200.0);
        make.height.equalTo(@(kCollapsedHeight));
        make.centerX.equalTo(self.view);
    }];
}

- (void)createButton {
    _button = [UIButton buttonWithType:UIButtonTypeSystem];
    [_button setTitle:@"Push me!" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
}

- (void)createBox {
    _box = [UIView new];
    _box.backgroundColor = [UIColor colorWithRed:0.9f green:0.2f blue:0.4f alpha:1.f];
}

- (void)buttonTapped {
    [self.box mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(self.expanded ? kCollapsedHeight : kExpandedHeight));
    }];
    _button.enabled = NO;
    [UIView animateWithDuration:1.5 delay:0.0 usingSpringWithDamping:0.4f initialSpringVelocity:5.f options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.button.enabled = YES;
    }];
    self.expanded = !self.expanded;
}

@end
