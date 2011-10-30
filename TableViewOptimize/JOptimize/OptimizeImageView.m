//
//  OptimizeImageView.m
//  OptimizeTableView
//
//  Created by jimmy liao on 10/26/11.
//  Copyright 2011 TwinFish Technology Co., Ltd. All rights reserved.
//

#import "OptimizeImageView.h"
#import "NSStringAdditions.h"

#define kCacheImageDocumentName         @"CacheImage"

#define kActivityIndicatorViewWidth 20.0
#define kActivityIndicatorViewHeight 20.0

@interface OptimizeImageView (Private) 
- (void)createCacheImageDocument;
- (NSString *)cacheImageDocument;
- (void)downloadImage:(NSString *)urlString;
- (void)displayImageWithData:(NSData *)imageData;
@end

@implementation OptimizeImageView
@synthesize image = image_;
@synthesize alpha = alpha_;
@synthesize cornerRadius = cornerRadius_;
@synthesize rotationDegree = rotationDegree_;
@synthesize scaleAspectFit = scaleAspectFit_;
@synthesize cacheImageFold = cacheImageFold_;


- (void)initDefault {
    self.backgroundColor = [UIColor clearColor];
    self.alpha = 1.0f;
    cacheImageFold_ = [[NSString alloc] initWithString:@"CacheImage"];
    
    CGFloat activityIndicatorViewX = floor((self.frame.size.width - kActivityIndicatorViewWidth) / 2);
    CGFloat activityIndicatorViewY = floor((self.frame.size.height - kActivityIndicatorViewHeight) / 2);
    CGRect activityIndicatorViewFrame = CGRectMake(activityIndicatorViewX, activityIndicatorViewY, kActivityIndicatorViewWidth, kActivityIndicatorViewHeight);
    activityIndicatorView_ = [[UIActivityIndicatorView alloc] initWithFrame:activityIndicatorViewFrame];
    activityIndicatorView_.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self addSubview:activityIndicatorView_];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefault];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initDefault];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        [self initDefault];
    }
    return self;
}

#pragma mark - Set Method

- (void)setImage:(UIImage *)image {
    if (image_) {
        [self setNeedsDisplay];
    } else {
        image_ = image;
        [self setNeedsDisplay];
    }
}

- (void)setAlpha:(CGFloat)alpha {
    if (alpha_ != alpha) {
        alpha_ = alpha;
        [self setNeedsDisplay];
    }
}

- (void)setRotationDegree:(CGFloat)rotationDegree {
    if (rotationDegree_ != rotationDegree) {
        rotationDegree_ = rotationDegree;
        [self setNeedsDisplay];
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (cornerRadius_ != cornerRadius) {
        cornerRadius_ = cornerRadius;
        [self setNeedsDisplay];
    }
}

- (void)setScaleAspectFit:(BOOL)scaleAspectFit {
    if (scaleAspectFit_ != scaleAspectFit) {
        scaleAspectFit_ = scaleAspectFit;
        [self setNeedsDisplay];
    }
}

- (void)setCacheImageFold:(NSString *)cacheImageFold {
    if (cacheImageFold_) {
        if (cacheImageFold_ != cacheImageFold) {
            cacheImageFold_ = [cacheImageFold copy];
        }
    } else {
        cacheImageFold_ = [cacheImageFold copy];
    }
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self setNeedsDisplay];
}

- (void)resize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image_ drawInRect:CGRectMake(0.0, 0.0, size.width, size.height)];
    image_ = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setNeedsDisplay];
}

#pragma mark - Draw Method

- (void)drawRect:(CGRect)rect {
    if (!image_) {
        return;
    }
    
    if (cornerRadius_ != 0.0f) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = cornerRadius_;
    }
    
    if (scaleAspectFit_) {
        CGFloat rectHeight = rect.size.height;
        CGFloat rectWidth = rect.size.width;
        CGFloat imageHeight = image_.size.height;
        CGFloat imageWidth = image_.size.width;
        
        if ((rectHeight / imageHeight) > (rectWidth / imageWidth)) {
            CGFloat newImageWidth = rectWidth;
            CGFloat newImageHeight = newImageWidth * imageHeight / imageWidth;
            [image_ drawInRect:CGRectMake(0, (rectHeight - newImageHeight) / 2, newImageWidth, newImageHeight) blendMode:kCGBlendModeNormal alpha:alpha_];
        } else {
            CGFloat newImageHeight = rectHeight;
            CGFloat newImageWidth = newImageHeight * imageWidth / imageHeight;
            [image_ drawInRect:CGRectMake((rectWidth - newImageWidth) / 2, 0, newImageWidth, newImageHeight) blendMode:kCGBlendModeNormal alpha:alpha_];
        }
    } else {
        [image_ drawInRect:rect blendMode:kCGBlendModeNormal alpha:alpha_];
    }
    
    if (rotationDegree_ != 0) {
        self.transform = CGAffineTransformMakeRotation(M_PI/180.0f * rotationDegree_);
    }
}



#pragma mark - Asynchronous Method

- (void)createCacheImageDocument {
    //NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *docPath = NSHomeDirectory();
    NSString *mainDocument = [docPath stringByAppendingPathComponent:kCacheImageDocumentName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:mainDocument]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:mainDocument 
                                  withIntermediateDirectories:NO 
                                                   attributes:nil 
                                                        error:nil];
    }
    
    NSString *currentDocPath = [mainDocument stringByAppendingPathComponent:cacheImageFold_];
    if (![[NSFileManager defaultManager] fileExistsAtPath:currentDocPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:currentDocPath 
                                  withIntermediateDirectories:NO 
                                                   attributes:nil 
                                                        error:nil];
    }
}

- (NSString *)cacheImageDocument {
    NSString *docPath = NSHomeDirectory();
    NSString *mainDocument = [docPath stringByAppendingPathComponent:kCacheImageDocumentName];
    NSString *currentDocPath = [mainDocument stringByAppendingPathComponent:cacheImageFold_];
    return currentDocPath;
}

- (void)loadImageFromURLString:(NSString *)urlString {
    if (urlString_) {
        if (urlString_ != urlString) {
            urlString_ = [urlString copy];
        }
    } else {
        urlString_ = [urlString copy];
    }
	NSString *urlMD5String = [urlString MD5String];
	NSString *imageFilePath = [[self cacheImageDocument] stringByAppendingPathComponent:urlMD5String];
	if ([[NSFileManager defaultManager] fileExistsAtPath:imageFilePath] == YES) {
		NSData *imageFileData = [NSData dataWithContentsOfFile:imageFilePath];
		self.image = [UIImage imageWithData:imageFileData];
        if (self.image == nil) {
            // 保存的是非image的data, 需重新执行下载
            isLoading_ = YES;
            [activityIndicatorView_ startAnimating];
            [self setNeedsDisplay];
            [self performSelectorInBackground:@selector(downloadImage:) withObject:urlString];
            return;
        }
		[activityIndicatorView_ stopAnimating];
		[self setNeedsDisplay];
		isLoading_ = NO;
	} else if (!isLoading_){
		isLoading_ = YES;
        self.image = nil;
		[activityIndicatorView_ startAnimating];
        [self setNeedsDisplay];
		[self performSelectorInBackground:@selector(downloadImage:) withObject:urlString];
	}
}

- (void)loadImageFromURLString:(NSString *)urlString restoreSize:(CGSize)newSize {
	isStoreNewSize_ = YES;
	newSize_ = newSize;
	[self loadImageFromURLString:urlString];
}

- (void)downloadImage:(NSString *)urlString {
	
	NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	NSData *imageData = [NSData dataWithContentsOfURL:url];
	if (imageData == nil) {
		[activityIndicatorView_ stopAnimating];
        isLoading_ = NO;
        self.image = [UIImage imageNamed:@"no_photo"];
        [self setNeedsDisplay];
		return;
	}
	if (isStoreNewSize_) {
		UIImage *srcImage = [UIImage imageWithData:imageData];
		UIGraphicsBeginImageContext(newSize_);
		[srcImage drawInRect:CGRectMake(0.0, 0.0, newSize_.width, newSize_.height)];
		srcImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		imageData = UIImagePNGRepresentation(srcImage);
	}
	
	if (imageData) {
        [self createCacheImageDocument];
		NSString *imageFilePath = [[self cacheImageDocument] stringByAppendingPathComponent:[urlString MD5String]];
		[imageData writeToFile:imageFilePath atomically:YES];
	}
	if ([urlString isEqualToString:urlString_]) {
		[self performSelectorOnMainThread:@selector(displayImageWithData:) withObject:imageData waitUntilDone:NO];
	}
	
}

- (void)displayImageWithData:(NSData *)imageData {
	if (imageData) {
		self.image = [UIImage imageWithData:imageData];
	} else {
		self.image = nil;
	}
	[activityIndicatorView_ stopAnimating];
	[self setNeedsDisplay];
	isLoading_ = NO;
}

#pragma mark - Delete ImageCache

+ (void)deleteImageCached {
    NSString *mainDocument = [NSHomeDirectory() stringByAppendingPathComponent:kCacheImageDocumentName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:mainDocument]) {
        [[NSFileManager defaultManager] removeItemAtPath:mainDocument error:nil];
    }
}

+ (void)deleteImageCachedWithDocName:(NSString *)docName {
    if (!docName) {
        return;
    }
    NSString *mainDocument = [NSHomeDirectory() stringByAppendingPathComponent:kCacheImageDocumentName];
    NSString *docPath = [mainDocument stringByAppendingPathComponent:docName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:docPath] == YES) {
        [[NSFileManager defaultManager] removeItemAtPath:docPath error:nil];
    }
}

@end