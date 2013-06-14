//
//  AlbumsDataSource.h
//  AsapPics
//
//  Created by polytech polytech on 13/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTPhotoBrowserDataSource.h"

@interface AlbumsDataSource : NSObject <KTPhotoBrowserDataSource> {
    NSArray *albums;
    int idUser;
}

- (id)init : (int) user;


@end
