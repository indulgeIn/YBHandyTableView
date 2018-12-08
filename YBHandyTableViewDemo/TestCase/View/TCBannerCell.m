//
//  TCBannerCell.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "TCBannerCell.h"
#import "TCBannerModel.h"

@interface TCBannerCell () <YBHTCellProtocol>
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation TCBannerCell

#pragma mark - life cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.imgView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imgView.frame = self.contentView.bounds;
}

#pragma mark - <YBHTCellProtocol>

- (void)ybht_setCellModel:(id<YBHTCellModelProtocol>)model {
    TCBannerModel *tModel = (TCBannerModel *)model;
    
    self.imgView.image = tModel.image;
}

+ (CGFloat)ybht_heightForCellWithModel:(id<YBHTCellModelProtocol>)model {
    return [UIScreen mainScreen].bounds.size.width * 0.66;
}

#pragma mark - getter

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.contentMode = UIViewContentModeScaleAspectFill;
        _imgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _imgView;
}

@end
