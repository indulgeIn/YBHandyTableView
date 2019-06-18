//
//  YBHandyTableViewIMP.m
//  YBHandyTableView<https://github.com/indulgeIn/YBHandyTableView>
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
        NSString *path = [[NSBundle mainBundle] pathForResource:NSStringFromClass(cellClass) ofType:@"nib"];
        if (path) {
            [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellReuseIdentifier:identifier];
        } else {
            [tableView registerClass:cellClass forCellReuseIdentifier:identifier];
        }
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
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
    NSString *identifier;
    if (config && [config respondsToSelector:@selector(ybht_cellReuseIdentifier)]) {
        identifier = [config ybht_cellReuseIdentifier];
    }
    return identifier ?: NSStringFromClass(config.ybht_cellClass);
}

- (NSString *)reuseIdentifierForHeaderFooterConfig:(id<YBHTHeaderFooterConfigProtocol>)config {
    NSString *identifier;
    if (config && [config respondsToSelector:@selector(ybht_headerFooterReuseIdentifier)]) {
        identifier = [config ybht_headerFooterReuseIdentifier];
    }
    return identifier ?: NSStringFromClass(config.ybht_headerFooterClass);
}

- (CGFloat)heightForHeaderFooterWithTableView:(UITableView *)tableView config:(id<YBHTHeaderFooterConfigProtocol>)config section:(NSInteger)section {
    if (config && [config.ybht_headerFooterClass respondsToSelector:@selector(ybht_heightForHeaderFooterWithConfig:reuseIdentifier:section:)]) {
        return [config.ybht_headerFooterClass ybht_heightForHeaderFooterWithConfig:config reuseIdentifier:[self reuseIdentifierForHeaderFooterConfig:config] section:section];
    }
    return tableView.style == UITableViewStylePlain ? 0 : CGFLOAT_MIN;
}

- (__kindof UIView *)viewForHeaderFooterWithTableView:(UITableView *)tableView config:(id<YBHTHeaderFooterConfigProtocol>)config section:(NSInteger)section {
    if (!config) return nil;
    
    Class headerFooterClass = config.ybht_headerFooterClass ?: UIView.self;
    NSString *identifier = [self reuseIdentifierForHeaderFooterConfig:config];
    
    UIView *view = nil;
    if ([headerFooterClass isKindOfClass:UITableViewHeaderFooterView.class]) {
        view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
        if (!view) {
            NSString *path = [[NSBundle mainBundle] pathForResource:NSStringFromClass(headerFooterClass) ofType:@"nib"];
            if (path) {
                [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(headerFooterClass) bundle:nil] forHeaderFooterViewReuseIdentifier:identifier];
            } else {
                [tableView registerClass:headerFooterClass forHeaderFooterViewReuseIdentifier:identifier];
            }
            view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
        }
    } else {
        view = [headerFooterClass new];
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
