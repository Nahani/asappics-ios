//
//  Utils.h
//  AsapPics
//
//  Created by polytech polytech on 11/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import <SystemConfiguration/SystemConfiguration.h>

@interface Utils : NSObject
+ (BOOL)connected;
+ (void) print_simple_popup:(NSString*)title msg:(NSString*)message;
+ (int) compute_random_number:(int)max;
@end
