//
//  ZMCusCommentView.h
//  ZMZX
//
//  Created by Kennith.Zeng on 2018/8/29.
//  Copyright © 2018年 齐家网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMCusCommentView : UIView

@end

@interface ZMCusCommentManager : NSObject
+ (instancetype)shareManager;
- (void)showCommentWithSourceId:(NSString *)sourceId;
@end
