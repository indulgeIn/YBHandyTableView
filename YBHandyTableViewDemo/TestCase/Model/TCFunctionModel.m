//
//  TCFunctionModel.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "TCFunctionModel.h"
#import "TCFunctionCell.h"

@implementation TCFunctionModel

#pragma mark - <YBHTCellModelProtocol>

- (Class)ybht_cellClass {
    return TCFunctionCell.self;
}

@end
