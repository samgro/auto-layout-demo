//
//  ALDTableViewController.m
//  Auto Layout Demo
//
//  Created by Samuel Grossberg on 7/30/14.
//
//

#import "ALDTableViewController.h"

#import "ALDTableViewCell.h"

@interface ALDTableViewController ()
@property (nonatomic) NSArray *labels;
@property (nonatomic) ALDTableViewCell *hiddenLayoutCell;
@end

@implementation ALDTableViewController

- (void)loadView {
    self.labels = @[@"Hello friends",
                    @"The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men. Blessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost children. And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee.",
                    @"OH HAI AUTO SIZING TABLE CELL LOOK AT ME I'M SO COOL I MAKE YOUR LIFE EASIER WHHEEEEEEEEE"];
    
    UITableView *tableView = [UITableView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[ALDTableViewCell class] forCellReuseIdentifier:@"DemoCell"];
    self.tableView = tableView;
    self.view = tableView;
    
    self.hiddenLayoutCell = [ALDTableViewCell new];
    self.hiddenLayoutCell.hidden = YES;
    [tableView addSubview:self.hiddenLayoutCell];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.labels count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.hiddenLayoutCell.text = self.labels[indexPath.row];
    [self.hiddenLayoutCell.contentView setNeedsLayout];
    [self.hiddenLayoutCell.contentView layoutIfNeeded];
    return [self.hiddenLayoutCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ALDTableViewCell *cell = (ALDTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DemoCell"];
    cell.text = self.labels[indexPath.row];
    return cell;
}

@end
