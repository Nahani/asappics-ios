//
//  AlbumsDataSource.m
//  AsapPics
//
//  Created by polytech polytech on 13/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import "AlbumsDataSource.h"
#import "KTPhotoView+SDWebImage.h"
#import "KTThumbView+SDWebImage.h"
#import "WebServiceManager.h"
#import "Album.h"
#import "Utils.h"
#import "User.h"

#define FULL_SIZE_INDEX 0
#define THUMBNAIL_INDEX 1

@implementation AlbumsDataSource
NSString *URL = @"http://asap-pics.com/REST/ImageService.svc/get_thumb";

- (void)dealloc {
    [albums release], albums = nil;
    [super dealloc];
}

- (id)init {
    self = [super init];
    if (self) {
        // Create a 2-dimensional array. First element of
        // the sub-array is the full size image URL and 
        // the second element is the thumbnail URL.
        albums = [[NSArray alloc] initWithObjects:
                  [NSArray arrayWithObjects:@"http://farm5.static.flickr.com/4001/4439826859_19ba9a6cfa_o.jpg", @"http://farm5.static.flickr.com/4001/4439826859_4215c01a16_s.jpg", nil],
                  [NSArray arrayWithObjects:@"http://farm4.static.flickr.com/3427/3192205971_0f494a3da2_o.jpg", @"http://farm4.static.flickr.com/3427/3192205971_b7b18558db_s.jpg", nil],
                  [NSArray arrayWithObjects:@"http://farm2.static.flickr.com/1316/4722532733_6b73d00787_z.jpg", @"http://farm2.static.flickr.com/1316/4722532733_6b73d00787_s.jpg", nil],
                  nil];
    }
    return self;
}

-(id) init:(int)user {
    
    self = [super init];
    if (self) {
        idUser = user;
        albums = [WebServiceManager get_Albums_from_user:idUser];
        
    }
    return self;
    
    
}


#pragma mark -
#pragma mark KTPhotoBrowserDataSource

- (NSInteger)numberOfPhotos {
    NSInteger count = [albums count];
    return count;
}

- (NSInteger) getAlbumIdAtIndex : (NSInteger) index {
    return [(Album *) [albums objectAtIndex:index] getIdAlbum];
}

- (void)imageAtIndex:(NSInteger)index photoView:(KTPhotoView *)photoView {
    NSArray *imageUrls = [albums objectAtIndex:index];
    NSString *url = [imageUrls objectAtIndex:FULL_SIZE_INDEX];
    [photoView setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"photoDefault.png"]];
}

- (void)thumbImageAtIndex:(NSInteger)index thumbView:(KTThumbView *)thumbView {
    Album *album = [albums objectAtIndex:index];
    NSString *url = [Utils construct_URL:URL,[[NSNumber numberWithInt:[album getImageRandom]] stringValue],[[NSNumber numberWithInt:[album getIdAlbum]] stringValue], nil];
    NSLog(@"url thumb album: %@", url);
    [thumbView setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"photoDefault.png"]];
}

- (void)deleteImageAtIndex:(NSInteger)index {
    [WebServiceManager delete_album:[[User sharedInstance] getIdUser] withName:[WebServiceManager get_album_name:[(Album *)[albums objectAtIndex:index] getIdAlbum]]];
    
}

@end
