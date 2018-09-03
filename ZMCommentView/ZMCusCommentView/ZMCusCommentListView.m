//
//  ZMCusCommentListView.m
//  ZMZX
//
//  Created by Kennith.Zeng on 2018/8/29.
//  Copyright © 2018年 齐家网. All rights reserved.
//

#import "ZMCusCommentListView.h"
#import "ZMCusCommentBottomView.h"
#import "ZMCusCommentListTableHeaderView.h"
#import "ZMCusCommentListContentCell.h"
#import "ZMCusCommentListReplyContentCell.h"
@interface ZMCusCommentListView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) ZMCusCommentBottomView *bottomView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZMCusCommentListTableHeaderView *headerView;
@end


@implementation ZMCusCommentListView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        self.backgroundColor = RGBHexColor(0xffffff, 1);
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 15;
        [self layoutUI];
        
    }
    return self;
}
- (void)layoutUI{
    
    if (!_headerView) {
        _headerView = [[ZMCusCommentListTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 70)];
        @weakify(self)
        _headerView.closeBtnBlock = ^{
            @strongify(self)
            if (self.closeBtnBlock) {
                self.closeBtnBlock();
            }
        };
        [self addSubview:_headerView];
        [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.and.right.mas_equalTo(0);
            make.height.mas_offset(70);
        }];
    }


    
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator=NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = 10000;
        [_tableView registerClass:[ZMCusCommentListContentCell class] forCellReuseIdentifier:NSStringFromClass([ZMCusCommentListContentCell class])];
        [_tableView registerClass:[ZMCusCommentListReplyContentCell class] forCellReuseIdentifier:NSStringFromClass([ZMCusCommentListReplyContentCell class])];
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(70,0, ZMCusComentBottomViewHeight+ZMCusCommentViewTopHeight, 0));
        }];
    }
    
    
    if (!_bottomView) {
        _bottomView = [[ZMCusCommentBottomView alloc] init];
        @weakify(self)
        _bottomView.tapBtnBlock = ^{
            @strongify(self)
            if (self.tapBtnBlock) {
                self.tapBtnBlock();
            }
        };
        [self addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-ZMCusCommentViewTopHeight);
            make.left.and.right.mas_equalTo(0);
            make.height.mas_offset(ZMCusComentBottomViewHeight);
        }];
    }
    
}



#pragma mark -
#pragma mark UITableViewDataSource, UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==1) {
        ZMCusCommentListReplyContentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZMCusCommentListReplyContentCell class]) forIndexPath:indexPath];
        [cell configData:nil];
        return cell;
    }else{
        ZMCusCommentListContentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZMCusCommentListContentCell class]) forIndexPath:indexPath];
        [cell configData:nil];
        return cell;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

@end
