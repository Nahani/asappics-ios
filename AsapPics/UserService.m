//
//  UserService.m
//  webs
//
//  Created by Polytech Polytech on 26/11/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "UserService.h"

@implementation UserService

NSString* URL_GET_USER_ID = @"http://asap-pics.com/REST/UserService.svc/get_user_id";
NSString* URL_GET_USER_LEVEL = @"http://asap-pics.com/REST/UserService.svc/get_user_level";
NSString* URL_CHECK_PASSWORD = @"http://asap-pics.com/REST/UserService.svc/check_password";
NSString* URL_DELETE_USER = @"http://asap-pics.com/REST/UserService.svc/delete";
NSString* URL_ADD_USER = @"http://asap-pics.com/REST/UserService.svc/add";

const NSString* RESPONSE_TAG_DELETE_USER =@"DeleteResult";
const NSString* RESPONSE_TAG_ADD_USER =@"AddResult";
const NSString* RESPONSE_TAG_CHECK_PASSWORD =@"Check_passwordResult";
const NSString* RESPONSE_GET_USER_ID =@"Get_User_IDResult";
const NSString* RESPONSE_TAG_GET_USER_LEVEL =@"Get_User_LevelResult";

+ (int) get_user_id:(NSString*)idUser
{
    NSString *result = @"";
    NSString *idi = [NSString stringWithFormat:@"/%@",idUser];
    NSString* retour;
    
    result = [result stringByAppendingString:URL_GET_USER_ID ];
    result = [result stringByAppendingString: idi];
    NSLog(@"%@",result);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
	// Do any additional setup after loading the view, typically from a nib.
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    
    retour = [json objectForKey:(RESPONSE_GET_USER_ID)];
    int final = [retour intValue];
    
    return final;
}

+ (BOOL) get_user_level:(NSString*)idUser
{
    NSString *result = @"";
    NSString *idi = [NSString stringWithFormat:@"/%@",idUser];
    NSString* retour;
    
    result = [result stringByAppendingString:URL_GET_USER_LEVEL ];
    result = [result stringByAppendingString: idi];
    NSLog(@"%@",result);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
	// Do any additional setup after loading the view, typically from a nib.
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    
    retour = [json objectForKey:(RESPONSE_TAG_GET_USER_LEVEL)];
    BOOL final = [retour boolValue];
    
    return final;
}

+ (BOOL) check_password:(NSString*)idUser withPass:(NSString*)pwd
{
    NSString *result = @"";
    NSString *idi = [NSString stringWithFormat:@"/%@",idUser];
    NSString *pass = [NSString stringWithFormat:@"/%@",pwd];
    NSString* retour;
    
    result = [result stringByAppendingString:URL_CHECK_PASSWORD ];
    result = [result stringByAppendingString: idi];
    result = [result stringByAppendingString: pass];
    NSLog(@"%@",result);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
	// Do any additional setup after loading the view, typically from a nib.
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    
    retour = [json objectForKey:(RESPONSE_TAG_CHECK_PASSWORD)];
    BOOL final = [retour boolValue];
    
    return final;
}

+ (BOOL) add:(NSString*)idUser withPass:(NSString*)pwd withFName:(NSString*)fname withMail:(NSString*)mail withLName:(NSString*)lname
{
    NSString *result = @"";
    NSString *idi = [NSString stringWithFormat:@"/%@",idUser];
    NSString *pass = [NSString stringWithFormat:@"/%@",pwd];
    NSString *first_name = [NSString stringWithFormat:@"/%@",fname];
    NSString *last_name = [NSString stringWithFormat:@"/%@",lname];
    NSString *email = [NSString stringWithFormat:@"/%@",mail];
    NSString* retour;
    
    result = [result stringByAppendingString:URL_ADD_USER ];
    result = [result stringByAppendingString: first_name];
    result = [result stringByAppendingString: last_name];
    result = [result stringByAppendingString: idi];
    result = [result stringByAppendingString: email];
    result = [result stringByAppendingString: pass];
    NSLog(@"%@",result);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
	// Do any additional setup after loading the view, typically from a nib.
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    
    retour = [json objectForKey:(RESPONSE_TAG_ADD_USER)];
    BOOL final = [retour boolValue];
    
    return final;
    
}

+ (BOOL) delete:(NSString*)idUser
{
    NSString *result = @"";
    NSString *idi = [NSString stringWithFormat:@"/%@",idUser];
    NSString* retour;
    
    result = [result stringByAppendingString:URL_DELETE_USER ];
    result = [result stringByAppendingString: idi];
    NSLog(@"%@",result);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
	// Do any additional setup after loading the view, typically from a nib.
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    
    retour = [json objectForKey:(RESPONSE_TAG_DELETE_USER)];
    BOOL final = [retour boolValue];
    
    return final;
}






@end
