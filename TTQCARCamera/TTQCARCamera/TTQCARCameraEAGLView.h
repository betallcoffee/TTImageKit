/*===============================================================================
 Copyright (c) 2012-2014 Qualcomm Connected Experiences, Inc. All Rights Reserved.
 
 Vuforia is a trademark of QUALCOMM Incorporated, registered in the United States
 and other countries. Trademarks of QUALCOMM Incorporated are used with permission.
 ===============================================================================*/

#import <UIKit/UIKit.h>

#import <QCAR/UIGLViewProtocol.h>
#import "TTQCARCameraEAGLView.h"
#import "TTQCARSession.h"


// EAGLView is a subclass of UIView and conforms to the informal protocol
// UIGLViewProtocol
@interface TTQCARCameraEAGLView : UIView <UIGLViewProtocol>

- (id)initWithFrame:(CGRect)frame appSession:(TTQCARSession *) app;

- (void)finishOpenGLESCommands;
- (void)freeOpenGLESResources;

@end
