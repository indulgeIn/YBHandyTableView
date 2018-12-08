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
    YBHTConfigurator *config = self.dataArray[indexPath.section];
    id<YBHTCellModelProtocol> model = config.cellModelArray[indexPath.row];
    
    if ([model respondsToSelector:@selector(ybht_cellClass)]) {
        if ([model.ybht_cellClass respondsToSelector:@selector(ybht_heightForCellWithModel:)]) {
            return [model.ybht_cellClass ybht_heightForCellWithModel:model];
        }
    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    YBHTConfigurator *config = self.dataArray[section];
    id<YBHTHeaderModelProtocol> model = config.headerModel;
    
    if (model && [model.ybht_headerClass respondsToSelector:@selector(ybht_heightForHeaderWithModel:)]) {
        return [model.ybht_headerClass ybht_heightForHeaderWithModel:model];
    }
    return tableView.style == UITableViewStylePlain ? 0 : CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    YBHTConfigurator *config = self.dataArray[section];
    id<YBHTFooterModelProtocol> model = config.footerModel;
    
    if (model && [model.ybht_footerClass respondsToSelector:@selector(ybht_heightForFooterWithModel:)]) {
        return [model.ybht_footerClass ybht_heightForFooterWithModel:model];
    }
    return tableView.style == UITableViewStylePlain ? 0 : CGFLOAT_MIN;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    YBHTConfigurator *config = self.dataArray[section];
    id<YBHTHeaderModelProtocol> model = config.headerModel;
    if (!model) return nil;
    
    Class headerClass = [model respondsToSelector:@selector(ybht_headerClass)] ? model.ybht_headerClass : UITableViewHeaderFooterView.class;
    NSString *identifier = NSStringFromClass(headerClass);
    UITableViewHeaderFooterView<YBHTHeaderProtocol> *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!header) {
        header = [[headerClass alloc] initWithReuseIdentifier:identifier];
    }
    
    if ([header respondsToSelector:@selector(ybht_setHeaderModel:)]) {
        [header ybht_setHeaderModel:model];
    }
    
    return header;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    YBHTConfigurator *config = self.dataArray[section];
    id<YBHTFooterModelProtocol> model = config.footerModel;
    if (!model) return nil;
    
    Class footerClass = [model respondsToSelector:@selector(ybht_footerClass)] ? model.ybht_footerClass : UITableViewHeaderFooterView.class;
    NSString *identifier = NSStringFromClass(footerClass);
    UITableViewHeaderFooterView<YBHTFooterProtocol> *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!footer) {
        footer = [[footerClass alloc] initWithReuseIdentifier:identifier];
    }
    
    if ([footer respondsToSelector:@selector(ybht_setFooterModel:)]) {
        [footer ybht_setFooterModel:model];
    }
    
    return footer;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray[section].cellModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YBHTConfigurator *config = self.dataArray[indexPath.section];
    id<YBHTCellModelProtocol> model = config.cellModelArray[indexPath.row];
    
    Class cellClass = [model respondsToSelector:@selector(ybht_cellClass)] ? model.ybht_cellClass : UITableViewCell.class;
    NSString *identifier = NSStringFromClass(cellClass);
    UITableViewCell<YBHTCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if ([cell respondsToSelector:@selector(ybht_setCellModel:)]) {
        [cell ybht_setCellModel:model];
    }
    
    return cell;
}

@end
