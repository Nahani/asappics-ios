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

@end
