//
//  Album.h
//  AsapPics
//
//  Created by polytech polytech on 13/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject {
    @private
    long idAlbum;
    long idImageRandom;
}

-(id) init : (long) album : (long) image;

-(long) getIdAlbum;

-(long) getImageRandom;

@end
