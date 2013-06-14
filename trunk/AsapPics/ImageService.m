//
//  ImageService.m
//  WebServices
//
//  Created by Polytech Polytech on 25/11/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#define WEBSITE_LOCATION = asap-pics/REST/
#define SERVICE_NAME = ImageService.svc/

#import "ImageService.h"

@implementation ImageService

NSString *URL_GET_IMAGE_NAME = @"http://asap-pics.com/REST/ImageService.svc/get_image_name";
NSString *URL_GET_IMAGE_ID = @"http://asap-pics.com/REST/ImageService.svc/get_image_id";
NSString *URL_DELETE = @"http://asap-pics.com/REST/ImageService.svc/delete";
NSString *URL_ADD = @"http://asap-pics.com/REST/ImageService.svc/add";
NSString *URL_GET = @"http://asap-pics.com/REST/ImageService.svc/get";
NSString *URL_GET_THUMB = @"http://asap-pics.com/REST/ImageService.svc/get_thumb";
NSString *URL_GET_IMAGE_ID_FROM_ALBUM = @"http://asap-pics.com/REST/ImageService.svc/get_image_id_from_album";

const NSString *RESPONSE_TAG_GET_IMAGE_NAME = @"Get_Image_NameResult";
const NSString *RESPONSE_TAG_GET_IMAGE_ID = @"Get_Image_IDResult";
const NSString *RESPONSE_TAG_DELETE = @"DeleteResult";
const NSString *RESPONSE_TAG_GET_IMAGE_ID_FROM_ALBUM = @"Get_Image_ID_From_AlbumResult";

+ (NSString *) get_image_name:(int)idImage id_album:(int)idAlbum
{
    NSString *result = @"";
    NSString *ida = [NSString stringWithFormat:@"/%d",idAlbum];
    NSString *idi = [NSString stringWithFormat:@"/%d",idImage];
    
    result = [result stringByAppendingString:URL_GET_IMAGE_NAME ];
    result = [result stringByAppendingString: idi];
    result = [result stringByAppendingString: ida];
    NSLog(@"%@",result);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
	// Do any additional setup after loading the view, typically from a nib.
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    
    return [json objectForKey:(RESPONSE_TAG_GET_IMAGE_NAME)];
}

+(int) get_image_id:(int)idAlbum withName:(NSString *)name
{
    NSString *result = @"";
    NSString *retour = @"";
    NSString *ida = [NSString stringWithFormat:@"/%d/",idAlbum];
    
    result = [result stringByAppendingString:URL_GET_IMAGE_ID ];
    result = [result stringByAppendingString: ida];
    result = [result stringByAppendingString: name];
    NSLog(@"%@",result);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
	// Do any additional setup after loading the view, typically from a nib.
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    retour = [json objectForKey:(RESPONSE_TAG_GET_IMAGE_ID)];
    int final = [retour intValue];
    
    return final;
}

+(BOOL) delete:(int)idImage withAlbum:(int)idAlbum
{
    NSString *result = @"";
    NSString *ida = [NSString stringWithFormat:@"/%d",idAlbum];
    NSString *idi = [NSString stringWithFormat:@"/%d",idImage];
    
    result = [result stringByAppendingString:URL_DELETE ];
    result = [result stringByAppendingString: idi];
    result = [result stringByAppendingString: ida];
    NSLog(@"%@",result);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
	// Do any additional setup after loading the view, typically from a nib.
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    BOOL response = [[json objectForKey:(RESPONSE_TAG_DELETE)] boolValue];
    return response;
}

+(UIImage*) get:(int)idImage withAlbum:(int)idAlbum
{
    NSString *result = @"";
    NSString *ida = [NSString stringWithFormat:@"/%d",idAlbum];
    NSString *idi = [NSString stringWithFormat:@"/%d",idImage];
    
    
    result = [result stringByAppendingString:URL_GET ];
    result = [result stringByAppendingString: idi];
    result = [result stringByAppendingString: ida];
    NSLog(@"%@",result);
    
    NSData* imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:result]];
    UIImage* image = [[UIImage alloc] initWithData:imageData];
    return image;
    
    
}

+(UIImage*) getThumb:(int)idImage withAlbum:(int)idAlbum
{
    NSString *result = @"";
    NSString *ida = [NSString stringWithFormat:@"/%d",idAlbum];
    NSString *idi = [NSString stringWithFormat:@"/%d",idImage];
    
    
    result = [result stringByAppendingString:URL_GET_THUMB ];
    result = [result stringByAppendingString: idi];
    result = [result stringByAppendingString: ida];
    NSLog(@"%@",result);
    
    NSData* imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:result]];
    UIImage* image = [[UIImage alloc] initWithData:imageData];
    return image;
    
    
}

+(void) add:(int)idAlbum name:(NSString*)img_name stream:(NSData*)bytes
{
    NSString *result = @"";
    NSString *ida = [NSString stringWithFormat:@"/%d",idAlbum];
    NSString *na = [NSString stringWithFormat:@"/%@",img_name];    
    
    result = [result stringByAppendingString:URL_ADD ];
    result = [result stringByAppendingString: ida];
    result = [result stringByAppendingString: na];
    
    NSLog(@"%@",result);

    NSMutableURLRequest *yourRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:result] 
        cachePolicy:NSURLRequestUseProtocolCachePolicy 
        timeoutInterval:60.0];

    [yourRequest setHTTPMethod:@"POST"];
    
    [yourRequest setValue:@"image/jpg" forHTTPHeaderField:@"Content-Type"];
    
    [yourRequest setHTTPBody:bytes];
    
    [[NSURLConnection alloc] initWithRequest:yourRequest 
        delegate:self
    startImmediately:YES];
}



@end
