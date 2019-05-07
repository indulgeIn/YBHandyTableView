# YBHandyTableView

[![Cocoapods](https://img.shields.io/cocoapods/v/YBModelFile.svg)](https://cocoapods.org/pods/YBHandyTableView)&nbsp;
[![Cocoapods](https://img.shields.io/cocoapods/p/YBModelFile.svg)](https://github.com/indulgeIn/YBHandyTableView)&nbsp;
[![License](https://img.shields.io/github/license/indulgeIn/YBModelFile.svg)](https://github.com/indulgeIn/YBHandyTableView)&nbsp;

让复杂 TableView 优雅起来，更轻易的实现动态化。

原理解析博客：[iOS 架构组件：让复杂 TableView 优雅起来](https://www.jianshu.com/p/7db73489ad99)


## 特性

- 模块化思维，使用数组配置 UITableView，优雅解决复杂布局和动态布局
- 轻量化设计，不会覆盖原生功能
- IOP 思想，使用或弃用都随心所欲，不拖泥带水
- 除了不需要实现数据源协议，还不需要注册 Cell/Header/Footer


## 安装

### CocoaPods

1. 在 Podfile 中添加 `pod 'YBHandyTableView'`。
2. 执行 `pod install` 或 `pod update`。
3. 导入 `<YBHandyTableView/UITableView+YBHandyTableView.h>`。

若搜索不到库，可使用 rm ~/Library/Caches/CocoaPods/search_index.json 移除本地索引然后再执行安装，或者更新一下 CocoaPods 版本。

### 手动导入

1. 下载 YBHandyTableView 文件夹所有内容并且拖入你的工程中。
2. 导入 `UITableView+YBHandyTableView.h`。


## 用法

可下载 DEMO 查看示例。

### 核心思想

对于 UITableView，每一个 Header、Footer、Cell 都对应一个配置对象：
- Header / Footer : id <YBHTHeaderFooterConfigProtocol>
- Cell : id <YBHTCellConfigProtocol>

所以，使用该组件第一步就是构建和视图等量的配置对象。

### 简洁使用

为了简洁，特意设置了一些语法糖，比如默认实现了两个配置对象：
```
YBHTCellConfig 实现 <YBHTCellConfigProtocol>
YBHTHeaderFooterConfig 实现 <YBHTHeaderFooterConfigProtocol>
```
由于 UITableView 可能只需要一个 Section，所以使用一些语法糖可以便捷使用：
```
// 构造数据模型 (通常来自于网络)
TCEasyModel *model0 = TCEasyModel.new;
model0.text = @"第一条数据";
TCEasyModel *model1 = TCEasyModel.new;
model1.text = @"第二条数据";

// 构造配置数据
YBHTCellConfig *c0 = [YBHTCellConfig new];
c0.model = model0;
c0.cellClass = TCEasyCell.self;
YBHTCellConfig *c1 = [YBHTCellConfig new];
c1.model = model1;
c1.cellClass = TCEasyCell.self;

// 赋值 tableview 并刷新
[self.tableView.ybht_rowArray addObjectsFromArray:@[c0, c1]];
[self.tableView reloadData];
```
同时，对应的 Cell 需要实现`<YBHTCellConfigProtocol>`协议：
```
@interface TCEasyCell () <YBHTCellProtocol>
@end
@implementation TCEasyCell
#pragma mark - <YBHTCellProtocol>
- (void)ybht_setCellConfig:(id<YBHTCellConfigProtocol>)config {
    //此处根据配置对象获取相应的数据模型
    YBHTCellConfig *cellConfig = (YBHTCellConfig *)config;
    TCEasyModel *model = (TCEasyModel *)cellConfig.model;
    // 更新 UI
}
+ (CGFloat)ybht_heightForCellWithConfig:(id<YBHTCellConfigProtocol>)config reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath {
    //此处可根据 config 自行计算高度，也可以用 UITableView+FDTemplateLayoutCell 开源库计算 
    return UITableViewAutomaticDimension;
}
@end
```

### 完整使用

完整的使用方式是使用`tableView.ybht_sectionArray`，它的定义如下，
```
@property (nonatomic, strong, readonly) NSMutableArray<YBHTSection *> *ybht_sectionArray;
```
`YBHTSection`表示了一个 Section 包含的所有配置对象：
```
@interface YBHTSection : NSObject
/** UITableView 的 header 配置 */
@property (nonatomic, strong, nullable) id<YBHTHeaderFooterConfigProtocol> headerConfig;
/** UITableView 的 footer 配置 */
@property (nonatomic, strong, nullable) id<YBHTHeaderFooterConfigProtocol> footerConfig;
/** UITableView 的 cell 配置数组 */
@property (nonatomic, strong, readonly) NSMutableArray<id<YBHTCellConfigProtocol>> *rowArray;

@end
```

下载 DMEO 可更快速的上手。


### Cell / Header / Footer 事件和数据传递

由于 Cell / Header / Footer 被抽象出来了，外界与它们联系的最好方式是通过配置对象 （或其属性），即是`id<YBHTCellConfigProtocol>`/`id<YBHTHeaderFooterConfigProtocol>`。

通过配置对象（或其属性）持有一个代理对象 delegate，然后在 Cell / Header / Footer 里面通过 delegate 达到向外界传递事件和数据的目的。

具体的操作可看 Demo，更多的传递方式可看技术博客。
