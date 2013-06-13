//
//  Image.h
//  AsapPics
//
//  Created by polytech polytech on 13/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Image : NSObject {
    @private
    long idImage;
    long idAlbum;
    NSString* name;
}


- (id)init: (long) image : (long) album : (NSString *) ImageName;

- (long) getIdImage;

- (long) getIdAlbum;

- (NSString*) getName;

@end
