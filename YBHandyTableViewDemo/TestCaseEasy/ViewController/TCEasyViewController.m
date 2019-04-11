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

@interface TCEasyViewController ()
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
    model0.text = @"第一条数据";
    TCEasyModel *model1 = TCEasyModel.new;
    model1.text = @"第二条数据";
    NSArray *dataArray = @[model0, model1];
    
    // 构造配置数据
    NSMutableArray *cellConfigArray = [NSMutableArray array];
    for (TCEasyModel *model in dataArray) {
        YBHTCellConfig *config = [YBHTCellConfig new];
        config.model = model;
        config.cellClass = TCEasyCell.self;
        [cellConfigArray addObject:config];
    }
    
    // 赋值 tableview 并刷新
    [self.tableView.ybht_rowArray addObjectsFromArray:cellConfigArray];
    [self.tableView reloadData];
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
