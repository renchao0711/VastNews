//
//  NSTimer+RcAdViewUnretain.h
//  VastNews
//
//  Created by 任超 on 2017/12/14.
//  Copyright © 2017年 任超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (RcAdViewUnretain)

//不用手动加runloop（default runloop）
+ (NSTimer *)RC_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

//需要手动加runloop
+ (NSTimer *)RC_timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer * timer))block;

@end
