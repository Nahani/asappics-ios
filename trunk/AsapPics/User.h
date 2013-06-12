// Comment utiliser la classe singleton
//
// User* sharedSingleton = [User sharedInstance];
// [sharedSingleton callAMethod];

#import <Foundation/Foundation.h>

@interface User : NSObject


@property (nonatomic) long idUser;
@property (nonatomic) NSString* login;

+ (User*)sharedInstance;

- (long) getIdUser;

- (NSString*) getLogin;

- (void) setIdUser:(long)newid;

- (void) setLogin:(NSString*)newlogin;

@end
