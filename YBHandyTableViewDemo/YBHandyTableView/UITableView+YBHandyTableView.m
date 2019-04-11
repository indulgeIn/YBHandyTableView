//
//  UITableView+YBHandyTableView.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/11/18.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "UITableView+YBHandyTableView.h"
#import <objc/runtime.h>
#import "YBHandyTableViewProxy.h"
#import "YBHandyTableViewIMP.h"

static const void *YBHTSectionArrayKey = &YBHTSectionArrayKey;
static const void *YBHTProxyKey = &YBHTProxyKey;
static const void *YBHTIMPKey = &YBHTIMPKey;

@interface UITableView ()
@property (nonatomic, strong) YBHandyTableViewProxy *ybht_proxy;
@property (nonatomic, strong) YBHandyTableViewIMP *ybht_IMP;
@end

@implementation UITableView (YBHandyTableView)

#pragma mark - public

- (void)ybht_addDelegate:(id<UITableViewDelegate>)delegate {
    [self.ybht_proxy addTarget:delegate];
}

- (void)ybht_addDataSource:(id<UITableViewDataSource>)dataSource {
    [self.ybht_proxy addTarget:dataSource];
}

#pragma mark - getter && setter (syntactic sugar)

- (NSMutableArray<id<YBHTCellConfigProtocol>> *)ybht_rowArray {
    return self.ybht_firstSection.rowArray;
}

- (void)setYbht_headerConfig:(id<YBHTHeaderFooterConfigProtocol>)ybht_headerConfig {
    self.ybht_firstSection.headerConfig = ybht_headerConfig;
}

- (id<YBHTHeaderFooterConfigProtocol>)ybht_headerConfig {
    return self.ybht_firstSection.headerConfig;
}

- (void)setYbht_footerConfig:(id<YBHTHeaderFooterConfigProtocol>)ybht_footerConfig {
    self.ybht_firstSection.footerConfig = ybht_footerConfig;
}

- (id<YBHTHeaderFooterConfigProtocol>)ybht_footerConfig {
    return self.ybht_firstSection.footerConfig;
}

- (YBHTSection *)ybht_firstSection {
    if (self.ybht_sectionArray.count > 0) {
        return self.ybht_sectionArray[0];
    }
    YBHTSection *section = [YBHTSection new];
    [self.ybht_sectionArray addObject:section];
    return section;
}

#pragma mark - getter & setter (data source)

- (void)setYbht_sectionArray:(NSMutableArray<YBHTSection *> * _Nonnull)ybht_sectionArray {
    objc_setAssociatedObject(self, YBHTSectionArrayKey, ybht_sectionArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)ybht_sectionArray {
    NSMutableArray *array = objc_getAssociatedObject(self, YBHTSectionArrayKey);
    if (!array) {
        array = [NSMutableArray array];
        self.ybht_sectionArray = array;
        
        self.ybht_IMP.sectionArray = array;
        [self.ybht_proxy addTarget:self.ybht_IMP];
        self.delegate = (id<UITableViewDelegate>)self.ybht_proxy;
        self.dataSource = (id<UITableViewDataSource>)self.ybht_proxy;
    }
    return array;
}

#pragma mark - getter & setter (proxy / IMP)

- (void)setYbht_proxy:(YBHandyTableViewProxy *)ybht_proxy {
    objc_setAssociatedObject(self, YBHTProxyKey, ybht_proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YBHandyTableViewProxy *)ybht_proxy {
    YBHandyTableViewProxy *proxy = objc_getAssociatedObject(self, YBHTProxyKey);
    if (!proxy) {
        proxy = [YBHandyTableViewProxy new];
        self.ybht_proxy = proxy;
    }
    return proxy;
}

- (void)setYbht_IMP:(YBHandyTableViewIMP *)ybht_IMP {
    objc_setAssociatedObject(self, YBHTIMPKey, ybht_IMP, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YBHandyTableViewIMP *)ybht_IMP {
    YBHandyTableViewIMP *imp = objc_getAssociatedObject(self, YBHTIMPKey);
    if (!imp) {
        imp = [YBHandyTableViewIMP new];
        self.ybht_IMP = imp;
    }
    return imp;
}

@end
