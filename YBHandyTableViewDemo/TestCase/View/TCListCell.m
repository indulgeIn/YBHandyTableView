//
//  TCListCell.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "TCListCell.h"
#import "TCListModel.h"

@interface TCListCell () <YBHTCellProtocol>
@property (nonatomic, strong) UILabel *label;
@end

@implementation TCListCell

#pragma mark - life cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.label];
        
        self.label.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:15]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:15]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-15]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-15]];
    }
    return self;
}

#pragma mark - <YBHTCellProtocol>

- (void)ybht_setCellModel:(id<YBHTCellModelProtocol>)cModel {
    TCListModel *model = (TCListModel *)cModel;
    
    self.label.text = model.des;
}

+ (CGFloat)ybht_heightForCellWithModel:(id<YBHTCellModelProtocol>)cModel reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

#pragma mark - getter

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.textColor = [UIColor darkGrayColor];
        _label.font = [UIFont boldSystemFontOfSize:15];
        _label.numberOfLines = 0;
    }
    return _label;
}

@end
