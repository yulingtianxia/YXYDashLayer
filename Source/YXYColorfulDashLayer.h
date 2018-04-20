//
//  YXYColorfulDashLayer.h
//  ProgressDashLayerSample
//
//  Created by 杨萧玉 on 2018/4/8.
//  Copyright © 2018年 杨萧玉. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YXYMaskDashLayer;

@interface YXYColorfulDashLayer : CAGradientLayer

@property (nonatomic) CGFloat dashGap;
@property (nonatomic) CGFloat dashWidth;
@property (nonatomic) CGFloat dashCornerRadius;
@property (nonatomic) NSUInteger totalCount;
@property (nonatomic) NSArray<NSNumber *> *showIndexes;

@property (nonatomic, readonly) YXYMaskDashLayer *maskLayer;

/**
 刷新整个Layer
 */
- (void)refresh;

/**
 仅刷新 Dash 的 totalCount、dashGap 和 showIndexes
 */
- (void)refreshDash;

@end
