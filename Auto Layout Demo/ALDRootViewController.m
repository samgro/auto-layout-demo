//
//  ALDRootViewController.m
//  Auto Layout Demo
//
//  Created by Samuel Grossberg on 7/30/14.
//
//

#import "ALDRootViewController.h"

#import "ALDAnimationsViewController.h"
#import "ALDLabelsViewController.h"
#import "ALDTableViewController.h"

#import "UIView+ALDAutoLayout.h"

#import <Masonry/Masonry.h>

@interface ALDRootViewController ()
@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) UIButton *rightButton;
@property (nonatomic) UIButton *leftButton;
@property (nonatomic) NSArray *buttonList;
@end

@implementation ALDRootViewController

- (void)loadView {
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.f];
    
    [self createSubviews];
    [self addSubviews];
    [self addConstraints];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)createSubviews {
    [self createNameLabel];
    [self createRightButton];
    [self createLeftButton];
    [self createButtonList];
}

- (void)createNameLabel {
    _nameLabel = [UILabel new];
    _nameLabel.text = @"Sam Grossbergmansteinowitz";
}

- (void)createRightButton {
    _rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_rightButton setTitle:@"Follow" forState:UIControlStateNormal];
}

- (void)createLeftButton {
    _leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_leftButton setTitle:@"Menu" forState:UIControlStateNormal];
}

- (void)createButtonList {
    NSMutableArray *list = [NSMutableArray array];
    for (NSString *label in @[@"Hello", @"World", @"Cats", @"Pizza"]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:label forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [list addObject:button];
    }
    _buttonList = [list copy];
}

- (void)addSubviews {
    [self.view addSubview:_nameLabel];
    [self.view addSubview:_rightButton];
    [self.view addSubview:_leftButton];
    for (UIButton *button in _buttonList) {
        [self.view addSubview:button];
    }
}

- (void)addConstraints {
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_nameLabel.superview).priorityLow();
        make.top.equalTo(_nameLabel.superview).with.offset(30);
        make.leading.greaterThanOrEqualTo(_leftButton.mas_trailing).with.offset(5);
        make.trailing.lessThanOrEqualTo(_rightButton.mas_leading).with.offset(-10);
    }];
    [_nameLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_leftButton.superview).with.offset(10);
//        make.top.equalTo(_leftButton.superview).with.offset(20);
        make.baseline.equalTo(_nameLabel.mas_baseline);
    }];
    [_leftButton requireExactIntrinsicContentSize];
    
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(_rightButton.superview).with.offset(-10);
//        make.top.equalTo(_leftButton);
        make.baseline.equalTo(_nameLabel);
    }];
    [_rightButton requireExactIntrinsicContentSize];
    
    [[_buttonList firstObject] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_leftButton.mas_bottom).with.offset(10);
    }];
    [[_buttonList lastObject] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-10);
    }];
    for (NSInteger i = 0; i < [_buttonList count]; i++) {
        UIButton *button = _buttonList[i];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(button.superview);
        }];
//        [button setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
        if (i != 0) {
            UIButton *previousButton = (UIButton *)_buttonList[i - 1];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(previousButton.mas_bottom).with.offset(-10);
                make.height.equalTo(previousButton);
            }];
        }
    }
}

- (void)buttonTapped:(UIButton *)sender {
    NSString *title = sender.titleLabel.text;
    if ([title isEqualToString:@"Hello"]) {
        [self.navigationController pushViewController:[ALDLabelsViewController new]
                                             animated:YES];
    } else if ([title isEqualToString:@"World"]) {
        [self.navigationController pushViewController:[ALDTableViewController new]
                                             animated:YES];
    } else if ([title isEqualToString:@"Cats"]) {
        [self.navigationController pushViewController:[ALDAnimationsViewController new]
                                             animated:YES];
    }
}

@end
