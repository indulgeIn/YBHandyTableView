//
//  TCFunctionCell.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "TCFunctionCell.h"
#import "TCFunctionModel.h"

@interface TCFunctionCell () <YBHTCellProtocol>
@property (nonatomic, strong) UILabel *label;
@end

@implementation TCFunctionCell

#pragma mark - life cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.label.frame = self.contentView.bounds;
}

#pragma mark - <YBHTCellProtocol>

- (void)ybht_setCellModel:(id<YBHTCellModelProtocol>)model {
    TCFunctionModel *tModel = (TCFunctionModel *)model;
    
    self.label.text = tModel.title;
}

+ (CGFloat)ybht_heightForCellWithModel:(id<YBHTCellModelProtocol>)model {
    return 40;
}

#pragma mark - getter

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor orangeColor];
        _label.font = [UIFont boldSystemFontOfSize:20];
    }
    return _label;
}

@end
