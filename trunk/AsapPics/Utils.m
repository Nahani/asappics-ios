//
//  Utils.m
//  AsapPics
//
//  Created by polytech polytech on 11/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+ (BOOL)connected 
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];  
    NetworkStatus networkStatus = [reachability currentReachabilityStatus]; 
    return !(networkStatus == NotReachable);
}

+ (void) print_simple_popup:(NSString*)title msg:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

+ (int) compute_random_number:(int)borneMax_nonIncluse
{
    return (rand() % (borneMax_nonIncluse));
}

+ (NSString *) construct_URL:(id) first, ...
{
    NSString * result = @"";
    id eachArg;
    va_list alist;
    if(first)
    {
        result = [result stringByAppendingString:first];
        va_start(alist, first);
        while ((eachArg = va_arg(alist, id))){ 
            NSString *separator = @"/";
            result = [result stringByAppendingString:separator];
            result = [result stringByAppendingString:eachArg];
        }
        va_end(alist);
    }
    return result;
}

@end
