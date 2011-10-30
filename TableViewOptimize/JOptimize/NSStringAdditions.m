//
//  NSStringAdditions.m
//  Optimize
//
//  Created by jimmy liao on 7/19/11.
//  Copyright 2011 TwinFish Technology Co.Ltd. All rights reserved.
//

#import "NSStringAdditions.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (NSStringAdditions)


+ (id)textWithFormat:(NSString *)format, ... {
	va_list args;
	va_start(args, format);
	NSString *text = [[NSString alloc] initWithFormat:format arguments:args];
	static NSString *null = @"(null)";
	NSRange match = [text rangeOfString:null];
	if (match.location != NSNotFound) {
		text = [text stringByReplacingOccurrencesOfString:null withString:@""];
	}
	va_end(args);
	return text;
}

- (NSString *)stringURLEncoding {
	return (__bridge NSString* )CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
																 (__bridge CFStringRef)self,
																 NULL,
																 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
																 kCFStringEncodingUTF8);
}

- (NSDate *)dateWithFormat:(NSString *)format {
	if (format.length <= 0) {
		return nil;
	}
	
	NSDateFormatter *fromDateFormatter = [[NSDateFormatter alloc] init];
	[fromDateFormatter setDateFormat:format];
	NSDate *date = [fromDateFormatter dateFromString:self];
	return date;
}

- (NSString *)MD5String {
	const char *cStr = [self UTF8String];
	unsigned char digest[CC_MD5_DIGEST_LENGTH];
	CC_MD5(cStr, strlen(cStr), digest);
	char md5string[CC_MD5_DIGEST_LENGTH*2];
	int i;
	for(i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
		sprintf(md5string+i*2, "%02X", digest[i]);
	}
	return [[NSString stringWithCString:md5string encoding:NSUTF8StringEncoding] lowercaseString];
}

- (NSString *)convertFromDateFormate:(NSString *)fromFormate toDateFormate:(NSString *)toFormate {
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setLocale:[NSLocale systemLocale]];
	[dateFormatter setDateFormat:fromFormate];
	NSDate *toDate = [dateFormatter dateFromString:self];
	[dateFormatter setDateFormat:toFormate];
	NSString *toDateString = [dateFormatter stringFromDate:toDate];
	return toDateString;
}

@end
