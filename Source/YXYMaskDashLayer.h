//
//  YXYMaskDashLayer.h
//  ProgressDashLayerSample
//
//  Created by 杨萧玉 on 2018/4/20.
//  Copyright © 2018年 杨萧玉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXYMaskDashLayer : CAShapeLayer

@property (nonatomic) CGFloat dashGap;
@property (nonatomic) CGFloat dashWidth;
@property (nonatomic) CGFloat dashCornerRadius;
/**
 分段总数
 */
@property (nonatomic) NSUInteger totalCount;
/**
 需要显示哪些分段的 index
 */
@property (nonatomic) NSArray<NSNumber *> *showIndexes;

/**
 刷新整个Layer
 */
- (void)refresh;

/**
 仅刷新 Dash 的 totalCount、dashGap 和 showIndexes
 */
- (void)refreshDash;

@end
