#import "User.h"

@implementation User

static User *sharedInstance = nil;
@synthesize idUser;
@synthesize login;

+ (User *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    return sharedInstance;
}

- (long) getIdUser {
    return idUser;
}

- (NSString*) getLogin {
    return login;
}

- (void) setIdUser:(long)newid {
    idUser = newid; 
}

- (void) setLogin:(NSString*)newlogin {
    login = newlogin; 
}

- (id)init
{
    self = [super init];
    
    if (self) {
        idUser = 0;
        login = @"_notImplemented";
    }
    
    return self;
}

+ (id)allocWithZone:(NSZone*)zone {
    return [[self sharedInstance] retain];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;
}

- (oneway void)release {
    
}

- (id)autorelease {
    return self;
}

@end