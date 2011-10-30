//
//  OptimizeImageView.h
//  YDSC
//
//  Created by lu ddong on 10/26/11.
//  Copyright 2011 TwinFish Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface OptimizeImageView : UIView {
 @private
    UIImage *image_;
    CGFloat alpha_;
    CGFloat cornerRadius_;
    CGFloat rotationDegree_;
    BOOL scaleAspectFit_;
    NSString *cacheImageFold_;
    
    UIActivityIndicatorView *activityIndicatorView_;
    NSString *urlString_;
    CGSize newSize_;
    BOOL isLoading_;
    BOOL isStoreNewSize_;
}

@property (nonatomic, strong) UIImage *image;
@property (nonatomic) CGFloat alpha;
@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic) CGFloat rotationDegree;
@property (nonatomic) BOOL scaleAspectFit;
@property (nonatomic, copy) NSString *cacheImageFold;

- (void)resize:(CGSize)size;

- (void)loadImageFromURLString:(NSString *)urlString;
- (void)loadImageFromURLString:(NSString *)urlString restoreSize:(CGSize)newSize;

+ (void)deleteImageCached;
+ (void)deleteImageCachedWithDocName:(NSString *)docName;

@end