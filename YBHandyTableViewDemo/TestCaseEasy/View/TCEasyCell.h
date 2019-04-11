//
//  TCEasyCell.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2019/4/11.
//  Copyright © 2019 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TCEasyCell;

@protocol TCEasyCellDelegate <NSObject>

- (void)easyCell:(TCEasyCell *)cell clickButton:(UIButton *)button;

@end

@interface TCEasyCell : UITableViewCell <YBHTCellProtocol>

@end

NS_ASSUME_NONNULL_END
