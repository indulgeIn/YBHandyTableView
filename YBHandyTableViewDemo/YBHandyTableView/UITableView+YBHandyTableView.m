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

static const void *ybht_keyOfSectionArray = &ybht_keyOfSectionArray;
static const void *ybht_keyOfProxy = &ybht_keyOfProxy;
static const void *ybht_keyOfImp = &ybht_keyOfImp;

@interface UITableView ()
@property (nonatomic, strong) YBHandyTableViewProxy *ybht_proxy;
@property (nonatomic, strong) YBHandyTableViewIMP *ybht_imp;
@end

@implementation UITableView (YBHandyTableView)

#pragma mark - public

- (void)ybht_addDelegate:(id<UITableViewDelegate>)delegate {
    [self.ybht_proxy addTarget:delegate];
}

- (void)ybht_addDataSource:(id<UITableViewDataSource>)dataSource {
    [self.ybht_proxy addTarget:dataSource];
}

#pragma mark - getter && setter

- (NSMutableArray<id<YBHTCellModelProtocol>> *)ybht_rowArray {
    return self.ybht_section.rowArray;
}

- (YBHTSection *)ybht_section {
    if (self.ybht_sectionArray.count > 0) {
        return self.ybht_sectionArray[0];
    }
    YBHTSection *section = [YBHTSection new];
    [self.ybht_sectionArray addObject:section];
    return section;
}

- (void)setYbht_sectionArray:(NSMutableArray<YBHTSection *> * _Nonnull)ybht_sectionArray {
    objc_setAssociatedObject(self, ybht_keyOfSectionArray, ybht_sectionArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)ybht_sectionArray {
    NSMutableArray *array = objc_getAssociatedObject(self, ybht_keyOfSectionArray);
    if (!array) {
        array = [NSMutableArray array];
        self.ybht_sectionArray = array;
        
        self.ybht_imp.dataArray = array;
        [self.ybht_proxy addTarget:self.ybht_imp];
        self.delegate = (id<UITableViewDelegate>)self.ybht_proxy;
        self.dataSource = (id<UITableViewDataSource>)self.ybht_proxy;
    }
    return array;
}

- (void)setYbht_proxy:(YBHandyTableViewProxy *)ybht_proxy {
    objc_setAssociatedObject(self, ybht_keyOfProxy, ybht_proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YBHandyTableViewProxy *)ybht_proxy {
    YBHandyTableViewProxy *proxy = objc_getAssociatedObject(self, ybht_keyOfProxy);
    if (!proxy) {
        proxy = [YBHandyTableViewProxy new];
        self.ybht_proxy = proxy;
    }
    return proxy;
}

- (void)setYbht_imp:(YBHandyTableViewIMP *)ybht_imp {
    objc_setAssociatedObject(self, ybht_keyOfImp, ybht_imp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YBHandyTableViewIMP *)ybht_imp {
    YBHandyTableViewIMP *imp = objc_getAssociatedObject(self, ybht_keyOfImp);
    if (!imp) {
        imp = [YBHandyTableViewIMP new];
        self.ybht_imp = imp;
    }
    return imp;
}

@end
