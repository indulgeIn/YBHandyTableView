//
//  TCListHeaderModel.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/10.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "TCListHeaderModel.h"
#import "TCListHeader.h"

@implementation TCListHeaderModel

#pragma mark - <YBHTHeaderFooterModelProtocol>

- (Class<YBHTHeaderFooterProtocol>)ybht_headerFooterClass {
    return TCListHeader.self;
}

@end
