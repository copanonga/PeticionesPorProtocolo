//
//  Peticiones.m
//  Buses Gijón
//
//  Created by PROIMA on 3/1/18.
//  Copyright © 2018 Copanonga. All rights reserved.
//

#import "Peticiones.h"
#import "URLs.h"
#import <AFNetworking.h>
#import "Linea.h"

@implementation Peticiones

- (void)getDatos {

	[self.delegate getDatosPeticion:@"El veloz murciélago hindú mediante protocolo"];
	
}

-(void)getInfo {
	
	NSString *URL = URL_INFO;
	
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	manager.requestSerializer=[AFHTTPRequestSerializer serializer];
	manager.responseSerializer= [AFHTTPResponseSerializer serializer];
	[manager GET:URL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
		
		NSDictionary* json = [NSJSONSerialization
							  JSONObjectWithData:responseObject
							  options:kNilOptions
							  error:nil];
		
		NSMutableArray *listadoLineas = [[NSMutableArray alloc] init];
		
		NSDictionary *lineasTotal = [json objectForKey:@"lineas"];
		NSArray *lineas = [lineasTotal objectForKey:@"linea"];
		[lineas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
			
			Linea *lineaObtenida = [[Linea alloc]init];
			[lineaObtenida setLinea:obj];
			[listadoLineas addObject:lineaObtenida];
			
		}];
		
		[self.delegate getInfoBuses:listadoLineas];
		
	} failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
		[self.delegate showError:@"Los datos ofrecidos por el Ayuntamiento de Gijón no están disponibles temporalmente."];
	}];
	
}

@end
