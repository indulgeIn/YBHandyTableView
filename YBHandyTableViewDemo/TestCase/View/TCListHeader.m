//
//  TCListHeader.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/10.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "TCListHeader.h"
#import "TCListHeaderModel.h"

@interface TCListHeader () <YBHTHeaderFooterProtocol>
@property (nonatomic, strong) UILabel *label;
@end

@implementation TCListHeader

#pragma mark - life cycle

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.label.frame = self.contentView.bounds;
}

#pragma mark - <YBHTHeaderFooterProtocol>

- (void)ybht_setHeaderFooterConfig:(id<YBHTHeaderFooterConfigProtocol>)config {
    TCListHeaderModel *model = (TCListHeaderModel *)config;
    
    self.label.text = model.title;
}

+ (CGFloat)ybht_heightForHeaderFooterWithConfig:(id<YBHTHeaderFooterConfigProtocol>)config reuseIdentifier:(NSString *)reuseIdentifier section:(NSInteger)section {
    return 44;
}

#pragma mark - getter

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.textAlignment = NSTextAlignmentLeft;
        _label.textColor = [UIColor purpleColor];
        _label.font = [UIFont italicSystemFontOfSize:30];
    }
    return _label;
}

@end
