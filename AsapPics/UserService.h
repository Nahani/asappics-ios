//
//  UserService.h
//  webs
//
//  Created by Polytech Polytech on 26/11/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserService : NSObject

+ (int) get_user_id:(NSString*)idUser;

+ (BOOL) get_user_level:(NSString*)idUser;

+ (BOOL) check_password:(NSString*)idUser withPass:(NSString*)pwd;

+ (BOOL) add:(NSString*)idUser withPass:(NSString*)pwd withFName:(NSString*)fname withMail:(NSString*)mail withLName:(NSString*)lname;

+ (BOOL) delete:(NSString*)idUser;

@end
