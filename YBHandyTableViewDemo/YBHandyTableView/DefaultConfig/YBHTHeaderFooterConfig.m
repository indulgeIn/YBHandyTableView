//
//  YBHTHeaderFooterConfig.m
//  YBHandyTableView<https://github.com/indulgeIn/YBHandyTableView>
//
//  Created by 杨波 on 2019/4/11.
//  Copyright © 2019 杨波. All rights reserved.
//

#import "YBHTHeaderFooterConfig.h"

@implementation YBHTHeaderFooterConfig

#pragma mark - <YBHTHeaderFooterConfigProtocol>

- (Class<YBHTHeaderFooterProtocol>)ybht_headerFooterClass {
    return self.headerFooterClass;
}

- (NSString *)ybht_headerFooterReuseIdentifier {
    return self.headerFooterReuseIdentifier;
}

@end
