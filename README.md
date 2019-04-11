# YBHandyTableView

原理解析博客：[iOS 架构组件：让复杂 TableView 优雅起来](https://www.jianshu.com/p/7db73489ad99)

## 使用方法

- 第一步：业务定制的`UITableViewCell`实现`YBHTCellProtocol`协议，然后任意类实现`YBHTCellModelProtocol`协议（使用数据模型 model 来实现最便捷）。
- 第二步：
```
NSArray<id<YBHTCellModelProtocol>> tmpArr = ...;
[anyTableView.ybht_rowArray addObjectsFromArray:tmpArr];
[anyTableView reloadData];
```
