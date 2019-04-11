//
//  TCEasyViewController.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2019/4/11.
//  Copyright © 2019 杨波. All rights reserved.
//

#import "TCEasyViewController.h"
#import "TCEasyModel.h"
#import "TCEasyCell.h"

@interface TCEasyViewController () <TCEasyCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation TCEasyViewController

#pragma mark - life cycle

- (void)dealloc {
    NSLog(@"释放：%@", self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"YBHandyTableView";
    [self.view addSubview:self.tableView];
    [self loadData];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - private

- (void)loadData {
    
    // 构造数据模型
    TCEasyModel *model0 = TCEasyModel.new;
    model0.delegate = self;
    model0.text = @"第一条数据";
    TCEasyModel *model1 = TCEasyModel.new;
    model1.delegate = self;
    model1.text = @"第二条数据";
    
    // 构造配置数据
    YBHTCellConfig *c0 = [YBHTCellConfig new];
    c0.model = model0;
    c0.cellClass = TCEasyCell.self;
    YBHTCellConfig *c1 = [YBHTCellConfig new];
    c1.model = model1;
    c1.cellClass = TCEasyCell.self;

    // 赋值 tableview 并刷新
    [self.tableView.ybht_rowArray addObjectsFromArray:@[c0, c1]];
    [self.tableView reloadData];
}

#pragma mark - <TCEasyCellDelegate>

- (void)easyCell:(TCEasyCell *)cell clickButton:(UIButton *)button {
    NSLog(@"点击了button");
}

#pragma mark - getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = 44;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

@end
