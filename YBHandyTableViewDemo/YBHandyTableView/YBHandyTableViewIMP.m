//
//  YBHandyTableViewIMP.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "YBHandyTableViewIMP.h"
#import <UIKit/UIKit.h>

@interface YBHandyTableViewIMP () <UITableViewDataSource, UITableViewDelegate>
@end

@implementation YBHandyTableViewIMP

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    YBHTSection *htSection = self.sectionArray[indexPath.section];
    id<YBHTCellModelProtocol> cellModel = htSection.rowArray[indexPath.row];
    
    if ([cellModel.ybht_cellClass respondsToSelector:@selector(ybht_heightForCellWithModel:reuseIdentifier:indexPath:)]) {
        return [cellModel.ybht_cellClass ybht_heightForCellWithModel:cellModel reuseIdentifier:[self reuseIdentifierForCellModel:cellModel] indexPath:indexPath];
    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    YBHTSection *htSection = self.sectionArray[section];
    id<YBHTHeaderFooterModelProtocol> model = htSection.headerModel;
    
    return [self heightForHeaderFooterWithTableView:tableView model:model section:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    YBHTSection *htSection = self.sectionArray[section];
    id<YBHTHeaderFooterModelProtocol> model = htSection.footerModel;
    
    return [self heightForHeaderFooterWithTableView:tableView model:model section:section];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    YBHTSection *htSection = self.sectionArray[section];
    id<YBHTHeaderFooterModelProtocol> model = htSection.headerModel;
    if (!model) return nil;
    
    return [self viewForHeaderFooterWithTableView:tableView model:model section:section];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    YBHTSection *htSection = self.sectionArray[section];
    id<YBHTHeaderFooterModelProtocol> model = htSection.footerModel;
    if (!model) return nil;
    
    return [self viewForHeaderFooterWithTableView:tableView model:model section:section];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sectionArray[section].rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YBHTSection *htSection = self.sectionArray[indexPath.section];
    id<YBHTCellModelProtocol> cellModel = htSection.rowArray[indexPath.row];
    
    Class cellClass = cellModel.ybht_cellClass;
    NSString *identifier = [self reuseIdentifierForCellModel:cellModel];
    UITableViewCell<YBHTCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell ybht_setCellModel:cellModel];
    
    if ([cell respondsToSelector:@selector(setYbht_reloadTableView:)]) {
        __weak typeof(tableView) wTableView = tableView;
        [cell setYbht_reloadTableView:^{
            __strong typeof(wTableView) sTableView = wTableView;
            if (sTableView) {
                [sTableView reloadData];
            }
        }];
    }
    
    return cell;
}

#pragma mark - private

- (NSString *)reuseIdentifierForCellModel:(id<YBHTCellModelProtocol>)model {
    return (model && [model respondsToSelector:@selector(ybht_cellReuseIdentifier)]) ? model.ybht_cellReuseIdentifier : NSStringFromClass(model.ybht_cellClass);
}

- (NSString *)reuseIdentifierForHeaderFooterModel:(id<YBHTHeaderFooterModelProtocol>)model {
    return (model && [model respondsToSelector:@selector(ybht_headerFooterReuseIdentifier)]) ? model.ybht_headerFooterReuseIdentifier : NSStringFromClass(model.ybht_headerFooterClass);
}

- (CGFloat)heightForHeaderFooterWithTableView:(UITableView *)tableView model:(id<YBHTHeaderFooterModelProtocol>)model section:(NSInteger)section {
    if (model && [model.ybht_headerFooterClass respondsToSelector:@selector(ybht_heightForHeaderFooterWithModel:reuseIdentifier:section:)]) {
        return [model.ybht_headerFooterClass ybht_heightForHeaderFooterWithModel:model reuseIdentifier:[self reuseIdentifierForHeaderFooterModel:model] section:section];
    }
    return tableView.style == UITableViewStylePlain ? 0 : CGFLOAT_MIN;
}

- (__kindof UIView *)viewForHeaderFooterWithTableView:(UITableView *)tableView model:(id<YBHTHeaderFooterModelProtocol>)model section:(NSInteger)section {
    Class headerClass = model.ybht_headerFooterClass;
    NSString *identifier = [self reuseIdentifierForHeaderFooterModel:model];
    
    UIView *view = nil;
    if ([headerClass isKindOfClass:UITableViewHeaderFooterView.class]) {
        view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
        if (!view) {
            view = [[headerClass alloc] initWithReuseIdentifier:identifier];
        }
    } else {
        view = [headerClass new];
    }
    
    if ([view conformsToProtocol:@protocol(YBHTHeaderFooterProtocol)]) {
        [(id<YBHTHeaderFooterProtocol>)view ybht_setHeaderFooterModel:model];
    }
    
    return view;
}

@end
