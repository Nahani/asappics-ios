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
#import "Utils.h"


@implementation ImageService
PhotoChooser *photoChooser;
BOOL addImageResponse;
NSMutableData *responseData;
NSString *URL_GET_IMAGE_NAME = @"http://asap-pics.com/REST/ImageService.svc/get_image_name";
NSString *URL_GET_IMAGE_ID = @"http://asap-pics.com/REST/ImageService.svc/get_image_id";
NSString *URL_DELETE = @"http://asap-pics.com/REST/ImageService.svc/delete";
NSString *URL_ADD = @"http://asap-pics.com/REST/ImageService.svc/add";
NSString *URL_GET = @"http://asap-pics.com/REST/ImageService.svc/get";
NSString *URL_GET_THUMB = @"http://asap-pics.com/REST/ImageService.svc/get_thumb";
NSString *URL_GET_IMAGES_ID_FROM_ALBUM = @"http://asap-pics.com/REST/ImageService.svc/get_images_id_from_album";

const NSString *RESPONSE_TAG_GET_IMAGE_NAME = @"Get_Image_NameResult";
const NSString *RESPONSE_TAG_GET_IMAGE_ID = @"Get_Image_IDResult";
const NSString *RESPONSE_TAG_DELETE = @"DeleteResult";
const NSString *RESPONSE_TAG_GET_IMAGES_ID_FROM_ALBUM = @"Get_Images_ID_From_AlbumResult";
const NSString *RESPONSE_TAG_ADD = @"AddResult";

+ (NSString *) get_image_name:(int)idImage id_album:(int)idAlbum
{
    NSString *result = @"";
    NSString *ida = [NSString stringWithFormat:@"%d",idAlbum];
    NSString *idi = [NSString stringWithFormat:@"%d",idImage];
    
    result = [Utils construct_URL:URL_GET_IMAGE_NAME,idi,ida,nil];
    
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
    NSString *ida = [NSString stringWithFormat:@"%d",idAlbum];
    
    result = [Utils construct_URL:URL_GET_IMAGE_ID,ida,name,nil];
    
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
    NSString *ida = [NSString stringWithFormat:@"%d",idAlbum];
    NSString *idi = [NSString stringWithFormat:@"%d",idImage];
    
    result = [Utils construct_URL:URL_DELETE,idi,ida,nil];
    
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
    NSString *ida = [NSString stringWithFormat:@"%d",idAlbum];
    NSString *idi = [NSString stringWithFormat:@"%d",idImage];
    
    result = [Utils construct_URL:URL_GET,idi,ida,nil];
    
    NSData* imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:result]];
    UIImage* image = [[UIImage alloc] initWithData:imageData];
    return image;
    
    
}

+(UIImage*) getThumb:(int)idImage withAlbum:(int)idAlbum
{
    NSString *result = @"";
    NSString *ida = [NSString stringWithFormat:@"%d",idAlbum];
    NSString *idi = [NSString stringWithFormat:@"%d",idImage];
    
    result = [Utils construct_URL:URL_GET_THUMB,idi,ida,nil];
    
    NSData* imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:result]];
    UIImage* image = [[UIImage alloc] initWithData:imageData];
    return image;
    
    
}

+(void) add:(int)idAlbum name:(NSString*)img_name stream:(NSData*)bytes chooser:(PhotoChooser *)view
{
    photoChooser = view;
    NSString *result = @"";
    NSString *ida = [NSString stringWithFormat:@"%d",idAlbum];
    NSString *na = [NSString stringWithFormat:@"%@",img_name];    
    
    result = [Utils construct_URL:URL_ADD,ida,na,nil];
    
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



+(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    responseData = [NSMutableData data];
}

+ (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    addImageResponse = [[json objectForKey:(RESPONSE_TAG_ADD)] boolValue];

}

+ (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [photoChooser uploadPhotoDidFinished:addImageResponse];
}


+(NSArray*) get_images_id_from_album:(int)idAlbum
{
    NSString *result = @"";
    NSString *idi = [NSString stringWithFormat:@"/%d",idAlbum];
    
    result = [result stringByAppendingString:URL_GET_IMAGES_ID_FROM_ALBUM ];
    result = [result stringByAppendingString: idi];
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    NSArray* retour = [json objectForKey:(RESPONSE_TAG_GET_IMAGES_ID_FROM_ALBUM)];
    return retour;
    
}



@end
