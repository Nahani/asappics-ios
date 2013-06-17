

#import <Foundation/Foundation.h>
#import "PhotoChooser.h"

@interface ImageService : NSObject

+(NSString *) get_image_name:(int)idImage id_album:(int)idAlbum;

+(int) get_image_id:(int)idAlbum withName:(NSString *)name;

+(BOOL) delete:(int)idImage withAlbum:(int)idAlbum;

+(UIImage*) get:(int)idImage withAlbum:(int)idAlbum;

+(UIImage*) getThumb:(int)idImage withAlbum:(int)idAlbum;

+(NSArray*) get_images_id_from_album:(int)idAlbum;

+(void) add:(int)idAlbum name:(NSString*)img_name stream:(NSData*)bytes chooser:(PhotoChooser *)view;

+(NSData *)makeMultipartDataWithBoundary:(NSString *) boundary 
                              parameters:(NSDictionary *)parameters
                                formName:(NSString *)formName 
                                fileName:(NSString *)fileName 
                                fileType:(NSString *)fileType
                                fileData:(NSData*)fileData;

@end
