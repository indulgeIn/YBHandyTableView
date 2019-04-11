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
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) TCFunctionModel *model;
@end

@implementation TCFunctionCell

@synthesize ybht_reloadTableView = _ybht_reloadTableView;

#pragma mark - life cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.button];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.button.frame = self.contentView.bounds;
}

#pragma mark - <YBHTCellProtocol>

- (void)ybht_setCellConfig:(id<YBHTCellConfigProtocol>)config {
    TCFunctionModel *model = (TCFunctionModel *)config;
    self.model = model;
    
    [self.button setTitle:model.title forState:UIControlStateNormal];
}

+ (CGFloat)ybht_heightForCellWithConfig:(id<YBHTCellConfigProtocol>)config reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath {
    TCFunctionModel *model = (TCFunctionModel *)config;
    return model.isBig ? 100 : 50;
}

#pragma mark - event

- (void)clickButton:(UIButton *)button {
    TCFunctionModel *model = self.model;
    model.isBig = !model.isBig;
    
    self.ybht_reloadTableView();
}

#pragma mark - getter

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end
