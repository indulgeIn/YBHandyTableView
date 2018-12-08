//
//  TCViewController.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "TCViewController.h"
#import "TCDataCenter.h"

@interface TCViewController () <UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TCDataCenter *dataCenter;
@property (nonatomic, strong) UILabel *tableViewHeader;
@end

@implementation TCViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
    [self initData];
}

- (void)initViews {
    [self.view addSubview:self.tableView];
    [self.tableView ybht_addDelegate:self];
}

- (void)initData {
    TCFunctionModel *fModel = [TCFunctionModel new];
    fModel.title = @"霸王防脱洗发露，你值得拥有";
    
    TCBannerModel *bModel = [TCBannerModel new];
    
    YBHTConfigurator *config = [YBHTConfigurator new];
    [config.cellModelArray addObjectsFromArray:@[bModel, fModel]];
    [self.tableView.ybht_dataArray addObject:config];
    [self.tableView reloadData];
    
    [self network];
}

- (void)network {
    self.tableView.tableHeaderView = self.tableViewHeader;
    [self.dataCenter network_getTCListSuccess:^(NSArray<TCListModel *> * _Nonnull dataArray, TCBannerModel * _Nonnull bannerModel) {
        self.tableView.tableHeaderView = nil;
        
        [self.tableView.ybht_dataArray[0].cellModelArray replaceObjectAtIndex:0 withObject:bannerModel];
        [self.tableView.ybht_dataArray[0].cellModelArray addObjectsFromArray:dataArray];
        [self.tableView reloadData];
    } failed:nil];
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了cell: %ld-%ld", indexPath.section, indexPath.row);
}

#pragma mark - getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = 44;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
    }
    return _tableView;
}

- (TCDataCenter *)dataCenter {
    if (!_dataCenter) {
        _dataCenter = [TCDataCenter new];
    }
    return _dataCenter;
}

- (UILabel *)tableViewHeader {
    if (!_tableViewHeader) {
        _tableViewHeader = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
        _tableViewHeader.textColor = [UIColor cyanColor];
        _tableViewHeader.textAlignment = NSTextAlignmentCenter;
        _tableViewHeader.text = @"Loading...";
    }
    return _tableViewHeader;
}

@end
