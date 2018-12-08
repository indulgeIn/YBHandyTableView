//
//  TCDataCenter.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "TCDataCenter.h"

@implementation TCDataCenter

- (void)network_getTCListSuccess:(void (^)(NSArray<TCListModel *> * _Nonnull, TCBannerModel * _Nonnull))success failed:(void (^)(void))failed {
    
    //模拟网络请求
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (success) {
                
                //网络模拟返回数据
                NSArray *listData = @[@{@"text":@"别林斯基"},
                                  @{@"text":@"蒙田"},
                                  @{@"text":@"德奥弗拉斯多"},
                                  @{@"text":@"土地是以它的肥沃和收获而被估价的；才能也是土地，不过它生产的不是粮食，而是真理。如果只能滋生瞑想和幻想的话，即使再大的才能也只是砂地或盐池，那上面连小草也长不出来的。"},
                                  @{@"text":@"我需要三件东西：爱情友谊和图书。然而这三者之间何其相通！炽热的爱情可以充实图书的内容，图书又是人们最忠实的朋友"},
                                  @{@"text":@"时间是一切财富中最宝贵的财富。"}];
                NSDictionary *bannerData = @{@"img":@"localImage0", @"url":@"www.baidu.com"};
                
                //字典转模型
                NSMutableArray *resultArray = [NSMutableArray array];
                for (NSDictionary *dic in listData) {
                    TCListModel *model = [TCListModel new];
                    model.des = dic[@"text"];
                    [resultArray addObject:model];
                }
                
                TCBannerModel *model = [TCBannerModel new];
                model.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:bannerData[@"img"] ofType:@"jpeg"]];
                model.jumpUrl = bannerData[@"url"];
                
                success(resultArray, model);
            }
        });
    });
}

@end
