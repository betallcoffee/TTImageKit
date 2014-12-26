//
//  TTImageLog.h
//  TTImageKit
//
//  Created by liang on 12/26/14.
//  Copyright (c) 2014 liangliang. All rights reserved.
//

#define  TTImageKitLOG 4
#ifdef TTImageKitLOG

#define TTImageKitLog(l, s) NSLog(@"TTImageKit:%@(%s/%d)%s%@", l, __FILE__, __LINE__, __func__, (s))

#if TTImageKitLOG == 4
#define TTImageKitLogV(f, s...) TTImageKitLog(@"LOGV:", ([NSString stringWithFormat:f, ##s]))
#define TTImageKitLogD(f, s...) TTImageKitLog(@"LOGD:", ([NSString stringWithFormat:f, ##s]))
#define TTImageKitLogE(f, s...) TTImageKitLog(@"LOGE:", ([NSString stringWithFormat:f, ##s]))
#define TTImageKitLogW(f, s...) TTImageKitLog(@"LOGW:", ([NSString stringWithFormat:f, ##s]))
#endif

#if TTImageKitLOG == 3
#define TTImageKitLogV(f, s...)
#define TTImageKitLogD(f, s...) TTImageKitLog(@"LOGD:", ([NSString stringWithFormat:f, ##s]))
#define TTImageKitLogE(f, s...) TTImageKitLog(@"LOGE:", ([NSString stringWithFormat:f, ##s]))
#define TTImageKitLogW(f, s...) TTImageKitLog(@"LOGW:", ([NSString stringWithFormat:f, ##s]))
#endif

#if TTImageKitLOG == 2
#define TTImageKitLogV(f, s...)
#define TTImageKitLogD(f, s...)
#define TTImageKitLogE(f, s...) TTImageKitLog(@"LOGE:", ([NSString stringWithFormat:f, ##s]))
#define TTImageKitLogW(f, s...) TTImageKitLog(@"LOGW:", ([NSString stringWithFormat:f, ##s]))
#endif

#if TTImageKitLOG == 1
#define TTImageKitLogV(f, s...)
#define TTImageKitLogD(f, s...)
#define TTImageKitLogE(f, s...)
#define TTImageKitLogW(f, s...) TTImageKitLog(@"LOGW:", ([NSString stringWithFormat:f, ##s]))
#endif

#if TTImageKitLOG == 0
#define TTImageKitLogV(f, s...)
#define TTImageKitLogD(f, s...)
#define TTImageKitLogE(f, s...)
#define TTImageKitLogW(f, s...)
#endif

#endif

