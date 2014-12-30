//
//  TTImageView.h
//  TTImageKitExample
//
//  Created by liang on 2/9/14.
//  Copyright (c) 2014 liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTImageView : UIImageView

@property (nonatomic, readonly) CGSize imageSize;

- (void)setImageData:(NSData *)data;
- (void)setImageURL:(NSURL *)url;

@end
