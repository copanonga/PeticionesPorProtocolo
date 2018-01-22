//
//  Protocolos.h
//  Buses Gijón
//
//  Created by PROIMA on 3/1/18.
//  Copyright © 2018 Copanonga. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Protocolos <NSObject>

@optional
-(void)getDatosPeticion: (NSString *) texto;

@optional
-(void)getInfoBuses: (NSMutableArray *) listadoLineasProtocolo;

@optional
-(void)showError: (NSString *) texto;

@end
