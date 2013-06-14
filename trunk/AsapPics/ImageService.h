

#import <Foundation/Foundation.h>

@interface ImageService : NSObject

+(NSString *) get_image_name:(int)idImage id_album:(int)idAlbum;

+(int) get_image_id:(int)idAlbum withName:(NSString *)name;

+(BOOL) delete:(int)idImage withAlbum:(int)idAlbum;

+(UIImage*) get:(int)idImage withAlbum:(int)idAlbum;

+(UIImage*) getThumb:(int)idImage withAlbum:(int)idAlbum;

+(void) add:(int)idAlbum name:(NSString*)img_name stream:(NSData*)bytes;

+(NSData *)makeMultipartDataWithBoundary:(NSString *) boundary 
                              parameters:(NSDictionary *)parameters
                                formName:(NSString *)formName 
                                fileName:(NSString *)fileName 
                                fileType:(NSString *)fileType
                                fileData:(NSData*)fileData;

@end
