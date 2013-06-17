//
//  WebServiceManager.h
//  webs
//
//  Created by Polytech Polytech on 26/11/13.
//  Copyright (c) 2013 Polytech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoChooser.h"

@interface WebServiceManager : NSObject

+(NSString*) get_image_name:(int)idUser withAlbum:(int)idAlbum;

+(int) get_image_id:(int)idAlbum withName:(NSString*)name;

+(BOOL) delete_image:(int)idUser withAlbum:(int)idAlbum;

+(UIImage*) get_image:(int)idImage withAlbum:(int)idAlbum;

+(UIImage*) getThumb:(int)idImage withAlbum:(int)idAlbum;

+(NSArray*) get_images_id_from_album:(int)idAlbum;


+(NSString*) get_album_name:(int)idUser;

+(int) get_album_id:(int)idUser withName:(NSString*)name;

+(NSArray*) get_albums_id_from_user:(int)idUser;

+(BOOL) add_album:(int)idUser withName:(NSString*)name;

+(BOOL) delete_album:(int)idUser withName:(NSString*)name;


+(BOOL) get_user_level:(NSString*)name;

+(int) get_user_id:(NSString*)name;

+(BOOL) add_user:(NSString*)login withPass:(NSString*)pass withFName:(NSString*)first_name withMail:(NSString*)mail withLName:(NSString*)last_name;

+(BOOL) delete_user:(NSString*)name;

+(BOOL) check_password:(NSString*)login withPass:(NSString *)pwd;

+(void) add_image:(int)idAlbum name:(NSString*)img_name stream:(NSData*)bytes chooser:(PhotoChooser *)view;

+(NSArray *) get_Images_from_album:(int)idAlbum;

+(NSArray*) get_Albums_from_user:(int) idUser;

+(int) get_image_id_random_from_album:(int) idAlbum;

@end
