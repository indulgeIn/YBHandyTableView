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
@property (nonatomic, strong) UILabel *tableViewFooter;
@end

@implementation TCViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
    [self initData];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

- (void)initViews {
    self.navigationItem.title = @"YBHandyTableView";
    [self.view addSubview:self.tableView];
    [self.tableView ybht_addDelegate:self];
}

#pragma mark - private

- (void)initData {
    
    //本地数据 header model
    TCListHeaderModel *headerModel = [TCListHeaderModel new];
    headerModel.title = @"动态";
    
    //占位的 cell model
    TCBannerModel *bCellModel = [TCBannerModel new];
    
    //本地数据 cell model
    TCFunctionModel *fCellModel = [TCFunctionModel new];
    fCellModel.title = @"点我变大";
    
    //赋值数据源（section0 配置两个 cell，section1 配置一个 header）
    YBHTSection *section0 = [YBHTSection new];
    [section0.rowArray addObjectsFromArray:@[bCellModel, fCellModel]];
    YBHTSection *section1 = [YBHTSection new];
    section1.headerModel = headerModel;
    [self.tableView.ybht_sectionArray addObjectsFromArray:@[section0, section1]];
    
    //刷新
    [self.tableView reloadData];
    
    //请求网络数据
    [self network_requestList];
}

- (void)network_requestList {
    self.tableViewFooter.text = @"Loading...";
    [self.dataCenter network_getTCListSuccess:^(NSArray<TCListModel *> * _Nonnull dataArray, TCBannerModel * _Nonnull bannerModel) {
        self.tableViewFooter.text = nil;
        
        //替换网络请求返回的 banner model
        [self.tableView.ybht_sectionArray[0].rowArray replaceObjectAtIndex:0 withObject:bannerModel];
        //追加列表数据 model
        [self.tableView.ybht_sectionArray[1].rowArray addObjectsFromArray:dataArray];
        //刷新
        [self.tableView reloadData];
    } failed:nil];
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id<YBHTCellModelProtocol> selectModel = self.tableView.ybht_sectionArray[indexPath.section].rowArray[indexPath.row];
    
    if ([selectModel isKindOfClass:TCBannerModel.class]) {
        
        TCBannerModel *model = (TCBannerModel *)selectModel;
        if (model.jumpUrl.length > 0) {
            UIViewController *webVC = [UIViewController new];
            webVC.view.backgroundColor = [UIColor whiteColor];
            webVC.navigationItem.title = model.jumpUrl;
            [self.navigationController pushViewController:webVC animated:YES];
        }
        
    } else if ([selectModel isKindOfClass:TCListModel.class]) {
        
        TCListModel *model = (TCListModel *)selectModel;
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"描述" message:model.des preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:ac animated:YES completion:nil];
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    //模拟上拉加载更多
    if (scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.bounds.size.height + 15 && self.tableViewFooter.text.length <= 0) {
        [self network_requestList];
    }
}

#pragma mark - getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = self.tableViewFooter;
        _tableView.estimatedRowHeight = 44;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.separatorColor = [UIColor groupTableViewBackgroundColor];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

- (TCDataCenter *)dataCenter {
    if (!_dataCenter) {
        _dataCenter = [TCDataCenter new];
    }
    return _dataCenter;
}

- (UILabel *)tableViewFooter {
    if (!_tableViewFooter) {
        _tableViewFooter = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
        _tableViewFooter.textColor = [UIColor purpleColor];
        _tableViewFooter.textAlignment = NSTextAlignmentCenter;
        _tableViewFooter.font = [UIFont boldSystemFontOfSize:14];
    }
    return _tableViewFooter;
}

@end
