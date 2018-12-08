//
//  TCListModel.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "TCListModel.h"
#import "TCListCell.h"

@implementation TCListModel

#pragma mark - <YBHTCellModelProtocol>

- (Class)ybht_cellClass {
    return TCListCell.self;
}

@end
