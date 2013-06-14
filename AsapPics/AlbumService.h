
#import <Foundation/Foundation.h>

@interface AlbumService : NSObject

+ (NSString *) get_album_name:(int)idImage;

+ (int) get_album_id:(int)idImage withName:(NSString *)name;

+(BOOL) add:(NSString*)name withIdProp:(int)idProp;

+(BOOL) delete:(NSString*)name withIdProp:(int)idProp;

+(NSArray*) get_albums_id_from_user:(int)idProp;

@end
