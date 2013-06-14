//
//  WebServiceManager.m
//  webs
//
//  Created by Polytech Polytech on 26/11/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import "WebServiceManager.h"
#import "ImageService.h"
#import "AlbumService.h"
#import "UserService.h"
#import "Image.h"
#import "Album.h"
#import "Utils.h"


@implementation WebServiceManager

+(NSString*) get_image_name:(int)idUser withAlbum:(int)idAlbum
{
    return [ImageService get_image_name:idUser id_album:idAlbum];
}

+(int) get_image_id:(int)idAlbum withName:(NSString*)name
{
    return [ImageService get_image_id:idAlbum withName:name];
}

+(BOOL) delete_image:(int)idUser withAlbum:(int)idAlbum
{
    return [ImageService delete:idUser withAlbum:idAlbum];
}

+(NSString*) get_album_name:(int)idUser 
{
    return [AlbumService get_album_name:idUser];
}

+(int) get_album_id:(int)idUser withName:(NSString*)name
{
    return [AlbumService get_album_id:idUser withName:name];
}

+(NSArray*) get_albums_id_from_user:(int)idUser 
{
    return [AlbumService get_albums_id_from_user:idUser];
}
            
+(BOOL) add_album:(int)idUser withName:(NSString*)name
{
    return [AlbumService add:name withIdProp:idUser];
}


+(BOOL) delete_album:(int)idUser withName:(NSString*)name
{
    return [AlbumService delete:name withIdProp:idUser];
}

+(BOOL) get_user_level:(NSString*)name
{
    return [UserService get_user_level:name];
}

+(int) get_user_id:(NSString*)name
{
    return [UserService get_user_id:name];
}

+(BOOL) add_user:(NSString*)login withPass:(NSString*)pass withFName:(NSString*)first_name withMail:(NSString*)mail withLName:(NSString*)last_name
{
    return [UserService add:login withPass:pass withFName:first_name withMail:mail withLName:last_name];
}

+(BOOL) delete_user:(NSString*)name
{
    return [UserService delete:name];
}

+(BOOL) check_password:(NSString*)login withPass:(NSString *)pwd
{
    return [UserService check_password:login withPass:pwd ];
}


+(UIImage*) get_image:(int)idImage withAlbum:(int)idAlbum
{
    
    return [ImageService get:idImage withAlbum:idAlbum];
}

+(UIImage*) getThumb:(int)idImage withAlbum:(int)idAlbum;
{
    
    return [ImageService getThumb:idImage withAlbum:idAlbum];
}

//   imageview to ns data (target etant l'UIImageview)  NSData* img = UIImagePNGRepresentation ([target image]);
+(void) add_image:(int)idAlbum name:(NSString*)img_name stream:(NSData*)bytes
{
    [ImageService add:idAlbum name:img_name stream:bytes];
}

+(NSArray*) get_images_id_from_album:(int)idAlbum 
{
    return [ImageService get_images_id_from_album:idAlbum];
}

+(NSArray *) get_Images_from_album:(int)idAlbum {
    
    NSArray *imagesId = [self get_images_id_from_album:idAlbum];
    NSMutableArray *images = [[NSMutableArray alloc] init];
    
    for(NSString *idImage in imagesId){
        [images addObject:[[Image alloc] init:(long)[idImage intValue] : idAlbum :[self get_image_name:(long)[idImage intValue] withAlbum:idAlbum]]];
    }
    
    return images;
    
}

+(NSArray*) get_Albums_from_user:(int) idUser {
    NSArray *albumsId = [self get_albums_id_from_user:idUser];
    NSMutableArray *albums = [[NSMutableArray alloc] init];
    
    for(NSString *idAlbum in albumsId)
        [albums addObject:[[Album alloc] init:(long)[idAlbum intValue] :[self get_image_id_random_from_album:[idAlbum intValue]]]];
    
    return albums;
}

+(int) get_image_id_random_from_album:(int) idAlbum {
     NSArray *imagesId = [self get_images_id_from_album:idAlbum];
    if([imagesId count] == 0) return 0;
    return [[imagesId objectAtIndex:[Utils compute_random_number:[imagesId count]]] intValue];
}
                        


@end
