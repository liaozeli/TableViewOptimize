//
//  NSStringAdditions.h
//  E3Coupon
//
//  Created by jimmy liao on 7/19/11.
//  Copyright 2011 TwinFish Technology Co.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/utsname.h>


@interface NSString (NSStringAdditions)

+ (id)textWithFormat:(NSString *)format, ...;

- (NSString *)stringURLEncoding;
- (NSDate *)dateWithFormat:(NSString *)format;
- (NSString *)MD5String;
- (NSString *)convertFromDateFormate:(NSString *)fromFormate toDateFormate:(NSString *)toFormate;

@end
