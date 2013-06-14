
#import "AlbumService.h"
#import "Utils.h"

@implementation AlbumService

NSString *URL_GET_ALBUM_NAME = @"http://asap-pics.com/REST/AlbumService.svc/get_name_album";
NSString *URL_GET_ALBUM_ID = @"http://asap-pics.com/REST/AlbumService.svc/get_album_id";
NSString *URL_GET_ALBUM_ID_FROM_USER = @"http://asap-pics.com/REST/AlbumService.svc/get_albums_from_user";
NSString *URL_ADD_ALBUM= @"http://asap-pics.com/REST/AlbumService.svc/add";
NSString *URL_GET_DELETE_ALBUM = @"http://asap-pics.com/REST/AlbumService.svc/delete";

const NSString *RESPONSE_TAG_DELETE_ALBUM = @"DeleteResult";
const NSString *RESPONSE_TAG_ADD_ALBUM = @"AddResult";
const NSString *RESPONSE_TAG_GET_ALBUM_ID = @"Get_Album_IDResult";
const NSString *RESPONSE_TAG_GET_ALBUM_NAME = @"Get_Name_AlbumResult";
const NSString *RESPONSE_TAG_GET_ALBUMS_ID_FROM_USER = @"Get_AlbumsID_From_UserResult";

+ (NSString *) get_album_name:(int)idImage
{
    NSString *result = @"";
    NSString *idi = [NSString stringWithFormat:@"%d",idImage];
    
    result = [Utils construct_URL:URL_GET_ALBUM_NAME,idi,nil];
    NSLog(@"%@",result);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
	// Do any additional setup after loading the view, typically from a nib.
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    NSLog(@"reponse : %@",[json objectForKey:(RESPONSE_TAG_GET_ALBUM_NAME)]);
    return [json objectForKey:(RESPONSE_TAG_GET_ALBUM_NAME)];
}

+ (int) get_album_id:(int)idImage withName:(NSString *)name
{
    NSString *result = @"";
    NSString *idi = [NSString stringWithFormat:@"%d",idImage];
    NSString *retour;
    
    result = [Utils construct_URL:URL_GET_ALBUM_ID,name,idi,nil];
    NSLog(@"%@",result);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
	// Do any additional setup after loading the view, typically from a nib.
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    
    retour = [json objectForKey:(RESPONSE_TAG_GET_ALBUM_ID)];
    int final = [retour intValue];
    NSLog(@"reponse : %d",final);
    return final;
}

+(BOOL) add:(NSString*)name withIdProp:(int)idProp
{
    
    NSString *result = @"";
    NSString *idi = [NSString stringWithFormat:@"%d",idProp];
    
    result = [Utils construct_URL:URL_ADD_ALBUM,name,idi,nil];
    
    NSLog(@"%@",result);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
	// Do any additional setup after loading the view, typically from a nib.
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    result = [json objectForKey:(RESPONSE_TAG_ADD_ALBUM)];
    BOOL retour = [result boolValue];
    NSLog(@"reponse : %d",retour);
    return retour;
    
}

+(BOOL) delete:(NSString*)name withIdProp:(int)idProp
{
    
    NSString *result = @"";
    NSString *idi = [NSString stringWithFormat:@"%d",idProp];
    
    result = [result stringByAppendingString:URL_GET_DELETE_ALBUM ];
    result = [result stringByAppendingString: name];
    result = [result stringByAppendingString: idi];
    result = [Utils construct_URL:URL_GET_DELETE_ALBUM,name,idi,nil];
    NSLog(@"%@",result);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
	// Do any additional setup after loading the view, typically from a nib.
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    
    BOOL retour = [json objectForKey:(RESPONSE_TAG_DELETE_ALBUM)];
    NSLog(@"reponse : %d",retour);
    return retour;
    
}

+(NSArray*) get_albums_id_from_user:(int)idProp
{
    NSString *result = @"";
    NSString *idi = [NSString stringWithFormat:@"%d",idProp];
    
    result = [Utils construct_URL:URL_GET_ALBUM_ID_FROM_USER,idi,nil];
    
    NSLog(@"%@",result);
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:result]];
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    NSArray* retour = [json objectForKey:(RESPONSE_TAG_GET_ALBUMS_ID_FROM_USER)];
    NSLog(@"reponse : %@",retour);
    return retour;
    
}

@end
