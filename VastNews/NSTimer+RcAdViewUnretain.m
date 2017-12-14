//
//  NSTimer+RcAdViewUnretain.m
//  VastNews
//
//  Created by 任超 on 2017/12/14.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "NSTimer+RcAdViewUnretain.h"

@implementation NSTimer (RcAdViewUnretain)


+ (NSTimer *)RC_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block{
    
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(timerSelector:) userInfo:[block copy]  repeats:repeats];
}

+ (void)timerSelector:(NSTimer *)timer{
    
    void (^timerBlock)(NSTimer *timer) = timer.userInfo;
    
    if (timerBlock) {
        timerBlock(timer);
    }
    
}

+ (NSTimer *)RC_timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer * timer))block{
    
    return [self timerWithTimeInterval:interval target:self selector:@selector(timerSelector:) userInfo:[block copy]  repeats:repeats];
}

@end
