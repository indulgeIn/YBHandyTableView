//
//  TCEasyModel.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2019/4/11.
//  Copyright © 2019 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCEasyCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TCEasyModel : NSObject

@property (nonatomic, copy) NSString *text;

@property (nonatomic, weak) id<TCEasyCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
