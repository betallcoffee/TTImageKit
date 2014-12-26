/*===============================================================================
 Copyright (c) 2012-2014 Qualcomm Connected Experiences, Inc. All Rights Reserved.
 
 Vuforia is a trademark of QUALCOMM Incorporated, registered in the United States
 and other countries. Trademarks of QUALCOMM Incorporated are used with permission.
 ===============================================================================*/

#import <UIKit/UIKit.h>
#import <QCAR/DataSet.h>
#import "TTQCARCameraEAGLView.h"
#import "TTQCARSession.h"

typedef BOOL(^TrackerUpdate)(NSString *targetName);

/**
 UIViewController 子类，加载 TrackersData 数据文件，初始化传入文件名 dataFilename ，nil 表示使用 TrackersData.xml 。
 打开摄像头，扫描摄像头拍摄的图片。当扫描到 TrackersData 中包含的图片时，调用初始化时传入的 trackerUpdate code block 。 传出图片的名字。
 */

@interface TTQCARCameraViewController : UIViewController<TTQCARControl>

- (instancetype)initWithTrackersDataFilename:(NSString *)dataFilename trackerUpdate:(TrackerUpdate)trackerUpdate;

@end
