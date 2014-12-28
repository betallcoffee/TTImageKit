//
//  TTImageView.m
//  TTImageKitExample
//
//  Created by liang on 2/9/14.
//  Copyright (c) 2014 liang. All rights reserved.
//

#import <ImageIO/ImageIO.h>
#import <QuartzCore/QuartzCore.h>
#import "TTImageView.h"

@implementation TTImageView

- (void)setImageData:(NSData *)data {
    CGImageSourceRef cImageSource = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    if (cImageSource) {
        TTImageKitLogV(@"UTI: %@", CGImageSourceGetType(cImageSource));
        NSString *UTI = (__bridge_transfer NSString *)CGImageSourceGetType(cImageSource);
        if ([UTI compare:@"com.compuserve.gif"] == NSOrderedSame) {
            [self parseGIFImage:cImageSource];
        } else {
            [self parseImage:cImageSource];
        }
        
        CFRelease(cImageSource);
    }
}

- (void)setImageURL:(NSURL *)url {
    if ([url.scheme compare:@"file"] == NSOrderedSame) {
        CGImageSourceRef cImageSource = CGImageSourceCreateWithURL((__bridge CFURLRef)url, NULL);
        if (cImageSource) {
            TTImageKitLogV(@"UTI: %@", CGImageSourceGetType(cImageSource));
            NSString *UTI = (__bridge_transfer NSString *)CGImageSourceGetType(cImageSource);
            if ([UTI compare:@"com.compuserve.gif"] == NSOrderedSame) {
                [self parseGIFImage:cImageSource];
            } else {
                [self parseImage:cImageSource];
            }
            
            CFRelease(cImageSource);
        }
    } else if ([url.scheme compare:@"http"] == NSOrderedSame) {
        [self sendHTTPRequest:url];
    }
}

- (void)parseImage:(CGImageSourceRef)cImageSource {
    CGImageRef cImage = CGImageSourceCreateImageAtIndex(cImageSource, 0, NULL);
    self.image = [UIImage imageWithCGImage:cImage];
    _size = self.image.size;
}

- (void)parseGIFImage:(CGImageSourceRef)cImageSource {
    size_t imageCount = CGImageSourceGetCount(cImageSource);
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:imageCount];
    NSMutableArray *times = [[NSMutableArray alloc] initWithCapacity:imageCount];
    NSMutableArray *keyTimes = [[NSMutableArray alloc] initWithCapacity:imageCount];
    
    float totalTime = 0;
    for (size_t i = 0; i < imageCount; i++) {
        CGImageRef cgimage= CGImageSourceCreateImageAtIndex(cImageSource, i, NULL);
        [images addObject:(__bridge id)cgimage];
        CGImageRelease(cgimage);
   
        NSDictionary *properties = (__bridge NSDictionary *)CGImageSourceCopyPropertiesAtIndex(cImageSource, i, NULL);
        NSDictionary *gifProperties = [properties valueForKey:(__bridge NSString *)kCGImagePropertyGIFDictionary];
        NSString *gifDelayTime = [gifProperties valueForKey:(__bridge NSString* )kCGImagePropertyGIFDelayTime];
        [times addObject:gifDelayTime];
        totalTime += [gifDelayTime floatValue];
        
        _size.width = [[properties valueForKey:(NSString*)kCGImagePropertyPixelWidth] floatValue];
        _size.height = [[properties valueForKey:(NSString*)kCGImagePropertyPixelHeight] floatValue];
    }
    
    float currentTime = 0;
    for (size_t i = 0; i < times.count; i++) {
        float keyTime = currentTime / totalTime;
        [keyTimes addObject:[NSNumber numberWithFloat:keyTime]];
        currentTime += [[times objectAtIndex:i] floatValue];
    }
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [animation setValues:images];
    [animation setKeyTimes:keyTimes];
    animation.duration = totalTime;
    animation.repeatCount = HUGE_VALF;
    [self.layer addAnimation:animation forKey:@"gifAnimation"];
}

- (void)sendHTTPRequest:(NSURL *)url {
    
}

@end
