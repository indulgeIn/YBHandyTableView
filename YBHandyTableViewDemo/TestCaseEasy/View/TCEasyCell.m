//
//  TCEasyCell.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2019/4/11.
//  Copyright © 2019 杨波. All rights reserved.
//

#import "TCEasyCell.h"
#import "TCEasyModel.h"

@interface TCEasyCell ()
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) TCEasyModel *model;
@end

@implementation TCEasyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.button];
    }
    return self;
}

#pragma mark - <YBHTCellProtocol>

- (void)ybht_setCellConfig:(id<YBHTCellConfigProtocol>)config {
    YBHTCellConfig *cellConfig = (YBHTCellConfig *)config;
    self.model = (TCEasyModel *)cellConfig.model;
    
    self.textLabel.text = self.model.text;
}

+ (CGFloat)ybht_heightForCellWithConfig:(id<YBHTCellConfigProtocol>)config reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

#pragma mark - event

- (void)clickButton:(UIButton *)button {
    if (self.model.delegate) {
        [self.model.delegate easyCell:self clickButton:button];
    }
}

#pragma mark - getter

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.frame = CGRectMake(100, 0, 80, 30);
        [_button setTitle:@"点击" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end
