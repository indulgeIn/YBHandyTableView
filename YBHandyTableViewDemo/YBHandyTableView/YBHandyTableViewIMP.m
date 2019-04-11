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
    id<YBHTCellConfigProtocol> cellConfig = htSection.rowArray[indexPath.row];
    
    if ([cellConfig.ybht_cellClass respondsToSelector:@selector(ybht_heightForCellWithConfig:reuseIdentifier:indexPath:)]) {
        return [cellConfig.ybht_cellClass ybht_heightForCellWithConfig:cellConfig reuseIdentifier:[self reuseIdentifierForCellConfig:cellConfig] indexPath:indexPath];
    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    YBHTSection *htSection = self.sectionArray[section];
    id<YBHTHeaderFooterConfigProtocol> config = htSection.headerConfig;
    
    return [self heightForHeaderFooterWithTableView:tableView config:config section:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    YBHTSection *htSection = self.sectionArray[section];
    id<YBHTHeaderFooterConfigProtocol> config = htSection.footerConfig;
    
    return [self heightForHeaderFooterWithTableView:tableView config:config section:section];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    YBHTSection *htSection = self.sectionArray[section];
    id<YBHTHeaderFooterConfigProtocol> config = htSection.headerConfig;
    
    return [self viewForHeaderFooterWithTableView:tableView config:config section:section];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    YBHTSection *htSection = self.sectionArray[section];
    id<YBHTHeaderFooterConfigProtocol> config = htSection.footerConfig;
    
    return [self viewForHeaderFooterWithTableView:tableView config:config section:section];
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
    id<YBHTCellConfigProtocol> cellConfig = htSection.rowArray[indexPath.row];
    
    Class cellClass = cellConfig.ybht_cellClass;
    NSString *identifier = [self reuseIdentifierForCellConfig:cellConfig];
    UITableViewCell<YBHTCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell ybht_setCellConfig:cellConfig];
    
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

- (NSString *)reuseIdentifierForCellConfig:(id<YBHTCellConfigProtocol>)config {
    return (config && [config respondsToSelector:@selector(ybht_cellReuseIdentifier)]) ? config.ybht_cellReuseIdentifier : NSStringFromClass(config.ybht_cellClass);
}

- (NSString *)reuseIdentifierForHeaderFooterConfig:(id<YBHTHeaderFooterConfigProtocol>)config {
    return (config && [config respondsToSelector:@selector(ybht_headerFooterReuseIdentifier)]) ? config.ybht_headerFooterReuseIdentifier : NSStringFromClass(config.ybht_headerFooterClass);
}

- (CGFloat)heightForHeaderFooterWithTableView:(UITableView *)tableView config:(id<YBHTHeaderFooterConfigProtocol>)config section:(NSInteger)section {
    if (config && [config.ybht_headerFooterClass respondsToSelector:@selector(ybht_heightForHeaderFooterWithConfig:reuseIdentifier:section:)]) {
        return [config.ybht_headerFooterClass ybht_heightForHeaderFooterWithConfig:config reuseIdentifier:[self reuseIdentifierForHeaderFooterConfig:config] section:section];
    }
    return tableView.style == UITableViewStylePlain ? 0 : CGFLOAT_MIN;
}

- (__kindof UIView *)viewForHeaderFooterWithTableView:(UITableView *)tableView config:(id<YBHTHeaderFooterConfigProtocol>)config section:(NSInteger)section {
    if (!config) return nil;
    
    Class headerClass = config.ybht_headerFooterClass;
    NSString *identifier = [self reuseIdentifierForHeaderFooterConfig:config];
    
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
        UIView<YBHTHeaderFooterProtocol> *tmpView = (UIView<YBHTHeaderFooterProtocol> *)view;
        
        [tmpView ybht_setHeaderFooterConfig:config];
        
        if ([tmpView respondsToSelector:@selector(setYbht_reloadTableView:)]) {
            __weak typeof(tableView) wTableView = tableView;
            [tmpView setYbht_reloadTableView:^{
                __strong typeof(wTableView) sTableView = wTableView;
                if (sTableView) {
                    [sTableView reloadData];
                }
            }];
        }
    }
    
    return view;
}

@end
