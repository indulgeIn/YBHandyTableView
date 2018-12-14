//
//  TCFunctionCell.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TCFunctionCell;

@protocol TCFunctionCellDelegate <NSObject>

- (void)functionCell:(TCFunctionCell *)cell clickButton:(UIButton *)button;

@end

@interface TCFunctionCell : UITableViewCell

@end

NS_ASSUME_NONNULL_END
