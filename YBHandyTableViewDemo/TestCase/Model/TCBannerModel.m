//
//  TCBannerModel.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "TCBannerModel.h"
#import "TCBannerCell.h"

@implementation TCBannerModel

#pragma mark - <YBHTCellModelProtocol>

- (Class<YBHTCellProtocol>)ybht_cellClass {
    return TCBannerCell.self;
}

@end
