//
//  TCEasyCell.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2019/4/11.
//  Copyright © 2019 杨波. All rights reserved.
//

#import "TCEasyCell.h"
#import "TCEasyModel.h"

@implementation TCEasyCell

#pragma mark - <YBHTCellProtocol>

- (void)ybht_setCellConfig:(id<YBHTCellConfigProtocol>)config {
    YBHTCellConfig *cellConfig = (YBHTCellConfig *)config;
    TCEasyModel *model = (TCEasyModel *)cellConfig.model;
    
    self.textLabel.text = model.text;
}

+ (CGFloat)ybht_heightForCellWithConfig:(id<YBHTCellConfigProtocol>)config reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end
